Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAD0CA5FCF
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 17:46:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438580.1657299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCKrN-0004wB-8O; Thu, 01 Oct 2026 17:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438580.1657299; Thu, 01 Oct 2026 17:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCKrN-0004vp-4C; Thu, 01 Oct 2026 17:46:21 +0000
Received: by outflank-mailman (input) for mailman id 1438580;
 Thu, 01 Oct 2026 17:46:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xCKrL-0004sh-Op
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 17:46:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCKrL-009PVE-5h
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 19:46:19 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abe9c4d-8faa-0a2a0a5109dd-0a2a4508d8ea-40
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 19:46:19 +0200
Received: from [52.101.56.34]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abe9c68-f659-0a2a45080019-34653822a43d-4
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 19:46:18 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by LV3PR03MB7658.namprd03.prod.outlook.com (2603:10b6:408:28d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 17:45:52 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 17:45:52 +0000
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
 b=bCdrN+1icuEEUNxB/NlzkCfdm4CSTQeIMaxzvAUtaFkvdFl8jlvrMIXpWDIkP6rDZi4P9ADl0yzaBt+W/s0Fh8NjfH6rr4vaxpzNVp36BSujn7gowCNvd3RShBUAaNiczsDO5M4+TVFoPH261PmBx0Ew87hmKw2+0DJSk7FTuaOtWKsGdVG5u/Vm+R9oRC24FNCjQhkxnCwpbbAn+KLHPE6VC+NArBUVJxvXIOg5D1iYQt9ZUwYA9eKqlDaPQburikIixFyINF5JXPKG+8UjdW7FI4G+4iSiKNB3yyy1kx4BJehkGnhPOX0rdAY7KiwhEgd6fFPQwzErpC5M37ue9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZP1qWvcBKGy+An2YvUS92jnRpESFXMLGTu4MwG7Q+E=;
 b=gtoCOM2E/zp8S/llem+ko8SZDq48rhY012FVQDTT4hT25xvH02hyAnXiy/q7R/f/U3W5hLfgEkUusGr2EtWWf+vNU7fGr8+kEaOaKBYikylz4Y+3TP4UfkRPyNXwuXy9B/FkYid1AfO58+Kj30l+yQuoJH6ZroKID20pHeAxXEOtuTN7PuVlNy1nDhA5ptxDYmsv1msx2lKf+KBT/C8BkslS8OkXENyU10a6M/6DiRUOnefsUyo/rkTVE+weK6mNVlbN0DqsYiOwa0qu/dqzPiAQiWsiol9mRhubhk7prlASi4N++D9C8wdTH6E6j7Pu9CLrnPHezjiN/D9fDzARog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZP1qWvcBKGy+An2YvUS92jnRpESFXMLGTu4MwG7Q+E=;
 b=gpBFyQ7FMvK3Nq72Y6o09Q8U8e79H+GznPiDJXHH6WljfSn9IeaVQsfhLcTUGGErJ/xAUsHhIYmCCVND2N2Tpyl43w03crIG0rid5CvsDSaVyUvBcxUv6i4hVquWIHt7EYw8jaKt85V9O4AVKSOwdGCdNtk4iY25Cx9UVqyXpBU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v3 2/6] x86: extend update_intpte() to support atomic get-and-update
Date: Thu,  1 Oct 2026 18:47:45 +0100
Message-ID: <20261001174749.2275245-3-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261001174749.2275245-1-kevin.lampis@citrix.com>
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0395.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::22) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|LV3PR03MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b8cfe6c-f47c-46d3-4c9e-08df1fe3d615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Rm/ob5e5sARmqFN3HzBGAqygO/EUMSdNxhmV/e4PomMZlUqI4U7HDeNid1WEn6ICos6fHfb9ECDWE8soyIT92pQnu5flZYYC05r2l53ZIc5qO1y9C+rTVgg5t503pFVEQjcXfF0RaFrw1iJu6QIx6Jlen88WrlyFkSFVIj8UftWB8+Z0RFnYdK8kOmJQHjpIfOO6H6sl1IJ/ydQGIdx9w7ekSFHkPLW99QNjiM330SnizTOgr+inp4gcGwGYf6jz1hrNIVeuNXeqxKPbHkWSiiEJVPTwQX2osPerAw+SVIZUlWWbeXrk3LnNaucduxI+rD6fZ+YdoJzQTQ/rwFRHIqYsIzXDYNKFsY/7s9gIETa3LI/IMgMBoissgdxpa9Abd7tCw7lF0+PgeqhCvhsviX7Ur8cZ47pXLlPea8QdtGyKTH81HP7ihPekZm0CtROiHz30811HeoLelBfqxjGmOfnRJX0JPugIr2dXcy4loyJkQDPZDN5CjdTPeSEFmQaqUkJwCU42eBX+pniF7cAWYRQI4JNPaQCkCoM4ihsHhcI5rOUXXYsw/IvNVVd+fSVzs84/8z9HHnwUyrFWHZ47frjxicKjN4qGrLVI2g3X7hh5i5IZS7blxYD5V5fpZFRAYXGMKwcRSZ3sVh4zRJRpCUB/s3thvpQqJYUMOq8MYXs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n/L5DH/FbgISSNlzRQRGWAriYThALBO2HDNWJ9z6/138ub2YiXnryftoHP5j?=
 =?us-ascii?Q?rlTt6v6HXoWVJmX5204L4Et19Y8nQ5ESz5mKtmtp0hCuGj8GahgKjepN+Eab?=
 =?us-ascii?Q?MMYkYL59DmQjeNOKXkuHNtkxymqHSvnJ5fFJpP0myntkg/G/qzzUHcYEjMDg?=
 =?us-ascii?Q?hMksXdHklq5K43pYKNZxmgQDcmdPnQOYnE+9OBA8+lA1LPfwDivmWjjxqjQI?=
 =?us-ascii?Q?RRjmx3D226ZdqJ5IvzQQ0sZkVChvJ95xLKKbU6+A3imI+g3VhTAUn/aG35t6?=
 =?us-ascii?Q?HyS1KBRYHtNlJrOVMtiQOemm56BiT6xPUppwCjwHfyxOcxEqRkIpnhfteJGy?=
 =?us-ascii?Q?Ivx8OnMgKvrizMHk/isq2I7CCfOWXirISG9izbQxn+YmqoQhoNB+nRXCCRf7?=
 =?us-ascii?Q?2ac9NZtCgAptGkBNZiXpWxG5zSG0/F6HRT18grWAzyouVnfuwGr5q5ki1sOD?=
 =?us-ascii?Q?JYdHIpg4rygPjP5EfJ5D9cYc9bC/+8xAfJfDKuQNcD65p8q8cVN09VmkK/Gl?=
 =?us-ascii?Q?r+wAVAK8Sc0GNbcO33f9Dc5ms28liDTDBRkwXWDTwcS1DXo6pgyr0VA/m3tv?=
 =?us-ascii?Q?4e0HLvYh/7M+QpWrZny/pP59Ln+biOUB9YaZ1D2+DB6dB2p1qUFlW79+AKob?=
 =?us-ascii?Q?UajJAj06E9/iKoVWbCt/zJ4sgXMv2vCuko8QXsyZcB8oc9DEm7BHWXVzJogF?=
 =?us-ascii?Q?Hm8gYnnqnVJFfSIG5mhnTJaZ9dNww2xoIF/QM5iZn8RprttC4B4+eKJ6uYT0?=
 =?us-ascii?Q?3nD42M94NR32JjImzekLXG3/xcKJlPjcrwFvdSki6hOzcqHiTfkX6BxRHDuG?=
 =?us-ascii?Q?3vvmJp6UKNJBVF1qT1QZy6TENZ9VR2IS/6D7VD0Mj/A6ukD8+jnpA2rmRbz2?=
 =?us-ascii?Q?yQah9JGL4sbgYpvdgIhA7+ojl7IS5sOEWa/tdL6rHDNCu4fVZkBSIl38DN+c?=
 =?us-ascii?Q?0JcG96F9bfLHp9nW8zqyHizQLvjJIjpXsTSUdsPNyGGeTn3zhflOzmeKftn8?=
 =?us-ascii?Q?yCcnaQ4lYsUdOS2pt3nlFH1xp2FCXvW8Pc45z6nCobkRIq3Ue9XdYvJeMFrb?=
 =?us-ascii?Q?yK1X3hD4UgzIi0NYM1J9bDTNCejmbQR88oliAZRg+Yzi9A3vnCbD7OLW+ZYm?=
 =?us-ascii?Q?NNppYJVNAgRO8rBsUxKrwOBX9ohGEjoT3pyIu32al1ZMNmUJmZ7CmzhYz4l8?=
 =?us-ascii?Q?pzTfr8pOWVDhSbDw8lqf8t576zJyY0ZUIK/1pYZiEmMxdl8EFCF9fKXeFNgK?=
 =?us-ascii?Q?bM/E1AKItCho5Sj2fgGmESj8kVaXOAxP33ZGXmnUTfN6Lyc5HiaH7dPZmBrt?=
 =?us-ascii?Q?vPtiU/Y3uPy9nxjO15lqq8KLwHN9RG5YAf9r4r3bMqlxgxeyGlcZtYohWxVR?=
 =?us-ascii?Q?OC9eqD+gFQBv+FogQCkjGLcSnJrVHDP+bcYaSqFJyQVsIUdLs5A1hGC3KoCf?=
 =?us-ascii?Q?5iMr1Tyk+hqubfbWd/Aeeu15mG0zLFS0xd6OMqsBgQifoXX8ODDFHtLA7ObH?=
 =?us-ascii?Q?yi+mEVPs6IUaSIdr2dCJNRtLXFUodLyCX4PIUebXPoL+3JYhJ65QnHuv0wc1?=
 =?us-ascii?Q?GarC7qAO5gCeQpBeYJi1fCWmCBAuGMKAKMBCqyxlir59FNEvH78KrTtog8V4?=
 =?us-ascii?Q?CyPJZuReZEM3TYUr+VKTw7+R5DKVnXnYKezmpmX+O1TW7fAHnilpQgEjwDJh?=
 =?us-ascii?Q?Hn3Xnc981rl7PbkdlYNjNg6sMLVeFliRKopqd5qR3r/rzC2DKPde5OKK/ron?=
 =?us-ascii?Q?/jfu+TgYDQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8cfe6c-f47c-46d3-4c9e-08df1fe3d615
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 17:45:52.0245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xx4sn3GdeptJYEWuYBO1Ld2GratQnC/I+6Kj5Naw6nhgLTg0Hzja1UVroPo2autyYKTX3dR7Sye5w0zDYTilA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7658
X-purgate-ID: tlsNG-c1860d/1790876779-D795A87B-0B713DCE/0/0
X-purgate-type: clean
X-purgate-size: 3025

The update_intpte() now accepts a new swap flag and if set
returns the old pte value.

No functional change for existing callers.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v3:
- Return 0 in the paging_write_guest_entry() case (update_intpte)
- Add UPDATE_ENTRY_SWAP to convert return value to correct type

Changes in v2:
- Add new PTE_UPDATE_SWAP flag instead of a bool argument
- Return the old pte value instead of turning `old` into an out pointer
---
 xen/arch/x86/pv/mm.h | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/pv/mm.h b/xen/arch/x86/pv/mm.h
index bfee0feb7b21..363db35b5fe3 100644
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -64,16 +64,23 @@ static inline intpte_t paging_cmpxchg_guest_entry(
 
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
+                                     mfn_t mfn, struct vcpu *v,
+                                     unsigned int flags)
 {
 #ifndef PTE_UPDATE_WITH_CMPXCHG
-    if ( !(flags & PTE_UPDATE_PRESERVE_AD) )
+    if ( !(flags & (PTE_UPDATE_PRESERVE_AD | PTE_UPDATE_SWAP)) )
+    {
         paging_write_guest_entry(v, p, new, mfn);
+        return 0;
+    }
     else
 #endif
     {
@@ -95,17 +102,26 @@ static inline void update_intpte(intpte_t *p, intpte_t old, intpte_t new,
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
 
+/*
+ * Macro that wraps UPDATE_ENTRY.
+ * This version converts the return type to l{1,2,3,4}_pgentry_t
+ * The return value must be used because of compiler flags.
+ */
+#define UPDATE_ENTRY_SWAP(_t ,_p ,_o ,_n ,_m ,_v , fl)            \
+    _t ## e_from_intpte(UPDATE_ENTRY(_t, _p, _o, _n, _m, _v, fl))
+
 static always_inline l1_pgentry_t adjust_guest_l1e(l1_pgentry_t l1e,
                                                    const struct domain *d)
 {
-- 
2.52.0


