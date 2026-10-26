Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F5B606A32D
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=oLN56wbu
Received: from list by lists.xenproject.org with outflank-mailman.1460912.1671787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGpz-0005nP-UO; Mon, 26 Oct 2026 09:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460912.1671787; Mon, 26 Oct 2026 09:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGpz-0005nI-Qu; Mon, 26 Oct 2026 09:17:51 +0000
Received: by outflank-mailman (input) for mailman id 1460912;
 Mon, 26 Oct 2026 09:17:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xLGpy-0005lg-Do
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:17:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLGpx-00DLTX-Kh
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:17:49 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6adf1aa7-8faa-0a2a0a5109dd-0a2a4508d8cc-42
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:17:49 +0100
Received: from [40.93.198.68]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6adf1abb-f659-0a2a45080019-285dc64436a3-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:17:49 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by MN2PR03MB4959.namprd03.prod.outlook.com (2603:10b6:208:1a3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Mon, 26 Oct
 2026 09:17:42 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 09:17:41 +0000
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
 b=DMGHwWZY2vjnt+41DevG+x9kvEamZOWK18MG+vwjUPhDPkWbCFB8mr9spcxweeE4kMUxRa73WYzD9LMw7uAON3ZfRndd3DhCMtXv068hAVmxlhPriw2QaAck1KlkIm2xXmnVNyXRTc8J6V0pqqbC1C0Et4w6Zf7v4j4Q/9wzP82PCFyZqwlw4gN8uDXMIWYARkpln6pBTVylqRpl8BcBRmOjdgwnseTq7jkYoWEsIP1YJ5Wt7yr6ppJp4M2GDxztiakPbzRDGN9NZHoEAktJrFCEdVG/8m7VCy6wbhGa2KEcET30kaoupBNU7Vdc8FWvyZ9Feb5KGfzCNVi9yL9fJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0wegR8SwtKYPW3eDFMZD1yep5qX9R/veXwzvzH8zwE=;
 b=Ytr2Sz62Ui0p0uDJcDsEvgIyfGtFQRzkETmsGyq2nMThCyThWf9FipU9EChVCYo8bH2tWP3N6G9QoljcpiCeh7Inx5lj40+g0b1vQi+Ublwd4tSjI2kFdy/NTws9vcGH1VHc8HLktOqghRUbShrMKaTs+CT3tHO2uBuKC0WxvFgAhoA1WUHDX7fTQT59+hwfijAQgOv57fds1J0DWJQwineMeewp23n2HmKMyHGRwFcGNYAqj8JX5+u/gZCafvjf9TUcGSpKM10PcQOmJir7x3tJrAOl1JtHB/6NEB67gTwbIFNVRCWdrWeFdN3IgJBGxWeIEBCeXwnsYiVJkq8cDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0wegR8SwtKYPW3eDFMZD1yep5qX9R/veXwzvzH8zwE=;
 b=oLN56wbuWg9khY1LlgpuovE6Gj4ztdBnQTCUG6D8iAfL5a9sCzmvPXHID60pSO4fBqD+4VdiCdEbeBXuOy0thvwy3dkRfmm+TZQaB1RkwnR3/OuUeLioxH0ueLnxV9h1lAeoRH4s8cved42g9pDPfrx/4A7GIVOCi9hZ+dQG+0s=
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
Subject: [PATCH v3 0/7] x86/kexec: Secure Boot support
Date: Mon, 26 Oct 2026 09:20:10 +0000
Message-ID: <20261026092017.3880869-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0279.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::18) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|MN2PR03MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: c84c9cd0-f1ce-4469-73de-08df3341fc67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|18002099003|261022105027099003|261022075727099003|11063799006|261021123027099003|10067099003|261021121427099003|261009223027099003|261022115727099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	pGhNHBiLUhkzqaJrr9h1m1ChHrhMQrFze1UJ3x4GEDEWjaARzEvkR6QfpYzRwRaIzyg9kR6xrtDBOYcY1yywhqxZIWCvkLrC6c7YzRvHomaceqzKkHKWbnndYUXzRpruHN6aMQKTXArnHNihIA/lgqC3aXfwvUbd/EfSVvJz1Wxg8TkfHfxelIc4WNeHI/KZrlgba5NH9zcsbqpHDVgEAP+MvqCK5fSIf+gBAUuXGjCEcANTbdJmsgXtQz7qhEqzpOlfJJx+SzWGbYWteHP/zUO9CrkfbH8HT0W2+gqoyRAVkJm6BDxZYrD86dTP9T9vnKhpifvxBbeOdgsIKLqU7K0fP7WhEW19ssqUz0EvxOViRtdf85fMM4ZmSoWKQEnmljqdDK+o+7p4lw9mOKmMmq3zeBDu4+Q/GBj6JPDUMOQSap3Comz6I977W1dfwUcxoLz4CuOBhiW91vkm+sEhkRYPczmoigBVn3WmtEew1raichleKGAXTVxiaDajdEpDxgwVoK7Fw+T7UvE3VSFQ/tYlieWjQpvRUUJlgLWOmCumPUuiJooGrykBqw6etooHkb8y0XdalmPwwVmZzOE67xlxtQfUALYd9uWtXaErQtNgqFzI2g6z/WfLvIaUnEJ8HJjpfbSRA17vxbqXxCn9dEO71QMbQFCh8LHzfvuZhrg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(261022105027099003)(261022075727099003)(11063799006)(261021123027099003)(10067099003)(261021121427099003)(261009223027099003)(261022115727099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S9w9lmQOEBeSvXaCZK1x3IKP3QZAw+Cf73oNfx4Dj6ODyATbvrqD9TjwSj+T?=
 =?us-ascii?Q?cp/NrRYP30VfL3Rd4aOx91/XpcZItm8juxfxqrsf6ODDoYwvKnOpE9j/X/Y5?=
 =?us-ascii?Q?Q+FJ55EgczmmkQJ5HZqeTbW/AfUwZhQgWNnJHK4UCG/weFCO/h8M9c5GtV9b?=
 =?us-ascii?Q?DK4GEaQLU9+2RYsX+0AnM4PoTIAe1RifGKHoCQZoMn32R/pYShfubScn4mPt?=
 =?us-ascii?Q?OnyOz4b9rFOCvv+ENcqfxDFYhlIXXFOOIW3HaVr8clr6b5jeJM0apkoeWv2P?=
 =?us-ascii?Q?1frLX8BUDJRRNIE33DunUE4Pz515OLEG7b1o5/HqeUsn9sz90CYlGVRCz0w6?=
 =?us-ascii?Q?mp5IuKCLyLlGPyGfQwsV84Z9xp2/xd5Ieg85gLfU8dHa89TXFHj8QV+oaQ/F?=
 =?us-ascii?Q?WaYuMlPt79+YnAOteTpUqFSF327bLYeGWQjVGerjo2PIBNv+92j5uhnXP0ie?=
 =?us-ascii?Q?Tqgu2fEVALrN9jASfmXuywC5f0uc/lFUVosBoJcvTDpseyP3REUVTJ/LN9uN?=
 =?us-ascii?Q?AXWrfXN852kMgWhICFRZKxNO6tlSlL1Vp5oUVqEnEwr92GE/YeIOnau+T7HP?=
 =?us-ascii?Q?dVjyseXaqIUGk8NqIl4We1qXWD+RZyw/he5No1ezcOlTYqzPfRi0PVOrlXhW?=
 =?us-ascii?Q?42UznyyD77J4t6Zw46xTGsNgX6AeJmhHZWnvbUVf/qbW1nHvtjLhCqnjSGh2?=
 =?us-ascii?Q?4twb9nkieXsH0iDePJOQ7QDeuPm52yO7ktkMfyoc/BsDgQpfGYbuwieGjycQ?=
 =?us-ascii?Q?xxHSgeOXgOePaOdmyRP/cXEVF4lKOhEK+BrjLognRuLx3ql0naLdBBxFO+Im?=
 =?us-ascii?Q?3bVwPOKr63GUFdlABSM9CmAbkfvirrKAaKhpRjIGZ/5LCXGMNXb8ddpk4jMX?=
 =?us-ascii?Q?YmYwQBfPEFhI1l+91BecW5Aiw2nHddaIJhod1A4nS6rBtUuKvh0OggenUA/o?=
 =?us-ascii?Q?AewSrzXhgj4zLmV3324Zw+/moFkcgTGunMBky2cE+BmRuyzwDcq4qTYdOdo2?=
 =?us-ascii?Q?5uzgcdEnwyEhhZYtwRcwiQQ8o2bGvp8j83r1SU6quKTVCimRq9bsfOJ/RlQZ?=
 =?us-ascii?Q?rBdqd4OMYHPVl+9r7eLg+DWFjLYaxiC1dZNNbRoxIvLhPpju/TtPg4nrgPH3?=
 =?us-ascii?Q?8dDH6VkpF2NhBtuFNHjErpM6o+xZ81qQBv2TZpz/hev1mUbaxrM+H1jKgTUC?=
 =?us-ascii?Q?saO7U2qqp1AbpRz4IXPqbupsMNqyxIHhle+69DRA3InTV94kIIVJCeBe4syS?=
 =?us-ascii?Q?qd9jYamI6uAtrUG+fyQkp9KaL1UliIew71Fg6jtc+Ok3ihgGpXgd7+ht+TsT?=
 =?us-ascii?Q?728/2g8TPcfewSQ0OxyEyY5jAHyNo78eU+3Ul5FEH+xfPQwbqsnUvjTzP6uZ?=
 =?us-ascii?Q?xjq1EhEAfhaZ98HO55CpnE3k5ZmYLfzNJH4fMjwfxj6fmmjBnMNVej12ytzb?=
 =?us-ascii?Q?lnhZmQlJBs5C2fuWG4j1ra0xxg5CnpmOBsA1FjI6Ap9FWQxmokH2rVrckT4J?=
 =?us-ascii?Q?8RgQTv2ZfBs+XXQFgcHb0va+82Yv5xeWFUQC8svRv7u/pqJQIyD13P27eRQA?=
 =?us-ascii?Q?46rUkFocYFxeFa3w/iuz9TuJgj3ZcBv/tpb7v1xpVNgwswrWFrYr2KyJtnKd?=
 =?us-ascii?Q?1SU2KSwjt4gOQZLRpKQ7yguu04V5wTMCuDxiOtoEeJ/TXSNaruRGGDP8F0th?=
 =?us-ascii?Q?plChUvUPzx4eiNpHZCsY9BiVBX/yJv8N+otk//9OSiMYCpXVxnBUkR7op0BU?=
 =?us-ascii?Q?8o4TeyB7dA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84c9cd0-f1ce-4469-73de-08df3341fc67
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 09:17:41.1268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hrUHyPcl2KTvQUA7NDCJ8GfY36FnKP/Pn4eoWDHzDfH3fURKBvdLrMej9PWg949iIgCKkHS+PS55UfdoalLsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4959
X-purgate-ID: tlsNG-c1860d/1793006269-CC37587B-27991ABA/0/0
X-purgate-type: clean
X-purgate-size: 1794
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These changes allow loading and booting an EFI kexec crash kernel.

For this new EFI kexec type, userspace won't provide purgatory code.
Instead Xen jumps directly to the new kernel.

Signature validation is done by the dom0 kernel. Xen then calculates a
digest for all the segments stored in memory. This digest is verified
again during execution. This digest check obviates the need for Xen to
verify Secure Boot signatures directly.

Changes in v3:
- Review comments

Changes in v2:
- Addressed review comments for specific patches

Kevin Lampis (2):
  x86/kexec: Pass boot params directly to new kernel
  x86/kexec: Zero GPRs before entering

Ross Lagerwall (5):
  x86/kexec: add digest checks
  x86/kexec: rename setup_header to bzimage_header
  x86/kexec: add new struct kimage_segment
  x86/kexec: Support non-page-aligned kexec segments
  x86/kexec: Implement new EFI load type

 tools/libs/ctrl/xc_kexec.c               |   2 +-
 xen/arch/x86/Makefile                    |   1 +
 xen/arch/x86/bzimage.c                   |  47 +----
 xen/arch/x86/include/asm/bzimage.h       |  44 +++++
 xen/arch/x86/include/asm/kexec.h         |   9 +
 xen/arch/x86/include/asm/machine_kexec.h |   2 +-
 xen/arch/x86/kexec.c                     |  58 +++++++
 xen/arch/x86/machine_kexec.c             |   3 +-
 xen/arch/x86/x86_64/kexec_reloc.S        |  23 +++
 xen/common/kexec.c                       |  38 ++++-
 xen/common/kimage.c                      | 208 ++++++++++++++++++-----
 xen/include/public/kexec.h               |  12 +-
 xen/include/xen/kimage.h                 |  20 ++-
 13 files changed, 367 insertions(+), 100 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/kexec.h
 create mode 100644 xen/arch/x86/kexec.c

-- 
2.52.0


