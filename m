Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04126C5AC67
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 08:53:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388042.1629253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtiE1-0006FM-IZ; Tue, 11 Aug 2026 08:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388042.1629253; Tue, 11 Aug 2026 08:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtiE1-0006FF-Fn; Tue, 11 Aug 2026 08:52:45 +0000
Received: by outflank-mailman (input) for mailman id 1388042;
 Tue, 11 Aug 2026 08:52:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wtiE0-0006F8-Bg
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 08:52:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtiDy-0069x2-8I
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 10:52:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a7ae2c9-bab6-0a2a0a5309dd-0a2a4506a378-42
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 10:52:41 +0200
Received: from [52.101.56.42]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a7ae2d8-195a-0a2a45060019-3465382a85d2-4
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 10:52:41 +0200
Received: from BL1PR13CA0142.namprd13.prod.outlook.com (2603:10b6:208:2bb::27)
 by PH8PR12MB8432.namprd12.prod.outlook.com (2603:10b6:510:25b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 08:51:50 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:2bb:cafe::66) by BL1PR13CA0142.outlook.office365.com
 (2603:10b6:208:2bb::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 08:51:49 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 08:51:49 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 03:51:49 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 03:51:49 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 11 Aug 2026 03:51:47 -0500
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
 b=nNBBgTGp1mcTONcPsH8fZGY0lZc28HdvKg8hQ9pk8FMObh3sUYei1sQfG+6Y5Mn9TgjecWnizJwokiYGs3lZRY1LH30k43BR5SxFmmCNQXfkSbKF4Fkva6v2AOfjd9o8gHzsT/VfFEkdJw8N0xEVcFKr1QuwMVwYFjMKyHS4K/yi6lge0ASPvdjbxjQ3F9WVC69BPdv4u7VuarTlx8JpCQQ2yPPFSk6+qSfS0MzSP9CFge8/Ad+zVW1/dPc3bR12ZSPZrIqr1aAMqwhGB3gNE3S7A8NKvw/X9Yj/uXkNxSuX2tA/Z9DpYyhY3SXKAuP9M4C8X+MsNxlkPKDhI/Qdvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ex96CI+X4Y5wRRjVWwfYGvAcs68jgARCp19WLcvYZsI=;
 b=T4ttE2cHsq2wcW3DZaEWf3xy1+MiBeYuUXIPu6L1oUXkmNYALt+3mLwMUrylPEVVktpxLfzsDlRVN4JR1qQkAC+fHChbb7XeJ8nmYWnNkH/B6K9WtjiK4Zyu8AbHLjxvBSWoH4cBgFRiNs5ZNnxbDsZ32RP65P7dXa1eQjEqToj2WsY609PuSpP2/z+xVpq/w1bbbeVfHqNHsXcq58Uiw8IRrEIwKZYV1rwPFicXxDndwWNG/4TB4Ne7QAdLYxzGh6RFFMqDqDQzhNRKLmDOKgml+hmBZyTt1DZdIICvlPq6OVMBOoqN79dKTH5/23UNSIKRclTxeaG7iYl4mNWjYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ex96CI+X4Y5wRRjVWwfYGvAcs68jgARCp19WLcvYZsI=;
 b=ejc10Io9S2dEo6jWOgQIAI4f/GLdn9wQLo3o2DiGG9vRip5qloWzigc86ykklBQJ4BIL+NjlQqVXqgJK1EpgKxkOTr+1E4uQXHVPKcoHRx4T73hNS1adufXUE0G8YimWJf07XVbjJ7DcuUh2FTwBg/3OYsX5E4aWMk7ncmTdiC0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <272a8622-47c2-4cbb-a98c-8242561cbdb8@amd.com>
Date: Tue, 11 Aug 2026 10:51:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/arm: validate IRQs before descriptor lookup
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1786385827.git.mykola_kvach@epam.com>
 <271952244ae71ade885b3619fe161ed4f47777fa.1786385827.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <271952244ae71ade885b3619fe161ed4f47777fa.1786385827.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|PH8PR12MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: d3bff8db-055d-47a9-6ec2-08def785c860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|10067099003|4143699003|56012099006|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Tbba8HwoA0WfeC27HSxYENdPHKCYYIwh3Q7l9kRkKHTo4Tbd/Py8FEdc5lG20SKzXh6zMRPNDs+G1XiAIxZ3VzkiUnigjwLpXEDvzD0QHPebot6Wcma22V1RlHGU0bmPL05pNgW0hT4d8hJfAiAv6PqP0wRuh4WwGLaoqjtVV4dGA3yPoWDnxkavdp/FmXXevyF1Zw4YW95xdQMOSEI5bmDvkcYeWYt07pf/1PyRuA0nPxmtFHwVbl9lseNDwPLkG91vSqv+LcxuFieNmjIl+MMiW+WCCRr2rolJEA/QvwyBLtMw10FQskaFvsrOxZngEulkjQCsOvutEd5R7RXe0VZgHTj1gFCB1YxoxUPvupDZ3wRdjIE0qlTzs8aUNmdS9p+oeYnVxQSmdx25NRJ6M7l/dSYgfcJMjw6K2pGJKK7Mayb7fGFto7KR3zq9/Am0AFd0TV2UesSW59YTDoatGWOgu7GYtw0AIxeCJ0ac3R5PP65RsWFq37ng64QxRGG3hbkjvpzs2Cremh3BeQt+g6b7qdIb5m7Kha9GK6ydhZeTKjbH0+2po3wU1jaAc6pKClG/gb0379oPtNIu7ph1ps0y2lfZhHxMyEgrv+AMkWNsu7isXy6GNbAmuRLmefF03tKnN455yziJPloW9JVBTp8t+3eXxn5dAuGmy294FCcyFZ4HpO+7HKptkIYmc/ADGNN7h8OrpCV1FBcKxBp5vg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JBlRjzLmERNHwd09iJQtWJbs8nk/lwIkGLyv4ozflVOL8aLxvvsXhuvir4ByH7AD+j9Ma5hstHzVkQOOt8qg2qUv4N0NB6OfC+4LcwAE04fV+4BtUmd1OGuowOSe0coFPjI8dkzXlLCrBbrTKGImLCduZJPtVxEBuMfGAbKyUpEX2b5wdcwb9pVnnPkxo8gbro9b2MurK6rr2PeovHRsynNxdOemzH3N8feVuvzLIUKl1U/LgpJixjlbzvrTR3POduKDyJqurjCXgpRT4tc6VoGxWLqDKcdE3RQaVkCSdvNREa/3mYomun1xV4MAmAoGjXpJfrVnXacFngwAt7Sks1/TEhIjIGXZH308C3G+05y2wT85vHw2BfiJEWp0TPLkt1ng9Ts87xr8LsqKpG3uTqeD+/guxBRCCCyP+T5tsptt/mbqi8ZHpoymvGJyVx+Y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 08:51:49.7233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bff8db-055d-47a9-6ec2-08def785c860
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8432
X-purgate-ID: tlsNG-16d1c6/1786438361-FD00977B-548B2A2C/0/0
X-purgate-type: clean
X-purgate-size: 4762



On 10-Aug-26 20:38, Mykola Kvach wrote:
> GICv3 eSPI support makes nr_irqs span the architectural INTID namespace
> through ESPI_MAX_INTID, but descriptor storage is sparse. local_irq_desc[]
> and irq_desc[] cover INTIDs below NR_IRQS, while espi_desc[] covers eSPIs.
> INTIDs 1024 through 4095 have no backing descriptors.
> 
> Validation based only on nr_irqs accepts an INTID in this gap.
> __irq_to_desc() then indexes beyond irq_desc[], and callers may lock or
> update unrelated Xen memory.
> 
> Reject INTIDs that the GIC reports as unimplemented in setup_irq() before
> looking up a descriptor. irq_set_spi_type() can run before the implemented
> GIC line counts are available, so validate descriptor-backed ranges there
> before looking up a descriptor.
> 
> Call is_espi() unconditionally in __irq_to_desc() and provide an
> espi_to_desc() stub when eSPI support is disabled. This preserves the
> is_espi() debug check for eSPI-range INTIDs when support is disabled.
> 
> Fixes: 98f7060b9ed5 ("xen/arm/irq: add handling for IRQs in the eSPI range")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v2:
> - Validate descriptor-backed ranges in irq_set_spi_type().
> - Validate implemented GIC lines in setup_irq().
> - Preserve is_espi() validation with CONFIG_GICV3_ESPI disabled.
> ---
>  xen/arch/arm/irq.c | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 73e58a5108..0f5d3496bf 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -23,6 +23,12 @@ const unsigned int nr_irqs = IS_ENABLED(CONFIG_GICV3_ESPI) ?
>                                          (ESPI_MAX_INTID + 1) :
>                                          NR_IRQS;
>  
> +static bool irq_has_desc(unsigned int irq)
> +{
> +    return irq < NR_IRQS ||
> +           (IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq));
This IS_ENABLED reads redundant because is_espi() contains #ifdef
CONFIG_GICV3_ESPI inside. AFAICT you added it here to prevent the !ESPI build
from reaching ASSERT inside is_espi() when the irq is in ESPI range. I don't
like the ASSERT inside is_espi(). I think it does not make much sense in a
helper that should really just tell us whether the IRQ is in ESPI range or not.
It should be up to the caller to decide what to do based on whether ESPI is
compiled in or not. I think this cleanup would be best to be done first. If you
don't want to do that, at least document this in the commit msg because others
may be tempted to drop this IS_ENABLED.

> +}
> +
>  static unsigned int local_irqs_type[NR_LOCAL_IRQS];
>  static DEFINE_SPINLOCK(local_irqs_type_lock);
>  
> @@ -77,6 +83,12 @@ static int __init init_espi_data(void)
>  }
>  #else
>  
> +static struct irq_desc *espi_to_desc(unsigned int irq)
> +{
> +    ASSERT_UNREACHABLE();
> +    return NULL;
> +}
> +
>  static int __init init_espi_data(void)
>  {
>      return 0;
> @@ -90,10 +102,8 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
>      if ( irq < NR_LOCAL_IRQS )
>          return &this_cpu(local_irq_desc)[irq];
>  
> -#ifdef CONFIG_GICV3_ESPI
>      if ( is_espi(irq) )
>          return espi_to_desc(irq);
> -#endif
>  
>      return &irq_desc[irq-NR_LOCAL_IRQS];
Nothing here covers 1024..4095. I think we should add at least:
ASSERT(irq < NR_IRQS) like we discussed some time ago.

>  }
> @@ -416,6 +426,9 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
>      struct irq_desc *desc;
>      bool disabled;
>  
> +    if ( !gic_is_valid_line(irq) )
> +        return -EINVAL;
> +
>      desc = irq_to_desc(irq);
>  
>      spin_lock_irqsave(&desc->lock, flags);
> @@ -647,13 +660,19 @@ static bool irq_validate_new_type(unsigned int curr, unsigned int new)
>  int irq_set_spi_type(unsigned int spi, unsigned int type)
>  {
>      unsigned long flags;
> -    struct irq_desc *desc = irq_to_desc(spi);
> +    struct irq_desc *desc;
>      int ret = -EBUSY;
>  
> -    /* This function should not be used for other than SPIs */
This is an important line that you should keep.

> -    if ( spi < NR_LOCAL_IRQS )
> +    /*
> +     * The implemented GIC line counts are not available when early
> +     * callers configure IRQ types. Check descriptor storage here; setup_irq()
> +     * validates the implemented line before the interrupt is used.
> +     */
> +    if ( spi < NR_LOCAL_IRQS || !irq_has_desc(spi) )
>          return -EINVAL;
>  
> +    desc = irq_to_desc(spi);
> +
>      spin_lock_irqsave(&desc->lock, flags);
>  
>      if ( !irq_validate_new_type(desc->arch.type, type) )

~Michal


