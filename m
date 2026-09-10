Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65788C88E42
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 20:29:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415361.1644821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lOz-0000rN-D1; Thu, 10 Sep 2026 20:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415361.1644821; Thu, 10 Sep 2026 20:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lOz-0000rC-A9; Thu, 10 Sep 2026 20:29:45 +0000
Received: by outflank-mailman (input) for mailman id 1415361;
 Thu, 10 Sep 2026 20:29:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1x4lOx-0000oo-C5
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:29:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4lOw-001ixY-P6
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 22:29:42 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa31318-e002-0a2a0a5209dd-0a2a45048eee-38
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:29:42 +0200
Received: from [52.101.43.50]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa31334-b57f-0a2a45040019-34652b32efb2-4
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:29:42 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by LV5PR03MB8433.namprd03.prod.outlook.com (2603:10b6:408:361::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 20:29:38 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 20:29:36 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aavSg4qCAsn/Ui1ldOXOnXYYDh71ZvX+iKZfqag7gmJZb2QacM5K9OC7+ztFUxAFLAbC1kmupmHRtND1X4zO86rVG6Z/w6GBjxwzFxRh6Xy65Fa4CRMfHjn6eYGB2hiLOYjB03PkLOUMKtJeCdBEfovJ3U5BPsHC8rD4QDab+uLrhJaXTz9gSxVuftkYypVd/CgqxQUGNsJJvPETn/OZaEL34hLbjVTAnbDByBf6cTuuRDYXbNUBbkRARYFytGz110VwsSNrd/Imte2+JtmmCNoP9z5u+KRZW3tkUneGGG8Q+gF3NuSB7Dao8ylL+2HzgxQyV1A2ricKoRjsziJAag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tOYekDsGmb2RFUH4obI70pViMHgOTrmNkYgsBIQIZY=;
 b=KJ+QfPpLEVE0KmIMJFBFngOOOYTicXoxGWyNcPxjf80imZBe9ahFacliJT5V3+Xz7y7psHWXKlIpHFm+JRwZYFKIxPyswdtPtznXZ+S2lKbzTNHN9b9msJwu1MdQT6wjofiO/RX3hLjkpU16jhnJ4asnpiMxlj1g/XCb4Bn5oL1cGCNOooZ+5WDb0Yd0gheler0gjsNIQeFcPsaGhwv+DF2TE2Y7/3ZEnuAzz5YsI8J+W79kxQvd3INRNzkOUd+VBrYCCkCncE2bxSrLer+pil6FmqKl/v6ICNlVeTgWs0RsB3bmYQ304+UTJysGDQb2FhNusKzdkN14V5kNIOb6Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tOYekDsGmb2RFUH4obI70pViMHgOTrmNkYgsBIQIZY=;
 b=0DiYdQfZKkECOxUjPrOQPLK3T7eC/ka2oZZDHCk0yOyDVAx8OZH6YJtzcvhEp/I6N5LJ3XMb57WsY+6RlpXvxMB16wn1r0tHteSZc2n4+JWGAizBWRYmSLx5B95nRYUwX96nIE4mFQopG52YEJTF2vtmmQOKUn5vzRzjLrZ3PEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v2 3/7] x86: extend update_intpte() to support atomic get-and-update
Date: Thu, 10 Sep 2026 21:31:09 +0100
Message-ID: <20260910203113.462943-4-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260910203113.462943-1-kevin.lampis@citrix.com>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0087.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::20) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|LV5PR03MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f496614-f066-4b6f-d123-08df0f7a3b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iTS59yWX85vqvXs4cCCZqrTcjReZw/JTccywAJpqIaoQ7dLuHSuI6nV4/QPcWofOCxk1ZX5Yh0tyuNwW6SvvSeqXiMonxZMc4TMnNMKthY250OCxHRGfrI454JCa4cR72a0SnbFBG3u5diRVjDbDrGI4oBivpc3MUaYDDRpnT0prqJO5IF+QCCwlWWN8OJwNee4kY6mmez1Hblitilj7FSeCpxTDMLyvx+lxe+zqyKhr4IneXL6a5FBzGjvRrhW3FeVx0apevmJ3fIKwZVWoRXUCKO2osnCG1eLh4OBgxREuJi056Ud3tStxmT2Xz17zwinJCZIFPUpDBTmSMj7sQRUDrEM73tEwRViHVtQcu33Jj8xdo64B5XxboOCyAZNB1DTfrWN+8FsV8AsJnbrvQmKFjfvXZbUm1GGfnkg+Zr6bM26UbTtBbM2nkkKYHmdfDT/y3EDTq2BtDCEvaunbuk5jR0GBOEsSu5B3WAW1ODHrHlTHI7ToLL7C54HMs3mSXfJuvJjz8o+vEg27S/L4SiexMptH2RgQXYRn6CZWxRQaLK8w8knvyk+rXABG7yEbvphRN4frX1zyBZG/SSKGNpqE85LDjVBUbiL9L5h+AMpxl0kL5BQbCiwSzAL6csalNivAv0hs3m7ASV+ZogDbFX0QgrlrbS1OEBfLwYuTw4E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L6k3r6XWuZm26AQYoKiQdAuA06oZhsBFpljYsNtwA4ntJk5i2jsSmYad7Lpn?=
 =?us-ascii?Q?HwcjkhISm3TsKBitWyrS6zRuSc4yudthlATP2pSXS/VxaQ2v9lRXKYxnCp/E?=
 =?us-ascii?Q?42Szw6IBD6rg1E/vvkUqAp7r7K/kRZ6qBRJZMelk1XJH6XmJdTMpRCMLCAWO?=
 =?us-ascii?Q?6dTBc0dUHLmezc/EJ8ws00EfFyXTB/kytS/ZcxdN1KOENtY+NwFPq/49P8DE?=
 =?us-ascii?Q?w9jC9Sfq9p7H0+7fq3ge4tGqZ/qNAww1zERpxRVviRUi+/VZK13h63ftMUyh?=
 =?us-ascii?Q?SVFtyd5jwmiwRZWWXKOManN1KKJbI+pmN0RmIsGsQv+575a+BDdS6MTn1m6i?=
 =?us-ascii?Q?SBN3hBukSl2u7wh+82wAPViF7jQ5D56SqqWMSUv4ddGff9tJhs9xuDZ9amgo?=
 =?us-ascii?Q?dBMGD0MP7QveyFyI3EyIixzSQ9itE0z+CP9Wqa4FQrjMRBh0zk7ojxw/1QJr?=
 =?us-ascii?Q?CYHE1Tr0YRT0PDEQ5m/WuTkNShGnA45edq6ftMJ44i3XyjdNlEfxq+DeB2Su?=
 =?us-ascii?Q?RY0c4Veo24Pi132KRVUX5s7je7h6D1b2gdpnJwBKl2DzyJ/WAZ3pEYwFNLsi?=
 =?us-ascii?Q?pmEKsKwqLiObXmhk5fm6H2bR7HNUdNXz5Fi8/k58UYRXOzQ/iWMczZchj5ie?=
 =?us-ascii?Q?8XOlItx7G2/qBMXsJV6m2UVFau/aVqV/ur7XzrlEheX0N9fi9/xUQyx+3hdO?=
 =?us-ascii?Q?P0oX1GPahU4ChyAA6RBn3NcdZJt+YYEUaPi644OLG0wGjW+OCrFh8oSg/alU?=
 =?us-ascii?Q?9L3l8TgAdXrwExKCoTc4qH1IxcusP7KDtciTqS6KHx+akdXUCH1cEFR6tg/y?=
 =?us-ascii?Q?wWjnoQuO1ZXHpvLA/kO9u+tk795eowQs2PgCEq19o04aVup9/ijtS7RTouOJ?=
 =?us-ascii?Q?GwFUgAXAI5ieiHzYBgOVHurE6mUe1zLnzZqC4DOnxQYyKfK5ygadrnudTsN0?=
 =?us-ascii?Q?FFAid/JGu0q0LVcwnwSwMC8LTEOV4EDxLrVpGdQ0yPLuXXsfJr2q04Q5HYoC?=
 =?us-ascii?Q?TaMaBvgTTt6JeRmecIm25gq/jM8Kz0s8oCjFuhEYNLqF5lxVGXrhdsd0fwSG?=
 =?us-ascii?Q?g7eEI4IdK+2CGLZdxTACvCbtkhMG2lmYtxJXNvOFsjtFrap1ZLEl5NuPY8gt?=
 =?us-ascii?Q?IUSfZBbZ4J+WbnVW3/vji4AhI+3gcar8KmVZ+CoFEzNIcRsvw1HHtJOE5gth?=
 =?us-ascii?Q?5F5zW3KCPTX9FPNS/SBYZlB0oBZzxwKL3D9cGbvV0zKMYDt4j8RXydTu1UcS?=
 =?us-ascii?Q?6v2y7CqAhDlWLApB9VbPuRsbeTIcETQNqHwIQyj45FHFOgmsYlDAJDlAih3a?=
 =?us-ascii?Q?NoCXVzTdwEvGZnp0jZrokY/178URGrcsCRARPdW0u1PnhwPHM1EcqgBoDH/E?=
 =?us-ascii?Q?ubwQY34wNrS3XEmxq5EU6sFUqVtgz8r4P2No0/kk1X17wgscafoevgHqaD/1?=
 =?us-ascii?Q?DOCbCeNObpnAM11wnL1rcN/o2rUTUs3bx1ZVnWky22HZE9GxQXUQZypWB1SD?=
 =?us-ascii?Q?+9BPb7ZvsTfnBixKvx9j8ADZ+KeP0A4AKfg0mkUKX3yoVhgCTdp8DsdTJEKH?=
 =?us-ascii?Q?lbQpIIfl6zBhrKtSfPhNYELc+yl/BP1pyr0olyKCuwu7PV+L1JMibsRy3rbS?=
 =?us-ascii?Q?vkZS9RR030IpQ3zG4ggVN58GjTLcGHnw1gVb3E50t8bFCFjfixJiWgKUqD8C?=
 =?us-ascii?Q?3JIgYLFXWUbjTVXjGKa6mMlauB0akxleiVnJOTvQDMOga5IJbhNqVLEv54DC?=
 =?us-ascii?Q?pAcVLHyLmQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f496614-f066-4b6f-d123-08df0f7a3b47
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 20:29:36.5783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TdXZPrOZBICOfHzxkejODxYT2tuxYE+lEu1mFrxXwg+yKNqzE88yUmKcreomS238Dl1AG5xgDviCKrqRXHgadA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8433
X-purgate-ID: tlsNG-ebf023/1789072182-C3AC0B50-FE2B843E/0/0
X-purgate-type: clean
X-purgate-size: 2341

The update_intpte() now accepts a new swap flag and if set
returns the old pte value.

No functional change for existing callers.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- Add new PTE_UPDATE_SWAP flag instead of a bool argument
- Return the old pte value instead of turning `old` into an out pointer
---
 xen/arch/x86/pv/mm.h | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/pv/mm.h b/xen/arch/x86/pv/mm.h
index bfee0feb7b21..f2bb26aef5b3 100644
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -64,15 +64,18 @@ static inline intpte_t paging_cmpxchg_guest_entry(
 
 #define PTE_UPDATE_PRESERVE_AD  (1u << 0)
 #define PTE_UPDATE_NO_TRANSLATE (1u << 1)
+#define PTE_UPDATE_SWAP         (1u << 2)
 
 /*
  * How to write an entry to the guest pagetables.
+ * Returns the old PTE value.
  */
-static inline void update_intpte(intpte_t *p, intpte_t old, intpte_t new,
-                                 mfn_t mfn, struct vcpu *v, unsigned int flags)
+static inline intpte_t update_intpte(intpte_t *p, intpte_t old, intpte_t new,
+                                     mfn_t mfn, struct vcpu *v,
+                                     unsigned int flags)
 {
 #ifndef PTE_UPDATE_WITH_CMPXCHG
-    if ( !(flags & PTE_UPDATE_PRESERVE_AD) )
+    if ( !(flags & (PTE_UPDATE_PRESERVE_AD | PTE_UPDATE_SWAP)) )
         paging_write_guest_entry(v, p, new, mfn);
     else
 #endif
@@ -95,15 +98,16 @@ static inline void update_intpte(intpte_t *p, intpte_t old, intpte_t new,
             old = t;
         }
     }
+    return old;
 }
 
 /*
  * Macro that wraps the appropriate type-changes around update_intpte().
  * Arguments are: type, ptr, old, new, mfn, vcpu
  */
-#define UPDATE_ENTRY(_t ,_p ,_o ,_n ,_m ,_v , fl)                   \
-    update_intpte(&_t ## e_get_intpte(*(_p)),                       \
-                  _t ## e_get_intpte(_o), _t ## e_get_intpte(_n),   \
+#define UPDATE_ENTRY(_t ,_p ,_o ,_n ,_m ,_v , fl)                 \
+    update_intpte(&_t ## e_get_intpte(*(_p)),                     \
+                  _t ## e_get_intpte(_o), _t ## e_get_intpte(_n), \
                   _m, _v, fl)
 
 static always_inline l1_pgentry_t adjust_guest_l1e(l1_pgentry_t l1e,
-- 
2.52.0


