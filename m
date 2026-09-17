Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A00BC88E72
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 12:14:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423977.1648773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7B0G-0005DJ-4Z; Thu, 17 Sep 2026 12:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423977.1648773; Thu, 17 Sep 2026 12:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7B0G-0005DC-1p; Thu, 17 Sep 2026 12:14:12 +0000
Received: by outflank-mailman (input) for mailman id 1423977;
 Thu, 17 Sep 2026 12:14:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1x7B0E-0005D6-B7
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 12:14:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7B0D-00BAe3-OF
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 14:14:09 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6aabd98e-e002-0a2a0a5209dd-0a2a4505e26a-12
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 14:14:09 +0200
Received: from [52.101.85.69]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6aabd98f-4cb1-0a2a45050019-346555452cbb-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 14:14:09 +0200
Received: from MW4P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::17)
 by BL1PR12MB5731.namprd12.prod.outlook.com (2603:10b6:208:386::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 17 Sep
 2026 12:14:01 +0000
Received: from SJ1PEPF000037A1.namprd04.prod.outlook.com
 (2603:10b6:303:114:cafe::9a) by MW4P222CA0012.outlook.office365.com
 (2603:10b6:303:114::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 12:13:59 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A1.mail.protection.outlook.com (10.167.244.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 12:13:58 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 07:13:57 -0500
Received: from [172.31.52.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 17 Sep 2026 07:13:55 -0500
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
 b=SKBmbSLzRAt1lq/B6y9mAbm6WYOumh/YSFOk+ks8yEgg8y5BygBPcgGW+mzmVwfGH0L8zl7RJJil4VjH6idr7Dnpy7Q3Xz4OYB5dqx/GPT3/oTAG9/jiA8DKWDM/STL4VztmrGfvrLctk01+QgiAkTFbVqUWxfepEy1DluccLBwUTheVlBdwKZ61ce5bAn2O9ySiW9MPmTBUPv+kseFTFX2dFMWZF9tT+LQtm3uTTd7Ectz9BeEFLAVl24j+1HNQpZc+tNkxdbfa3IC7/ln1AUib0ayJZQeS4+hIiYk3NQBwhIwvJRmZ8DkQAFO+WhTArW64kUjb3GDq4n6hGa9nYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykwnd8AuGRDEEAns2qhqEaiPT3affmZmerE5r61BzM8=;
 b=r35rXy6/I4ceUOHZs7mH+f0Or3ZkiACfCe/YTpj6d0Kw9alMApzK7eGYoxKjfu6TlY2XdlGetMORPn63l2zSeCSjLi77p4DppNYaAfY2R3Rka+9Wct385f6P4sNU6Z5IBpqMWL4luEy+C8eHh8jOCRxnN9b0jX6RoicWxiw1MQ9pz5bpOrH3nHWHHMCXrQCKz318EOgdMbhfjf1zQv80bGeC6GdZEUnkrRr7h86CNE92OGR5qtQ7zE7XG9i5Bis+8qm7fX/hIFdrpYuxYDa5OvW+Lm8eV4FAtg8fWYbdaNAlDuGbm/KTrZsfZ99t6q1eLxdiNCMc8oUhIT4HpLB4yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykwnd8AuGRDEEAns2qhqEaiPT3affmZmerE5r61BzM8=;
 b=AHtlSYB9/Uh0ZhwgSCoJztKI+YekS8I4hx2dSRYQnkuXKwfsRlduQytJ2fIZxkmLReE6gdOrbjYI5Tt8wnm/UR67xb4/rlLVV5XKmU74vWroATlWyVxeGcnv/2MdXLYVKY1DvA5eIDfQAkBzQZ63f3chnvnlwHVxAoZcR8JwQ9E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <e311cb4d-beba-4850-ba0d-13f9a2e92608@amd.com>
Date: Thu, 17 Sep 2026 13:13:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 for 4.23] Add GIC SGI boot/self tests in Xen
To: "Grall, Julien" <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Roger Pau Monne <roger@xenproject.org>, "Doug
 Goldstein" <cardoe@cardoe.com>
References: <20260916113520.3870182-1-ayan.kumar.halder@amd.com>
 <7b6d9027-9848-4909-a5a3-16ddf56dde72@xen.org>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <7b6d9027-9848-4909-a5a3-16ddf56dde72@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A1:EE_|BL1PR12MB5731:EE_
X-MS-Office365-Filtering-Correlation-Id: dc8f70a3-282f-47dd-2f45-08df14b52705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	hBApP9LFR+p/1xjjmnBwsUrcLxraBZlgZaHQ40VdC2G6t+eu3azn8T0zfWB1Cqf1W0KyUYnlTXRBYhZaDpkXjlIOHARpjJw8xtWbIF3wLd0nWVgtK/HrK6483mFk+qf61587Gk9o93kEX/sfeZkPkzjcOD3k6CztQCQU45kWWPhh8echu3Vz4JQcy5hiRNJqmAg7eX2AJWpg763jML12hQc/8BYC1rL5Qyo8pxKAyGxiHeLds9agmEovglq7yvkIQ2SS4uN95gquAeoxW2YcOC1P3EcX7ZxIWZM8V8GjMj5D6nVImtySkE9XvNHE5ml0PsQaq/qcjMSJ5eAt45KqSUJLVsSZWkCSioLHK08OMnZaYQ00+kAhvHoZQM8OtOI48BgFVdd0vxIzGyNxKJIQB6q3GystbzdyChAkcoPtvL8SdCg/b9c9SxwZY+IjN7XHrjNzMOdar1Q3rDq9GIqUciYO7OKlaXcxQtwDbNF3CeGTH16kEmWKVtsH7jZVU67nV2nNq1u7ltH90J6NsbyifOy1c6NhAa7Hkg+KbAbykWqO4p8az8iNDdEv9TNrdDwd1NnNNIsOapybDn7Z6Roryv0DOFWe+8fmRtd9Yki23ybxzQx9A7RkBAILrsx95XRG1dhBqidWgoEU/CTU0qSTUafWwoZ8uWHj6T5Is9V2N3smZCVcPvdRMEIQKpHsHKCXbs1uec2fCQg4Xc5k8+nLUQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WCedLCB81mfPnUqFWfPfnkxM7sZ2g2MBcxr7P6jOGXZZEb+rGSJzVJocZSdQvg+tqACZWJDGEAX/rghR5sftBXQAlmFJ9WLkj96DUeyBRKlpS457CWUK2YAyhRcHoi/MY7w2sw6OySr+8H7h74wE/VlfFJDYomiXoHkM/1A8QgPTBs68DedHs2FsHi9nO2IF9JF35aqYk4hoxXPIceo3XIYfWhv/Pp91+G1kF/EZDx+zyf4N+fDoBI/KCIwj9EaMRCURadTbaxUZ5/ArOu0XE6e2NIP+zK1v9LMmAtZYshCxVdVRIxEuxCwXEUgg7LwgjQlla76u/ast4xGV4uTsScv8OVzlhqOmS3s8mnPeSf81lEdji5qZ1SD6OvGmPFkMwdUDxcoZaSxH1502s/ETgkenxm2KFxK2csA/OR4DSWXv6oP8n4OehvIX/SDPIss0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 12:13:58.4927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8f70a3-282f-47dd-2f45-08df14b52705
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5731
X-purgate-ID: tlsNG-c201ff/1789647249-72AB72A1-42C6D0CD/0/0
X-purgate-type: clean
X-purgate-size: 1793


On 17/09/2026 08:57, Grall, Julien wrote:
> Hi Ayan,
Hi Julien,
>
> On 16/09/2026 12:35, Ayan Kumar Halder wrote:
>> +static void __init expect_sgi(const cpumask_t *mask,
>> +                              const unsigned int *before, const char 
>> *what)
>> +{
>> +    s_time_t deadline = NOW() + MILLISECS(100);
>> +    unsigned int cpu;
>> +
>> +    for_each_cpu ( cpu, mask )
>> +    {
>> +        while ( sgi_count(cpu) == before[cpu] )
>> +        {
>> +            if ( NOW() > deadline )
>> +                panic("GIC selftest: %s: CPU%u did not receive 
>> GIC_SGI_TEST\n",
>> +                      what, cpu);
>> +            cpu_relax();
>> +        }
>> +    }
>> +
>> +    printk("GIC selftest: CPU%u: %s: OK\n", smp_processor_id(), what);
>> +}
>> +
>> +/*
>> + * "All but self" is only meaningful once every CPU can take an SGI, 
>> so it is
>> + * run by whichever CPU observes that it is the last one to get here.
>> + */
>> +static int __init gic_sgi_selftest(void)
>> +{
>> +    static atomic_t __initdata seen = ATOMIC_INIT(0);
>> +    unsigned int before[NR_CPUS] = { };
>
> Sorry I didn't spot this earlier. NR_CPUS can be quite large (up to 
> 16K). So this will blow up the stack.

As this is a test, we have hardcoded NR_CPUS = 4 in 
automation/scripts/qemu-boot-selftest-arm64.sh.

If there are 16K CPUs, our test only checks for 4 cpus only.

However if there is still a concern ....

>
> There are two options:
>   1) Use static
>   2) Temporarily allocate "before"
>
> I don't have a strong opinion on which way to go with.

I can use static.

- Ayan

>
> Cheers,
>

