Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA901C61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 07:51:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406498.1639773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x22EP-000335-0S; Thu, 03 Sep 2026 07:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406498.1639773; Thu, 03 Sep 2026 07:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x22EO-00032y-Ts; Thu, 03 Sep 2026 07:51:32 +0000
Received: by outflank-mailman (input) for mailman id 1406498;
 Thu, 03 Sep 2026 07:51:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x22EM-00032s-Qo
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 07:51:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x22EL-0000j7-O2
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 09:51:29 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9926f5-bab6-0a2a0a5309dd-0a2a4506ee08-36
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 09:51:29 +0200
Received: from [52.101.56.63]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a992700-195a-0a2a45060019-3465383f6efa-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 09:51:29 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA3PR03MB8382.namprd03.prod.outlook.com (2603:10b6:208:543::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 07:51:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 07:51:21 +0000
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
 b=o2F90/QDjJkSAhdFfghd9rpeY5JyacYXDcdft4UZeC8SmuYoQdvvEYfC1kx790EfvTelhlBrDY4Mt587s911cvG6npRTQS6w6QPXrlPa3JlvMTQ7OZ/WDSljTWv/l1BlP2z2QOWIv8k23pI87EjYYMMn9r8+JiM9n4y1zyt1ClPt0mVX8iG51h3SQJs8ZmsD3gDXul8nLM9DKcV0+gvQxxUJ6VTc4FpeRz3ekW/+wNegz7ieCJTx9fKRSjGloiRT9jnTNJbZcmWcD9GkVZJj5TKfcM7666ZTQvNUbSpczOcPps6XfDnhioDUhxuwRwsv9NOxJHrWlFptuew8gUxtlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6GLLnjFy57QuSNuF7gsV5nIdnnh7ky4B6dEbMdTEDg=;
 b=p5O/thwTYVIL2dsntsvIAMLjJkQEoBd2Vx0Xb2PUTojnQDvFiNPKA4R/WVCxsoYVXQExInKAKU5ELbRsiNkZnLoAF29l7IGExbetCTV2U5VTnZYrKLMKWn18GmaMorAeO94f8tL+SZjMrMVhkL7Sp145+NQdkoQuaPjqWXoqOiFHK8cJcYD2iOJCCYbKmIUi18tfR4M/qndz3zcMv3oQTYNTQ5QB1xRXR7M69X4oUF7+hognM5hu/Y4d4GivQqiRUL5TU6xhlB/2OTdeRHSZEOhV/XqWM3Em2niY6nzYBzeOeW6cuINKCkFkofp1WYCe/VzAYxA/6NhE7oBH5EeYuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6GLLnjFy57QuSNuF7gsV5nIdnnh7ky4B6dEbMdTEDg=;
 b=tVSNk+kRMVdTx7/P1IQA/Tf6Dy/k2eS9UHlNxZrSHMgCsV8AKTe1bywjO+4O9k/L7tLmNOGTi8zQZzIw4sZHZcdFG5/gVclOd+vBfJhqRVfXNl0V2xx/neLo4QbBhqc6cg72dXTKo0cHv2QXPmRim4maQfyXZeUokaZPOFPoxYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <76f8b54c-1e1c-4ea4-baeb-43d7b7996746@citrix.com>
Date: Thu, 3 Sep 2026 08:51:18 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/ucode: Work around Granite Rapids erraturm GNR98
To: Jan Beulich <jbeulich@suse.com>
References: <20260902221000.2967167-1-andrew.cooper3@citrix.com>
 <624b7832-873b-46a7-b1a8-9e7c20f45c07@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <624b7832-873b-46a7-b1a8-9e7c20f45c07@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA3PR03MB8382:EE_
X-MS-Office365-Filtering-Correlation-Id: 8677eeb9-8342-4748-f5c9-08df099024f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|3023799007|56012099006|4143699003|5023799004|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UsldZzWx2gbL1VCv4BXPpOPrNApKkz9hOq3jjE4dv7xm9EIpSFBVYYOUsf8aJXRRy7cTenO9s7Eeicunygc5l+ccdpVK6g6d+e3x6ygj/AiHk5WW0jCxWLWIX3vjnad+5tOM9udPGO4Iz/2o8ZndF0njsGlXesPRsTaPLNoYE/IdibutHL92oTtRLG+nMJfDsaQaC7etCpTHttmlLEeHksBemRFCHYfFkMidJK72dPst3wQ1VTGh3ppUPq06pybNpcGTTNdx22cBq5K4t5Hyf+ocLUNcYA2I5lD0CQjS8VlwD+pCod/PHfS9y70HOTf3ReaWyky8xVBvO3lpMwIFRwzLji6yLzPhUc9YSYnP3nJBhKPxMeWee8SplBzqdIoQyuX1yOasyyGAoqZGMl0Tosm6jGwrfrydsF/bzP4tO0e1m+cGw4t2NYf1paxup4g+COi/W8cDSpqEWPR0NjnjYoTh59oJIuKE/5B9CWuAYu1HSZYZqw+DTIYmunyGgCnli/Zr8VUtrOu8R2cpfNgBADzKBfGmUY+2kHpiFmdshI2IjPG84VzG+MW35jx621GgAHioVYKMPaLrHl5ro7TAAY1jYgLIvTj757i6NS4pkniQgFaxBzzjB/+2LOS7VdZoU2oS20Stg8LBKeQOHAOSt4Nt6+7WvRojhmexZBaiRIU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(3023799007)(56012099006)(4143699003)(5023799004)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1kxdUM2bEdrUlpka1Y1VDViU2NReGtWWVRmY1FYQkdZNUFkZzBhTmNvMkxJ?=
 =?utf-8?B?MTdMclRIKzVmeGJUczliOGlsS0FlWm44UElJM3QzbzdqZHp6MitkbTVpbVJF?=
 =?utf-8?B?M3JzNkpRYjdXajZKcEVWVkF5c2hzUGJtdUk4VHdxdGpLNXErWUhHK2FJZ2Q1?=
 =?utf-8?B?dmZ3cWlVZ1hqc2pjVVpvQ3dsN2ZZb0JiY1d5b25BZStsMWgrMHNXK20xNmtp?=
 =?utf-8?B?alY0TTV6REkxWkttT2pRVmFJL2h4UldBS0MxWjFPckNWakdZN0RhR1BWTGVR?=
 =?utf-8?B?andOZVZJdkpiUWtOVVYxU3haTEtxRG5Tck45YUdXNUZVY1NhZU82cGtGREpq?=
 =?utf-8?B?YmpOS0FwcDJ6djBqZkRjY0J5a2JreWRueVcvd3pMUllLWTFWK25TSDhHNTF4?=
 =?utf-8?B?WmVGUmZpbGxselZkUE92UERKSTFVUVpmL0VQdE5RUW5QTXZiWUZmNG0zYWxX?=
 =?utf-8?B?czV6TkFPMmhvL0dKVTh3RUR5MnYwRGN6Q2hpUzBzWXpJWlpNZHViczRtQkU5?=
 =?utf-8?B?OTJCelBnNXRRb3MzWFZUUzFoTGFqT0NoVkRTK3A0aFZuZUQ1emJ0MkxNcCtS?=
 =?utf-8?B?Sm83Qzkyd2Z3OHZ4bDJvS1Q1WVVmU1JBeHNNNGxzWTBSbzUxSlY1SytFeTVN?=
 =?utf-8?B?clZlaFZmaituYW8ybzFpUkt5a0hmTzRiMFVCU05FK1cxZzZlbFpQNGMwRjVt?=
 =?utf-8?B?M3kxTTVGU1czTi9RN0FSMmJMOVczYUIwQzNuOVlPMUZ1ZVBEWWYvQ2dpSkx5?=
 =?utf-8?B?OVp3ZkUrV3dwR2JvY1hDc0c0a2ovVXVmSUFxb0lJYWJ5eCtLQW5PeDB2d003?=
 =?utf-8?B?QzZRYjNSdXJ1V2tRMUs4U251SE5COXlzVjBOUkRuMGVrdWNDRVRyeGg0WnZX?=
 =?utf-8?B?TVAxUldPM0tlR3VKRzBsWDVWWTZwbVVDM0p1UGVYdGJHWFZZdVVPczcrV2tL?=
 =?utf-8?B?THdML09ZZnQvejZtLzRwZlFWclYzakJHa0NIWTJnbGx2SUV0dkN6YjZvamJP?=
 =?utf-8?B?MFpxa3JYYUxVNzJ1cUVUcXBHNzR3QXBNS2lXWkhSM1FjcG1KYnFJc1dkSlVE?=
 =?utf-8?B?dmhWcG90bG1FNWpxVHpYaFZWaWVmWTZCM1hUOExOYXdxU3pDMG9nb3F1bGEy?=
 =?utf-8?B?ek80UUVRRTE2RGZ6bnEySXBFSGZqTmF3WDJJZFV1SmdFeldNMUZxNExvSUVY?=
 =?utf-8?B?K1p6ZVQ5MzhhR3lRUWRtSHpMeVlZZGtKSlNMeVd1MnhEZ2d2Q2lUOTBiZW9Q?=
 =?utf-8?B?bWhCQzI5VVFEUXlFWjBzS2tZNXpFVlRMODBRUTE0YlNhVkNrNlRtNzQrcHdw?=
 =?utf-8?B?VkE5T2w1Qm1wMnNKcnRUbWtTek00dERNVEFyc0hEVU9BVnNMOW5OaGJUZHU2?=
 =?utf-8?B?T25lb1J3UStCWkF2QWRRR25kQ0ZnaS9WV3N0RzB5YW0wRGo1TFlYNFg5QjNp?=
 =?utf-8?B?ZjA1UkdadjVpQ0IrN2Q1eko2OVpXS3NpY1luWld6djI1MVFPZGFJc0duL09S?=
 =?utf-8?B?SkZjL2xoMkhrMC84R2NDcWsvMitldkZFUjZqeGM4dFhDQnJpSS9TWUVQWFZH?=
 =?utf-8?B?YURNTjhaNkxKaEFmL2o0ak1SZGJsMjRtVkkxZ25KQTFWazhobWpaTmNFT2dV?=
 =?utf-8?B?akdtY0ZCUnArMGRFNHUzM1Rpd0RCMFRHeVFDRlZKVEdoTUR0ZWdLNURMeDk4?=
 =?utf-8?B?R0lDaHUrdFZqN3hsZFBUckdXV0xnV0dCTVR1aGo3dU5VaUtkK05sSWx1Wmc4?=
 =?utf-8?B?OXlBZ1hUOVV0aHlCbThUQzJVUDFMdzRUMVFHaHlMamd4ZUR4SzJJWncvU2x0?=
 =?utf-8?B?Tkt4ZHF3RDhSRy81K3FJQnNsMFlWTCs0MThEdVdpWHIxNnpXTEhBYlM5aUw2?=
 =?utf-8?B?MjhEdm44Mnc0WVgyMWFPR05Ka0YyanBQZmp6VFNqS1JxcXBoeGJPQkxvZjhq?=
 =?utf-8?B?UDhJd1lleG5qdCtyOWpwcER2dEJzYjJKRS9PNEw3VklSckcrWVdna3R0N1lS?=
 =?utf-8?B?UEt6ZWdRb2ErNWFiR2lVa1IvcUVvZEtIamF5SlBtSFZrOWUwaG9qdVpqQnZ4?=
 =?utf-8?B?QWhMRUprams4OTJYVjU5U2pGRVIrV2h0VTBoZHFwMnRKazBNWWhxYStrRFYr?=
 =?utf-8?B?VTgyamlXZ2pabmlpWUN5NlN1VkljUE1JRXZiYXcvVXBac243SGZRZWxtbjAr?=
 =?utf-8?B?bHFaKy9lMjdOb2tRMXkxcFE2cS9xaDYvN0E2d0NpRG81aTJGS2QwaXZ3ZjU4?=
 =?utf-8?B?Qlo3SC9Rbnc0MFdpK2xjeEFmMDZHYmxRaGZDZmFMcUNEQWYydlZINnNvZnBM?=
 =?utf-8?B?Z3VKUDA1SUNwemVKM0ErZWV4Z2ZJUllJZlkzK3hxUHNoTk93Yjhkdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8677eeb9-8342-4748-f5c9-08df099024f7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:51:21.1476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kR8DlRcuNZLP/k+Ov8nf+MEUd8rsSQzOV5XxhRO+Dn3znUHSGjDQ3v4dIyYFT4pN99hetU58Dx3ZafKrAZOpDoE9o+pTJeLuEMMczo0B94c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8382
X-purgate-ID: tlsNG-16d1c6/1788421889-FE47377B-EDD0B86A/0/0
X-purgate-type: clean
X-purgate-size: 2137

On 03/09/2026 7:41 am, Jan Beulich wrote:
> On 03.09.2026 00:10, Andrew Cooper wrote:
>> @@ -273,6 +274,35 @@ static bool microcode_fits_cpu(const struct microcode_patch *mc)
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
>> +    if ( cpu_sig->rev < 0 || mc->rev < 0 )
>> +        return true;
>> +
>> +    /*
>> +     * GNR98.  Granite Rapids systems hang when loading new ucode on
>> +     * sufficiently old firmware.
>> +     */
>> +    if ( boot_cpu_data.vfm == INTEL_GRANITERAPIDS_X &&
>> +         boot_cpu_data.stepping == 1 && (cpu_sig->pf & 0x95) &&
>> +         cpu_sig->rev < 0x01000405 &&
>> +         mc->rev      > 0x01000405 )
> The erratum text says "to 0x1000405 or later". Question is whether that's correct,
> as it would mean that it's impossible to update from earlier than 0x1000405. Then
> the workaround text says exactly this.

"Correct" is complicated.

The text is technically correct when considering all pre-production
microcode that Intel had during development.  It is not correct for
production systems where OEMs followed instruction about which first
version to use.  Specifically, 0x01000405 does load safely on the first
production-certified firmware.

Critically, >= breaks the aforementioned "more complete solution" (which
can safely load up to latest even on old firmware) where I'm still
waiting on Intel to adjust the blobs in the ucode repository.

>> +    {
>> +        printk_once(XENLOG_WARNING
>> +                    "microcode: Granite Rapids erratum GNR98 detected.  Skipping ucode 0x%08x\n"
>> +                    "microcode: Firmware update recommended\n", mc->rev);
>> +        return false;
> Should we additionally taint the system?

Why?  We've done nothing to make it potentially unstable/problematic.

~Andrew

