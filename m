Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E77606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 21:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=uIzHhLtr
Received: from list by lists.xenproject.org with outflank-mailman.1486549.1689135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRcD7-0004xM-57; Thu, 12 Nov 2026 21:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486549.1689135; Thu, 12 Nov 2026 21:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRcD7-0004xF-1B; Thu, 12 Nov 2026 21:19:57 +0000
Received: by outflank-mailman (input) for mailman id 1486549;
 Thu, 12 Nov 2026 21:19:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRcD5-0004x9-FC
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 21:19:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRcD4-000vEC-LD
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 22:19:54 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af62d3d-8faa-0a2a0a5109dd-0a2a450aa270-48
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 22:19:54 +0100
Received: from [52.101.57.10]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af62d78-f2d2-0a2a450a0019-3465390ae7a3-4
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 22:19:54 +0100
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SJ0PR03MB989361.namprd03.prod.outlook.com (2603:10b6:a03:40c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 21:17:28 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 21:17:28 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHGbt/OLFPY1ItnkzFUWHVe0TnewbrPYLkoTkXEm7QXm7nnBLarAwIZjiHUG2MyWHoAy9A+t/So5ERLZGzUZyqmNDjTCB2O3ZsiulRDMNvgSP8BwVG8QX/jnZ7tXj3lWHvDW/Sr96dQeppzzrep5isq0GiOd3B3jCyPVh79CQ6Mv7pGJKmxgnjD9QkZsHDRh9waYclCa2+YzU1h4Ehu7s7fZUwDXvoJFKPSruXzzDwhq+9JSxN5x9vvnS8WI6u+OZEAueGjO0I4cvzQMmBRpLPKiCgdwicfDQG3VC9ePC6mRgimmVgIOYNhpB3iIWGncmd3O4KiBLQDafo3mUjcNmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNgMLS+5w3Lhu2I5SvMPA+F7WPRmIULZkFZqLn9ZHyU=;
 b=o5im5otTOISxFUlO7F6OsIWESIOAnDG0PF0eSBYcK/kNpporothIluWjGTyKBkgDKyo69zDNFAPRaLqVWzD4gKcPIZTKXwQvD84AcJ4rUCLOAotwh2IQu1FmZFAlZIzPj98jwYzfY5Uj8u13cPJOcbD1Chvy+elTheG7tEyVw8CF++9XTYqhK/lMxWN3tiHbOOlWmSsZVrDzG8ZoDpT2Hr35U9dGY3oNsk3FsaihbdyCyE3GehfhaR159nwdURTMFKWEWW083BGFVSl/h0EUjmSE0wrx/A1oTfLJ+342Maf6JVH7p/nrmW9hLr7WHkdqBuzdFQnyDx/0yaNg2WXEDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNgMLS+5w3Lhu2I5SvMPA+F7WPRmIULZkFZqLn9ZHyU=;
 b=uIzHhLtr91iqpd1+TNr3gxCrz6mBo+1VgntOnM8vHY5KIEXyOd362cKozrXN1dKBQxXPjsUg0l5HHFvKqcsGdtt0RVIV24TZ2XiCF6zMtLuuA9Yt3cWClI2mlwOtu1zVMgSlAvv4Vs0xyR3WKm2laNUmG+WK0fVsLHssvfnFMGU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e9ae6b3a-4756-43a6-8154-6664bfa19d01@citrix.com>
Date: Thu, 12 Nov 2026 21:17:18 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/bitops: Replace __scanbit() with a simpler tzcnt()
To: Jan Beulich <jbeulich@suse.com>
References: <20261110153156.3162601-1-andrew.cooper3@citrix.com>
 <03b84e95-9ebd-49e4-be77-b728acc3021b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <03b84e95-9ebd-49e4-be77-b728acc3021b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0323.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:395::11) To DS7PR03MB8265.namprd03.prod.outlook.com
 (2603:10b6:8:266::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SJ0PR03MB989361:EE_
X-MS-Office365-Filtering-Correlation-Id: 6543d283-72d7-4a16-0c00-08df41025a56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|6133799003|3023799007|4143699003|11063799006|5023799004|261102123227099003|261026140227099003|261028144727099003|261026121527099003|261022075727099003|261022105027099003|261021121427099003|56012099006|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	G2zip/zcgTN7XlLpTrMCM5SWPLo/cBLY75GiBX6WpjVZBEYuCYw0CwRbgI6vRjywq71a6pPIDNnfwGq8oq2c0LXImFw6KzOKXgh6/YGrz5FaR26Dh9UmuJno0cDJSuaYjin1jg6OVhJ+3FEVzuQRMCsJxou+2xD7YtP2ugV8vXPRIWqwKC7Y7D3aS5ll+X/rG0+nDYIwcjnzicvoLTMQFuQDxcvjM0RD7CmWMD5/mUDS5I8w3KHO7apJcrs3aSdvSbXriH9Fce1eK/XFPCSJ9C7LNWsIhlrm7qIZDzonlV84jKAV8jeFe2o/OhbOKQEsQ1Y7RcaQRirys2+LOJ7/VVDpJNIpnCtpq9e8KmtqrOBokNhGCg2SD7jqo91heud5pDu59u8Ex2vYJD/kAle4XphhiXubcG60LrESsduUbUAQJmaE7vETuymurOIox6kXf3R4ESJf7RtdqBwtOX/8suv2t6P71AklWgsSw1hIIxpTXMPJ2wZIvg6UBJPQUKoSjjSG3OP+6FjzZiHo5mcMqpKzXt+2bCUWr0XNVC7aH+q/yYnF2qIuIcJQ1mRV0EW/6uU0t33i8vG38IGneOhwLykwC7uWnPyyXI7jx5GTckcY+QMZqzi9uC8wcv5PBL1c
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(3023799007)(4143699003)(11063799006)(5023799004)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(261022075727099003)(261022105027099003)(261021121427099003)(56012099006)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm0xQjAvY0xUT1RHRmc0MHlRNTZPRklkd0VXQ1lELzc5UUtFcUVRVzNiOC83?=
 =?utf-8?B?M24wY3JDMkhURHdZekpYQmpkS2VHNUFtMlc2K3Y2Z3hBdE5BNDlHRXFBdGRy?=
 =?utf-8?B?Vnh3UVlHVHVhNm5YWDUrd1hiSjFaL080WG5aRUNuNHgwQmdTRnh4VG1ORjJD?=
 =?utf-8?B?TXp3U1NCSVYyQlFzK1JiTG5uQXkrMzg1dEpIV1oxSHJvTWU1c3hndmFhU2gw?=
 =?utf-8?B?M3dJVzZaZWZDRmJibG9IZU1rYm45QjVKMkd3SjVsZVFKQnVxeTRycUd6NE0z?=
 =?utf-8?B?Nk9MWk03OVBrdmxrWnRRaVJzU1dKN1pPQjkwWHNyVmVXZm9iVFFnaml3OWVI?=
 =?utf-8?B?OXlpVzJ0dEVrWG02bUxwR0hTQ3d5dTRwYjZCc2J5SWFMSEFJSlZNZjJ5Q3A4?=
 =?utf-8?B?NzlXOFVzT3FDblFhQUJtTHZkRkUzamdaeUEzcW1tVmErclJkb0xtYzlSQWRr?=
 =?utf-8?B?UGUreUl4a1VWTk93eGRrd3ErTVB1Skk4L21NV2JleWVqSDJpL0wrMzRreUtC?=
 =?utf-8?B?MFdrTEhUUXJuTmxjYWtJenFDMlZrZ0E4YktpMVNjbnh0SVk3eGtVRi9LT3RI?=
 =?utf-8?B?ZldzcHIrT2lzMDdwOWZLZnlrOXoxb1ZDa1FTMmRCMUZLVTRNSnVnZHMvVlZk?=
 =?utf-8?B?NFdVc0luOXZRWjJqdnRndEpMQXZ0ZzFqSHlVM0QwZ2lOdUpRWGJ1c0Z3SDFU?=
 =?utf-8?B?ZFUrakV5MmptcG13aTQzb3Y1ZTZqTTFvMVUyWXZRRXpvcUY4ditvRDd6djds?=
 =?utf-8?B?TG43dTJjZlF1TG1NUG5QWjNPZnRCL2FTdUZjWU03MCtWMnRqcTRNcEtBSjZW?=
 =?utf-8?B?a1VwTnpKcUJsenBRVlJ0Y01vY0lMVlgxV0h5eEpiM2Q3cnd5Z0tRTzRlbXNR?=
 =?utf-8?B?QVdBVXljRjloWWtVQjFtbEFzNUcrSUN5VWsvR1NjNjJUQW8zTnViSVdwSnFP?=
 =?utf-8?B?bHJEU3FVbEN2eUNONzlkc0phRjBUWW1XSjRTNUVsNDRva2V6WWxFS1dwaFdC?=
 =?utf-8?B?bCtqS0JuNVN5am1mVHNLekxPamdQdjh5K0dOL2l4c3g5cHlyR2d0VjViN0FS?=
 =?utf-8?B?aUYzcVdhNXVFdlBCV1ZTZS9jc21CQmV3Z0pnMGw1alV2YlB6a1VnTHJsa3Nq?=
 =?utf-8?B?MUZEUHB3UkdhSDU2Y01nTHcvRWNudGdaUy9sUzNNeDgrTEc3NThuVDBLVjVF?=
 =?utf-8?B?VHczRkMveEcyRGd3SjRnV0RpSlc3Y0JWZllBM09NenJjekh0bkRvNklFNGVB?=
 =?utf-8?B?WkppL3hiMTRFVWtKZ1RlWFhEOUkvRTI0dmJaU0JhdHY0emRMOGppYlc1Qm1P?=
 =?utf-8?B?ZmtGUUpseFQzUGpuSXBJbjdkN2VwZXYxa1R1UG5SLzkzOUZwbDJ1U1pkMW9K?=
 =?utf-8?B?Rk1ERkxneWxRaUdiUUQ1d1A2dEtKcFEvVHVXdzJWeWdqMDkvQXc2Vmd3YUxq?=
 =?utf-8?B?K3NSamd2RVFrQ1dxK2k3alArcXNBcTZZVlZ1M3dySTh2ekJETmZxa2tNeXlM?=
 =?utf-8?B?R2d2NkNlNFVUOTZtS2FvWi9sV1NIYkdtMVdkMGV3QkxzTUY1emVNZ0FWQ0ZB?=
 =?utf-8?B?dTNVZkRlaDF5eHBsQUlSSmFHU3RzeklXQTRsMUdXYTRpL0hCZnAyTkFGTDdu?=
 =?utf-8?B?NXVYcTI4NkxSbFd3c0l1anVxeStQeThGQ0cweDhPSTBRWEo3Z2ZFdEh2Lzd0?=
 =?utf-8?B?c3g2dzhTczZKS0dRaVVsOEtNS1VkVjRrWFRXbkM2OCtWRDRPY1FNSFlCWHpV?=
 =?utf-8?B?NnpHRk0vZ210ODhjby9kblBNY2N3d2lZRFhDcWpNTU9ST3RoMTRydE43d1FR?=
 =?utf-8?B?blVnbXkzK1BuY3AxNzV6NWJ4ZDdBanluWFdqcWlQZmt1Z3ViYnlJNjAvNitS?=
 =?utf-8?B?dHlINTd1bnZrdTZCWjhCN2xSakdFTnVvRmxTUlhvQ2dKTEd4YU1hWWhZZXM3?=
 =?utf-8?B?Q012RXViaU5wb1Q5a0xESjZ0ZUlXZnNKRUpWV0Njd0RwRGNTdTcycEVoV0ZM?=
 =?utf-8?B?S2hhenpZZFd5Ty80TUR1MDBiT1c2aHU0TVJmZU5RcEdJanpGRFQ2RjZTb1NW?=
 =?utf-8?B?WXZvUytvd1NJdVdZZlRrYU1iMC8zSlBSejNVQ1dYSU4yMzhRNUJGMGNxckRW?=
 =?utf-8?B?b2VFZEN0YXpnd1d3NG1oUFFhRWljTUZIMVpzNmdLRCtmVDJHM05FWEFQZjh6?=
 =?utf-8?B?YWVJajE1RUo1RVkvVXo3V21QVHFqQkNKeHhuVjNpSHFpZmNtMnYxajE5cTJL?=
 =?utf-8?B?dEZaQ2tQekZTREpGOWR1dGxBVmxZQXdEbFEzZjJzeno1c3NPbGxQaEhQSm1D?=
 =?utf-8?B?QklRamYwRFFIRmxTOEN5N1oyVXNSQWdjZzl2b3doNFM3N3VFM3dGdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6543d283-72d7-4a16-0c00-08df41025a56
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB8265.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 21:17:28.0297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EGgdfqMQ96YNyvfCRnYPMUBo057A5LPiDZRtZHBow7oBPEadykF0DqysKFUVHx6EDBz7edWMUT31Q7R1WvVzGT7iUOuOfc8hH8DbFIGCMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB989361
X-purgate-ID: tlsNG-4011c0/1794518394-4A9D9CFC-2426CB10/10/78276251493
X-purgate-type: spam
X-purgate-size: 3195
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/2026 8:33 am, Jan Beulich wrote:
> On 10.11.2026 16:31, Andrew Cooper wrote:
>> There are 4 remaining users of __scanbit(), and they're capable of dealing
>> with max being BITS_PER_LONG.  Switch to a simpler tzcnt() helper, which also
>> removed some alternatives from behind the scenes.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> (with a suggestion below)
>
>> Supercedes "x86/bitops: Improve code generation for __scanbit()"
> Quite a bit neater indeed.
>
>> --- a/xen/arch/x86/include/asm/bitops.h
>> +++ b/xen/arch/x86/include/asm/bitops.h
>> @@ -320,18 +320,23 @@ extern unsigned int __find_first_zero_bit(
>>  extern unsigned int __find_next_zero_bit(
>>      const unsigned long *addr, unsigned int size, unsigned int offset);
>>  
>> -static always_inline unsigned int __scanbit(unsigned long val, unsigned int max)
>> +/*
>> + * Search for the first set bit in @x, returning BITS_PER_LONG if @x was 0.
>> + * See arch_ffs() for safety discussions.
>> + */
>> +static always_inline unsigned int tzcnt(unsigned long x)
>>  {
>> -    if ( __builtin_constant_p(max) && max == BITS_PER_LONG )
>> -        alternative_io("bsf %[in],%[out]; cmovz %[max],%k[out]",
>> -                       "rep; bsf %[in],%[out]",
>> -                       X86_FEATURE_BMI1,
>> -                       [out] "=&r" (val),
>> -                       [in] "r" (val), [max] "r" (max));
>> -    else
>> -        asm ( "bsf %1,%0 ; cmovz %2,%k0"
>> -              : "=&r" (val) : "r" (val), "r" (max) );
>> -    return (unsigned int)val;
>> +    unsigned int r;
>> +
>> +    /*
>> +     * The destination register still needs pre-loading for older CPUs which
>> +     * will execute TZCNT as BSF.
>> +     */
>> +    asm ( "tzcnt %[x], %q[r]"
>> +          : [r] "=r" (r)
>> +          : [x] "rm" (x), "[r]" (BITS_PER_LONG) );
>> +
>> +    return r;
>>  }
> By having r and the function return type be unsigned int, when the actual
> insn really is a qword operation, you force call sites to do the zero-
> extension if they want an unsigned long quantity. When both are unsigned
> long, no zero-extension needs performing by the compiler. Truncation to
> unsigned int (or less) won't require any extra insn(s) anyway. While this
> doesn't look as if it would make a difference for present uses, future
> ones may benefit.

This matches the other helpers, so if we want to change something, it
wants doing consistently.

I picked it this way around because it improved code generation for
preloading the destination register.

https://godbolt.org/z/qjoMPh3Kb

The zero-extension is as you say, but as the output is strictly in the
range 0 to 64, it shouldn't ever need to be in a long as opposed to an int.


What I don't understand is why the zero-extension is being inserted. 
There's no way to produce a 32bit value without the upper bits having
been cleared, and if you write a 64bit value but lie to the compiler
about it being 32bit then that's your own fault for having lied about
your constraints.

~Andrew

