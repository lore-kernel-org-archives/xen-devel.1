Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5EBCA9ED2
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 07:32:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445849.1661700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGAWC-0005CZ-3y; Mon, 12 Oct 2026 07:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445849.1661700; Mon, 12 Oct 2026 07:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGAWC-0005CS-1M; Mon, 12 Oct 2026 07:32:20 +0000
Received: by outflank-mailman (input) for mailman id 1445849;
 Mon, 12 Oct 2026 07:32:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xGAWA-0005CK-RB
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 07:32:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGAW9-005BA0-IC
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 09:32:17 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6acc8cfb-bab6-0a2a0a5309dd-0a2a4507d784-40
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 09:32:17 +0200
Received: from [40.107.209.46]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6acc8cff-b4ea-0a2a45070019-286bd12e4ce1-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 09:32:16 +0200
Received: from BY3PR05CA0032.namprd05.prod.outlook.com (2603:10b6:a03:39b::7)
 by SAWPR12MB999142.namprd12.prod.outlook.com (2603:10b6:806:4e1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 07:32:11 +0000
Received: from SJ1PEPF000037AB.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::6d) by BY3PR05CA0032.outlook.office365.com
 (2603:10b6:a03:39b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Mon, 12
 Oct 2026 07:32:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037AB.mail.protection.outlook.com (10.167.244.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 07:32:10 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 12 Oct
 2026 02:31:58 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 12 Oct
 2026 02:31:58 -0500
Received: from [10.27.77.50] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 12 Oct 2026 02:31:56 -0500
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
 b=p2PULSOcAM9VJIi9Z2/rjbDb2ZQ6GCjBEOXgxVeQwfB//VwXk8Rcu1Yh8lN4eb/QuORTsZWQY5kuWJm2V7v1on0hJw6k1TVAY8OM8blB6IWbAEsiLRShw6poyEkz7ARhNzkzYqfyrDQ4VqYyfhX9rAPIMsugEyhDs8CX5LJSvNSUvHHKMyF26nHQKP26mzxS8x6A3c7KMbijE01XoMGWT5JBkcCX+BMDbPDQTLvGvFJU2mqmHkwUfH7DBkgwkdILyCDTK5xdpYznprIoJ0K1tV9CQaOMgq5fYftRb8iqT89mYvEuYk3z4Cc+NmS+ED/AlzBu9rJr1m9XFC6Y7sP1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MxTUYpqdo3ktSYxb0sZm0A+NJ1qRXX6YhLwnGe9o7Y=;
 b=bwYd2ZqsiN4D3+gLKCA0nYie1zA8dLXielZ0yRQjkIpZz5+ii1WqfSbepIiCeKeR+5XWPLXF3z7nQ8ITf9KUcVLe6ATEXRFGc2Jb6sC3NK8riJAPG+VuwC3cC6EtrwLPP/RaE59nn/f8bLMy8gz7uGR4AIMdljX0NGgh8on/zk1QJn7bQl0YTZlEn72Ny5/ytl4FRLxtHPNIJ1EJIKLGl4Q95/5gHcfoSAvZCjDfE0ty/Q8yZW3fAGbr2ffeC0oUJwzCtmAwpYDWNTWN5PIX2q1YKGVgFozgl1/pcMBJ+KKjVKEkNXM6XbkKfanwmTyO1749Qqi2S94tiVcJMNTK7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MxTUYpqdo3ktSYxb0sZm0A+NJ1qRXX6YhLwnGe9o7Y=;
 b=wtqFS8wNBBxtw9FkIP6qXmS5qy7cxaus0s1fnrLpxDG7L9fWWZONIpxr/jj+0cVXhZRJ5bf2acTCFgCcfdIKXl0nCE5lTwYP0LBwpHwmvRkH6dbR9iGt3024Z6TNM/1bB8sf1Jtc2op3f/AQ6VTRrEO70/3yqGtqZJPBEfA1l18=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <9d970022-6b08-421c-aca0-589a0b5c2c27@amd.com>
Date: Mon, 12 Oct 2026 09:32:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix under-mapping in map_range_to_domain()
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20261007135848.220047-1-michal.orzel@amd.com>
 <055dc887-0cfd-4274-a5f6-e5afdd576746@xen.org>
 <9a4f56d4-4c2e-4d5a-8489-9300170729a3@amd.com>
 <71defbe4-44a1-4b76-8d0a-bcc6ab40515f@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <71defbe4-44a1-4b76-8d0a-bcc6ab40515f@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AB:EE_|SAWPR12MB999142:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fbc0f5b-b930-48d5-4531-08df2832ed8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|10067099003|5023799004|11063799006|4143699003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BqV7DRvHDkHxaVYoYMfycCmmOnNkxBpDeW8FxcFIW9adOGI+BLffS7/cQ5LWJll50CNRAXy4a3CiaXzZMaKZeuDxQX8LlR66BFI3MLofVI10iFJsIt4v0c4fKNfN6QcGWDPgPdBtfHfsLHNc1XLuewICJNS23DtulXlarFKDQVUmBRzfxrwhDabtOp9nt6skjQn/2hrpJGNjh7nKU1XjJIZj32jq9uxcq+ukJXvJ0wQUo8TpBHOsLTEPH5Chzd4O6SqwNgl4uow5sNiH8QuCcZL96XRD1gZ5Ttlji++5HQheC/CoecR8yZ5wspoW7smiZ1fRw7CIlAKOWiJapWaaiyiITS3Z1lxHSQXLvRA7575Fpj2kTZ4BYQnbcQE9z1MpNTwF1q0o4zDF496EcMUFufh0dvCBfL8c87rYi7rUnkTvv9K7NhzENm5JDrDK43zFAMfc7t5LkLM0zDheYh1AZ6ff2ELN1/K7SfBYcBj7Nkqm1zj+z7FLOLv9anLIOJ2qhR1A3B5qnX3NDSp7Rd0Gv2Hqm0nRt/3N16fsg5EqKfVSBiF41BELYrCEjyIaJT3eUNooRrVKuwOmZyzSvOfxxFwghlm6N7UhrDzKxxg/67x86hXZHYSe4MLF1q0nDiIng33V7qgR3Re9tUh5Xg7Pp5dToSWY0xCT3tQkyMPiFqiSLdBCfNRXzG2uvTUn8KFYyOaPm9MKS4h2oykTJCl+WA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(10067099003)(5023799004)(11063799006)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xkJSNGv/06ZaYPoEwgXnzExPSH9cm4OXtAgiBufPsJiMgPxHDABwSO63HSEdtShEcyH1ZAGIWcKDC3ylLG6IzbGSh45VVgxhPlCjlcrC5bbmpqNX6Zt4kHWBpMT0cGhoWib9eE9f7eqIHeYNdxqyo92gGWZAR9MkpWE14HaMZ4nZ5E8L9ARN2Zu2MzPaG3i7uL3F+o6pdFRXxgei2EzxPlodlAd9MtdRSilXtzaDHpeYwBqO/jlAhty/8TCTAKb4dPYibTHKDy9x5FvnqUCCa9Chh59x/GO2T4Q3QGnclD2E74PB+GL5KHNU+AenJHWu7mIOYHEGDDOxWxcB7eFPXLmG16aPQX16ks6qiccTPk/xSXCDeRXItMQXIanHBL69t4egcHkiE12k5GG7JuFik5OoubidvS5QXChb/JxGJc1vhAI7VjoPhTbrflUWop4t
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 07:32:10.7694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fbc0f5b-b930-48d5-4531-08df2832ed8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999142
X-purgate-ID: tlsNG-ef75cf/1791790337-360C5AE4-7790CA99/0/0
X-purgate-type: clean
X-purgate-size: 4267



On 10-Oct-26 12:38, Julien Grall wrote:
> Hi Michal,
> 
> On 08/10/2026 11:50, Orzel, Michal wrote:
>>
>>
>> On 07-Oct-26 22:20, Grall, Julien wrote:
>>> Hi Michal,
>>>
>>> On 07/10/2026 15:58, Michal Orzel wrote:
>>>> If the memory region to be mapped does not start at the page boundary
>>>> and its end spans over the page boundary, map_range_to_domain() passes
>>>> a number of pages that is short by one to map_regions_p2mt(). Domain's
>>>> attempt to access memory within that page will fail. Fix it by calculating
>>>> the number of pages to be mapped taking into account the start offset.
>>>
>>> Can you provide an example where the caller doesn't suitably align?
>> Sure. Example is handle_device() being called on the hwdom DTB creation time for
>> a node whose address is not page aligned i.e. /reserved-memory node or basically
>> any node, given that DT spec does not mention anything about memory region
>> alignment and there are existing DTs like that. With reg = <0x0 0x800 0x0
>> 0x1000>, today we only map 0x0-0xfff and an access to 0x1000-0x17ff faults.
> 
> Thanks!
>>
>>>
>>>>
>>>> Fixes: 88c10b0d6eee ("arch/arm: let map_mmio_regions() use start and count")
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>
>>> The fix LGTM in the current context. However given map_range_to_domain()
>>> is now used in more places (e.g. overlay), I wonder whether this is the
>>> right decision to allow map_range_to_domain() with non-aligned region.
>>>
>>> Imagine a user say "I want to map 0x400 - 0x1000 to domain A and map
>>> domain B "0x0 - 0x400". This could result to interesting behavior if the
>>> user is not aware of the alignment (this would become even more
>>> problematic if we decide to ever support different page granularity on Arm).
>> I agree this is not great, but this is not something introduced here:
>> iomem_permit_access() and the iomem_ranges rangeset already cover whole pages
>> and we already map the full first page.This patch only makes the p2m mapping
>> match what we already allow.
> 
> I am possibly misinterpreting what you wrote, but I disagree with such 
> statement. The fact existing code may be wrong doesn't mean we should 
> continue with the wrongness.
It was just to clarify that this patch does not change who can access the page.

> 
>>
>> I don't think we can reject unaligned regions in map_range_to_domain()
>> though, as the host DT is not under our control and hwdom would fail to
>> boot on platforms with sub-page devices. I asked AI to look at the Linux boards
>> for Arm and Arm64 (140 boards in total with unaligned regions) and even the
>> boards we claim to support have nodes that would fail:
>> - RPI4: hdmi@7ef00700, <0x7ef01f00 0x400>
>> - IMX8QXP: clock-controller@5b290004, <0x5b290004 0x10000>
> 
> I am not suggesting to reject unaligned regions when mapped into the 
> hardware domain. I am suggesting to reject it when we want to 
> passthrough to another domain. So we don't end up in a situation two 
> different devices on the same page are passthrough to two different 
> domains (or between Xen and a domain).
> 
> Codewise, it would mean map_range_to_domain() would enforce the 
> alignment and the caller will be left to decide what to do. We could 
> also decide about the alignment base don whether this is the HW domain 
> or not within the function.
For passthrough this is already the case. map_range_to_domain() does
not map anything for nodes with xen,passthrough and the domU mapping is done by
handle_passthrough_prop(), which rejects mstart, gstart and size that are not
page aligned.

The remaining case is the overlay which can be attached to any 1:1 domain and
this goes through handle_device() -> map_range_to_domain() without any alignment
check. All the other callers operate on hwdom, so I think we could reject a
region that is not page aligned if d is not the hardware domain, before granting
the iomem permission in map_range_to_domain().

Shouldn't we accept this patch as is so that we can backport (overlay is not
supported) it as a fix and then add a second one with a rejection mentioned
above that will help the overlay (and any future) case?

~Michal


