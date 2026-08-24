Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836B6C5DF9B
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 13:20:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398851.1635094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyUaT-0004Du-G4; Mon, 24 Aug 2026 13:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398851.1635094; Mon, 24 Aug 2026 13:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyUaT-0004Dn-CI; Mon, 24 Aug 2026 13:19:41 +0000
Received: by outflank-mailman (input) for mailman id 1398851;
 Mon, 24 Aug 2026 13:19:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wyUaS-0004Dh-0l
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 13:19:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyUaQ-0086Cw-VU
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 15:19:38 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8c44e9-bab6-0a2a0a5309dd-0a2a45028644-8
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 15:19:38 +0200
Received: from [52.101.62.47]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8c44e7-6ca4-0a2a45020019-34653e2f4578-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 15:19:37 +0200
Received: from BN9PR03CA0097.namprd03.prod.outlook.com (2603:10b6:408:fd::12)
 by IA0PR12MB7508.namprd12.prod.outlook.com (2603:10b6:208:440::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 13:19:27 +0000
Received: from BN5PEPF0004698A.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::70) by BN9PR03CA0097.outlook.office365.com
 (2603:10b6:408:fd::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Mon,
 24 Aug 2026 13:19:27 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN5PEPF0004698A.mail.protection.outlook.com (10.167.245.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Mon, 24 Aug 2026 13:19:27 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 24 Aug
 2026 08:19:24 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 24 Aug
 2026 08:19:24 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 24 Aug 2026 08:19:20 -0500
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
 b=oxRW0hxsqeikSE7j27zkfLhT94tWEidMzvqjvHotzdwxP5NmsJKe+/hfZdOZ59DzMAimgQ4nZZ+J15k8z5CQnrfoyKG+y7w78Tg/PZY0hBzTzxRBEQYqey6RsgrzfXa5MoJ3iVSUlpAxtg0FfpShMRcRDJ96R+gEL8XTSzKV/UgKk8ZnGmi5DcsVghmlwuwGTWjsSYvChKlTBDs6HQSN0u2Dcym/oNxcRAe/g8a4Ycxugpw013blnkB7l6BIkIIjDr8PLyQNJvM/U3G/b13Doj0qJGL9u9jqGG3jKdg67Rsg/d2uao1QiLhgbVzLHzztnHjWReMU4zgDw+DFGpidKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHemzan3hfP0kv9onMwiDOzs2QriJhywKMlRpZFPbbM=;
 b=CnCGu7yj/wdSeFM44UuFvDLVXOZGatia4R1T6U7jB+kxQsyuEm6kpZYdRXAhsvMLr/lzRCoaQmRIyoROLSEMhA6e/0KjN37L0Iq93qM9wUEGwm0eqzE/XuDgmfvbxFAJ+kioESJE54+1GOXuGPMXzR/PFnNed95I+F4VtPq6ps+jz02wWSUkB6tNxioHMBUUziU+o7sWfY+1wv+mmYRs2VIP3dJufHNZG0uAhLHAohVgWCvoivjEAtDx3Sfw6woQRpV3uJF8b6TH88QT/BmUPMQnfUkhx9SAjiquuUUmR2+45PlXEoQRAAGkdyE/JFkykQ0gY3iftTl2vw4arThsTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHemzan3hfP0kv9onMwiDOzs2QriJhywKMlRpZFPbbM=;
 b=YTqOyPbtVeBTGxYpEBLfHtVhkCQcnwS2+dGpDAOk4xIqir+vYCP9MUEeAgJUiaxJCG2fI0uxlg7e9mxfzkrK42YbPYUk/Y/FC0SZwAE8UR18Tw1M8RM1PjKIsh6LNPpBFdgZFXFbaqAO3gEOvUhnW3U10fbfMN16FbddeqdTR9Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <7a917d2f-eef2-4cad-a4ac-759b6ef3cbc9@amd.com>
Date: Mon, 24 Aug 2026 15:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] ARM/sysctl: Expose the supported guest GIC modes
 in physinfo
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
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260820123805.2033085-1-julian.vetter@vates.tech>
 <20260820124016.2033421-1-julian.vetter@vates.tech>
 <1787229623.8631fc262581453bbf619ec5b2062170.1a01f2fd64f000c4f3@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1787229623.8631fc262581453bbf619ec5b2062170.1a01f2fd64f000c4f3@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698A:EE_|IA0PR12MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: 848b0db6-76e8-441f-737f-08df01e252a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|23010399003|82310400026|6133799003|10067099003|56012099006|11063799006|5023799004|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6I06Mr4YJhucNM/xM03m7QDLj5qh/Sk60yGhlL6yvgiELm2HBySX/R+ar3H3nvfbdwXRsgXwrKXX+WXyRbjnRYSjNnjkRb0NdB8NNgmFjDA9qzbHZOji/9CLAjlwR6JaJ/rjI2gOMGooUn208LcW5cuEBIXZz3BWm/7nIxNIgHR5355oMd0738auDfOkd1sFmSf2CUAplPiWgRNw51cyIUswJ9GYN8ngWJzOUzRIjZcSw9VHVI446RLzRKyo8Aod7g2NnTJ8kt04qwY3I2BN4ZxZSZoTh9YagcLoh+WCOELuasrX+KwkSV7cSxzyFyOmmLPQU7kxsLxHMjtXZmWPGSXutum9CvhGup5BazrTMZqi2rdBlcT8al+6MUQX1v6t+s9IIkD1cr6CGIqjpnrrtoX8vkoVkf3Js9Gf3BA0MmxzUGhStw/xT6fBiK1RJtxRQzJy2CRDrDOFGL+MUYyseI9mXap1hcruGgr51uaUQRjyOD+ARIo9MCOqKcgJMhvpP8x1MyiOuKnuAmjasTU96+ifdSk9iVmMOvce3iyOLq3srHV1sOJnQjLWcJh6W+5BoCnSZis1ja1HJuv6AhNQkxxhhzPrN5hqu9p6gyEfpwshB7tt9mG71NboyhEWlJY3KBJcMzJ8XwHEGeaZsMgNKCyFtQAQGXe44DQHKFAVKM10bKGr/FfKWrx3leKkcqi9lbp7fGDXAJH6OchuvYUNig==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(23010399003)(82310400026)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2Yq+MZ/yLfTu1ZIIMXFkY3i+VSgposSr+klqLMz9sPBRjzJ+f78oRNYQWAA/HVetfM8l1BB1sX+qqi4Y9qxnApTAO/fk0nvnYm5Zp0jH5cXl8uZNlmUkcKrDGugHav+lm1YbH3+szR8Wrct0lWE2XNtq63NywTtTs+ifc+tMB/OXQrYdy+Jrs+qEmsM0fumA2tsET3YanO+L1ILeg4TftGot+6ZW78nLHNPeTK6l9lEJbOeK103BQ0bDDy2I4RtCwyqG76SSkkJ7ZtLrVsgWmQM63ro8ZpVXXPbVzZ7exbjDCiX/OJFZ71/PfQ4C47L614v3DNWmh6TBSxvs9BH+KoIx7pqREOV82r1zfbo9vJh2eiButY6O48x4FH5enDfv45ECi8hPir4rhkz9jhQAoTG6t5dLRSSvlg4q19/px82EDy+K+nNMeYADswEQixfU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 13:19:27.0481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 848b0db6-76e8-441f-737f-08df01e252a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF0004698A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7508
X-purgate-ID: tlsNG-720697/1787577577-313CC2AC-9FD5C06C/0/0
X-purgate-type: clean
X-purgate-size: 4058



On 20-Aug-26 14:40, Julian Vetter wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> In preparation to simplify the domain creation logic surrounding GIC
> version.
> 
> On a GICv3 host, also report support for GICv2-compatible guests when
> the hardware's vGICv2 compatibility mode is enabled, rather than just
> the native GIC version.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
> Changes in v4:
> - Report GICv2 support when a GICv3 host has vGICv2 compatibility mode
>   enabled
> - Add ASSERT_UNREACHABLE() for the GIC_INVALID case
> - Fix a typo in a comment
> ---
>  xen/arch/arm/include/asm/vgic.h |  6 ++++++
>  xen/arch/arm/sysctl.c           | 34 +++++++++++++++++++++++++++++++++
>  xen/arch/arm/vgic-v2.c          |  5 +++++
>  xen/include/public/sysctl.h     |  2 ++
>  4 files changed, 47 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index 6f9ab1c98c..26c53aaf3c 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -433,6 +433,12 @@ unsigned int vgic_max_vcpus(unsigned int domctl_vgic_version);
>  void vgic_v2_setup_hw(paddr_t dbase, paddr_t cbase, paddr_t csize,
>                        paddr_t vbase, uint32_t aliased_offset);
>  
> +#ifdef CONFIG_VGICV2
> +bool vgic_v2_hw_enabled(void);
> +#else
> +static inline bool vgic_v2_hw_enabled(void) { return false; }
> +#endif
> +
>  #ifdef CONFIG_GICV3
>  struct rdist_region;
>  void vgic_v3_setup_hw(paddr_t dbase,
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index 32cab4feff..8411deb7e2 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -12,7 +12,11 @@
>  #include <xen/dt-overlay.h>
>  #include <xen/errno.h>
>  #include <xen/hypercall.h>
> +
>  #include <asm/arm64/sve.h>
> +#include <asm/gic.h>
> +#include <asm/vgic.h>
> +
>  #include <public/sysctl.h>
>  
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
> @@ -21,6 +25,36 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  
>      pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
>                                         XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
> +
> +    /*
> +     * The GIC version(s) we're happy creating guests with. Right now for
> +     * simplicity it is tied to the active hardware version, but this will
> +     * cease to be the case if/when the compatibility modes are enabled.
> +     */
> +    switch ( gic_hw_version() )
> +    {
> +    case GIC_V2:
> +        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_ARM_GIC_V2;
> +        break;
> +
> +    case GIC_V3:
> +        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_ARM_GIC_V3;
> +
> +        /* GICv3 may additionally support GICv2-compatible guests. */
> +        if ( vgic_v2_hw_enabled() )
> +            pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_ARM_GIC_V2;
> +        break;
> +
> +    case GIC_INVALID:
> +        /*
> +         * Running a control domain without having the GIC sorted yet?
> +         * Something's broken, but there's nothing we can do about it here.
> +         */
> +        ASSERT_UNREACHABLE();
> +        printk_once(XENLOG_ERR "Unrecognised GIC version %d\n",
> +                    gic_hw_version());
> +        break;
> +    }
>  }
>  
>  long arch_do_sysctl(struct xen_sysctl *sysctl,
> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> index 642407fd5b..5d758dd93b 100644
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -49,6 +49,11 @@ void vgic_v2_setup_hw(paddr_t dbase, paddr_t cbase, paddr_t csize,
>      vgic_v2_hw.aliased_offset = aliased_offset;
>  }
>  
> +bool vgic_v2_hw_enabled(void)
> +{
> +    return vgic_v2_hw.enabled;
> +}
There are two implementations of vgicv2 - the "old" default one and a new one
gated by CONFIG_NEW_VGIC. You need to also add this helper to the latter one.

~Michal


