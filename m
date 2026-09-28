Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E00CA5FA2
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 11:46:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435932.1654694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB9o7-0004Zw-Uw; Mon, 28 Sep 2026 11:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435932.1654694; Mon, 28 Sep 2026 11:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB9o7-0004Zn-RF; Mon, 28 Sep 2026 11:46:07 +0000
Received: by outflank-mailman (input) for mailman id 1435932;
 Mon, 28 Sep 2026 11:46:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1xB9o6-0004ZP-9n
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 11:46:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB9o5-009Cvo-MZ
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 13:46:05 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6aba537c-2eae-0a2a0a5409dd-0a2a4506c7c6-4
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 13:46:05 +0200
Received: from [52.101.43.54]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6aba537a-195a-0a2a45060019-34652b36912f-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 13:46:04 +0200
Received: from BN9PR03CA0360.namprd03.prod.outlook.com (2603:10b6:408:f6::35)
 by SA1PR12MB8887.namprd12.prod.outlook.com (2603:10b6:806:386::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 11:45:45 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::8e) by BN9PR03CA0360.outlook.office365.com
 (2603:10b6:408:f6::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 11:45:45 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Mon, 28 Sep 2026 11:45:45 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 06:45:45 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 06:45:45 -0500
Received: from [10.71.198.170] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 28 Sep 2026 06:45:43 -0500
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
 b=SFeq+uUjZHYlbih0lj9WsorK3njhI7bNv7F8wlV35c+Yj/SewSanbBdoyT4VzlMXmnHQnJjrCesA/G+Yav83ny8E81MLHqTpxfU9EwSHPJX1NCIob/TVuQQVmvDWtTVVQWjmNdXmc6NFtXyO3/uJ3MVHba/hMzDceUhHH/xlDlu34ycl2U5F4acqfmX4a5y+UpCIW+b7veF9gn3qBTfZNz4R3Tpz7t9Wmf1x6eENSBI5MXUdU2j6IG1glMCtU2ViNe16om8YpIpDR63yetrdUbqSHrVQGt1yaIEOyS5wLhdk09LNaQpzxTeusTNZSGSmEDvZ8wvteS8PadFyCdBcWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+TZNTxDHduF/MR3CtBRY0uDHTxC01WijTB/qwDhWhw=;
 b=skERil94IjNlSJ0dCrCOMubvn7PW3evj05T65nMByIwCNgjVTbmwcdETzOhOzaGKj1dllDDjOaZku1wHn3OSjopu+fkw46vX3XiuSga4zvvUyhb7L7ovXKv/iO2VZpWFlfwl4ZmuOfdEIkeVW/e8E3Nvp2QsjhFG+U4JTIW1s3ua8gcebj5yP5pJeFJ8UZ9NGCH0SufH+Vbkp5GvLnetjET70D8mzdcS5N9xeus+BMre8sXlxZnHKGPyM7nsmPom15aFmsu2uWL/vpL7BjRcVknQQegsdiOsrdObWPI8WsNJDEECUJqp74A79pcxquiawjqIPJ68ORe1tc8dIY7weA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+TZNTxDHduF/MR3CtBRY0uDHTxC01WijTB/qwDhWhw=;
 b=25I4x6odH2ygSfd1VUGRaAa0C2/SjUJRaXeCWZZ3X52ncDXHS6cPmBqtjJJKZlA4/517GMR3nozc37Y56r0/MlK2e+wVZ/clR5Uro1gDvxASqRLAexMcCKUZI0Dsb9atTkgtrRizVASaleQ6l5dTt/gnrFPRdxIlubrYp7eeNr0=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <bf2505fb-b9d3-4150-85b2-87504023a531@amd.com>
Date: Mon, 28 Sep 2026 12:45:42 +0100
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
 <e311cb4d-beba-4850-ba0d-13f9a2e92608@amd.com>
 <81b73414-febe-4e3e-bfd4-30b6a13ede98@xen.org>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <81b73414-febe-4e3e-bfd4-30b6a13ede98@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|SA1PR12MB8887:EE_
X-MS-Office365-Filtering-Correlation-Id: 183f295a-9584-49e4-b58e-08df1d560869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|36860700016|82310400026|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Y20IY0xseLoLFSjH60K0biywkxkc4fg8ZJ5v/usfjIoYbx+pTZkPfOpHVM/+aDQ2DSBE6dcUMPMRhZk/lTnkOvsH6dx+PufDXQgj6wMKkADwwjeR+Wbgz7aB0lMni+7MCvT67suSPK+UVK0BcWpsEGuZTyU3NTsNbcWKdJZKzqkISq2Ng1+SO5P40S21hVQjXBAGpi2he5PWaBgULE4KT9btmSteG3COpj18RQSKCAhN0KyPnJHllu0v2Azp12cbvA50GHqEw1i4AKT+akByZghRDisoaRwez6gkfGgvF4phUhE/PbFeCQxspWFofHPlGY/CuWGbh+JelPkLuFyxPbLnk99tIu3aBKKXV33PnGwJO7RXB9J96hfCtMFiuF/P0A5Wu7wzyNSxZIUFXvECbvNUbP1vDzKIu/Q7UIvDsqhF2Uh9gTwx1kLVV/MmrWwHK1XID74qkyJtAjyz4UkNIRJHocMB6H6eW/3/FUuzkVjb4RYanoEJdnL25wSh1EqJGlDAqN+q1p+4+SDv9JXMvJMT2ZCAMGYqx2jjAMbHRAG1eaC9bsNtNLmi+8YHfOC3nOm9/HU3hqXgyBwSndKxFd0eMwR9Vd0hGvmlkN+4xfmcXmeoj7FBTR3OZrqvh6fyf0+AUhYMBxyyarUqL8F7VGx673DotGX7rd8OPAYwhktqkdmVHhSOe1QOR5leIsgY/hRYAFpKo+Sa23jxMJEa7A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(36860700016)(82310400026)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	acmWSYLHei5o3TZv1DKDTBPS1g2IdxSwOEwYHFrLhYJg0KJju+sePKrodxkp5+DhF86DmhUK9tCCur3WXgoraTMp89pzd9bFxA8SFJ93RmOOrzqP3tyAo9ICcOl7w3j9UWv3qhr2EtqzwXDPTE1XoOG2NUHZq5tqizluJ+eBADTCM/mlI3DudubXZ9D/LELVWLAjNjV2/4v9NDaf2WQdHW/DYGsxmbXzdDMzD+Dp1lFCVcDWIoexAN/E/GvTbvnig23b2uEQl5xzh1/+Dab3uSXnA6eszYAwtrU1wYJFvshVGgI9IknnxrDFgAuVq6gd+ihVCl2GUYUNovzbiGkJuZn6baiBeFBNrHghboWzmYeUTcGHEODzOKHpqHW8+HCS5XyPgtKAMohbjBh5dJPW3C/1scxAnexdrc16c0IY9F2PapNQEIzNu0LMkjJ6qtoQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 11:45:45.5003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 183f295a-9584-49e4-b58e-08df1d560869
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8887
X-purgate-ID: tlsNG-16d1c6/1790595964-F480577B-F0D1E901/0/0
X-purgate-type: clean
X-purgate-size: 2469


On 18/09/2026 08:50, Grall, Julien wrote:
> Hi Ayan,
Hi Julien,
>
> On 17/09/2026 14:13, Halder, Ayan Kumar wrote:
>> On 17/09/2026 08:57, Grall, Julien wrote:
>>> On 16/09/2026 12:35, Ayan Kumar Halder wrote:
>>>> +static void __init expect_sgi(const cpumask_t *mask,
>>>> +                              const unsigned int *before, const 
>>>> char *what)
>>>> +{
>>>> +    s_time_t deadline = NOW() + MILLISECS(100);
>>>> +    unsigned int cpu;
>>>> +
>>>> +    for_each_cpu ( cpu, mask )
>>>> +    {
>>>> +        while ( sgi_count(cpu) == before[cpu] )
>>>> +        {
>>>> +            if ( NOW() > deadline )
>>>> +                panic("GIC selftest: %s: CPU%u did not receive 
>>>> GIC_SGI_TEST\n",
>>>> +                      what, cpu);
>>>> +            cpu_relax();
>>>> +        }
>>>> +    }
>>>> +
>>>> +    printk("GIC selftest: CPU%u: %s: OK\n", smp_processor_id(), 
>>>> what);
>>>> +}
>>>> +
>>>> +/*
>>>> + * "All but self" is only meaningful once every CPU can take an 
>>>> SGI, so it is
>>>> + * run by whichever CPU observes that it is the last one to get here.
>>>> + */
>>>> +static int __init gic_sgi_selftest(void)
>>>> +{
>>>> +    static atomic_t __initdata seen = ATOMIC_INIT(0);
>>>> +    unsigned int before[NR_CPUS] = { };
>>>
>>> Sorry I didn't spot this earlier. NR_CPUS can be quite large (up to 
>>> 16K). So this will blow up the stack.
>
> We discussed this offline at Xen Summit. But I will answer here as well.
>
>>
>> As this is a test, we have hardcoded NR_CPUS = 4 in 
>> automation/scripts/ qemu-boot-selftest-arm64.sh.
>
> I agree with your current test harness we only test 4 CPUs. However, 
> this is not enforced by the Kconfig in Xen. So anyone could modify the 
> script (or write their own) with a much higher number of NR_CPUS 
> (possibly to match the number of pCPUs on their hardware).
>
> Depending on the value, they could face a stack overflow.
>
>>
>> If there are 16K CPUs, our test only checks for 4 cpus only.
>>
>> However if there is still a concern ....
>
> I would preferred if this is solved. Assuming this is fixed:

I have fixed this. Please see

[PATCH v5] xen/arm: gic: Add GIC SGI boot/self tests in Xen

>
> Reviewed-by: Julien Grall <julien@xen.org>

I have kept your R-b. :)

- Ayan


