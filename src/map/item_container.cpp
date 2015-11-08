/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#include "../common/malloc.h"
#include "../common/showmsg.h"

#include <string.h>

#include "item_container.h"
#include "utils/itemutils.h"
#include "utils/charutils.h"
#include "entities/charentity.h"
#include "packets/inventory_item.h"
#include "packets/inventory_assign.h"
#include "packets/inventory_finish.h"
#include "packets/inventory_modify.h"

CItemContainer::CItemContainer(uint16 LocationID)
{
	m_id = LocationID;

    SortingPacket   = 0;
    LastSortingTime = 0;

    m_buff  = 0;
	m_size  = 0;
    m_count = 0;

	memset(m_ItemList, 0, sizeof(m_ItemList));
}

CItemContainer::~CItemContainer()
{
	for (uint8 SlotID = 0; SlotID <= m_size; ++SlotID)
	{
        delete m_ItemList[SlotID];
	}
}

uint16 CItemContainer::GetID()
{
	return m_id;
}

uint8 CItemContainer::GetSize()
{
	return m_size;
}

uint8 CItemContainer::GetFreeSlotsCount()
{
    return m_size - m_count;
}

/************************************************************************
*                                                                       *
*  Установка размера контейнера                                         *
*                                                                       *
************************************************************************/

uint16 CItemContainer::GetBuff()
{
    return m_buff;
}

uint8 CItemContainer::AddBuff(int8 buff)
{
    m_buff += buff;
    return SetSize(dsp_min(m_buff, 240)); // ограничение в 80 ячеек для персонажа
}

/************************************************************************
*                                                                       *
*  Установка размера контейнера                                         *
*                                                                       *
************************************************************************/

// контейнер не несет ответственности за то, что предметы могут остаться за пределами размера

uint8 CItemContainer::SetSize(uint8 size) 
{
	if (size <= MAX_CONTAINER_SIZE) 
	{
		if (size >= m_count)
		{
			m_size = size;
			return m_size;
		}
	}
	ShowDebug(CL_CYAN"ItemContainer <%u>: Bad new container size %u\n" CL_RESET, m_id, size);
	return -1;
}

/************************************************************************
*                                                                       *
*  Увеличиваем/уменьшаем размер контейнера                              *
*                                                                       *
************************************************************************/

// контейнер не несет ответственности за то, что предметы могут остаться за пределами размера

uint8 CItemContainer::AddSize(int8 size)
{
    uint8 newsize = m_size + size;

    if (newsize <= MAX_CONTAINER_SIZE) 
	{
		if (newsize >= m_count)
		{
			m_size = newsize;
			return m_size;
		}
	}
	ShowDebug(CL_CYAN"ItemContainer <%u>: Bad new container size %u\n" CL_RESET, m_id, newsize);
	return -1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

uint8 CItemContainer::InsertItem(CItem* PItem)
{
	DSP_DEBUG_BREAK_IF(PItem == nullptr);

	for (uint8 SlotID = 1; SlotID <= m_size; ++SlotID) 
	{
		if (m_ItemList[SlotID] == nullptr) 
		{
            m_count++;

			PItem->setSlotID(SlotID);
			PItem->setLocationID(m_id);

			m_ItemList[SlotID] = PItem;
			return SlotID;
		}
	}
	ShowDebug("ItemContainer: Container is full\n");

	//delete PItem;//todo: what if the item is a valid item??
	return ERROR_SLOTID;
}

/************************************************************************
*																		*
*  Добавляем предмет в указанную ячейку. nullptr удаляет предмет			*
*																		*
************************************************************************/

uint8 CItemContainer::InsertItem(CItem* PItem, uint8 SlotID)
{
	if (SlotID <= m_size)
	{
		if (PItem != nullptr)
		{
			PItem->setSlotID(SlotID);
			PItem->setLocationID(m_id);

            if (m_ItemList[SlotID] == nullptr && SlotID != 0) m_count++;
		}
        else if(m_ItemList[SlotID] != nullptr && SlotID != 0) m_count--;
        
		m_ItemList[SlotID] = PItem;
		return SlotID;
	}
	ShowDebug("ItemContainer: SlotID %i is out of range\n", SlotID);

	delete PItem;
	return ERROR_SLOTID;
}

void CItemContainer::SwapPages( CCharEntity *PChar, uint8 page )
{
   const int8* Query =
      "INSERT INTO char_inventory("
      "charid,"
      "location,"
      "slot,"
      "itemId,"
      "quantity,"
      "signature,"
      "extra) "
      "VALUES(%u,%u,%u,%u,%u,'%s','%s')"
      "ON DUPLICATE KEY UPDATE slot = %u";

   const int8* DQuery = "DELETE FROM char_inventory WHERE location = %u AND slot = %u and charid=%u";

   int requip[16];
   CItem *ph, *ph_two;
   uint8 swapInc;

   memset( &requip[0], 0, sizeof( requip ) );
   swapInc = 80 * page;

   for( int y = 0; y < 16; y++ )
   {
      if( PChar->equipLoc[y] != m_id )
         continue;
      if( PChar->equip[y] > 0 && PChar->equip[y] < 81 )
      {
         requip[y] = PChar->equip[y] + swapInc;
         charutils::UnequipItem( PChar, y, true );
      }
      else if( PChar->equip[y] > swapInc && PChar->equip[y] < swapInc + 81 )
      {
         requip[y] = PChar->equip[y] - swapInc;
         charutils::UnequipItem( PChar, y, true );
      }
   }

   for( int x = 1; x < 81; x++ )
   {
      ph = m_ItemList[x];
      ph_two = m_ItemList[x+swapInc];

      InsertItem( ph_two, x );
      InsertItem( ph, x+swapInc );

      PChar->pushPacket( new CInventoryItemPacket( m_ItemList[x], m_id, x ) );
      PChar->pushPacket( new CInventoryItemPacket( m_ItemList[x+swapInc], m_id, x+swapInc ) );
   }

   for( int x = 1; x < 81; x++ )
   {
      if( m_ItemList[x] == nullptr )
      {
         Sql_Query( SqlHandle, DQuery, m_id, x, PChar->id );
         continue;
      }

      int8 extra[sizeof(m_ItemList[x]->m_extra) * 2 + 1];
      Sql_EscapeStringLen(SqlHandle, extra, (const int8*)m_ItemList[x]->m_extra, sizeof(m_ItemList[x]->m_extra));

      int8 signature[21];
      if (m_ItemList[x]->isType(ITEM_LINKSHELL))
         DecodeStringLinkshell((int8*)m_ItemList[x]->getSignature(), signature);
      else
         DecodeStringSignature((int8*)m_ItemList[x]->getSignature(), signature);

      Sql_Query( SqlHandle, Query, PChar->id, m_id, x, m_ItemList[x]->getID(), m_ItemList[x]->getQuantity(), signature, extra, x );
   }

   for( int x = swapInc; x < swapInc+81; x++ )
   {
      if( m_ItemList[x] == nullptr )
      {
         Sql_Query( SqlHandle, DQuery, m_id, x, PChar->id );
         continue;
      }

      int8 extra[sizeof(m_ItemList[x]->m_extra) * 2 + 1];
      Sql_EscapeStringLen(SqlHandle, extra, (const int8*)m_ItemList[x]->m_extra, sizeof(m_ItemList[x]->m_extra));

      int8 signature[21];
      if (m_ItemList[x]->isType(ITEM_LINKSHELL))
         DecodeStringLinkshell((int8*)m_ItemList[x]->getSignature(), signature);
      else
         DecodeStringSignature((int8*)m_ItemList[x]->getSignature(), signature);

      Sql_Query( SqlHandle, Query, PChar->id, m_id, x, m_ItemList[x]->getID(), m_ItemList[x]->getQuantity(), signature, extra, x );
   }

   for( int y = 0; y < 16; y++ )
      if( requip[y] != 0 )
         charutils::EquipItem( PChar, requip[y], y, m_id );
   charutils::SaveCharEquip(PChar);
   PChar->pushPacket( new CInventoryFinishPacket() );
   return;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CItem* CItemContainer::GetItem(uint8 SlotID)
{
	if (SlotID <= m_size)
	{
		return m_ItemList[SlotID];
	}
	return nullptr;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

uint8 CItemContainer::SearchItem(uint16 ItemID)
{
	for (uint8 SlotID = 0; SlotID <= m_size; ++SlotID) 
	{
		if ((m_ItemList[SlotID] != nullptr) && 
			(m_ItemList[SlotID]->getID() == ItemID)) 
		{
			return SlotID;
		}
	}
	return ERROR_SLOTID;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

uint8 CItemContainer::SearchItemWithSpace(uint16 ItemID, uint32 quantity)
{
	for (uint8 SlotID = 0; SlotID <= m_size; ++SlotID) 
	{
		if ((m_ItemList[SlotID] != nullptr) && 
			(m_ItemList[SlotID]->getID() == ItemID) &&
            (m_ItemList[SlotID]->getQuantity() <= m_ItemList[SlotID]->getStackSize()-quantity)) 
		{
			return SlotID;
		}
	}
	return ERROR_SLOTID;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CItemContainer::Clear()
{
	for (uint8 SlotID = 0; SlotID <= m_size; ++SlotID)
	{
		delete m_ItemList[SlotID];
		m_ItemList[SlotID] = nullptr;
	}
}
