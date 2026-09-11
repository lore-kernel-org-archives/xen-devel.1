Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E50CC88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 08:43:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415989.1645160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4wqH-0007v2-FP; Fri, 11 Sep 2026 08:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415989.1645160; Fri, 11 Sep 2026 08:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4wqH-0007uq-CM; Fri, 11 Sep 2026 08:42:41 +0000
Received: by outflank-mailman (input) for mailman id 1415989;
 Fri, 11 Sep 2026 08:42:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <okamoto@valinux.co.jp>) id 1x4wqG-0007uK-1C
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 08:42:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4wqF-008YCw-E3
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 10:42:39 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <okamoto@valinux.co.jp>)
 id 6aa3befd-8faa-0a2a0a5109dd-0a2a45098678-8
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 10:42:39 +0200
Received: from [52.101.125.131]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <okamoto@valinux.co.jp>)
 id 6aa3bef7-be1a-0a2a45090019-34657d8322b8-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 10:42:34 +0200
Received: from TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:af::12)
 by OS7P286MB7475.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:43d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 08:42:29 +0000
Received: from TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2067:ff0e:4c3:ad0b]) by TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2067:ff0e:4c3:ad0b%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 08:42:29 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YolJ/IqbHOHj6kUFJYbEhQq+UDnlOhn/HozNapF+i7PyWP3Brpr03VZMCF7Q/WnozE7VPvBhtlhgE0474z1tDm9f2h641o9UUDHzf0ddZ4UQBBV8TxQW4C983IgdOhm6qmbj/oDRH7hy+vTcVXGIj9Thob/7x9VDSqx3Hzg8I8vvO1N1KfonDGIOXdeFk/MWqOGally3UusHvZzOTPIeDWFz+hBDDpWH1Ly1hSHKNPZAJ8QJK4AfLFdF75R4KhujjHIs5Ruyb4xRE1VoVBuhk/DPIqPS8i1ddpbVNsUK2vBvmwBjAM7DQtr/XzuP8XN5cBkn6Qk+yGqMVOPdf0FGdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPJ5QY+3kppKZ4cOZLPHOJhBzEo2t1v/O8J4BX58dRs=;
 b=fyg9RcfBf5oFQAluszgqDmPUsn+h4MrZrewHUTtqgstpZ+8F8bu5pg1TBfFwQcx3EctHcKHZ+BLf5dM2ERbZgGNURBrAbebjUr70X/GuiRKhoFVYeqOLHxKKHdJGxchUpztHUdaEGYDyGEoQW4IxTmBy8ThuGioI+OmWv/NRUpEhCuFp0zKpXSBD4Q/1t9AtbfslJ1GbuR+77Pmeuqa7+38yBKlKNbv9vUz09LHLaHHxrU6bZdLKkkXiqdCxBS1n0cb6rADBi8X7GW4cUJhVVBADQywQY1DAkmlzJAXJbF4iU2wjJzsMbDVrmMx/An1Ig9W9OAbcpmfgxDGq06XzaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPJ5QY+3kppKZ4cOZLPHOJhBzEo2t1v/O8J4BX58dRs=;
 b=TogDKm4ldSlIzKG7NplS/ZVyep+e9WqMupw2HlQHUEilZ0c/FQEsBYuwIAOh2qX2bbM1x8/T9o4Y8ylDYn0YeGsKoN/XyIkXfTz8mrTZ5l4yHho528Q1i/XK5NcHrobJcApVYl7sXEJ0zCFdySKYoITc4G748Xgp0T0kygUSjvY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Message-ID: <8a74abbb-c890-4872-88de-7cc01a3da4cf@valinux.co.jp>
Date: Fri, 11 Sep 2026 17:42:28 +0900
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm64/atomic: Clear exclusive monitor on cmpxchg
 failure
To: Jan Beulich <jbeulich@suse.com>
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20260909061253.546312-1-okamoto@valinux.co.jp>
 <60532fdb-616d-4a25-8c7f-fd5cdc558787@suse.com>
Content-Language: en-US
From: ryoj <okamoto@valinux.co.jp>
In-Reply-To: <60532fdb-616d-4a25-8c7f-fd5cdc558787@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0051.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::14) To TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:af::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB1053:EE_|OS7P286MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 146e0c8a-7153-4514-f587-08df0fe09cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|23010399003|376014|366016|4143699003|56012099006|10067099003|18002099003|22082099003|43062017;
X-Microsoft-Antispam-Message-Info:
	3nyy9UNWSTVAcRGa9viv812yyxoMS0YrhFU94FZIVrjJpPAb/xmGTcF/T0MV9x7ymTSdIMJkJHUYOPqL52r70958U+dIMMDeFZbdnYxVpIaM58lf2Z6uJDRqY6njmjmnNeFc9RX4EkAQqQO670Bz2u9Pa506i7x9YJg6N538SzXnFrdrp2qQZUzax7LUXsXLmI1dVJqTQOWgyWU5+xhQfibwVuJtfGOakZarY7nA4V1dRIDE2BoZqK5bdPBb7DsTA7nfbBAAOGacLRutvMmKmtT8iR143pOIMyu/OqVHDA0O+cuRM4Qg9xUcAyZHe61wisocYXwDxNgaESsi7bfuzqgozNvTjtXEDL6OFTx9g+9kk9u6ui1TAxFOFnwRFL8pIc7qt0lUWrM8lR02KyL2G7+ex/zAw6vkxpdlAp1tvOGc4cNhAobgA4v8qf1GGBMAgshKI8VDujZCUwqYH+dy38G4sX2ckGE+OJFUwH9R6gbphaEfrxfoXNV1IPcY08zXwM5i7n8NFVUqX5fliVxJOmdKjw4nwVhodlea0sMEKDq4+7cpfoBflDvNASfSln5xpYaMP0pEVknWIwGu7Y7Z/RP+u07OTE3d8aJIpVOR7GVqyRE7R666nQe/kYMY+pERpYlFpvWUie03soB1DGtuzvtEilDFOcbdUyZLB0WxwPmP/zG11nl3+WlFsNy+Kp8noj8VsUlbhTuyeB2UMRDi3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(23010399003)(376014)(366016)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(43062017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejdZc1hsbFkwbEFPVnZjcUJHbW9tc1pHNlFsSnpKQmR1S1kxQTE0dVAvbWRN?=
 =?utf-8?B?TGUwVUh4QTBpdWFjdW1NVFpMZFY1cnFyMTFPeWI3aTQwMkNVc21ROTh1L0tu?=
 =?utf-8?B?OUpReUxZbFVKeENsSjBsZ1QxeCt5S3FzOFBRMFJsdlc1OUR4bUt0OGJUKzRN?=
 =?utf-8?B?UTlGczU5NDhtVkdwTUVlQk0weEI4d05tcHp3dTVPWjR5NUhhcFhOUnNnRnB5?=
 =?utf-8?B?ZFNvVUFKQklaS2x6REZMaDg0MWJ3aEZ3RFRjK1JxR01CRVg2NWhwZGpUYmVz?=
 =?utf-8?B?aTBxbnYwcExkRjFWMFZGTFAycXdTUThLa01VYXYvT1hpb3Rrd0lRTmtSR0dw?=
 =?utf-8?B?Qyt5dDhrNEdTUGRDZlo2T25QdlhRam1NUjhEZW91a0g2d0ZZMTl4a0xSQTAy?=
 =?utf-8?B?S08yS21uS1JWWTMyZkYzNUhZMnRyeW5SeEhZeHN1MnBxN1R0MndWeERoLzJm?=
 =?utf-8?B?UXdqYitHdjRYMVExRVFKcjUzcFFLSXBCWE1IRUZDUzhHK21Da0xhSzZSMzBk?=
 =?utf-8?B?Z2paZWs0YzVhcld6QWJKVzFjdzRlZzZCdHdsYklIMmVONE0yQ3pKZEpiS2ox?=
 =?utf-8?B?ZTNTVWZ4ZlovVGl5L1kvOG0xZUVOeHd0RWRZaUdocTF3VGkxUEF3MytMVnpK?=
 =?utf-8?B?RUlXL3FUcno1bkdhVmJhSEVzU1BHTSsvTE5QMC9aL2dLcno4bTB2VTNxMUJp?=
 =?utf-8?B?eEZhMkMyTWpoMmlFWGtUVkZCMmM5UFBXUXhscit5K3RFUjdSNFFVRFBiZFVa?=
 =?utf-8?B?K1FRbnJjT0R3Y1JGZ0FKUkk0dERBNGI0RUhJZXdva01GZ2ptaCs2MDREc1Y0?=
 =?utf-8?B?c0dzK01Eb1luRDBVWkswdUNXSHpUWWg0Y3pqN25pOU55VEhEL0tDeXpDWUJy?=
 =?utf-8?B?TzZNOFJ4ZlRyeU93OTVqSnZLckxodHNLbXliRlczS2MvbjBVTnhoazkwUFhx?=
 =?utf-8?B?YUpZTy9HT3h4c05rekNKeVoraHRKZjRZNFZOUGxNK1NmNnh3WXdtSG44THBI?=
 =?utf-8?B?N3BPTkc0T25pQzFudFJ2N1IycW1UYVI0d1JIdXhONlNhSGpHWVJMdzFtN1Bn?=
 =?utf-8?B?Y2hUUGNvQ0JQWngyTlpqa1FiSVUvN2tGcGtncWVscitRQ0RkM1pVd2lRZk0w?=
 =?utf-8?B?NFFVWVUxU0FuR3NkQ1FuamRoU1FNcmFwVWJKMGUxeEZzRjh0dzE1VkJlRXJx?=
 =?utf-8?B?cmE3STM4WVVuZjI5N21xNjBKcWpxYXJxcC9Ra1I3TVcvWjg0UVJ0SkhHaC9U?=
 =?utf-8?B?VGxxZlpqQ2VzVGVpbGJ5dWVwR2ROc1ZxcHVRZ25HR2E3QWhqaDFwRVRrcWVq?=
 =?utf-8?B?UkFHRWp5K0ZTOWtseWRmYUlidTNSYzBHTzZaN2NmQ0RJdnRFbGRzR0tFODY1?=
 =?utf-8?B?bjFUd2toSjI5cG5CY2t4Nk9hT05ldlNiMUxLRDhtOEJRSC9hdTdrN2RsZDBW?=
 =?utf-8?B?dUFOaEdtTFlwbzlTVllGUEJWeXY1MllRT0JjUXZRRlhZdFhUeFM4WWVnaE9T?=
 =?utf-8?B?SHNRNy9ic0VMdlErSFhYdmgxcmp2UTM3QzFzQTcxK01sTURjQjNkWnFrRDJq?=
 =?utf-8?B?d1duc0dYUS9xUjRBN2RxaEJkeUlEeDJ6bHJVVnExdTI1bXVMa3U3MUJpelZV?=
 =?utf-8?B?VEtXRkRkN0FpNTJTQk1qUE9HSEp6dCtJL1E0VmRDY1BSNWR4VWtiL0lwQ3ZU?=
 =?utf-8?B?Vk40bFRjTWE4R1NQTGlGRnNkd09UNXdlZkx4ZmhuSXE5dlZHS0ExS2JNdmVM?=
 =?utf-8?B?enJlcUQ3U1M2eVVXOVM0bU51TEVxdC9XY2pIK0ZxK1J2ZGwzR1MrRS9qd3Nq?=
 =?utf-8?B?bStTWFFTdGtHS3ZUVEVoZHlRTENIT2pIb3ZzOHd3YmhVQmlaRGZoazBheWlr?=
 =?utf-8?B?eC9MUWJzMktXSlRXb0pxd0ZlVS9RV2pDbjYzZ090U1ZBelQ5VytUOE5CQmc1?=
 =?utf-8?B?eGpXV3I5aHpYZWQydmdNQmI2OEdHa1NjOStPQ1dEQVYvNUtGbFdqVU1Ma0dC?=
 =?utf-8?B?RWNLeVJlYjRCeXlZakhOTi81dWRLMFFRejd5b1I0dW01ZWRNMGxyNjN2c2xZ?=
 =?utf-8?B?UDZiZ1dPUEJRSDlEZjI5YXFzbHhYS3JFUVZxQ3AraVVrS0pmaTNTdy9jcmxz?=
 =?utf-8?B?N2J4NnBJOHYyTlVNbDVUdmF4ZEV1aG50UUh0MFI1UmNkSmc4VjVjb1NYTWNL?=
 =?utf-8?B?bVUzM1dma21WUFRJbm82ZlZWMUtCUDNJQUwvNVF3d1hWYUNkdkR6ekluam9J?=
 =?utf-8?B?OWNnc3FQY2V3QXJFdFlqalNHQ2tsVFN3TEM2RFFRbFJBUlhFanFXWFdUTFdY?=
 =?utf-8?B?cGpIbE8yM2Q2QXczNWhVbCtOMlhaRG9xOTgyM1E2VTQ3TG53bVFJSmhhN1Zh?=
 =?utf-8?Q?y6pmIBmpbvJYQU/7Lp/oo4+Kh8KIPbgJi+Dd+LQGr0pLc?=
X-MS-Exchange-AntiSpam-MessageData-1: wNUP+yf01fzajg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 146e0c8a-7153-4514-f587-08df0fe09cd2
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 08:42:28.9882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggjE6RrWfA5PDXesx7i1r7OEM4X/VFxg1x91wmtdN2xxdvnYzf/vp8AdW83g3D24EZ+xl6qzX8G3v6qSOAfeWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7475
X-purgate-ID: tlsNG-bad1c0/1789116159-BFAD0034-6A3B1FC5/0/0
X-purgate-type: clean
X-purgate-size: 1086

On 9/9/26 15:31, Jan Beulich wrote:
> On 09.09.2026 08:12, Ryoji Okamoto wrote:
>> When the value comparison fails in atomic_cmpxchg, the code branches
>> out without executing stxr, leaving the exclusive monitor in the
>> exclusive state set by ldxr.
>>
>> Add `clrex` to the failure path to explicitly clear the exclusive
>> monitor.
>>
>> Fixes: d2654a556835 ("xen: arm64: atomics")
>> Signed-off-by: Ryoji Okamoto <okamoto@valinux.co.jp>
>> ---
>> v2: Use tabs for indentation instead of spaces
> 
> Well, ...
> 
>> --- a/xen/arch/arm/include/asm/arm64/atomic.h
>> +++ b/xen/arch/arm/include/asm/arm64/atomic.h
>> @@ -118,7 +118,9 @@ static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
>>   "	b.ne	2f\n"
>>   "	stxr	%w0, %w4, %2\n"
>>   "	cbnz	%w0, 1b\n"
>> -"2:"
>> +"	b	3f\n"
> 
> ... you now do here, but ...
> 
>> +"2: clrex\n"
> 
> ... still not here.
> 
> Jan

Hi Jan,

Thanks for the feedback on the indentation.
I'm withdrawing this patch, but I'll definitely keep this in mind for 
the next time.

Regards,

-- 
Ryoji

