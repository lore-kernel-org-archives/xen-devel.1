Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D01AC44512
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 15:22:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364249.1615558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkNuq-0002H4-RY; Thu, 16 Jul 2026 15:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364249.1615558; Thu, 16 Jul 2026 15:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkNuq-0002Gx-OG; Thu, 16 Jul 2026 15:22:24 +0000
Received: by outflank-mailman (input) for mailman id 1364249;
 Thu, 16 Jul 2026 15:22:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wkNup-0002Gr-9r
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 15:22:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkNuo-0019l4-AJ
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 17:22:22 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6a58f713-bab6-0a2a0a5309dd-0a2a4502e3f0-30
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 17:22:22 +0200
Received: from [52.101.69.133]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6a58f72d-6ca4-0a2a45020019-346545851f77-4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 17:22:22 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by VI2PR03MB10955.eurprd03.prod.outlook.com (2603:10a6:800:291::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 15:22:19 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%6]) with mapi id 15.21.0202.018; Thu, 16 Jul 2026
 15:22:19 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoH5mkNoKwbIxzczOqeVJgQQA+/CaRqjL07sD5SwBRopMwLq2W38A8sOJJ3om9rir7aWSsVvlUUaFX4xcdZGSjbkZGhw+mXml5asMj7t4U3SvsVKUvvxcmPcKGrSL0e0X54p3y3pMsQtWM/rE9YkU6rXG935HnkuIGPWV73aANrlM606XfnuQy/tbG4f1beMyWL7fuGunA3YZ4/Mky8S1ul16cstR10dg8VNbkRPUoBEsrKird9iVcfZCA0/j0eXaUQ/WfgLXKsBotM6pBSBAUHwKD5+M9zdUnhGVTyF2OFvIUuG1Zd3gXeStf+sMyFPqACdLurNvB2/ZXskao45bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyYrBfb3SHk20RsDa8d083u4H7+tvMOO6ZkZe1goqwg=;
 b=MuNmgx7Lut/bnFJdQQseyQYHZ8yxBg4tBVGAgOkoNvWReaYqOpU/m8wMnaLgCjFhSfUyeLO2awOh+whh3jCJGNytiVIqniBhZPLxh7IuwAReJTHfJNW5P+QgTFx2c6iAWT+SZAs1odEOWb33zAdrRTnMpVmIflq7u2DaB9C3aFF4djAKb6Nx2DgU6Ns9n9kDOmGws6KI60kaXIPSomKpv51x7Ph1seE8FscExR2Rb5hUrku7Pp/CilyJB6F3Rc7iwAbuPvhVZU9PEgB4ywd+tC/2DAgy+7KRoZCkQ/YMoVA+pMythWG5rukP19HDiH6A7LuObvKtES44WO/U/dC+BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyYrBfb3SHk20RsDa8d083u4H7+tvMOO6ZkZe1goqwg=;
 b=YNKcSaW6DsvbASLY8d+tUTemeolOhTLn3UM1bw9+Trfkmq5RdhCkCuzq6ioySazezrxRzTkx6lKvmZ9/Pj2DtUj7h1k0i3E92HK5AoZUXqciMDT/JLDLmM8EXxWpjP+WBOfeunnAweQhBPWT/DARaGxi18JdNYE/yo68SM7yTywkioyBtRQqCJTIqcalQ8qCuEnqbJs4RGHNQxXvZMlkv7oDqZUrNv80yoFvLAcs0TJ7sWM4r6dBJq7cHcWy+GbCXKyTrQtfFg/1qW4TGzLMDmESvjpjCL6GX0qygcVnZiEuKW29JfkcO+MLE84AIl4pxxAVr9DDT+yS/hZovg1KrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <4c875ff4-6336-4a9d-b6b4-f4e75deec059@epam.com>
Date: Thu, 16 Jul 2026 18:22:17 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: rt: fix NULL cpupool dereference in
 move_repl_timer()
To: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
References: <38cc09ca49bb020d4b13ead36e4c9f04da2d00e5.1784211528.git.oleksii_moisieiev@epam.com>
 <551a4c50-3fd7-4aa2-b39a-a3820771ef36@suse.com>
Content-Language: en-US
From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
In-Reply-To: <551a4c50-3fd7-4aa2-b39a-a3820771ef36@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0027.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34e::12) To DU5PR03MB10263.eurprd03.prod.outlook.com
 (2603:10a6:10:519::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU5PR03MB10263:EE_|VI2PR03MB10955:EE_
X-MS-Office365-Filtering-Correlation-Id: d074479e-245b-4581-2549-08dee34e06e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|4143699003|10067099003|56012099006|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	FzvB7Rb91y43+JhJY9orZk8AZWDF/PBLz6ALA2AA57m1o6kZC8NqEF7sCGtgSE+brnJpZRJ3U5StSd5XoenaZk23F2EqA9MM1L+An8H22tLMqVWgu/QqHLagvqrTtwHDIzbWdcwwDq/1QBCaCE+XDkEXn7w5B0TLypro+A/Co2PP0OSbvKM5zu3cXM6JcQCzE4Urm5qXFGIUnkwDJ9lwdG5cSENvjjizXUntTJE334wKm+/wdPF8RQLoYK3ytFwHgF7jTn2BVuO1reFeLDRw0ILW9LJRDsVJEhY1Q0cy1emyYeqsYc+8XEnamDyv0vjsfvNYluFTxLRKWj+jZ7wbjpgNyroOtpABXNHUVbsael2XCUe3ywW2vOZUYYZV9l+dRrEtlu3QcjLOEylbeZfyCZXAUNlfkPle5My3BPZ1NuW+1zjcmUT5m17ZRYmMS/09KWBu6MuXOApOD9Fk9GQqihFGQWaMtqAQjB/Dbu4qzwfJNuVDqTWp1I+TLWkHSy1IQP9mgxvQ374PfFqyE5/bwtYgOvu3ZW8/p0z6a2hkc7SaT5gcFG3uS7HGDYjVkyBdBP52T1Z6VLXBdUfzQUWTJbyDcHWHZIEcyfTI/082mSsyW4fw57XRNstOxh6hWYAqWGK4jsOtRf/BQCnVZmNvfKnk06UV/09QQ2kO1TGZGs8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(10067099003)(56012099006)(22082099003)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWF1L0RpNk1rK3IzQmw5R2tsNEljZ2dnbjNZbnJqdWQ5SFFJY0NXd05vbTMw?=
 =?utf-8?B?NkplQUdLam9WZ2FzNk4vbktFTVJZYnpIWWt4TkF1MjYzcFFQMFRJM2hmUVYw?=
 =?utf-8?B?a2NjbmVzZC9ubHFjd0NwWUJlYWc0OGtqOE9qUWVXWEVKS04wT1lnMnIrakZB?=
 =?utf-8?B?Y0d0ZzhONFNFNWg4c3NYV1FzTkdKNU1leGRRdlE1NWhLQXNrSHRrU3JacFBM?=
 =?utf-8?B?Sk4xRzlwRU8ycjNGM0F6Y0NvWEZEK3Mxb3lHOVpEU3RuRlljcDQ3RThxL1Zh?=
 =?utf-8?B?dXpST2l1dlZQaFgzeTBOZkYvUEZPSENMWU5wUm0wblRtY3BFNnYwMUh3NU5j?=
 =?utf-8?B?SXZjY2JBQmQyMGhtS2djNFpDK2h3ZjFpZlZGbGM3TXhKbUR5a2VGRVFMT041?=
 =?utf-8?B?V3RzbXArcWZQMnRsSElzNTFZU1dINkk3OHBlUDdoL2xmZ25jOW1wUmdjZjlx?=
 =?utf-8?B?eEJ3UUR2VjQreHpiajEyMEx6YTYyK1JkT0VjMjlWd2QxTTVzS0dySTVOS2sw?=
 =?utf-8?B?QitvWGFFWFd6cnk4QVdiZmUwNXFKSGlKSXU4TzJxbGRySTh2TnI0MHQvS01k?=
 =?utf-8?B?VXFuNDZuZkJnZWlXLys0bTVHUXB2MmlxOHN3ZlU1S3dJOGZzNEV2dVcyc3hI?=
 =?utf-8?B?UUJWRFdFYWxxaSs4VUhXSGxPN2hFTEZPSk5YTVJLR2xycHlaZ3cvYmUxL2pB?=
 =?utf-8?B?RVhyTWJaSy96TVljcnJVMUM3WmJLS01Qc1loS2tDT255OURjVE1NUnB0eDNS?=
 =?utf-8?B?RlUxT3UrWE5rb0FqRjREU2NqUENwZmxTUGxqOG45bVMrWlFURTF0SWh1c2xo?=
 =?utf-8?B?YUtrM3ZDb1JNaEVkbmZsamdlNjVTMFdJaUpSZHdvQkxmRndwUkFTTWxUbVJr?=
 =?utf-8?B?cjl6dFhZWkprdnRXV2Z0cm5ONWVQQ0k1Rm13aDVzdkxiRVlka0hEeE1DcnIw?=
 =?utf-8?B?UmVmQjBmUk4vcnNtR2d5dkF2d3NrcnoyUHJwRk1peVk3RE1uakdYVnltY0Jo?=
 =?utf-8?B?a1o1UnJxV294LzN6OXRtVEdIeDRrWjdPeVc4eEdpbkQ5OTJzTmdSY21vQWc3?=
 =?utf-8?B?d1JOdHJzYVU4Q0htQXVmaGJlTk1oUFZBNnphakpZLzFLYWYxRkIyV1FweWlM?=
 =?utf-8?B?R1hlcTQ1SG1WelNRZFltS1cxY0htMURtOWZrWjJwODFyT1lwelpNQkxXaGdi?=
 =?utf-8?B?UE44YVcvWjZJTE93M2VtUkRTU3AxQ0hhQVFET1hUbGxMdWtBRjVOQjRtWmQr?=
 =?utf-8?B?NDdvTkRJc2kycUhSdnFLZ2xWem1DZDNCTGlnWXJaaDVlYVI1MW1sTzg1d29U?=
 =?utf-8?B?SDN0bVU4YVhUb3BLbmp4NXFaYnlEVXNDYlp2b05RRFB2RlZHdHEyWk5rN3ht?=
 =?utf-8?B?Sk55US84N3YyUFd5c2VjSlo5YmlyUGxWU0kxUkE3cFJEaXpZa0VHd2JUckZa?=
 =?utf-8?B?RzJFOGdRUzVvcTZ1cHRJZ0FOVU5nTk8zbVFvMUxTemVtdkNvZndvb2lYUWdV?=
 =?utf-8?B?bVI2SWdjL0lzMTREN3lXVWJRSCtCelFyTW5NbVlQTExFVmVTUVZad0pHa3VG?=
 =?utf-8?B?cXVKam5xdVR0UjAzNDI5M2o0UGQ3ZzhaWmZzUW0rSTlDRWUwdEVDYm5haGc2?=
 =?utf-8?B?MUo3bHJDUkhJai9CcEJMaWpPU0FFYzd2K001RERiMnJPVyttZ3NueVduaExz?=
 =?utf-8?B?ZGFqNUJSV0xGTVlySnA4SWgrL1o4OGY1dVA0M0ZOb0I4NTNvam1nY0ttRUd6?=
 =?utf-8?B?V1JQRmZDeTFPZTNyOGNiaTlCOEFzNHhJaGV2N1RCTnFYN0JDN29FOEN1dlMv?=
 =?utf-8?B?T280c0xZWVR0TmVFdGIyUGZVSC9veThTTHVuaEhZaWRTUFd4SmE5UENPMGNs?=
 =?utf-8?B?c2N1VUZiYWtvRmVRTGEvaUxkZVdIdWZuVzZhbHhsemJPd3o3VjN2S1U2dlBI?=
 =?utf-8?B?U2VDeEVZd1UzRDdwRnpMQUFzQS90SURlVEpZTGs2SUwxWis4b3FkTWlvV3Zi?=
 =?utf-8?B?a1NBTUpDeVhzMjNFcHVDMCtIMXRjekN1ZWowelU5UEl4SC9ueU9qOFlVR2wz?=
 =?utf-8?B?WU1NQlBmV2duTjZsL0FKV2hKSmVxV0k1WmVJdy8wYzYxZldxWmpIcWtMODIx?=
 =?utf-8?B?Z01JL0xQNWJSY29WeGNaMC9OWHZCTElhemRrVlJsQ1g2ZVRHK0FEUHN0bFB2?=
 =?utf-8?B?ZGFic0pHb1RhMHZRdXUxbkZHUk9vanFmdGhCUlVUSmp2bW56cFRzeEdFSzRX?=
 =?utf-8?B?VXZWcG9VeXdSOEpzeVVRTTRwUlNxT1VacVNsMWI5SUM0ZDlZd01BaWdXTitI?=
 =?utf-8?B?UGQ3NjZ2TFd1MGlwMGw0Rjk1d1phRUVFdGl4TXIrYjdtcUx6WFdMbDQ1bkU4?=
 =?utf-8?Q?XPsBvURTdHpbrH3Q=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d074479e-245b-4581-2549-08dee34e06e7
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:22:19.6992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iexsclOnFjohFE4HPEBmPrnEdY9nsZuYNP9IgQwl4YfE8hvYaEoMsUJJ7gwHVl3iBuD6EIeQEiWIQr6ciylKHl0GsoMgSsN//6eXm1+VHtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10955
X-purgate-ID: tlsNG-720697/1784215342-303C42AC-4A1824B8/0/0
X-purgate-type: clean
X-purgate-size: 2206

Hi Juergen,

Thanks for quick response.

On 16/07/2026 17:44, Juergen Gross wrote:
> On 16.07.26 16:20, Oleksii Moisieiev wrote:
>> schedule_cpu_rm() clears the cpupool pointer of the scheduling
>> resource before calling sched_deinit_pdata():
>>
>>      sr->cpupool = NULL;
>>      ...
>>      sched_deinit_pdata(data->old_ops, data->ppriv_old, cpu);
>>
>> For RTDS, rt_deinit_pdata() calls move_repl_timer() when the
>> replenishment timer lives on the cpu being removed, and
>> move_repl_timer() dereferences get_sched_res(old_cpu)->cpupool
>> without checking it for NULL. Removing the last pCPU from an RTDS
>> cpupool therefore dereferences NULL + 0x10 (the res_valid member)
>> and panics:
>>
>>      (XEN) Data Abort Trap. Syndrome=0x1c28005
>>      (XEN) Walking Hypervisor VA 0x10 on CPU0 via TTBR ...
>>      (XEN) Xen call trace:
>>      (XEN)    [<...>] find_next_bit+0x74/0xa8 (PC)
>>      (XEN)    [<...>] rt.c#move_repl_timer+0xb8/0xec (LR)
>>      (XEN)
>>      (XEN) Panic on CPU 0:
>>      (XEN) CPU0: Unexpected Trap: Data Abort
>>
>> Reproducer, on any host with at least 2 pCPUs and RTDS compiled in
>> (observed on arm64, but the path is common code):
>>
>>      xl cpupool-create name="test" sched="rtds"
>>      xl cpupool-cpu-remove Pool-0 1
>>      xl cpupool-cpu-add test 1
>>      xl cpupool-cpu-remove test 1
>>
>> The last command moves the RTDS replenishment timer to cpu1 (first
>> and only cpu of the pool) and then removes cpu1, hitting the NULL
>> dereference in the sched_deinit_pdata() callback.
>>
>> Treat a NULL cpupool like a cpupool with no remaining scheduling
>> resources and kill the timer, which is the intent of the existing
>> comment in move_repl_timer().
>
> Hmm, is this correct?
>
> What if there are 2 cpus in the cpupool and you are just removing the
> one owning the timer? This would kill the timer instead of moving it
> to the other cpu of the cpupool.
>
> I guess the correct fix would be to add a cpupool pointer to struct
> rt_private and use that in move_repl_timer().
>
Makes sense... I'll rethink. Thanks
>
> Juergen

