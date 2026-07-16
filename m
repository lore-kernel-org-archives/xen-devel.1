Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22F9C4450A
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 11:07:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363803.1615315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkJvy-0005tg-8V; Thu, 16 Jul 2026 11:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363803.1615315; Thu, 16 Jul 2026 11:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkJvy-0005tZ-4w; Thu, 16 Jul 2026 11:07:18 +0000
Received: by outflank-mailman (input) for mailman id 1363803;
 Thu, 16 Jul 2026 11:07:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wkJvx-0005tT-0x
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 11:07:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkJvw-005aTB-1i
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 13:07:16 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a58bb64-5cb7-0a2a0a5109dd-0a2a450bcc56-0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 13:07:16 +0200
Received: from [52.101.62.2]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a58bb62-b7e8-0a2a450b0019-34653e02e01a-4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 13:07:15 +0200
Received: from DS7PR03MB8265.namprd03.prod.outlook.com (2603:10b6:8:266::20)
 by DM4PR03MB6045.namprd03.prod.outlook.com (2603:10b6:5:390::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Thu, 16 Jul
 2026 11:07:12 +0000
Received: from DS7PR03MB8265.namprd03.prod.outlook.com
 ([fe80::419e:bddf:320e:a1d2]) by DS7PR03MB8265.namprd03.prod.outlook.com
 ([fe80::419e:bddf:320e:a1d2%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 11:07:12 +0000
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
 b=BmTi1YWm56Via3WE1DmW5ZK4lzEVrHl1eK3z/AwLKkkVgnWqC48ztulnvMBfdw3Ti6zzlLNhkQxuzqOtGV0PbAWpvpiM2D6QzZZy3ow6to35mozTRBnXz8gPdOsklumQQn6Maxt5/nJzEVs1ZYhKvsHn9/gHVrQZE2mZOWmNQnnbTRa0zdNWyXKW0KESau+Q3T4ONI9ItEQ4RfsXjicSKpTBwpS2lucSj6JiBWyNgntWpX9sSLw+3Pfv512Q/bb/AlF/iSMKbIFCqQoRDNse5SfhpX5axUVEUlcQ6eb2OJ6pX9+7VfMZxultz/tAEo5WoycaJEU1drPRBpcEFCl6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaGgMTSn0M0Cql6NeYFstPJXcNySDQu4lHADiUDRNyo=;
 b=JDsO6s5cL2C1/aeImmPsacxSKrEX8627L6v55sBEgHViqI14DNN3XXafb44HfI2H6faIPMt2QzUO6XsLvoBN3j859afcpP64UWUMM6Q74Q9Fv8xN4VoojK8Q9zeQPjG12AnFe0yqxTvs+uTJZxIogIbwfvMrLa5VRyPvsCvhEQA9q+Nen9dA/iR4m9A8KEVq9ILwssJt2JHQ0n5Qo84OVSAlcdvRUmXYiTUO0lwBcen4brEpR3n3SdDG3hBOlU15mtMpWO/NlqJcts0E5HlMKdGVEwfLqkg7YhhxTCFB5QMxQLxEC21mKiu6ETXZlpxbFyy4UbvhQeHcZMVuHDJ73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaGgMTSn0M0Cql6NeYFstPJXcNySDQu4lHADiUDRNyo=;
 b=nkL1aycFYdFbpvkwAX7kwtY0YJIGCNCsAv+Uz0D3cA7ZhnFmuNyqDQsbP9xScLLMUNs74pK57mIr/jCSN5ReuQrQuAWj1yRczdK28Ik2nFS2Sb6unhIoGsjfGIxg4VZimlUpI7+Ayk1h4Z6CVd0yFMjqrApVMe6RU7I/VlXNnKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8d0d92a4-2ea2-418a-b5ae-1a7bcc2f9a2e@citrix.com>
Date: Thu, 16 Jul 2026 12:07:09 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86emul: V{,P}{COMPRESS,EXPAND}* can (wrongly) trigger
 assertion
To: Jan Beulich <jbeulich@suse.com>
References: <43b0c3d2-49cb-4759-a111-8fe083c723b6@suse.com>
 <1f8c6f13-f774-4d99-97f2-79767392785b@citrix.com>
 <e307a7ec-5a72-4acf-9028-9a288332e82c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e307a7ec-5a72-4acf-9028-9a288332e82c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::7) To DS7PR03MB8265.namprd03.prod.outlook.com
 (2603:10b6:8:266::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB8265:EE_|DM4PR03MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: a6126228-cbc9-4a68-a1a2-08dee32a630e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|11063799006|56012099006|4143699003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	iDj+Mi7Pue8chHsRlA+ziLWFOg1Jju3grjYXS9I8utuStf6CvopaRW/175jCins7xidYv/z2SUGuwfO7OG8XwkVjVlC/4Xt1RgTlsQVOZeDoNpo6/NcuPbvYawc0XQeoVIdxoha6rOPaomeEzJBoRwjZgxesFZ3ufUK2278NV/WexRP3oNkZlYXuJq9yhQpHXd4rZvkMU0RAebI+PYC7le6SkIjRyo8TGIjYznddM6dN4H+58sdU+YtlrkzzL8NsptDBfdJNjuBqP/WqMf6AobmUTXIl5hTwfti+Io52+66wL9gOqeBd7ZkC8S/l9ZKAJ+S3Umjfnrii94mnZ9EVUYZVdhczOadvJXzBHRRU7m+xPAThPByY89gIKPLERF/0b2NF9Pc4iM95t1TgAaXMdVis/upRJ9BUArVUMcoG/QMJQ1IFqCunF8ww+4oNp1hkCpbSS/pA42iM8w0wjQXUDn9oqgnIOBrIWElRa4+1tGpwPgRa8FinMvos04SguHG6m7Rj2DN4Zk1nDZmaUyaeyMAu9IpK4pZfgKAT9ElSQKq+8HqXKiu/kGfOzE9My97uYevUTQT2I8+C5rhJDZHm2t2pzNxb4RAghr/llW1namvpM0hWbaOXMYB5FqGfktNrMuTOXo7ueaHaCHcol2PFNSPpBGMjXvu6BAw7fZPTk00=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB8265.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2JRYUVFMDg3Qjlpa1JYb1hLRDhyR1RjaXl2SE1TMVJXc0F2UytyNDBnNUM2?=
 =?utf-8?B?aHdQRWNLbVEvN1FwcExLWjA4RnpieW1MSmJ0YnVnbVhaVjAwZW5kbnAxRnBa?=
 =?utf-8?B?WkNWWmhFWHpueFVHaWFnQkhqUURETHFub1JrUlVHaWFUQk5tYmNNd3JIUUlU?=
 =?utf-8?B?QkZOZVdyRDEvdXJGbmRORWRDKysxL1hDdStkSzVmMDMyOWVSdExoRjVKbGgz?=
 =?utf-8?B?UmxUR3JVZkZXRnhtc09FYjJGVkdwS20zNlh3NTlxV21CbnJjbFlQdEhiQUR2?=
 =?utf-8?B?SWtzV2JvdVhuZVl5cEt0UmYxamxaVWRaNXdXQjdIRjVTYlN4UkgwVkE3ZVdi?=
 =?utf-8?B?VDNNemJ4WlRBQzk0VjU1L1lEOUNlQXVwNkpjUE5ONThIeTgzZ1FUb1orSHg2?=
 =?utf-8?B?dm5nR2NzNW0xM1RGZW9aOEZrZW0rT3N4STZabkZLZk1NZlpkV0N2WGFDRHVP?=
 =?utf-8?B?MDE5d0pyMW9mYVRJNGRaMlRvYUhzOGFYbHN1L3p2dkdmVUtFZGtDcFhwYUJn?=
 =?utf-8?B?Zi9RcmdQbEV6Nnh5UVV6OFJzdVRzS2wzM1hseEdOQ1pnRXVlSTZyRGtPZ3hT?=
 =?utf-8?B?TUZoNkF2dlpFcFZWR3pUbjFRMmFxYUQ3U2xkZmZBaTJVSVRrOEI3RFJCeVcr?=
 =?utf-8?B?OEZvMWVXcE05MVU2VnFHbFgvVk1ZU2ZKeWZ3aDVCWnNKUHdBQ3ZidFlPaTlX?=
 =?utf-8?B?TGRKNkxHUWVyckppWnJDT2IzU3U1SC9vbHRiNEtOZCsvWUc3dTA3dkxVYXU0?=
 =?utf-8?B?V3Qvc0hSNk1zeEZSQkk3VEs4REpRbFZPOHo5WEczNUZTQ3FyR3Vqc01qelRG?=
 =?utf-8?B?TmpOaG1pRGJxUG0vcm13NnVjcjllNHBWSlY0ZHRuU2tyVDA5a0ExclRUSDg2?=
 =?utf-8?B?aU1Ba1F6TkZkRlVFL1BRZ2h1dzF5UWoyTjBwV055VmRISzFlWkVieG5lalR6?=
 =?utf-8?B?WmJDK1lLY2RaOTluamo3cGhzSE0rQlJKZnlPVW9reitiaEhkUFdHRXNWQmR6?=
 =?utf-8?B?eDRNaG1URGVPM2NTSnkyMks4TjhSS1g1VkNnZHk0QUlrdUFWMEZhT0lwTjVH?=
 =?utf-8?B?Z2JWaEV6MzhSVkpJYktqSTVoMmc1bjNSSVFGS09sTUNDY0pHcTNaQTJsV0FQ?=
 =?utf-8?B?QTBxc29VTXRFMVJYS0tpRzFNTHpIK1YyZ0ZJNzVtMy9XeEdWd2VnUFluckdI?=
 =?utf-8?B?S2wyS3FlaHFWUkF0Ri9MRHkwQXZQQXc3VVp2bFc0RzNSSGhVQ0g0Qzd2K1Z1?=
 =?utf-8?B?VWdTRGNTdDZ6YTRObjcwRUlSeUU5RXhITzRIQkNVR3VGbURWVmIzc1pvTGNl?=
 =?utf-8?B?a1BXa2c5MTAzNFdlZHZCNlViaWNQL2FNUkp0bFBXeXZGTUs4c0VhZmYvVjA4?=
 =?utf-8?B?aDNpZEVXOU44WEc0cDNHeVVqeUx3LzRFb1FoY2puZ2ZuM3lpR2M5YVFOUE53?=
 =?utf-8?B?d25CQndGSkpUdWI2Y1lHZkwyT25pUHdhS0xNWnk1UE9KaG5pZk0yVUQwTnFE?=
 =?utf-8?B?WnFaWVh6UjUvVXpsZU9JSGJlMkhCQ2tRTGVaQTNTQkh1YjVMODV5cnEvTjQ3?=
 =?utf-8?B?UVNEWlNPbER1bmRoeGwzVmp6Ui9WQ2IrZmd2K1E0YVdZcklhK01uQ29maldw?=
 =?utf-8?B?VmdVeFQ1bjB4a0k1TzAraGJPRDY3cVg1YXNpQWtoR1J2QmpQUzIvMkQ4YVI3?=
 =?utf-8?B?N0pmd3J6NlNHbldUTDdhbHhHeXhzTVVnM2RzZWQycURwUGZHTlpmUXMyQ045?=
 =?utf-8?B?aU93TUhtZ3pWWHRMNkJTYjBWWm5YblhPMVJ4QVAzcmdmbkYxVjZrUkllWmNH?=
 =?utf-8?B?YTh6SzlRZnpUT1Z0WjROSStmRzMvOVB0WElaTHFSWWhndVdJM05SM2psZmlL?=
 =?utf-8?B?a21oZ0ZsbEdDS2IwTldYSUN0ZmdBVXNjei81UlRXYStWNnVkMjcvZlc1VkJD?=
 =?utf-8?B?K290YnNWYWF2S29uWXFBbXQzTUttUDBlOWl3SXpHb3kyNG1RQ3dQWndjdS9T?=
 =?utf-8?B?Y2FjeHBiS1k5SFRhT2pjeXlMclE4TnFuUWRMa2tMaVlOMnVCVmwzL1pUNUh3?=
 =?utf-8?B?U3QvZU9QaW05WjNvaVdIamlMMVQ2Mm1lNEVSWUJMbXNOL3VTZFBnVFk4ejZR?=
 =?utf-8?B?Qm5XcUtkNjVFek9GRjlSVnlVdWxnSndEakNtdUVvd3FKbkJ4M1BhU3pJUEda?=
 =?utf-8?B?TnY0dDc2WWVWUlN0L3IxZXRuQWFVSHBHY0RNR1hpeDJxQ0lzUllyMGRPdWxH?=
 =?utf-8?B?VG55RkhnRkM4eEtCRUEzVGFralNFWlJvQ1FrcnlJc083OE4xdm9rY2tVNXhr?=
 =?utf-8?B?S3YrdERaZDV5V0duT2VCSi9EbFhNM3VIVm1HajNmK0NHQ1hoV3lqL1A5bEZK?=
 =?utf-8?Q?i55aJrigUfJ9McDY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6126228-cbc9-4a68-a1a2-08dee32a630e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB8265.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 11:07:12.4843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MChy8B4T2hlyLHEagkf5ZOBYMAuJsuBhxhAqOtymyaNGZKVbpzGUwZOax4ko7wzRuKcip91/T+/Qg2DYyfkrNA2BewqI0fKnpSan3k4FrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6045
X-purgate-ID: tlsNG-42698a/1784200035-1BAD09EA-25BF6D55/0/0
X-purgate-type: clean
X-purgate-size: 1819

On 16/07/2026 11:50 am, Jan Beulich wrote:
> On 16.07.2026 12:44, Andrew Cooper wrote:
>> On 16/07/2026 11:43 am, Jan Beulich wrote:
>>> AFL has pointed out that the op_bytes-is-not-0 assertion in common SIMD
>>> handling can trigger for these insns. Indeed when the (relevant part of)
>>> the controlling mask register is 0, no memory is accessed at all. Leave
>>> op_bytes unaltered in this case, to engage the short-circuiting in common
>>> SIMD handling when fault_suppression is true and op_bytes is 0.
>>>
>>> While there also correct a related typo in the test harness.
>>>
>>> Fixes: 65f82d4ce1ea ("x86emul: support AVX512{F,_VBMI2} compress/expand insns")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Thanks.
>
>> Is this local AFL testing?  I'm slightly surprised that OSS-Fuzz hasn't
>> found this.
> Yes, I'm trying to remember to run the fuzzer every once in a while. Earlier
> runs of mine didn't spot the issue either. (I'm presently re-running things,
> to have a limited level of certainty that the issues it found are all sorted
> now. The other issues it found were in patches I continue to have pending.)

When I was doing AFL testing a while back, there was an ancillary
project which would take the fuzzing corpus (as it was being generated),
run it with a GCOV-enabled binary and produce an aggregate LCOV report
in real-time.

I did once get to 100% coverage, but it took AFL an awful long time to
find the final basic block, which was somewhere in the signed divide
path if memory serves.

If we want to get fancy, instead of using a single byte input as the
seed corpus, we could write out several which tickle the rarest paths. 
That ought to shorten the total time substantially.

~Andrew

