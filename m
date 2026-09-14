Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ECDC88E72
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 15:56:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421153.1647258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6924-0002FP-9H; Mon, 14 Sep 2026 15:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421153.1647258; Mon, 14 Sep 2026 15:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6924-0002FI-5I; Mon, 14 Sep 2026 15:55:48 +0000
Received: by outflank-mailman (input) for mailman id 1421153;
 Mon, 14 Sep 2026 15:55:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x6923-0002FC-4N
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 15:55:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6922-001pCn-H3
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 17:55:46 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa818f7-2eae-0a2a0a5409dd-0a2a4501c016-22
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 17:55:46 +0200
Received: from [52.101.48.42]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa818f9-5984-0a2a45010019-3465302aff09-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 17:55:40 +0200
Received: from BN9PR03CA0227.namprd03.prod.outlook.com (2603:10b6:408:f8::22)
 by LV8PR12MB9110.namprd12.prod.outlook.com (2603:10b6:408:18b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 15:55:33 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:f8:cafe::82) by BN9PR03CA0227.outlook.office365.com
 (2603:10b6:408:f8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 15:55:33 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 15:55:33 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 10:55:31 -0500
Received: from [172.20.10.246] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 14 Sep 2026 10:55:30 -0500
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
 b=kWPO3yW3SDDeNCwG33G8h1ivc2XFSbdYez1Lfz92MRmdTiQ/kOCZlI9ZlJnB8ktNWVmGtdW74nJOCzlFWTsiBiE8s3WOApnJXu/Grz4p+RHZpUeIGpdb3Z4cgLzAVNnnZv5FB2pydg0xVpyiy4ALfxCypXmbhFTcYslw4hbDaCaj3rFS1zh8wjBcQNQrkMGn8b5jWJam4ST9TcJddDBLmBC+uZk51mIEUhMF4f4w386YoYITHKNZ6VCjjbYCf7u5bfBPkdkUthcR9F0YPMWrHiAFE/FQZ051O2NOUrIWineZKoQ5fT5Ce0pXsGuUoAUXLJ3HqBusOR948tYvTQXVLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIcYhh7rNGzaEgLlSvJR9moaf3b6CekunNJoxLa5bQ0=;
 b=J9SAzCsIBslyDDe59NUvXhl3PWl2828C+2sLdUo0EplcLdlYUz395h+OhdQU9A3NJjspv4uWHdniZkn6RTBycaWFMX2e/SMCgyggjL1myFfOhodgV8NIbDp2gX6sWmrGbDujUdhLBphG9uJk647TXcuL8g+cTgENzA0aG9pLmfBBXh/V4XE1McbtjbWhVkg2i/0BNSZNAyMU1DAO2L3QqEKNvPng0XR+SIZ901Fq58QqRLQmji8U4gxP83rOeqSGutqxaicY1bd5IlODE2Iqtfm1ciUzT0j+NKLcUcjAAnHtx108E3OP6fMSDpGH973rLYdazPJTFGVOPmvu7Lzrvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIcYhh7rNGzaEgLlSvJR9moaf3b6CekunNJoxLa5bQ0=;
 b=5EGgaohBFFAyqnGL9lmgaIZD94UdbYpIrHrsgbEmCFdQro23k8fQa5S9nUceI4L9tJ76wiqNdZb96/UPGETEK9GQIEl7LwPuJhuCypYGSe6mgg1PhqqrVDGBHu1oDL2l3a0xHliJzKIXOslBXnc2BBNg3PaEj5O2NhXjYCCjFQA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <2e0f1fcf-dfcd-4a26-8124-4b7da0ca4f83@amd.com>
Date: Mon, 14 Sep 2026 17:55:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] xen/arm: vgic: free eSPIs using the bitmap index
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykola Kvach
	<Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>
References: <cover.1787050437.git.mykola_kvach@epam.com>
 <d359777c9fe4c4e1a53b93dea14e36adc4f39e00.1787050437.git.mykola_kvach@epam.com>
 <874igjxcjs.fsf@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <874igjxcjs.fsf@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|LV8PR12MB9110:EE_
X-MS-Office365-Filtering-Correlation-Id: b8cbb7b7-0197-4459-7311-08df12789c03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|6133799003|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	rhqkI7XFsZzEk7rW4D6+hULK7oxJHxTIpmhEzgV+5NDOXpOLwJaUEF0weYNHngJg+pxGeeen2trJ3focvFRk5vZh9UJ7qYb2SI/eS3ejyQlZo3xGH0HrLgE2OmV0LKbhWQI2B3Otsxg/LIPYoEbP2EopppB/TdbcAEWB0Jrg4rRrkOYPWK2t3kYRGDIuBoA8g3eGWlsrA9dB818HwruUMLPaWhaDhaWLkvcP5F+uSdxsL8nVpo52X7ROI9z9yvBwFd1G95/GLgN40N9mKyw1VZPUJSa6U8Ils9z7/eMwiyXlkyhfQev8KH8hR1IP8jhpT6suCH1Za3tf1+U97U8V5Bi+pmbt+1sitsH3kTFNoiAOC30+33Qpn3t3pt708FBm/uGtpX4dusgchXiE0ZLrPTOjsYweba2FuSBQ26EVLhG4H3bYA5nJtDQYCHI8c0ITg9IdLseforL8ihYszrhMj2a8RWxLE5AyVxF6/Vm8wxwg9DABvD7ZlNImKBV8v/WfEHYrqsbjWeVG90Yyn7NWyoECTDalyVop4jNoxM2uTx2BmUdIln5aSS9XLLvbgrHT7GHPc8TzFrUfrYNHZoa0qw2YLz6oNFFxNALTTyEsWf3WELWdXoz6GvEgro2kKAN2RxzIwxQ/j9YIE1JxDjCi0cxvV6fcpSCa9Wfk3CSHTEjdVv3+eoNuswdEaUJn3OBh2eTRsRl4G6BM+A6NQ8RLiw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(6133799003)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Vr4+oGQdpVTe6YlqMg+cwxjVMtjDx3K4vMPe8aYT8hLKnxxW44glDGZVhV10X5+HXmXguiKYxsfGZRDvSj1jM0ALO3JQE/LdZ8//plF+KbQON/aQfcR/W03Gp12Iw27DAnunnqFZyaoz3NQ2p3XYT3jhme5TTEzlzHb5S1hYGH30VEgvYMkvGtGhiOknQ8tvHRQrUlRTI5EtZ5VX9Lkrn6ziN1JN2yVaZQBISLkXfGhHlPsKrVXG4xUt6s/ptN5UtuK9J9mEq1o9i9AeOAXQ0frgfOr+A50XobpQNtAMrj/tN/G0/3ZSBIS3l8za/5OxIP0qoh4ipG5ejSyXhhYxkDJ/bmpXTOGUcPjf3TsVEXgpF34v0CyP+1x4Mjtw3wCd31oneTKp/CSpQAyXzgX5Jw1C2UPCN1y+V68KHD4uWYN8aQvwTRs/a7LDQK1/up/g
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 15:55:33.2302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8cbb7b7-0197-4459-7311-08df12789c03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9110
X-purgate-ID: tlsNG-d62444/1789401346-BEA66757-3111DB56/0/0
X-purgate-type: clean
X-purgate-size: 3390



On 25-Aug-26 02:35, Volodymyr Babchuk wrote:
> Hi,
> 
> 
> I have only one small question to this patch. Please see below.
> 
> Mykola Kvach <mykola_kvach@epam.com> writes:
> 
>> The allocated_irqs bitmap in the existing vGIC implementation stores eSPI
>> allocation bits immediately after the regular vIRQ bits.
>> vgic_reserve_virq() converts an eSPI INTID to this compressed bitmap index,
>> but vgic_free_virq() used the raw INTID.
>>
>> Freeing INTID 4096 therefore clears bit 4096 instead of the first eSPI bit.
>> This writes beyond allocated_irqs and leaves the intended eSPI bit set.
>> Valid eSPIs reach this path during DOMCTL bind failure cleanup and unbind,
>> and during vPL011 teardown.
>>
>> Add virq_to_idx(), the inverse of idx_to_virq(), and use it when reserving
>> and freeing vIRQs. Validate a vIRQ before clearing its allocation bit.
>>
>> Fixes: bdde400c6e1b ("xen/arm: vgic: add resource management for extended SPIs")
>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>> ---
>> Changes in v3:
>> - Adapt virq_to_idx() to the configuration-neutral is_espi() helper.
>>
>> Changes in v2:
>> - Call is_espi() without a configuration guard.
>> ---
>>  xen/arch/arm/vgic.c | 27 ++++++++++++++++-----------
>>  1 file changed, 16 insertions(+), 11 deletions(-)
>>
>> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
>> index e14123a30a..e541348a5c 100644
>> --- a/xen/arch/arm/vgic.c
>> +++ b/xen/arch/arm/vgic.c
>> @@ -33,6 +33,16 @@ static inline unsigned int idx_to_virq(struct domain *d, unsigned int idx)
>>      return idx;
>>  }
>>  
>> +static inline unsigned int virq_to_idx(struct domain *d, unsigned int virq)
Please add a comment at the top of the function about the layout these two
helpers encode to prevent such problems in the future.

>> +{
>> +    ASSERT(IS_ENABLED(CONFIG_GICV3_ESPI) || !is_espi(virq));
>> +
>> +    if ( IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(virq) )
>> +        return espi_intid_to_idx(virq) + vgic_num_irqs(d);
>> +
>> +    return virq;
>> +}
>> +
>>  bool vgic_is_valid_line(struct domain *d, unsigned int virq)
>>  {
>>  #ifdef CONFIG_GICV3_ESPI
>> @@ -849,19 +859,11 @@ bool vgic_emulate(struct cpu_user_regs *regs, union hsr hsr)
>>  
>>  bool vgic_reserve_virq(struct domain *d, unsigned int virq)
>>  {
>> -    unsigned int idx = virq;
>> -
>>      if ( !vgic_is_valid_line(d, virq) )
>>          return false;
>>  
>> -    if ( is_espi(virq) )
>> -    {
>> -        unsigned int num_regular_irqs = vgic_num_irqs(d);
>> -
>> -        idx = espi_intid_to_idx(virq) + num_regular_irqs;
>> -    }
>> -
>> -    return !test_and_set_bit(idx, d->arch.vgic.allocated_irqs);
>> +    return !test_and_set_bit(virq_to_idx(d, virq),
>> +                             d->arch.vgic.allocated_irqs);
>>  }
>>  
>>  int vgic_allocate_virq(struct domain *d, bool spi)
>> @@ -898,7 +900,10 @@ int vgic_allocate_virq(struct domain *d, bool spi)
>>  
>>  void vgic_free_virq(struct domain *d, unsigned int virq)
>>  {
>> -    clear_bit(virq, d->arch.vgic.allocated_irqs);
>> +    if ( !vgic_is_valid_line(d, virq) )
> 
> Is this really can happen during normal runtime?
Yes, it can. A dom0less domU with direct-map, vpl011 and an explicit
nr_spis.

With the comment added:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


