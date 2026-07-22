Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73347C44539
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 11:34:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368375.1617770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmVDV-0000QI-22; Wed, 22 Jul 2026 11:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368375.1617770; Wed, 22 Jul 2026 11:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmVDU-0000QB-Vg; Wed, 22 Jul 2026 11:34:24 +0000
Received: by outflank-mailman (input) for mailman id 1368375;
 Wed, 22 Jul 2026 11:34:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wmVDT-0000Q5-U3
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 11:34:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmVDS-0049BJ-Iv
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 13:34:22 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a60aabe-e002-0a2a0a5209dd-0a2a4502a488-0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 13:34:22 +0200
Received: from [52.101.85.10]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a60aabb-6ca4-0a2a45020019-3465550acb63-4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 13:34:21 +0200
Received: from BN0PR04CA0188.namprd04.prod.outlook.com (2603:10b6:408:e9::13)
 by SJ2PR12MB8011.namprd12.prod.outlook.com (2603:10b6:a03:4c8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 11:34:15 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:e9:cafe::53) by BN0PR04CA0188.outlook.office365.com
 (2603:10b6:408:e9::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 11:34:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 11:34:13 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 22 Jul
 2026 06:34:13 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 22 Jul 2026 06:34:12 -0500
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
 b=yy/bCW8cPsnAumDNuiRatWPN0dsTD7Hnd9z+cZVYuj16aH3Kw/Ojsr7ej4/AELPTPPBS/JdpxAbjcvgYMcpzwI2xLlrs03YLkcs3eFTTpVI3CEY+praJQ81JBEn5vNR1/v77z2Esq0Ah1muHa9Q/9glPFHsW2KCw1XWxb0EqGDq5KzN3E5iPjxCsORq6fToNHP+NbzZut2KMhgL7/5fVMOnCNBpofrEZlWKKvhSQ3Iw+NTwp6vlTRnvIp4UnqDrqbKFgzSrjAepdCZAqbEwc/kK/h8th0/9HNjoPYysVCC76zHtrbvLJNzsEJJmTJv8z0kxXE1ggMZb60Gsx2qfVHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PrAISZ80dH/pvJ1z3AFS9sh+RmZbNllugWXlIHQreE=;
 b=TdNCLrdWwG7xvMmxn43Y1hR274HAFN/G4rNpzX/7Q7hk/CNy7X9mLKiZc+K0HLZ7u16NbB7Qxp1sQkFEs8RnauNCiKx/aLZ78U/TfrtuF1cNutb0SstlFH8mdG/xIzyB3Hvm01+JztwfUWLtbEXg4Je54yHwgEcxZ/ymrMIF6dqaU85ENV2oYNZEQfj42a0BdAVTIJU4bTlHwCwBEnJ7WLtxge9uxeezNEORDigosfUdEe/Uua+/9+ll1infNo1w80mgT3JgrycMYe7oyD0N6ixNYo3cPSBG4WY07RROJ3kcBOXCU/mCDWZxWA/ut+m8ruoRHL9kjuikzSbO9jA/4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PrAISZ80dH/pvJ1z3AFS9sh+RmZbNllugWXlIHQreE=;
 b=n+JIfv9LbED6666c060IjUu53hmOGanj5GpRVUH+QRelKX8w87vqePUbshFth3YriZRg02aQGASl4FpA0LQCVJay38wISKUUtKcHD85HxmDfBjob8Ucdm67SlZ00onOth7hN7o8NW6KB1l0jYGj2sPf1h8uSMDAqWBAI0Zy58to=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c7816066-2956-46e4-b25d-8ac358a444df@amd.com>
Date: Wed, 22 Jul 2026 13:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] xen/arm: derive GIC CPU interface ID fields from
 the vGIC
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <ba4f779d68c54efc80c4a566dca38ac2e6f9a073.1783675708.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <ba4f779d68c54efc80c4a566dca38ac2e6f9a073.1783675708.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|SJ2PR12MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: da8d8500-37f0-4f3e-9349-08dee7e52824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|56012099006|10067099003|11063799006|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	D/GCXyqE407hqNbap9UzR5MancuUcSUcv6SKXps6QxpSzgL3K+rf8zd1HMN8p9Loc5ZCJN6+/6pz7gTSkaTRUuHKnpPbUJ20tLBOylQYWH5y/3OUgxQp7+WOaSfSE/KPfe5DZKVB28BtkqIMqBkCB6AYtQjF/NtBJpQzN4coUGAcCXuo/O620/8BEV3HF8fnf76MAZQwWz3nshlDVX2supT+cdCpLafJeHylY+bu9m0Q/Mk12txgJXgeFaBuyJniCtWnWPqly9m4w7KGYIrM7kwEZp/MK7Mm4zI1umiuBsTDyq2MGEKEF5kYPeDfiwDhEeWif65a62i8QK+b1YJrBSul1T+5Iwc7ICqokXBNwq718KsTZAR1mscWIGJ3UXJV0BT+4yQy9wuv2YsPRrbEOGUKoKzqMZ//AtHwfKgxePWB0iJ7iAsJhvj/4xM+0n4+vpEv1hr80PIbH7hP2Yld2Gbd2bCw1NLEvEQrFYHcDuq12Ljh/MzcwL6A/a9sO3yI2feBH7yOp90KRUbNQ0JZHAb+ctnJTTSLBXJJkEs8FPvImb8lveAkd9jT7vuPLdkwQAkkDI/ptYOoGV/J7ZNLgXdY5aqBl3FVEN9thyzcmMy/GYjhhOO/+s5hdk5edcWkPHoDVLgN+9YaOm+N67r53PtsF3tvdPqA9ilYU/MybPXsipPm25j4CKp1mDttLmwcDtik+UgckePyqFFN0vYMvA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(56012099006)(10067099003)(11063799006)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UtHX2EDIn1jrUKxFWjbeSOpkvQfvygnlVpf6zrNtWsQVVHdyddR+gOfEZQlkX2mB98imr/3CrXQkuIEi2z+q+lDFrEt+DagCqSCijoyxqBgezZhcgWOrMykYWSaKRAP3rF/zx8RulHqnR0/EfTUZV2D6yfmex8zslOh3ktxC/AEYhljIQ55usp7Eh8KkRaozecE6W4yxLGIX0fzOL7WQoPAixGcWurWP+XMz3UvtkTUZ1c9UK8nFgL3dteC9klJnOBBsp4ApyR5J0VnihEF1lnp0UmzV/PC4skwISElmitBUYnjrKhoVkoKuCmnIGRWrm396SPCqz20V1sGgxSeenNKryMo5sVqnjkYkP7VsbIqXIYLmA7ZlzOfuwhZSCwlog4no8LdPqzlDaQO+1bL16krcXp6bOwwIEXkabgQ49Kz3RWultgway26oCkEuObnC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 11:34:13.9814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da8d8500-37f0-4f3e-9349-08dee7e52824
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8011
X-purgate-ID: tlsNG-720697/1784720061-F3CBA2AC-3A15DE3C/0/0
X-purgate-type: clean
X-purgate-size: 2820



On 10-Jul-26 11:31, Mykola Kvach wrote:
> Xen exposes ID_AA64PFR0_EL1.GIC and ID_PFR1.GIC from
> domain_cpuinfo, which is initialized from the sanitized host CPU feature
> state. This does not necessarily match the virtual interrupt controller
> configured for a domain.
> 
> On a GICv3 or newer host, a vGICv2 domain can observe a nonzero GIC
> field even though Xen disables EL1 access to the GIC CPU system register
> interface for that domain. On a GICv4.1 host, a vGICv3 domain can
> observe encoding 0b0011, which advertises GICv4.1 CPU interface support
> that Xen's vGICv3 model does not expose.
> 
> Derive both fields from d->arch.vgic.version in every trap path. Expose
> 0b0000 for vGICv2 and 0b0001 for vGICv3. This covers
> ID_AA64PFR0_EL1 and the ID_PFR1_EL1 alias in AArch64 state, as well as
> ID_PFR1 accessed through CP15 in AArch32 state.
> 
> This is consistent with KVM, which derives both ID fields from the
> configured virtual GIC model.
> 
> Fixes: 07b9acea116e ("xen/arm: Add handler for ID registers on arm64")
> Fixes: 8f81064a07c6 ("xen/arm: Add handler for cp15 ID registers")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  xen/arch/arm/arm64/vsysreg.c | 35 ++++++++++++++++++++++++++++++++++-
>  xen/arch/arm/vcpreg.c        | 25 ++++++++++++++++++++++++-
>  2 files changed, 58 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index d14258290f..6b898f13f3 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -21,6 +21,7 @@
>  #include <asm/arm64/cpufeature.h>
>  #include <asm/arm64/sve.h>
>  #include <asm/current.h>
> +#include <asm/gic.h>
>  #include <asm/regs.h>
>  #include <asm/traps.h>
>  #include <asm/vreg.h>
> @@ -79,6 +80,24 @@ TVM_REG(CONTEXTIDR_EL1)
>                                    1, domain_cpuinfo.field.bits[offset]); \
>      }
>  
> +#define ID_REG_GIC_WIDTH 4
> +
> +static unsigned int vgic_id_gic_field(const struct domain *d)
> +{
> +    ASSERT(d->arch.vgic.version == GIC_V2 ||
NIT: Put brackets around individual expressions

> +           d->arch.vgic.version == GIC_V3);
> +
> +    return d->arch.vgic.version == GIC_V3;
> +}
> +
> +static register_t id_reg_set_gic_field(register_t val, unsigned int shift,
> +                                       const struct domain *d)
> +{
> +    register_t mask = GENMASK(shift + ID_REG_GIC_WIDTH - 1, shift);
> +
> +    return (val & ~mask) | ((register_t)vgic_id_gic_field(d) << shift);
> +}
vgic_id_gic_field() and ID_REG_GIC_WIDTH are copied 1:1 into vcpreg.c,
and vcpreg.c open-codes the mask/insert that id_reg_set_gic_field() already
provides. Please factor the shared logic into one place that both files include.

~Michal


