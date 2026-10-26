Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CC7606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=DofId1iD
Received: from list by lists.xenproject.org with outflank-mailman.1460922.1671831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGqN-0007J8-7Z; Mon, 26 Oct 2026 09:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460922.1671831; Mon, 26 Oct 2026 09:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGqN-0007Iv-3h; Mon, 26 Oct 2026 09:18:15 +0000
Received: by outflank-mailman (input) for mailman id 1460922;
 Mon, 26 Oct 2026 09:18:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xLGqL-00072e-R9
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:18:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLGqL-00FxK6-7b
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:18:13 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6adf1ad5-e002-0a2a0a5209dd-0a2a4509ebd2-0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:18:13 +0100
Received: from [52.101.48.45]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6adf1ad3-be1a-0a2a45090019-3465302d0efa-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:18:12 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by MN2PR03MB4959.namprd03.prod.outlook.com (2603:10b6:208:1a3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Mon, 26 Oct
 2026 09:18:08 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 09:18:08 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKt/e1WNMqd8B57FcOFjSzq+Xr4PeV9GMSWyCPMx1kYlUHYa8M2TmXbKut057el2nXprJLgOD2bwI3Q7lhnasRxoqxamtrk1wW+rFJympdfKS6JpxEvm0bZCDHX3l9tLh26PZLXfOl/GqexFePKKBNgXOcS5QdbI/F4bmGAh8AJoVk6FE8q1gtcSum+D8FqZn17u2LUZIRf1iGDYMZhUTw3n2Y2rlxR/XAIkVvOj8abBm/hoW/G0bMdPv8mc7g9sLflprxeUun7q16FdEen5YZCZHO/qNIv9xZel2/98U0FXEn5Zks0gOGf9/MlaTxX4BuJmphE6ttm1BUeeusQM+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOjev09aQTNY8dAemGzi70+Y2cPv21By6/8CxrKPdPA=;
 b=DT1Qlxr0CSd7rlFTdVOeenTQ2GxguDUXjF2WruaqbKdNllPj0rpqWQT8oNiUcX0DYnCivWjzeU0LV52lljj8qfEydvfcPTWq3RJMxuObAh5952Tw2yXmVE9CRp6NiDwwCfhmv2h6uZ5z424pH/ij+5jnGbESenDOPf95M7ZqMs5oOuEZcYpPjSOZhhhKChpy0hI4qJ/dJMrUzz7klIUZn+P0WVcHpe6cKe8/LL8NHLxNvazrjoR5Tv+ohecFBMqn7gVvflNIgfga/JmvLjJeKEK/y4hUuiZvYO7E0LxCeglPrH9OHjsAngz8ucBSGdCnkL+zNi/qLsGaNe7lg9KxdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOjev09aQTNY8dAemGzi70+Y2cPv21By6/8CxrKPdPA=;
 b=DofId1iDpPE+u0s2VTyy4QJv7lUqk46BbrQXER9Zyg10dFkWIobLA5FLIpIEUO3cd7Ck27jccwbqdORKrP4Ju5Z13Y3OR82knol6VHKcx3Vtm6B107wI5a8O7Nox0ezDlPBP7q4Y1l8NwbW6Et89HPxIZQCxUqCcnEQC6NsAafc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	ross.lagerwall@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v3 6/7] x86/kexec: Pass boot params directly to new kernel
Date: Mon, 26 Oct 2026 09:20:16 +0000
Message-ID: <20261026092017.3880869-7-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261026092017.3880869-1-kevin.lampis@citrix.com>
References: <20261026092017.3880869-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::19) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|MN2PR03MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: cd788df0-db5c-42c0-740d-08df33420ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|261022105027099003|261022075727099003|11063799006|261021123027099003|10067099003|261021121427099003|261009223027099003|261022115727099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	tSEsbtOFh1kUu/7+2OCi6Lrq8GjehVRredpKtz5oYes65l7ugtRmnBgEsCF2wJJIfiOZMlSpAiirHzo24TdA5KFbWfZZlcdMmsO3lhQTPOpuU0tPCciAdoTpe0HEYlsUGVqsR+xp7fS5TidmitIwgYlhn5DPtqOTrmtzG9iicn8UvwfhsDywXv4QphlJEmzo8i9ZGPN4gyjZvmVz9pmhQps3bhynL2vCC/hut3f2LXUocOe+85dNCW7BDcJ8+CcsxFIlYAVWZJI4zUHbr4rD0AXSlqBBBA2o5XecLowDMEvjHaoOM7wYa4q01xqR4xY84ckBKGIeTrxHvft2OkvHZLF/JZ0zC3VHM80J11EhKyWwG2dIpBa2oQfj3THdB8D58nJB7kjhhKcOo1+HzzGejuYR/HnkrCubnHJmBGheTY7knvHzLZxr3PgGmBFLetcdC/itVe7Vnn/X6M5i1lz76NMxKnof7V1yJEKhAjlDqVRAv+ccqDyMDEAjGYaCL+sI2WVcZlFDbLqrO1IvnmYu7Ky8b3l+zwcXfTM6ayuAmbjnveHqm8jsY086LCYxf7M0Vcnyo10U5TrtH7vfXn5rGhjB4LiT9WxkdI3kPBJv4Xzbcx5l/8u6KC+MnLI9prq53OYEg0faTI58KyR1PM9XxsgBZdYjcvXZyPMjvwp1IsM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(261022105027099003)(261022075727099003)(11063799006)(261021123027099003)(10067099003)(261021121427099003)(261009223027099003)(261022115727099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?riyR6+hcDA+XBzbh5eCMKerSNU29Vx+Uw7OIAMteuVWpxtU/nn1AHZBgGnhu?=
 =?us-ascii?Q?3O+/3lPE7hDwbDlcUTMCqEWOXI+Kj5/eIJE8H0AxYpL1NRAXi5nZfrI8Y6ty?=
 =?us-ascii?Q?CzpzCq8nn71e40cC+KuFV5ImQsGX/Y4+d4ob9rIQ3/W9APhUbvfr4bJgv5TD?=
 =?us-ascii?Q?Ft4LHbVWTKqY7JJuOY+4VLCbG0o0ojtkLPoilQeHzsndubBQMmTSTpkMiylt?=
 =?us-ascii?Q?0rEO1yaRorhmAnb6ekHFKqtMmSpoagWpfG0frH0FJpnQi0ctuVXawjfC76PD?=
 =?us-ascii?Q?7Y/H74G7jWGkuCURK4TyuaOY2K7hYjJ+Ih/K+J12sD2JxwF7dF5WMejzWLiF?=
 =?us-ascii?Q?WySWeqAQJMgEdrq0ZlJjFkv/ESQ23vSwXH4sFu6DN3srrhv0v4Q2FUek/rH3?=
 =?us-ascii?Q?Nh/nh4s5rnZ76pIfvaR5k/pfDbWjL7bBz6bG0tsBf1Dp/9vc882StnpLVQ/e?=
 =?us-ascii?Q?OknGFkYee7MOaue9nmqWHZH5FrsTRgHZEyuwRRyurtf7vYQsPN03aqb0/rd9?=
 =?us-ascii?Q?UVpyeMxUk+9ErrTODn3y1iKdmGKkmC+INLLExlVMP7Udnjg6gLuSM6LKA6w0?=
 =?us-ascii?Q?C802NpRPiuiH8fQ1HoUnx6uFQ+FCNCfalpzSWHiTjgN4lJqX4WP6sQfm60vE?=
 =?us-ascii?Q?pgJN9du72ZSPnG1qGqSj1fxv1eUdzSUbjt3Dt9/riW80REDpYUfzU5180Mtu?=
 =?us-ascii?Q?mt2ztNUmNEDBDKEAZdAGh5FBz0Vr0BtXGl8niexJHdV7b8HECr48eVrbTD3x?=
 =?us-ascii?Q?EzOCtelzBIvPki+7CXHCsd/IIBCG/bJ1aFQLYbIohlWNQfC2yxpa14Cc/4Tu?=
 =?us-ascii?Q?PayPMevFdf/c+noFOeznuEdr9yVh123dAqcnlgGedsFBZv7lR6PkzBa857Eq?=
 =?us-ascii?Q?bwC0RNBpU1v6Mdmw+973ICmKFpfl0uzNkakHiE671r42jszNrYjftat5Vk/b?=
 =?us-ascii?Q?MhJGPtzbdbjA/CIGly/HMq/WVUPivlmfJq5/Otnn+mQEju+QF9iTJ6mNkZWU?=
 =?us-ascii?Q?CdI65ry4qphD87R/RTiHZQGoMb0uhDR3DOev56zWQ83ovwMXZnjyL58q82s6?=
 =?us-ascii?Q?Fej6RZA+O+hhmvb01ny1U5tFHc/93FWQ6g0FsUVNpz1QNFNFdIPNhK07+99R?=
 =?us-ascii?Q?m9Jy7G3FYABxrBC7yBTQ234M0oOcFkNV2r+TW6bLxg/bHCtMaNEhaRrWW3uq?=
 =?us-ascii?Q?/wjHDl0lebuGLqxAYqvabyOOc6rVTxhMt27Js7h1Xdoo2tIrl1NZJMLLNIat?=
 =?us-ascii?Q?l/jXGLRkSHbqbMEmBHRygKf0V7kEKNF7NLaKSB7g/g3t4L/pTN8bOtxMAqTW?=
 =?us-ascii?Q?yIRlyiCDsA163LMvsG/7myLcvgbYb6HBozrN68VDflfSsYRYKm4EdyR8B9Yv?=
 =?us-ascii?Q?Kg99VVNGLB5b3HvlP9i1obK1B11Qv0i1VqEitCFEfUA8T8p5JD3gzEwN/gMZ?=
 =?us-ascii?Q?3FfhDIxi3OQsFfZPjajX14ijGg4GOlbkWGN4sIFmUs2PVKCem1iqhRMZHj4s?=
 =?us-ascii?Q?Aas1UPAniOrqDu8cWM4y78COi5wV5fqdM+4l7LWDTVIzTyzvvnP6hzusKuB5?=
 =?us-ascii?Q?7cwQRjlHriAlEml+GAVoIcVM2EY2x1tuhXtzfq0is1+WYCeFEM1eOGeyQjQA?=
 =?us-ascii?Q?nD/e5OWdYevD2bt9llqpmMnEOK5baEdpMEr9FjI4/7RAc8qR7mDUdvzomEdb?=
 =?us-ascii?Q?EOBbjh/tE6lCuznBYJBrM77PDN9foCzZuELfKjvjOa0bRPvKRII7HWyaXmUf?=
 =?us-ascii?Q?ib1nmZ4JYQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd788df0-db5c-42c0-740d-08df33420ca1
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 09:18:08.3489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wf6n9C/vlZSMzH+yeURvff76L/phMQsMx/WHQxGwkY++kUfQLKAuFZpglhErTcDNUJfmMGKEB0alQSf9mf6H8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4959
X-purgate-ID: tlsNG-bad1c0/1793006293-39AC0034-382CC2A4/0/0
X-purgate-type: clean
X-purgate-size: 2450
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When doing kexec on an EFI image there is no purgatory and kexec_reloc.S
hands off straight to the new kernel. To facilitate this the Linux
kernel boot params need to be passed through %rsi.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- Rename kexec_image->boot_params to entry_arg
- Fix indentation
---
 xen/arch/x86/include/asm/machine_kexec.h | 2 +-
 xen/arch/x86/machine_kexec.c             | 3 ++-
 xen/arch/x86/x86_64/kexec_reloc.S        | 3 +++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/machine_kexec.h b/xen/arch/x86/include/asm/machine_kexec.h
index 3e189acf2464..010e0c704626 100644
--- a/xen/arch/x86/include/asm/machine_kexec.h
+++ b/xen/arch/x86/include/asm/machine_kexec.h
@@ -7,7 +7,7 @@
 
 extern void kexec_reloc(unsigned long reloc_code, unsigned long reloc_pt,
                         unsigned long ind_maddr, unsigned long entry_maddr,
-                        unsigned long flags);
+                        unsigned long flags, unsigned long arg);
 
 extern const char kexec_reloc_end[];
 
diff --git a/xen/arch/x86/machine_kexec.c b/xen/arch/x86/machine_kexec.c
index 038670922d47..67ca3e09bece 100644
--- a/xen/arch/x86/machine_kexec.c
+++ b/xen/arch/x86/machine_kexec.c
@@ -199,7 +199,8 @@ void machine_kexec(struct kexec_image *image)
 
     kexec_reloc(page_to_maddr(image->control_code_page),
                 page_to_maddr(image->aux_page),
-                image->head, image->entry_maddr, reloc_flags);
+                image->head, image->entry_maddr, reloc_flags,
+                image->entry_arg);
 }
 
 int machine_kexec_get(xen_kexec_range_t *range)
diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index 1d023733a916..0f163862b858 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -41,6 +41,7 @@ FUNC(kexec_reloc, PAGE_SIZE)
         /* %rdx - indirection page maddr */
         /* %rcx - entry maddr (%rbp) */
         /* %r8 - flags */
+        /* %r9 - entry arg */
 
         movq    %rcx, %rbp
 
@@ -104,6 +105,8 @@ FUNC(kexec_reloc, PAGE_SIZE)
         movq    %rdx, %rdi
         call    relocate_pages
 
+        movq    %r9, %rsi /* entry arg */
+
         /* Need to switch to 32-bit mode? */
         testq   $KEXEC_RELOC_FLAG_COMPAT, %r8
         jnz     .L_call_32_bit
-- 
2.52.0


