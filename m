Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06EBC61DD6
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 12:41:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408469.1641029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2TE1-0001GQ-4Y; Fri, 04 Sep 2026 12:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408469.1641029; Fri, 04 Sep 2026 12:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2TE1-0001GJ-1j; Fri, 04 Sep 2026 12:40:57 +0000
Received: by outflank-mailman (input) for mailman id 1408469;
 Fri, 04 Sep 2026 12:40:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x2TDz-0001Ft-Ok
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 12:40:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2TDz-00E9iw-56
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 14:40:55 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9abc56-e002-0a2a0a5209dd-0a2a450cc620-8
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 14:40:55 +0200
Received: from [52.101.85.44]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9abc51-f479-0a2a450c0019-3465552ca32b-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 14:40:53 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SJ0PR03MB6616.namprd03.prod.outlook.com (2603:10b6:a03:389::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 12:40:44 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 12:40:42 +0000
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
 b=L1/sHFfD0dFVDIsc/0+z5kgENWb3b43gM7hldhRgAqrUKeG2j81RW1YPx7y71MWsVwGJe7bqVRPL2CEzuURQ59/cZoQmV5xeyI7znvHm02I7NV98CfO0zGxKtCGvSACRIqK4Llnw6X55TT74Y9CrTPzv1GcnUBuREpIe62tYaUwP1zae5TFrGWdErtRCt11k2SB4UZof7c36pb7C1bQXUDekAMla/8UI4OQmd7PyNOVoIaANFNr9bpvO/qXO/DceUzlmRS1oabHgb0KFCKDx67Vge2SFMkDpVNAV5E8c/HUqaVurcZwoh+YqbmERjszqadjJrIq59R3ExR9dmSqAxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTyGvNtPrZrovxMyhWZqvh1nAydJSiP93/UkRdaZr4A=;
 b=Dnk6zXgjyHo5f+UkPJ3jWaW1JAITyd9KpsPcB9sWxWxCfvTI47ZwlWmgFBGQ0kSLScoDeUZgEIviMa0t5y6pAgMhuzYvREJZC+boLlWHpYGDPMhn1L2cd9uMCOzCbJlNRqCHtV0y592nb6/XSX1IjF6OwYQOUUbLJiG7kryPFCRH46b0a2/M0iDPcrNOp8gi91FSB4qLzx/rGibw95iSQhxKGe0YRkU38INy2T6DkCWFaCWxX+Ruz/z6UvJU73nXNyS+571ENFNwS0lDILUfHrTP7FCDOUoW2RKHaXDkhaMA0sAc62tUngnifo9KVU69igxw9D515HHfmYfvoiAWow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTyGvNtPrZrovxMyhWZqvh1nAydJSiP93/UkRdaZr4A=;
 b=WXIVl9tNc7Ih2NgrryQysiPFCOrp+jkTi+H25eVPIjpbRxJhd03YXc9As00wvzmLvWJ1m+zzxYv2TT6gFNKwzk4Ueee0f9x3o8MXxfiBRVUcJLAgX+Fk7gizg1K7SRdsgtQ0xMhc5Q8wHS1GEMp6Qt/Di25GAbbKmuFlbF+TCvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2d73442b-481d-44d1-b195-41da0efc23b8@citrix.com>
Date: Fri, 4 Sep 2026 13:40:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] x86/viridian: Implement synthetic timer direct
 mode
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260828131142.3986110-1-ross.lagerwall@citrix.com>
 <20260828131142.3986110-3-ross.lagerwall@citrix.com>
 <1279a949-6b18-4943-9d7f-046dec98e681@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <1279a949-6b18-4943-9d7f-046dec98e681@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0227.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::13) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SJ0PR03MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3b9476-a10e-470b-c675-08df0a81bbbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|5023799004|4143699003|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MuxxDDNxOZ6ak24y334aTHqQh3S88I2u8WoeZX2TneOAPE/b2KtTAnvnJcwzvHM6r3vOGF8uchBCeTHyoZDKS/F3+1y2KtrjtQ0NNAx1WtLoyqFQc4k6ml9a1FfSgTTKdks+UHzYqcPbkngz7xYmLwSSw+vZciBbyy60hRQv69uLmbsmXRSJ0nYRc72zufvXKk365uKcFtTy9JMnEd8KdH1csCTeOQl/BR3Goo0ODfhziEFDK3qW28ZW6t/78qNHQCiVjWkNPSC6g35TUXWbXXXNkd2uZZZisocoZ+ltA9UZBup0CoUht06hkPlrDYp4/Qozg4HyuDLkkamimVS1yp9P0obxYCOIvtSyXKd2HYt9LdjnfB6BpSYfapj269i/mo8aVunAEYy2+Wj6xPRUcCmzp0CM2kStqC242Ahdq40HUFp5ZKyBZesywC1lAtkyFeeeUaRI7pEzJ91Hv2t3VqLIfSV89oQ4fSVlQrS/qQjk2vaPgT0eeyv8Yx6rOjKQbP9u8WStkJuKud8hl503gq1hqtginpRHNd9mq5MSHAFi7eEMnKYboKdb7BuYCsN0h42dA8l67Z+oML3EpgYDj6oqIZFf2qfI7EN1xfi2d5x2x8/psNbgTyJ4BBEf1Qcr4w/gjDejj7G8nTImfjZe64CoPmo0IGYMAsSSD07ZHYY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnJadXdXejRKWHVhS2g0aWJoWkIvR3lwVzdxUEVCMGhXODZDdG5ZR0pmMjlo?=
 =?utf-8?B?TDJYSXJNcDNWZ1QyZFY0OVhUbzJZYVVYQ0dLKzkvL1NNZVdPN2xHYndDOTlo?=
 =?utf-8?B?dzhmVUg3SmpuYzlEOEZNeE0vTHVQU3BRTVhiWTRnaUgvTUozNFEyamtMVzhw?=
 =?utf-8?B?TXowZVVURTRVdmIrRnBPV1I2U3dWQzFEbm44ZkkyWnQxYmw3RENUTlkvOE9O?=
 =?utf-8?B?NkpTTW1MeW43ZWcxK1FGR3g0ZHQxOGU0NWU4d1ErdGxzYi9USnozRjNpVXN2?=
 =?utf-8?B?QmZ5TndYUkI3NGNLRnhjR0k1d3dOSXJRZkVaamZvMSs2M25vNjVRMDlLY3RJ?=
 =?utf-8?B?YXFCaGpXOW14Q0V1cmxnWElZcHpCVGp2Tm1YYzlYZkZJTE5uZ3dScklNb25B?=
 =?utf-8?B?bmtxczFqRjJtOHRDdDlWS0ZuMnJYYnZScUx4MldHWG1Ra0ZTVys5Q2JoQThM?=
 =?utf-8?B?ckEwRVRZejQ0OUZ2RkQvcG5EK1crRWJjN3BSSDFaK3pQQXdrUDYyeUIxTmZF?=
 =?utf-8?B?RzNmdkN6aWF5K1NSYjJKSUp4VjEyNmhpM2dCVERjbjdId3l2WGxYUm5iRm5X?=
 =?utf-8?B?YkFyWmhBbnQ1akhsS0lVRUl6ODJYa2t1d1Z4QnRLc2JoMTJxRVJaMnpwTVNB?=
 =?utf-8?B?dXNTaXQyMEROSzlVU08xS2pIREx2UXg4Ky84MGdVTHJ6QUVBdlZ2OWpURnBv?=
 =?utf-8?B?YzRzdXZHNEU5KzlNbE1sbG51VWhVeEJZRlNLQVNGU3lkakVoUVI2STIxU2N3?=
 =?utf-8?B?MGI3Q0hGUG5HeDBjcEYwVWlnRFN3d3poQ2dKYlREdEcwNDVsOVdnb0JRWENs?=
 =?utf-8?B?a2ZsUUdCQlQyZHN1TEpMWFZZTjdFbmFROEFNQmgwQ1V2clpnOXNOa2RiOFNI?=
 =?utf-8?B?Nkp0cmNBK2YwZlBvRFdFMndCSWxnRUFISkNOTllWMWUxcy83UTZ0b2dKSDdy?=
 =?utf-8?B?dE5Vc2NCSU9odnptV2tLeFVOanJ3RWlISSs5KzBIUFJhMjJHNmtDZ2Q2a2p0?=
 =?utf-8?B?elJoVlFHT2pxaTI0NGlBelFIeGZUYk5wbUppWjZlc2FFbVBabWZFY1BXaU9h?=
 =?utf-8?B?clR2b1B3S0lHTHRaWmlva2hzQ21MMDMzTjdPNWVKbUwvTjAvbEU3NDFOdUFx?=
 =?utf-8?B?NVhJYTZnMjRwNHlONmRweXNyWlBhd3oydEh5MVJsd1FyUTlVeTNCa0l2b0ZK?=
 =?utf-8?B?cU8yL2REVklPMjNiYVY3QWRyWXhFYy8zMVdVckQvWlZIWHRoOThSaldjMWpt?=
 =?utf-8?B?QUxHWTB2b3kvTFU4MjhUbkI5RmlOU1Z1bXEwb1F2QWhkS1VCaEEwQ1VBdmZw?=
 =?utf-8?B?Q3hhUDVDOGZ6ZTV4dFlDMm54MFpFL0xJUk40K25xQ0FhNmczdTlkTDhScUVV?=
 =?utf-8?B?aXhFNGgyaVpWREU3MThtUDJ0ZThwRndESlROQ0E4ODZ4ckdPQXRGcFZFemFh?=
 =?utf-8?B?QmpvMERoL3BkeDQwaHFFYmVsd3Z1Z3B0aW9oaGlzVHR6cGFaSWtFRnAzMWh6?=
 =?utf-8?B?blp5eHlVRHg3SVBoc0Fkc1J3MFVxYVRMV0NrZlk1T0loalhSQzZoeDhwS1JL?=
 =?utf-8?B?eVFiQ3hoQXFhem9JWU1QOTJQbm95NmlNT1o1Sm5PTk12Rjlpa3F2dkFiU09o?=
 =?utf-8?B?Z3phMlVqQWJuKzVPOXo0eGw0clFTK3FNNDViME4yR29FRlROOGVEdGZXR05E?=
 =?utf-8?B?bjJGdkhDUkNoMkQ5bGgvUklBZlBNTEpob3NHck9DZ2hLdGwya1FEY1IrUUV4?=
 =?utf-8?B?TGpQSExFQmRvOWoxZ3MyMml2SmNHSjFCemN1Uno3WVEyVmtRVmtBb3pocmV4?=
 =?utf-8?B?ZEZvWlhiUkI0QzNjVmFTZHlwK05wc2Y0NFh4MnBUZEs3RmNnMEQ0NUNKSXhJ?=
 =?utf-8?B?cUhvQWJFWmIvRXJWQ2x6SlNMSkx2ZndWUkg1N3VwelozNm5ycjRJcGZpd1By?=
 =?utf-8?B?SlA0Uzg5cVBZeW1OQjR2U2dEZWtINEVvalc3Ry82Zm0wU2pqRFNzQU5ZQktV?=
 =?utf-8?B?MmxDUlk1ZDlJZmRYaG9pekhLcytyNVBnZTZaZWVIZnVtVDJyTXRnTUc0Z2wx?=
 =?utf-8?B?N1E0QVpGa2VZUkJpSzhqSFVPcFBLaVRsdnF2NVhncDBrUGdSdGk5dUFWdEY3?=
 =?utf-8?B?RVd1QzIvZnJ4ZjJJR0lNWHpYcDJjUnNmcnlrQXN4SEw1Y2dzazBLQ3hQQnFr?=
 =?utf-8?B?VklwaEQxM200djFTNW1JVFBISmxRU3lxN3pKM2N0QlhPNmlPanNMeHFFdVF3?=
 =?utf-8?B?bUVvZmtPS093NXlwUnQrWEIyMTZiNXZtNkJZOERvNGVtbXl0cEF0cGlWanBX?=
 =?utf-8?B?emRvMTV4WDZzeUFvK2tLcGpGZmpORHE1SzlSM2dvRlpvaEFjK2ZSKzBLMXpS?=
 =?utf-8?Q?b0WN8diSBAwkBiXg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3b9476-a10e-470b-c675-08df0a81bbbd
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 12:40:42.8211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIP3oRtQb2BfqQHj3YKbnDW2d27C5Yb7yx/82CYyKRj9wlgsptX0ryun2879BTLeCL9vbTmMjc1k6vDGjkpBHTfPRlPW1ydjaEB2PslBthc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6616
X-purgate-ID: tlsNG-d25034/1788525653-02EDAA5B-F1A57703/0/0
X-purgate-type: clean
X-purgate-size: 3742

On 9/3/26 12:12 PM, Jan Beulich wrote:
> On 28.08.2026 15:11, Ross Lagerwall wrote:
>> In direct mode, the timer asserts an interrupt on expiration rather than
>> using a SynIC message. It is useful to implement this since Windows 11's
>> Hyper-V can only use synthetic timers in direct mode.
>>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> ---
>>
>> Should this use a new Viridian feature bit or is it OK to use the
>> existing stimer bit?
> 
> Not sure there. What you need to deal with though are migration related
> aspects:
> - A migrating-in guest should not suddenly see the CPUID bit set when it was
>    clear before.
> - As so far we don't even reject the .direct_mode bit to be set, it being set
>    in any of the MSRs of an incoming, unaware guest needs to be taken care of
>    (the guest must not suddenly get interrupts at the encoded .apic_vector).
> Dealing with this may actually be easier with a new feature bit added.

OK, I'll add a new feature bit to handle this.

> 
>> --- a/xen/arch/x86/hvm/viridian/time.c
>> +++ b/xen/arch/x86/hvm/viridian/time.c
>> @@ -223,6 +223,14 @@ static void start_stimer(struct viridian_stimer *vs)
>>       set_timer(&vs->timer, timeout + NOW());
>>   }
>>   
>> +static void stimer_deliver_direct(struct vcpu *v, struct viridian_stimer *vs)
> 
> Second parameter can be pointer-to-const.
> 
>> +{
>> +    struct vlapic *vlapic = vcpu_vlapic(v);
>> +
>> +    if ( vlapic_enabled(vlapic) )
>> +        vlapic_set_irq(vcpu_vlapic(v), vs->config.apic_vector, 0);
> 
> Before you use the vector, you will want to check its validity (along the lines
> of the check that patch 1 aims to avoid in a special case). Whether that needs
> doing at the time the MSR is written by the guest or at the call site I don't
> know: The (oldish) spec I'm looking at doesn't talk about validation of values
> written at all.
> 
> Also please don't re-invoke vcpu_vlapic() when you have already latched its
> result in a local variable.
> 
>> @@ -372,7 +382,7 @@ int viridian_time_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>>   
>>           vs->config.as_uint64 = val;
>>   
>> -        if ( !vs->config.sintx || !vs->count )
>> +        if ( (!vs->config.direct_mode && !vs->config.sintx) || !vs->count )
>>               vs->config.enable = 0;
>>   
>>           if ( vs->config.enable )
>> @@ -583,8 +593,11 @@ void viridian_time_load_vcpu_ctxt(
>>   
>>           vs->config.as_uint64 = ctxt->stimer_config_msr[i];
>>           vs->count = ctxt->stimer_count_msr[i];
>> -        if ( !vs->config.sintx || !vs->count )
>> -            /* Reject enabling with a zero sintx or count fields. */
>> +        if ( (!vs->config.direct_mode && !vs->config.sintx) || !vs->count )
>> +            /*
>> +             * Reject enabling with a zero sintx (if not using direct mode) or
>> +             * zero count field.
>> +             */
>>               vs->config.enable = 0;
>>       }
>>   }
> Related to possible validation needs: Is it perhaps also required that .sintx
> be clear when .direct_mode is set?
> 

The relevant part from the most recent published version of the spec [1] says:

"""
It is not permitted to set the SINTx field to zero for an enabled timer (that
is not in direct mode). If attempted, the timer will be marked disabled (that
is, bit 0 cleared) immediately.
"""

It doesn't say anything about validating the APIC vector or disallowing other
combinations of input. However, it seems sensible to do that so I will, with
the same behaviour of disabling the timer on failure.

[1] https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/tlfs/timers

Ross

