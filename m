Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989BFC88E75
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 15:21:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421092.1647221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x68UJ-0003FI-Vr; Mon, 14 Sep 2026 15:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421092.1647221; Mon, 14 Sep 2026 15:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x68UJ-0003FB-T8; Mon, 14 Sep 2026 15:20:55 +0000
Received: by outflank-mailman (input) for mailman id 1421092;
 Mon, 14 Sep 2026 15:20:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x68UI-0003E0-S3
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 15:20:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x68UG-001jua-Vi
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 17:20:52 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa810d2-8faa-0a2a0a5109dd-0a2a4509cabc-6
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 17:20:52 +0200
Received: from [52.101.52.54]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa810d2-be1a-0a2a45090019-34653436e8f9-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 17:20:51 +0200
Received: from MN0PR04CA0029.namprd04.prod.outlook.com (2603:10b6:208:52d::34)
 by SA1PR12MB7038.namprd12.prod.outlook.com (2603:10b6:806:24d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Mon, 14 Sep
 2026 15:20:47 +0000
Received: from BN1PEPF00018548.namprd05.prod.outlook.com
 (2603:10b6:208:52d:cafe::7d) by MN0PR04CA0029.outlook.office365.com
 (2603:10b6:208:52d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 15:20:47 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00018548.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 15:20:47 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 10:20:46 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 10:20:46 -0500
Received: from [172.20.10.246] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 14 Sep 2026 10:20:44 -0500
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
 b=koz6YBslh5yElXpnMEkAgKBM115n+TwRrDaMXW9mZhAPkRft/qYWwx6gTF9Lt+QGHobVgwaN5L0usBoG5DqrsJhoEi0NepQ2SXpneyAOWJKa5p+BsCDEZHFcTpteH03ph3E7k2BJiF5gRArn9f8FfV17OHVFyuSCofzCi+QRBlZJtszPIVP5e1KDkO+buFY0p0ycS+fdpE8V4+gBgCTC7PElgkuwpzYOHOB4WDgABc8RQsfWjWzF/Iqw6eJqYw9+rkACGGbOYCrtGbci19Yl5vJ++66Icd/M7JGMr38j+gdouNbBf7/ofBtzwe5kaYXKNk491985UjShTVEDnXk1/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXkx4OuIL7Nj9mL0UTRvfUTVTmUATYBGM+v3BpJscII=;
 b=Ln5gUqjdaOQazOah2fstPc1z7NCqSq0OBaublKrZsN2e1xDCW6NqLdIMRdrJ5hL9sGriZdUmOppWWN1tF4jbCUFLhJS9IixhqW3Ytj8IFjIGT3oVv8sw7569Su7xrJGvo03lX1vNyCRUv/m/N6A9xirSyMtd+gO44K21GlV8ZMJZF7nBlmkpzrpjY9LXcOHr93ahGsRFC1U6qx4WkhZ1hjjGadfThcSabLCRCap60wdHY+BbL7Vp8hbRp+fkdNO+5s4OssUiF7knhYm5qsDXl1a6HnKPyjwJHAPtcVp2H1F5ZYKK/NFPvbDSnA141u/JxKaN4TrVasJRoXJhPP1pdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXkx4OuIL7Nj9mL0UTRvfUTVTmUATYBGM+v3BpJscII=;
 b=B3HpVuDR2jw0MqFGgQWRAhSog/tWAXlBXZXzBuD4DMkEki1jh3kXQKBKOVoxCS3Or3Ks6nhrSe+wDaDP2LUpZzz0F0Sf7/sUifUfHIUY9K/RTsxOywF74JfF9ZQxygybQDyJGyrZsRrDGkMn6sShysSFLFlLyaiatLvtdwxXMN4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <4eba243f-01cb-49a6-9f6f-edab49d5901b@amd.com>
Date: Mon, 14 Sep 2026 17:20:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen/arm: validate IRQs before descriptor lookup
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykola Kvach
	<Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>
References: <cover.1787050437.git.mykola_kvach@epam.com>
 <355ff5a0aab671894a527ccb7b5999db6b168de3.1787050437.git.mykola_kvach@epam.com>
 <87fr03xcr1.fsf@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <87fr03xcr1.fsf@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018548:EE_|SA1PR12MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: d555130e-7224-4c24-9004-08df1273c095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3MVWk0A/4VW3bK98e8c/TVK+EQ7+mXJkCrPn4XlzkCBYNfH2J2csOkS3cEN/X5QNoiGXIwNWV/ICEHxiyhuy05HGtDcYWrcfIjVBRgjCMY3LRUlxHprSHo8xorn0c1yA+HqU9WmRhMlKV0TaW+Bm+LtEDP12iLE6a/EbMBzFybZ3F50hYGIm3XW0Yh/UdVh2UjZIrT8NJynA9tiqd8pEZEAQtyBfGO80Alv8W7A92Gl2dmSApLQuWw22zBbVQtWyRqdgPjpA9ALXZIpl1vSIDnrvgK5Ziu7TLzwomdoBJdzxAyi6KK3GypMQbFr5fADa4RbesJCnC7PmK4DMpJyDIjxCoBliTnKA/QTAJwZjE1rcjH1aX3galHGdMGwAm0FTpVA+coD65NL0H0O1csJ0/UuT6RIRcM4jYT7xO1NJd4oFoaYm64X6eoJaRwr34QF0BwQ6paM4P3ckSgRSQF589JhM44pAvtokig17TQsLhU3yC68t0FwvB2GY0YO12hWMljgvdt7SKRlav+GG5TBl7YFVWUSSQdFbGYgoMtGSyuzj/qvMUOgHeQRDESpXec87kuBRP+93djk2SegHd3oeNGMCyylg0ajPhobKK7NVNe1SY/MOEfxaSggZ++DOA4GFr9nAPOvnBtzW9YFiWxOyIhLVLZTW+E0wyN4x9vMW3+V8XaN+X4Konqwkf0rTMPLw9hQx0n/KEXYAyFFyL8/VqA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y33GOMOFIvYZP3wkCFqcP8e6hXmxlutS/GutnfONw14q7brKh9gApyEYEuEMKMizVDYLL4Y1KABt5coYYHCr15eJBv03yHp9NLZKkdz6nKYPFNF/h3Y3+JPXduBdaBT2j+RVG4QkXmnTD6d5sn1BV4r+gAOe3XcMEFRvh6rYErttLigaOTlMjKEnbuz8+lNCJMsgUYA5MEIAV/GBOqpFZDEdAgOi7maAVQpdfxYG0ocfMlNmxfWX6595LIuPJHq5R2cCq/zlxS2DHFbppyPxHxeAtSjC2vWyN0eDVJT3a+vfGg0dmeaXbJXF2QLX3f63uHIQMTkcsz4SgdKGk4+tr42Z6aM2QCjwI+WEFT5jKAlT1+MwVa5ny5XkA+CwNNFSavmEZO6JrGeDuUcOxH/6XX+V7iB7E8ZLsrBHNbSLVNVz+bhNh/MpG7DW6Hn94YVw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 15:20:47.1038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d555130e-7224-4c24-9004-08df1273c095
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018548.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7038
X-purgate-ID: tlsNG-bad1c0/1789399252-FD86F034-B141FD1D/0/0
X-purgate-type: clean
X-purgate-size: 4604



On 25-Aug-26 02:30, Volodymyr Babchuk wrote:
> Hi,
> 
> Mykola Kvach <mykola_kvach@epam.com> writes:
> 
>> GICv3 eSPI support makes nr_irqs span the architectural INTID namespace
>> through ESPI_MAX_INTID, but descriptor storage is sparse. local_irq_desc[]
>> and irq_desc[] cover INTIDs below NR_IRQS, while espi_desc[] covers eSPIs.
>> INTIDs 1024 through 4095 have no backing descriptors.
>>
>> Validation based only on nr_irqs accepts an INTID in this gap.
>> __irq_to_desc() then indexes beyond irq_desc[], and callers may lock or
>> update unrelated Xen memory.
>>
>> Reject INTIDs that the GIC reports as unimplemented in setup_irq() before
>> looking up a descriptor. irq_set_spi_type() can run before the implemented
>> GIC line counts are available, so validate descriptor-backed ranges there
>> before looking up a descriptor.
>>
>> Assert the regular descriptor bound in __irq_to_desc() so direct callers
>> cannot silently index the sparse gap in debug builds.
>>
>> Fixes: 98f7060b9ed5 ("xen/arm/irq: add handling for IRQs in the eSPI range")
>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>> ---
>> Changes in v3:
>> - Add the requested bound assertion and retain the SPI-only comment.
>>
>> Changes in v2:
>> - Validate descriptor-backed ranges in irq_set_spi_type().
>> - Validate implemented GIC lines in setup_irq().
>> - Preserve is_espi() validation with CONFIG_GICV3_ESPI disabled.
>> ---
>>  xen/arch/arm/irq.c | 26 ++++++++++++++++++++++----
>>  1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
>> index 73e58a5108..bf14180f97 100644
>> --- a/xen/arch/arm/irq.c
>> +++ b/xen/arch/arm/irq.c
>> @@ -23,6 +23,12 @@ const unsigned int nr_irqs = IS_ENABLED(CONFIG_GICV3_ESPI) ?
>>                                          (ESPI_MAX_INTID + 1) :
>>                                          NR_IRQS;
>>  
>> +static bool irq_has_desc(unsigned int irq)
> 
> You are using this function only in one place, where you are actually
> testing for SPI. So, maybe introduce irq_is_spi() helper instead? And
> use it below?
It can stay as is but:
 - move it next to __irq_to_desc(),
 - use it also as ASSERT(irq_has_desc(irq)) in __irq_to_desc() instead of the
assertion you just added.
This way the two stay in sync.

> 
>> +{
>> +    return irq < NR_IRQS ||
>> +           (IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq));
>> +}
>> +
>>  static unsigned int local_irqs_type[NR_LOCAL_IRQS];
>>  static DEFINE_SPINLOCK(local_irqs_type_lock);
>>  
>> @@ -76,7 +82,6 @@ static int __init init_espi_data(void)
>>      return 0;
>>  }
>>  #else
>> -
> 
> Please, no unnecessary changes
> 
>>  static int __init init_espi_data(void)
>>  {
>>      return 0;
>> @@ -95,6 +100,8 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
>>          return espi_to_desc(irq);
>>  #endif
>>  
>> +    ASSERT(irq < NR_IRQS);
check_timer_irq_cfg() in time.c calls irq_to_desc() on timer_irq[], and on the
GTDT path those are not validated.

>> +
>>      return &irq_desc[irq-NR_LOCAL_IRQS];
>>  }
>>  
>> @@ -416,6 +423,9 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
>>      struct irq_desc *desc;
>>      bool disabled;
>>  
>> +    if ( !gic_is_valid_line(irq) )
Please add a printk message to inform the user.

>> +        return -EINVAL;
>> +
>>      desc = irq_to_desc(irq);
>>  
>>      spin_lock_irqsave(&desc->lock, flags);
>> @@ -647,13 +657,21 @@ static bool irq_validate_new_type(unsigned int curr, unsigned int new)
>>  int irq_set_spi_type(unsigned int spi, unsigned int type)
>>  {
>>      unsigned long flags;
>> -    struct irq_desc *desc = irq_to_desc(spi);
>> +    struct irq_desc *desc;
>>      int ret = -EBUSY;
>>  
>> -    /* This function should not be used for other than SPIs */
>> -    if ( spi < NR_LOCAL_IRQS )
>> +    /*
>> +     * This function should not be used for other than SPIs.
>> +     *
>> +     * The implemented GIC line counts are not available when early
>> +     * callers configure IRQ types. Check descriptor storage here; setup_irq()
>> +     * validates the implemented line before the interrupt is used.
>> +     */
>> +    if ( spi < NR_LOCAL_IRQS || !irq_has_desc(spi) )
> 
> So here you can just call if ( !irq_is_spi(spi) )
> 
>>          return -EINVAL;
>>  
>> +    desc = irq_to_desc(spi);
>> +
>>      spin_lock_irqsave(&desc->lock, flags);
>>  
>>      if ( !irq_validate_new_type(desc->arch.type, type) )
> 

~Michal


