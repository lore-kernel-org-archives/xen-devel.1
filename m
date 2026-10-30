Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E281A606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 08:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rYdG1woc
Received: from list by lists.xenproject.org with outflank-mailman.1465469.1676001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMiIj-0002fx-RW; Fri, 30 Oct 2026 08:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465469.1676001; Fri, 30 Oct 2026 08:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMiIj-0002fq-MU; Fri, 30 Oct 2026 08:49:29 +0000
Received: by outflank-mailman (input) for mailman id 1465469;
 Fri, 30 Oct 2026 08:49:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xMiIh-0002fk-8D
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 08:49:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMiIg-008yeb-6F
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 09:49:26 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae45a11-e002-0a2a0a5209dd-0a2a4508a1b2-4
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 09:49:25 +0100
Received: from [52.101.56.41]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae45a13-f659-0a2a45080019-34653829b11f-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 09:49:24 +0100
Received: from SJ0P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::24)
 by PH6PR12MB902451.namprd12.prod.outlook.com (2603:10b6:510:3df::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 08:49:20 +0000
Received: from CO1PEPF00018860.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::1d) by SJ0P220CA0012.outlook.office365.com
 (2603:10b6:a03:41b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Fri, 30
 Oct 2026 08:49:20 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00018860.mail.protection.outlook.com (10.167.249.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 08:49:20 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 03:49:19 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 30 Oct 2026 03:49:18 -0500
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
 b=hv4wF5aWkyvjYE6YwSZLM9vLzKPPxbR8kXL8wtQMdVwf7NJieGDzSSSJLFNaDxYvkqv70V+2towlzoDbc5C0gNnYkOFW/UzOJ+mEH4vBFshMqCGZGP0qbznkEyIQUp12qv4wFMCs++A4eMIqDBtdXajjXc7mNfiRjyR0v2b9foWbHtzfbmk/4nH4gy/Pj0fwIQ2PofXWGKctPdmu9MBL0ETXHtZIL1tFl1lDP5+6rt9ZprpI5vZtCE+C8EQP5urcCbwJSiXaEg/B/g99EqLifKcoKAsap31E/CJsVJ8IR96DvQjIz2LsYta8XdkzaYoRpLYq7hlLeYLCpFzfFy6DNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXGmtj+iz10g+AM3qEIZdYwY3Unl0j7ECxtlYWcVhHs=;
 b=jHWvVbrXqO46yaEsEZ1T/DQNDrQeDB8aN2xDaJEUGi3bADc5zFuREzLKCRJh4Y96HhL+0NO2m4jzbZh2kpm8H5Bu/5K+lL2zrVzJqA39P0lYMoDcATV98HInzE6u+V9aM2f2AjItnTHC+o7PXiGBMc8OYaNhd4vN/NpamyvpMjFySZ9UzD2RYnO04nBkrNgFvpFfpDc2yVqBtl2w74TnZCL9TnxBlkaw08i0Em09peVnI+lHmh7PW+3iN7OSArVZK+reupTn2aKk6KeBnL8q++sVEJXIXHSXeRHxyWpTUy9amg9W2bS1zVhgTwBS7YIgtsMpTx+3fvjDFh74VmeGgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXGmtj+iz10g+AM3qEIZdYwY3Unl0j7ECxtlYWcVhHs=;
 b=rYdG1woc2BtTUNvARk+uWU7O1wabY2AGd9N8qZw5gLmjqRrtEzSU0/Mz7jJNHuqtCIYbtDQoVrrfVLNUv5FeIdiBqXggExbgsYA9oEyKFnbGa06LwcDJuVTkSxjd/TVWya1N6kXXdPEKSYmygSWamKtP4bhSzpXg+d8MsKcOGWQ=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <12b11b1a-7238-42fb-a157-a3b5afe305bd@amd.com>
Date: Fri, 30 Oct 2026 09:49:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/dt: Don't advertise Xen static-heap region to hwdom
To: Kuan-Wei Chiu <visitorckw@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <20261029104305.169036-1-michal.orzel@amd.com>
 <auQSEsdNOCjL53Y6@google.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <auQSEsdNOCjL53Y6@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018860:EE_|PH6PR12MB902451:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d9973b4-1e7c-4728-7938-08df3662b086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|261026140227099003|5023799004|4143699003|11063799006|261028144727099003|56012099006|261026121527099003|261021121427099003|10067099003|260925021911599003|260925022911599003|260925021311599003|261022105027099003|261022075727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ee41KT2TbT21YnYdL6vF7bZISWJC33c/7KK1wgd/Fv7vX7V/d4yWCDgc8ImDKo2RgBRvGyLbH7E/AxFm9bDgQz7usfXRongwPzlbrUJhPMsNJTYuC33BuUez5SQKWYEWeqOWvuLcRffLrP90pyGc21KIrAFvADoguO5YO7ybjro1ncJ+gPYUjHXSCvzjRNTXygSfKwQwA1UsFRt6hwEPWS3ajutz2JlY0TM3CNnAp4VGtw7kK2nVTa4fhYc+4EkrOqpBmcB6VAXeUuS5nTDk7HqFiXV2qO7vuiBaZZQWnVODLUZwukVFv3xzzfsQkbNzxcbfIGv0UCGDhQsANN/Wq9OPOpDiDJK4vWaNZIZ4ShQgb7AHfzOq2pQOl8mavtrW/jJo4qF7MUrfEkWTaBZJh1GtpfXnYvbl69uZARbhDrGaoR+TZJObkLwJsk4/RBCTCk1tYm9cuMFY3p0Svyp+aR+qGkS+7JfXKV7w8r0FXu5CF0SYd9Z9M6kLv9n+ZvUb3AmUplaE+0oqisLLWUo5dXohzw9D4Hm3frvrwssdql4IK8dB8Wx2pn8VW3cnKZGyPLYM+0AksyCJLrO0JMlZqcfoMu0jbjKNZn96BtAi/7O+zvOgzUQhqerbeiFjjuEk6a/47UmOw3DSqvoB/WA2zy/10gDTen5RqtFEjgeN0N8PU7X3THUYvEfYoETzj1etQk/onPyvx5wxrqAA2xKHHA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(261026140227099003)(5023799004)(4143699003)(11063799006)(261028144727099003)(56012099006)(261026121527099003)(261021121427099003)(10067099003)(260925021911599003)(260925022911599003)(260925021311599003)(261022105027099003)(261022075727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xZ3wisHkZ4NSY4eYXU0pGtQ3g38BYA15l4FRRzxkR3kj9MpTVaIfsGfdz/Nbq9+rmuATNkJWJrQ3gT2GOZwad25LtnJpqMKJzuA6DCpNNwC/W8w8wXzSajIjSUUk2x4my20B0wQb1LPbqySalK18OaKQL8yqXcMxQuqRQoRU1WVgFjHApeRvq4Cpv8s3qyBQLclBYJ9JGdm18NhLJ0JZFQ1ZPTbVjlhrPAGTAThNAOyyoJI4LLtVMtniLUOC8CXDqnrqvstCercpPY2ctppx38rIdGPC5akpwlODDmWGiHNSpjUx7GieC9Kn38K2+/idRqR5WpY1MEvNZwkA8jHlyPJFvD2Bwxuik+ck/tngZWralwqvOYHQrWwv9LkwlY0yxVe42HOOALo7DdJdQ1ecxqRUfJNuSVXU0f9xOg0Kje413u1cAJjQZbO9NMsHwvof
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 08:49:20.4839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9973b4-1e7c-4728-7938-08df3662b086
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018860.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR12MB902451
X-purgate-ID: tlsNG-c1860d/1793350165-CF75B87B-C9C36AD3/0/0
X-purgate-type: clean
X-purgate-size: 1300
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 30-Oct-26 04:42, Kuan-Wei Chiu wrote:
> On Thu, Oct 29, 2026 at 11:43:05AM +0100, Michal Orzel wrote:
>> bootinfo.reserved_mem is used to store different types of memory that
>> Xen considers as reserved: domU static mem, normal /reserved-memory,
>> FDT memreserve and Xen static heap. make_memory_node(), invoked during
>> FDT generation for a hwdom for reserved memory, only skips the domU
>> static memory and FDT memreserve. This results in advertising Xen static
>> heap (if used) to a hwdom as /memory. This memory is not mapped in P2M
>> and guest attempt to access it fails. Interestingly, if the
>> /reserved-memory node is placed after /chosen, there is no problem because
>> of the check at the beginning of make_memory_node() that finds the first
>> memory range using the correct type.
>>
>> Fixes: 4596329291f5 ("docs, xen/arm: Introduce static heap memory")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> 
> I guess git will treat this as conflicting with my dt patch when
> applying. Let me know if this gets merged first and you would like me
> to rebase and resend.
It will likely get merged first but don't worry. I can solve the conflict when I
start reviewing your patch.

~Michal


