Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BB3C5AD7B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 15:42:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387609.1628871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtS8O-0006ER-RW; Mon, 10 Aug 2026 15:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387609.1628871; Mon, 10 Aug 2026 15:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtS8O-0006EK-NT; Mon, 10 Aug 2026 15:41:52 +0000
Received: by outflank-mailman (input) for mailman id 1387609;
 Mon, 10 Aug 2026 15:41:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1wtS8N-0006EE-Tt
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 15:41:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtS8N-00ErSm-Ah
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 17:41:51 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a79f12b-bab6-0a2a0a5309dd-0a2a4509aaea-34
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 17:41:50 +0200
Received: from [52.101.201.14]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a79f13d-be1a-0a2a45090019-3465c90e8ff0-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 17:41:50 +0200
Received: from DM4PR12MB6472.namprd12.prod.outlook.com (2603:10b6:8:bc::7) by
 MN0PR12MB6054.namprd12.prod.outlook.com (2603:10b6:208:3ce::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:41:45 +0000
Received: from DM4PR12MB6472.namprd12.prod.outlook.com
 ([fe80::4a4d:4208:3862:fb7a]) by DM4PR12MB6472.namprd12.prod.outlook.com
 ([fe80::4a4d:4208:3862:fb7a%6]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 15:41:45 +0000
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
 b=jOeRiICe3BP3G+FrsYmqCglQP6oUN+t03VhmnVtkiuGhojVrOktgPumNCUyHT/u4XVJV+JSY4fQ8/I7LHCgPL6Koj4H3VEa617THlF3I53CTZZX3QkBMChBWNUqHRmPuKJ8bM9lyOjJh24Zua2Cfvyu63mKEL4ZWPE9zNrAFJbYAcHkahdgY9FyW39JGnVTGnJmKcEtWWDhYJsdt8p5vlCb9l/ACKMXuqbF7bhHq2Gt3ZuGwTY5V5JuMLqTrIEFEXh9h/yCrplRcQwqlhJM/wcW/eAmZQBiCgSK43RXrdaBIocXecHN0ObXq5ZDv10Q48Xg0HL7ssZthl0hXwTXJMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eycNA89dKo9QWALjfwVpOmoCniYD7R5v+ovAdxRCMFU=;
 b=FwZ56anSXG4WUDD0EEJo0H2+KgxjfZXd/QpyVNz6JCK/8ArR5DRL1ctvtBwkKJihW9rsMz604Ae3DYwacH058AChQATVVly57aotmmX1LJKlnlhrL+I9EfLVWgyvoaz1WBVmAAh8pdy04HIRt/QiXhvAMXw+xTMsg6UHp6w2Og3eJ1aE8NPuzVy5lhqcAfMJxNXFa5eIKkRjK1IHntD/P7fwRCML3mcEICa+yBi9Grx7mA909epBXxCa/vM/ss4fSnEsr+yAOODfOmoLlLMp7ZdXh5YhVsNqEp35m1rAgVxmhZyBwRaIboMuDTpTT6tMFEyGJABKGjGNIfN/9Y3WuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eycNA89dKo9QWALjfwVpOmoCniYD7R5v+ovAdxRCMFU=;
 b=qIhpT0Dyz3Vs0vgAPMAlZVmg0+s9p9aJDnplOVSKxkp8AlA5KS0AXgRabJUagJVcqg5EifhSCsaa5zRdF+9IKgxfF7z2S42k2t/JU3JDwVS1DG1e+Kty5oGn/V9x1GnnRPqQ1Sw3uvZn4aapUwjVeAzF42Ta3zpKtrRWINXIUO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9191c840-5d9f-4780-a9f9-918459454cff@amd.com>
Date: Mon, 10 Aug 2026 17:41:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/vpci: allow unaligned accesses by the hardware
 domain
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>
References: <20260806152619.23881-1-roger@xenproject.org>
 <20260806152619.23881-3-roger@xenproject.org>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20260806152619.23881-3-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CPCP307CA0002.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::15)
 To DM4PR12MB6472.namprd12.prod.outlook.com (2603:10b6:8:bc::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6472:EE_|MN0PR12MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 32963758-a488-47f3-e55b-08def6f5e1ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|11063799006|56012099006|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Tt8DrEBwWDHaZbiLNkaTcMtEK6yUQP+Xi5hV+hIXN+oBnTU0huTLQjrxbNv+P4d/ZlJdXPMyw4+LYFuckoIjnOvsSgu/AlynrkJxs/3dGBzBcpARpV13WQuUYI3Uoyz4E2iYyPRV441AKoJK4BEv9TAfB1HHvOYOeEoQ8h3JiK2OnIiqPf5j8LR6fKYZuv4Z308QBmQ3KJRwrZsqVUNIX72nad7G5KKdP2DVOWGXrbh3Y40mHgDRralNKAgB1vNFy+u7bmqnOBfedgpPiRMCssVYjw/vowgLmR3V0v3OP/AYXx5SonKTTKlDnfCIa653ownU87qQUpGk0vhzCVKGrYUU/V2NwVyWF9BiVDKkHL6CNn8kb5Pd97mOJ8FV+36mMTWL0FJLP55IKqyMwoLU2fs1wDrrhRR7e19S/TtCzmJ40tFl906rO/TbFa9rPHKzjKQSXqstLgYScbZSINII7tSug/CRbpyM89xx2OsRBAS7BTuMn5TS2MX/h4lKY6sk32j8Hz31Y1XPRBw+RrvicxWzCYQJfvCQSmE/6MTlU5l1gK5A1EHx6q5gZ4jQS5ZFD12qgl3FXVVlABy6+j+8sXiM/qr3QPRZd8Mv1Q631IQIWYjSJUCcNgULI0j+5UkCvgEZWZ4ttA/51XZzmF/QNPvou6Q8WVG2cvVW9/Nwy1k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6472.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tlg0ejJjbjA5eXhQYW1UT0JRK290TlJJK2RhaVUra2s2dUF1UzJVL3k1ZFpO?=
 =?utf-8?B?dThFMHVnSmVWblVId2E2NCtlNTRoV1U4bEEzdFpJT1JaQ0RLRlp2UlFPMUxk?=
 =?utf-8?B?UjJ1WkdSOWFENzdrSHZYdWdRTmJJTUlwV3JjTTdsNllEcVQ0QzhxWDBkRVNH?=
 =?utf-8?B?b0V6dzJjSXBNNEtPdzdoMHlrM0djRFZLMTJZSWdmdVVVWVh3d3pqRjdmU1l1?=
 =?utf-8?B?UE9KVlM2amNab0JmbzZGa2o1b2RFcS9SN0ZGRWJnYVNzdXA0NDVHeHBhVTJw?=
 =?utf-8?B?SWJOUzdzcDN0R2REOVg0U0tpRTI0a2N0TEtHc3o1bS9BYjkwdGdXR2lpSkVJ?=
 =?utf-8?B?MUlhcGtZZFhsSXRvZzEzSTJHVmw5R3F0QnpkN0hkS1hsZi9RNzUzMER6SDEv?=
 =?utf-8?B?cDdGVWh3UW1yeEhSS3R2RHFTdFVzWEhRdDF0aU45aDJnbjhucE8wdnZhVVc5?=
 =?utf-8?B?N2RJMkxPWHNtWHpxUlNEdGJ2UE54MktSaFNNbmdQRkx5cjRaNkEwUlluSWp4?=
 =?utf-8?B?MnY4S1R1TmEvTmRwZWxKZ1Y0ZHloOHYxOWNmUXNObTI5ZVUzQkJrWHBMUGEx?=
 =?utf-8?B?clozNjhKNmdjNS9ZaCsvY1p3bWZDOFRDQ3B6ZThvMFhOKzJjd2ErTUgvbnNx?=
 =?utf-8?B?N0d3MHJ0QWJJNDFqMGhGOGFHcTdEVTA5M2ttT3N4bk5WR2tRcU0xNDZVREZK?=
 =?utf-8?B?SFNqS3BrZFZTMnpPN0FRalZJMHNzUFFLdEFOMWI4OExDNXUzU1ZkVmFnbkRh?=
 =?utf-8?B?UWtFTGpzOFVFMFR3OUxsVEJxN1F2bFJlbDlmRFNVdFV6YzNwejRNb2tvWXZS?=
 =?utf-8?B?ZnZ5bGVNVnJaNDRsRnBYZ0VEM2xrYzdOd1FZaStFeE84R2pQOU1NV3M5Q1J5?=
 =?utf-8?B?L3hMRzkwL1VEMTdXV0l3TUhBRWtXVWl6NWxQWVA5eVRyNHZPZFRxYUNkZ21F?=
 =?utf-8?B?WEpmZG81MVFNYjlEUHlUalJDNmFPSzZxK3hhQnVQR2tDSXAzMTdrNnpydFdE?=
 =?utf-8?B?cFZXTjZRaHJJblJKamc4OXJleEpGU3Q3L2xtNFpBZUExWTFOaHBJRTdoYW4x?=
 =?utf-8?B?blpNaXhoc25sUWV6R1IvKzVtcVR4Z0dMRHFKTG9UMEdkR2lCM0w0a0xiWFhX?=
 =?utf-8?B?UHNXMkNWRjMrMFIzblJXZmhWRnNUdW90aGNrNlI5alBFb3hOSHNFYytZOUJx?=
 =?utf-8?B?NXBrUjJMcGRGRWV6WU9QN2ZFTDlrN09wci9EaGFyYUFVVURQa2xuWXJZTW4z?=
 =?utf-8?B?VjdieFBhSDNBSHhoRzROaWM0Z3BnVVBQWXcvMkFXaURoYXBJdndPaWlzTVg1?=
 =?utf-8?B?U2w2dnZESlhCclV3YjMzeEVic1hYL1ZyNFBDSFVLdHRmT1NXbUZqc2pQU2Za?=
 =?utf-8?B?MTFjS3o4allHS2prRlQ1VmhIYmN3SS95SU1XSkgrbFlkNW84dCtzcm5RcklB?=
 =?utf-8?B?T0hRcENHNTRBMldPQkpGTmRLZVczd3JCcUhPMXNzUXlYTmJ4d3dTRVhWY1V6?=
 =?utf-8?B?b0o4SUtYN0o1NDVNZTR2MExUcU16WUFtdVdtbC9sRzhLYU1vM3IzVFByQk94?=
 =?utf-8?B?anNKRnRtNHFFb1Ercm5WSi9wZVpQbWQ1eUlBd25VcmY2dGNJQWdWQkNDb3BP?=
 =?utf-8?B?OGY5cXBEOUlxcG1tZ2dTUllscWc5a283amx4aGNaNE45bEJORVBGc1ZhRFNw?=
 =?utf-8?B?L3RrSnhiYzZ1SUJuRTVwNDdmQ0wyRU8vYjRaN2hJclY3a2twNWFzSDJPamE4?=
 =?utf-8?B?dlN0b0pCS3BGTU1JRTVnZERnODRaSGpNM0gvWkppTmdDb0dnNWIrMjNWTUpt?=
 =?utf-8?B?ZWVrbU4wYUFPN251Tzl0QzRtYUtXcmNOYnZhU2tMMzVlcW9QVUtFd2lvWFIz?=
 =?utf-8?B?WXcwTVJkdmJzK05lekdIT3RPeWJTcndwQlJ6ZkRFL1RCNmFYYlRVWWpxWW5O?=
 =?utf-8?B?UUVEUnA0TzRLdTlSbGVlaERocWoxRjNPWmgzVVhxQnFmM2Vydm5LMGVvK1V3?=
 =?utf-8?B?TFhpc3dpalZmd0tkeFRpSk41dng0TEw2dEpYQ01iUnc4TDcxdUhhRHRrdUNi?=
 =?utf-8?B?cFE1aVF0Q1JlN2tLeGJYbGppUXlFNTNtY1lYM0J4UmNBUjhDd3ZEdFlyWE0y?=
 =?utf-8?B?c3gxamxPWlhJbm9BRE5ieU1tWGRMRFlKS1RxSGgwZzZ1K0FtNUExNkFhNytN?=
 =?utf-8?B?Qkl2QnMyY0NKRlZsNzhnOE9CZUdCTm5ISklNU1JaY0doSnJqZVVUdXFkYkVs?=
 =?utf-8?B?T1dkbmVsU01LdUxiN3ErRGpEZExOdW5NcUQwblJKcTY5b0lFNHBnYW1JUWlI?=
 =?utf-8?B?Uks0a29lQ3FJMWlPTEtHa0JDMEtpZDM2aUoreUtkSGt6cnh6T1pEUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32963758-a488-47f3-e55b-08def6f5e1ce
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6472.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:41:45.1002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ge29tHxVBQ4Qk6I50SD//CgDemzT3X0tzCwpDeeB5o2REGw36PoV9itEl0OhPMZMGC6P5gWbr3hemTQYmxRmUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6054
X-purgate-ID: tlsNG-bad1c0/1786376510-BC2F4034-DB415B39/0/0
X-purgate-type: clean
X-purgate-size: 1036

On 8/6/26 17:26, Roger Pau Monne wrote:
> It's possible for domains to generate unaligned PCI config space accesses
> when using ECAM, and hence vPCI should support those at least for the
> hardware domain.  Such unaligned accesses to the PCI config space have been
> reported to come from ACPI logic.
> 
> Relax the checking in vpci_access_allowed() to allow such accesses for the
> hardware domain, and fix the handling in pci_conf_{read,write}{16,32}() to
> fulfill them using MMCFG.
> 
> MMCFG regions are identity exposed to the hardware domain, and hence such
> unaligned accesses can only come as a result of the host having MMCFG in the
> first place, as otherwise MMCFG won't be exposed to the hardware domain
> either.
> 
> Note that vpci_ecam_{read,write}() already refuse accesses that cross a
> device boundary unconditionally.
> 
> Reported-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

