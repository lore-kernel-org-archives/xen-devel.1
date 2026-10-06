Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAB4CA5FED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 11:21:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441421.1659020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE3EE-0006OF-4p; Tue, 06 Oct 2026 11:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441421.1659020; Tue, 06 Oct 2026 11:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE3EE-0006O8-1r; Tue, 06 Oct 2026 11:21:02 +0000
Received: by outflank-mailman (input) for mailman id 1441421;
 Tue, 06 Oct 2026 11:21:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xE3EC-0006O2-5Q
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 11:21:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE3EA-00AGxz-Td
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 13:20:58 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac4d98d-bab6-0a2a0a5309dd-0a2a45099836-40
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 13:20:58 +0200
Received: from [40.93.194.45]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac4d998-be1a-0a2a45090019-285dc22d66b3-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 13:20:58 +0200
Received: from SJ0PR03CA0126.namprd03.prod.outlook.com (2603:10b6:a03:33c::11)
 by IA4PR12MB9809.namprd12.prod.outlook.com (2603:10b6:208:54f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Tue, 6 Oct
 2026 11:20:52 +0000
Received: from SJ1PEPF000037A6.namprd04.prod.outlook.com
 (2603:10b6:a03:33c:cafe::7f) by SJ0PR03CA0126.outlook.office365.com
 (2603:10b6:a03:33c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.14 via Frontend Transport; Tue, 6
 Oct 2026 11:20:52 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000037A6.mail.protection.outlook.com (10.167.244.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 11:20:51 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 06:20:50 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 06:20:50 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 6 Oct 2026 06:20:46 -0500
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
 b=NCxKSE7s3LHDhN6n709tffizEHNJ1h3F5eaGRuSFsqskT1ACgier6wDxlQ/Zo/QZNIrmJ1E+ZWzU/n1vYxpEuGuGQN30cEp2oSCWNEpPv0aIztunfUDQmgBpNQbj7Tsp80qcL5AK5uGhqwCMTvH0V13OVu4WSldQ4CBmj0UPnHzjlNrUxc/ic5/ixqzjMc47AKkZzXhwil2Rh1SqvbYMBOi8MmuEm8gzx6WxELvGSIbSk4FChSJzqlQObWxNdIuJxS5tfhL4mrZjz4Sh8u3llv+NGHhxv9xG/XZplUPrc+TMTtwmMUgYi1v26HkbnpS9ev67z9c1B/TPUvGrCj9Ijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARhi/DKp03clPOoGAW6gfbn4YX8ymk8xB5K86K7+Xik=;
 b=A4qOZ7CItDQrAE5I5cGIzDKGbeqECnHhzQ6easeIyZhtLG2OYYPyNFE7ACGt6al1HzGLpdNNpkKe9fcRzNQG+HrmE09Y9vvF5Q7uusrR1op4Oq3+DeQWhnRF0BuRWRcLxRQbmwPXf+pOvOvFMgjvvC9GYmTztqgy7zxDRsvUbtKkb6KDVK0IgesJ9hpys00n0vAYySzP7eyO7G0W+CgB2D1ljsIQ6SWYCXkWVbvFm4NSS4qkXfJxZTm5h3b9L/rNuqd+3dcg7J8QcazJqm4J1oQtC3qT5TCF0zDe7lpJaIEG2d+hKsFSsKPCMCkqnv1PQSzRGqh7u5aGMZEnXzfrsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARhi/DKp03clPOoGAW6gfbn4YX8ymk8xB5K86K7+Xik=;
 b=cIhMxBL9y2ahNKJoiMrSB1wMUdaxsdn9M54eFREkd2aXPbi788aFJOo2j/6Wuntr3iGYdigU8wjNJJzKgh/7f+sve9uorJBQQmnbkgRsuBCpbKucyROsA2pm1rJZkYdUQeHxnMX+gtvxQqxxxbMTLXzqvrEM2whayL6OI0HV520=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <f9c2b08b-9174-4ddf-af1c-f206e0b52165@amd.com>
Date: Tue, 6 Oct 2026 13:20:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] xen/arm: report clock_frequency via sysctl
 physinfo, not createdomain
To: Julian Vetter <julian.vetter@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
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
References: <1790597845.8631fc262581453bbf619ec5b2062170.1a0e7f2cff3000b504@vates.tech>
 <1790598010.8631fc262581453bbf619ec5b2062170.1a0e7f55818000b504@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1790598010.8631fc262581453bbf619ec5b2062170.1a0e7f55818000b504@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A6:EE_|IA4PR12MB9809:EE_
X-MS-Office365-Filtering-Correlation-Id: 618c252e-d683-41e2-9995-08df239be16b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|7416014|376014|82310400026|56012099006|5023799004|11063799006|4143699003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	iL1s4VpC5SBy1dm2jAyloEnRK6qOxT85YIKAlJR6Msqr8vC9/3CVa6+XO5hyC2OfOOBgtgnSG7Xx7MrvX3vxz/6RC2dW9DmL/LP8VHwmDOZhwldFUKMoi1W9I8VS0j6ReQdeYNHDiYpi4YyqNzbui1jdK8RBOOUPBYFRsMB2NMHLIh/zwgw1KzraKRJvMNC3DwlXznKNqCYXpsookksZwNa7UJ0HaYGrJA/mkO8y/yfT6F1Bx4+HuFbDaKT4Y4jw6gPBsgM/PZXzLrGnYXKqHnahXDOuWTwU7xi0VY66v/tykKiJ65Rj9ALbsKVJdEkgkSjFd9lNDhUU+fnk7dpZRnPI3RadD2OUcAfE9KwzNgEpb1ENEOR4L+0yZpKcQWSVAwBQn0kiG4rDe2mpz3QVEnUlyj1AnB+hNOeKMcMDg69+pgQOdwvKl8SXfUrkaVz2h9tTb4uxYOc+phzllMyjP5bW6caYH3aM/Ng9cBrYBpuK7F5q/iRdKqWIZvMGBkJAL4Jr7nYgV+4XEVOGrgjfJfdGBt5F8NAtxdzLUL4Ba1yunLNkZg5Kb/sDPFIG/biNSZM8F+fkHltBqvrxviK7jXqq3yi/rVenwrzP/iCQlbjOo4+iYDSb+fB+2bJjDc+H6salST1ndAUw5KtSwAsIMdWMPnYZABH8iRR5JesHsjnGbcMt3j3PE3DY9NUk+ZYo8/uaH5tg6Jz5K4v3S+aYqQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(7416014)(376014)(82310400026)(56012099006)(5023799004)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2MwrNIAo2NNuXatzNOLnU8y8pFkQRv+shhBF/WwgnhqNvOyFlP5OGTBV42LsO+Mx7NHGlLrD/RHOcCHNumttjRe0MgS6Qa3/4FWm56uYBpUsGa/7CaJpO+F8ZSBLjG2BdEj//9vDE2iTilqR69OFWepe0AsuHqbUx9FmR8coAb9QhAbCtkQjlDxAIdiqjOHLeAgxc7KwxDv1D5+2YUUQN3nRY6xRK5wgSrkliZlTKJR4t0n/rb3WYaQ4I/CSHZUreDpqn8LGh1IYPyv/Yk2FSzDGS6JPWzDw/pF2eVvbbI5crZ+BQ6J56sU64c21aD3c+f2/t9Rl1yDno0yfQU0svA3BIsBgREe0iiVxtYBqhOS2lTQoT1MwIDgw7X66UPDKrEYIpZ8GAl9//lvVjISAqTMfnWDPBESM1D1f+m7upUErFUgeEaWcLyD95Q1VDwu+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:20:51.7430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 618c252e-d683-41e2-9995-08df239be16b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9809
X-purgate-ID: tlsNG-bad1c0/1791285658-FC817034-97AB6EBE/0/0
X-purgate-type: clean
X-purgate-size: 8693



On 28-Sep-26 14:20, Julian Vetter wrote:
> The xen_arch_domainconfig.clock_frequency value is populated in
> domain_vtimer_init() during XEN_DOMCTL_createdomain from the global
> timer_dt_clock_frequency, which comes from the host's DT timer node and
> has nothing to do with the domain being created. Like now removed
> GIC_NATIVE resolution, this is a host-wide system property being
> smuggled out through a domain-creation IN struct.
> 
> Expose it instead as a new arm_clock_frequency_hz field in
> XEN_SYSCTL_physinfo, populated via arch_do_physinfo(), and mirroring how
> the GIC capability bits were already moved there.
> 
> Rather than making the field dependant on DT boot, make Xen always
> report the timer frequency, either via the DT "clock-frequency" node, or
> directly via CNTFRQ_EL0. preinit_xen_time() already computes cpu_khz for
> every boot path. The renamed timer_clock_frequency_hz now captures
> whichever of the two produced that value, in full Hz precision, instead
> of only recording the DT case. So, ACPI guests get a real value too,
> allowing to drop the special case.
> 
> The DT "clock-frequency" property exists because firmware might leave
> CNTFRQ_EL0 wrong, and since CNTFRQ_EL0 cannot be trapped the only fix is
> to replicate the correct value into the guest DT. To keep that signal, a
> new XEN_SYSCTL_PHYSCAP_ARM_TIMER_DT_FREQ capability bit records whether
> arm_clock_frequency_hz came from the DT property. Then libxl only emits
> a "clock-frequency" property into the guest timer node when that bit is
> set. A guest whose CNTFRQ_EL0 is already correct keeps an unmodified
> timer node, exactly as before.
> 
> Although the CNTFRQ_EL0 register is 64 bits wide, and some current timer
> implementations run at 1GHz, a 32bit value is sufficient to store the
> timer value, because it only mirrors the DT 'clock-frequency' property,
> which the bindings define as a single 32-bit cell.
> 
> In struct xen_sysctl_physinfo the new field just reuses the former pad
> word, so sysctl consumers are unaffected. struct xen_arch_domainconfig
> however loses clock_frequency from its middle, which shrinks the struct
> and shifts every field after it, so bump XEN_DOMCTL_INTERFACE_VERSION.
> 
> The xen_arch_domainconfig parameter passed to domain_vtimer_init() is no
> longer needed, so drop that parameter entirely. libxl now fetches the
> frequency via libxl_get_physinfo() in libxl__arch_domain_save_config()
> instead of reading it back out of the createdomain reply. The OCaml
> xen_arch_domainconfig mirror drops the field too.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
This can stay (you still need here and in patch 2 acks from others) provided you
fix the below remarks.

> ---
> Changes in v6:
> - Rename arch_clock_frequency_hz to arm_clock_frequency_hz
> - Drop now-redundant "# ARM only" comment on the libxl IDL entry
> - Rework libxl__arch_domain_save_config() to a single exit point: fetch
>   physinfo up front and use "goto out" on every error path
> - Move the gic_version IN/OUT -> IN comment update to the GIC_NATIVE
>   removal patch
> - Added Reviewed-by
> ---
>  .../include/xen-tools/arm-arch-capabilities.h | 10 +++++++
>  tools/libs/light/libxl.c                      |  1 +
>  tools/libs/light/libxl_arm.c                  | 29 +++++++++++++++++--
>  tools/libs/light/libxl_types.idl              |  1 +
>  tools/ocaml/libs/xc/xenctrl.ml                |  1 -
>  tools/ocaml/libs/xc/xenctrl.mli               |  1 -
>  xen/arch/arm/domain.c                         |  2 +-
>  xen/arch/arm/include/asm/time.h               |  7 +++--
>  xen/arch/arm/include/asm/vtimer.h             |  3 +-
>  xen/arch/arm/sysctl.c                         |  5 ++++
>  xen/arch/arm/time.c                           |  9 ++++--
>  xen/arch/arm/vtimer.c                         |  4 +--
>  xen/include/public/arch-arm.h                 | 14 ---------
>  xen/include/public/domctl.h                   |  4 +--
>  xen/include/public/sysctl.h                   | 20 ++++++++++++-
>  15 files changed, 77 insertions(+), 34 deletions(-)
> 
> diff --git a/tools/include/xen-tools/arm-arch-capabilities.h b/tools/include/xen-tools/arm-arch-capabilities.h
> index 21e3c73bd1..a927bc4703 100644
> --- a/tools/include/xen-tools/arm-arch-capabilities.h
> +++ b/tools/include/xen-tools/arm-arch-capabilities.h
> @@ -46,4 +46,14 @@ bool arch_capabilities_arm_gic_v3(unsigned int arch_capabilities)
>  #endif
>  }
>  
> +static inline
> +bool arch_capabilities_arm_timer_dt_freq(unsigned int arch_capabilities)
> +{
> +#if defined(__arm__) || defined(__aarch64__)
> +    return MASK_EXTR(arch_capabilities, XEN_SYSCTL_PHYSCAP_ARM_TIMER_DT_FREQ);
> +#else
> +    return false;
> +#endif
> +}
> +
>  #endif /* ARM_ARCH_CAPABILITIES_H */
> diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
> index a1fe16274d..98c7f0fdb3 100644
> --- a/tools/libs/light/libxl.c
> +++ b/tools/libs/light/libxl.c
> @@ -410,6 +410,7 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
>      physinfo->cap_gnttab_v2 =
>          !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_gnttab_v2);
>      physinfo->arch_capabilities = xcphysinfo.arch_capabilities;
> +    physinfo->arm_clock_frequency_hz = xcphysinfo.arm_clock_frequency_hz;
>  
>      GC_FREE;
>      return 0;
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index b9c0c820d6..47b662ea5c 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -252,6 +252,16 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
>                                     libxl__domain_build_state *state,
>                                     const struct xen_domctl_createdomain *config)
>  {
> +    libxl_physinfo info;
> +    int rc;
> +
> +    libxl_physinfo_init(&info);
> +    rc = libxl_get_physinfo(CTX, &info);
> +    if (rc) {
> +        LOG(ERROR, "failed to get physinfo");
> +        goto out;
> +    }
> +
>      switch (config->arch.gic_version) {
>      case XEN_DOMCTL_CONFIG_GIC_V2:
>          d_config->b_info.arch_arm.gic_version = LIBXL_GIC_VERSION_V2;
> @@ -261,12 +271,25 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
>          break;
>      default:
>          LOG(ERROR, "Unexpected gic version %u", config->arch.gic_version);
> -        return ERROR_FAIL;
> +        rc = ERROR_FAIL;
> +        goto out;
>      }
>  
> -    state->clock_frequency = config->arch.clock_frequency;
> +    /*
> +     * Pass the timer frequency on to the guest DT only when Xen took it from
> +     * the host DT (XEN_SYSCTL_PHYSCAP_ARM_TIMER_DT_FREQ). Otherwise the guest
> +     * gets the right value from CNTFRQ_EL0.
> +     */
> +    if (arch_capabilities_arm_timer_dt_freq(info.arch_capabilities))
> +        state->clock_frequency = info.arm_clock_frequency_hz;
> +    else
> +        state->clock_frequency = 0;
>  
> -    return 0;
> +    rc = 0;
> +out:
> +    libxl_physinfo_dispose(&info);
> +
> +    return rc;
>  }
>  
>  int libxl__arch_domain_create(libxl__gc *gc,
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index a7893460f0..4284a4f577 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -1201,6 +1201,7 @@ libxl_physinfo = Struct("physinfo", [
>      ("cap_gnttab_v1", bool),
>      ("cap_gnttab_v2", bool),
>      ("arch_capabilities", uint32),
> +    ("arm_clock_frequency_hz", uint32),
The golang bindings need regenerating I think.

>      ], dir=DIR_OUT)
>  
>  libxl_connectorinfo = Struct("connectorinfo", [
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> index 147afa62c2..582897af6d 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -32,7 +32,6 @@ type xen_arm_arch_domainconfig =
>    {
>      gic_version: int;
>      nr_spis: int;
> -    clock_frequency: int32;
>    }
>  
>  type x86_arch_emulation_flags =
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> index 9fccb2c2c2..9414b87164 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -26,7 +26,6 @@ type vcpuinfo = {
>  type xen_arm_arch_domainconfig = {
>    gic_version: int;
>    nr_spis: int;
> -  clock_frequency: int32;
>  }
OCaml stubs fail to build on Arm because you haven't updated the C side
(alloc_domaininfo() in xenctlr_stubs.c).

~Michal


