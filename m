Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBE3C79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 11:00:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412798.1643141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4G1n-0006kF-IN; Wed, 09 Sep 2026 10:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412798.1643141; Wed, 09 Sep 2026 10:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4G1n-0006k8-Ew; Wed, 09 Sep 2026 10:59:43 +0000
Received: by outflank-mailman (input) for mailman id 1412798;
 Wed, 09 Sep 2026 10:59:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x4G1m-0006jw-53
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 10:59:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4G1j-004kQu-CZ
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 12:59:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa13c18-8faa-0a2a0a5109dd-0a2a450cad20-10
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 12:59:39 +0200
Received: from [52.101.57.54]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa13c19-f479-0a2a450c0019-34653936fb7b-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 12:59:38 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DS4PR03MB017780.namprd03.prod.outlook.com (2603:10b6:8:3e7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 10:59:35 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 10:59:35 +0000
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
 b=Q87JX48OZP1hyS3ReEUuAUmZnfFZl0CxzYkcgxHaLCwZgu8A4g+WJ7wQJ5eDqv5Z+0UW4TvoTLaDSzf8J5cdMeyJOh9r1Stmbqhz+IlJTqkiKp7v09vBNBy0uChluQV/5to6VcJEgcPGmOXkp6DyJV6pNhRjDziEGND9/Sp5Lkvuifm54PJsEgZniBN1p/RRyLkhNeE3+yzi2+u2W8sVjtzHjqRllMzLf2v6Jt8oh3oPE07PHL6Wb7g5NFm7KiUHHyGjreFgrNmcelduVoxnyD3Ie90/DyYcGEULqWVRXD7NXVj9oBL574UCSEezGAtlLa6eZxywiK9H8cME2VT4/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRRatVfPlabWz6C1vuH5L6jVfQWHxAF+090Hq+u2EU0=;
 b=k2X49mm+KFPADahN2u9xHRIau85JKfxZ+VY60YjSn2Nl96GPYZxG0jSvJhyLD1Yo5WAw8+K8cuzd3/mcAFiOpSlIi7N8ZO2gWw1ErBswrNWDFb1zeA2jd9t1GZeRyr+b9MlCaYKZOkQfixCavEsJJJT99s27LVu0S2QBVzWUUba7tKS3APLPRSs2HvoiXfi1qXBphFmvUOD4zxaoTmw6iZKX5s0DU3D4q8165dzHYmu3PKAH3ULFlXpeYhJFxKBRb9E2xchM2h1iL6v2PDV+oYKlt3XGVIhifFtGMBhFX1/Q0V4yJofJjGVAxBu9YMzbfZUZJHFJtTebeYavkbrTyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRRatVfPlabWz6C1vuH5L6jVfQWHxAF+090Hq+u2EU0=;
 b=uRSahXtXxOpbAxemjjS3TrYFewuTG1/V3WbQHPC9kcKYrrOd5/O8iyT92DzAVDzP4uaYN/W4gX5GU42AKII9KOdepaBL/qW9cd2yAJLzUhf6Ppr/Vd463FuThmQ/pvqT+zco/i+KCjydYuQBKY4GfrZawPGHDWcdERIm2nVso04=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <abc3309d-e583-4f26-9466-a921e793b1c2@citrix.com>
Date: Wed, 9 Sep 2026 11:59:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/viridian: Implement synthetic timer direct
 mode
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260904141516.367862-1-ross.lagerwall@citrix.com>
 <20260904141516.367862-3-ross.lagerwall@citrix.com>
 <aprgh1uBTItcDvbg@macbook.local>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <aprgh1uBTItcDvbg@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: OS6P279CA0166.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:38::6) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DS4PR03MB017780:EE_
X-MS-Office365-Filtering-Correlation-Id: d539a374-6792-4c16-fa87-08df0e616f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DOBI5B0I+wq11Z17pltxj97fr3n5vnKE41aYCrd5li2eGzF/KpGlEeoNl8vU0c5EuWhyzMxxCJO3hoKyFigN4vk+ofo2RJ2NDL/zrhQxASjQ2xklW6E9oVfraXc67vFAPzYW9dCTIHQ1/iR5FCm2EN1x1OIXSpSs7+AZpeme7RkjkQeK8GMKeVoD/0miexL7A7F19l8nR1Espz2G0iItYcAgvIDhtykjlOGi/GhwwlHij6P1YU2z+vtgWYNNSwChYt9dOAb2wZzJl+RKCj0kWUL0i5gPnAeCwTJqYdWit6hERipXXXOoKM4inOWG/6VMpFFo86V0vV0dbzhPNW/tBilNinebyt2Zz9+MFIMVaTuNzdaQaM6xc/iLCJKAvCLwdvWYmHH/nG+UOHE7Jg0cWif2FbGKfDpu6uYHOliNTgNyepJe3dsWtdcftUFdHePWk6fOENGrZLlqdWqJdPRAJMZUBJ55TvNI77vBpNF/PnNY0+nrVD2f4W4M28TIbdLYh75hkWCENqwcS3MP9J60KNbj9CMmnd5oCngI1hbM323aIuS2b0l4ogO+Yh5PsGXiB69k6Vpvqxh2urzdLMd7D2VxA1hXc7/jq1ExvYDi65o/ktJf4Dr2oaeuHhOfSywrkaemDZ6UlhGHfqsE3Hl+jKIehxcx9w0jXhCzcczOPEQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDRBcG9RZUlaa2pWazAxR0RSY1BBd2hZNmgyYkMzQWR1Y3ZrOXkwakM5VlFN?=
 =?utf-8?B?dW5OR1RXQWNRcWRubnNwMGgrYXhBUGVzMHlDQ09GZG53MG9wZjNrdHdjd2V5?=
 =?utf-8?B?RWoxamI2ekVma0t5dXV3RUxhTHBrbmtLbmc5MjF4TGZ2cnI1TFVDc0ZQeSta?=
 =?utf-8?B?VGhSblVUbWgrMUozVEJvZWF0K2RWNkpxSWgrQ3ZjRkFFdEJRQnJtKzVOeFE0?=
 =?utf-8?B?ZUJEVWtCY1dCMUp1Qk5FelExTCtqaGFmVXhlWUtsQXV3YTl0aVM2aC91WlVB?=
 =?utf-8?B?RUE0TnJhL01VbHhhQ0tENTMvSUJRYi9hdU5NYUVDRGxMQ3FRTmVxeU45Tlo2?=
 =?utf-8?B?ckJpMnBHSlVLa3c0Zy9wUWMxa1dmTHpSOVk3TFd0SlJoczB6RGJXT0JkNFFO?=
 =?utf-8?B?bU1YS1ZucFA5dTFmR0I2bSs0aEVHTnBVTGVHRllrUE1VVHNlRTY0YVVBMDRJ?=
 =?utf-8?B?ancxVTh6RTJkNVZzWmpabXA3VkdWRERUaTZKRUwybmE2a0Y5UUVLcUVkMzhK?=
 =?utf-8?B?cStLWEpINEhmYjRWUEtIcngwTmNoZk51Z25udGtUSHNoTTZqWE9nVDlxb3lo?=
 =?utf-8?B?blNPb2ZSWmpDNlVFajVhYldFUGUyZW1KMHJHdlpwQkpndG52bklvbjU4Smlq?=
 =?utf-8?B?ZWdCMkw4ang3Y0NucTljRkhYZ05IMVJiL2tWVXdFVGNmRVNsUjBDMG5uWDhB?=
 =?utf-8?B?VFdFdGt5c2xkZkZTa0JPZ2tsWTNkNnRWMVBROFA1cDl1OXVJNVM2YVhMWlZz?=
 =?utf-8?B?SytFdk5Rd2diWllxK0piZHVMWk4xK1cvRjBESkg5V0VMdXlTZWZ5Ykd2aXNQ?=
 =?utf-8?B?V0d5YTBiT01HYlVsbWNZaHBQOFRqelJRN2UxQTNmUVdzcFhMUWR1U0wwdEFs?=
 =?utf-8?B?WHVCNWpvaHh2NTdFK0oybjZpbWc1Z05oUWJvN0VSbmhwTWxRZHhEUUMwZmR2?=
 =?utf-8?B?UXpjOGdNSjVlbFpDY1R1d1M4RE9JM3ptYkk4ZFZPR1lYVHlPZXFTbkpTc3R1?=
 =?utf-8?B?T1NWVkRnQkZSWGxQT1M5QzhaSWdROTNVcGxVNlN3Zmd6R29QUmM4RC95aVIz?=
 =?utf-8?B?TkdJTHI2N2VaT250NDFmeXpGeUpidGR6b21OZktMSEVUS3lRSVUzRloyV2xQ?=
 =?utf-8?B?QTlrVFhQcWs0MkZKRTQ4VnR1cWxMOFYrMVh6OG9lMWt0QWpsZExWcTd0SnBz?=
 =?utf-8?B?NlFwR2hzdjFRSUs0aGpEL2JQVGprdDJ0anhkcmxNOGFTV3dlTTJKSXpkUTR0?=
 =?utf-8?B?a2ExbldDcVdPZHl1K3hsTDJ6TVFhemFZb3IwZDJQdHhlNVFjTy91VHZtZXdr?=
 =?utf-8?B?dWhGR05PUDJuOUhWRTFQZkFlNU9BSGRGcWNHQmtJL3daQmE0Zklta1pkQzB5?=
 =?utf-8?B?cXRnQnVOZ0lNNWNrSUd1aXBJM3ovTzN1R1VaOExSL09YZjErTW9MZ0hWM2FF?=
 =?utf-8?B?ZzNrQXdIZUE3bWR1OUFyM0dZblJ4R2RxbEl2ODAvNTBDd1JYd2N2cjNtc211?=
 =?utf-8?B?dk9SVzZienVRWWhqQjVlb1RvWHhZVmswRWR4RjFQTnNBOWFVZzM2YmIvZHh4?=
 =?utf-8?B?VGk3aThPb0NueXF1MVQyR3hLQ1BMQUpoOERvVnhQN25IQ0VhYnpEYkdVb2xG?=
 =?utf-8?B?eFoxNXVFRVBaQ0d3Njd3d2RUQy9pR2tPWkdzUnlIaE1NZHZyS1BxS0lVdDVT?=
 =?utf-8?B?Zy9JOE15T1NYcTRncTY0MkVTY3VhODBhTURmZCtJeVNJdktVeUJucVJENThw?=
 =?utf-8?B?Y1d0QndrdUhBc0RIaWlJdzRhMEFGaVRubDVhYXVKR2xNTEs0RnRRNS8yOEFo?=
 =?utf-8?B?RHVmRFBJV2VHTkRrNGs0dmVXNFZ4c216NlUwdmpuREZWMDVKb0ZhbmlpQmxN?=
 =?utf-8?B?eVNoSGZqM1lhT2xHOXJZWkwvUTloZnF3Rm1QMWxPTldkWm5yVFJpamlNZTdI?=
 =?utf-8?B?NUJ6M1pmMHROMi82ZGFCUGE0NTZ5Nkk3aVRpc0swVzllQ1UyNnVVd005VzZ1?=
 =?utf-8?B?SzRocWRzWVZJdGgxS1lEQnBlQ1h4NFZMVG1ob0dOVHE3TCsyM05wSG40UVZG?=
 =?utf-8?B?aUZJZWdKSmFnM1RucThRVXJyMk9TcWFMRThPSHVwcU1aUE1OUEwycEY0bjdJ?=
 =?utf-8?B?dUljYUE1Q3lsVENxVThwb3UrV2JlSnkrM2IwTVlzL0ZWQkYyWGJScFRKNzFQ?=
 =?utf-8?B?YXhLT1hPaURJaEIzOE8wZnJIUENSbitLdHhpYmRsYlR1OUxESlZjL2dpOFEx?=
 =?utf-8?B?MU1rSmdmYmo3SVFHOWZMRldyUUQ3dG5KT2FDY3ZVTEtNRno3ZVhFR1FYQWZ2?=
 =?utf-8?B?Ny9tbk5XSDY1SGlXQURWdHc3MEl6YkEvK1h6Z2FwZUFpOGkrZ0xjWWtJM2d3?=
 =?utf-8?Q?UoHe/GI2kE5u1sn8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d539a374-6792-4c16-fa87-08df0e616f45
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 10:59:35.3383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9WPvLMtLcc0v9oILr6rCQRuIn7Hub+4fvh8+fXutjFapSbNOP9bWmpF2pOjUJhjUrrI7C5PtYSOBsijN9ZGjYrOhFag1SH3M7pL6N7/fLwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB017780
X-purgate-ID: tlsNG-d25034/1788951579-032D8A5B-15B303F9/0/0
X-purgate-type: clean
X-purgate-size: 3995

On 9/4/26 4:15 PM, Roger Pau Monné wrote:
> On Fri, Sep 04, 2026 at 03:15:15PM +0100, Ross Lagerwall wrote:
>> In direct mode, the timer asserts an interrupt on expiration rather than
>> using a SynIC message. It is useful to implement this since Windows 11's
>> Hyper-V can only use synthetic timers in direct mode.
>>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> ---
>>
>> In v2:
>>
>> * Handle migration from older Xen by introducing a new Viridian flag.
>> * Added more sanity checks during MSR write and vCPU context load.
>>
>>   xen/arch/x86/hvm/viridian/time.c     | 46 ++++++++++++++++++++++++----
>>   xen/arch/x86/hvm/viridian/viridian.c |  3 ++
>>   xen/include/public/hvm/params.h      |  7 ++++-
>>   3 files changed, 49 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/viridian/time.c b/xen/arch/x86/hvm/viridian/time.c
>> index 082528dc9416..4c8352612b19 100644
>> --- a/xen/arch/x86/hvm/viridian/time.c
>> +++ b/xen/arch/x86/hvm/viridian/time.c
>> @@ -223,6 +223,14 @@ static void start_stimer(struct viridian_stimer *vs)
>>       set_timer(&vs->timer, timeout + NOW());
>>   }
>>   
>> +static void stimer_deliver_direct(struct vcpu *v, const struct viridian_stimer *vs)
>> +{
>> +    struct vlapic *vlapic = vcpu_vlapic(v);
>> +
>> +    if ( vlapic_enabled(vlapic) )
>> +        vlapic_set_irq(vlapic, vs->config.apic_vector, 0);
>> +}
>> +
>>   static void poll_stimer(struct vcpu *v, unsigned int stimerx)
>>   {
>>       struct viridian_vcpu *vv = v->arch.hvm.viridian;
>> @@ -242,9 +250,11 @@ static void poll_stimer(struct vcpu *v, unsigned int stimerx)
>>       if ( !test_bit(stimerx, &vv->stimer_pending) )
>>           return;
>>   
>> -    if ( !viridian_synic_deliver_timer_msg(v, vs->config.sintx,
>> -                                           stimerx, vs->expiration,
>> -                                           time_ref_count(v->domain)) )
>> +    if ( vs->config.direct_mode )
>> +        stimer_deliver_direct(v, vs);
>> +    else if ( !viridian_synic_deliver_timer_msg(v, vs->config.sintx,
>> +                                                stimerx, vs->expiration,
>> +                                                time_ref_count(v->domain)) )
>>           return;
>>   
>>       clear_bit(stimerx, &vv->stimer_pending);
>> @@ -361,6 +371,7 @@ int viridian_time_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>>       case HV_X64_MSR_STIMER2_CONFIG:
>>       case HV_X64_MSR_STIMER3_CONFIG:
>>       {
>> +        union hv_stimer_config new;
>>           unsigned int stimerx = (idx - HV_X64_MSR_STIMER0_CONFIG) / 2;
>>           struct viridian_stimer *vs =
>>               &array_access_nospec(vv->stimer, stimerx);
>> @@ -368,11 +379,18 @@ int viridian_time_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>>           if ( !(viridian_feature_mask(d) & HVMPV_stimer) )
>>               return X86EMUL_EXCEPTION;
>>   
>> +        new.as_uint64 = val;
>> +        if ( new.direct_mode &&
>> +             !(viridian_feature_mask(d) & HVMPV_stimer_direct) )
>> +            return X86EMUL_EXCEPTION;
> 
> Do we know whether native HyperV also injects a #GP in case of setting
> reserved bits on the register?

I did some investigation into Hyper-V's behaviour (W11 26H1) since the spec
doesn't say anything about it:

Reserved bits set                  => GP fault
Direct=1 SINTx=any ApicVector<16   => GP fault
Direct=1 SINTx=any ApicVector=any  => SINTx appears to be ignored
Direct=0 SINTx=any ApicVector>0    => GP fault
Direct=0 SINTx=0   ApicVector=0    => sets Enabled=0

I'll update the patch accordingly.

> 
> To keep the previous behavior, should Xen silently ignore the setting
> when not supported, like it did in the past?

OK. Unless someone objects, I'll still perform the new checks for reserved bits
and the ApicVector set while Direct=0 case even if the stimer_direct flag is
not present.

Ross

