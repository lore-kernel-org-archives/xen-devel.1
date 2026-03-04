Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280ABEFCE41
	for <xen-devel@archiver.kernel.org>; Wed,  4 Mar 2026 19:53:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1245949.1545267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxsHR-0007ix-Gp; Wed, 04 Mar 2026 19:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245949.1545267; Wed, 04 Mar 2026 19:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxsHR-0007iq-Dw; Wed, 04 Mar 2026 19:53:13 +0000
Received: by outflank-mailman (input) for mailman id 1245949;
 Wed, 04 Mar 2026 19:53:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nfWr=BE=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1vxsHP-0007ik-JT
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 19:53:11 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c110::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3f07a98-1803-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 20:53:08 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DM4PR03MB6079.namprd03.prod.outlook.com (2603:10b6:5:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 19:53:03 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 19:53:03 +0000
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
X-Inumbo-ID: c3f07a98-1803-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwlM8fkYyZc2IBVBN97fo9+Pca06are4U/czKvcFokNBd1c1LeGWSMy4bz2vzoET2B+CXcRd0uANhWP3RlkWmXt3dSEiC4zARdqUyJhOZSX1vw9LRkvTzAbP3EP7SLHSFbf5X7SQuySvUl/wdQJ0zauK4tKduNkWitlYPQL2l4iZimnZ0B7KZFN+RI6MFA5lL86VixlS1juRdLNnUsCAe/mI8xT+IReI828DP7ODoQe+FqFBqvCWYfdwmIlUDiS21fryeeRm3BfeQ8g1QtBgu8zpKZh73g8tNREEcGNZHLKdYRwywX3+Bs0WVQ90cMllxs8msZ04p6ThySLtFZZF4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qU7HXOlN7etxGerDCTpK0kCfqtMybHf5pJHx9bkqsw=;
 b=VDgWjVweVbZTK5fcoJHvP4M+OxzzQQYUlgkHJgb5ull/4Lzm3KkWSuSHQUAzd0vNgYlEKlgIWhEgq2Pypl92Id/cba50Lr6IGwK+9n1TLFIg4bKhpE7aEXsaeN7k9DCbHnSPbMhgCUgviMWb1A0dNu2aTmylRJYNYJ3GPx8sSCmgCIWe/MzT4j0ftqSG9Os0BZmQPfJXl6rRTSoDbJNMUNWqeOYKULryLqkIFF2JYibTujfI5Bvk2YTUkXcnndMQdFVqfKLpPGa376OmbrrvCV7y8eJtxCG/R1yWJCUxN/Xthq6lE+hIW+DLSu2urMhFQNua6pk7qB66kjF5cT8VDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qU7HXOlN7etxGerDCTpK0kCfqtMybHf5pJHx9bkqsw=;
 b=H13+FjIgNiqsIKug56LSbBaN4G0li3MXdY2+oTPI5UEPo3PCQ3wAGNlisZR8N6HoaeYNBopdfe0bqPp/BO3R4gEW7ZPriluXzntTMVANZEgzsPcOmrn+z3AlnEJ6mVb+WoaeNqBvziHX2YIUigXdINEhCVRJy41ll0Pfq7N0wNA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH 0/6] Remove x86 prefixed names from cpuinfo
Date: Wed,  4 Mar 2026 19:53:44 +0000
Message-ID: <20260304195350.837593-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0014.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::15) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|DM4PR03MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5b279b-923a-4dcb-8985-08de7a27a58d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	it8/i0ti6jF0IMkAujxTuPyJgBdrP7kPL6npcV3fPBepm8mgy4vthNEdMdCzQHidhBK1LgUo/cMm9vn8Vz2LxHC4KQRc+iOavkx2IjFaN2rPGvYBglkOjFKTjvMC8Z8RtDzOVR5KgiWtN838TAHWGYDoIyOjXHCbuZyTn/KKrzGD2LkgKuSTlsW0/QLvB3/IKWrofc7f/PDfDMmqf2g3y2QYbNxcidv/FWtyYrhAjEHyDInCWPXe22JAxihCaLsjNezbAeBjEsWVdYvjbKDEqkFzr1DAziAS4O2LtrFOfxVnLVpI/Y0a52uAEpTzWcGbUSlfBx3etShk5UVNU/DJy3IOk9SOGGHwL2NWFf7laD8UPyLzaIAcdGkvyTI8d5yK17RtEL8iNQRr0IF10fVyx9jMq+nwzPiZ6YldM+m0akMVvNlOR6qnAw3oI3xHc25V8Ir+7NnTkqL/7uu+u4v0OGw0673f1IGWw40jUOr7/iu4H0c0GG0QtwM+jT0jQMql0hz/irYCf66X8kS9B05U1PrQJnWCQ77pblS+twUz4Js4PSotW2Bu/6wAF+GPRm3/B399WCqj2WIRa9R3RwWJdXHRGriA2P2RGNOvaQi5c2CfMCLrVTUxDTvoTg/oWp4PGQS+XCv1Z5Dix4qupo2z50tBHGgvELoQQP5BUwJ5TMfHGHq1j/N/DM3WJvzh6Qmh1Wox6D4xR/rHqnB8LWnK9Q4qHr/hfGrrpDr3xwsreSU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aJzOLNC6zakfOM6cCnkVRVtrgDHEC9AOf5662YI8mmGn+mFF+CLk0a2WfyXH?=
 =?us-ascii?Q?Y2smm1s4/yCLb1R27VFdLnz49rFsQ5O6V/MaXCmF3bc4+94QXpBEMqdkULNN?=
 =?us-ascii?Q?tKIJCokFwn2hb7+Q78BzG6uCMc4h7WVZtq2PgwqdJXNdNoV05HyEx6+l1Il3?=
 =?us-ascii?Q?vXUCHwEenCvF6iU9h8580+T7OwSIqaIfcN2IHtej0eu4qoJyggzAm/N4IyUa?=
 =?us-ascii?Q?QWdIsegIwHj6L5IofikpwSJcfMSRRh00oyduUhs3MN8NMbwIDMwYxcG/7hUE?=
 =?us-ascii?Q?cgTO3tiGxd0rNG/LGx7Ug5HOls3CNRi+tWtty/dHvsc3lrz66e8lPEiuCp6Q?=
 =?us-ascii?Q?Vgq/jSX7ehzFMbTlz1NKsLYTZRQZkSFAAX95stKVm9m7YGKwDXmZglauWb7K?=
 =?us-ascii?Q?zGBZJxpzZos2PVRL4mK4nl8KpHwPqLydEEXuGSqiW5biIOstXJSKE8i9QxoR?=
 =?us-ascii?Q?91pzP3wTNmvN3ysqksEGLq3AoY/qYcTE2V9DlB9H4bcnlN3LyQpFxE3Cf8Dv?=
 =?us-ascii?Q?DbIlblgqjnLlqKVcUZ37M/qHfnD5GTmy96O0ttSegfbFOGMUxh4RNH3u/Q2Y?=
 =?us-ascii?Q?puaWyz9PsXaUTRw5OZE7aSsZhPQxks7DkMufLi6DKlFoXb4t/sRaNP5sKnEO?=
 =?us-ascii?Q?xass3kcoqX+XXULkCFr4FgFNuULDOKOmCbiqINQ8rOPyOaRqLoYBurqXwQLc?=
 =?us-ascii?Q?r/5red9ILbJUtYOvItrDy6AVv6i2Ja3iw85mzr8az8bbB/k9QjYRMLq3dI4m?=
 =?us-ascii?Q?lApIpc+be6YcWTJyK75SVso0cdIXp9pmVtvwNdP/362WJIptPXNmkKHhXgYc?=
 =?us-ascii?Q?UT68r3+tzkoBY0QUMEz/aHlhLiRvuHqrOKguG7wTlWH66ODxo72Ux4Lyx0SE?=
 =?us-ascii?Q?OXYZWCrSFrFrtoqMUQRXgBo6XHWXJZy8Up+o9JzRJuua2iQIYdFsbegCu8ee?=
 =?us-ascii?Q?ALyHRwWRkXhECxoMVKxl97OC1/TYWKlygwNkabYBus6K6245Oqkmv6pWkKIu?=
 =?us-ascii?Q?jdQqcwtyZSiYA5+76c/ABN8G+FkdkQwHJ+R3cbqOtAcf5bVMMZzcQy0XLLiA?=
 =?us-ascii?Q?UzPVJmEOY5jwZMqlbBlW8LL9p1+h4d9bWVfnhMceZ7oGUyBscoFbHM2UwyCk?=
 =?us-ascii?Q?838Ihqel+mODsd4xVbEIS6RciVwh2Zv5Tg/UF9ksNMQ+Xyr30m0ypLt8w5hg?=
 =?us-ascii?Q?h8gkSa5iU8pJh0wxJiydiuiawsJe9f1lS3n7HWdm0gVGDrp4LTQY0JDdvd9i?=
 =?us-ascii?Q?tb82VXuq/39f7Kt2kexsCJFPTIPrGTh59ORqjzWogIb+lmD5RNCfkzlQk3lJ?=
 =?us-ascii?Q?zs3RNHhnsuVMrt4pipbVFojSMG1Ttw47jsyl8wjC3d4FCF/V+SeX54EtV3f5?=
 =?us-ascii?Q?Jjgw9M+Hr6WCde4Xg1zs/YSWnhRF/O1LR//fJUk6ywnmcud98n/K+UipB09i?=
 =?us-ascii?Q?CmJIuquaH2Ly1pEDWM9HXAF/P6jI9HWvy7s6uLGlosIFZOdQ+uFNPO9LN75v?=
 =?us-ascii?Q?j6hIZRiK+h+ReaZ/jA5tuxqNYzN8hNcvPtgBFXKFCwX0BwF8wohjcNrEOKLu?=
 =?us-ascii?Q?aIL9Szsjg1Mrj62m5fm4ZOC7zchr94yIMCci9xKS8NdJB4zmzYk5gkLYuaoJ?=
 =?us-ascii?Q?lz0e9+DjeKqRoazhQNvhojQxwSzoq1c0EtLI07aoYcbh4fhoppIJV72mEcx8?=
 =?us-ascii?Q?yr71tWZDKICu908Dd/Onivepn9TuML6eNRHDySn2bP/z5KPTpHNd2W/iUOJ9?=
 =?us-ascii?Q?Xc7GCo94hA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5b279b-923a-4dcb-8985-08de7a27a58d
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:53:03.4042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4ioeZ2MOb9G5x6KgLRkIYrDZexDVz44MvVkjaFhTDHLpeQPx1foYXTOOK2/yv8y4iqCA1nb3QqQxtM2lbeCXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6079

Remove x86 prefixed names from cpuinfo and all the places it is used.
This work is part of making Xen safe for Intel family 18/19.

Kevin Lampis (6):
  x86: Remove x86 prefixed names from mcheck code
  x86: Remove x86 prefixed names from acpi code
  x86: Remove x86 prefixed names from hvm code
  x86: Remove x86 prefixed names from x86/cpu/ files
  x86: Remove x86 prefixed names misc
  x86: Remove x86 prefixed names from cpuinfo

 xen/arch/x86/acpi/cpu_idle.c             |  20 +-
 xen/arch/x86/acpi/cpufreq/acpi.c         |   2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c      |   4 +-
 xen/arch/x86/acpi/cpufreq/powernow.c     |   4 +-
 xen/arch/x86/alternative.c               |   8 +-
 xen/arch/x86/apic.c                      |   2 +-
 xen/arch/x86/cpu/centaur.c               |   4 +-
 xen/arch/x86/cpu/hygon.c                 |   4 +-
 xen/arch/x86/cpu/intel_cacheinfo.c       |   6 +-
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c   |   2 +-
 xen/arch/x86/cpu/mcheck/mcaction.c       |   2 +-
 xen/arch/x86/cpu/mcheck/mce.c            |  35 ++-
 xen/arch/x86/cpu/mcheck/mce.h            |   2 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c        |  16 +-
 xen/arch/x86/cpu/mcheck/mce_intel.c      |   5 +-
 xen/arch/x86/cpu/mcheck/non-fatal.c      |   2 +-
 xen/arch/x86/cpu/mcheck/vmce.c           |   8 +-
 xen/arch/x86/cpu/mtrr/generic.c          |   6 +-
 xen/arch/x86/cpu/mwait-idle.c            |   4 +-
 xen/arch/x86/cpu/vpmu.c                  |   4 +-
 xen/arch/x86/cpu/vpmu_amd.c              |   6 +-
 xen/arch/x86/cpu/vpmu_intel.c            |   6 +-
 xen/arch/x86/cpuid.c                     |   2 +-
 xen/arch/x86/dom0_build.c                |   4 +-
 xen/arch/x86/domain.c                    |  12 +-
 xen/arch/x86/e820.c                      |   2 +-
 xen/arch/x86/hvm/hvm.c                   |   2 +-
 xen/arch/x86/hvm/svm/svm.c               |   6 +-
 xen/arch/x86/hvm/vmx/vmcs.c              |   4 +-
 xen/arch/x86/hvm/vmx/vmx.c               | 278 +++++++++++------------
 xen/arch/x86/i8259.c                     |   2 +-
 xen/arch/x86/include/asm/cpufeature.h    |   5 -
 xen/arch/x86/irq.c                       |   4 +-
 xen/arch/x86/mpparse.c                   |   6 +-
 xen/arch/x86/msr.c                       |   4 +-
 xen/arch/x86/nmi.c                       |  12 +-
 xen/arch/x86/platform_hypercall.c        |   8 +-
 xen/arch/x86/pv/domain.c                 |   2 +-
 xen/arch/x86/setup.c                     |   6 +-
 xen/arch/x86/traps-setup.c               |   4 +-
 xen/arch/x86/tsx.c                       |   4 +-
 xen/drivers/passthrough/amd/iommu_init.c |   6 +-
 42 files changed, 256 insertions(+), 269 deletions(-)

-- 
2.51.1


