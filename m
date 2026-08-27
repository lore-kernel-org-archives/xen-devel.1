Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56772C61DC7
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 09:54:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400525.1636186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWnz-0001a6-CG; Thu, 27 Aug 2026 09:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400525.1636186; Thu, 27 Aug 2026 09:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWnz-0001Zz-84; Thu, 27 Aug 2026 09:53:55 +0000
Received: by outflank-mailman (input) for mailman id 1400525;
 Thu, 27 Aug 2026 09:53:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wzWnx-0001Zt-IB
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 09:53:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzWnw-00Aqn7-V7
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 11:53:52 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a90092d-8faa-0a2a0a5109dd-0a2a4503b7cc-10
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:53:52 +0200
Received: from [52.101.46.51]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a90092e-fae8-0a2a45030019-34652e33c6a9-4
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:53:52 +0200
Received: from IA1P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::13)
 by PH7PR12MB7258.namprd12.prod.outlook.com (2603:10b6:510:206::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 09:53:40 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:208:464:cafe::9) by IA1P220CA0020.outlook.office365.com
 (2603:10b6:208:464::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.9 via Frontend Transport; Thu, 27
 Aug 2026 09:53:39 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 27 Aug 2026 09:53:39 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 04:53:39 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 04:53:36 -0500
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
 b=ZZeE7Q8IEF5Ctz+9xNDm0jcXmzKDLj2Hw84P6bBzYH9lYB9TGxFzAFv7PDrkFvj945RJrS5YDaVBBhI0ZkTrh+UHgW4sTB5o1WgTMSTYpQP8xVwZezx5sBJD4QC2dEc+LmEgn/2GljyjAhzgKWCBM3X+gzKmlQX1g1H3vviRNMbaWZVUXNIAnGDWNewzYD9I8R8073P63c4JZp+XRK3aHsteZalm6DNRbOCrucFj42IdmIq0fnhtpUFyFXCr532RrBvNjOqmsJurQzQ4y/lFhsKAv2yx1q4QjTgPyQNVNdifIp8ql7nHAbvAL1rEoNR2+NWrt1vW30mzVfcay7xnZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r24cShevZoiwAPq94XAE5C0fCywcD+cnxHSXfZpm9UM=;
 b=yrfX9KdWelwLFTn2V2VWKeYdkgIRX0JgB6V2RNppANE82De93dOTuWlJrjN/hfFtZ+BynRsnvpMAxbkLA/dNpZx1BsNdaj7FLiHIe/mbAsykvfCFknO9ZR5Ml43+aM7ME4kjJrik4B/y3oS6n2MVaKsPp51Hnt+i/41q2BJfAl+yyDHjAZ2MCsgoDi2NI45iCC5C7+xRH3lKc7LIP0M3esChJ+UDFeI8C3VxIVUBjf0sxP5EM0v6DoY6LZCwqqplGqYNsY8ixUtQYWibnIc6Z50KwzW3l2JugbMeNqka8b9jfvWkjhjlB41Bx0AhGGw/5wPtDbv/Tyxc8QQfTNyszg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r24cShevZoiwAPq94XAE5C0fCywcD+cnxHSXfZpm9UM=;
 b=5UCRa+sVZkItbwrkwuJSlO9wANZrRQoKWU/+kl2hpcjDU/eobH+JYugVohEG1xTmqgkbBaduzlWS4Q4euwzI1co9DGn2XkBAxbUY/3+wgAR+Tip+FbX9WXBni2MkyuGqCFFbs0G/ttRn4xXja5KSL2XgLLNHCUuPDjgZMBhEcXo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <1dd99dc8-2dd4-4603-912b-74ec94671ce0@amd.com>
Date: Thu, 27 Aug 2026 11:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] xen/arm: remove XEN_DOMCTL_CONFIG_GIC_NATIVE from
 the ABI
To: Julian Vetter <julian.vetter@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>, Guillaume Thouvenin
	<guillaume.thouvenin@vates.tech>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260820123805.2033085-1-julian.vetter@vates.tech>
 <20260820124016.2033421-1-julian.vetter@vates.tech>
 <1787229624.8631fc262581453bbf619ec5b2062170.1a01f2fd9fb000c4f3@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1787229624.8631fc262581453bbf619ec5b2062170.1a01f2fd9fb000c4f3@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|PH7PR12MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 303a1e44-c62c-4029-c154-08df0421125c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|23010399003|36860700016|10067099003|6133799003|22082099003|18002099003|11063799006|5023799004|4143699003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	HNhY3nXIRCMoqFS+MfSt+P1IdKEcpo8CIBMFMrOxgJxhboe6g7Yc8BrvoeEAq2tUpQwwfjgFtaTEO2LkqvHZhNzXuz14AmuiYzSHjhdG0yzfkOCCdVNOXylO9z9D1uhA1HbVMgsrX/4i3wI7szgZm1Tr982Q12aLTYCrzqWJHDBmY5o0Km5ZwkjMFBSIqGvggM3GR/IrLeLdqRx6NgMyg4a/l8Fx3k9UAtK7JwmSme4hYjKG1SJplH2zIij7xAS7XP9KtEz5KWU/aWZoPGmgU8hRYlZmhFCt9n5PHtrNMaVncmTPRRyoRqsV5qwriDGKxJaDacqEfbqHDiUqXs570vMa4sKCplvu509Psj08RSd5BYqemg5irZCy8w9kOLV23+kVAvm5QRFIawAtjkrqhQ3++p9/g7Zw3vjFDiPdJIt+a/bUkDH9RGKcBmGMxRZyeWQ6oZ5o4LUWi5BVG98eHbJYpHRr1+RVW/X3yniO3yZwzLhE4FwB8/sg0wRc/ucWCYw5Cmhau3SpW2TDd8N2Jc/ydwHUI7QqsDI60aETjXM+hYYJfRzkW/2Vi+OfyhB2B8sr/6gvS0tiedTFb4+mAZ46BFXkULhpfcNxu0v7O4h5/qDNggjTEujU0TxMHG6fObuGL+K3qlq+l2gBSehVxA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(23010399003)(36860700016)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(5023799004)(4143699003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D2Wopvy4n2eec1F2t5ZOQEezh6G7D8xvGNh8obXaPnvtEwu3HLKw/WvgOyQDXplxJDx2pSP2RO2JkS4JKcO+Q3HZ6E36uQ4/tpweH0r/vMfJgszRtVof6wOXu/hy5EkLnlosZrUVys/2Ssrj31+JkSV+rZSMVmvZfhJZqEYaQ1wOUsMnikvEwIeNEhcSdaED8vhxQBp8QHiO6ZqG3Ub7gJNelrvTBlbL5bE9ghOI+0pssTo86Fy9ze9Neza80SqxyfFXfTNRchRqT7nf0L2xNBVJhZZE0B9mDKtWYJ17VkTg2WBF7vAXP16pxdUj8eVrhyTCs1a0vvyiy1iV2+E9wgUGEXbzVy+ltivuMkjKxlrJ6h6cDqF2igBj22ln7ZMhYn9od7s8Z4GqbqktisGTjOBygEDh+kBG9tDRd9DYItEDcJjqfQuEWX4acMAdLELX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 09:53:39.7954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 303a1e44-c62c-4029-c154-08df0421125c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7258
X-purgate-ID: tlsNG-33051d/1787824432-75A814E9-E0720815/0/0
X-purgate-type: clean
X-purgate-size: 8436



On 20-Aug-26 14:40, Julian Vetter wrote:
> Now that the toolstack always resolves a concrete GIC_V2 or GIC_V3
> before calling createdomain, nothing on the Xen side needs to resolve
> GIC_NATIVE either:
> 
>  * A new gic_domctl_version() helper returns the XEN_DOMCTL_CONFIG_GIC_*
>    value matching the host's gic_hw_version().
>  * arch_sanitise_domain_config() uses it to validate that the requested
>    version is compatible with the hardware, rather than resolving
>    GIC_NATIVE and writing the result back into config->arch.gic_version.
>    There's currently no support to run a guest on a GIC version other
>    than the host's, so this is just an equality check.
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
> Changes in v4:
> - Don't bump XEN_DOMCTL_INTERFACE_VERSION for this: it's an API change,
>   not an ABI one. Leave a comment marking XEN_DOMCTL_CONFIG_GIC_NATIVE
>   as removed instead, and mention in the CHANGELOG.md entry that
>   available GIC versions can be queried via XEN_SYSCTL_physinfo
> - Simplify comment above the GIC version check
> - Report requested GIC version in the "Unsupported GIC version" print
> ---
>  CHANGELOG.md                   |  4 ++++
>  xen/arch/arm/dom0less-build.c  |  3 ++-
>  xen/arch/arm/domain.c          | 24 ++++++++----------------
>  xen/arch/arm/domain_build.c    |  3 ++-
>  xen/arch/arm/gic.c             | 16 ++++++++++++++++
>  xen/arch/arm/include/asm/gic.h |  6 ++++++
>  xen/include/public/arch-arm.h  |  2 +-
>  7 files changed, 39 insertions(+), 19 deletions(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 356be88351..5dfa242030 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -13,6 +13,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
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
> index 3f48f74226..5b01843db4 100644
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
> +    d_cfg->arch.gic_version = gic_domctl_version();
>      d_cfg->flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
>  
>      if ( domu_dt_sci_parse(node, d_cfg) )
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index baa3a5d708..94f8f077e9 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -609,23 +609,15 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> -    /* Fill in the native GIC version, passed back to the toolstack. */
> -    if ( config->arch.gic_version == XEN_DOMCTL_CONFIG_GIC_NATIVE )
> +    /*
> +     * There's currently no support to run a guest on a GIC version other
> +     * than the host's.
> +     */
> +    if ( config->arch.gic_version != gic_domctl_version() )
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
> +                config->arch.gic_version);
> +        return -EINVAL;
>      }
I don't understand. How are you going to support a rightful request (supported
today) for a vGICv2 on a host GICv3 that supports GICv2 by legacy mode? Your
previous patches already expose this configuration via sysctl. We should allow
it and in `arch_sanitise_domain_config()` Xen should just check if the passed
domctl GIC version is indeed supported.

At this point I also realized that your previous patch only uses sysctl
information if no GIC version was selected by the guest. I think it would be
better for the toolstack to read it also when the version is explicitly selected
to allow a faster failure not requiring the trip to Xen.

>  
>      /* max_vcpus depends on the GIC version, and Xen's compiled limit. */
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 72d5316180..cd9509d7b9 100644
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
> +    dom0_cfg.arch.gic_version = gic_domctl_version();
>      dom0_cfg.arch.nr_spis = vgic_def_nr_spis();
>      dom0_cfg.arch.tee_type = tee_get_type();
>      dom0_cfg.max_vcpus = dom0_max_vcpus();
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index ee75258fc3..fc55a65159 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -56,6 +56,22 @@ enum gic_version gic_hw_version(void)
>     return gic_hw_ops->info->hw_version;
>  }
>  
> +uint8_t gic_domctl_version(void)
`gic_domctl_hw_version()` would be a better fit to clearly denote that it
returns the HW version translated to domctl field.

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
> +        return 0;
> +    }
> +}
> +
>  unsigned int gic_number_lines(void)
>  {
>      return gic_hw_ops->info->nr_lines;
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
> index ff22dea40d..de6eabfadd 100644
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
> +extern uint8_t gic_domctl_version(void);
> +
>  /* Program the IRQ type into the GIC */
>  void gic_set_irq_type(struct irq_desc *desc, unsigned int type);
>  
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 7d6f87e8b2..e95fa33eb7 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -319,7 +319,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>   * struct xen_arch_domainconfig's ABI is covered by
>   * XEN_DOMCTL_INTERFACE_VERSION.
>   */
> -#define XEN_DOMCTL_CONFIG_GIC_NATIVE    0
> +/*      XEN_DOMCTL_CONFIG_GIC_NATIVE    0 - removed in Xen 4.23 */
>  #define XEN_DOMCTL_CONFIG_GIC_V2        1
>  #define XEN_DOMCTL_CONFIG_GIC_V3        2
>  

~Michal


