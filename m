Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE62C88E77
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 14:12:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423189.1648430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6qMp-00052F-Tp; Wed, 16 Sep 2026 14:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423189.1648430; Wed, 16 Sep 2026 14:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6qMp-000528-R9; Wed, 16 Sep 2026 14:12:07 +0000
Received: by outflank-mailman (input) for mailman id 1423189;
 Wed, 16 Sep 2026 14:12:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x6qMo-000520-0B
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 14:12:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6qMm-002vvX-J8
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 16:12:04 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aaaa3b3-2eae-0a2a0a5409dd-0a2a45048ab6-0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 16:12:03 +0200
Received: from [52.101.52.68]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aaaa3b2-b57f-0a2a45040019-34653444c099-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 16:12:03 +0200
Received: from CH2PR18CA0021.namprd18.prod.outlook.com (2603:10b6:610:4f::31)
 by MN2PR12MB4175.namprd12.prod.outlook.com (2603:10b6:208:1d3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 14:11:57 +0000
Received: from BN2PEPF0000A992.namprd04.prod.outlook.com
 (2603:10b6:610:4f:cafe::5a) by CH2PR18CA0021.outlook.office365.com
 (2603:10b6:610:4f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 14:11:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A992.mail.protection.outlook.com (10.167.248.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 14:11:55 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 09:11:54 -0500
Received: from [10.59.21.158] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 16 Sep 2026 09:11:50 -0500
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
 b=BxtC3XKwMrnaNmc0YhBoOnEAs4XCIVBhFc7g/lcZedXv9HP64/v310VxpLB8Zd9D5l9kc+5Dga5p9VWZ4y/mv2tdo59t20K8K70EG4HNhxt71d4KqYaJNG6V7n0fSGPeHaYybIh66U0+qMgzBEN3M6RI/tpIgxNglpRxtQtAZjBN5noe1CswwEIaNO66vnQEwvrHcCjHrR2aKC/DpYjR+FPqAcUZfuL+ZH8FsoZ6UCywtimFdeXqqhVslj/7/OtwFVLtch00Pd+eRC61g9fHKGhTYhzbiuPcrKrpawR849SLe4WJOUraLN/d6AYD9wj9mX10cPauZ9MAaCh76EPx3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qbHj1a5FX6YNk34OUl1j8Kb3V0wSr32WDkvEzQcPtA=;
 b=w0YPdKMumpPI23dBJIkTOVvpTTfb0x1cT1Tic0+5etJunbEW386MAckvTVvTFATNHj7hOFQdnsMop1DM7GuYrxstlsd+pDljngy7zkYKXcPc5fZSJRP49XmRyWpzsZLaXKxGZnth1iWFAshou2Ks/URqGfROqBqdZRnQV5ZeU4dCM44EJlLhJlIJL5M8soKpPk00zyMp8rKClkoHB9zzi9OwE8VvIvjiDO97hybLZTjZij+dbe+qN99OEhrgXKwugSrg3iymvvQGwcFKiYhtglVVv9h+fUMui2sZAf/qEzAW3lzWfAtGmJIkcasFtkm1NIDdxZhq9r3Mu/+vWgAgwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qbHj1a5FX6YNk34OUl1j8Kb3V0wSr32WDkvEzQcPtA=;
 b=UIYhctP/9YHgHk+7tGRb5wXufLuAydfuOLoaHI9cNimt0yEd/34k09782xkXsq8iDyMJALvgkoGODwKz3gvL5oJy/U0eJrZGxuDSQ+RhckhPZx3+Gf5oR9Eu+Qm7+o8B9Phgc6Z0pVIiMK3BsnIHMaGM4FwthkJcbRk1JSg5Di0=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Message-ID: <d0e46002-17de-4f60-a3bb-5e65ef3862b0@amd.com>
Date: Wed, 16 Sep 2026 16:11:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] xen/arm: remove XEN_DOMCTL_CONFIG_GIC_NATIVE from
 the ABI
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
 <1789130863.8631fc262581453bbf619ec5b2062170.1a09082744e000c4f3@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1789130863.8631fc262581453bbf619ec5b2062170.1a09082744e000c4f3@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A992:EE_|MN2PR12MB4175:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b52762-f6a1-40b7-c1c4-08df13fc7692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|82310400026|1800799024|36860700016|13003099007|6133799003|10067099003|4143699003|11063799006|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EucNr4dCCNuu+X16NcxqY+pDKE9+oiIjcy27JgDzka+i3mHMjyLc5E2WCae5AHaHkUJ5lQ5bGwnIhlFN9JirDxH6E7vWLZg8sFTvhVVKYsi18ZQmVpyPruyNYW4qYi9AbdWjk1ipPW3enugjPFXfaPPF9NHj4k7QXB2EcWLBF7KqkGMywzbqEkElxhc+kgkzVA7+Yda60MZ4zwD9fe6VwWsr9/nGFlVUChCviwZgikdWAMsZCsEHggqBhXJfyjXc8ZRIc4XDxXTjeXb24v5tlWGNfKGhTMLl8jKu+goxvAPv8D4t9I1+BZA1edFVKF/ajlTtFMQ4Kz00pBWqHoTfNi89i2wfmiuHZdOq1ZWrp51rGeVThTCyks0iD0iJVliRlQ8D9SYMPsV8p/VgmbSk+MROj5lVfDXkKK283RgT2/ugoJGXW6BHjXfr9eR3erMJFWswJV1zEnJ8Rg4hh+f4T1TsrCekb5TQaVNb1/vfOAyc5pwm1Q0v6udQ+qniZBlj8wA4IicrAZxa8Ts+V4LB4MrYPMx3gug3r5+ERUWxzY5t1FyUAtIicdOxdTt/BMVlrrsHlHa6ZuEMFqpO7i3cbWW+q3boGCJLdcEvNkEnLKwIirCi5SY+jYFbsF1Z4h6CX6cPLkV+z0//LjRdPO7XmA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(82310400026)(1800799024)(36860700016)(13003099007)(6133799003)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	z6BC5hJpRaQwZg+mgs6w9fOMv1WmL4pg/NByRSOwIyMoEYeBW1T02avJAmlO9C6FLt4K/YGsH0SBYsTw+WV3TMAkplyYI/KihsbuEu/HJKVsUqmsuetA/ppBceYE37AEe75AvhUErz/3r1PzajeggGOtp/4YI0dQxLQC5ACJSh30qMQ3cRSEpbDVDIt/fy7EnwWYK5vYra+4dp2gw0ceAcpQ3nEbl8jMq6A8zaXdVT4uuDstzZ3Seb6F9ezVE5nNZaJrfbx7F6TwQORwUnSPyEDYQAMEFL46u30/4QyA6Uf6dOBOuD9b+AN6qUUKFpOj8ZcPggFcOyuDpBKeOdE92PqSR6e+3FlJGJcWm+K6RTFHuVxexyJPEDalrMfVoPa4CIP1MwjrXVIcNW7t01syYv/Oe7TJHTasJ7kYfuOIXGyaOmV6HO556ShbyFFjrkw1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 14:11:55.1482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b52762-f6a1-40b7-c1c4-08df13fc7692
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A992.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4175
X-purgate-ID: tlsNG-ebf023/1789567923-C32CCB50-BB0662D9/0/0
X-purgate-type: clean
X-purgate-size: 8152



On 11-Sep-26 14:47, Julian Vetter wrote:
> Now that the toolstack always resolves a concrete GIC_V2 or GIC_V3
> before calling createdomain, nothing on the Xen side needs to resolve
> GIC_NATIVE either:
> 
>  * A new gic_domctl_hw_version() helper returns the
>    XEN_DOMCTL_CONFIG_GIC_* value matching the host's gic_hw_version().
>  * arch_sanitise_domain_config() uses it to validate the requested
>    version against the hardware, rather than resolving GIC_NATIVE and
>    writing the result back into config->arch.gic_version. A guest must
>    use the host's GIC version, except that a GICv3 host with the GICv2
>    compatibility mode enabled may also run GICv2 guests. This is the
>    same information that XEN_SYSCTL_physinfo reports to the toolstack.
>  * create_dom0() and arch_parse_dom0less_node(), which both always want
>    a vGIC that exactly matches the hardware, use the same helper instead
>    of GIC_NATIVE.
> 
> With nothing left resolving or relying on it, drop
> XEN_DOMCTL_CONFIG_GIC_NATIVE from the public ABI. Every caller must now
> request a concrete GIC_V2 or GIC_V3.
> 
> This is an incompatible change for any toolstack still passing 0
> (formerly GIC_NATIVE) expecting Xen to auto-select a version. Add a
> CHANGELOG.md entry, noting that available GIC versions can be queried
> via XEN_SYSCTL_physinfo.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
> Changes in v5:
> - Rename gic_domctl_version() to gic_domctl_hw_version()
> - Accept a GICv2 guest on a GICv3 host with GICv2 compatibility mode
>   enabled, instead of requiring an exact match with the host GIC version
> ---
>  CHANGELOG.md                   |  4 ++++
>  xen/arch/arm/dom0less-build.c  |  3 ++-
>  xen/arch/arm/domain.c          | 27 +++++++++++----------------
>  xen/arch/arm/domain_build.c    |  3 ++-
>  xen/arch/arm/gic.c             | 16 ++++++++++++++++
>  xen/arch/arm/include/asm/gic.h |  6 ++++++
>  xen/include/public/arch-arm.h  |  2 +-
>  7 files changed, 42 insertions(+), 19 deletions(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index aa1a777dd4..78d1b13f3f 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -18,6 +18,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  ### Added
>  
>  ### Removed
> + - On Arm:
> +   - XEN_DOMCTL_CONFIG_GIC_NATIVE has been removed. Toolstacks must now
> +     explicitly request GIC_V2 or GIC_V3 when creating a domain.
> +     Available GIC versions can be queried via XEN_SYSCTL_physinfo.
>   - On x86:
>     - The kexec "v1" interface, which was declared obsolete in Xen 4.4 (2013).
>       The only known user was the classic-xen fork of Linux.  This does not
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 3f48f74226..7bbb2eafb6 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -23,6 +23,7 @@
>  #include <asm/arm64/sve.h>
>  #include <asm/domain_build.h>
>  #include <asm/firmware/sci.h>
> +#include <asm/gic.h>
>  #include <asm/grant_table.h>
>  #include <asm/setup.h>
>  
> @@ -368,7 +369,7 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
>      unsigned int flags = bd->create_flags;
>      uint32_t val;
>  
> -    d_cfg->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
> +    d_cfg->arch.gic_version = gic_domctl_hw_version();
>      d_cfg->flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
>  
>      if ( domu_dt_sci_parse(node, d_cfg) )
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index a739dd157e..6f5f92876e 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -609,23 +609,18 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> -    /* Fill in the native GIC version, passed back to the toolstack. */
> -    if ( config->arch.gic_version == XEN_DOMCTL_CONFIG_GIC_NATIVE )
> +    /*
> +     * A guest can only use the host's GIC version, except that a GICv3 host
> +     * with the GICv2 compatibility mode enabled can also run GICv2 guests.
> +     * This mirrors what XEN_SYSCTL_physinfo reports to the toolstack.
> +     */
> +    if ( config->arch.gic_version != gic_domctl_hw_version() &&
> +         !(config->arch.gic_version == XEN_DOMCTL_CONFIG_GIC_V2 &&
> +           vgic_v2_hw_enabled()) )
>      {
> -        switch ( gic_hw_version() )
> -        {
> -        case GIC_V2:
> -            config->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_V2;
> -            break;
> -
> -        case GIC_V3:
> -            config->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_V3;
> -            break;
> -
> -        default:
> -            ASSERT_UNREACHABLE();
> -            return -EINVAL;
> -        }
> +        dprintk(XENLOG_INFO, "Unsupported GIC version %u\n",
There is a check below for max_vcpus being 0. With this check added, it becomes
dead (unless vgic_max_vcpus() is changed), so add ASSERT_UNREACHABLE() there.

> +                config->arch.gic_version);
> +        return -EINVAL;
>      }
>  
>      /* max_vcpus depends on the GIC version, and Xen's compiled limit. */
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 72d5316180..cf7e1100bd 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -26,6 +26,7 @@
>  #include <xen/warning.h>
>  #include <xen/static-shmem.h>
>  #include <asm/device.h>
> +#include <asm/gic.h>
>  #include <asm/setup.h>
>  #include <asm/tee/tee.h>
>  #include <asm/pci.h>
> @@ -1960,7 +1961,7 @@ void __init create_dom0(void)
>      int rc;
>  
>      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> -    dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
> +    dom0_cfg.arch.gic_version = gic_domctl_hw_version();
>      dom0_cfg.arch.nr_spis = vgic_def_nr_spis();
>      dom0_cfg.arch.tee_type = tee_get_type();
>      dom0_cfg.max_vcpus = dom0_max_vcpus();
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index 078049e741..997b6ee6ed 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -56,6 +56,22 @@ enum gic_version gic_hw_version(void)
>     return gic_hw_ops->info->hw_version;
>  }
>  
> +uint8_t gic_domctl_hw_version(void)
> +{
> +    switch ( gic_hw_version() )
> +    {
> +    case GIC_V2:
> +        return XEN_DOMCTL_CONFIG_GIC_V2;
> +
> +    case GIC_V3:
> +        return XEN_DOMCTL_CONFIG_GIC_V3;
> +
> +    default:
> +        ASSERT_UNREACHABLE();
We should BUG() here instead to protect both builds given that you return just 0
(ASSERT would be ok provided you propagate somehow the error).

> +        return 0;
> +    }
> +}
> +
>  unsigned int gic_number_lines(void)
>  {
>      return gic_hw_ops->info->nr_lines;
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
> index ee2c26adb4..434b888e69 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -262,6 +262,12 @@ DECLARE_PER_CPU(uint64_t, lr_mask);
>  
>  extern enum gic_version gic_hw_version(void);
>  
> +/*
> + * The XEN_DOMCTL_CONFIG_GIC_* value matching the GIC version actually
> + * present on this host.
> + */
> +extern uint8_t gic_domctl_hw_version(void);
No need for extern for prototypes.

> +
>  /* Program the IRQ type into the GIC */
>  void gic_set_irq_type(struct irq_desc *desc, unsigned int type);
>  
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 00de30b896..9d3bf11cbd 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -319,7 +319,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>   * struct xen_arch_domainconfig's ABI is covered by
>   * XEN_DOMCTL_INTERFACE_VERSION.
>   */
> -#define XEN_DOMCTL_CONFIG_GIC_NATIVE    0
> +/*      XEN_DOMCTL_CONFIG_GIC_NATIVE    0 - removed in Xen 4.23 */
You should also update the comment below saying that gic_version is IN only.

Otherwise, LGTM.

~Michal


