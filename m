Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A25606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 13:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=LMqOWsdR
Received: from list by lists.xenproject.org with outflank-mailman.1490934.1691862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSwve-0007cY-Af; Mon, 16 Nov 2026 13:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490934.1691862; Mon, 16 Nov 2026 13:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSwve-0007cQ-7X; Mon, 16 Nov 2026 13:39:26 +0000
Received: by outflank-mailman (input) for mailman id 1490934;
 Mon, 16 Nov 2026 13:39:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSwvc-0007bu-P1
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 13:39:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSwvc-006mvO-59
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:39:24 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6afb078c-8faa-0a2a0a5109dd-0a2a4509e75e-2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:39:24 +0100
Received: from [40.93.198.37]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6afb078a-be1a-0a2a45090019-285dc62598a8-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:39:23 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by IA3PPFD02CEB313.namprd03.prod.outlook.com
 (2603:10b6:20f:fc02::2d3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 13:39:20 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 13:39:20 +0000
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
 b=E94qRotpBBb7KePzmWu5CMX9ogvZ8fOSfIVXQv4Zx7xxNm+CRftQIrO+nJ8lnkr1JY9kKuYswCMxG8POYqsXROTWnkLmVR6nBeV2bVQBELoz7bCHZxQh6O6m77pJsNvlzUQ6R7UBBfSQm1kWcZzPuMHIjXMS/YgmVLHNH3yi7zn4JxlDDcU/k47PNO9vr3WACiWByA2g31nnjxKqEsR+6NpaH8FSlePLB4vByHA8cZ4Ypa4/ssW9UOgpwESUstg4YhVNg9GI3a7jGmdp6/5JijtxDw6F78VU4kJgm/LSSD/UkyeQRFNuYLQTpgjhRlJ/PDNfI6P/y0UC0PU+hTHH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRt/fw+90IMNJF8m8npxh7/HWwfijV3rYA/UKFvnKME=;
 b=bqwH6OFAW+mVA3hlMf0h7XXT3krzWDVfRFdZByEmQmK16FhhCGfypzxbvgESbl0FLgVvXoPuWzVppvdSydJxT1vfB6XUeQpdMUT/rUWV6/TPWCHwYNhvFPxRGUPatVeXd6ZZdz1Cp9B/HxaH1z2EcnEHFrsni2At2Gg2AyL93husrStTXLijoYZKjIHdo16Ulx2Pyy7qVT5FVs2cMNndx4gGH40OZQEJdc4wV96pza4jAStLyRsgluXGm2KC5sJ4fZeZ7L7hbPUaL4odUYAy0x7/8aNEeGfhXpquInlfJT6JuSC2FvyUtUZP4xcmImI2veEQwBICI6ZncmRVw5H1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRt/fw+90IMNJF8m8npxh7/HWwfijV3rYA/UKFvnKME=;
 b=LMqOWsdRzGxA9W35IgvNbx9TtHwYuFIV2b/5vRc5dd+LGpjoKIkb6y8oPtSW4TpQV3tmeAYgU6HCiEelc3kYxh3a/gzZq8BEtiuxVPW7CfZUr8wLheasnKp3pj51tdewJAsRrjP3phMPtoeIE98qFn12Z3VGvAM8YOncyarxKq0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a9cb5bd2-aad1-4250-9a23-2ff454dfa5ed@citrix.com>
Date: Mon, 16 Nov 2026 13:39:16 +0000
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
 <d9fd4604-6a59-46b3-82eb-7737a446b2ce@citrix.com>
 <eda4ce7e-458f-4c23-802f-862169dcf15f@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <eda4ce7e-458f-4c23-802f-862169dcf15f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0093.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::8) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|IA3PPFD02CEB313:EE_
X-MS-Office365-Filtering-Correlation-Id: 95759448-6dd6-40b4-b5e5-08df43e70493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|56012099006|4143699003|11063799006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XrF8npSC9c9oEr9Tc+t4nji+wNBa87gaxd2K5C1VSTETJaqLWSTg4FnUtvR31yLXpuq6g7NsiINzZT0wwwSoHkvZN5fyxcBcZzuvucd+KW8ImRO4KlEYLXREKU9wrRMs98/jfrS6TbYRyy0KVcrtDl52vWDmeAio95ykbKL43v1GW6T0a25eL9nmMjhx68xf9sjig450DZu9KvbZ9FaTSK/hteD0o3ruXd/2dj/cFXx/R4CLyDGKdjUDUASbwdsaAfW9tjPmH3C1Jhx6iIpfAFSgJ96leZK0JrqYu+fDUYyc47VO3nvsyG5RJY1aY8N5rJfWSFFq8LVABsLdYlBwEOOJOA/HLiZZSDPBlFKTG6kOv3+T5oGxYK/rKbX757aSpezIrc3dxxziwa8yl4MdlC3pfgObY4yhfYTo7sPrcaaE1oQn9DbTH/rAzPIqt3LVMn62c8IaIkJbrk48+U+O4/uBtuMKdtJRmwpiccOdgwMB0jVMGCPZwN91ik1PqczPu8QX9u194Q/ANGQVhqx3MZFBawk5LjgRcKTv51zimG6FCcsoCQAKbdQ6G+L0zgTagfv2QX4MB4h+6cYg0mmVzenqUzyPu4aL2/crhU3vUc5FbbCZGFzhUu6s2UuM4fQBj1Yhl0d4v09XurllpD1E6bkUtVU2YmL2KGrOqePGyPU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEQzbWdrVUFzRDl6Qk9KWGhOZFlnWklsdUl6Tnh1a1NaTG1wMXQxM3VndjRm?=
 =?utf-8?B?ZWY3dU9FaXFJVmNCWHgwWXBXd216Zkl3K0ZrdUZhdkp5RFdLYUIvZDVCSlFa?=
 =?utf-8?B?dzdpNHkrQU5uQ2N0Z2orODFiL2JkVVh2dEdISFJXTlRUVS92UFdrZnp0UzZp?=
 =?utf-8?B?d0ZYUE9UY1pYNmZWcWorZFg2Q05kbGxIVllOZlFxbm5adUVIRjMyeHpuUVla?=
 =?utf-8?B?V3pBOE5ZTGxnQWxRL2xML2FZb3RzY0NqVWNKb0E0N1ZwdVhYbXpTdU0yOVp6?=
 =?utf-8?B?QjNISWtOTDgxeWE2eXQzUWUrb0VrYVVGYXVmZjZoS24xdmR3c0JCdFZNOFMw?=
 =?utf-8?B?ZjkrOXYyTlhBSm1EWjJTN3dhZm8zWnhoWC9iS1FPdmhjQlBuWlU0QXJGQ1Yr?=
 =?utf-8?B?M015WVNlZmxoZWNsbGxIcFRERlNndGtrV245V0w4WWJveEo0NHVZaXJwajhZ?=
 =?utf-8?B?Nm5TdFMwTWVVL1EvdUxFQm5DMXgvQmNlbDVPbElPclo2YVNaYnlJNWlTd2pi?=
 =?utf-8?B?NzV0N2RaVDExaWdqWS9uR0VBeEFQc1VwaDJ5VHdrYnVoSlBiRE4zNTg4VVNo?=
 =?utf-8?B?ZVp6dlMxREM3VW54eUw5ekF3SW4rbnNQM0VjaG9xd3pYQ2VxZWZFNDFQb1hK?=
 =?utf-8?B?Y0UydUtLcWs1Sm1UajlTVUhjNGE2d3l4bnR3U0U5QmdGYkpQeWNDQ3FOQjRl?=
 =?utf-8?B?YU9WNWJmWWNRSmIvdmZaWnhFYlZmYUZCZ1pURDIvU1V2VGRpR1FMclA2aFVU?=
 =?utf-8?B?MHpKdHRVT0hwYmVzT3huVmhvZVpDN0JhQ25qa1BaVXNnVTZSeUF4cTZUNWs5?=
 =?utf-8?B?TTdSQWphUHZpZ21raFdqQTVSR3cvb28vTm5WMkNHeE1mOHZoVTFsSDhiZ1Mx?=
 =?utf-8?B?dU9LbWJJU0FTRjBrZ2xWSHpDMjdOcHRtRGpmRnJ2RjJZVy9EVE50SkN5bGlu?=
 =?utf-8?B?SENJYXkyWVFXdXdmdDNkQW1pSzZqRUlibW9UcXovcEpWNzRaY05CQXZHaFUr?=
 =?utf-8?B?TjVsRGRTSDlPY216M043MlF2UkQvN2xYMjVrczY4NmtIOC9LZUJlMnJka0Uw?=
 =?utf-8?B?ZGxXSW1ibUhuamVGdFliYVlNSHpkZlhkMGtsanhQWlBCaUhMYmFUbVdxK0hM?=
 =?utf-8?B?MllXQ0xUUGF3d2pZS0RJQkx2NXlPdmF6Qk8vK0ppMENQQVVEOFJRaitlTHNL?=
 =?utf-8?B?cDVUUlFjdnVHSFlEL0VqUjExMVU4OUZDWnhFYkNvZ3JjMDRpcEFhS3VxRkR6?=
 =?utf-8?B?WDNEdThzQkhIT2Q5a2R0dkh2bm8xRU5nTXNlUUoyaFdidllLd2Q5MmUwbnho?=
 =?utf-8?B?QkNPZ05zRFY2UnRUSTlFNWczc1ZsUUhjMDV2S3ovT1U0V3o3c2FIMmFiTVZT?=
 =?utf-8?B?OC9QR2tHWUJ5QnZwWVlZOGVuNVAyeVVyMzcwSzBWbVFzYTFFbXdtNDE4YUdZ?=
 =?utf-8?B?QmJpN1lKcVFONkdtMzVTNUc4WFJwUm5xbGo0ZlRtRmpGbjhPTW9HSGFteEox?=
 =?utf-8?B?Y2o2cnhIbjlwNEhDWFRrd0llMlByL3NXUk96dlNMTEtqRzhWbUdHeUJtZjY4?=
 =?utf-8?B?eU5PRmZCWHZ1Vy9QQkY3TUdmaDA1OUxaajQwTlpLWS9KT1VnRmdOVEhFUlQr?=
 =?utf-8?B?eVpNOVZGaUEwZ09rMm5RRnlpMnpVeEF1ZUJGTFZNakppNmJPUWhoQVBGMnZV?=
 =?utf-8?B?UlNMMWRtTlJlTkdpZWh2aDRjNDRqSzZlbXR2UGZZMHcyRmVLRFFyYXk4eFZV?=
 =?utf-8?B?S1J5NmFQRjNOaElHTmFTcmc0MnphNnhlaDZyVW0xVXl3ZEZRK2dnRFlTN0JF?=
 =?utf-8?B?ci9GSmM1b2VrZ1VJckRiSEFZUEdxN0xRbDY5YittQ3dhZDJGWXoxM0RwYVRJ?=
 =?utf-8?B?cUhoQmJTSnlrWUZNd3plZW54bExHSUh5MFJJdkgwRVNuQjlWTzVEaTlwMTNx?=
 =?utf-8?B?WE11aGM5U0JIdEJ1V2YxQnpwb2VySk53RklFZlh5UER6UjFUY3VLWEdVY3lt?=
 =?utf-8?B?eEFWYUJyZmhWK0pmZWw2c09rT0hGZTNiN0V2bnMwY0RGWEFwRzVCV202WGZI?=
 =?utf-8?B?R3pNRGMyZ0U4OCtZUTAwS0MvUlhHRGVLWFhmSkFRMlZkWWNnclRXZHJ0Ujcv?=
 =?utf-8?B?T2laZEdUaGVJcUgvLzc3TFJKeVo5WlVTVzIydmFtTzg3dGI5WFprZmtMbWlJ?=
 =?utf-8?B?MU5PWXpvQzdKRjJQcWNFd3Y4bjl5Yk1Ka2Zjcnd4NUhsWStVbkQ0SW11QWs5?=
 =?utf-8?B?TjhzVHpvS0l2UUYzald2YnhUNi8zejNUd25xQ05EQVpCQkxPQ002Zms5Q0pz?=
 =?utf-8?B?dSt2VFFYY093SjcrUVFVOU5URGhEeDl0UW93N3J0Yzk4TzZlOGQrSkNhTElG?=
 =?utf-8?Q?uaT4luYNe8vFGoCo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95759448-6dd6-40b4-b5e5-08df43e70493
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 13:39:20.3924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtYqsHHIJ2FTRJUIgDEreN1iRtWt9CrT7EJNzE9REcrDguZj0qKJ+ZNBs2VR1GmOeY3hx/Bg5orNG8k06xuEPJlnTc+fbg9tEEeH5q69YH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPFD02CEB313
X-purgate-ID: tlsNG-bad1c0/1794836364-FD06B034-8315F75A/10/78276251493
X-purgate-type: spam
X-purgate-size: 1903
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/16/26 12:23 PM, Jan Beulich wrote:
> On 16.11.2026 13:05, Ross Lagerwall wrote:
>> On 11/16/26 11:42 AM, Jan Beulich wrote:
>>> On 13.11.2026 18:24, Ross Lagerwall wrote:
>>>> According to the APM, the #PF intercept is tested before CR2 is written
>>>> so don't write CR2 while injecting VMEXIT_EXCEPTION_PF into L1.
>>>> The faulting address is available to L1 in EXITINFO2.
>>>>
>>>> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
>>>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> Thanks
>>
>>>
>>>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>>>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>>>> @@ -741,8 +741,6 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
>>>>                    ns_vmcb->exit_int_info = ns_vmcb->event_inj;
>>>>                break;
>>>>            case VMEXIT_EXCEPTION_PF:
>>>> -            ns_vmcb->_cr2 = ns_vmcb->ei.exc.cr2;
>>>
>>> Further to what you say in the description, isn't this also a stale value,
>>> as ...
>>>
>>>> -            fallthrough;
>>>>            case VMEXIT_NPF:
>>>>                ns_vmcb->exitinfo2 = svm->ns_vmexit.exitinfo2;
>>>
>>> ... the correct one is written only here? If you agree, I'd be inclined to
>>> have the description say "... so don't write CR2 (with a stale value) while
>>> ..." (happy to adjust while committing).
>>
>> In most cases it wouldn't be stale because ei.exc.cr2 is the same as exitinfo2
>> and ns_vmcb->exitinfo2 is updated before this in prepare4vmexit(). However, I
>> think it may be stale in some cases, e.g. if the #PF was raised by the L0
>> emulator.
> 
> So further add "possibly" to what I suggested? (If ns_vmcb->exitinfo2 was always
> updated earlier on, the updating here could be avoided.)

Yes, I agree with that adjustment.

Ross

