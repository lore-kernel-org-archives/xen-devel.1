Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BB3C5B574
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 07:52:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387986.1629199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wthH9-0002cB-Pz; Tue, 11 Aug 2026 07:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387986.1629199; Tue, 11 Aug 2026 07:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wthH9-0002c4-Mq; Tue, 11 Aug 2026 07:51:55 +0000
Received: by outflank-mailman (input) for mailman id 1387986;
 Tue, 11 Aug 2026 07:51:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wthH7-0002bw-Po
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 07:51:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wthH6-00ABx2-OW
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 09:51:52 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a7ad48c-e002-0a2a0a5209dd-0a2a4507dee8-34
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 09:51:52 +0200
Received: from [40.107.208.22]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a7ad496-b4ea-0a2a45070019-286bd016a725-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 09:51:52 +0200
Received: from DS7PR05CA0064.namprd05.prod.outlook.com (2603:10b6:8:57::26) by
 DS7PR12MB9042.namprd12.prod.outlook.com (2603:10b6:8:ed::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.25; Tue, 11 Aug 2026 07:51:46 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:8:57:cafe::89) by DS7PR05CA0064.outlook.office365.com
 (2603:10b6:8:57::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 07:51:46 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 07:51:46 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 02:51:45 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 02:51:45 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 11 Aug 2026 02:51:44 -0500
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
 b=hAGpHAicgx35TO2oCJekulLCgmf/wFMsEfVlioh0qmPkh+gy8ebIOv156gtxE9r8Qw6PygByrUet6TmaU8r/+dZ3s7kVEjLI7GLCfVwjbn16XGK87QsrmSVAa9xLWIQu0sa+MlHHh0gXhipvHeL3mqty1Ufvw1cuIOESiR6TlntR0xlaixuO3snAaS/PptnTsMxvYZUUl9vgn0LGzzgJPepatYvdqozPJKBFy18G/CeGkR9nhQf1t1tSKgAJGsS2xSs/Dyp5nEbZxMrH2S+V7qgReN92leKjOlL+Q1AgUP2wr56ShZyxBlJXog6J1GCnh38337vg8MoOedGlFQJNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KvQQPPl6ZqEavxPRXLTuVqBYEjVIkVXiIWArdy3D80=;
 b=vxGwvWmVLcJhR8+XDZWUAryNEpvs67JSfpjnCjWh4DNRRXs+kcGtgZULAofXgl9SqzQTTgb/je9+QWHUUBgJnRFZXT5BVByvncidBraIzOoGiqZsIK45A6n0dR0dYd0KbrVWQLCKMSfmMDWl/Ay/kf+7wujWBNjlRM09T0sm0I5bruYtGA9AySpaHPcerEc3TU0aQYBjv+EHFTuF2RVmkmrAjmuCLj0dfIvgv0r8/IEhdtrmqlkAQKm+yyvVOjfs7J4Rwy0ho3P9c6WpW0jESp6SUOYkGeaaoX7EJ/MC2nrP4BXYj7YLxC6ufB0deicRYR+9qPOks2L3Mlse5TojaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KvQQPPl6ZqEavxPRXLTuVqBYEjVIkVXiIWArdy3D80=;
 b=eRYeanvpcLBJIafRtA0qwjh9CK5N3s/lEj90cWpflmtCI/GBgsMJ5mJY9J5SB7rpcdZLCUN4jsaDnqI0gEd1heaOI2Oy/y1dPImZl9DiaoWzBaR/U1+DwV8VRzQcbPU1Qbn0c0CfeF6thG3Nvlxd0MbCgMEb07Yf1/05P3AO0qo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <103a2e50-0391-4bad-b9e7-d00c36c76a54@amd.com>
Date: Tue, 11 Aug 2026 09:51:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: derive GIC CPU interface ID fields from the
 vGIC
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <f46f9e6ebb12d8402fa72b1641796f33e24c539f.1786395761.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <f46f9e6ebb12d8402fa72b1641796f33e24c539f.1786395761.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|DS7PR12MB9042:EE_
X-MS-Office365-Filtering-Correlation-Id: 738f86e0-adbc-487b-f280-08def77d64b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|22082099003|18002099003|5023799004|11063799006|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	mP+vpBqCkBJTfalQ8sZaDuLbemAnVXvf5UvtFMzblCl4tp43cylYiklOJnKlPTtR0s2eC2J02+bnUi0MyZnFpe+oWDkTZwEO5PYhyS6+5qLeJqG8Z7weiX1XymH4ngeXFJ2/IOQwgdGcgpRckhCGFIIjrqx2uPc/Ckl0ACIr2GRQ7EGE6LxCO3h6ZhtmZzGE6xHQ35EbTmjd3/EFlGNMJAELo3fonZSKiJ/Z5jpQXvqPe6T/H+Oc27JcIFpoQgFSZlUXFAe11COm+nVYvEXysTw1Zt7sG3C/TmUWLykhi9pA+BTDuRmRxX92wJsAnKQqNfzD1Yx5yJBZ9Nil2FiCNGyJRsVZtQ/U2MzgRl5hBRuXzxP29PoxOXnyaAra5UGr3u874OKA70BoW+DLXvPJncvJlgfSlzqyS/Xk/tfms91w00um0uO0PfwUqbJS9tSjeE8iEAm4jN5JpYtwL9js5fOCmksiX7KcMJ5QCf44Yf4NdtlITYH67MyDVQdEeFpqiS1GTCL3vKVixcWNvxxPgDom/J7G4NE9NWw4ybUBoblMnFiKMCkw7G0UyB8uOfcsOhYvuth3lcYaopt7CG9nMkH01YsbxpZf3mo638c+d7T5IS9Hu837uVHEPqH9fdrVb3hKfVNtpDB4Klv7zvpziw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HZijFR9DwWWtItdqM+YSi7OVpkPvphzzFaDr7YR05aP1hjtr8ZDZkskxgw/w7asGmp6OVk2EhO4xJBUoOixi5ojg+rqkY2U/2oBnDpYfMHOEy3mYLg2JJR+k10t/RmEy8QdRBAMqPMvXFcEnKf9rDM1WOwa7SYshRbMCKXUvxrcza3bKkX1sqyYxnwHx4SBOWmaXClIRLSegZWKbLy3vr7GJtclp2EyZKT11vw8yoal9xeqDQprTVdGkDhbXokXhYGAQ6N5bHPX/OGi8tzFMDvroEvE39combWn4izX2+4Udu8VQA/WCuy7/RQyJ5m4Blyx322p6/0pohRFgnNOh+xkw2tB/3eAAaRws0RzDJ0TYulRxMjZD448uaAQo98asvj8/hnuSvyLruyvbOo/tTcoOEnwbZ+cjpINWnhVovMa0tTC63jkn5+ZFMTvPKhCT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 07:51:46.5181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 738f86e0-adbc-487b-f280-08def77d64b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9042
X-purgate-ID: tlsNG-ef75cf/1786434712-A46CAAE4-4D7E4F1F/0/0
X-purgate-type: clean
X-purgate-size: 6851



On 10-Aug-26 23:12, Mykola Kvach wrote:
> Xen exposes ID_AA64PFR0_EL1.GIC and ID_PFR1.GIC from domain_cpuinfo,
> which is initialized from the sanitized host CPU feature state. This
> does not necessarily match the virtual interrupt controller configured
> for a domain.
> 
> A vGICv2 domain can therefore observe a nonzero GIC field when the host
> supports the GIC system register interface, even though Xen disables that
> interface for the domain. On a GICv4.1-capable host, a vGICv3 domain can
> observe encoding 0b0011, although Xen exposes only its vGICv3 model.
> 
> Derive the fields from the domain's vGIC version instead. Expose 0b0000
> for vGICv2 and 0b0001 for vGICv3. This covers ID_AA64PFR0_EL1 and the
> ID_PFR1_EL1 alias in AArch64 state, as well as ID_PFR1 accessed through
> CP15 in AArch32 state. Leave the alias unchanged when AArch32 is
> unavailable.
> 
> Fixes: 07b9acea116e ("xen/arm: Add handler for ID registers on arm64")
> Fixes: 8f81064a07c6 ("xen/arm: Add handler for cp15 ID registers")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v2:
> - Share the GIC ID field helpers between the AArch64 and AArch32 paths.
> - Parenthesize the individual ASSERT conditions.
> - Preserve ID_PFR1_EL1.GIC when AArch32 is unavailable.
> - Target master instead of the 4.22 release.
> 
> v1: https://patchew.org/Xen/ba4f779d68c54efc80c4a566dca38ac2e6f9a073.1783675708.git.mykola._5Fkvach@epam.com/
> ---
>  xen/arch/arm/arm64/vsysreg.c    | 18 +++++++++++++++++-
>  xen/arch/arm/include/asm/vreg.h | 20 ++++++++++++++++++++
>  xen/arch/arm/vcpreg.c           | 15 ++++++++++++++-
>  3 files changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index d14258290f..a02ad951f9 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -21,6 +21,7 @@
>  #include <asm/arm64/cpufeature.h>
>  #include <asm/arm64/sve.h>
>  #include <asm/current.h>
> +#include <asm/gic.h>
Stale include? Nothing references gic.h here anymore.

>  #include <asm/regs.h>
>  #include <asm/traps.h>
>  #include <asm/vreg.h>
> @@ -304,7 +305,18 @@ void do_sysreg(struct cpu_user_regs *regs,
>       * to identify the processor features
>       */
>      GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
> -    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
> +    case HSR_SYSREG_ID_PFR1_EL1:
> +    {
> +        register_t guest_reg_value = domain_cpuinfo.pfr32.bits[1];
> +
> +        if ( cpu_feature64_has_el0_32(&domain_cpuinfo) )
> +            guest_reg_value = id_reg_set_gic_field(guest_reg_value,
> +                                                   ID_PFR1_GIC_SHIFT,
> +                                                   v->domain);
> +
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                                  guest_reg_value);
> +    }
>      GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
>      GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
>      GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
> @@ -343,6 +355,10 @@ void do_sysreg(struct cpu_user_regs *regs,
>              guest_reg_value |= (sysval << ID_AA64PFR0_SVE_SHIFT) & mask;
>          }
>  
> +        guest_reg_value = id_reg_set_gic_field(guest_reg_value,
> +                                               ID_AA64PFR0_GIC_SHIFT,
> +                                               v->domain);
> +
>          return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
>                                    guest_reg_value);
>      }
> diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
> index 387ce76e7e..24735aaea1 100644
> --- a/xen/arch/arm/include/asm/vreg.h
> +++ b/xen/arch/arm/include/asm/vreg.h
> @@ -9,6 +9,26 @@ typedef bool (*vreg_reg64_fn_t)(struct cpu_user_regs *regs, uint64_t *r,
>  typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs, register_t *r,
>                                     bool read);
>  
> +#define ID_REG_GIC_WIDTH 4
> +
> +static inline unsigned int vgic_id_gic_field(const struct domain *d)
> +{
> +    ASSERT((d->arch.vgic.version == GIC_V2) ||
> +           (d->arch.vgic.version == GIC_V3));
> +
> +    return d->arch.vgic.version == GIC_V3;
> +}
> +
> +static inline register_t id_reg_set_gic_field(register_t val,
> +                                               unsigned int shift,
> +                                               const struct domain *d)
These two are incorrectly indented (off by one to the right).

> +{
> +    register_t mask = GENMASK(shift + ID_REG_GIC_WIDTH - 1, shift);
> +
> +    return (val & ~mask) |
> +           ((register_t)vgic_id_gic_field(d) << shift);
Incorrect indentation: continuation line should be indented +1

> +}
vreg.h does not include any header, so please add appropriate headers for
objects you are adding.

> +
>  static inline bool vreg_emulate_cp32(struct cpu_user_regs *regs, union hsr hsr,
>                                       vreg_reg_fn_t fn)
>  {
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index e7c484f2c1..d6f9326b71 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -12,6 +12,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/cpregs.h>
>  #include <asm/current.h>
> +#include <asm/gic.h>
>  #include <asm/regs.h>
>  #include <asm/traps.h>
>  #include <asm/vreg.h>
> @@ -173,6 +174,8 @@ TVM_REG32(CONTEXTIDR, CONTEXTIDR_EL1)
>                                    domain_cpuinfo.field.bits[offset]);\
>      }
>  
> +#define ID_PFR1_GIC_SHIFT 28
Move this to cpregs.h and remove one from arm64/sysregs.h to avoid duplicate
entries.

~Michal

> +
>  /* helper to define cases for all registers for one CRm value */
>  #define HSR_CPREG32_TID3_CASES(REG)     case HSR_CPREG32(p15,0,c0,REG,0): \
>                                          case HSR_CPREG32(p15,0,c0,REG,1): \
> @@ -321,7 +324,17 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>       * to identify the processor features
>       */
>      GENERATE_TID3_INFO(ID_PFR0, pfr32, 0)
> -    GENERATE_TID3_INFO(ID_PFR1, pfr32, 1)
> +    case HSR_CPREG32(ID_PFR1):
> +    {
> +        register_t guest_reg_value = domain_cpuinfo.pfr32.bits[1];
> +
> +        guest_reg_value = id_reg_set_gic_field(guest_reg_value,
> +                                               ID_PFR1_GIC_SHIFT,
> +                                               v->domain);
> +
> +        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1,
> +                                  guest_reg_value);
> +    }
>      GENERATE_TID3_INFO(ID_PFR2, pfr32, 2)
>      GENERATE_TID3_INFO(ID_DFR0, dbg32, 0)
>      GENERATE_TID3_INFO(ID_DFR1, dbg32, 1)


