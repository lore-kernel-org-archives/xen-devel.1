Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E58CA5FF0
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 10:22:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441335.1658915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE2JP-0000cv-TE; Tue, 06 Oct 2026 10:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441335.1658915; Tue, 06 Oct 2026 10:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE2JP-0000co-QY; Tue, 06 Oct 2026 10:22:19 +0000
Received: by outflank-mailman (input) for mailman id 1441335;
 Tue, 06 Oct 2026 10:22:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xE2JN-0000ci-Qj
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 10:22:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE2JL-00E0Vp-QU
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 12:22:15 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac4cbd2-e002-0a2a0a5209dd-0a2a45079fb6-18
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 12:22:15 +0200
Received: from [40.93.195.23]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac4cbd4-b4ea-0a2a45070019-285dc317fb8a-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 12:22:13 +0200
Received: from BN1PR12CA0002.namprd12.prod.outlook.com (2603:10b6:408:e1::7)
 by MN0PR12MB6103.namprd12.prod.outlook.com (2603:10b6:208:3c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 6 Oct
 2026 10:22:07 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:e1:cafe::27) by BN1PR12CA0002.outlook.office365.com
 (2603:10b6:408:e1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 10:22:06 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 10:22:06 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 05:22:04 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 05:22:04 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 6 Oct 2026 05:22:02 -0500
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
 b=YkaOzxq7qwhIgz8YAmNiyj+fcCJIg0FZAK66CufypMsqEU14imOC8In+pnWPkt1ySsVk99yfDBoLt80b5cdSA0qg9HYkL94QFuoH0im94PgsGevY2tFQXtQl0CRmdF5lXyzGry2uGm5mBjp9WzRRRwqCufjsHfXhButDD+QFXckeeexp/qdY93Z7pBBdc6B6zhKHgjVx5tmeTqhkCkJ7DQtNkgefQf+wOZinWpc1pkW2pVzyckLVaXX0JR2gFAmPfN1bGYuA0WvJs4QDXmfSERvkW4bESdQi7aAHFvMAXYFnBd51q3o94UlA2CwxZBJgZQzVB0C0SRJ2OVWQ9mPdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySFOSfm4QWV6mZA+7DMYS6OCfeRFgu2gtuH5FW9VWEM=;
 b=Qlx0KeLNevmMfRX4TNpoVuxp16hJzqWgq5Wse91F3h4vkV+RPGQ+1vRlAMxy5F2S6pQ1utUQIp6ks8S5pHnso2T3Zn+FiumkGAXOEwvQ22mYGRL9Xj9RemrpqfmZuj1taOHhPl6f4uS8SGg8RF60VqyNekJsl806gDRoz7QF8mhJmmsLebx3v31eby2Ddp0L2R8l4HQD4NgdHgwkcx8Bt7ew003TgUbnzsV8vBq3f8X+ieUgSfz4O64gcIRwyFjViBBrqs4X+gNMygqWQzHzKOQUBYo+K+/tXE3Qkc7YzBx79Bf0HmV63J9muGRP8EocqVyY6hpBdldgsu0XT79F3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySFOSfm4QWV6mZA+7DMYS6OCfeRFgu2gtuH5FW9VWEM=;
 b=gHeEysgXyGb+80ACvYr3epGWUxjIQGcgPBSxjUktMbhi0n2Lh7q0Y3MxfJspEPUDOzfwKf1epnQ9vSwFtS653YAGDkORwuAIzNUJs8nx1QwCjyd6YhW+PC/irF9qUtI239rTrTnsXadMC9Q0Oa8oLz11xlT0Tx4NiGcC2WDHb+4=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <da9dbb1b-2d9b-4da5-a645-d98359c8d943@amd.com>
Date: Tue, 6 Oct 2026 12:22:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: gicv3: initialize eSPI unconditionally
To: Mykola Kvach <xakep.amatop@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
References: <13181424f9be3f5e31977fbd505209cd0508571b.1790102501.git.leonid_komarianskyi@epam.com>
 <CAGeoDV8sN2P9nqHwxcYz72u+L-DEQDbOcHENvX=jpzJ2=Z-gNQ@mail.gmail.com>
 <d7f902ed-af19-4d06-8bea-b73b4b385533@epam.com>
 <CAGeoDV_v3DxCNvPQvOs9YQLBg0cgxZsjH8rHyVPCEmYws8nEpA@mail.gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <CAGeoDV_v3DxCNvPQvOs9YQLBg0cgxZsjH8rHyVPCEmYws8nEpA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|MN0PR12MB6103:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a8f3b3-1b80-41db-b25e-08df2393ac5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|56012099006|6133799003|5023799004|10067099003|11063799006|22082099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UMZayClMkBKA7dRxICcVk/IL4sYXGQJkROJRGvz41f+mOChVMjBOvzuWvuIFRgpZAlHdIyDyzjpEKdLFJSMEaOGZFzIw2FrNNEc/FTXrmjIOcnuF4nTlryDyjiGADXFgaeQC8wx8TCxH4fVovxf6lh+iTptjR/d6Iy+eeQ/qH4LxA5zpbO2PL4lGG4qQpDLp6npigCAe1uJ4c6EpL9fW2fkqmcFv/iC1ynWNPPzyMpa7X8ud9nPbUZrCBpN6OZQWmsE+1ojZ5LtnyA5ya4Gm8ruwZ+A+Nla3c+72xj0d3V0SDSQM/cMR0v965scyh4oTdfJqR5TXg2pl+qU8WLTm5soJvpIbLJoT+938OfLD6+JM4zQAA20kYftKba4mPC2tBeMfr7SEN3BOR/+qIYKzWk+NORzYLu2rWR1b7vu6uHdLiq+qSmN3u9Zo4KwywoXrn5PKZH1Bu5iPLStqR+lnO/8x2MvucUq9onT7/ZmN7AyRUQdexFPbWKBbGTUHfeCVbuJLFd8iTNT3IcgYhya6W4zODfPHfXApkdLY0tWxKa+426YWtIwBYYSXmlq3OYIXHI51StxsdlFiz8vbaZLnMuTCk4cC0rMcrb/hIm0AReUFWxUL148exQxhqjj2vv0JCy6H3d2o1YHlkntelE038oDirFbDpH7Eff/aOOr6hUo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(56012099006)(6133799003)(5023799004)(10067099003)(11063799006)(22082099003)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3ptDOUpHUVcZiXqUDhczz5KgZRvyNb7HPnllGCsBJgWKAQIXLwe9fvCVYutzfsGV3Uc9JAYeemX0D8SB5FPUmk2OcANtZPff0mFdZOETQGRCmmK/S88KGCoxW37moz+ascdluhROvXoFLa/qM7NwqI2u9ulYVo/ZEbK2JjYcT+9ciK75mXx6EP0g9bqIhrrmV27Ttf/nRZTqOCQkOD+VgjzK6icWr0e0TM0dQOZjuzX5RSqWC5L4orJvLdhCoBSZzY6LRLzUemzXySGm70d7aoFk93c6SmRP4tEFR/7sbOn+Zs9q7bBdtepkl59d5qTbG2ktTPhPcGAG4is4if1oQUVGyQxu50BNe8zHlO8x0PfjtFgwtKRJniC/UlVZCPVNNP00dek5n5Q4hCm4bIjOAMK0hyVjxjtKtNbF6ZdEyAzXBDszdMz4qCUddoS8wjaq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 10:22:06.8314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a8f3b3-1b80-41db-b25e-08df2393ac5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6103
X-purgate-ID: tlsNG-ef75cf/1791282133-A6EDEAE4-399F55C6/0/0
X-purgate-type: clean
X-purgate-size: 4937



On 29-Sep-26 17:14, Mykola Kvach wrote:
> Hi Leonid,
> 
> On Wed, Sep 23, 2026 at 8:55 PM Leonid Komarianskyi
> <Leonid_Komarianskyi@epam.com> wrote:
>>
>> Hello Mykola,
>>
>> Thank you for your review.
>>
>> On 9/23/26 11:04, Mykola Kvach wrote:
>>> Hi Leonid,
>>>
>>> Thank you for the patch.
>>>
>>> On Tue, Sep 22, 2026 at 9:59 PM Leonid Komarianskyi
>>> <Leonid_Komarianskyi@epam.com> wrote:
>>>>
>>>> Since the firmware may initialize eSPIs before Xen, and without
>>>> CONFIG_GICV3_ESPI enabled, Xen would not reinitialize them properly
>>>> during boot. In such cases, once the GIC is re-enabled in Xen,
>>>> interrupts may be received that cannot be handled.
>>>>
>>>> To ensure proper operation on hardware with eSPI feature, even when the eSPI
>>>> config is disabled, gicv3_dist_espi_common_init() should be invoked
>>>> regardless of whether CONFIG_GICV3_ESPI is enabled or not. This will not
>>>> affect hardware without eSPI support, as the function checks if the
>>>> hardware supports eSPIs by reading the GICD_TYPER.ESPI field (using
>>>> GICD_TYPER_ESPIS_NUM macro), which indicates whether the extended SPI
>>>> range is supported. If the hardware does not support eSPI, the function
>>>> will not perform any actions.
>>>>
>>>> There are no functional changes for setups where CONFIG_GICV3_ESPI=y.
>>>>
>>>> Suggested-by: Julien Grall <jgrall@amazon.com>
>>>> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>>>> Acked-by: Julien Grall <jgrall@amazon.com>
>>>> ---
>>>> Changes in v2:
>>>> - rebased on the current staging
>>>> - placed Suggested-by tag first to keep tags in chronological order
>>>> - added Acked-by from Julien Grall
>>>>
>>>> This is a follow-up patch related to the discussion:
>>>> https://lore.kernel.org/xen-devel/820704d0-4047-4f02-a058-01daba2765f1@xen.org/
>>>>
>>>> Sending v2 with the requested changes, as I only now noticed
>>>> that this patch has not been merged yet.
>>>> ---
>>>>   xen/arch/arm/gic-v3.c                  | 32 ++++++++++++++------------
>>>>   xen/arch/arm/include/asm/gic_v3_defs.h |  2 --
>>>>   2 files changed, 17 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>>> index acdac22953..463769d77b 100644
>>>> --- a/xen/arch/arm/gic-v3.c
>>>> +++ b/xen/arch/arm/gic-v3.c
>>>> @@ -703,17 +703,32 @@ unsigned int gic_number_espis(void)
>>>>       return gic_hw_ops->info->nr_espi;
>>>>   }
>>>>
>>>> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity)
>>>> +{
>>>> +    unsigned int i;
>>>> +
>>>> +    for ( i = 0; i < gicv3_info.nr_espi; i++ )
>>>> +        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * 8);
>>>> +}
>>>> +#else
>>>> +
>>>> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity) { }
>>>> +#endif
>>>> +
>>>>   static void __init gicv3_dist_espi_common_init(uint32_t type)
>>>
>>> I think the ordering in gicv3_dist_espi_common_init() needs to be
>>> revisited now that this function is also called with
>>> CONFIG_GICV3_ESPI=n.
>>>
>>> The motivation for this patch is that firmware may have left an eSPI
>>> enabled. However, we currently program GICD_ICFGRnE before clearing
>>> the corresponding enable bit in GICD_ICENABLERnE.
>>>
>>> The GIC architecture requires an interrupt to be individually disabled
>>> before changing Int_config; otherwise the behavior is UNPREDICTABLE.
>>> See Arm IHI 0069H.b, section 12.9.9 (GICD_ICFGR<n>).
>>>
>>
>> Section 12.9.9 describes GICD_ICFGR<n>, i.e. the regular SPI range, and
>> it indeed contains this requirement. However, the code in
>> gicv3_dist_espi_common_init() programs GICD_ICFGR<n>E, which is
>> described in 12.9.10, and I could not find an equivalent requirement there.
> 
> Thanks for checking. You're right, the eSPI section does not state
> the same requirement. Sorry for the confusion.
> 
>>
>> The only related rule I found that also covers the extended SPI range is
>> in Arm IHI 0069H.b section 4.5:
>>
>> "Changing the configuration of an interrupt from level-sensitive to
>> edge-triggered, or from edge-triggered to level-sensitive, when there is
>> a pending interrupt, leaves the interrupt in an UNKNOWN state."
>>
>> That rule is about the pending state rather than the enable state, though.
>>
>> Also, the current eSPI initialization sequence mirrors the one used for
>> regular SPIs in gicv3_dist_init(), where the requirement from 12.9.9
>> does apply. So if we decide to reorder the initialization, I think it
>> should be done for regular SPIs as well, ideally in a separate
>> preparatory patch.
> 
> For regular SPIs, let's wait for the maintainers' feedback. I think
> any fix there should be a separate patch and should not block this
> one.
I agree. That's the pre-existing issue and can be fixed in a follow-up patch.

~Michal

