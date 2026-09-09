Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCA0C79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 20:08:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413664.1643762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4OaE-0006Cc-PS; Wed, 09 Sep 2026 20:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413664.1643762; Wed, 09 Sep 2026 20:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4OaE-0006CU-M8; Wed, 09 Sep 2026 20:07:50 +0000
Received: by outflank-mailman (input) for mailman id 1413664;
 Wed, 09 Sep 2026 20:07:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1x4OaC-0006CG-MP
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 20:07:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4OaC-003nvY-2k
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 22:07:48 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aa1bc64-bab6-0a2a0a5309dd-0a2a450bce7a-28
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 22:07:47 +0200
Received: from [52.101.56.15]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aa1bc92-b7e8-0a2a450b0019-3465380fbe6b-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 22:07:47 +0200
Received: from BL1PR13CA0099.namprd13.prod.outlook.com (2603:10b6:208:2b9::14)
 by SJ0PR12MB6927.namprd12.prod.outlook.com (2603:10b6:a03:483::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 20:07:40 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:208:2b9:cafe::8a) by BL1PR13CA0099.outlook.office365.com
 (2603:10b6:208:2b9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.5 via Frontend Transport; Wed, 9
 Sep 2026 20:07:39 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 20:07:39 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 15:07:39 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 15:07:38 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 15:07:38 -0500
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
 b=r645R55wjpqgnhqxdzM/ms7FZSpnLRXeNWiZEt5YC2SQx2oUUPoEbRxWGJPZMapxIH8bPDHp4thObFYBYz1eFfaDQhMqHu6vJ6A0s067mFhgt3i1Aaan1bcYW675lFGb41udb0TWs/AqZXarlgmrkCwSsZkLPJcSBSgbMWQTUoBQJwBUvxfuWNO8lhZelexI1imPdQqeAEd64A2hhbxSsODOTG2hEEQyK6lDIqPp1FzzCFrnRd01R+ZH74/evtxdfp01Un4jK4XirNx0kQus4IMwaNut4LKdH7DbK5h9ZNHY0SiC46nLLP38zvr1xTqtew5GtNbsNUKbxDn0OghX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0gX/DTWEj0mwqiaGPrnbN628OX8x2I7RIGGS0EYmiQ=;
 b=rEQ9LzKW/dVssnGIvjEHTD6bdXswL6QU3+c+R8rPyfrjQ1FU1A1ysA7q8RRAxsNWc/AQb6KmcNxOnTOr1/8H0dJZ1tjKny1jCPkxcLDYyGv1r7WyrOt6jPEpvVMqpFi/XIj7bA3pnceCMUzdwdkOMe/bid0g+ILglcH0ZyZaN40lJsdvk6DIS2Qlo55Q+CCXVoMhuiOoC7lziOaUfpHPXq4YfZ8lOL40mT/QrM85wNL4+Nl8WzHLBHTRTv9aQ7vaXjvyt7Q3wTRILIG1l6kb2qkfqxbD2ACDeeLdfpVeTCpDycosXdER5wEmksAZFwi4mfMu8zy8RRChZcwuuv0Qmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0gX/DTWEj0mwqiaGPrnbN628OX8x2I7RIGGS0EYmiQ=;
 b=va25Tgt5o6NRiAoYWAgJNvy5/EfvaaPR+tkMTQf1njAH/9Xk8OIhnW3Gv+++9/rHwRU+n+73D9bUsjE7/zvSn08BUPzQfno6/9TPeEr35EBzApwbiAhL5H1gSiRfmwkqZkIEH8cJeP6YgwBQtFt/GR867cGmC4gsDNM5jFNsScg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <22028c12-2400-4131-8e5e-b2dc7a65326f@amd.com>
Date: Wed, 9 Sep 2026 16:07:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/mm: limit deferred TLB flushing to PV domain
 support
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20260909140500.73483-1-roger@xenproject.org>
 <92c9bf4b-5171-4a26-a62e-f2a7b1cb89ef@suse.com>
 <aqGJJTbVNID0Rq6w@macbook.local>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <aqGJJTbVNID0Rq6w@macbook.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|SJ0PR12MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: aba6d6ff-9017-447a-6607-08df0eadffc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|6133799003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CvVI/nvndqp7wsWqPayQEv954hMYkt9Sc1dqkl2fYGOAcaEmSSSMAQgJgHUr7jVEEdkOGwKkrxs6LlQlS1DmIACcHwAK+BwMq5V8SxwR6dkePEDW9K+0bqWG3ch8XpbxMzQVO5bpmkjkXwvQ4m6Y6NB2wBnFYDgS5iSnC3LfK3FSGTSn6qdBaJYaFeR2ujMa9hu1+I0dI/AQqOLl2t8ZWqq0ow/7wtU/IyAIZnu5qH8wZ/Hj9FtbW9I24lQTfOxV2ZUM9orU2O82B2Ay0wEvQmlXMKMuQNClFtxbhuCR3qr8qShWqJgl8u9h4eGjK/ZDdnppfHynVz252w70NEsGOaYMzmQ61VKWHCnx6Ki7GLbPN4oS3vnTMUKjiimceLpmQp8xLgqxO/HZNX7xkHc/kR9RFkAmdrhdD+F7LL5bqmuZP/hiBRKCLqE91QGEpjlYzNQa3LvChmoobA+1w2et1AN0jKJfn601UvBKGU87FeABaH7U1iUHwg0vfpTFk74j8Li+3upYYnu5L+hOfdU4PiPgoa8JLOSRb3+ZHtxtMKfc6Gq5dn5oZVxm2IlZbQnXw4UgTU9omLvew4ciD9CqdWjg7T42CLJScO1VcZjsI4FnSVENImiKZUrY217ndiDClNg8htP7ki3v9jzciilgW+7tpBGpJJtCLhRt1DaMQTCnuLNZhoBM2usWM1qpg7ccj593CviUoEYJUmjQsOWeGA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TuqQFBcxa5b8YsbsaQhhR1D1r5PupoqJ0ofHY3tFnVskzHKvA6bgbQCaZaDXDCrEPH+JFJeuroYASW4poZYU5eJM/P4BbQhEjYonmbSKZWDtVJh6UghlmskZLto942djsqhy5jAdP9rvS0YCIuK1CsCofHoWWzkNinfEKHi6zUE5kKDlSau8LvMuGP+TTmnuuGWnnKrn+jkb5qhNa8yDZcTTSc/+A1oIpu77Jlv5j30wbjnxQp1TZI8nBZthNEhKR6NnGC0WI41NA3ZyTxL5KpZ6Z5DnAhYec69NFlAkww1w9XPqRod/kmXoHjAm56YitXbccDrGRikV0XhXOqZrnk0tnk9h/LZ5sO5BqvTi0vzEZv3UpdTSAl/H7K1EFaA5L+zF08/nyoPybJBEuEj4s9MNotcHbbYmY9pOeX2YBGXOaC4B5F2q8FstUrSN0Ui4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 20:07:39.2494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aba6d6ff-9017-447a-6607-08df0eadffc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6927
X-purgate-ID: tlsNG-42698a/1788984467-1B4D39EA-79AF346B/0/0
X-purgate-type: clean
X-purgate-size: 2206

On 2026-09-09 12:28, Roger Pau Monné wrote:
> On Wed, Sep 09, 2026 at 04:46:01PM +0200, Jan Beulich wrote:
>> On 09.09.2026 16:05, Roger Pau Monne wrote:
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -1538,8 +1538,11 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
>>>           BUG();
>>>       }
>>>   
>>> -    /* If a page has no owner it will need no safety TLB flush. */
>>> -    pg->u.free.need_tlbflush = (page_get_owner(pg) != NULL);
>>> +    /*
>>> +     * If a page has no owner and there's no PV domain support it will need no
>>> +     * safety TLB flush, there can be no stale TLB entries.
>>> +     */
>>> +    pg->u.free.need_tlbflush = IS_ENABLED(CONFIG_PV) && page_get_owner(pg);
>>>       if ( pg->u.free.need_tlbflush )
>>>           page_set_tlbflush_timestamp(pg);
>>
>> I'm okay with the code change now, but the comment is still concerning me.
>> All by itself there is no reason why stale TLB entries couldn't also exist
>> for HVM guests. It's just that (a) only the host TLBs are flushed by
>> filtered_flush_tlb_mask() and (b) flushes of guest TLBs occur when pages
>> are removed from their P2Ms (aiui; hopefully true also for Arm). IOW what
>> the comment says looks to be correct, just that it leaves too much to be
>> figured out by the reader. At the very least I'd suggest "..., there can
>> be no stale (host) TLB entries." Thoughts?
> 
> Hm, I find adding "(host)" to also be slightly confusing, as I would
> usually associate host TLB with Xen context TLB state.  Which is also
> made more confusing by how PV guests share the page-tables with Xen.
> 
> "If a page has no owner and there's no PV domain support it will need
> no safety TLB flush.  PV domains are the only domain types that can
> keep stale entries on the TLB, as they have (limited) control over the
> host MMU and when flushes are performed"
I find "will need no" a little awkward.  Maybe:

"If a page has no owner and there's no PV domain support it does not 
need a safety TLB flush."

or:

"If a page has no owner and there's no PV domain support, then a safety 
TLB flush is not needed."

Regards,
Jason

