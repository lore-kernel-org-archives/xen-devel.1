Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76936C5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 10:04:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393882.1632692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwGgL-00053Q-Fd; Tue, 18 Aug 2026 10:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393882.1632692; Tue, 18 Aug 2026 10:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwGgL-00053J-D1; Tue, 18 Aug 2026 10:04:33 +0000
Received: by outflank-mailman (input) for mailman id 1393882;
 Tue, 18 Aug 2026 10:04:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wwGgK-00053D-1s
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:04:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwGgI-001zok-T6
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 12:04:30 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a842e24-8faa-0a2a0a5109dd-0a2a45049ede-48
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:04:30 +0200
Received: from [52.101.201.59]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a842e2c-b57f-0a2a45040019-3465c93b5850-4
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:04:30 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA5PR03MB989127.namprd03.prod.outlook.com (2603:10b6:806:4d6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 10:04:27 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 10:04:26 +0000
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
 b=lRi5UG1lvM6GpnrHhvDG+8raSxfpWobc7j4g3opnU16RiEDNZxFtfqXSfIM6ffq55ewHRC9Jg2FzLiP3P8bAi+gdWPM5jcmsKNDBNoLDD0FPlCBxcItd7dtPcd/wi3lIBN+MkuSPlO8Lqqw33ygfVEkj2QtattZCQRsSewp4QRXJHntcjUufPGEV32G2IAHo+ZclffjEoMvxj2MjhyXkXz4zNRu2p6TGT/cGOROOFfjtVSoBH70czUev04ZDpbmEBUotYuLtlXSQKnHtLrgIXDwWw3/6kf4517aq9Y0bXStv+H4CRzmDSmnPZmxFLjpiXqQ88m5dDwgi60gqGsqiVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqWtnm7A+Rwq/Adql3s205bgwPiU4RVpkU8vfIv+3eE=;
 b=GlLF9xkePx46Ajffx9h4xOpLfenHFtJJEDC5oqztw3puhI00CZ66gwUiPWXXKMoccxui/OxGOkDZflsgbKVnW0H1fVbbHNhnKk2pZzqU6vocuwGpjvgI33Ug9CibcJzo6gXWKl4RXHPVBgR/PRKkQ9KC87W7qNkMrLMlyPK7XkzRhKUOoyeDolT2QYxlbvVMZjhdoVbB28bPVmP39V/HAClWY6L5TJAy0Sed2EezrWVFahLrq0KqxWrI9rN/qY2pdw+AOKIrAP0QYxnKVcFF9F0l+FKesZp2n45Yuy8wD4knWKQwnFTFg4RAkJR5PHmulPa05R8SXLEJyhSBJb5mzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqWtnm7A+Rwq/Adql3s205bgwPiU4RVpkU8vfIv+3eE=;
 b=abjGVb9yR5FsiKSBAUjSwOQ96vYQU8an2KPBrdEOPwo0MRdMzzNadCVttJQIKf19o/LsuWeCJyYmodUv0h6HluD2CX9v1IbP+6f/MZMlGwPnZnP9UY856Q10aeeaTnCqAh3pHaZ2vU18AB9GMQvi3JBaI/JyMiuQhq3zlltDnR0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <887cce18-5a67-4177-bdaf-7ef9bc192bea@citrix.com>
Date: Tue, 18 Aug 2026 11:04:23 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 dfaggioli@suse.com, gwd@xenproject.org
Subject: Re: [PATCH 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
To: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20260818063259.18733-1-frn1furkan10@gmail.com>
 <20260818063259.18733-2-frn1furkan10@gmail.com>
 <030c7756-c959-465d-9d14-9bb3523e8c31@suse.com>
 <1d50520d-68bf-4765-8a13-c7c047580f2e@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1d50520d-68bf-4765-8a13-c7c047580f2e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA5PR03MB989127:EE_
X-MS-Office365-Filtering-Correlation-Id: 79323816-6006-46fc-cf11-08defd10162e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|6133799003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ywoLujoIxZgykwXCYEpVkvsozdBrR9Q6X1mUMbLyOxEmfA+SCDDpB7+4eSm4Lrzi/Tgg8LkXnap6Dptnrl0/FxWNP9KXgeoYWjtHTw97KLLdqVsbplI1djXrWX3GE2RPVohgnZ58bt+wDnNlIgxQKk+Py+o54IMxAZsDktaMP4ypgmg/lY7cslqm3vSQW5bC1xVcYyJAz+tFO0u+UFWR2EUkZHCNpTydt8CAG2QGDHdzNHwzAoUuwzMipSIAbzWoaK7eTa/wLwcFpgthZcKWwsqTrYcQl6fD4vR6WTVba+0h1baHIoSyyuD9yUudxRRK4kNYUWISo30V3DmwcNm0H84i5j7krBij1IaFLumgp1Ds2UO27tS11hdi4QP8sL1RGm0gqquuca/XzXrifKFbreHIrMV+deCJbIsfsS7wGknovPEM0a69hCSz4O6rfMnPSMqLMn3U/+wZ2nDiWl/9fzhWhlxQbKuOPM2m0e9tk5Gd+7qhp/UKHmJAdLHUvqZI9vulY7tuIsbk5Oh2JxtGxaUt4WN9IAAIk1RoeljMBAi3Fqn0YQ0kooQLP8J3oC5TB7ViM9UucsocjakZ2Fnipmsrb7XwjQgQ2WlqIV1GDQHRv/ECo2YTLA2Er3bGg1SIiUrTgjA5mHHzYBpFy7R4F1gPVGPANxpy54ZljeTS7ms=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnAyK1JFQ1JFcUtYckZEZ1FRU0lFZTZSYmNyV0NObGczOXptb0dpN2VHM0pu?=
 =?utf-8?B?RUZYLzM4Yk9GejJNbEQwZnJqbHJxZTVuT3pjb2hOUFBkdEpNL2NjNTdScFVB?=
 =?utf-8?B?SzJrT3ZFUDAzTFVBNW43RUJYbkZJa0JULys5blBDeDZkaVdQZ0hLUEpVeFVW?=
 =?utf-8?B?di95UStFNTFySW0yRmxVY0tOUFRyUGVnUVE3cXNXQ2lYV0lUU3JGeFU4WlZz?=
 =?utf-8?B?QzF4czF5eFpUaHRQdnU5ckYyeXB6MFZoanNSbHpLR0ZxNXhZRGlCSDBHYVFN?=
 =?utf-8?B?b21wZ2Ztbk0rNmR6cThuR25JTGkwTEU3Z0RIZWZSbTZaMFVGWDZ3TXNucFFN?=
 =?utf-8?B?d284WURpMWhGSUpPc0VITzBJVmp3QVcwY0QyMUFYZ2J0ZUozVGZIc0s2K01r?=
 =?utf-8?B?WEJqd2xJOGF2UjVlMUV2eGtrRWRNYmxjY2YzR3MwdGNuZkZENVNhdERJNEt3?=
 =?utf-8?B?NUFZaUVtWjlFTWxEMUhEVy82Y3N5T0lRNFFxVUw2T2VqL2lWc2dWeU5JYzV3?=
 =?utf-8?B?THFVcklzTG1PUzdudUZnemo2QW1vTUpVdHkvOVVMSkI3MXFDL0swdDlFTkMv?=
 =?utf-8?B?Z01UZzhoQU5qcnNEcHo1UVROME9uVlFUT0I4TjFreWM2djJSeWNTbk9ZeGZH?=
 =?utf-8?B?cmM0dVhwQllkbmdMRXVTZnQ2TlNRSjlyM1ZHdm5uNTNmTVdjaUh2VjE3YUxk?=
 =?utf-8?B?REJtYTMxSG15V2lUM2wxU1BRaGdYbzhXdmllYUw5MTFIbGlWd3E3UzM4YUVY?=
 =?utf-8?B?Uno1WjRjVUJmai9SODhCVXI4aTBpWURTRHZJUXgxQlg0NENsVmIxU2MxalRS?=
 =?utf-8?B?cFVBMFlLMEpVT2trRjlSTHVBbXhzZDlNUlpTMkRYeDVudHE4eWI2TURyRTNy?=
 =?utf-8?B?NFk2SW1RZUpLTlo1bm52TWNCS281VE53czIwb3Fhc3h3eHpKUWRDcXc5UnYy?=
 =?utf-8?B?QW5JbVZNeDhsMzhFMzZjbDNoRTE4QnpNWU4zeU15bGNLYk9XRUZaTk96RDA0?=
 =?utf-8?B?WGQ2cW9lVWhjVlZhVDlvcklSV3c0ZVVBMVh2bm50b1l2ejY0MjNLck9mSkVn?=
 =?utf-8?B?S1g5RVdBT2xrdzBtNGM1QTRKUWlOdWhZeWIzemtFb1AwVkNhTGRSRXZvcWVa?=
 =?utf-8?B?eERENy9Gc3hsYzQ3YmV3NjViZ0NHem1hS2tqUVBDWUoyQXExRS95a0FXQ29j?=
 =?utf-8?B?U3h4TFVVSnRKSHU5YzZ0ME9vUnJCSTd1dDNlWHRHamo0LzVOUmJXUXV3TkxP?=
 =?utf-8?B?T3pSZGVqdXo5OFhjZFVxMWpKOTNUZGpnYndZazU2azZrLy84NjFlWm44VGVh?=
 =?utf-8?B?M05OTWxLYk5Vcy9nejZ5RWhHNW9zZ0RsWkZGRG05MDJ6NjF3cXVsSFpDbjdQ?=
 =?utf-8?B?T3ZXNGlxakRoK1dBOWlVbU9Qc2NVNVVxMFRRMnZZbnQ4Sk56L2ozQlA2M0VU?=
 =?utf-8?B?Yy9BdkdGNDlNRWVuOGw5OEJtQTVMTW1ValBnRmhYeTBpbTY0b0hRUW1kRW44?=
 =?utf-8?B?Mzg2Q3NNdkZqc3h1bi9NWUVZVGpRVEIzQ2g4elVpQU1pczVROUo3UWVRU1NZ?=
 =?utf-8?B?d0E4aURXVWQyaEZyT2FOZHphSjB5L2hEeU9DUHVOc05xa3RuUXhvYU5ZcG1U?=
 =?utf-8?B?UkZkUlhRUWdiaURHQVl6YXFjRncyUU5vS0RxNmFVaDh0TUE3bU5RTVVaRVgz?=
 =?utf-8?B?TU1qOW1xejZUTU53TDhZM3BPOWVQL0UrdTFYZldRNzJMbTBUWXR0Ky93a21B?=
 =?utf-8?B?bDlNODdCclJXbU12Vm5RMUljajBadHhQS3gwTmJpTVNBNmNQRE5wcVJLU2dz?=
 =?utf-8?B?eU1kd2JLNmQ2ZFJwVGdiY1pDTklPdmZycm1YSkNBTXlzY1F4dFNKc3Qzekw4?=
 =?utf-8?B?Uy81cW1SeEcveDltVXlqNE9JWmtyWi9RSXZNOWgvRUt3V01UczN2RWVCRU9J?=
 =?utf-8?B?emlQdnlNTHJrTFdONjA2aEJhTmVLbEk4RXlzN2JLMWVReStQU3NZUWtLRjll?=
 =?utf-8?B?TUxINkRrYkdYb1FZQ1Yva1hUdjJzM0tMVjNEUVVUS09oVDhzSTF0SStMUFQz?=
 =?utf-8?B?aEpkMjVWNGw3T0xKeGhlQVBWNUp2QlZZbEw2WmNQc1FXS3ZZaE56WUFQMFdY?=
 =?utf-8?B?VmdPT1E2VDc2U2xhNDVpM0lyTFlhWnc2WXlIRC9wR3hQZWdaREVtQUN3MjFu?=
 =?utf-8?B?R09GMUxQa1FvNzMvditXVVhIbUNTMGlrdjhua3dhZWRNNkgzMHdkZjR6TG9r?=
 =?utf-8?B?K1FoQXg4UVoveGxqVndzM1B6RXJUTm9qSWZuMURiK2YxVVpOck12eUVjUkFt?=
 =?utf-8?B?dmRoeFBXWUZZczdYZXJ6UVBja2hkd2Ftem9vS3hjeVdSN1ZMSTBXQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79323816-6006-46fc-cf11-08defd10162e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 10:04:26.8464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frtIyXmsLQ9UsIFY84Nq7mQi2cZJP+ETaOYPmxHvM82M0d4rO99p7ShT5avOciNT0f9w9Q3yI1/zyTIbMAXJgWyqVU370EUxX5Ifb3Ryflo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB989127
X-purgate-ID: tlsNG-ebf023/1787047470-583C0B50-A731A666/0/0
X-purgate-type: clean
X-purgate-size: 4296

On 18/08/2026 8:53 am, Furkan Çalışkan wrote:
> On 8/18/26 10:11, Jürgen Groß wrote:
>> On 18.08.26 08:32, Furkan Caliskan wrote:
>>> sched_move_domain() derives the number of units to rebuild from
>>> d->max_vcpus, which is fixed at domain creation and never rolled
>>> back if vcpu_create() fails partway through building a domain. So
>>> d->vcpu[i] can be NULL for some i even though max_vcpus still
>>> counts it - this happens if sched_alloc_udata() returns NULL.
>>>
>>> The per-unit loop doesn't check for this: it sets
>>> unit->vcpu_list = d->vcpu[unit_id] (NULL) and hands that broken
>>> unit straight to the destination scheduler's alloc_udata(),
>>> which assumes vcpu_list is always valid and crashes Xen when
>>> it is not.
>>>
>>> Reproduced by building a domain in a non-default cpupool where
>>> vcpu creation fails partway through, then destroying it.
>>> domain_kill() moves the domain back to the default cpupool via
>>> sched_move_domain() before actually destroying it, crashing
>>> inside the destination scheduler's alloc_udata() (seen in
>>> Credit2's csched2_alloc_udata() -> is_idle_unit() -> NULL deref).
>>>
>>> Before building a unit in sched_move_domain(), check that all of
>>> its vcpu slots are populated, and skip it if any are missing. The
>>> rest of the function walks the vcpus that actually exist, via
>>> for_each_vcpu() rather than n_units, so skipping a unit here
>>> does not leave anything else out of sync.
>>>
>>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
>>> ---
>>>   xen/common/sched/core.c | 19 +++++++++++++++++++
>>>   1 file changed, 19 insertions(+)
>>>
>>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>>> index d3a0a97e1d..d542c76543 100644
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>> @@ -745,6 +745,25 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
>>>         for ( unit_idx = 0; unit_idx < n_units; unit_idx++ )
>>>       {
>>> +        /*
>>> +         * Skip this unit if any of its vcpus is missing. Bounded by
>>> +         * max_vcpus.
>>> +         */
>>> +        bool vcpu_failed = false;
>>> +
>>> +        for ( unsigned int i = 0;
>>> +              i < gran && unit_idx * gran + i < d->max_vcpus; i++ )
>>> +        {
>>> +            if ( !d->vcpu[unit_idx * gran + i] )
>>> +            {
>>> +                vcpu_failed = true;
>>> +                break;
>>> +            }
>>> +        }
>>> +
>>> +        if ( vcpu_failed )
>>> +            continue;
>> I don't think this is correct.
>>
>> If there are some vcpus in the unit you will loose them (i.e. make them no
>> longer be able to be scheduled), right?
>>
>> For a dying domain this might be okay, but not for one still active. So I think
>> you should at least verify the domain is dying, otherwise sched_move_domain()
>> should just fail.
>>
>> An alternative might be to fix the NULL dereferencing where needed, but this
>> could become tedious.
>>
>>
>> Juergen
> Right. My initial attempt only checked 'd->vcpu[unit_idx*gran]'
> for the head vCPU. The crash happens when unit->vcpu_list is set
> to d->vcpu[unit_idx*gran] (which is NULL) and passed to 'alloc_udata()',
> causing a NULL dereference. 
>
> I expanded the loop over 'gran' to handle core-scheduling cases where a 
> subsequent vCPU fails mid-unit, but as you pointed out, that drops the 
> whole unit for active domain.
>
> I'll update the patch to check d->is_dying to skip incomplete units 
> only for dying domains, and have sched_move_domain() fail if an active 
> domain has missing vCPUs

I'm afraid that wont fix everything.

Your scenario is rare, but sadly we have no interlock to kill the domain
if a setmaxvcpus hypercall finishes mid-way through.  Furthermore, for
dom0 at least, we actively do want to run in this configuration if we
end up in it, because that at least helps recovery of the system.

At all points in a domain's lifecycle, d->vcpu[0..max_vcpus] may be
NULL, and we may even want to schedule in this scenario.

~Andrew

