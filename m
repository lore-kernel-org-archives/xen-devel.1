Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B9C606A332
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 07:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jsxASDJk
Received: from list by lists.xenproject.org with outflank-mailman.1493814.1693553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTZiT-0000oq-7S; Wed, 18 Nov 2026 07:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493814.1693553; Wed, 18 Nov 2026 07:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTZiT-0000oh-2x; Wed, 18 Nov 2026 07:04:25 +0000
Received: by outflank-mailman (input) for mailman id 1493814;
 Wed, 18 Nov 2026 07:04:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xTZiR-0000oZ-Ko
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 07:04:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTZiR-00DJQ2-1D
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:04:23 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afd4dec-e002-0a2a0a5209dd-0a2a4505e570-46
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 08:04:22 +0100
Received: from [52.101.43.44]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afd4df4-4cb1-0a2a45050019-34652b2c3cd5-4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 08:04:22 +0100
Received: from SJ0PR03CA0149.namprd03.prod.outlook.com (2603:10b6:a03:33c::34)
 by MN0PR12MB6344.namprd12.prod.outlook.com (2603:10b6:208:3d3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 07:04:13 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:33c:cafe::a9) by SJ0PR03CA0149.outlook.office365.com
 (2603:10b6:a03:33c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Wed,
 18 Nov 2026 07:04:12 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 07:04:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 01:04:11 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 01:04:11 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 01:04:09 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxW30yywQkuGRPGtbLipC8kotMnq049ciYQkU/zIZEBf0zokfRsEhjNX0RFdrAA1HkR7lc4/dA3X6cGmkOpsdHJsCmCJCNGH2YED5R/By/4kkuNffx0kKHn3YDKHN91NpTIN8dokIdfna11IOIEG2X3MY9QjYDInywOz10xe1u42Lkrj84KAUARt+OpoNq4HnYEu9g696bVZbQmz8Zq0AZcZ5xN2QqMMcC+L7PiYpjA4laygBCwt0cEmk+W7K+dX9NhBdLiN79rLWtTIqv1xbClPfxK9j3W2vaTzuk3+66fg5mMDj50k1/Si8UQsP3qY7O7Wrxc3M6MO2od0ibs5KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LM/d2KI04D//Hw2OGcOA2hdE66KZtkmznCAl7jnfOZI=;
 b=r/MFk22tVFjwMXS3BGZP/6rldcLSkNTcN/srVvjq57BD80AHYbETIyJgQ7ISUOyiAgpYw2j230Z1x9brSBG50FV6RKH1VJNbv5K+SoJxlh+VbQVrbg2beBrN8OZFJn15LDtic3xhPtLXoNMbwg7eJLF6PfIs4EnxAs1MDJqTGi3G8UcJK0CO1l87K/HwilhgoQZqWjW9j3TMG05pLkPyJ0jeMtp7f0F68xQvRuVsxOh/p7+p4TF8Je07O+xOcOemjB4+HIdzyeJx+y/kFDZDFSsr4CTXzdOSmqeTPogjNNFohLUQmClqyXUVKqMk/jLzxCY72m+f1/5cQKnWzU9bGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM/d2KI04D//Hw2OGcOA2hdE66KZtkmznCAl7jnfOZI=;
 b=jsxASDJk8ZFH6EP5ff8K1jnw+sROb/snkDrHpiJxNYHrKllZXYxaOEHGP5eLe+XPJ/cl7RkiSk7Hg7RE3yRTVh0eEO25EeD+ZfKfI1MIb2CKkz1ni7Upwvxbzh5Vgw9WwWF1VGBbyZdU57NfuZaLcNjn66WUA/7lT6rMJFO1mzM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <b96b6500-e8fc-4c8c-bd8c-fdf8784d2690@amd.com>
Date: Wed, 18 Nov 2026 08:04:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: vpl011: record the virq only once it is reserved
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20261114020040.4154189-1-stefano.stabellini@amd.com>
 <a1dea481-c2e8-4a6f-9a2c-9468b20144f0@amd.com>
 <3481ff47-f05f-17a1-9593-1b57cb8d0ed6@kernel.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <3481ff47-f05f-17a1-9593-1b57cb8d0ed6@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|MN0PR12MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5d237a-a6e7-4b85-e859-08df45422635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|261026121527099003|261026140227099003|261028144727099003|261021135927099003|261021121427099003|261022105027099003|4143699003|56012099006|11063799006|10067099003|261102123227099003|22082099003|18002099003|261009223027099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	R4Mfh4JbzUCerIiSyUeTUowmxqruuf3URL+VkprCscYCLX9sqE26TbUzQdS2F3Ro7G1wpyfVVbBCg0PGxr3KW8H9EiBpj8QY2uH88I42/K5eNmc6vxDQX6IN262g678PDDHK2QkwLlBswdXQ9VlUq2qQO7tsJcC/wyY2bSog/kwVFFAjdxXWpxBgBw0m/g1N/EnHMy3wfOKUjEOwLm13RRdNnxVMW9Y4sKe1xSWVWCaS3CGC+IVT4m9Qfl1xNgb0x9uatkdh619C9RaJj2qzeWfp+2rgRcsE8rU/uzXVk6AsotoNORKA8MnrFPXEoA0dpCTT5WG8SbiaR3Eh9XzVQT0Z0swsEX4BIl2jwl9RTMC1hB04ZEhdSWGNZcIQbE46whNkyteMkdrdSrJ5ELX0UTbUNp9D02YlC3lB5MMeAeYVRlmm6nPRsasyTh2eSvlbJtZy+Su4syZF+KZtFJ4jedhIsc+hebjRaa9OOjSfNqgWzXqjOxWYH4EwLFCsK/3QYF/ZtQixl01oS3Pal5mPHZdMx8DQ7JFP46QYJltf5xR7fhFWQFW8y5NNraX+UZvGaJj2TFigZVNxWaEevXfOeivLW5OIpyGca6wq/EegwB2aOdODSVKIqEDSP2nNwrdpaGB4+uVA1T72eohp5/5k5NAu9flG+0QTY6yF+YDwmEz/BVRjKcMAbGWvvE3Y+dZNhFFPMWNzuXSyArDcEq4QHA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(261026121527099003)(261026140227099003)(261028144727099003)(261021135927099003)(261021121427099003)(261022105027099003)(4143699003)(56012099006)(11063799006)(10067099003)(261102123227099003)(22082099003)(18002099003)(261009223027099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uKtYvhUoYRR/s5DCm6pd1ymOF2kITB1lLBoZV1W63MMxZ4Pr2ZvRuOMqOV1DFckmXXTrGB27idIDK6oYzlqkbHcomgI7FRByRi932fVKvZXniAKXkFCw+LJq3/lZs6dCHe+SH3D/nh5iB7ieJiv8izmhUerIRjCyhueiJmLpsyj7kivluKPD8p2eZIM30SFpiN+NMXgm+nRJqK15PRQNrtTUCshYn0Z4NTBKkqgwqoXw4PtgL3xLljfrGjaLKzF3Memhr0h56u4Y8tolKjdxRcRtJ/0yKjwIgQyz2TI2CVWOTi0rch0OhOyocHZi8Bm6OHdOmk903rUEzsYL42YGFbO6guSEJTIZKpYWNGZIBEbW9qXIy6TtSaaQDUVJ1QXcFBxKP4wZZpOavOLgVjTV98M9tOS69z9SnhB8mJlKr+rt+HKncACkFQPz39s05+Y7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 07:04:11.9812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5d237a-a6e7-4b85-e859-08df45422635
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6344
X-purgate-ID: tlsNG-c201ff/1794985462-F7CB82A1-284693EB/0/0
X-purgate-type: clean
X-purgate-size: 2338
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 18-Nov-26 00:51, Stefano Stabellini wrote:
> On Mon, 16 Nov 2026, Orzel, Michal wrote:
>> On 14-Nov-26 03:00, Stefano Stabellini wrote:
>>> domain_vpl011_init() sets vpl011->virq before vgic_reserve_virq() claims
>>> it, and both a refused reservation and a failed
>>> alloc_unbound_xen_event_channel() take the out1 error path into
>>> domain_vpl011_deinit(), which frees vpl011->virq. That clears the
>>> allocation bit of an interrupt the vPL011 never reserved, so an
>>> interrupt held by another user can be handed out a second time.
>> Who is the other user here? The virq is either GUEST_VPL011_SPI or the
>> Xen UART IRQ. libxl rejects a passthrough IRQ that matches the vpl011
>> SPI, dom0less reserves the vpl011 virq before passthrough and panics
>> on failure, and the Xen UART cannot be assigned. AFAICT there is no issue as of
>> today and this should be explained in the commit msg.
>  
> Yes, I can explain this in the commit message.
> 
> Just one note though: Xen itself doesn't enforce it.
> XEN_DOMCTL_bind_pt_irq accepts GUEST_VPL011_SPI. A toolstack that binds
> a passthrough IRQ there before XEN_DOMCTL_vuart_op would see the vpl011
> error path free that passthrough virq. I'll explain this in the commit
> message.
> 
> 
>>> Record the virq only after the reservation succeeds.
>>>
>>> Fixes: 08bbc1c02d38 ("xen/arm: vpl011: Fix domain_vpl011_init error path")
>> The SHA is wrong - unknown revision. That said, I think this should be
>> 1ee1e4b0d1ff instead.
> 
> Thanks! I can use that
> 
> ---
> 
> xen/arm: vpl011: record the virq only once it is reserved
> 
> domain_vpl011_init() sets vpl011->virq before reserving it. If the
> reservation or the event channel allocation fails, the error path frees
> vpl011->virq, which the vPL011 never reserved.
> 
> libxl and dom0less never hit this with a virq held by someone else, but
> Xen does not enforce it: XEN_DOMCTL_bind_pt_irq accepts
> GUEST_VPL011_SPI, so a passthrough IRQ bound there before
> XEN_DOMCTL_vuart_op would lose its reservation.
> 
> Record the virq only after the reservation succeeds.
> 
> Fixes: 1ee1e4b0d1ff ("xen/arm: Allow vpl011 to be used by DomU")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


