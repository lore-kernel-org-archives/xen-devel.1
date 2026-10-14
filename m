Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543B2CC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 14:31:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449145.1665067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH00H-0004Vr-HB; Wed, 14 Oct 2026 14:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449145.1665067; Wed, 14 Oct 2026 14:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH00H-0004Vk-EJ; Wed, 14 Oct 2026 14:30:49 +0000
Received: by outflank-mailman (input) for mailman id 1449145;
 Wed, 14 Oct 2026 14:30:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xH00F-0004Us-IC
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 14:30:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH00E-004vZg-VJ
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 16:30:46 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6acf9209-8faa-0a2a0a5109dd-0a2a4505e786-28
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 16:30:46 +0200
Received: from [40.93.198.0]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6acf9211-4cb1-0a2a45050019-285dc6006ed2-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 16:30:46 +0200
Received: from MN2PR20CA0065.namprd20.prod.outlook.com (2603:10b6:208:235::34)
 by LV2PR12MB5896.namprd12.prod.outlook.com (2603:10b6:408:172::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:30:34 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::96) by MN2PR20CA0065.outlook.office365.com
 (2603:10b6:208:235::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 14:30:34 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 14:30:34 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 09:30:27 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 14 Oct 2026 09:30:24 -0500
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
 b=ncvDzXR+skiQCl6QrbYAf/nZ36wxxOsveBM01SKSdyw+2dYkTuXYs300vNvWgBnay9TDuGkVyqykjvLyzk4GnfJJFWn1aEPAdq+vpFA3WLCtGHqgD7VqO4R/NdIg8Z05zXm8gvly/f4TeG/0Iy7A685Zm4JASOXhELB8vj1ldECkuCSrlMFvdI+ycx+AxsT+lYaRCskadSuoYRslxdZzc5kK9MkLb+m/dkvbkXHeWLqLlvG/WsgW40Rq8WaKP7pSjwlnU/RKknwNNjWLt18U63/La7kxqL8LTMoVzOsN2JU6y/pdiKt8ZDzKLFt/q+9EYpjBkMMTOg3B/5o85VAxNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioc7bLvwFb/grCV/t3XLkmmTzee6JtBXWFbcR1bznHw=;
 b=GlkhGyjKeP75O6Jj9J+vS64hiHxOkkzIWy7kv839gRl7JE2Cgoo8aox94hn8XYxr8Fjo7pFotebGWmFrIP5kHG1zDKMZ2XU9P3zKBivo+aOOK37wUJj5OiePLhJ+H4dzZYNCL+HG5RZDNNgLG9jEW3A73p1dqHfbdVtdHEoccv98GiEBORIcQ6zWMM/dt/qxU42Jn/Gyj3OokTkTQnH4aVjE5toclb4hg/5NOUtwOLaH98Tflx7CXw6qAV5rMstjNoJ59T8ozpKiZI6xbEqOXCgVSytvWwjONqWZMJRmdev32w/f6+msA0w3MtHBYnbTADR9gmyZHsfV0UXe2u+dbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioc7bLvwFb/grCV/t3XLkmmTzee6JtBXWFbcR1bznHw=;
 b=WuOwJDXmxK6yc5umfU/WfW1aj6mGfhA+dtkaMSdnyoTy4Blrg8TfA7G4a4n1EEn2NAHOKoVc9cwrAFLtbtCO8hLgDa5vUkaTsaCSY1UiNfjiOqFEUybsQPYFs9g8jLw5Ufyx1PbqfF0UfYFigHSDqlYhs0JzEbc9rFYDj55l2n8=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <c51c366d-39cd-4143-bf20-37ad3919ed71@amd.com>
Date: Wed, 14 Oct 2026 16:30:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Fix ARM domcreate
To: Julian Vetter <julian.vetter@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, Andrii Sultanov
	<andriy.sultanov@vates.tech>, Guillaume Thouvenin
	<guillaume.thouvenin@vates.tech>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Teddy Astie
	<teddy.astie@vates.tech>
References: <1791812199.8631fc262581453bbf619ec5b2062170.1a13054627300080d7@vates.tech>
 <2482f3cc-e9b6-48d9-b8d5-a463feb82dfa@amd.com>
 <1791977870.8631fc262581453bbf619ec5b2062170.1a13a3453cd0008425@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1791977870.8631fc262581453bbf619ec5b2062170.1a13a3453cd0008425@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|LV2PR12MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: e7dfa392-0153-466b-4f16-08df29ffb528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|36860700016|82310400026|56012099006|11063799006|4143699003|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	degR1IknP/gqNumEe2KXym7CDt7VnY9DiiGJm2Hs7vXfTadGbtYJPVwOVtE2KFMapmMUzR2YfvS5KiKZLkvzbwBnJKy7QUhmQ15zJ3uQnAwuh4YWL62xMqzJNwrRTrLKccwfmaMzOTPs7O1KhVWpwLnscnBLMpUd9MOJ/DJD/m6UYpMtZoERyw/X81yJYTugYTU2z5fjyXLpto78SrIr4WwbOahHJ0s1PkKtXRMb7Vg8ONmf1aWQyG5AaA9OZPd613o32blQJlJR9QYwrqg0HXIQWUZ0coJAPWx/uHMVvkY4S2IQ8cJIYVoz6aayGOBvk2guTJPX0KtbrKblfSPHCQgA19rLtrvKha2HOzQdqApxyJ3P8jn59/uLjgt7bkdlQtYJT2f8lu6tyGfCdHVNgBiF3VVt1eIghHkrfI9Dy3mTr4xofa0cur9xl9qCycTr+nMv5DTGsrMgIbKqPN7soJs+QdIwuIKFgCnDCGQNQqnBbnrQOw+hfvtfbY4ASXa7egCkjCLujUoKASjRu0Z36qBIP39J4941JBPa2F4hlCTv0yj5ZiWSLNePXbXo5nD/hNK3kBVmK68YnC8cNDShBjNhbDfKcPdHuUBrLD1YV2YLhydLz2i3ARgYpE7ajo5kvl4yeq3+FJuAmtNX9Thb1TSk1i1oHD68r35IJ3m42jvGTKaXDh/Vvc+mZu3xcACBkaOwNBxTOk0LkPDECb1TWg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(36860700016)(82310400026)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mPteq/opef/wEd5u8q7HFFHLVYPsSiH4+1F6dLAwSA1+dEkL9NtbEDIMUeQ5Ux9SUz1f+oq4UWxDVlRJU23eiq+UYUN1zCw7bE62dT1pNqLDKCLt/jTQV6gZf36CQqAj9slqMtHchBPqwg1qe0G9BrRL0D8f6aaZuUBNqQTe2ekWlQP/6HE7BjL+lMi/FHgOe4tCAgOJEnRYgPjQdAhWsuLG3NsOIUk3AFFE663P3fv1jehb8LoushX/fCzELlW8ktZFUOa4Cp8rhbvru+W+IqdrxXBdh5YNjzmEgq1oMCTNXdqjU4jarJuO8AZfCKGU56DY4HuMWFYF3QFv+y7Pw3/42RnVm6JaxaEjJh5xZ0ENlGX498Mou4CH7JlKK4inyDGJesKUNILGQ7bhmlMemTAhnf3GFH770JbJ6GsOLoZXPJTFHY45S+vZtj3l4POZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:30:34.2167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dfa392-0153-466b-4f16-08df29ffb528
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5896
X-purgate-ID: tlsNG-c201ff/1791988246-F6EB12A1-2A5F8DFA/0/0
X-purgate-type: clean
X-purgate-size: 3242



On 14-Oct-26 13:37, Julian Vetter wrote:
> On 10/13/26 2:28 PM, Orzel, Michal wrote:
>>
>> On 12-Oct-26 15:36, Julian Vetter wrote:
>>> Hello Michal and Anthony,
>>> thank you for the reviews and acks! Michal, I have addressed your
>>> remaining remarks on the "xen/arm: report clock_frequency via sysctl
>>> physinfo, not createdomain" patch. The golang bindings are regenerated
>>> for the new arm_clock_frequency_hz physinfo field, and
>>> alloc_domaininfo() no longer references the removed clock_frequency
>>> field. Apart from that I have collected the Acked-by/Reviewed-by tags.
>>>
>>> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
>> I was about to commit the series but I found out that some tests like
>> test-mem-claim and possibly others still pass gic_version=0 which will cause the
>> domain creation to fail. You need to update the tests.
> 
> Yes, thank you. I didn't see this. I have fixed the tests, and ran them 
> on a QEMU setup. 2 of them now pass the domain creation at least just 
> like on master (1 doesn't work on QEMU because there is no IOMMU 
> emulation?!):
> 
> ```
> @@@ RUN test-mem-claim
> Memory claims tests
> Free pages: 254208, Oustanding claims: 0
>    Created d1
>    Failed to populate physmap domain: 16 - Resource busy
> @@@ RESULT test-mem-claim rc=1
> @@@ RUN test-paging-mempool
> Paging mempool tests
> (XEN) [   28.386587] common/domain.c:845: IOMMU requested but not available
>    Skip: 22 - Invalid argument
> @@@ RESULT test-paging-mempool rc=0
> @@@ RUN test-resource
> XENMEM_acquire_resource tests
> Test ARM
>    Created d3
>    Failed to populate physmap domain: 16 - Resource busy
> @@@ RESULT test-resource rc=1
> @@@ ALL DONE
> ```
> 
> But, unfortunately, these tests seem broken on ARM even on master, 
> because on ARM domains start with an empty P2M pool, and since these 
> tests call xc_domain_create() without setting the pool size first, they 
> fail on the populate physmap call. I'm not sure how to proceed on this. 
> Should I fix these tests in their entirety or leave this for another 
> patch set? Thank you for your advice.
In that case, no need to fix these tests in this series.

> 
>>
>>>
>>> Andrew Cooper (1):
>>>    ARM/sysctl: Expose the supported guest GIC modes in physinfo
>>>
>>> Julian Vetter (4):
>>>    tools/arm: choose GIC version explicitly instead of relying on
>>>      GIC_NATIVE
>>>    xen/arm: remove XEN_DOMCTL_CONFIG_GIC_NATIVE from the ABI
>>>    xen/arm: report clock_frequency via sysctl physinfo, not createdomain
>>>    xen: make config argument const
>> Here you are still missing tags from e.g. RISCV I think.
>>
>> ~Michal
>>
> 
> Thank you again for pointing this out! Unfortunately neither PPC nor 
> RISC-V have a formal maintainer defined in the MAINTAINERS file, so it's 
> actually "THE REST" responsible(s), which is also you ;-) For RISC-V I 
> have asked internally to do a review, but this will only add a 
> 'Reviewed-By' not a full 'Ack'. So, not sure what to do about it.
We usually ask Oleksii for an ack. I can see Baptiste added one, so I'm good.
The series is ready to be committed. I'll do so later on this week.

~Michal


