Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C89C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 11:20:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428689.1651583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8yXg-0006a7-28; Tue, 22 Sep 2026 11:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428689.1651583; Tue, 22 Sep 2026 11:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8yXf-0006a0-VZ; Tue, 22 Sep 2026 11:20:07 +0000
Received: by outflank-mailman (input) for mailman id 1428689;
 Tue, 22 Sep 2026 11:20:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x8yXe-0006Tn-AL
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 11:20:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8yXd-007cZi-NP
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:20:05 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab26460-bab6-0a2a0a5309dd-0a2a450ccd5c-8
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:20:05 +0200
Received: from [40.107.200.25]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab26464-f479-0a2a450c0019-286bc81968a4-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:20:05 +0200
Received: from IA4P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::9)
 by DM4PR12MB5745.namprd12.prod.outlook.com (2603:10b6:8:5c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Tue, 22 Sep 2026 11:20:00 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:208:558:cafe::6e) by IA4P220CA0005.outlook.office365.com
 (2603:10b6:208:558::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 11:20:00 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Tue, 22 Sep 2026 11:19:59 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 06:19:59 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 06:19:59 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 22 Sep 2026 06:19:58 -0500
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
 b=ydP17yeqhob6vACnQpPrDMAYuXl4mTD/sjzbT9RIGvOjsNzTeWjiZIPj5pF9a4l67AVoOz4NmTwYKojJfBbIzahqOVWIFarhPMfNCG+udjQdFCyEG9IHyyeHZEhwwpRHCM8FtkccIc7R6k7WcK9SRtiOPPjomrc+1MfW8G4kpg6tPcCpeIE4NpeHvhc//BWA5QoLMRuIEaCRxUSPACMWRmOtnWaUo8/HBoD4x/CK+B5x9aB0REckBgHYIkN6E7cPo9XgBc4yZj9VYoE/0VwTYJ47KAKOM+yjqZIl/RDgEWAiavpusFj6x+lFTt0PrEii407KEkUMlC0/fzSBxySBag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQxk49AgEydZFEzS/37FzXkLZAyO0irbvK0oJ835BtQ=;
 b=Mm+XoZZqlGqHLlhHcVyBJq0IvxSjeUNoc7VkCcEiKLeW2mxYsqDpCsaxB6yh66Te0B48xgzUcJh/uU5ECMPLlEpjWVNGx3f4/HFAwdSzaF27FqogfK7EBgD+pXifrCTsDA0/hJwsSrl1UBz4jcZw5/rodAgq9/R8ROmNmLU5ssD8aRGYF17yut+QIXx4GxKCQf1SdvBESbAfQgDmz/kb3fixOVgSZjuo9BOvVens7mGQ0obXIdc34CF01r2YTjIK2PpE05Bu4+ufDo1/Hvpwt/w++ueePAEEzO3yqcNyZL3wSszC7mdUYi/UOygqJdaVpHRwQ/JKaM2F+FPzgnqDWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQxk49AgEydZFEzS/37FzXkLZAyO0irbvK0oJ835BtQ=;
 b=GXMXdPHO4IvVDeb6Zbu6w2LzfJyBumqDTcjp584NC/1sPVvaM3dWQAKjNNJTDG3mVm2EO6sr6O/hRYQDd716DjBXG3h6vIuxv2RftMo1T+1rJ79oIuu54GanuUn06NsyNFKiumMHgFpkicFiz5WpJYcFF0ZbEztTZN1S2IdisgA=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <52255065-80db-4dae-8406-b1f75614ef9a@amd.com>
Date: Tue, 22 Sep 2026 13:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] xen/arm: make is_espi() a pure range predicate
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1790056623.git.mykola_kvach@epam.com>
 <802ae2dd44556a292d98f1d52d3c88ce4fa5034b.1790056623.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <802ae2dd44556a292d98f1d52d3c88ce4fa5034b.1790056623.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|DM4PR12MB5745:EE_
X-MS-Office365-Filtering-Correlation-Id: a411d755-478a-41a7-d34d-08df189b70ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	URgQ9SIIX+R4jdCxYmvRf/5iqxGEI9gKCMUpcyznXvERe6jjhLSeq5qJFGfr1moKD5qd+yiaO0bs43gGOOBzmfpQb7Wew7fWwKNLGIXcqiLNCRrXzT6Ur71GqxzAS4uhna/02xOLqufelQPDaP5jC8Z1sQU97/4h86/ZP9Wc7m/NBYhO18/O2uzY5XkJFfaPvvbTEjJkcv9d3veHP5c/HnTgkx5s4zWoY2UBJp9fkbntVVqfCriRxaAaB8nLQj1NRwvj54+++uWbxocdGooJrzQtOszqvLifNxdi8UraqPNYB3LJS1KIQ0PxxN5jeHhvDI4qCkpQumZ5VpgPz4W4KIVGNjEZDg6/7rV4RPUOdDYRqT8m/gpwYgQBJ3Fn+Bbdk3ok8UrNF+C+nr+eblwbt/R084cTppWQDXKHM0vuLyv+6HGc1hX9TgH1P0H0bpUS0QosrEm0SaLP/hkmJ7eTLKu+uWfolGfuR8kjaGiztnrl8rq1PN/M0nOpET3Qp/k0VUq6IB4Lcq5qT+KcMzF8MEfxYdXa2OweVkqo6Xng45A8Xu99+UIvpLFqDgLVlc5foRwkaneIW/iYA2hMLm87EEh4uobx9/rWDr0xlaCULLrrAkmCtNHris3xxNs1IrwNn36XqXZq9ki3gvNsMI0BvluXQc54o+O8zaVbO9lK9qj6aGRO8aIamzFESEem2kgerHgIwcriJzDpbVtTjj4BJA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ML4dYkPBH5uvU/NtvIAtZSHlLH3pP3hTpizbNrcfjEjiAnbHfsprPBEvfPHHSW+kTqa/M5eN1lfiXD0M2n8zeIGm/10GiKrLx+ljnSZWdDA5EcheU5d3oeN2bf5uIyfMQfyutXc5UzgW9nriDXsj+LKNCLzWqo6tEvSZsr47V0ZNmK7ngCqywxODKNng0WR+fAJypCA2wgRKoAsf2gpM0DTvomG25rF6hFUPjsJ5e4xCeBY12MQ5HG7dxZjbHxDQZCJQKErkNuyuqA9AiPOyVzg2fhTiARv9Ht1yNLzFPxp0OtItGPNkztUbbh0tPerutUod4DjFHMFuJlSRu/OLM0pnaFTptmE5l2Ms3/XsUYTHO9tFC4mlssQoDDMgeaZaxVQDqFWjZUYDxdCNE6638yDHNeK3s/i0S3UVHNXYeoGHG/eMLBikeVMRmG5av0/z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 11:19:59.9731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a411d755-478a-41a7-d34d-08df189b70ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5745
X-purgate-ID: tlsNG-d25034/1790076005-50F3BA5B-8C30C127/0/0
X-purgate-type: clean
X-purgate-size: 4849



On 22-Sep-26 08:39, Mykola Kvach wrote:
> is_espi() currently changes its result according to CONFIG_GICV3_ESPI.
> Without eSPI support, it returns false, and its assertion fails if
> an eSPI INTID is passed. Callers therefore use it both to identify
> eSPIs and to exclude eSPI handling when support is disabled.
> 
> Make is_espi() report only whether an INTID is in the architectural
> eSPI range. Check for eSPI support at the call sites.
> 
> Use BUG_ON() if the GIC reports an eSPI without compiled-in support,
> matching the handling of unsupported LPIs. Return NULL from
> spi_to_pending() for an eSPI when support is disabled, using an
> espi_to_pending() stub.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v4:
> - Clarify the existing is_espi() behavior in the commit message.
> - Drop the unrelated blank-line removal in vgic.c.
> - Use BUG_ON() if the GIC reports an eSPI without eSPI support.
> - Drop the redundant CONFIG_GICV3_ESPI check in IRQ dispatch.
> - Return NULL for virtual eSPI lookup when eSPI support is disabled.
> 
> Changes in v3:
> - New preparatory cleanup requested during review.
> ---
>  xen/arch/arm/gic.c             |  2 ++
>  xen/arch/arm/include/asm/irq.h | 11 -----------
>  xen/arch/arm/vgic.c            | 30 ++++++++++++++++--------------
>  3 files changed, 18 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index 078049e741..3a7f972826 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -348,6 +348,8 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_fiq)
>          /* Reading IRQ will ACK it */
>          irq = gic_hw_ops->read_irq();
>  
> +        BUG_ON(!IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq));
Usually BUG() should come with a comment explaining why we cannot continue. Here
it's that without config enabled, there's no descriptor and no pending_irq
storage for it. Please add a comment.

> +
>          if ( likely(irq >= GIC_SGI_STATIC_MAX && irq < 1020) || is_espi(irq) )
>          {
>              isb();
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
> index 09788dbfeb..c29f3d04a3 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -66,18 +66,7 @@ static inline bool is_lpi(unsigned int irq)
>  
>  static inline bool is_espi(unsigned int irq)
>  {
> -#ifdef CONFIG_GICV3_ESPI
>      return irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID;
> -#else
> -    /*
> -     * The function should not be called for eSPIs when CONFIG_GICV3_ESPI is
> -     * disabled. Returning false allows the compiler to optimize the code
> -     * when the config is disabled, while the assert ensures that out-of-range
> -     * array resources are not accessed.
> -     */
> -    ASSERT(!(irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID));
> -    return false;
> -#endif
>  }
>  
>  static inline unsigned int espi_intid_to_idx(unsigned int intid)
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index e5aca17dcb..e04678f134 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -62,6 +62,13 @@ static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
>      return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)];
>  }
>  
> +static struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
Constify d, please.
Also, use static inline like the surrounding helpers.

> +{
> +    unsigned int idx = espi_intid_to_idx(irq) + d->arch.vgic.nr_spis;
> +
> +    return &d->arch.vgic.pending_irqs[idx];
> +}
> +
>  #else
>  static inline bool is_valid_espi_rank(struct domain *d, unsigned int rank)
>  {
> @@ -78,6 +85,11 @@ static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
>      ASSERT_UNREACHABLE();
>      return NULL;
>  }
> +
> +static struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
> +{
Add ASSERT_UNREACHABLE() here like for vgic_get_espi_rank().

> +    return NULL;
> +}
>  #endif
>  
>  static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
> @@ -696,8 +708,8 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
>  /*
>   * Returns the pointer to the struct pending_irq belonging to the given
>   * interrupt.
> - * This can return NULL if called for an LPI which has been unmapped
> - * meanwhile.
> + * This can return NULL for an eSPI when support is disabled, or for an
> + * LPI which has been unmapped meanwhile.
This puts LPI and eSPIs on exactly the same level which is not correct. While
unmapped LPI can happen, eSPI with support disabled must not. Leave the LPI
comment as is and clarify eSPI in one sentence.

Otherwsie, LGTM.

~Michal


