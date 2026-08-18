Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1C1C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 10:35:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393933.1632737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwHAC-0003Wf-QR; Tue, 18 Aug 2026 10:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393933.1632737; Tue, 18 Aug 2026 10:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwHAC-0003WY-NX; Tue, 18 Aug 2026 10:35:24 +0000
Received: by outflank-mailman (input) for mailman id 1393933;
 Tue, 18 Aug 2026 10:35:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wwHAB-0003WS-CL
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:35:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwHAA-00BK4B-6I
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 12:35:22 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a843554-e002-0a2a0a5209dd-0a2a4502a726-48
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:35:22 +0200
Received: from [52.101.61.0]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a843568-6ca4-0a2a45020019-34653d000998-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:35:21 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7413.namprd03.prod.outlook.com (2603:10b6:510:2e8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 10:35:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 10:35:17 +0000
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
 b=mJD9W62zqW029P5LaJ9kR2gzvxyUg7J9z/ingio94S2WpZ72VNToStfG9Jjh5WJQwqdqcTZPrIK+cEuBilh8Y9uIQ+V/i/Vxcf/JCHZYNXqkbKewFQgwz/NHxnLCa47tigqkjbT0mD5kbNGQ5xxhkC6GbyxsLQb20HvobFzh/vbIuOlg86+BlMIfwjkUH1GhpgPNGqnYZnGNevOLravgFsbVu2o+8HThOXpd3+joco9RNIqJB8RW/Akkz80RBPSLswbSFJOj1qbsVbeP/gY5JaAs8Koy2I1b40M9kh+b6U93qQMbs2PlV2hkdBLnqG0pfJ3ckVo9ymI6BsVXuJhdfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a72T3B3V1OW7tNrgOO/ktM4/K+rzTKrQksiFPMT06IQ=;
 b=a49W2RA9hOEloL2DQ2dRSfsnqK507g57XRK4Bu79/PSlOq84ODp0h+YjRECdgsuiN0bRE56fgeif+DChV+lX0aCFvPoNwiM3Yjz9g7Kdg9OLA+xJkcn/pU1ueSsXj1dx/af60pmJKhJJ00QbDB7oAkwOL9zGLw0P32sDxP9fVoazoN8RVsxUGuWf96dTLyic3ZbK9gbYNRKZnHl+UHhIXrYmrSmQVwExoqYnFxALvMMU4DSP3LNTiY7mU5hQxJqgizqfqokMzXKkiWwIRW6HMqnksqeOdYQuiqJzo6TR3B0I1lFaFMm2qoyxTJQ1xk4ZLnJeEI/sLLLtqFKPSUb9/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a72T3B3V1OW7tNrgOO/ktM4/K+rzTKrQksiFPMT06IQ=;
 b=l3vNFiocqGxgqURRi5PtC6nWYxGaO3tBD0uafVj6f9zn5lnj08HspEJUeiLoT1jdayaPeOa0zc9AK/lOeMS4Z5byRWOSTnEIfoxBj3c3h0slozG0SyazJluh4nVKHwT2aLK2WL3kRlABmJuByooVY7tC6ujDr/eWpdV2z4Q4xSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cf0fe335-a45b-4721-b5cd-ac1fd293553a@citrix.com>
Date: Tue, 18 Aug 2026 11:35:13 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 dfaggioli@suse.com, gwd@xenproject.org
Subject: Re: [PATCH 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20260818063259.18733-1-frn1furkan10@gmail.com>
 <20260818063259.18733-2-frn1furkan10@gmail.com>
 <030c7756-c959-465d-9d14-9bb3523e8c31@suse.com>
 <1d50520d-68bf-4765-8a13-c7c047580f2e@gmail.com>
 <887cce18-5a67-4177-bdaf-7ef9bc192bea@citrix.com>
 <1b281dff-d43c-4ab6-9429-e30765a93be3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1b281dff-d43c-4ab6-9429-e30765a93be3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0149.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f29c74e-9e50-4b2e-2c72-08defd146542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	CKYWS6WYHeuzBzp9EMWMWYmCrgz5/Y3CMdAMkpbqvdIA/5jvfk4s+NF9KwP+/SkB6MOd3DugCMy/v766NKMh039dMdd/+zsPwD17/xYLRiCtt7HtJtNgrW+cCqYhGcLU+MMWDwbiT1lDzJd1GLRpwlD/3ax1KhLTaSlyYP0uiMgqd4iubRwlh/GTomkV9Sk1L5KR/cenJ4QtkmGbbhB21TFeFPK5i6pvrgFUanSxV97hSUD9qMi1Zo4h22UaDOtVtfujJZYwRW+mMHYe9yIQkGieQVrUFHs91TmviCnNLiSRm9qrqlXPfBvkK5HF19zVn57z/+NreF6dcPWltBJMpKWiBq/TH4eMadp3tBpg6YVRHO6sC+H+jlSTy23TwstoLd1d7WDy/cj3WCVvyUJcxMv+e2jGNzwPAHhQrP3rL67F3BjH2WLqG9vyVd/qKglk1FOyZZskvcogG/KU2FjdQYdFnVbbLHYIvjajdxGey5bUPQH7BDaP2jH0ui3KnuHAyVZN5oTwyw5XghCHxcMbLEalnyV8p/OepipjAdtOy5J1N2AyRkPf61H/kki37HZyWoDLRWiANr8ivIxH1MC2PFBrbdA8peAO0KmCbzR+HqKkpAdQ4XmZGTCwdrceXM66wczUgwEW1bmfK/rjuwPAe+ikBh2AQmURv0siHGkQPJU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nmh1RzNIaUhobE9HYm15K2l3OTVkUGFLenJEZVlubmZZRklUVGVmWExneFIw?=
 =?utf-8?B?eCs3MCtZZC90Q083c0ZhMVoyV1RvNDZVRm9oQ1NSSkd1dFJJSzdJZGsxNFhT?=
 =?utf-8?B?UWVTQlloMG9ubnRmV29ENmh2cFhrazkrOGMrVGJNVVRKckxlUzJ6R2VJYjFL?=
 =?utf-8?B?NDlSeThRWHFqc0xKUFdzbENVWWVqMTA4dXorVHdEVGlCRWJrVUtQRE5iZ3Jw?=
 =?utf-8?B?THRQSWpyM2tmNU1CTE1rQkluUW52aE5oSGdSTzRMaVVKaG92ODV3NHZvTEZE?=
 =?utf-8?B?a0xFcEs3LzB3WEZnWjR2YWowMVJLVWQrZXRuNEl1ZVUza0xYYTFjbFFZaWN6?=
 =?utf-8?B?NU5BQndSYmtOZm9mRXNQdkFFc0FuS210R3liaUZwOW9nQk40WFdJSnBUR0Rw?=
 =?utf-8?B?R2dmTW1wdFMwSHZFZWRudnVhT3dRdEl1YkxGcDhjN2xOeDdXcjNkaDBzdEpR?=
 =?utf-8?B?bGVWQU9IUU5QWWFDVi90MUEyVW9TZTZUQkJYV29wTXllbEI3b1dDUkN0YXRx?=
 =?utf-8?B?TzRmamhSV01WM1ZqZFkrT0lpMTh2cFhDNkwzTXM3MGF3YmJXTElHVmIrU280?=
 =?utf-8?B?L21zTFZrajVlK1A0dWlXdHcxLy9hdkN6Wi9oYXorK1g5WTE4TnRsV203ZXl0?=
 =?utf-8?B?aGp6ZHZZOXp5dkppdjVmT2xtLzJJU1RvNGdzRUczbUxZZWhHdzBySmxiZVJp?=
 =?utf-8?B?QlRsWFdMZlBqT0t6L3I5R1FnazdsSTdkZVJXcUZlSXdTazA2WCs1cFNINVA2?=
 =?utf-8?B?RXhRS24vMlB3QUM5M1JXcnlQZTQxODFzM3BxTTBGcG1vdFhCTUpCL2d6aVB5?=
 =?utf-8?B?Y1V3cWZQa281QlhnU2lsNFRhTXhhbktaR1kzbDNoRTNkL0gxWmpFSG9reDBH?=
 =?utf-8?B?LzNZb05aT3dpVVlGcVROUzJ1amFhU29VV3lkOGdkSmRPaEpUOXlxdWo4Uisy?=
 =?utf-8?B?YVYra2VuVTkvc1RjczlqcmtIcXNXallRMU53dlh4cXpvNk4vOHFGU1Y5Tlp3?=
 =?utf-8?B?NElxTEVIV0V5cXdXMk5Sc3htQXJHbGJVV3B5YlpmWS92VzkzZjFSaTFHZkhJ?=
 =?utf-8?B?Y1FpQzJ4U25CdVZJUlEwSlZxdjJ2aDMwSEZmQXJQSXE1NElhS2kvcEhDa0NF?=
 =?utf-8?B?L2FndHJLVUhEcHhqZm1WOFA2MTlqVmZsVkJ1WnpxVHd5TGtlT0EycGtHVmww?=
 =?utf-8?B?eDFVYzZyeUp6QlhCdDlsdS9SR0xKbVNjMEwxQk5hRTg2TjIxaEJsdDBCbUY2?=
 =?utf-8?B?bEFaOFROUG1FQ05DMytOcWNqS0xKdDNWWXN4L0lvTkhOU0RKZDhKRlFuZ2dm?=
 =?utf-8?B?bG1jSGZHRWNKOGVEd2dHM3p4dzBxNmN6RC8reURnZGFsMlU3ZkVxU2VMdkRR?=
 =?utf-8?B?ZkN5ZG13a1A5Qkp1QVFrNEtvWThHV3ZxSUZLNkEwUWJNUkNxb1dvUktjNnZy?=
 =?utf-8?B?VkU4Y3FiU1dRQkRxLysyY1k1RDF5UWxBM284UkdFWFBWUE9wS2s2ZWl3dXVr?=
 =?utf-8?B?UUdJakcyUUVoN2doZTNWMjVUMWd6YmMrRjJmT0NDR1lMdHk3MTZjQnhUWEdW?=
 =?utf-8?B?K0gzY0RQU0lDRmpJQSsrMkc3Q2NodjlIcGVML2F3WFErbWFVNThqNXlINFBZ?=
 =?utf-8?B?c25TTHdxTnZsU25nM0dCNVFqN0gzRjlHd1RpRDU1ZnJ6REYzU04vT24xMlZo?=
 =?utf-8?B?eHBrRHZPRHFZTVJ5T3BmT2E3cHJXYlBLY1UvcTJYQkw4cTBCZWxQUXI2aG1a?=
 =?utf-8?B?TUYvc0VzbmFBM1RZS0pDeUtQVFlFQ2JSSWpnT0Z6a0RjVTdCVy9kUzZpcTJT?=
 =?utf-8?B?WFJMZmM3WWd3RGdmWkNTeGI3NU1rcUsvZWZDMlc4ZVZuMEQ2cEJuOHRrZkZW?=
 =?utf-8?B?bjVQaW5rZlBhakVsQ0s5R0dSeWZ2MWtqNW5lZFZEeUpCVlN1SWtmNHZLRmJY?=
 =?utf-8?B?NkZSRmZtN1ZyYVlSWXRuRUxSeFBGYkFHWGs5ZTFkSXlOV050SkRsTUZRcXgv?=
 =?utf-8?B?WEJ4L0VoWFNML0w0NWNObjFGQlkvL0J4TWplMTJsRHJ4S3c2aTBabGNQUlNR?=
 =?utf-8?B?ZEZ6VDNIOHpvNWZVdmNyVGFwZXR2R0NpOGdkZXlCVzFiR1lFRU5iY2hGajRG?=
 =?utf-8?B?L3ptbkU4b3pWTkJWbjc1aUVxbTQ2OVF4TzNDR04xeUlRMFZzTVJ0MlJLSlh0?=
 =?utf-8?B?b0prUkZmRDBTWjEwQTd2dHEyMVA4dlBwOXczejl3anFuS0Q3QlNKczNVTEpz?=
 =?utf-8?B?bGhXanh4N1BYQVJ2N011em53K1NDL2ZLT2RIS0NHclBEdVR1dDlTZEVRUUlW?=
 =?utf-8?B?Y3B3MnBvYXptQ2ljNjBnQ1hZekNQZUJIZjAxeDlSTzJiVlkvVUFOdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f29c74e-9e50-4b2e-2c72-08defd146542
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 10:35:17.3981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FMTUPdeD45ZYYmHd1FwhPz9APBaU24TvPqO2/X+f98H8EaBe+le8kBml4ulpI/DtkNy/lWRU75vJ7ijp7PUseIysUAcYH44Y8SalhhJJS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7413
X-purgate-ID: tlsNG-720697/1787049322-66CB22AC-5B89919C/0/0
X-purgate-type: clean
X-purgate-size: 4251

On 18/08/2026 11:13 am, Jürgen Groß wrote:
> On 18.08.26 12:04, Andrew Cooper wrote:
>> On 18/08/2026 8:53 am, Furkan Çalışkan wrote:
>>> On 8/18/26 10:11, Jürgen Groß wrote:
>>>> On 18.08.26 08:32, Furkan Caliskan wrote:
>>>>> sched_move_domain() derives the number of units to rebuild from
>>>>> d->max_vcpus, which is fixed at domain creation and never rolled
>>>>> back if vcpu_create() fails partway through building a domain. So
>>>>> d->vcpu[i] can be NULL for some i even though max_vcpus still
>>>>> counts it - this happens if sched_alloc_udata() returns NULL.
>>>>>
>>>>> The per-unit loop doesn't check for this: it sets
>>>>> unit->vcpu_list = d->vcpu[unit_id] (NULL) and hands that broken
>>>>> unit straight to the destination scheduler's alloc_udata(),
>>>>> which assumes vcpu_list is always valid and crashes Xen when
>>>>> it is not.
>>>>>
>>>>> Reproduced by building a domain in a non-default cpupool where
>>>>> vcpu creation fails partway through, then destroying it.
>>>>> domain_kill() moves the domain back to the default cpupool via
>>>>> sched_move_domain() before actually destroying it, crashing
>>>>> inside the destination scheduler's alloc_udata() (seen in
>>>>> Credit2's csched2_alloc_udata() -> is_idle_unit() -> NULL deref).
>>>>>
>>>>> Before building a unit in sched_move_domain(), check that all of
>>>>> its vcpu slots are populated, and skip it if any are missing. The
>>>>> rest of the function walks the vcpus that actually exist, via
>>>>> for_each_vcpu() rather than n_units, so skipping a unit here
>>>>> does not leave anything else out of sync.
>>>>>
>>>>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
>>>>> ---
>>>>>    xen/common/sched/core.c | 19 +++++++++++++++++++
>>>>>    1 file changed, 19 insertions(+)
>>>>>
>>>>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>>>>> index d3a0a97e1d..d542c76543 100644
>>>>> --- a/xen/common/sched/core.c
>>>>> +++ b/xen/common/sched/core.c
>>>>> @@ -745,6 +745,25 @@ int sched_move_domain(struct domain *d,
>>>>> struct cpupool *c)
>>>>>          for ( unit_idx = 0; unit_idx < n_units; unit_idx++ )
>>>>>        {
>>>>> +        /*
>>>>> +         * Skip this unit if any of its vcpus is missing. Bounded by
>>>>> +         * max_vcpus.
>>>>> +         */
>>>>> +        bool vcpu_failed = false;
>>>>> +
>>>>> +        for ( unsigned int i = 0;
>>>>> +              i < gran && unit_idx * gran + i < d->max_vcpus; i++ )
>>>>> +        {
>>>>> +            if ( !d->vcpu[unit_idx * gran + i] )
>>>>> +            {
>>>>> +                vcpu_failed = true;
>>>>> +                break;
>>>>> +            }
>>>>> +        }
>>>>> +
>>>>> +        if ( vcpu_failed )
>>>>> +            continue;
>>>> I don't think this is correct.
>>>>
>>>> If there are some vcpus in the unit you will loose them (i.e. make
>>>> them no
>>>> longer be able to be scheduled), right?
>>>>
>>>> For a dying domain this might be okay, but not for one still
>>>> active. So I think
>>>> you should at least verify the domain is dying, otherwise
>>>> sched_move_domain()
>>>> should just fail.
>>>>
>>>> An alternative might be to fix the NULL dereferencing where needed,
>>>> but this
>>>> could become tedious.
>>>>
>>>>
>>>> Juergen
>>> Right. My initial attempt only checked 'd->vcpu[unit_idx*gran]'
>>> for the head vCPU. The crash happens when unit->vcpu_list is set
>>> to d->vcpu[unit_idx*gran] (which is NULL) and passed to
>>> 'alloc_udata()',
>>> causing a NULL dereference.
>>>
>>> I expanded the loop over 'gran' to handle core-scheduling cases where a
>>> subsequent vCPU fails mid-unit, but as you pointed out, that drops the
>>> whole unit for active domain.
>>>
>>> I'll update the patch to check d->is_dying to skip incomplete units
>>> only for dying domains, and have sched_move_domain() fail if an active
>>> domain has missing vCPUs
>>
>> I'm afraid that wont fix everything.
>
> Why not?

domU's in this situation do not have is_dying set.

~Andrew

