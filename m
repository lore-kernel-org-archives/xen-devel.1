Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E032CC6B38
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 15:33:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452229.1667045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHjwL-0004mv-4q; Fri, 16 Oct 2026 15:33:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452229.1667045; Fri, 16 Oct 2026 15:33:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHjwL-0004mo-2E; Fri, 16 Oct 2026 15:33:49 +0000
Received: by outflank-mailman (input) for mailman id 1452229;
 Fri, 16 Oct 2026 15:33:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xHjwJ-0004mi-Tg
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 15:33:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHjwJ-003Lh2-Ae
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:33:47 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad243c7-8faa-0a2a0a5109dd-0a2a450cc31a-20
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:33:47 +0200
Received: from [40.93.196.12]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad243d9-f479-0a2a450c0019-285dc40ce0ab-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:33:46 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7255.namprd03.prod.outlook.com (2603:10b6:806:2ff::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 15:33:43 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 15:33:43 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3QO1Ri0V3WjARjr9NtAVlRnbwZAHRS0Je6A7F5rbLqyFzobp6TmMLq9vNnm7UXVJ6Ouw6MxUu7EFcrujlFRxx3TnUC7NRbVUbkPk9bu8LGoOFDyLgYPEaJqPXEa8J0F3t2FuZh5msCPEslpT8TDcrNyfh+UapU3OTVLwzwyHyJuAMDU/Ky626MnYz5ekpG+5udagWrrZNk6g4bsz9AFEgasYwwslF/YttzuZOvIWGMwIYsEflQJBi6wfpgDLyyylFTwFvYra7BhpEcA9xSPllKdnLiAZPxelA61d8AEfmx+edTzxFpekqZSzF0WADAqm21JScF/Hd+EJhm01AJn9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyYj+KdUHwwri2DLSGkjBB0QkZJnEMclY9v2hFZ1Kkk=;
 b=nBFLDY0y6Lz3IQlvNornENklDqFOto/QdoswuofLcxRRYll8i3hsoSmmVEDOzmqWaQxFM/JaXL3mj5CRTDvszxnnFou9Om2fiN2wWemOSBW4YH/zd6r+oA0V+jMrhjdjwwUtUMFzkyXlDXGE/uetCs2xg9W6b9C6TN7UDei7u24ye9FfA6b0vnF/EV2xVuG2jMVwowoazC48KyisfuTd4J10Lt0Nhv8PTiNZlD2ai75UoT4ZDaY4yupviZcXffQ6tO6YPIZdmFlLDEWqCaBOGW/PKWTu4wD29Vrk2XLaS1Nr3sf+Cz12FnSQcLf/jkdJLpfnausaSmd62itcwGcOQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyYj+KdUHwwri2DLSGkjBB0QkZJnEMclY9v2hFZ1Kkk=;
 b=nYHmI6AizFc4y/sXJM6SW++spKfKY1NXLyRZ9QjwdQlCt1AuRoQbUz4G8j3st+dYB6/CHGybXzRkgUPnQuH3OsGP+N7ppmy8zVeAicBbnkIilRcvo2si/RS+5aInxs22bFaQTnuwoCrCHNXG16ldYYnCnnT+GTTPsxem/xbXWZM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4a387bee-cd6a-4776-ad22-b71ddea151e3@citrix.com>
Date: Fri, 16 Oct 2026 16:33:38 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 David Woodhouse <dwmw2@infradead.org>, George Dunlap <gwd@xenproject.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen: Use VCPUOP_register_{runstate,vcpu_time}_phys_area
 when available
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1792146192.8631fc262581453bbf619ec5b2062170.1a1443cb7e90008425@vates.tech>
 <9a8b0ae0-ec49-4af0-8e5d-1378319f2857@citrix.com>
 <1792159847.8631fc262581453bbf619ec5b2062170.1a1450d15800008425@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1792159847.8631fc262581453bbf619ec5b2062170.1a1450d15800008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P193CA0001.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd62101-7390-473c-4ee2-08df2b9adc5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Aqqoe6i2DZdKyWou0GHRTb/UWxz4g0zqfAIQB15lDfXvqhcdhtsX23qErOZm0m5eqPGivSLe2o4neFmpwSq6SPZsowiZZsdO9ncOXDDJmlApFCN5rhyZMDPwt/dQXz0tkfTzY7TQpG28GfQBHNyU7uyzV0UVxu8DBmyqCIHICui0Fg243wx4C7zcmM6yQTAUVDFV0Sscavmgv8gK9G39cbrbwreMN3wN4OU0BLZwiyv9s2ArdLi7kJ8+P9XdeQkTIUMwnCQCfQ9vpSMe4Nlv/I/7/RXLzi3SttERsOMAUe47cUyGmhKrarzI9VMZgekhqCgx5z0/fCf3s6N3dCCMJQROVY7C2++OeMbNhuBUD53YIJsuBJSrsl/+iLb9lF4TqOLiuzrDR0gZVh1ZFxTnO70NeUGKSHxiGwFpwKZ5y1ybYcr8bH6ZqDeC8qUDTsduGr97FsVwMT0tVJ2+23pzz0FWSl7gzuU+GgepQ8qwv160lEAZvq32CQVvrkhicWv35T7iWq6VJ1OIyqr2FEAp1lnHIZdqHDUWWjT0ZxfVKJwpkLPmg1cYx/Uik/TsGXu7FC1GYz1kNJe4iNwP/2w9W8TnSbE3KaTvUSBzKch5dtWMRmEO/YsOyS4X2H7eczkvR8A7lNLElZy9R3vfz73yq5IGO2oo+MOsDB7i4sOm6WM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzdsOHpmalVDLzNqWjF4ZGxjZTJybHptVDN0VjBVamJQR01aZUJ2aUdFc0Ix?=
 =?utf-8?B?QnhCOVZsUmRlazdtWlJjQ0t6eFlXZUJndWdMcmo0NGNJK1NpWFJSNUdQenZk?=
 =?utf-8?B?cUtjeUtHZWtjTEJzVHV4RnpkVjBITXVib1pkR3o4eTA0eHFyNzl3aVJPQVFl?=
 =?utf-8?B?OW0zL2w2ckcrWTFNektHdm1nRlpUVEJWMkdpOTBOc1Y4WHhDekZZQVFNdm15?=
 =?utf-8?B?S3dveEpvbTliUHJnSHB0U1lGb2Zsd2hPRE1PODN5QzlkMVZ6emJRTjJSN0Uw?=
 =?utf-8?B?ZUhGVTFqOGorOTN4WkdXMXhvS2tLWVh0T1VKYjI2a0t1VnEzcEFZN1ZtZ3BM?=
 =?utf-8?B?ZnV5TXR0NTh4SFlZK2NGUGFCMnppL3JPUExhTCtnZVR6eHpwN3ZXZEhqNnhM?=
 =?utf-8?B?S1h0VmNIVC9xT2I4cWxMRjdVT3NHUU15RXRUOFFUMVBUMWw2OGpCUkluRENH?=
 =?utf-8?B?QmVGQ2dYa1FDTThKSWh6dHFqaGhXRXNoeWNSZStDbEVmdk5QYWpTNkJzMXpJ?=
 =?utf-8?B?d3BPZGdsL0l5aUU0aWF5YlBmM3RUQXc3VlVxNi9BVFVxQTZpdW4xeUEyRzVy?=
 =?utf-8?B?NzlmNHFreEtwdFB6SFVCUmF0b1hNanhFK01TTEVMcm0wN3BtV3lEeFFpdWdC?=
 =?utf-8?B?NXJtaDl1bFVIK3FjTXB5UUNDTVd5aWpmais5U09wWGFVeFBFNkhXbnBoVVc1?=
 =?utf-8?B?QWhOTlZpWlU4dDk2NUVQemlKUVFCVjN1bUpBSVFpdG0rZ0o1dDl2dWZiRnoz?=
 =?utf-8?B?NWdVdVZYaHNScDY3VDVOTy9hQkp2MVNUMmtIRFFob2V6NTNDTzdtZXZhWWxV?=
 =?utf-8?B?YWlnamhUQXdpdFRBTDhjUldIRUR3SkV2T2t4bGlETEZpYVVLN2FjeUNCcXlW?=
 =?utf-8?B?VjlpWXZsZFJKQk1VMnJxck9ZbnRrK0VXUGJzT3MvRHJQT1V0WDFiM2s0N1kw?=
 =?utf-8?B?R0pXYzlxUEphVHRmclc0Nk5WNUhlbVE2cUlWTUc0blc3WU1QQ3U2K2RqcFRC?=
 =?utf-8?B?Sks5UDdORE0zZVA1QThoS2Q0NUtZVFhrNnNoaWVwTEZLM2RXN09rbis5eVp5?=
 =?utf-8?B?LzR2R3M2ZlZLU29PdEhGN2FIQVB4OTIzVUpNZUttM0FYSkt4WEQ3M2RsRWVi?=
 =?utf-8?B?NTUrN2NCc1BIWnRCcEhjZHNqYmxQVER0czFqK1R1eHBVYVNYMVlhanplaUtZ?=
 =?utf-8?B?Snk3MXkraUNENXhpakpNbzJjbFdZNVR3QitKTHd3QWZOcm5zY1N0bERvMDhB?=
 =?utf-8?B?QXRLaEkzMkozU3paWGZ1dnIvZU51bCs2Yll1MHZCNHJkVlYzU1ZYNjg3Njly?=
 =?utf-8?B?UytVWHJnVERaeGN2ZjB3TTlkVlpjQ3pmeDAyUmVxWFRFMU9UMW1vR2lXd2ky?=
 =?utf-8?B?Y2Roa3hHSjNTMkMrQzhzZVFpQWVpVGNpN2pPb2p4eG9zb0o0TTdNVEtiWHhZ?=
 =?utf-8?B?TnJnY05ob0JlZWUvV3Y1aUlNTmNwYkNHbzErNW9lSitEWS9qRDFqaHRQWmF1?=
 =?utf-8?B?WGxEVGhvYTRJenR0SFlmTlc3bEV3QmxtbnFxdEtza1gzNGY5TFI3em5JNHcz?=
 =?utf-8?B?QUdCR0V1aktsZ0ZORjM1blo1NFd6dGVwVS83RXRrTU1hbXdBSXhaUllIRmxK?=
 =?utf-8?B?bDd5MDdtUVJDTnZOT2NsNk80U1NDNWkvSHYyU0VKM2ZiSzQ0cHFyQkRoOWlN?=
 =?utf-8?B?YjFvcW5ZcXV2ZDhSL2NJZktFTDc5c2srVm5jYzN3MTMrR0MzbmpNUjJnLy9C?=
 =?utf-8?B?YTdINFZhKzBLQWxPc1RTSTZWNEphajlxKzIyeHJ4TWpXdno5RnRRMlczNXpo?=
 =?utf-8?B?ZXhmcUNKa25ZTFlwMWI1aHNZWGhRSzFVY2QrVXZmRUtYVzNLNDdNbDdaeTli?=
 =?utf-8?B?Z0oyNW5LbjM5UTFOU0dVWHZuMUhZOXo2NnJjWWhnRkZxN0Z1VFluZ0VjbDNi?=
 =?utf-8?B?YldJMmFQZkVIQlBIYkIzWGJjTUlMYUk0bU1sWFozUDBLRHhQNlRnNGJpL0E3?=
 =?utf-8?B?bEVBYkdmWEdCYnVPSGN0MkZKdHBtWVE4YXA0Ujh5cy9UcnlBeHFCQWJidW1z?=
 =?utf-8?B?LzhKVU9qRVZzaUo3b2JWNXR6T3Uwd0xxS3kwSkFFc3ZCYU03eXJ0L0N2Sy94?=
 =?utf-8?B?SUtzVVIrdWV6Q1pmN1MveE56d0lGbW5hYWd4c254R0NsMUs5RUZlSVFXVGVN?=
 =?utf-8?B?d001eU1IWHFYcXhHQ0plMjBXZTR4bVNhWFlSRmMzb1ZqMEVLTzBNM1VwWnMy?=
 =?utf-8?B?S0NnQlRabEhJcWVKMkFzaG9aZ1BVbTRSb3o1cHd1R2pBTEh3bk9DQ1RzZU4w?=
 =?utf-8?B?SUZ5eXF2bEVNV3JOMjhFWDdBV3V2OTlqVFR0ZXpGSnNrcXoyWCtrdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd62101-7390-473c-4ee2-08df2b9adc5a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:33:43.3566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYmCbKEtMHz0EMIHsAg41aqvI1lJLUofYvfYUjGvH1Q3fI7QGKBoJTAGOSLLNh5tJZFbgF6GSPziH2SGFfBu6gLG/kUmdGwRViiTte94MgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7255
X-purgate-ID: tlsNG-d25034/1792164827-50520A5B-EA2D1511/0/0
X-purgate-type: clean
X-purgate-size: 991

On 16/10/2026 3:10 pm, Teddy Astie wrote:
> Le 16/10/2026 à 13:20, Andrew Cooper a écrit :
>> On 16/10/2026 11:22 am, Teddy Astie wrote:
>>> diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
>>> index 5c7822254a01..19ace1b78ae4 100644
>>> --- a/arch/x86/xen/time.c
>>> +++ b/arch/x86/xen/time.c
>>> @@ -37,6 +37,22 @@
>>>     static u64 xen_sched_clock_offset __read_mostly;
>>>   +static int xen_register_time_area(struct pvclock_vcpu_time_info
>>> *pvti)
>>
>> This needs a comment explaining what's going on (by GPA, falling back to
>> VA), including that passing NULL means unregister.
>>
>
> Will add, I guess we also want to mention that this does stuff on vCPU 0.

I was puzzled at why it only ever uses vCPU 0 for time handling.

Xen does allow there to be a time area per vCPU, and I have a suspicion
that this might matter for older systems lacking INVARIANT_TSC.

Either way, I don't suggest opening that particular can of worms now.

~Andrew

