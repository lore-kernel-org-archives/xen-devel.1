Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A5FC982C4
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 13:08:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423136.1648414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6pNJ-0001KU-6q; Wed, 16 Sep 2026 13:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423136.1648414; Wed, 16 Sep 2026 13:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6pNJ-0001KN-2Z; Wed, 16 Sep 2026 13:08:33 +0000
Received: by outflank-mailman (input) for mailman id 1423136;
 Wed, 16 Sep 2026 13:08:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x6pNH-0001KH-27
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 13:08:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6pNG-00AR7Y-Dm
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 15:08:30 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aaa94c1-bab6-0a2a0a5309dd-0a2a4501b174-34
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 15:08:29 +0200
Received: from [52.101.201.53]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aaa94cc-5984-0a2a45010019-3465c935a79a-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 15:08:29 +0200
Received: from DS7PR06CA0021.namprd06.prod.outlook.com (2603:10b6:8:2a::23) by
 LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Wed, 16 Sep
 2026 13:08:18 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::8a) by DS7PR06CA0021.outlook.office365.com
 (2603:10b6:8:2a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 13:08:18 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 13:08:17 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 08:08:17 -0500
Received: from [10.59.21.158] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 16 Sep 2026 08:08:14 -0500
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
 b=vaiijM8eKvTGBraPrgU2Lx68hFeUixrk3Llell3nGa07F/+gcURJGay7PqavDIMZ7PqVMBBLPGUWmDkMiaJ3iolMIB2BUFc0lmnDggZxRRncLxRwMiGnRMq+XezDodRhhGjUYL4AWqNEjxcXuoTPOsWcsn3KrJmjRA9xlRrNe/VSKt9QoKlWQtmp3qvl2OnBqlZKL3WSh7mnsBLMykkQXn4+yuk2DGHpfbqtGcHs3gxUDtEcLvx1qk8AOpjW4x13TttzgJ5+yW44rM0gkvTPkqhVajdqxiMNefZkLZUDcivjgHmKbuW/uvJWLBXJ7GjxS1BDRlPCojGM9G0cNks8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulvMdc2h4+5GzScz2sdRv3zUV+Rn3U3Mje1rhe4SjyY=;
 b=InjHiuwYnyVKV5NtBXnjar1ACFhR/f5N06r8e7+qnsfNrHh7gninAycEK6mMLjqhQCMkV3MX819+7BUezHmuQdEEXT4bY+oQZ1k6npgFltQSlARow9to/y+2GltVh8u8QSd9L4DJG0cCQsxrSH5jvdtnh0GFHQU70oQnG78A8YA6/na3+rk651oejBNQmxKa8zAmJD/ALZbQxObHflg9wAgVT9hl9BtchE0+cqPTfiEoyCMBhk5IO6heIsnOBAAx8iumb92dqF5Vim2pYypjahr0DjzhRWnD1fgmuie6uFCPD2UrpGN/qPYQ+3BKWIDMEvmlLAN7Cg4HiZG+ct2DAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulvMdc2h4+5GzScz2sdRv3zUV+Rn3U3Mje1rhe4SjyY=;
 b=RviIIriqlucy+rHO/x7zsmykN7AXiYi3sdNbbmrKJzcxVyA9Uwny260CwnfrqoAg5iU5XblGqMz89pp71Rcb41bX13UOtdu3g52j/wksI84pYj+SgZ/yB3nRi5Xt9zC/Dz/DygPr0j6/9J/PwwSKGFkbzzRBJODYl0+xkBgdCFw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <3c3c203d-7951-4340-a926-67b92224d531@amd.com>
Date: Wed, 16 Sep 2026 15:08:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] tools/arm: choose GIC version explicitly instead
 of relying on GIC_NATIVE
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
References: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
 <1789130863.8631fc262581453bbf619ec5b2062170.1a090827272000c4f3@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1789130863.8631fc262581453bbf619ec5b2062170.1a090827272000c4f3@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|LV2PR12MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 875b8efe-7384-42bc-bd8b-08df13f3935d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|7416014|82310400026|36860700016|22082099003|6133799003|10067099003|4143699003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	lUQ2Gpb38eHECXZvdr8na5eNOdcNB/lhqsaDb4knVKwJSOdcEpmWk5EFeMBKkDl/A/s5svGU/ekdSJIvJHB6jseAlVffytUaPF6mHJ1GsexHRBRI9/9s9J32tNY7rDJBkJP1Dgh+UsfcBlDw7xfQdfbJL4Vgh6An/I2xQrugSDmD0xIXE0hYBotxgo5A+f+3F7FdgoJsSFG2cTMNprKxihMpc4gTqL+1ZHreMiBhfnrw0t1u5AB8oF1izTT5dgtkZZaNTNuVBADhYAXGHV6s+1SlzW8LOcd5XABYgaAIDk/1WzHNFohQ6S3PwkNdz4DSqqMak5EV2zvpJgL/FpHpitvV7u5awZvSXpurtaJuCYLj4GmoE0ybzFf2UKH8nLTRe1s35vm4Rm+WFC17Nni2sgji9ng3Q1x+AMK5XX57CTCC931im634n5LCFCvdWxfQkU6n8CAGAtJySRZlPiv4fNSp1eOaZqnu0DoPeVG+rxzb/m2jT0GxrjzJNebC6UEhqU5UT6E4KHtzooINa35ceRPcPVfXPImyfW8CjM+BlhMEGZ/fK5XG7Ca2NFJ6TMXX2sAh6/gHuJm3RuipShz7AXh/bvDslxfbc/w0WuWDNXqRGT7WiY5DaniPh/tIb11UG5LGDjDbyJ7x/Pt7Zgc+248KpXG0uuwx3zrG65mxfcQ8D/LGHCpBPByKkIec0K/a/r9jKtkRI6hdQ5YIRK6BmA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(7416014)(82310400026)(36860700016)(22082099003)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P0U7wodbilj/LWoHVETy0VqYUmOj3H7zWKygKmV3Si2T0s1kjUGpzv4W3AgkDD6MH65sreBFof/RNQzyQ0ZgeCxNgoTq9MGy7qHHO5QfadElfy1ct408vKdfEb4fOL8P3a9ohwWrUlrAnwcTZ0IQ8nxjc+5UhkgHFc+CRb8iCkGAystVQNxvGFwoheYjeOfJm7GdEyltOewjRidcvPv5N53wjTkxuXMDAe8E/cTaqTwxQwas4iQWBi6p1x5wC3WypJ0vhkLO86VkPTLxN96hxPqm9pwVgAwO6ICReCjXCWtcN0piLAA6bLEaGE9ZuJD2km25a+WTgkJK0RzOE4HdHWeDTFkO5UE4jsUIxxIfpBAL53ndrz6Fw/wqhAhXfvrIQpO/EY60tulruqsUzO+/29/XYyMREioyNT1SO13GVDmIVxjN0ZnOJwv9sf014uLH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 13:08:17.9663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 875b8efe-7384-42bc-bd8b-08df13f3935d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5869
X-purgate-ID: tlsNG-d62444/1789564109-1FA6E757-AE5005E1/0/0
X-purgate-type: clean
X-purgate-size: 6665



On 11-Sep-26 14:47, Julian Vetter wrote:
> XEN_DOMCTL_CONFIG_GIC_NATIVE lets the toolstack ask Xen to silently
> resolve the domain's GIC version to whatever the host hardware has. Xen
> then writes the resolved value back into the same in/out
> xen_arch_domainconfig the toolstack used as input, which is the kind of
> API abuse we're trying to get rid of. The struct passed to createdomain
> should only be an input parameter.
> 
> Move the "pick the best available GIC version" decision to the
> toolstack, using the XEN_SYSCTL_PHYSCAP_ARM_GIC_V2/V3 capability bits
> already exposed via XEN_SYSCTL_physinfo:
> 
>  * libxl__arch_domain_build_info_setdefault() resolves the GIC version
>    against those bits before the config is built. An unspecified version
>    becomes v3 if available, else v2, else fails. An explicitly requested
>    v2/v3 is validated against the same bits, so a version the host
>    cannot provide is directly rejected in the toolstack.
>  * The Python xc.domain_create() binding does the same via a call to
>    xc_physinfo().
>  * libxl__arch_domain_prepare_config() therefore only ever sees a
>    concrete v2/v3 request and just validates it. The GIC_NATIVE case is
>    dropped since setdefault() always resolves it first.
> 
> The LIBXL_GIC_VERSION enum value 0 is renamed from DEFAULT to NONE to
> reflect that it now only means "the user did not pick a version".
> setdefault() resolves it before anything else can observe it, so there
> is no longer a "default" left in the config. The xl.cfg(5) gic_version
> documentation is updated to match.
> 
> This guarantees no toolstack path can still produce
> XEN_DOMCTL_CONFIG_GIC_NATIVE, in preparation for removing it from the
> Xen side and from the ABI entirely.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
> Changes in v5:
> - Go back to the initial per-version arch_capabilities_arm_gic_{v2,v3}()
>   helpers instead of a generic arch_capabilities_arm_has(caps, mask)
> - Validate an explicitly requested GIC version against the host
>   capabilities, not just resolve an unspecified one
> - Rename LIBXL_GIC_VERSION_DEFAULT to LIBXL_GIC_VERSION_NONE
This one is on me. I just realized that libxl compares user provided string with
the IDL types, so a xl.cfg file specifying "default" would fail now. This would
be wrong given that libxl API is stable. Let's keep the DEFAULT as it was (for
NONE you would also need to change the golang bindings). With that changed:
Acked-by: Michal Orzel <michal.orzel@amd.com>

You will still need Rb from Anthony as toolstack maintainer.

> - Document the change in xl.cfg(5)
> ---
>  docs/man/xl.cfg.5.pod.in                      |  9 ++--
>  .../include/xen-tools/arm-arch-capabilities.h | 21 +++++++++
>  tools/libs/light/libxl_arm.c                  | 45 +++++++++++++++++--
>  tools/libs/light/libxl_types.idl              |  4 +-
>  tools/python/xen/lowlevel/xc/xc.c             | 18 +++++++-
>  5 files changed, 87 insertions(+), 10 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index d34951edb9..6a5e75eeab 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3081,15 +3081,16 @@ Emulate a GICv2
>  Emulate a GICv3. Note that the emulated GIC does not support the
>  GICv2 compatibility mode.
>  
> -=item B<default>
> +=item B<none>
>  
> -Emulate the same version as the native GIC hardware used by the host where
> -the domain was created.
> +Let the toolstack choose the GIC version: GICv3 if the host supports it,
> +otherwise GICv2. This is the default when C<gic_version> is not specified.
>  
>  =back
>  
>  This requires hardware compatibility with the requested version, either
> -natively or via hardware backwards compatibility support.
> +natively or via hardware backwards compatibility support. The GIC versions
> +the host can emulate for a guest are reported via C<XEN_SYSCTL_physinfo>.
>  
>  =item B<vuart="uart">
>  
> diff --git a/tools/include/xen-tools/arm-arch-capabilities.h b/tools/include/xen-tools/arm-arch-capabilities.h
> index 4aa4c6c34a..21e3c73bd1 100644
> --- a/tools/include/xen-tools/arm-arch-capabilities.h
> +++ b/tools/include/xen-tools/arm-arch-capabilities.h
> @@ -6,6 +6,7 @@
>  #ifndef ARM_ARCH_CAPABILITIES_H
>  #define ARM_ARCH_CAPABILITIES_H
>  
> +#include <stdbool.h>
>  #include <stdint.h>
>  #include <xen/sysctl.h>
>  
> @@ -25,4 +26,24 @@ unsigned int arch_capabilities_arm_sve(unsigned int arch_capabilities)
>  #endif
>  }
>  
> +static inline
> +bool arch_capabilities_arm_gic_v2(unsigned int arch_capabilities)
> +{
> +#if defined(__arm__) || defined(__aarch64__)
> +    return MASK_EXTR(arch_capabilities, XEN_SYSCTL_PHYSCAP_ARM_GIC_V2);
> +#else
> +    return false;
> +#endif
> +}
> +
> +static inline
> +bool arch_capabilities_arm_gic_v3(unsigned int arch_capabilities)
> +{
> +#if defined(__arm__) || defined(__aarch64__)
> +    return MASK_EXTR(arch_capabilities, XEN_SYSCTL_PHYSCAP_ARM_GIC_V3);
> +#else
> +    return false;
> +#endif
> +}
> +
>  #endif /* ARM_ARCH_CAPABILITIES_H */
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 7e9f8a1bc3..283cfb749b 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -196,9 +196,6 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>      LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
>  
>      switch (d_config->b_info.arch_arm.gic_version) {
> -    case LIBXL_GIC_VERSION_DEFAULT:
> -        config->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
> -        break;
>      case LIBXL_GIC_VERSION_V2:
>          config->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_V2;
>          break;
> @@ -1800,6 +1797,48 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>      /* Trapping of unmapped accesses enabled by default.  */
>      libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, true);
>  
> +    /*
> +     * Resolve the GIC version against the host capabilities reported by
> +     * XEN_SYSCTL_physinfo. If the user didn't request a specific version, pick
> +     * the best one available. Otherwise validate the requested version here,
> +     * so a bad request fails early instead of in the hypervisor.
> +     */
> +    {
> +        bool has_v3 = arch_capabilities_arm_gic_v3(physinfo->arch_capabilities);
> +        bool has_v2 = arch_capabilities_arm_gic_v2(physinfo->arch_capabilities);
NIT: you can move them to the top to prevent the need for indentation.

~Michal


