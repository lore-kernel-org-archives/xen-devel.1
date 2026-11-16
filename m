Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4B5606A323
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 12:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=MhCNF0oZ
Received: from list by lists.xenproject.org with outflank-mailman.1490818.1691781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSvSX-0001gc-0m; Mon, 16 Nov 2026 12:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490818.1691781; Mon, 16 Nov 2026 12:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSvSW-0001gU-TW; Mon, 16 Nov 2026 12:05:16 +0000
Received: by outflank-mailman (input) for mailman id 1490818;
 Mon, 16 Nov 2026 12:05:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSvSU-0001dH-VP
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:05:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSvSU-00EKxZ-9i
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 13:05:14 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6afaf15e-8faa-0a2a0a5109dd-0a2a4509c6c6-44
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 13:05:14 +0100
Received: from [40.93.195.17]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6afaf176-be1a-0a2a45090019-285dc311f332-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 13:05:11 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SJ0PR03MB5616.namprd03.prod.outlook.com (2603:10b6:a03:280::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 12:05:07 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 12:05:07 +0000
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
 b=x/vmejaeSvRsPHpxYfGqSBojoVMtKrXNW21IOpFEGAv8deBpPLWjQTPaputaVbEsbrKPBgn0Y0xwh7iGiaIcrq4wL4/UWeuuLBngZ/Xwjt/OJEjnA7v7jmpojuE/pgJY9V1XDFwFBPj9qJpya8Yo5EtTD41eUnBBc9RO5ifqmG5cmPlEjJY1GHX0KExWLiAjLGZ4C1o7crR3NRqABFrJuRLelgDrmS2h4pkGlpHHt/JP8aUfQQi71ltFKzuf4KS86oPtVGdwgQF3E6CaprsQOi1zOoL2OBxSIe+DGSF59a6BY9FjH0BPEo0H6sF8klYMsmIwjssdymMZ+/PM0U/9LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j125z2HDXRtpcsdhI2ouh3rxd17JDqaQEi7qlgRm4EY=;
 b=XQ6vKvmavLcxaXlS1+Urc2KBw/ujAuOm7jF0ccCKbrZYiqVKKyTSYBICvMKgYEX63xjZbhULDSI2wfs3ywwVPNFIHFfe10toa3xvAqPlPbWykGBT/T0yj4ET4jjWR+af6wZ1iRcR2KWwWdx6CqveQ+WC3bf3O98MgPEgdOmNFAJf4mjgpnBjoezmylNB6EQ5VH+ROd20a0mE8whBSHfkZFHUB3unddDK23Xx+DXJ8TtfJqLclhhnjiFgKIlgyoGjipcfzvEHUHk4cRM42pHDJsLLMhLwHEbn/a4HRVhKdK/jjehQpRhapaRWhHunE8TWgcw0bj7yQYIR6Uv4HxVuhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j125z2HDXRtpcsdhI2ouh3rxd17JDqaQEi7qlgRm4EY=;
 b=MhCNF0oZvAHioDVlHCRK1K9WwY3vfk8awnlIsZ9J1RPkQ600pxpLGok1T360BKFRliy7FZ6LdMbs/p+45ZzUDbrigdO9sypYV6fs/ssH9Ulc3Gz5IxX4LDUqOlK7Fnhot1QHPwN4UVQJ4rcw5RFnXfp91AfXcZb1ebPXZFbwknk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d9fd4604-6a59-46b3-82eb-7737a446b2ce@citrix.com>
Date: Mon, 16 Nov 2026 12:05:03 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nestedsvm: Don't set CR2 while injecting
 VMEXIT_EXCEPTION_PF
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20261113172444.720081-1-ross.lagerwall@citrix.com>
 <4aed0b50-f224-48f2-97c4-d56ae1ac3012@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <4aed0b50-f224-48f2-97c4-d56ae1ac3012@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0270.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SJ0PR03MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: 764e4a05-efe3-4413-2f77-08df43d9db48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|4143699003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SXNJt45KtE+JaegM+DSQKjlluHgLQCyhp+s2gjaX2O3+wpIjKixPEpvF93dZfmQH/tXvkOBdjWaAIPW7EiBA0vNH+3/YsvAY7aXH6DeWkUzqBtd6alxX542oDH/DaF7d64yD8E5oGjxviHVvfNPxFBqd7HAPOn2DOkKm94zc+j2gKPEcCJxsT8Zm0P/I/SlMzMhftRzLjx5Ra/lUVgBhjhDyQ038jzTELlkLyxMOrnVgm3FEYK7pgStRRSjDVyNlD2WSLQuLPxLCW4JGGmX97RhyUwWJcEaaC0OGUyWKwqcPCGdrnwSUfPFRgchwv2LzOjar5mjJOG+9fOBjzUQsfClMB0WfWHnruL2IP7m3OVL3aERIX3UUkxn/7A9yQdQt0HWkSzYNBLT00PSNE3jrmuJLRFKg6f7/uX9ObUnsqcMc2fTv/vaDlIxaCDTR2WXJcznAuTglHjXHQD6t2WTB/wHGTrXZBdMhNKGTgFBHaq2wtySqxNCVVmARBno4ljjn+9THb/uRU1OtmCU2Hx5jHXKMNQ4swo9w6jJkBGmMttaOHTcc9Tgkl3I46rhmRGd+oV8T9hQpP1zl4T5v2lpDiiflnfZ0KJPJYeh1hws9T9uSeRp+Qh+Qo3xeoTFstOfb4oox6zvgkCBA3OR6Dp9dhbTucthGi4tjSudYlmyGqv8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkhKU2VvemdMVHZoZE1iV1AvaCtWRnRyOGNUM25MNjF4ODV0SnZqN3lQVGZS?=
 =?utf-8?B?dGpUaTFrN0c2d0RYRzMyOStTNGNnSzFxdmFTZ0tacTVhVWNCSGxxc1hmTy9l?=
 =?utf-8?B?TWZxTUEvVWhFdGlVdW56YWdGVEszRUdTTU5Zdmd4UHVQVGR1bmJUTUw3L1pk?=
 =?utf-8?B?UkZUeU1rNVhVR3dBTFoxbXpwT2RWalFKMnpLNEZxOHBpN0tlYlVKTzJ5OU5a?=
 =?utf-8?B?RUQwT1REODBHOGVENm5XQ25OaFkvWjY5cklkMXB6aE4yV2lpanhtZ2FBUVQ3?=
 =?utf-8?B?em8yYS9kU0diZGlBRkZRM3FmdDVQUit4YnUwb1RlamNIYkFrK1NPeVpCUU1V?=
 =?utf-8?B?TktBR0JFTk1IYlNhSEtxRE5BODM4bWp2NEdjZUN0SjV2YldjZi81WjRGeWs5?=
 =?utf-8?B?Y3ZNVlo1T3JhY1dibG5ZbnJuY2FDMHlxNSttL29Dc1N2SU1VL0xlOHJaU0Fq?=
 =?utf-8?B?djNxaDQ0QlAxVitPT1c1MXhNK3pVOTJHNmxFUU9lNlVqQlhpMUJNbk1IQVYr?=
 =?utf-8?B?Z003dlhpV0swSnZIVnEzbjV6QzJkQ0JKaXlsVXJFeUY5a0FNUUcrYUdOdUJX?=
 =?utf-8?B?WkhKUWo5c2pYdWdKZUViN2FJK3F5QWhnYzdhRlJFMkQwOGpNUkpMc1dGcGJ0?=
 =?utf-8?B?dDU2Q3FIaUFtdkxHMktIKzM5N1dGVjlIeUt0alZuWFhzN0lhWjZXYVlvL3Fi?=
 =?utf-8?B?S25hSWcrZUVaQTVxc0FyNmhyUkVnSytacU5mUUo5RkN0cGl4Y3ZFcS9tekEx?=
 =?utf-8?B?KzZCWk80L3EvL2txYUhtRzRqNWdKRjVTZUN4anl2K1dTS0szSCtibjFyYWtV?=
 =?utf-8?B?VjhUQ1VtM2JlS3VacFZ6RmdjRE9oQzNra3dUNnVwQUVOZi8rUHQzNnpoUUMw?=
 =?utf-8?B?NTg0K3hab004VTI0N2lkcXY2OFE4dFlFSW5PY1ZQSkU0cGNnRXhRdEhSOERz?=
 =?utf-8?B?dmVDVkJQZS9MNzVPNlpPL0pOUU1HSXB6VVcrMjV0ZWIrUEdINmNBMDE3VkFS?=
 =?utf-8?B?RkxTQWF3UEhkUHVwZHhwZkpwWkJwMi9hMnZQZ2R0YlgyVEhPZmxzNzVtVFQw?=
 =?utf-8?B?dnhZTUQraVhNSStGVlJDa25LWlRGdmVnZEJoVjdNTmd6cWR4cVVhYXN1L240?=
 =?utf-8?B?Qm5GbTJ0b3orcXhEZC9WcE91RGppYkg0Zmx1Y1dZREptR2h5WjR2ZVVyQjlI?=
 =?utf-8?B?d0pncVgxckhEaGNXQkR4RmFpc3ZWZXlXOUppN2hEajhoa2dOK3o5L2lpZS9C?=
 =?utf-8?B?Q1BwVWdQdFQxek9vcVk0azArUUhmaXBFeTJjNUoyaGkwVlcrY3VRMEl0eXIw?=
 =?utf-8?B?aWNxWGp2YVR6bFJobTZraTZhZmw4L3BmYUYyTGxYdVVtZHdJYjBNa3dKR1V0?=
 =?utf-8?B?b21TY0JsNG1xQzN6UDhlakNnVG9lc3BzM0tSUTU3QVZwbVhMWUlMTmV1WHJQ?=
 =?utf-8?B?NGhtTTg4VU9tS3pzL2JmSGZsYVhiWWFxWW9iYWdhYUs0L3FmOFFoUllLcmZW?=
 =?utf-8?B?em10YTk3N1NiMVk5SDVia0M3YTNYbmY1YlZWckdkRTN5SnkxTHoxQ0hlQ0dt?=
 =?utf-8?B?cStOdXR6V1I5UDRJajFYVTUxZ3J0dDV5UzMreENQTlNXUml3a0Q5WmRnVlM0?=
 =?utf-8?B?WHd2MjVJb0wvaDRvV2JKS0RMZU1DL21rRk9jNXc4UWxlcnlFL0I0TU9PZnVx?=
 =?utf-8?B?a2EyaTBaaHFCZHhUWk1mT3E5eWJmQzI2SjZaMHNYWTlJdyt2OWVFbjIwL3Ba?=
 =?utf-8?B?UGV5d0VoRk1UNEhlZU5NQWVIc24rZUNNcFh3Vk9aYmZXakJlRndtL1Y5Tm9t?=
 =?utf-8?B?dkJuaEVraTE1dU1iQkNqaExON24rd3JGNllPOVlrOG5pcmFiMU9CSUtXNUEv?=
 =?utf-8?B?MmdBeDdQVTUwN0pWUnAySk8rREIwT25xdGYvaVROL0owUjVzZ3hPR0FGKzl0?=
 =?utf-8?B?Z2pGYzhTUnBRTHlhOHJ0Q3E3R2Vkbm1BN0RpVWU5cUNVQjN2ZGVGRHh1S2Jn?=
 =?utf-8?B?c1FLWE5UU2pGWEpHQkIyaWtzRFB5eTFNallsM25UK0Zyak9nWG5adno1RFdG?=
 =?utf-8?B?Q2tDVlRqbHpzdlRJYkhITlNHRjVDaUhNM1h5ZFFYRzJ2b0UzZzh5ZjFRa1hY?=
 =?utf-8?B?RXJyQXJESUZpT3Z6cFQzZUdYcEV3RUEzZ0liRE55bFE2S1VndUF6VWxSWHg1?=
 =?utf-8?B?SjEzb2VpMzZSL25wUnlUS1BOTnkvamdhandwdzQ2ZHo5WGtCbkptM3Z6aE1C?=
 =?utf-8?B?ZXVsVnBYZm5RdDNsdVZteXVaK04yV1crdWl3NVg2YmY3THA1REdXY25MTW9x?=
 =?utf-8?B?bTdhWW5JZmtBWEowZzV5K2pwSFgzOStRcHk3YmJJaEE1RnNFeFRsc0FCRHQv?=
 =?utf-8?Q?S4yKeWXlOktsU93A=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 764e4a05-efe3-4413-2f77-08df43d9db48
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 12:05:07.6767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZXJjj7jQNAoCI2HGPmNmEzA1jCxc+YrpVkNduzOwSqcObNDNrSt4ZOl5F/UOx3hCx1xzj4ztWkg7MB7SHkQfxUP0IjUVv5GzZnDO+Db5fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5616
X-purgate-ID: tlsNG-bad1c0/1794830711-BF2DC034-CA634FE9/10/78276251493
X-purgate-type: spam
X-purgate-size: 1549
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/16/26 11:42 AM, Jan Beulich wrote:
> On 13.11.2026 18:24, Ross Lagerwall wrote:
>> According to the APM, the #PF intercept is tested before CR2 is written
>> so don't write CR2 while injecting VMEXIT_EXCEPTION_PF into L1.
>> The faulting address is available to L1 in EXITINFO2.
>>
>> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks

> 
>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>> @@ -741,8 +741,6 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
>>                   ns_vmcb->exit_int_info = ns_vmcb->event_inj;
>>               break;
>>           case VMEXIT_EXCEPTION_PF:
>> -            ns_vmcb->_cr2 = ns_vmcb->ei.exc.cr2;
> 
> Further to what you say in the description, isn't this also a stale value,
> as ...
> 
>> -            fallthrough;
>>           case VMEXIT_NPF:
>>               ns_vmcb->exitinfo2 = svm->ns_vmexit.exitinfo2;
> 
> ... the correct one is written only here? If you agree, I'd be inclined to
> have the description say "... so don't write CR2 (with a stale value) while
> ..." (happy to adjust while committing).

In most cases it wouldn't be stale because ei.exc.cr2 is the same as exitinfo2
and ns_vmcb->exitinfo2 is updated before this in prepare4vmexit(). However, I
think it may be stale in some cases, e.g. if the #PF was raised by the L0
emulator.

Ross

