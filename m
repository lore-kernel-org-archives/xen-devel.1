Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EAECA5FD4
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 17:46:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438582.1657322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCKrP-0005WE-3p; Thu, 01 Oct 2026 17:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438582.1657322; Thu, 01 Oct 2026 17:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCKrO-0005Vx-WE; Thu, 01 Oct 2026 17:46:23 +0000
Received: by outflank-mailman (input) for mailman id 1438582;
 Thu, 01 Oct 2026 17:46:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xCKrN-0004u3-7p
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 17:46:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCKrM-009PVE-Ik
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 19:46:20 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abe9c4d-8faa-0a2a0a5109dd-0a2a4508d8ea-46
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 19:46:20 +0200
Received: from [52.101.56.34]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abe9c68-f659-0a2a45080019-34653822a43d-6
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 19:46:20 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by LV3PR03MB7658.namprd03.prod.outlook.com (2603:10b6:408:28d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 17:46:06 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 17:46:06 +0000
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
 b=w4aumFDwIkBPPPVsU0E3l55BwelA5MMTeQVUw2sjjt8Q9y7WN/iygbUKQtmMJukAY6WU3ftSc/MV7Mu+OEN2kzL99bo2Cu16F9FiXZvZsKeQS14biEDg/nLTR1zp7BfyqclAVsw+OmHypdyajZ+xzIB70pIxwz/mHg+EgAYGTsNIDUSkjn5tp5N2byH1v+tUaPSvYtUTWNK4GlAFBN/VXnRM5j3yq0sNGtydC/zSw1X5kZ5jHki1vnnI5VCU+VFIHhwpRvCDvXzW9sCzXgH/jG+MCcCWafEnozHs1Rjffd4Mfup6yLZ2b7/85KJOh4L7IhVPp+tHY+t2ZNWb6awZ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qbe4wM1dK5RGYKvhg1OVSDgiavw9HA7GO7PeMS2rtwY=;
 b=TlxIC4KeNrSTnmGkH6oJL3hd/iSv3fJVxMjkXMeJFaB7vX1GGABkgeHsFyOGvwts4HCVy7CTBRYcXokOpqJ22URwCq0Eh/C+jgT+8x/QwvKHYjKFtIS73JfnFidVWTYk3NpB9G5EfKO83xIjD3CXxuOLPS8ZbwwG2gub3NQadtWhZmpJ4lQEjslDgzLvFTNWFpt4HP3nr6welVbMdoscIoERdjXjvHuMkNYswqe35vsZy8WnAg91/uBchx5Ib8o3xxLTDjHI4kDT0TodEo320wfeiG6DCyNIOS9GibZzRLI1UKNyyz1g2Sp1g7HI7apzjFzE3fFV1Ct2T2b6HGN3yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qbe4wM1dK5RGYKvhg1OVSDgiavw9HA7GO7PeMS2rtwY=;
 b=EV1iYSVvtk6So6CYsVOQ+KWAcqS4njbmuVZgO1DpBHkI/NeVGq4FZoM6Lu7jaPDPXMGYei+YUdhvLvZ+ezA0equnywAQrCMD2IToofYkNCfU78h1etybqW2QIV3Fj/8t1yM0E034P7oObKZMBO0JpP+o+kk5ZfYEfTTSomaAnLs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v3 5/6] x86: New feature flag XENFEAT_mmu_pt_update_swap.
Date: Thu,  1 Oct 2026 18:47:48 +0100
Message-ID: <20261001174749.2275245-6-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261001174749.2275245-1-kevin.lampis@citrix.com>
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0102.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::17) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|LV3PR03MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd97cd2-afea-4fed-da6b-08df1fe3de7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	lG3DN/oHmstrlGPSFwsxOIaY5pTuDLVyhLq+Y7EyAG4Tu55V8LJ0rZO4QO23RwNGKrBDCuDmEi1kc7HKqnqhjGUZUSopUP2zNSavmWHvGQ4vHHLlt2U5FB2g234H3PuhnepVvou02sD0xOCELjqhOrupylnJqspq+T+R8CKyBdUiVSdRQMtXpRDnwVakra9kAArsh7zzqL40MHIMJ7tqatLHadof+KBX6f4GHf68Bq6U9C50nwBOrEdekYIGozlpYCegiC2ds7aMp/YPziqOJr4fSiv9Gh+KnDsybSGxQuyBTXG+O/SNCuGbXZkRNNkWDAGZfF47wazDXCYT3vcjjEkTBo2SCPzy5UITFq2t1jo8WrtG2JfvlowGkXHT4Gl7/6tVJiUq7g1Z/ePSa0sEkbEGwMKbYHcRx0rT6j9VYGHeV4nA+WpjdWCpxOPHHPARiudkXdZgXFZCV5y/tsqLsq8Lo+kY7uAW37tj4ghcJ59kqbdYmNwTi7P7EWFmk2uz7DzuVIo0SSKaZN/v5CzJvt91otHs7bOn8rZO6yIax47AXk/4O5aGdzgN0Rp8V5I9HO70UOkZN6eS7Bd2KvnTYBVwuM6qYOaloOUwCbwfjKirOR0PnTRFxsAyguFA1D9TXomttnQ3ovHnYZAS3/0jpM3JIDbKYdyz73Sfs10JEOM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3Humsww7slK0KOi5pZhBYem8ZJLr1eCIIdQqM8iwNgePOQ55AXqES254azrn?=
 =?us-ascii?Q?k59aNQRm6s8DNhX2PUxggQGu/3E2z/yjnmBxzWaQujelEgQD2hOreZcZvwT8?=
 =?us-ascii?Q?li0ylu7jPfa52VCAGR1ePogyMcXmxb3gxqVQFlUtvfcXGAwtmcWaEVq5ICBW?=
 =?us-ascii?Q?tZTuAuZLr3R7AMSoR6Ncok093xqxQEO/zbo/BgPyzQlclsQozK96GFnn5UxO?=
 =?us-ascii?Q?4U2MXat0VfbUOTUaEeezJh07fbwghC3YrdAlOwFiPw1cYXlkdmqKLeCu6aTh?=
 =?us-ascii?Q?EzBp1IRzNnY+GjnJVu85Iu4l8Je6vO2WehtLRKWkaAOgmsbiBZPsu5711v75?=
 =?us-ascii?Q?z7ndPvdQUU0y+4kvy9NUAVstSCjpdDBe/0gIFQUZnOCij7sdke4LNdiiuXDR?=
 =?us-ascii?Q?oomGM6G/rBBH5OcsPdNXy3xCXTqUpxcEDTlhjuWoe6FrUYzK6CEAPe7bGTAq?=
 =?us-ascii?Q?UgOFj4/jvpVZh/7EE5Hsc1YoslYLo+H+LTIpcg7EFWzJueGu3SpDb8j/Rbdn?=
 =?us-ascii?Q?wSLZlyq/PuuIWUjdKOWSWAIs3TbE/Kl8xqdoEFGyhh7do8uuZm0fZeVRjADv?=
 =?us-ascii?Q?cU1PcPsbRDeQHgR8dEFXtHGFRn0btRRMIbnQwNeZ/Be0lLpnoUq3YgrT7cAq?=
 =?us-ascii?Q?ONA8u7BTUHSSY207bGqaWmRiCghoAJwzXV7dEjA3EYpviqgjMb1YjnKCFSzi?=
 =?us-ascii?Q?4tY2DC3va1leM83Qks0k2Bgu48jDrADJ6y9CA4n78bZPrvlIZrNzxYzgT/nC?=
 =?us-ascii?Q?wolrCSIctc5lu5wT7NKeeTfW1PQ0yCknp/soMXSuWs0EZbIWce7p5DqUX6kf?=
 =?us-ascii?Q?VmeEHSf+8nLfVKEjDqUthja7BUlBqvaYxFU/HUYoDbM5sFhZ+1N4qCRlzpaT?=
 =?us-ascii?Q?UfBB9lltxxsg+Ye7rrfn4wghmMLrpXy+cseQa3UFDTNvRRUgqzYCkXJlwot6?=
 =?us-ascii?Q?1DGrX0NredDuPWVr9sXROf3TN3b1W9Bsx5VxpICfKbpwar8NvPixwEPiGp3v?=
 =?us-ascii?Q?DjNh2zsxGWwy2eazFWmseTtYfXH24TeqU4Ix7AYPflSufE0vqdtx15+EG+eH?=
 =?us-ascii?Q?3llyfQwjOjNvBgVeFtrs8wrbaUjgMRP2wBD1XEKlkiXQoscsxUjSihZZyuCt?=
 =?us-ascii?Q?4asknbBlaBHt1tn7QFcsz8B7XqtcrzxkIyUHMtJamX9aWhbtR/krPaARLEGS?=
 =?us-ascii?Q?u+6qppnS4qAzGlNDJu94X7uqINyZp31TRPGMoYBmCo+OqH3xq6mbBh9y+Tfs?=
 =?us-ascii?Q?yUaIKc0FTnDJb97po0y6tXEJPmYWbAJ8YTYiqt5tofPnCSE0JQjObHwRFvMX?=
 =?us-ascii?Q?dEgC4YzeVXwf66iaPvq3NcoxKgu5pXRvhLZWK7ENdL82sxNZNJYwWWEo+/p1?=
 =?us-ascii?Q?4+V0VtwIKTyin/JDrAnXAppSLkbDeCLESiZYMupHam4wFF+r8U8KpRGhhJlg?=
 =?us-ascii?Q?3zfrdcr/UyKlVLXbW8BX48z6ver+gOn8+O5zE+JgVQcNuVE4V0QixRb2IZSj?=
 =?us-ascii?Q?YrKlpAdx8XsUq9fxAvxoKOwpTiXLwmsahCHp9GKFmsaJltEd6u7N/xFi+iCK?=
 =?us-ascii?Q?pwa7NwWw/cpGrlKgHJwqBEFilFmgYfcHeEYiEEYk4Xqli6Ys0aLJcAogLtso?=
 =?us-ascii?Q?D8Q7dXDS0rcTSOlKxnm81H12HViIqpPT6d2IqRRvJo0gjvzCqg67Vinaa71d?=
 =?us-ascii?Q?4XgMSavCsIGyXripzjlCOqVDmI9lmoTXW8dWkDj1r4fi/qIj/WFze+hZq7R4?=
 =?us-ascii?Q?kDhOjxJpjQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd97cd2-afea-4fed-da6b-08df1fe3de7e
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 17:46:06.2479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UmYQQvDPWka8iXJYOVstTVF8frjE5wfdWOu0fPDJMUzahtoKVw6EmAFZi8/u2n4qL0ykF28TdfL3jUYcw9afsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7658
X-purgate-ID: tlsNG-c1860d/1790876780-CDB4987B-B25B594E/0/0
X-purgate-type: clean
X-purgate-size: 1317

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v3:
- Reduce diff size

Changes in v2:
- New patch
---
 xen/common/kernel.c           | 1 +
 xen/include/public/features.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index f4bbd8818fa8..67b56ba302cf 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -691,6 +691,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 #ifdef CONFIG_X86
             if ( is_pv_domain(d) )
                 fi.submap |= (1U << XENFEAT_mmu_pt_update_preserve_ad) |
+                             (1U << XENFEAT_mmu_pt_update_swap) |
                              (1U << XENFEAT_highmem_assist) |
                              (1U << XENFEAT_gnttab_map_avail_bits);
             else
diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index 880193094713..227f1e408e41 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -128,6 +128,9 @@
  */
 #define XENFEAT_dm_msix_all_writes        20
 
+/* x86: Does this Xen host support the MMU_PT_UPDATE_SWAP hypercall? */
+#define XENFEAT_mmu_pt_update_swap        21
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
-- 
2.52.0


