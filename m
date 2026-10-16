Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71026CCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 16:46:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452424.1667235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHl4S-0005Da-ST; Fri, 16 Oct 2026 16:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452424.1667235; Fri, 16 Oct 2026 16:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHl4S-0005DT-PY; Fri, 16 Oct 2026 16:46:16 +0000
Received: by outflank-mailman (input) for mailman id 1452424;
 Fri, 16 Oct 2026 16:46:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xHl4Q-00050S-Sr
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 16:46:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHl4Q-003Wv8-9h
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 18:46:14 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6ad254cb-8faa-0a2a0a5109dd-0a2a4506ca44-10
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:46:14 +0200
Received: from [52.101.61.50]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6ad254d3-195a-0a2a45060019-34653d323dda-4
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:46:14 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SN4PR03MB989476.namprd03.prod.outlook.com (2603:10b6:806:219::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 16:45:58 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0522.016; Fri, 16 Oct 2026
 16:45:58 +0000
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
 b=jOoZcEMm2jGMlA4U1zHTpaodLivu6WZgfgIXWP255IjbtO7P9/xNwXqdRRo1OALVnZKNMJngOSc8+E6qwDjoyC7K8utInVC8FTXQ2SPbnHrsJD2KNiAmBHrgJOgKrSQjK2pN1WIfPT1biXlaAijj6ehelevBLVU2c3A0OnmbWANPGwIhE5KsRkMko4A1cw7kpz1BFxKI/nYt5tJ4Ueenj3X3RBAlNayLkNn4THS6BImt5+W/7VbpYBZnoXSM6AYSUMuYSYvstvmnh3PNsaTHwjSqNsM4efCw+/W69u5hUI33O10cobGYGeyhhJ461Ma0I553mzLmbf/Exp8sC9kmKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eis1qaNSuPfjas+GPjDLVyNpWEHsWLbEBEHoQsEMCHs=;
 b=xGUamh1TSo7wMfVeiwI/D5psjf4d1uQfWbGQwVO/voCPDquEfw6NMCJZq539iF4UFLAkxgqSVQKJe9QhFxCqDNxwIkelcUZeu1wkSqymMtCiVxy0DNZvkGBXK7lwKQubuQyUJzs7WwXKma0swebtrE5LLwlC010pJbss731nH3lF+/O3KIBPOVMyS6dq57rYWdVHOV8KHaVNEDUNK4GJkBGtq/gQjGsXKrrbT92BY2zbtvQmVP8TvW29lQ0VdTQspYz8mSxw581j2jKtpYlasbfmAzCeiyTCxwjdWAaqSlWBagVCIiXD8qfvkumKdI5QC8Wr/BcLkdpSgp7ghAWFdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eis1qaNSuPfjas+GPjDLVyNpWEHsWLbEBEHoQsEMCHs=;
 b=blwpMtxfA+syIjiHmaSRH54h8jXEfcOJxaChYJLa7pmlyki6vbqYYVb0XvE7WZO+M4lSLe7viWe3k2dMC7nATAVYYgaaUG6N11onkRoYcf+3+LWg1gBqLbnOkKRXabDwcmZ8okx6GkoUyhyYxkPaKCdHtfMpqIzFiNlJZ6WgRLM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v4 1/5] x86: extend update_intpte() to support atomic get-and-update
Date: Fri, 16 Oct 2026 17:48:11 +0100
Message-ID: <20261016164815.3109065-2-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261016164815.3109065-1-kevin.lampis@citrix.com>
References: <20261016164815.3109065-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0555.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::8) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SN4PR03MB989476:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec3c764-16bd-4297-0961-08df2ba4f43d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 +7rG3W9t9ENts0amfRgh3VOKS+EXNSGIjI7JOM2VCM6uhTygI1eW3mrAp4FyRjeDF5Ik0vxAzCLG63ThCHomCbJY4UAlIg2mGM/c08yD3sAsPUbHSkCM1Hr4H4ABM7Ul8M45AFJbXNr+2AnxPb7WuOjrKNR3n0xd1gJoQBVEO4HyH7YzOOhG5gr1JakpqYUSZU9xqC4fBSr0P/1y22NVlmLM1ykOFMEvQuIsdXFnTJ/n4Nin0Wr7PfYLi5Ilqbv2CtJNIshjDsDoSQTGzzSs+Q3EB0qSzwA3VUKc0upOCiT3RjsPjE69OisQF+EAjp6JRsAOFv/CYoyPmQ0lw60ge7FZ8OOBcVJq11KgLszVN/8QDxYjoUAZ9VKNrpSEvQS7sLLqWHIWv45hq89bd+eP98aZcpVfjuZxA5krDOEY/NAFRzJcEs1AAR3AQrkYmZFysX2ud5fQbAdBEeTeO0HFhX6lNDILJPijkz6uteEYDr2gduWRLS8wXPjedUfwJ1q9CqIVtsZIzUQFo93s1jME6vtv85iUncSsi1d6vsyZa9sLlSiL1HnCwTVNxuhrIyfOdBIzy/+ElZO8gicQh8TDaDoJT3SfSnnYyjOhszxAorSZOYgJl1OJqiT4Xg20XJ+fA74VdtyOZrlMEz1NGqsbxw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?vgnU5TXIgTV382rL8dzEq4faKMTqxlCs+3PRuzwIr7KiLK5nEpvAmdd8hTP4?=
 =?us-ascii?Q?6mMBsTFZ4v8Dc3yrVLEGumIg+GvM/69Z/a+zAYmXGvqHODaaaWTCmla584ou?=
 =?us-ascii?Q?+I0PpyRJVctZGwhDJ4dx+L5Sgtn0kf1kTW6ohMLmVcqM5TiGky0LZ1vhSD9t?=
 =?us-ascii?Q?qZOzxy9zfO7fpi8I3i6ITrINYRe7uUpavjmSkGF0SBizBSCBi4lCZEYAJ+4W?=
 =?us-ascii?Q?w4FtzGETJZFjOM9tdxIotjmMMoIbY2cajVZy/HosGyyOH+qY5B+VXwwWnhGS?=
 =?us-ascii?Q?kclwLL3mZVHcWZf3+cNsI2Xy+lzrFpdujpoMU1Nx+ZXir5PTSfsLmaQHli2G?=
 =?us-ascii?Q?kHHk0CwFeuBY0yL4zo6hqwfg2Yy5AVYEvaWKYoloh9/+J2ZbfYgpeV7x7/F7?=
 =?us-ascii?Q?SMX6wokibqPnezje81spGiWj8zZYB6HxnDvXSBLqsQl8jIrfTPJZVQaxiCUy?=
 =?us-ascii?Q?6up0GBBuJUckLJqrzsac3bInJq1CelXprYrjURwLUOe/dIfEaoGAxOicjrwx?=
 =?us-ascii?Q?bVWx6Dx4sxaGBNAH55ZsJpeA3Jwu0mjSSxxwWutDHJtDjwsJ77IHl8nSo1uG?=
 =?us-ascii?Q?F7jftM4oXA8Hb4quiVvZTa2cT3fOIrTBYoxzm8qpYEgEUf2OO8fyH0cm5Fjv?=
 =?us-ascii?Q?RAOUmSecQI7wFJcQbFH0lA5B/UxEMinzbNpy0CLCr/UFQYlbwW2YKe19T5wt?=
 =?us-ascii?Q?XzJDgLPAGkExaDaZzWvpb/rrTLyGZRwwcbv9OD56K82kxxfS9NCKAblxS6zD?=
 =?us-ascii?Q?A+5CAgcXR+EznV8604kGn78y+GhI5J+SKaR2uL3E58TXPo9umvoNJt+gJPh1?=
 =?us-ascii?Q?X/5JPvZqALSNKvVLNw/SpRHdRH1oP8SRPC7rcdeLGzWEpzFB+UrdPu9WnU78?=
 =?us-ascii?Q?CdRoL/rJu9ooV6QENRBymRQmPoiiWgAPrmhdrh5r8PUIzsWVHSsueASp57g7?=
 =?us-ascii?Q?N1gfxE5B8Csl01GQ46dGlvOeMiWV/M02tKKbqUoDN0x26K1giMXqAg5NHRgQ?=
 =?us-ascii?Q?HVvzRFKm+9Lzlt2431OvyJfs29DteuwYsBOX1M+d4ZopdpiPWw4wBAYPkrup?=
 =?us-ascii?Q?3BAqGH6aWGSDJ4mDxpXo7whJ6yIQnVjk3RT/UHjfgya1Qd8420M6y9TwREkE?=
 =?us-ascii?Q?iBtvN6Np7W94sZY3Vhv7zjXmil/sg/3HnyJSccmqNP/KGbDHZasJg3icZpvg?=
 =?us-ascii?Q?/WOXBUlMfYI8ssrA2jCg3t397KBb5apjOfMXV+Hy1XZltvMEelZWAxZR9L5T?=
 =?us-ascii?Q?JlbgcyfEzdT2+kwEtkhk111xfPRCiAWcFzXyG7EsmGM32PZG8RyFqgMsPCob?=
 =?us-ascii?Q?6G4KJDSS/na5HY76DMwidFh3vWG/cdysfL7tYg0M4wnH5kLCl5NIPPHyuA96?=
 =?us-ascii?Q?WhTlvEvEmdiip3rw+HG6yUOHJtw6yA89Mjb8v3digO3uhsahfX8h8rurnGp1?=
 =?us-ascii?Q?hPxj44Bdcp8GfGU6GZqvpmVt2N0eSVMMKbpBQNpWRk4jb1PqQESeU8wq+LTE?=
 =?us-ascii?Q?WGiCtvEZNHtC4VbRoX/TP30NBx0LeKN8zz+IBnNHs4BAXzymTASfKQVJo6Um?=
 =?us-ascii?Q?69FoOU/0DXzbINZ0atXGBbaPyVexE5slmrlp0xdg8MMs/CyCqoux5dQyJiqA?=
 =?us-ascii?Q?sH7YnQX5H+MYJy4C8PbaXt1wQwuNNAfpRiROP1odorLqX502/gACCYpGqltL?=
 =?us-ascii?Q?NHJ+T64ADmMziX35b1aJAqJizobzTxHHjg8F0ZG3uBHeUju/aBJ72OxazCAp?=
 =?us-ascii?Q?XgYM6dU2/g=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec3c764-16bd-4297-0961-08df2ba4f43d
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:45:58.2844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhgvS/q7zg2YbEBAEakLo7qKpTQBvFZBpVpLSDKRSiYJFjirKSg2sLs7fzoFKueOtd8PDGC0qJoWsu4tYzkWWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB989476
X-purgate-ID: tlsNG-16d1c6/1792169174-F7CCD77B-3C3B584C/0/0
X-purgate-type: clean
X-purgate-size: 2001

The update_intpte() now accepts a new swap flag and if set
returns the old pte value.

No functional change for existing callers.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v4:
- Remove UPDATE_ENTRY_SWAP
- Don't move the backslashes in UPDATE_ENTRY

Changes in v3:
- Return 0 in the paging_write_guest_entry() case (update_intpte)
- Add UPDATE_ENTRY_SWAP to convert return value to correct type

Changes in v2:
- Add new PTE_UPDATE_SWAP flag instead of a bool argument
- Return the old pte value instead of turning `old` into an out pointer
---
 xen/arch/x86/pv/mm.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/pv/mm.h b/xen/arch/x86/pv/mm.h
index bfee0feb7b21..381a0e25b986 100644
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -64,16 +64,22 @@ static inline intpte_t paging_cmpxchg_guest_entry(
 
 #define PTE_UPDATE_PRESERVE_AD  (1u << 0)
 #define PTE_UPDATE_NO_TRANSLATE (1u << 1)
+#define PTE_UPDATE_SWAP         (1u << 2)
 
 /*
  * How to write an entry to the guest pagetables.
+ * If the SWAP flag is set then does an atomic swap and returns the old PTE
+ * value, otherwise returns 0.
  */
-static inline void update_intpte(intpte_t *p, intpte_t old, intpte_t new,
-                                 mfn_t mfn, struct vcpu *v, unsigned int flags)
+static inline intpte_t update_intpte(intpte_t *p, intpte_t old, intpte_t new,
+                                     mfn_t mfn, struct vcpu *v, unsigned int flags)
 {
 #ifndef PTE_UPDATE_WITH_CMPXCHG
-    if ( !(flags & PTE_UPDATE_PRESERVE_AD) )
+    if ( !(flags & (PTE_UPDATE_PRESERVE_AD|PTE_UPDATE_SWAP)) )
+    {
         paging_write_guest_entry(v, p, new, mfn);
+        return 0;
+    }
     else
 #endif
     {
@@ -95,6 +101,8 @@ static inline void update_intpte(intpte_t *p, intpte_t old, intpte_t new,
             old = t;
         }
     }
+
+    return old;
 }
 
 /*
-- 
2.52.0


