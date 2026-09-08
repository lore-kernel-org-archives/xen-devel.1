Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610CBC79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 10:08:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411261.1641955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3skl-0004Xz-Ey; Tue, 08 Sep 2026 10:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411261.1641955; Tue, 08 Sep 2026 10:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3skl-0004Xs-CG; Tue, 08 Sep 2026 10:08:35 +0000
Received: by outflank-mailman (input) for mailman id 1411261;
 Tue, 08 Sep 2026 10:08:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x3skk-0004Xm-PL
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 10:08:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3skk-00GezZ-66
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 12:08:34 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9fde9d-8faa-0a2a0a5109dd-0a2a450ab962-8
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 12:08:34 +0200
Received: from [52.101.48.34]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9fdea0-f2d2-0a2a450a0019-346530225001-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 12:08:33 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PHXPR03MB989210.namprd03.prod.outlook.com (2603:10b6:510:3cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 10:08:30 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 10:08:30 +0000
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
 b=egYX3NaCAZeEyLzozSklJrg//ag//BvnIblln+NTwCdl3ipFlwy+JRspNhgRzd3/y15M7lN9uaRKq1ZSDRJLOH2I5+g0nXamZmHPrDJhkLRAjXOFZa0bt1qWQ6tkVqtg4Gcp7G/zQK1QTSAV8osgHhA2VlSp8soUom4xooLASU0JhqkBxOZB/D2RDHILvBo3Dsr0gQ7E66LaReyETPjRk3LdICmIgNK6Kl582w+uB5f/BuMrA1fFg/4UX9GaIitcPb2ZHyMvFqLbyb8pAmr4h2ItkOR34x1sFyWUvdE0FDLnBgc1zZIbEyWjbE0MkwzrcXOBrhAywQSCVQyMPY5zdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSe9AtPtUzmjRahO69RkSadqwMTlHahpcjJPsoV9Ydo=;
 b=XlRyRzPUFyHxdVTg6sxSmiKWnCMBPYjynOhK0UfFLcKNPbUCe5S65iT0GMgeJsIlupcJtaGrGix0LpLrnMoQNI59j3/B7hh3451SruV6BpADdpMfC0PnvIN8CngVyeE5Ab4IZ5Sz3d0HM6w2iXygeuCn/LSHElITns4UZzkyvZuViliPHzkRJO1LYqw3J8+qusP7WSM9KwKTBJutkDXoAP5eOL87+kZf+3mGVJ23WNG1FKkJhnc6bA6HxvfiNtPz+8eAjd5XpsaQkdoktdZ85lMW/D3CJkzyd7+9XWQOpM8eizNAubyAXHwWWVhIOWESZcSbqEua0iCP0rojdRscYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSe9AtPtUzmjRahO69RkSadqwMTlHahpcjJPsoV9Ydo=;
 b=CksvXvxhab9U4JbykfOUrtCcbLOZdQ/5tE0zMsXnKVWD9ybEiMXEZXhkcIdTMpcRB4ArewzD11+EC7nRPCnaU2sWLWnp/JJjCmyknZOdV+RAQ9/VBtyT/vIu1AV+9vnWZgM/TTHGibuX4U0C13w8jgHfkqevWOGHYKaHkvvVKUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6a54806f-061b-4b76-b42d-6fa5b54581e4@citrix.com>
Date: Tue, 8 Sep 2026 11:08:26 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] x86/ucode: Work around Granite Rapids erraturm GNR98
To: Jan Beulich <jbeulich@suse.com>
References: <20260907213231.3159241-1-andrew.cooper3@citrix.com>
 <a11ec239-460b-4509-beee-4f65063ef336@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a11ec239-460b-4509-beee-4f65063ef336@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PHXPR03MB989210:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d978744-5e89-4886-7e98-08df0d9121d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|22082099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ViPPxCsPGTS4xoBIegROXCLuZXxvETeMmKou1PZMOOZcpasK6CeBz9nCGJpx8SxN06acbrn0ggzkaih1IkgK2+H82tSG5echF84u2BIRuOWfoMVwJLsFiaeNzgLFwbsFP4Ff1kX9Hjv81JwpD9eVnz6WAb+A/Y8LY6rXLJE082HEBgHQMSSgBiFMviiQ3+PD0Ap+VBlhFgl33xqPECkOrbsizZKNa6ty2GmT957urkEawOutb0iU+cHlmbRAiWaXgRjv4ZHkJ84sRhEIWnnGGJRTNt8yeqneZLEJJF3ciih7RRzp0mSFNTOG7GHKssLUoYDCOQyyhtV8P8YxElqx+5XijpQQjYoSn1vfnhKFG6vaBKkdAY51oYs00teTGWLXNMAQKHbJVF5J1ZnP7VAJTxLWGXOKIWr6zQeLYcaG8jYc1qSUL6loztuY9vHeAy8tnvbHla7ODcfkN1PriIwg7as6+7ybsKhACmUboPHU9x/9VDzrR0e+alnUKylt+k/8EJd43V5SgueD6Xy9Ku572Vjvi/eroj7Hm9zt/ROunmcLsyA0hZ7Et+t0vyfFzMOyCRcNGrxsQ1L8XGAMp1DB9aWC78IbRJJyIQZ3Mec8q+MlklSYZgrrsUtjx7KmAcgqgkisXMLYB+65KzaObgBITtFbX3j9IAWkMEJsYXfg5Lo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjNMemVhL2Vpam5JSjhsWFArWE5NSEtLTmJzM3ZhY0FFM0VabEVMZDJydE8r?=
 =?utf-8?B?MmpEKzdhQlBEQVkrUGJvRDJWbjk5TWh4Q1lyV3c1TkFOYlNBdzJQczQ1L0FJ?=
 =?utf-8?B?SDV6ZGk2dlQ2RDhXaDJiakFnb2EzcGtCNDFMMjM0RzI2aUpFZWhkN2VzNXdz?=
 =?utf-8?B?WVVtNnBYc3JvODNvSVh2U2RoVVRVczhzT0J3aTB5ZVRJY2ZYVTM4ZXUyYVlz?=
 =?utf-8?B?aVRySzdzZmlRQWRkL05FajRnWDRyVHhMYVpyMHdLZlJoU0RLNUhkSyt1dTl6?=
 =?utf-8?B?dXhEYVM1WUFQcWdoZzVkRm4xRS9TTW9FQXFEUGdwU1J1WGxvVCt2WU4vZDFz?=
 =?utf-8?B?QjZVNjNrMnlQajFDcElkeHh5WHVxOEZFQ1FndFhGYWV4S1BZR0xoT2kyd2hM?=
 =?utf-8?B?d1kzRm5lYmFrVkx3RkVmeFZiTHhQK0NxcDcrTHo4OFg5NVNYQkJDVnJsRXB2?=
 =?utf-8?B?alFLK3NhUVNOVE8yZmVJQTh1SmVHWTZYUW9ZN0t1L1pzSjBvM0V5QkcyMEU1?=
 =?utf-8?B?bHpsWmdieXhMK1h4U3o0N2FnTFRST1U0RS9uWXdMTXlFbTY4NkxxSm9XR25y?=
 =?utf-8?B?RSsvUjB5UHdjOXBETXZjYzlZYTQ0STlPVC9ITFAvRHFNS2NoQjdtaDJYcWlJ?=
 =?utf-8?B?SFFCbGl0UlNrRSs2eThodmlPdEpxN1BLSWZFMWtJWEFnRVZnTXFwQVROaFdR?=
 =?utf-8?B?bWpNdW9qRHdqTnZEZ0lUai82TXJnT3puTmFHMGw0VUl0aC9OZkFlaWg5OUhG?=
 =?utf-8?B?VnNzVmhnMm9qRnlheXlZU3V1K1M0ZHFyTlZDYXpQQkNUVjQwc1cwbm44dEZT?=
 =?utf-8?B?UGtrYThRUklacnJYRmZFV3FwNTlMZnloRlRJb3YrbE5FMlEzUkVyRmxxMmZJ?=
 =?utf-8?B?ckg3Q1FrR3ozazhSN0M3MFFiL2p3d05hSTgvWWk5ejVaOGJNb011eFhZRThL?=
 =?utf-8?B?cFBjeE42SVhBOHlNRk1HbTdCMHFCWDhPK1A2aUV5RXdJMlVNUFNYR1dJWGZs?=
 =?utf-8?B?TldCVEkzTHdoaEhHL2FXc2xjR1ZzTkhYcWtZaVhGOVRHSUFjaDg2WHJuSnZQ?=
 =?utf-8?B?czhDZkFzYVF6dDZWWjNaeisrMG1selFXd01oY1dPWVlEdWF3Z2NWQmtaNzlR?=
 =?utf-8?B?YUljT2xPYkVQOThnYm5Wb3N4TmI3YkVWUDhGVHNCZVR0cTBjckRUbGVwZ2JZ?=
 =?utf-8?B?Um13ZXdNc1JBV3I1Vm9kS1IyMStqOEJlaTNIRmtQN3lpcXhieUdDUHZmeEI4?=
 =?utf-8?B?NmUwS1pFU1B0NGdUVWpqbmdKMXlmV0tMeVk1dEtHV25heUlOWkQyM1lxUzRM?=
 =?utf-8?B?S2tkbHk1eG96UmdvVloralJlem5Wa0lvK0NnN2JIY0t4VFZkUXRDQnpoM05J?=
 =?utf-8?B?QkF3cEU2MXY2UExBSjRPNkFLcmRYdWZkNG1neWs3elZwNkE4ZXlYcDFjU3JR?=
 =?utf-8?B?Vk9tV0Q4dWR0aWNCWWhWMUpmR0ZXK1pzNFRNUExBcHFGa0xTUXByRWVjbWJw?=
 =?utf-8?B?cmcvcjdQZWZ4cXkrSDBTektLNUF5cnZQTC9MNUozcTgvcm9vNGo3dzBzYVBa?=
 =?utf-8?B?eGg1V3hDcGZwNSs4NU9weGhTaTkvSnJqajJEMDVtcGJ3MUxzK0tZQTJmUlNz?=
 =?utf-8?B?ZHdWN2p3T1FIb0YvK0NUMFBrR1BSL1VObXFDd3Q3QXN0eUhKU3dwUnJLVXBa?=
 =?utf-8?B?RlpOY1J2U1NhR0FIRnJOM2Rkcyswa3JnbGdobHVkZmhCUHN5eCtsREVlMUhF?=
 =?utf-8?B?RTN3MlBHT2FGTGROdTZvaWFDZ2lkQkNxTVllaHJMSTBjYUloS2tsNmg4NDFr?=
 =?utf-8?B?dkxORXNTNUF0ODd5L1AydDhLcUJ0WlZJclN2ekV6U2pwZGV5QUNNNVpZZVFL?=
 =?utf-8?B?NmpzSnA3YWlDcHdNZkFHSWFpV01tb1BobVk2blBEUW5ZSm5nWGxvTkFUSGNH?=
 =?utf-8?B?UUpBaStYQmdKcG5ySmlVNTZEQVRTdjd0aUtqdk1ueHFXbDdYbDd0dTZQcVpy?=
 =?utf-8?B?b0xZbytVckxDZEhYbTJyYm0xd1I3S0ZoV1NXN21nM09GaUhRUGFlMDI2NVZM?=
 =?utf-8?B?SUdjTjlxaGFYb0FQWVpzT1k0RzVJY3pmOW5lVm8yb1VjaXhLTkhCM2tTcXBP?=
 =?utf-8?B?R09JTWVaaTRYNk5zL3pnaS9lTHV3bmF1YzN3akhKOGR4Yi9WeWtGeDNtbm43?=
 =?utf-8?B?NEprWHNmYmZ4WkJDTXRTV1FiUGZnWkRmVnhaZUVKMHZoSDdMWGc2VEN2Zi8x?=
 =?utf-8?B?b0ppZEtJRERTSndjUlNseHRUQzlaRWlMc0U0M0w5Y2phV2QzM2hiTG5JbFBr?=
 =?utf-8?B?VVo4Sk5EeXd2NWg2dkp2dkIrVFF0NVJ3NHBnelZuV0ZHcXFvMHFzQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d978744-5e89-4886-7e98-08df0d9121d8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 10:08:30.0841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXsFLccQrogUsnL8KksLAWbMcZUfgdkpQL7pPWyauji+0LEJRYJBD5327chTTZh1JLwNHXapOvOjB2aJI6RzoMOEzsB6NPxEFjlydpuv5Ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR03MB989210
X-purgate-ID: tlsNG-4011c0/1788862114-514C7CFC-245E4C47/0/0
X-purgate-type: clean
X-purgate-size: 3259

On 08/09/2026 7:26 am, Jan Beulich wrote:
> On 07.09.2026 23:32, Andrew Cooper wrote:
>> @@ -273,6 +274,44 @@ static bool microcode_fits_cpu(const struct microcode_patch *mc)
>>      return false;
>>  }
>>  
>> +static bool microcode_safe_to_load(const struct microcode_patch *mc)
>> +{
>> +    struct cpu_signature *cpu_sig = &this_cpu(cpu_sig);
>> +
>> +    /*
>> +     * Treat pre-production as always safe - anyone using pre-production
>> +     * microcode knows what they are doing, and can keep any resulting pieces.
>> +     */
>> +    if ( (int)cpu_sig->rev < 0 || mc->rev < 0 )
>> +        return true;
>> +
>> +    /*
>> +     * GNR98 states that Granite Rapids systems hang when loading new ucode on
>> +     * sufficiently old firmware.  GNR101 retroactively declares that one
>> +     * ucode had incorrect min_rev fields, in light of discovering GNR98.
> We still have no min_rev field, so imo a reference to it wants some
> clarification.

No, I don't think so.  The fact Xen has no min_rev field (yet) has no
baring on the wording of GNR101.

This patch stops Xen hanging with the real ucode which has existed in
the world for 6 months.

I am still waiting on Intel to publish new blobs (including corrected
min_rev fields) before the multi-hop update can be made to work.  I have
no ETA on this.

>  Really I first meant to ask why there's no use of that field,
> to merely make that one exception.
>
>> +     * Both are incomplete statements of the problem.
>> +     *
>> +     * At the time of writing (August 2026), the believed safe sequence is:
>> +     *   0x01000370 -> [0x01000380...0x010003f3] -> 0x01000405 -> any later
>> +     *
>> +     * Disallow known-unsafe loads while permitting believed-safe loads.  For
>> +     * GNR, this allows multi-hop loading to get up to the latest.
>> +     */
>> +    if ( boot_cpu_data.vfm == INTEL_GRANITERAPIDS_X &&
>> +         boot_cpu_data.stepping == 1 && (cpu_sig->pf & 0x95) &&
>> +         ((cpu_sig->rev < 0x01000380 && mc->rev >= 0x01000405) ||
> This is odd: The lhs of && uses the lower bound of the inner permitted
> range, while the rhs of the && doesn't use the upper one. If it's intended
> that way, I think this also needs clarifying in the comment. Otherwise imo
> lhs and rhs better would be consistent in this regard.

It is intentional.  Furthermore, it is the only coherent way of
expressing the sequence as given.

I'm not writing a comment explaining why it's a good idea to use the
same boundary numerals between the comment and the code.  It goes
without saying.

I'm also not interested about pureness concerns about inner vs outer
bounds.  I can't see a change here that won't make it worse.

>
>> +          (cpu_sig->rev < 0x01000405 && mc->rev >  0x01000405)) )
> This one, otoh, fully matches the comment.
>
>> +    {
>> +        printk_once(XENLOG_WARNING
>> +                    "microcode: Granite Rapids erratum GNR98 detected.  Skipping ucode 0x%08x\n"
>> +                    "microcode: Firmware update recommended\n", mc->rev);
> I think a 2nd XENLOG_WARNING is wanted after the inner \n (or none at all,
> to use the default for both).

Fine, fixed up locally.

~Andrew

