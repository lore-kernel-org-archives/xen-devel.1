Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F37CA9ED2
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 12:25:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447096.1663258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbZ2-0004A6-6H; Tue, 13 Oct 2026 12:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447096.1663258; Tue, 13 Oct 2026 12:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbZ2-00049z-2F; Tue, 13 Oct 2026 12:25:04 +0000
Received: by outflank-mailman (input) for mailman id 1447096;
 Tue, 13 Oct 2026 12:25:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xGbZ0-00049t-Es
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:25:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGbYz-00DHHK-RD
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 14:25:01 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ace230c-2eae-0a2a0a5409dd-0a2a450a97fa-44
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 14:25:01 +0200
Received: from [52.101.62.50]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ace231b-f2d2-0a2a450a0019-34653e32925b-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 14:25:01 +0200
Received: from SJ0PR03CA0188.namprd03.prod.outlook.com (2603:10b6:a03:2ef::13)
 by CY5PR12MB6276.namprd12.prod.outlook.com (2603:10b6:930:f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 12:23:56 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::7b) by SJ0PR03CA0188.outlook.office365.com
 (2603:10b6:a03:2ef::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 13
 Oct 2026 12:23:55 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 12:23:55 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 07:23:49 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 13 Oct 2026 07:23:45 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJTMp4rafzZ/nEvcx9nP1IzeioOp8Ms89qvP85vPzmkln9iYfobzGaO8lS+L+VwovTVkqaTn/sViYGAOCfd2qza5I63TPLdkubJMXjlqnPnsMi37xkHBzsnMDXdESucs5FSkCRb6zd2/5P9ulG+dD0ujl5M0gORNqqPWZWmK+twO0SEMTPwJqUywXb+T+sa1wpWj8o9GCFib6qf3WG4G/E+AyaeXmYJTRerpJAQ9jvB8iziX3jaf3WKBVY6PLc9ibTZCzfdUrnSnRzAZqzidda5gPFC5s7dFT9WeTHNVVestwj/GgTrjIVLgKKuNn7eNMgYLKuJ0pVl7WCVj9SyU4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MV+J66FUncJRlCASOx9QYe8gbX+W2R4uu+cGPHcPQ4=;
 b=ZaBF+PFtrAQZJaO7Ri2UAk7E2wvb7Fr13GDAGL3jd+Raw/US8t+SeWlc3jDUpCiUC89a9X+4gbZ1W+vJvtQ3XI1d+efjEFqHUH5ue70MclGph9K7E7vVjTHwZF09/8frT0E6D4r3FZqEk1R/30GqCFQ+zSQEzYu8o/qEZx+NPMLp79cQAptHB/0/SRZCElSjdckQCWgc8Qdh+NNDFv82N1WxkWNHf5vNaH7/tR3BgPUs+1vEhE/CNANsU5b4iLVbu1WEFc3L8B56P/m3Iemb6sikF8646wrEZvi6i1xrVgGtXoILCCAtJN7aPiORAfKNtlMl2DUlIyS8pHowN5mYkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MV+J66FUncJRlCASOx9QYe8gbX+W2R4uu+cGPHcPQ4=;
 b=W7Nay17ivo5FLOxzZYbxDdMA6gD/N0va4DQFS1oaAtoZGuoU3SydYatZ3HNcYtUEcxctqAt+O9CC+SFds29yY8z5pOoV9z0SYMy/sgLTDNJqKDQVBBaxUeURKl9n0muU/rGxxI6/uSUhOmN5LsuDbVfN7orgOrKM6hmV0DFn2xU=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <2482f3cc-e9b6-48d9-b8d5-a463feb82dfa@amd.com>
Date: Tue, 13 Oct 2026 14:23:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Fix ARM domcreate
To: Julian Vetter <julian.vetter@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, Andrii Sultanov
	<andriy.sultanov@vates.tech>, Guillaume Thouvenin
	<guillaume.thouvenin@vates.tech>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Teddy Astie
	<teddy.astie@vates.tech>
References: <1791812199.8631fc262581453bbf619ec5b2062170.1a13054627300080d7@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1791812199.8631fc262581453bbf619ec5b2062170.1a13054627300080d7@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|CY5PR12MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a4f7e5-1be8-4361-0c10-08df2924d98f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	S1t96G7mS1lerRVrywf90sL2g4x+8z6jHrwS5CGWadaeCaz9mdWlhLAaxD43kbCzVmimHxOU6w4TdBchPoowSdGjO+JyPaJ5VhXBqeK/EodpskrMg4oJn59eFWskzUPU/uESsmOZelswRvfGRAebINcAQCwoCY9xXg+tvS4KFIMvp1hOLzcBCSNeyvjG4l6BQThSo8h8AoyIID4eZNVHNT2Gj4sbyhFRzYgTXfaot4gE4g33W8G/waI0qzMGYD/SJ1kE9/+G53jWZ+wSSFi5EmRFZgD1AiVT5/jRt2fBsUoNdEluYrXv/uHgVt6Tm2dyXh0ijykOsvEFapnRjGWCfbBpqzQ7AvCbAHDu1yve+VjVgK4Qbac0tgXJrQHnGM8ha1s4xJF2pxc3yazrltt4rM7TScup8WIVjCzpUuW90nYj0FA9SNXMPbqA8VHnO+2/hmX3RVrrnHs4D8ozPVvwlsJMXKHbQx9zVtK64duCWQ6SWP6Q+Gdx98fclyI8k2BQlrm9YY5tQgdo9Q5kgQGpYnG3lb82gYLc0vVEuTRb0+YvrVNvJhgO9XL+UVVUmEQgUAQI9w8qzcMA/BpEDnkz4vxSZiTuPvSHZsy6dnf1dnxDHDwMYzG5tjqL5KInDQBlgKilABox4x1VRoAIA7VbCoJVBxxAuI7fnBRr28DwQt14VGojEAgO45h5IgKCwP61qxnmFjwQpgkU0sB8lHrSbg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v+JPuMNDAcJ9p+TyYmxKQvHsSxdrXYegd67O3xoIs7NNPwTYz6mkntYcmQNfo9CKS6nGguFKOvgitOsMrlO6/Lb65CjXT/DtPsOHuRfN23XK1z1d4jNWBm/2mntyRoUyZ76wlW28u0vXoEepY0B6dWRwHomg+Z28/7D06uBC1HdvoT+J7iv1YrUQzkH31S4R57v0CGSs2yfhcvcpSi05vxFUbN9dz96JrPcYvXWyuy2uIiJ97sOLE5+77QF0I08Zq5zJyLaHNhztRTnYhbXWGdDIkbWqdR9kMtdLmHpGuzcl4QOww02a+gwL586coDL6NlXp7tkaMvqcBJOoC15zQxfOljwDCxEuSbUexCvXUYzgPcUTL3b+HrqxdRQR8vlnyMTF1me8yXcDNoWy4cc9o4zLYucF1AbWu9AjWz0IIxWqeBr1+oyKp9ZYjG95ADfr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 12:23:55.4128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a4f7e5-1be8-4361-0c10-08df2924d98f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6276
X-purgate-ID: tlsNG-4011c0/1791894301-59BC0CFC-041A249E/0/0
X-purgate-type: clean
X-purgate-size: 3359


On 12-Oct-26 15:36, Julian Vetter wrote:
> Hello Michal and Anthony,
> thank you for the reviews and acks! Michal, I have addressed your
> remaining remarks on the "xen/arm: report clock_frequency via sysctl
> physinfo, not createdomain" patch. The golang bindings are regenerated
> for the new arm_clock_frequency_hz physinfo field, and
> alloc_domaininfo() no longer references the removed clock_frequency
> field. Apart from that I have collected the Acked-by/Reviewed-by tags.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
I was about to commit the series but I found out that some tests like
test-mem-claim and possibly others still pass gic_version=0 which will cause the
domain creation to fail. You need to update the tests.

> 
> Andrew Cooper (1):
>   ARM/sysctl: Expose the supported guest GIC modes in physinfo
> 
> Julian Vetter (4):
>   tools/arm: choose GIC version explicitly instead of relying on
>     GIC_NATIVE
>   xen/arm: remove XEN_DOMCTL_CONFIG_GIC_NATIVE from the ABI
>   xen/arm: report clock_frequency via sysctl physinfo, not createdomain
>   xen: make config argument const
Here you are still missing tags from e.g. RISCV I think.

~Michal

> 
>  CHANGELOG.md                                  |  4 ++
>  docs/man/xl.cfg.5.pod.in                      |  4 +-
>  tools/golang/xenlight/helpers.gen.go          |  2 +
>  tools/golang/xenlight/types.gen.go            |  1 +
>  .../include/xen-tools/arm-arch-capabilities.h | 31 ++++++++
>  tools/libs/light/libxl.c                      |  1 +
>  tools/libs/light/libxl_arm.c                  | 72 +++++++++++++++++--
>  tools/libs/light/libxl_types.idl              |  1 +
>  tools/ocaml/libs/xc/xenctrl.ml                |  1 -
>  tools/ocaml/libs/xc/xenctrl.mli               |  1 -
>  tools/ocaml/libs/xc/xenctrl_stubs.c           |  5 +-
>  tools/python/xen/lowlevel/xc/xc.c             | 18 ++++-
>  xen/arch/arm/dom0less-build.c                 |  3 +-
>  xen/arch/arm/domain.c                         | 32 ++++-----
>  xen/arch/arm/domain_build.c                   |  3 +-
>  xen/arch/arm/firmware/sci.c                   |  2 +-
>  xen/arch/arm/firmware/scmi-smc.c              |  2 +-
>  xen/arch/arm/gic.c                            | 15 ++++
>  xen/arch/arm/include/asm/firmware/sci.h       |  6 +-
>  xen/arch/arm/include/asm/gic.h                |  6 ++
>  xen/arch/arm/include/asm/time.h               |  7 +-
>  xen/arch/arm/include/asm/vgic.h               |  6 ++
>  xen/arch/arm/include/asm/vtimer.h             |  3 +-
>  xen/arch/arm/sysctl.c                         | 34 +++++++++
>  xen/arch/arm/time.c                           |  9 ++-
>  xen/arch/arm/vgic-v2.c                        |  5 ++
>  xen/arch/arm/vgic/vgic-v2.c                   |  5 ++
>  xen/arch/arm/vtimer.c                         |  4 +-
>  xen/arch/ppc/stubs.c                          |  2 +-
>  xen/arch/riscv/domain.c                       |  2 +-
>  xen/arch/x86/domain.c                         | 16 ++---
>  xen/include/public/arch-arm.h                 | 18 +----
>  xen/include/public/domctl.h                   |  4 +-
>  xen/include/public/sysctl.h                   | 22 +++++-
>  xen/include/xen/sched.h                       |  5 +-
>  35 files changed, 269 insertions(+), 83 deletions(-)
> 


