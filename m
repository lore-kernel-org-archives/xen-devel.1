Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BE0C98321
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 11:10:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433790.1654141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA3oI-0004NW-JE; Fri, 25 Sep 2026 11:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433790.1654141; Fri, 25 Sep 2026 11:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA3oI-0004NP-GA; Fri, 25 Sep 2026 11:09:46 +0000
Received: by outflank-mailman (input) for mailman id 1433790;
 Fri, 25 Sep 2026 11:09:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xA3oG-0004NJ-W1
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 11:09:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA3oF-00EDxL-SD
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 13:09:43 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab65677-bab6-0a2a0a5309dd-0a2a4502e530-0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 13:09:43 +0200
Received: from [40.107.208.24]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab65675-6ca4-0a2a45020019-286bd0188688-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 13:09:43 +0200
Received: from BL1PR13CA0204.namprd13.prod.outlook.com (2603:10b6:208:2be::29)
 by SN7PR12MB7204.namprd12.prod.outlook.com (2603:10b6:806:2ab::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Fri, 25 Sep
 2026 11:09:21 +0000
Received: from BN7PEPF0000009F.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::4f) by BL1PR13CA0204.outlook.office365.com
 (2603:10b6:208:2be::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Fri, 25
 Sep 2026 11:09:21 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF0000009F.mail.protection.outlook.com (10.167.248.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 11:09:20 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 06:09:20 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 25 Sep 2026 06:09:18 -0500
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
 b=au0cYxCTB0DtXDViWTg/g3tt/zslEwDDVIkneHkLuxqW7rFm0I1x2JioXm7VvTfRCQU8gyNSvdi+vgOLTo+z3q+x8OHQS2AlkhpGbDwONTchUrObULogL1fa4hFd44cdu7DcOE7KM6eGjbeLG++P2hZReRXAAXMNufnofiTRRR3H5Az148THjOR4jfY1jNEnvj/reMR0hgvTgEuBX+/7fWiahwv0Cn1420tiaS/YnBa+L/AdeUbgh3jFFTeEJtDFg49jI9c3kC0CY4+RwKAWi8YOPx4t4j7wk8OoOFKXl6vSdo7s1nbIH/4wa1de6seg03zExXfV18CM6MPVfg7RfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2G2r4FUZitfaVTvGk0aO2O1E4MLhPvpXdZhynQNit3A=;
 b=YHPfLGEz7yP5gKlV8hpRbqOWsF+vLUuTaVGNsp/uYXK1KHNe4bSeKjrmPxu8u+EefrQcLjltfVYBtDdhPm535/eFk9trrV02Iaxqe9O5emCCpXOocQa5fcamN6IRdG5Tv8AoE4/Gngp1IWISzrl9yvG9vHgiiXJaxSlOasUt1tQgeznpfgU+4O0r9PjAPlGaMkNqz5VyFF0TmRmXpjBRXVRBGnxcGSsIeeMRvvSYTX8oO+IiFw0ELk8S0aOx04oF4DGg2v6cu0FBu7iLAGl2xT1F8IvuGEiYwLS1ZknDXoTD53o93cypAx3VZfyH6CQaptRo8Ie9O7kF82BDNedCWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2G2r4FUZitfaVTvGk0aO2O1E4MLhPvpXdZhynQNit3A=;
 b=iDhgn04Z5CNn3IPb3dZ908OGI5N2QkqLyuyfBM8+lERKmGmHhHtx89BZuC6XmHgVyqWNZCtdTfh4w4/xuHb7Jn4qt24Q9ZplLpyNiJ+YhqjEG5NFHmNncPnfJNbCDXIes3s5jdIdC21GCDZWjGNCbfRrm02sOArevDD1VV5rxlY=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <65fb22b1-49d4-4d2b-9726-69884bc70799@amd.com>
Date: Fri, 25 Sep 2026 13:09:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] xen/arm: handle irq_set_type() failures
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Jens Wiklander <jenswi@kernel.org>
References: <cover.1790160605.git.mykola_kvach@epam.com>
 <f15dcaa9b650c8d0cb27c29bdad0af14bf5d61c9.1790160605.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <f15dcaa9b650c8d0cb27c29bdad0af14bf5d61c9.1790160605.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009F:EE_|SN7PR12MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: 562187a8-d856-47e3-092f-08df1af57318
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|7416014|376014|82310400026|56012099006|6133799003|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ehJZ3eh5J4IH726ZIRLGBGqn4EJJ6ObmuFheN+gs2NqzuZAAnw9EPFxJf6wCC+06xBcsJAR0uUjH6DJsevXirALb84A4evb1rfdUpWEzE6gkapUSJyWZ+pjo3BtsSr0XLYkTUG/jBaYWwlhsW7fejhcpW9WGiWW8WAPpHt+qBH03ViC5mcUNZuW5rE0tbPLHO5HQ3b1XyTB9QBapfffT3SUP1s/efdtFpNyblAxSoZ9dnvWBi0uaGQ5sNR+0+T3XpDgWQa+p+q9P2eeLvhCegVilxGEgMruZ7tX+NdFKKvHok3DTMFDmCeV7koqM1SEb5nhIJQIf2+gnksByIolrki7ysP50VTDaO0Ut2nvL3JwVv2w/eiWpZQ3LDV9LeQpeVaV/U7qRu6aSVGVqQ3spgdQr6924Rx9EzH90E04Tg0Eg1LNaTXZcs4wN+HbWZBgLMULH7aHG1m5g20s+zeTO5woN5qJVhHuyVB8izmhSvwCJuKSArk8ELeSNrNJO7tQOpEPmG4o/G3WnL/0kjyIVwTgsZDEeRKI40ebGMCWDLmCMw3oqSaHi0UU5y4kL4ouTAgNUZrcQ1kwu3jwz6p/eb3TN3qJfHY6rbaHMoK3ZjYdz+bL/JPpVse9ILcoex5kBZRc/Nnl77BtVBpRaMcN/MF/RkzcJHzBOuQVD3zZuIA9ynS161rYDt8v6K7QBilO+/wOyauw28fVNV0KeELyZVg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(7416014)(376014)(82310400026)(56012099006)(6133799003)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MXBIXAKsF1Vov/ekZbrwujJbYAClzZoJ2Y5sd90ObIJvdCeoDwD0HDGlTgnbIN61GxqkIFD/rFwd/iGMnUG5inBz+G5sMUIQSD7O89UZaBnFWrXbec0s0NFujrYIYJJ8BWcF62YysEfI2cNANFw1et9TYGL+JeOluzpv55SWFj7vkQh1FgJOoZPLqMfM24jSy1+Sta0Ly+UU4K/y+h4YRPZp2CAAVxHwFphiT2Wk8TvmeV1YGbaPZwmwjbHGKfCSBr9myn0hKXJtWLUqvvGEoKW9tdwo1x2BkiDQYb3etziZ66n66Ao4SROR/I/tzvm4+dHNiiAyQPCLGHeWnmx3q4KTj26XFaXVd/HD1ssTzj3k7m9Cl0pruxss/hjV/OqfiFzlkTmuT/3/tgOvpwXkmyrVZbkOZv0TxX9V01jEuZRY9cLrimPSAnQ94b0PaaR4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 11:09:20.9727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 562187a8-d856-47e3-092f-08df1af57318
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7204
X-purgate-ID: tlsNG-720697/1790334583-30DC12AC-ECDC1C95/0/0
X-purgate-type: clean
X-purgate-size: 7775



On 24-Sep-26 22:57, Mykola Kvach wrote:
> Several Arm firmware initialization paths discard irq_set_type()'s return
> value, violating MISRA C Rule 17.7. If trigger configuration fails,
> initialization continues with an IRQ that was not configured as requested.
> 
> GTDT and MADT retain rejected timer and maintenance INTIDs.
> check_timer_irq_cfg() and release_irq() later perform unconditional
> descriptor lookups on those values. Xen has no backing descriptors for
> INTIDs 1024 through 4095, so retaining one can cause an out-of-bounds
> access.
> 
> Check the return value in the GTDT, MADT, SPCR, and FF-A paths. Store timer
> INTIDs only after successful trigger configuration, make GTDT parsing
> failure fatal, and stop UART or notification setup when trigger
> configuration fails.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes in v3:
> - Avoid partial state updates and simplify maintenance IRQ setup.
> 
> Changes in v2:
> - New patch.
> ---
>  xen/arch/arm/gic-v2.c        | 15 +++++++++------
>  xen/arch/arm/gic-v3.c        | 15 +++++++++------
>  xen/arch/arm/tee/ffa_notif.c | 11 ++++++++++-
>  xen/arch/arm/time.c          | 18 ++++++++++++++----
>  xen/drivers/char/ns16550.c   |  8 ++++++--
>  xen/drivers/char/pl011.c     |  4 +++-
>  6 files changed, 51 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index d05c574d88..87eda9d322 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1166,17 +1166,20 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
>      /* Read from APIC table and fill up the GIC variables */
>      if ( cpu_base_assigned == 0 )
>      {
> +        int rc;
> +
> +        rc = irq_set_type(processor->vgic_interrupt,
> +                          processor->flags & ACPI_MADT_VGIC_IRQ_MODE ?
> +                          IRQ_TYPE_EDGE_BOTH : IRQ_TYPE_LEVEL_MASK);
> +
> +        if ( rc )
> +            return rc;
> +
>          cbase = processor->base_address;
>          csize = SZ_8K;
>          hbase = processor->gich_base_address;
>          vbase = processor->gicv_base_address;
>          gicv2_info.maintenance_irq = processor->vgic_interrupt;
> -
> -        if ( processor->flags & ACPI_MADT_VGIC_IRQ_MODE )
> -            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH);
> -        else
> -            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK);
> -
>          cpu_base_assigned = 1;
>      }
>      else
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index acdac22953..b32a9b5009 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1743,15 +1743,18 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
>      /* Read from APIC table and fill up the GIC variables */
>      if ( !cpu_base_assigned )
>      {
> +        int rc;
> +
> +        rc = irq_set_type(processor->vgic_interrupt,
> +                          processor->flags & ACPI_MADT_VGIC_IRQ_MODE ?
> +                          IRQ_TYPE_EDGE_BOTH : IRQ_TYPE_LEVEL_MASK);
> +
> +        if ( rc )
> +            return rc;
> +
>          cbase = processor->base_address;
>          vbase = processor->gicv_base_address;
>          gicv3_info.maintenance_irq = processor->vgic_interrupt;
> -
> -        if ( processor->flags & ACPI_MADT_VGIC_IRQ_MODE )
> -            irq_set_type(gicv3_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH);
> -        else
> -            irq_set_type(gicv3_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK);
> -
>          cpu_base_assigned = 1;
>      }
>      else
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 186e726412..d08d0a3366 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -407,7 +407,16 @@ void ffa_notif_init(void)
>          irq = resp.a2;
>          notif_sri_irq = irq;
>          if ( irq >= NR_GIC_SGI )
> -            irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> +        {
> +            ret = irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> +            if ( ret )
> +            {
> +                printk(XENLOG_ERR
> +                       "ffa: irq_set_type irq %u failed: error %d\n",
> +                       irq, ret);
> +                return;
> +            }
> +        }
>          ret = request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
>          if ( ret )
>          {
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index be54b87438..ccfb76e20f 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -60,20 +60,27 @@ static int __init arch_timer_acpi_init(struct acpi_table_header *header)
>  {
>      u32 irq_type;
>      struct acpi_table_gtdt *gtdt;
> +    int rc;
>  
>      gtdt = container_of(header, struct acpi_table_gtdt, header);
>  
>      /* Initialize all the generic timer IRQ variable from GTDT table */
>      irq_type = acpi_get_timer_irq_type(gtdt->non_secure_el1_flags);
> -    irq_set_type(gtdt->non_secure_el1_interrupt, irq_type);
> +    rc = irq_set_type(gtdt->non_secure_el1_interrupt, irq_type);
> +    if ( rc )
> +        return rc;
>      timer_irq[TIMER_PHYS_NONSECURE_PPI] = gtdt->non_secure_el1_interrupt;
>  
>      irq_type = acpi_get_timer_irq_type(gtdt->virtual_timer_flags);
> -    irq_set_type(gtdt->virtual_timer_interrupt, irq_type);
> +    rc = irq_set_type(gtdt->virtual_timer_interrupt, irq_type);
> +    if ( rc )
> +        return rc;
>      timer_irq[TIMER_VIRT_PPI] = gtdt->virtual_timer_interrupt;
>  
>      irq_type = acpi_get_timer_irq_type(gtdt->non_secure_el2_flags);
> -    irq_set_type(gtdt->non_secure_el2_interrupt, irq_type);
> +    rc = irq_set_type(gtdt->non_secure_el2_interrupt, irq_type);
> +    if ( rc )
> +        return rc;
>      timer_irq[TIMER_HYP_PPI] = gtdt->non_secure_el2_interrupt;
>  
>      return 0;
> @@ -81,7 +88,10 @@ static int __init arch_timer_acpi_init(struct acpi_table_header *header)
>  
>  static void __init preinit_acpi_xen_time(void)
>  {
> -    acpi_table_parse(ACPI_SIG_GTDT, arch_timer_acpi_init);
> +    int rc = acpi_table_parse(ACPI_SIG_GTDT, arch_timer_acpi_init);
> +
> +    if ( rc )
> +        panic("Timer: Failed to configure interrupts from GTDT: %d\n", rc);
>  }
>  #else
>  static void __init preinit_acpi_xen_time(void) { }
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 120ac09d23..eb608ab8b4 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1928,6 +1928,7 @@ static int __init ns16550_acpi_uart_init(const void *data)
>      struct acpi_table_header *table;
>      struct acpi_table_spcr *spcr;
>      acpi_status status;
> +    int rc;
>      /*
>       * Same as the DT part.
>       * Only support one UART on ARM which happen to be ns16550_com[0].
> @@ -1959,6 +1960,11 @@ static int __init ns16550_acpi_uart_init(const void *data)
>          return -EINVAL;
>      }
>  
> +    /* The trigger/polarity information is not available in spcr. */
> +    rc = irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
> +    if ( rc )
> +        return rc;
Thinking more about it, it's better for console to use polling mode than fail on
IRQ setup. That's what we do for DT case in this driver. Something like:
if ( irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH) )
{
    printk(XENLOG_WARNING "ns16550: unable to configure IRQ %u, using polling\n",
           spcr->interrupt);
    irq = 0;
}

Same for pl011.

~Michal


