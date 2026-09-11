Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EFAC88E4A
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 11:14:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416409.1645460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4zCp-000542-Qe; Fri, 11 Sep 2026 11:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416409.1645460; Fri, 11 Sep 2026 11:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4zCp-00053v-Mq; Fri, 11 Sep 2026 11:14:07 +0000
Received: by outflank-mailman (input) for mailman id 1416409;
 Fri, 11 Sep 2026 11:14:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x4zCo-00053p-50
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:14:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4zCn-005VpV-Hy
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:14:05 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa3e26e-8faa-0a2a0a5109dd-0a2a4509e576-38
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 13:14:05 +0200
Received: from [52.101.46.12]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa3e27b-be1a-0a2a45090019-34652e0c2baf-4
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 13:14:05 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SA1PR03MB6435.namprd03.prod.outlook.com (2603:10b6:806:1c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 11:14:00 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 11:14:00 +0000
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
 b=f0fyzPXtQc7rXWByvpcdFAY5r7OPBeAVPo3r+nByDrAdBrlNFVZnuqgFosih8o6Iu2VZBpFT0Mn9uXNJ6SEQHzCJ8CCmLN/w358YLJQfC1rHb87YdlT2KTXVTe1WcXdyN2pfycXsTqP1DJY45qzl5iYuZUANt3VvHnNATrNBgFs7pWMgoCuodWBLzn+FlOmG8F2WPDAImAL9W/lbfHtQiRx9x07T4rTvvrrWJo08LI+DATTdIjT33mWmjJxBHbHHqXtiV4cTuaBQ5EBhRpJQVuWnCVjZfh9R7ztQ55jK8C1xv28ZItvzh4bRHjMohjljKec9SFftEeROGhfWKo+UBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTOA312Mu0a3gMt/IzddjVv8a+YbDC1M4IugOsgTUbk=;
 b=R+Gptu/ulti0TSOwPfCiWt5u4fwtAlggP7n8hsQhBrhyLSgnZxElZB1dDsfMJveL2SM3oIr8SM55eyoIMS6J9q839x4rCXd//xV7fls3jMG4tRRnarJEK4SZk4ggr4WvCVpotYgxd2KL0DNC9gZseeyKEDsvTJiI/n+kD2LMOGYSPVIv3Fj0TSNNg9K7HpEzQNydO4/hGizs36I91hm9lcBRsqfdIfWa8emKD6DnUPd0XcyJc4FfjYP5MHl6/qiflx2gpNIeF/B+ovKq8L85WhFMYjyuRKDKqGCdgPI3P9ooDms+v1Od54OyEgtqZ5n7K8fN+Lw3wwao6YV+9VqAgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTOA312Mu0a3gMt/IzddjVv8a+YbDC1M4IugOsgTUbk=;
 b=yLiQAFAXbBNb/zIPHnyKmdbOtnUa8ZcPJJtbmaALkLCs7TQ4kfmjB7VkUUvtcHfqm1cRQNaOyM+XkB17cgskZrZgW/E6Ii2s+EVC2jRHRRelWBQa4w6+DZ2wgMTGvYiO7v7YcwMK8emhvz+YQNO+BtdKS1+dRjD0kJnToG8AWxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9cdd2386-7331-49f0-a67e-da4592d4c1a9@citrix.com>
Date: Fri, 11 Sep 2026 12:13:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] nestedsvm: Fix multi-byte IO port intercept check
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20260910163955.1005097-1-ross.lagerwall@citrix.com>
 <df8b4a30-4598-45b9-997c-fabdd42b8105@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <df8b4a30-4598-45b9-997c-fabdd42b8105@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0298.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SA1PR03MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4bbe9b-8fd5-4dec-bb58-08df0ff5c79b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|4143699003|10067099003|22082099003|18002099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	HOqUuGYXzZTJwNEwAfla8UwQ0OfAtbX2q7GwIY/WCv7ysLP9ZqdIrkwn4zRaii9jqW3ozuLh96A6e4iL3xJteec9YnsRLhMD73+8jB4AafNZKVZHaWOBW5548+67qSGvTbApmITA50cFhKbSOlDwknMiTx2LqyTxJ2+vDBVhMLiiehiT50QwTCo6DUuBCjUJDlxDQ2AfMy2TfF/3SlaM0CuNJiZHG8joTE/NhS+gNgZsRvVvgqL5Jl3avXtyJKlZ4/k/8pfzSj2e9OSTad1i8mlh78oTr0ko4sPJayAt3D1dzjXMDwKJyGtaP8tmKVMK8BHBQ6eO14Q4538n2UVAv9QR1yJBjgHGxMP2eAmwurhVzW1kUsQko55ZjlDN2fczDkuVMcBk01j2jVijmKf/EobRwFPz+WIWAaNQ+FwizOBqAjC+omG5N8fFyOS1A22NGesoS09USa0BBw2AwHEk8wzY2Bmbm2GFvK2Cn3Jdq2ylmDJYVwXZzxgKCvR+FBiBOP3w8Ue1uRNbwXFkGygtQKSXqDguRMJchZFzHs5zhJJhpNyGeJxN++M31dPrWfBomTMXXsvuCqt+xVqZohD7kgBItsUGCEgMjKycNW6BppNvD8iXe+gcmFfZHZdElIM2r6rvqi259HQm73ycHUrQWjTngTkYPzqb87K56bnMhRA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(4143699003)(10067099003)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Umo2RFpkTWFvZndCSVNtMFZzc1ZaMmdGWFlYV0VrdHpLS2RPais1bFFSRjI3?=
 =?utf-8?B?cmQ1STN5WGZwZTgvaFlrbXIwTXF6bStnU05VWXJLbWhSbVkvdjNPRmc1MGxl?=
 =?utf-8?B?YjdMVFRLZjFiemdaK0w3azZNMS9yc3BIMWZHdnFVMTBscHVBOFhZa2dScm9l?=
 =?utf-8?B?Qk9qTGRFdG12NTRqVytUQjVraHBkM0p0TjViN3k1NXFzc2tKMTBmOEtKT1hR?=
 =?utf-8?B?UVlJV3dLZlE4d1pCL1NCZXlkcC81NVpneTdRSmRKZWdBRkxYNDc3RzhhT0dk?=
 =?utf-8?B?NUpxTEsrT29BM3ZpdkJDOUxTS3Z3NUd5cURZelQzVFloZTB3RlIvQ29ML1lz?=
 =?utf-8?B?cGNCbmJrcFlHSi8wbUZSSDVOeGUyQi9uQlZGMFhBMmhPSHUwLytxWmhEcjVj?=
 =?utf-8?B?RklhU2tHWlh0R3czUDhhcWlhcjhMWGxuYmxQR2tDOGZ5WG1zQkVORldOQm1X?=
 =?utf-8?B?Y25IZVV5d0kxdGhvclBOWHNVQmlXdEdnV1lxcDlCVll5bStrd0dPL3l3cUNu?=
 =?utf-8?B?VVJnV2NDNlZpSUpZamxDWTNvV2xYbmNFamg2Sm1vYmdXbVNCdnRBQ1JtblpG?=
 =?utf-8?B?NWluUmh1b0R5QTRWVE9iQTFpK3dtM0RiV3ZiWm56c3ZNT1c4MnkybzlXN2w0?=
 =?utf-8?B?Wk5uRHl3WXZ0MkJlZTRLb3NpaERIMm5Nb21DelV2TlRWS0orR2ZWQmZDWXdv?=
 =?utf-8?B?U2o0Zm1qbUJVdGtsUVRBbUtPQjhVbnJiTXVpZEV4bGZxZHA0d1RESFFTYm9x?=
 =?utf-8?B?b2lPZS85U1ZUdEZxRlU1UDB5RURrRzNrR3ppV05BZ3JaYSs3eEduQWErM3dO?=
 =?utf-8?B?L1ZDN1lDNlByazR5NzRSWitvV2NjMGRkUjM3bEVyRFRIWFJXYm1WdVVlTlZP?=
 =?utf-8?B?UEMxR29pVlNCUHNKd3FDTVNEdk9FTmMzdlJyYmVaRjEwcmt5US9xNEFvaXlv?=
 =?utf-8?B?ZnlXZnpnOFZLS2xRSkdNSWpWNUhZWTJZM3gyejlpYjZvbDBJRnhJb1ZZSEJZ?=
 =?utf-8?B?NDB1SU4yTTIrMzVqQXNnYVdiYUxzZGN6SU5lZUdFcmd3UVJBK1R1SGQyUFF4?=
 =?utf-8?B?blk4Y25TcDJzOVQzMGlWZ2x2bnJWV0Z0WGxoV0VFcWErUjlUMzNQbXNPWjBL?=
 =?utf-8?B?M2Y4U09HWnNvbFNZTWpKUityZlBoblhuYWs1V3FlVU02VVl4MHh0R3pmM2JC?=
 =?utf-8?B?ODJiUmZDK2VaU050MFN4UWxJVHlXT00vY1kzY3lRbG9OTy9iRCs4WSsvcFlV?=
 =?utf-8?B?K0NJVXVMZmhFSUpSUy9ObVlpNVBGcFkxcXpvQ2hrSkN5WjVtVGhEdmZFMXBa?=
 =?utf-8?B?RVBoaHl5eWJVeVNRS09NSnFLU0Fmb0JKcGsxUHYzNzNYYWEwbndtUXUyUUFZ?=
 =?utf-8?B?dzBvNDIxNXNuRzZWMzVsNlEyNmNqUy9HVS9ENTNGaHhhWitjdGp2U2V5enQ2?=
 =?utf-8?B?QTRObWhmM3NIOXlsUHZtVXI2MS9mbEhIc3ZWd2RMY3pmRHBKRzRyREZOVjMx?=
 =?utf-8?B?YXhIVXlNMlA2bDFBUWsvQ0hRQTJHemVMZ0VUS0t6TDZHYTEyMHREbjdnVy81?=
 =?utf-8?B?NzM2U3lMdHhXRC9VZGxGQnhnWkY0MmM2ME5TQmhtTXU1Y1hUdmFmLzArVUd5?=
 =?utf-8?B?NkxTWUFSUjR1c2k5R3dXZWZFMTZ4K1hCLzAzZzlWMW5FUVUzdFh0TVUvR3JG?=
 =?utf-8?B?SjNEeGVmUVpNaWlnL21mdmNKWWpOYmlJdGR3OTFNMWozQWc3dE9ZU0N6NkpJ?=
 =?utf-8?B?dlJ4eGN4MXF6R1dwN2swMDQ4MEVuclVQU0dEaUV0UkxDcXluL1pFZ0hiV2Vl?=
 =?utf-8?B?a01tVjczTVJXK2MwUW44by9tcEIzaDVXR1ZKTEJqQ0pFU3JiamRkTFQ3RkM0?=
 =?utf-8?B?eFNZRHpzYlRmTzRORUhDUW9NRTN3S1FYdXlHaXlzbXo0K0wzd0g0Nk83Um9S?=
 =?utf-8?B?SlYyVTVQbVJzcDY2MTdRU3o2Sk5SdkFkUE42VENKVDYyY21NVkNRLzFQbU1J?=
 =?utf-8?B?OUhIQ2RkcFh4RkFGeHR3a3lVdSs5bkRwUTRhMXk4clRDdUdaWlNIWU5QUldM?=
 =?utf-8?B?R3RTelJrZytCSnlLTHp0NnFhTnNmREpBaUl1R0ViSkxXWVZFaDhET3F4QXJ0?=
 =?utf-8?B?cnZyQ3RTREJMSWxaaXY0U1daOUJiaGtULzE3cng0bG5zMEtHdGZWYjBXMTdq?=
 =?utf-8?B?eVRLaGQxYWdzSEh0OVF3WlJLem5SenFzZXhyZWFESWNuOFZHSnJJTEN3Q2p1?=
 =?utf-8?B?ZFBrc2JpbGJERGRGTmlJNmxMU3BGYXdGOUxHaHlJT0wwWitpZ0UxQytzbnkv?=
 =?utf-8?B?S1htV3FPZmFuTWplOHNGa1RmNllwWnRtMS9nV3ptalR0RzdUbjlRU1BwN0Jt?=
 =?utf-8?Q?NgiBoKEbBkGi6fRk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4bbe9b-8fd5-4dec-bb58-08df0ff5c79b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 11:14:00.1698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHUY1BPGMJUrIOiKwV9WaW8Zf0UJ+JXI4JQwgfUT6+ccAP+oiyq/1MhNuFQGQhXPq2AG6ffPQRsyTPkTbyVxexJR+8r+U+2shvrooYbMNOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6435
X-purgate-ID: tlsNG-bad1c0/1789125245-3BED6034-E9294ECB/0/0
X-purgate-type: clean
X-purgate-size: 2514

On 9/11/26 11:06 AM, Andrew Cooper wrote:
> On 10/09/2026 5:39 pm, Ross Lagerwall wrote:
>> For multi-byte IO port accesses, the APM says that SVM should intercept
>> if any of the corresponding permission bits are set. However, the code
>> has this backwards and only intercepts if all the permission bits are
>> set.
> 
> By any chance is this for the root partition, with 0xcf9 permitted but
> 0xcf8,a,b intercepted?

Yes, for the root partition. It intercepts 0xcf8,c,d,e,f and permits
0xcf9,a,b.

>>
>> This affects Hyper-V since it does not generally set all the permission
>> bits of the multi-byte ports it allows its root partition to access.
>> This results in an L2 root partition that cannot do PCI config space
>> accesses and therefore cannot access its NVMe disk to continue booting.
>>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> ---
>>   xen/arch/x86/hvm/svm/nestedsvm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
>> index 5adb1bd72c4d..249fde43b5be 100644
>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>> @@ -852,7 +852,7 @@ nsvm_vmcb_guest_intercepts_ioio(paddr_t iopm_pa, uint64_t exitinfo1)
>>       for ( io_bitmap = hvm_map_guest_frame_ro(gfn, 0); ; )
>>       {
>>           enabled = io_bitmap && test_bit(port, io_bitmap);
>> -        if ( !enabled || !--size )
>> +        if ( enabled || !--size )
>>               break;
>>           if ( unlikely(++port == 8 * PAGE_SIZE) )
>>           {
> 
> While this does fix a bug, I think the behaviour is still unsafe.
> 
> For starters, 'enabled' is a terrible name and is probably a major
> factor in getting this wrong.  It should be 'intercepted'.
> 
> hvm_map_guest_frame_ro() can return NULL for several reasons[1],
> including ballooned out frames/etc.  It is not by accident that a set
> bit means intercept; it's for the same reason that the byte sequence FF
> FF is #UD (with the PUSH that should have been in that position moving
> elsewhere in the opcode table), and that's because ~0 is the return
> value for "nothing here on the memory bus".
> 
> Either way, if io_bitmap is NULL, the port should be intercepted rather
> than access being permitted, so the other prior line needs to be of the
> form:
> 
>      intercepted = !io_bitmap || test_bit(port, io_bitmap);
> 

OK, I'll send an updated patch.

Ross

