Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81436C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 08:51:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375347.1622511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp00m-0008DE-TM; Wed, 29 Jul 2026 08:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375347.1622511; Wed, 29 Jul 2026 08:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp00m-0008D7-QD; Wed, 29 Jul 2026 08:51:36 +0000
Received: by outflank-mailman (input) for mailman id 1375347;
 Wed, 29 Jul 2026 08:51:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wp00l-0008D1-2Q
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 08:51:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp00k-00H7w9-Fd
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 10:51:34 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a69bf04-2eae-0a2a0a5409dd-0a2a450582de-40
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 10:51:34 +0200
Received: from [52.101.46.55]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a69bf13-4cb1-0a2a45050019-34652e37fd19-4
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 10:51:33 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA1PR03MB8264.namprd03.prod.outlook.com (2603:10b6:208:59f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 08:51:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0245.012; Wed, 29 Jul 2026
 08:51:29 +0000
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
 b=Kt+YNceUj52suXewhwO6Q9nNmNY2ZVIXDE4dyDi7QQjYph2/HaVcP2scCyXdG5zq2xUCFSPeRS1DnhEHeO05K0r9TndT2UEOwQ0VJ+Vpz1HMjJVFH5P6JVNcs4ZIJP8WFkkQ0bGRqlDeGKfqC2Tc/DsYIEDrpBEMliRDe06DEzoH60MRUJinRXh6kHU6hTG+I3UKzV2hGOEHzQ/oQSZl8o13uHfod1+kFLWmuoOdKkR8N4VHfb+LNgONz6I7eo2imYDignUgjhrsmzdHNLLU82J6Z4VX6p3W+FZoEUAMXZlLymG0ZLR+JLnJX/SwSBi244g+S0KPH4iqb1OO7UBfKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8NNKqFCm9LTvbsJ64hzoc1pOgWXBKCz2+iV28lJFSc=;
 b=jOCuSE6x59ZbwU3ExX69O3VT9O2SpmtAh+Oh51i3m+5Gl9ICrvRnXgMN1W416VxDj9xyy8q5uAl+Cw0TSkqKm1TayEA83KRzlUT4v79jzQeEcDoLv97oiu754IMRaus+6Dj8dOrF9W7WaSTf7TX5jX8Pjx78IGGGmUnPNkrCq9vW0vbuQ97Yn9hl4ESilmxs721S5ejaYXhZadkUerudp0eU17W+FpbH6juftThBXLvsI3LJL4P0m/aJDwo9FPv6pXHvhxQdnX6IMI0svOQYMeBva0v9w2c1xWabUY8560LpsPhxJmWTcKTg9cty+k1d3xwi3UNiwoAz5tBnMj+vwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8NNKqFCm9LTvbsJ64hzoc1pOgWXBKCz2+iV28lJFSc=;
 b=eK9kvj0TNrMDq0/05vJcr2A2adbO7bXlm5WaJ/DaR1avCZT4ezm4apMR41ya8kwX3cuKGkRqLy1TK7/dl/3ax75YtJf9vvK1A0t+Rv73g34HQlDrWXGbHMjk5cFnu0JyWsf7mRs2BJaiVY7WxGN36nawLsd3RnAPF4YUBEypX5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <13e30579-a3eb-49ef-98e8-e358d0df99ce@citrix.com>
Date: Wed, 29 Jul 2026 09:51:26 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] tools/ocaml: Fix crash in
 Xenctrl.domain_getinfo{,list} on ARM
To: Jan Beulich <jbeulich@suse.com>
References: <20260728154830.67734-1-andrew.cooper3@citrix.com>
 <20260728154830.67734-2-andrew.cooper3@citrix.com>
 <b050c051-c165-42a4-a76f-781c8d43248e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b050c051-c165-42a4-a76f-781c8d43248e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0055.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::12) To CH8PR03MB8276.namprd03.prod.outlook.com
 (2603:10b6:610:2c1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA1PR03MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: b25f7066-9f00-4c4c-f889-08deed4e94ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|6133799003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VDfYWgBJ/1Opzug6DARWScm9vYJKxIfL6wCU5DVnKi60KnIHlbIiy8eQpWWNz9ZJ+BFCdJmDx0RDqmv1F+CBCgpcv3jd+bDdVgYwaIucRyqE4+etJGUOcZ6uaqWQWSOrWQ/KFb5xs6vkM/S94OqnNyCZYjnglFrMOmXZJVRHxU3EvQiSh+zT64WuvBJRxbGuwZoA8uyHqC+L5b0c750WtNd5R5I584MeNpy7IQBplsSsdSiq7/8sCyaOpgjUobYuwZJ7TKBzSlJlUIUjYOFHpAtgoNuYrEAkYtpIEw9H3RynDqhl7t3Ne3AosfrZnJFqCd2iKaiPs06H+CkS1rH/WqoUKj+0eFqgCjtldMmWNPP0jKZ+xKhdPinLfxDOdTY3jRO2/txT1pjTcFCZmyvLgQ1RSWbssEzNowg8mDWwKWFZ7OUZXJiMLTvSwLPKOT2JAM4h9e+AOQVQARPWw3aySM8bILTM4Ebt+zIO6pFlqyBT/akEQpn8hXBKERsalNra8TCNkZzqNVj/cpqoVY7AFoebSdp9fUZhsr5XK2Qq9HGzSc/EK6moHGuWvxRyu76ULlPfp5DNlaz5SG6EEIAkF6PUR6fy1jBOu1CC0gj5TqIl4hdZIroS+hxaxIM/0vprRg7xXtqjZfv9MvNM3fAmSrsuhIn1QbdPbEGGST3zewk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODdWVlBxTWZLV3g5TzlLSEtjWUJJM0J5TDN0dEUwSXo3YzNtSmZ6bjhCL0RI?=
 =?utf-8?B?d3dLeDJxVVVFc0FnNlpjWUJpd203UHpObkVRSmtIZzNSWllPSHFCS09GM25s?=
 =?utf-8?B?WUNVcXZENEs1RHN2YnBSYWFoZDVuNUNRNjFtREZZUHhKZzhYeTJIdytNODZW?=
 =?utf-8?B?RmJxRHBmRW1URS9hVlMxczdGTzY5ZFJNZWgwK0R6TzM4SDBpTXliclhrclZ5?=
 =?utf-8?B?ZTh6RDBLdmZmbDNPZ0VlV2cxOTNWRDgzbThWTno2V2NHVnArcVFiSEhLVWhT?=
 =?utf-8?B?RlpSbFhDVkQ2U00yZlhVNTB3cWM0WnFVNk9pemgvbjJBa3RqSmo4ckZFUUl2?=
 =?utf-8?B?aWxnTCtRWk5XYjkyOGlacW1IRDRnZHo5NVUrVjdWbXVrQ1J1cjAvbHNjblBV?=
 =?utf-8?B?SlA5NXJRUTR2K2l1MDJLb0FKUDd6bStQYXF5RGNkZGFjTzY3dXB5NE4vcVFV?=
 =?utf-8?B?NkY1MmZoTWFrKzZDaTYvTWN4Wi82WnU1VlJtVWVJbHIrWXF0eHRvOFVWdmtS?=
 =?utf-8?B?L1dIb0JQeXZ1OEFzaGk0WGFPcGZCR3NRTitSYjVDQlNrbUx0TGgrVXpnWG9T?=
 =?utf-8?B?Q0hOM3F1Y1JoOGFqdzF3dlF6d2Jld1ZVSlNZemRTZDlpT2RmTG9Jdkl5dVc2?=
 =?utf-8?B?NWJLOWJtSE91MTF4Tlo1VnJZWSt3YkFpbmY2RnpvMlJUWG1KTE95VnNhdXNK?=
 =?utf-8?B?WExtZHRNR1lSK0I5RllEQkFiMkJzNVREZk1OYVVrak96dGhucTJNVE9panlQ?=
 =?utf-8?B?M2RsNDRNR0QvZ1hQSCt2WjJVOUNVYlpTcXA4eGErWW1JS2RxM2pscnhGeERD?=
 =?utf-8?B?bndxU2VTUXhOcDRTaXduVktQenBtNW1tRldEdXhldW1SbHIwcDZnM1hBd1F2?=
 =?utf-8?B?NUVCU0dtanVHN3BOMktZMVBqN25wUGl0Mm1jWEw4VnJydzlLOUdicmFmbDd4?=
 =?utf-8?B?Qy9wY3phb2RzUjA0RGdsNVRUbzNDNlhKZjhWTFpBc3JjU01YTHdDMHdIWitV?=
 =?utf-8?B?SFNmeXRNV0hPejdGMXNZRDdKNjZZYTlQbG9lRGFmY1o4VmYvQ0s3eVYrWlBF?=
 =?utf-8?B?enArbnNUT204NzB4bVpFbmo4akhkYk9DdmYySEZ4QjFSWkRSZ1crSnNCODhj?=
 =?utf-8?B?bVA3WHJhWUlaOWgzMk8vWGJOV0dKME5pOU9HYmIvT2FrSWUzdkNTWmlpR2JG?=
 =?utf-8?B?dm1jSnF6ajFQM0ZTR251MmhrU0xJVFQ5dnhRNkErbUtSZ1lxK2VKV2xYd3hD?=
 =?utf-8?B?MmF0a0EwUVR2bkwrWDIzbm5NWi9EZC9GVnIrL2s3Q1M1Rk1PMnEwSXEyaWdV?=
 =?utf-8?B?RkxVeHRFWFo0UDBMTU5aRVp1YVFEaFNlcU9pSlI1U29udW52d1lOUGMrNE9R?=
 =?utf-8?B?VU9XdkgrV3dXcFQzYTNnZ3lGYUVSNVRPTkdlOTN3L1h3YWVQWkVnbzBxeEY3?=
 =?utf-8?B?M2tnQk1BQ2p4bzNKSUtpMTAxeWwveEx0aGgyV0M5cUxqZG1PalNzL3M5bkg2?=
 =?utf-8?B?V1htQXArTDhIMlR0cWVjMGx0dFNTMEkyQkxPa1JyWGY5RWgyR3ovbHVUSkJQ?=
 =?utf-8?B?VUNIQnJmK0xJeU4vdm5KSHZhVnBpZStzSW5qaldzVlF2VEV6blB0MjN4dzAy?=
 =?utf-8?B?RmZZdTBaS1Z6bUU3ZFNLWFRVQTRLZCs1VHdhY2NjQWJDbGxWclluTnVINVB0?=
 =?utf-8?B?R3R5TklGSndNaEJaRE04QzlUQ2trdnN1emx4Um91NzJsS1lmL1JQTjhuNk1S?=
 =?utf-8?B?UjdqVlBpeFJZV1hnVkNQNk9wUUV0OHgyVDJSSnYrL1NJWnA2T2ticnZ6SWU4?=
 =?utf-8?B?blh3M2liUFVOSHIvT0dLTkE1K2hIRW9rdFE2dU83dlRYMGVNM2Rtd01JNHVD?=
 =?utf-8?B?Zkh1YVM5RGNaSS8vcFJQL21PbW5yNVZnamxrS3BPYllLWlhTTjFiQnlNVjV0?=
 =?utf-8?B?VmVBZDBWWFk4QkdVZ1k3VWlDQ0J0VGkrSXY5TEJtdnREQW1sWFRkUVdYdktZ?=
 =?utf-8?B?UjVIeG5NZDdERVRUL0dxQlgyY0U1cE5iT3ZueHJweWJvbFlTZnE1dWVybkdz?=
 =?utf-8?B?R2JDb2ttMXBYVStHNDkwN280cVE1MjlQM2ZhMUNmL2hJNjZJeS9NQlQrOE9S?=
 =?utf-8?B?TWFuc0JkY2VnZmJUTy9nT1lKVnlqajNzY0FzTmsyNmdsMW5uM0VoNW5sYXlP?=
 =?utf-8?B?OUhnWE5VRHIrdjhQNlJLMm5oUjQ3TU1HNHdKWUtuZnZvdWFQdXFKaHN0bitx?=
 =?utf-8?B?ZGJXdlQ4eFIweHBGanBlM2lWdWhxSmpwd2RNSHVjWVpiRkE2b0l2VlU0elFE?=
 =?utf-8?B?SEdQMkpsTHBJaEswdkNxYnkvelBLbVlWdGhOTnhLdlc0MndTTHQ3Q3krcWJl?=
 =?utf-8?Q?ySaNIF87CGQTUrJE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b25f7066-9f00-4c4c-f889-08deed4e94ee
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8276.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 08:51:29.6318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qy6JyeBK0uEeA487K3MEklCnlcP1/+CNLwJkRgLmDVweHlAAYAlJIm6Z6UhY08AfapszxrgsK9pWSqlkW8GK6NnKH9bAIyNkSY602oYFeT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8264
X-purgate-ID: tlsNG-c201ff/1785315093-71AAF2A1-C1DB55E6/0/0
X-purgate-type: clean
X-purgate-size: 1572

On 29/07/2026 7:03 am, Jan Beulich wrote:
> On 28.07.2026 17:48, Andrew Cooper wrote:
>> @@ -452,16 +456,17 @@ static value alloc_domaininfo(xc_domaininfo_t * info)
>>  		(info->arch_config.emulation_flags);
>>  
>>  	/* xen_x86_arch_domainconfig */
>> -	x86_arch_config = caml_alloc_tuple(1);
>> -	Store_field(x86_arch_config, 0, emul_list);
>> +	arch_config = caml_alloc_tuple(1);
>> +	Field(arch_config, 0) = emul_list;
>>  
>> -	/* arch_config: arch_domainconfig */
>> -	arch_config = caml_alloc_small(1, 1);
>> -
>> -	Store_field(arch_config, 0, x86_arch_config);
>> -
>> -	Store_field(result, 16, arch_config);
>>  #endif
>> +	if (tag < 0)
>> +		caml_failwith("Unimplemented architecutre in alloc_domaininfo()");
> As I now ended up looking here as well (to determine whether this series will
> want backporting): s/architecutre/architecture/ .

Fixed.  There was also a typo in the commit message.

> As to backporting: Both patches may want to have Fixes: tags?

Hmm, yes.

Technically, Fixes: 81838c9067ab ("ocaml: fix arm build") was the one
which caused the pointer not to be filled in, but it was a build fix for
Fixes: 9d683b5e375d ("tools/ocaml: Expose arch_config in domaininfo")
which was the main one intending to produce an arch_config

I guess I should go with both tags.

Patch 2 is interesting as well, because really it's both tags too.  In
my main first patch (if it had compiled), we would have ended up handing
an xen_x86_arch_domainconfig back when an ARM toolstack asked.

Fixed up locally.

~Andrew

