Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C39C9830D
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 11:17:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433828.1654158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA3vP-0006R7-EH; Fri, 25 Sep 2026 11:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433828.1654158; Fri, 25 Sep 2026 11:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA3vP-0006R0-BW; Fri, 25 Sep 2026 11:17:07 +0000
Received: by outflank-mailman (input) for mailman id 1433828;
 Fri, 25 Sep 2026 11:17:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xA3vO-0006Qs-9U
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 11:17:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA3vN-008J4l-Io
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 13:17:05 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab65826-e002-0a2a0a5209dd-0a2a4507ca88-26
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 13:17:05 +0200
Received: from [40.107.200.30]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab6582f-b4ea-0a2a45070019-286bc81ec5be-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 13:17:04 +0200
Received: from PH7PR17CA0007.namprd17.prod.outlook.com (2603:10b6:510:324::18)
 by MW4PR12MB7190.namprd12.prod.outlook.com (2603:10b6:303:225::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 11:16:57 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:510:324:cafe::55) by PH7PR17CA0007.outlook.office365.com
 (2603:10b6:510:324::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.19 via Frontend Transport; Fri,
 25 Sep 2026 11:16:57 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 11:16:56 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 06:16:56 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 06:16:55 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 25 Sep 2026 06:16:54 -0500
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
 b=HEt/WXf8HO7t9riEDXERtdfFB7QL8KdvGeQESBCR6txB/pik4wZbn802MkU4EMahhNXg3Eh/BpoFHh+p7GKc4jC48Zpsi2mq+bqyTY3P6dttwY7Ze8XgmBjLZnZVgtPPFkYcKi2+ZzK41LmRh5mspLiQ1tiSelO1+bSkuyQOT5NfIIqeDT63vYEa7QJzuICY4mUc6pSTjc1HlSxudfv3i53b5ztTduRz5vzBTmWbxyK9qcS2qRRyYtOLHoSQHUh+suaHj/zkWr60oaIgFmdGOOtHmvdhvbuDz83K9DY2Lkrza0luVB7Z+erfPaD+8HbtuB9R32SuwnCtcarSdAMHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtltmMtWWSnGRm6iaffboFNVp7fDDjazfKEdFjUABws=;
 b=DSwUno/d1zUWP7Yxf2YDmLJL92UQjsC/FXivvLa7m3FfgseYJNyUonpkbcHxEyHHQGG02HK13FJZ6FO75k23dg3CCTjsb0fodbvwJtTOMlXfyEWSHo+VbCK3t+7oBhJvEfRWnxrkN2KlnLKTSm1Ii4+CUNSOLXgMQRQP+rT6yJVXUnwfEQyPWrVaR4QJRQkpSevsoweRh/3Le17HkuLVOWXs3J8bBm/uLMIW2DhoDkcEq7JZYT3g30Og3m6JiWBP9EpVx+RwZAOF7Ikzg4SHycCch972Y7mmakBXRQTizhnaC7kee6vZq1ABtOcvN9AJcpigxyAj6kvRy1Wol54WvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtltmMtWWSnGRm6iaffboFNVp7fDDjazfKEdFjUABws=;
 b=Y9j5z3iBTguyNDf4V+31RzqkbVSu3Lpt9r85TgWDxhMXLHmnyOw6qpYYIBF0nqoDnLi8opFY904u5ZTP2KHmEv5HsrO8sfjt9HgZTPY+0yfVq3upe6Ct8gWotnfo0bkChtYm7pOP+5V5J1WNo2UGWk+4d0rkBXBe6BxeOVpzbvw=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <3d759f27-1381-4b75-b047-4d90a0f2b106@amd.com>
Date: Fri, 25 Sep 2026 13:16:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] xen/arm: vgic: free eSPIs using the bitmap index
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykola Kvach
	<Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>
References: <cover.1790160605.git.mykola_kvach@epam.com>
 <8c61cf31b69377737d1f688bded43d123ac55d00.1790160605.git.mykola_kvach@epam.com>
 <877bka1cp3.fsf@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <877bka1cp3.fsf@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|MW4PR12MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 22fca03f-2982-4d58-8fbf-08df1af682f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|11063799006|6133799003|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vQEAH60n5R3edHdjx3OnPDB2rcjreu4iCtyNe0zvKEV0Bn7QSkzajnexq49LlfnOD2W7iQmRO7Oaz71VYyNKy24djRlOSIUBXQ+Q3oQV4iIT+Q7MdKkaW+7+/+S9aqE5Io/1hOc+YMnAW3iTV4PaP0zWeraSDBzd5mUM6CaQOnXvazZiAivggSJGPJBiz2igaL7ZGrnd5nujXqzY7+S1SADiYMh4ccN8N1cdXNCdqu2qa1JUAEH643qWgFXacu76UrzohvDrfHtmxS7Q13GjMiopC8EA11JsU7PW7Bf//js/0Y3SrkZx4vcemsfSbY3QXBsehHKgKBbxyHxq6He8+BfQQcQoNK/8T7KzVPhUeOAsxy6eEANZv9X4QhXD7Fb5OT+e2llvkOR//L4yijYyPima4l5zaaIioN15JtnVIPlixG8V+97TdQhJfd9ltlYAst1Sy2Fey71VmAt/deVc9cvQCrngyzzrcpE4nCkOkLE4Tx+LbhLB/81gXRcnxAgqNcfz41Roahf6fzF69rgveeYxQH2o9im9+XIjHAy/6IOoBoOsY4OJm2s5OukIWRZ0m9czXvmK9FpsDCziudVG0yQN+F+YRYdYSozugJv4WJ+NvD2Lv1g2pVMaivRU1Ti32BE2vhu3VOg5f8XQF5t610xl1sMdXIZTnTxRGYajtbK4CF29gqn8+8G9OJziuGFGO8I7YiuLnB8YcvNb4nreyw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(11063799006)(6133799003)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T6Gwy21MAO7oJV/cNKfEvO0Hzh1fbmmIB7VAKFv/J0bPcaBfPeDa/+Ya/MqipzrczS4FpVo8LhwJlLVkWZLO3HYAhXqHEZgbzdNMjEJiP35gGGDVRgMZBZ8LSl4OO3LewSZleBRk19tPlCEDQaM3fX4i6PrZ7VVMuYGOPcTfeu7j4howTiAxEcZQtIPcusKiBZgQz1sp/KmeB9yA+K6NzbwDb3RlrMKhSDcsb/DLCljXjNXkgt1u90vvA6tbO6/vmwunGV8tUtuVPx/wYJcL5w3NCKZ75tQ3tmkOk4ZK/8ItaYigBZCbqZZ3Z1VKHHJjk1aeHtTrzouj898nkPSC3wP1fGJuVQaxRGhPiOvyq7NQsRDxk8Rv2REGNspm3PEoRwckWwZzRUlA4pX1YlGEZ3HutsZsQ3PYtHhepY+qAgMfAYPQNFUSTki93r9UiL18
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 11:16:56.9768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22fca03f-2982-4d58-8fbf-08df1af682f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7190
X-purgate-ID: tlsNG-ef75cf/1790335025-372DCAE4-052DC55E/0/0
X-purgate-type: clean
X-purgate-size: 4778



On 25-Sep-26 00:55, Volodymyr Babchuk wrote:
> Hi Mykola,
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
>> and freeing vIRQs. Use vgic_is_valid_line() for the validity checks when
>> reserving and freeing vIRQs in both vGIC implementations.
>>
>> Fixes: bdde400c6e1b ("xen/arm: vgic: add resource management for extended SPIs")
>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Changes in v5:
>> - Add the vgic_is_valid_line() guard to vgic_free_virq() in the new
>>   vGIC implementation and use the same helper in vgic_reserve_virq().
>>
>> Changes in v4:
>> - Document the compressed bitmap layout with an ASCII diagram above the
>>   conversion helpers and refer to struct vgic_dist for the full layout.
>>
>> Changes in v3:
>> - Adapt virq_to_idx() to the configuration-neutral is_espi() helper.
>>
>> Changes in v2:
>> - Call is_espi() without a configuration guard.
>> ---
>>  xen/arch/arm/vgic.c      | 42 +++++++++++++++++++++++++++++-----------
>>  xen/arch/arm/vgic/vgic.c |  5 ++++-
>>  2 files changed, 35 insertions(+), 12 deletions(-)
>>
>> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
>> index 0ba13e18da..acded6a40f 100644
>> --- a/xen/arch/arm/vgic.c
>> +++ b/xen/arch/arm/vgic.c
>> @@ -25,6 +25,21 @@
>>  #include <asm/vgic.h>
>>  
>>  
>> +/*
>> + * The allocated_irqs bitmap is compressed: eSPI bits immediately follow
>> + * regular IRQ bits, skipping the gap in the INTID space.
>> + *
>> + *   +-----------+-----------+-------------------+-------------------+
>> + *   |   SGIs    |   PPIs    |       SPIs        |       eSPIs       |
>> + *   +-----------+-----------+-------------------+-------------------+
>> + *   0           16          32                  vgic_num_irqs(d)
>> + *
>> + * INTID ESPI_BASE_INTID maps to bitmap index vgic_num_irqs(d).
>> + * The following idx_to_virq() and virq_to_idx() convert between INTIDs
>> + * and bitmap indexes.
>> + *
>> + * See also the allocated_irqs comment in struct vgic_dist.
>> + */
>>  static inline unsigned int idx_to_virq(struct domain *d, unsigned int idx)
>>  {
>>      if ( idx >= vgic_num_irqs(d) )
>> @@ -33,6 +48,16 @@ static inline unsigned int idx_to_virq(struct domain *d, unsigned int idx)
>>      return idx;
>>  }
>>  
>> +static inline unsigned int virq_to_idx(struct domain *d, unsigned int virq)
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
>> @@ -854,19 +879,11 @@ bool vgic_emulate(struct cpu_user_regs *regs, union hsr hsr)
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
>> @@ -903,7 +920,10 @@ int vgic_allocate_virq(struct domain *d, bool spi)
>>  
>>  void vgic_free_virq(struct domain *d, unsigned int virq)
>>  {
>> -    clear_bit(virq, d->arch.vgic.allocated_irqs);
>> +    if ( !vgic_is_valid_line(d, virq) )
>> +        return;
> 
> I don't think that silently failing is a good idea. It needs an ASSERT()
> at least.
We cannot add ASSERT() here. Take a look at vpl011 init failure path on
vgic_reserve_virq() that is taken to domain_vpl011_deinit(). If you specify
nr_spis not enough to cover for UART IRQ, this can happen. I think I answered
this question some time ago.

~Michal


