Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA4CC5DF81
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 15:09:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396672.1634421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx4OK-0002k2-Ku; Thu, 20 Aug 2026 15:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396672.1634421; Thu, 20 Aug 2026 15:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx4OK-0002jv-I4; Thu, 20 Aug 2026 15:09:16 +0000
Received: by outflank-mailman (input) for mailman id 1396672;
 Thu, 20 Aug 2026 15:09:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wx4OI-0002jp-JI
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 15:09:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx4OH-004NgU-Rv
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 17:09:13 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a871891-8faa-0a2a0a5109dd-0a2a4502a652-20
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 17:09:13 +0200
Received: from [40.107.200.36]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a871898-6ca4-0a2a45020019-286bc824f783-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 17:09:13 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6473.namprd03.prod.outlook.com (2603:10b6:303:120::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 20 Aug
 2026 15:09:08 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 15:09:08 +0000
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
 b=lN5GpbMLGHJFQPxQhgKEODHo3SDBhxfcFmdSmJ7X54aCPgalg6Y5UMQVsEZlon1rrVUaKmOFr7bAgXEGRldO4P70JwuaAV1knLo8ZD6gQRlGw7gSaVEGn+Lt+40t3xvkCl6WazlMYEi8bO5QC0+1iJtPuJo5wLFFfMJOgJba7krBrUgnYhAoQT5DY3heeHhdTdoKreT6bKU3oL/ZreJVOftbgoSPWodHJwWWTQt6/uFajaN/1zinXdoNDBuM5WPgfB4caEAMUpPgHfQ72jip8DdNWvegereN2WuWDHoiUoIUnFf76HolnumT+8vGuSSXjfSt3e4nDRMEFS/SjBFwOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpvuoUaSYhmUHpOYB7wjRy7wb/MJXEAjKPYiufdKG9Q=;
 b=d/YSvznqn8sp7cAt8x/cKoYyNGyPFIoPTJquNyGHMPVD2K/EYJmaWCpdMBJDwJBrek4k1LBX4ravkM0kBiuWDgVsf9vJ2B169xKwzIeuRy2JTYgqX1FPxbSwl1iqZ0UrTPYdcztXqUhjigQKtGAp9B0WT0ttiDtj8qWOVmcbxyOwxnmMvXewYQfO14QZKoolQYzkRtjg433Wjpill8MvCMu5iSnQTi86uVjMxUl7FthINrzuxuI7719aofqBdx43chyUk5UmCzVQyCzmejED5NVpAsyEZI+r1uvkj+ld5zNE7WNTO8FBTWMZvdvnlwuhZKJrErFhcicXQ8BvYSeyIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpvuoUaSYhmUHpOYB7wjRy7wb/MJXEAjKPYiufdKG9Q=;
 b=kqjLlylRJ9VEUqUV2Fhxskapjbfzx2htv8vrsjBaeICZTGMrET474aIROcJk2lly6B7NM1tqaZg8XIFA2JoHxDJOqWRH6WjvEnVmAESHUeWkyfNmPGqJp37bDGPYy2rznVA5a0x0aVCTSo/QOoQrr0fkcCEFteTHNeHZmC15DmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <34000818-5bd8-4329-bd4c-e6f72843dd75@citrix.com>
Date: Thu, 20 Aug 2026 16:09:04 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v4 02/23] x86/cpu: report SMX, TXT and SKINIT capabilities
To: Teddy Astie <teddy.astie@vates.tech>,
 Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, xen-devel@lists.xenproject.org
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
 <be993e757550b69a6f94f89476ba71131b434741.1785668458.git.sergii.dmytruk@3mdeb.com>
 <1787230800.8631fc262581453bbf619ec5b2062170.1a01f41ca51000c4f3@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1787230800.8631fc262581453bbf619ec5b2062170.1a01f41ca51000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0679.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bfacaaa-3530-47df-8739-08defeccfb81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|4143699003|11063799006|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	vx9s3SpQGabWs8sdbDJG1ESwoxrGbJwDaPUKxi0e/q/meso4lFGWgYGD/xIJXq0UDXo3UEW2fhv6NtladoXng5Z6wVyToFTKa0xgdDF9A59lMp/4RDSn2r6Q4Ugn6EZD7L78nVLQCuuXiTIsnY/6LTN7H+fXZg6P6ZvfNy2YK61K0j1RZECLiJDCnOoHXy9dFQB/jNkP5VsV1btqE62bXctVJooyKxqMkRKOJutwUoQbrOky1PbWW9Om9rXI7pikdGdJ8fuWKqOueoP0lPuus89Wbctz2I9/JkkImbcR2Utnt5DKkaO9+JtNV6kJAM85HBynfDfB1EyWyL0rsWEbneYoM7CgMLURhrViPiJFYV8piPlJJWQMONn3yVTfIbcv5j8Of2HOlB/UQBLXsoBiXisXFkOysFMC6kg1itfkmO/7oiBINl3RxrOd3rUdKt8YVzrVd3a6YqGaIIqLGwufsW5u/qcSgXXZwPxU2B7Vl8CeCMhWBVKNhcwYoWsuasVHwks2ozvbczvf9bJF02Q8K7BL6V1zRzXaMyJ/ciBYtDentI9CFk7N9ZSCeOG8vyzbw4GK9qtQE9SFDq7Di2tB6B7Xg3YZJ3ybvXUHKBUOnqKk6zbnrfbwXJj5SjsPKGRUIriVHSn12qoUJ+H9Afi66d8s09J7t2wj85bH47vkYVE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(4143699003)(11063799006)(18002099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGpKM3k4aTNGQXdSWnQ5TmdRQjdYd3EzdUFBdFVGUFduTXNNeHlKVVk2Sk9p?=
 =?utf-8?B?c2RRd0xDUzFEWm91b0t4M05YSjhhZTF2cDhiUDVMbzd3eXZRZFRyeXp2Sk9L?=
 =?utf-8?B?ZCt4eU5idVExdk1OWWpKOVB4UzlwZ2ZBNE9WZlNkT1N5Sld4OWZ5blNNQmIz?=
 =?utf-8?B?alRQTFB6U29Jd3RmZHZNMjBWUzU4eGVWOHdlZTlpa1Y3N3g3Y0tpYS9qU0Yv?=
 =?utf-8?B?ZXFHV1d6ZzFCUVBRbnRyMi9aNlhDa2lwaGZmU3JGZlRON0hmWjE5L2wrUjhJ?=
 =?utf-8?B?RFhnYnk3S3RzOU5WbFk2QkxQUU9rZEM4eCtITEtSU0RUT0tSbmtlL0tmMlo2?=
 =?utf-8?B?UUlZcHZUKysxcCs4WWdhSzlOQ1JKYjJaUHhTcWxWTnk1NkxyUnl0RDBwdWpx?=
 =?utf-8?B?TUJlcEt1aHI5QXJ0UkVQdDRVdWl2WGtJWENBc0ZwWXRwWGdzNEJDdWlJekNh?=
 =?utf-8?B?MUNPK01EaFN4cE9jV1VpZ1FkRWFjOHRLQmROdytmYWlKNTkyeThRSWZPbTJC?=
 =?utf-8?B?bU8vcE9EcllXMytHcDNodDJ2dWZiNXZtSVVBdm5GMGVobWpaUHJvODViNTdM?=
 =?utf-8?B?blZJUGdmd3hxa1RNVC9Td2ZMbGdFQ0xqY0Y2bGM4Qkw1aWVYYitUWThDT2ZF?=
 =?utf-8?B?LytxQk5PSm9PTGFUUXE0OSt6aDNiTVZNeGJWZm03THUyQjJLcEkyNThoWUhM?=
 =?utf-8?B?RnpXTkxidG14UEpxdTZ1dDNkS1dTck8vcitudTIwblVrNUY2OGVOUFlrQ2Vh?=
 =?utf-8?B?ZEhMOEZHNTlFMDlPMTBBZFU4Vko2S3ZTSDh2VjJaZkJvbmhYeXhka1BUUzRX?=
 =?utf-8?B?L3BJdUJHS0Q5K3hOSmFLcVVEdnhZN3kwczF0Nm9yQkwrbHhJUmIwNVc5eVN0?=
 =?utf-8?B?RTUzWDIwSnlQYVJ4ZHkyVmNaVkxFZlMvRjBxc0FvUW91YzE2akdWNk85THh4?=
 =?utf-8?B?b096QTNSN0t2NnZkVUpGUElVaDEyTS8rRTk2VG1WT3JMaS84N3dLaFVzcTRa?=
 =?utf-8?B?bSt3Y0ZodFN5S0NnUTFUS3Y0U202NkdEWkE1RnliTXRvbDBrOFVNMHNZVHlq?=
 =?utf-8?B?WFhVZEdJeDRreGpGdlZRNWlBcUlIdEdGNnZPNXVpa3ZCN2ltZ2lPMnFkWjZO?=
 =?utf-8?B?Snd5bkE5SlJCQkFSZFVXUkhJWm1POTU0MHYvMFltUXE5K2YxWWc4Rzc5ZUlV?=
 =?utf-8?B?NThMbnR2dTNjL1RqdXBqV0NTN2JlZThqKytBaXBuSWpQTnJYeXFvZFJ4N0Rh?=
 =?utf-8?B?RWhPaU1rRjR2WDJhZHpaZHNibEQwYk8reXZucEtaM1hDT2RWRHN1L3ZiQzdz?=
 =?utf-8?B?UmtXYldwbEgrNFRuMU9qWnJoS3dON3JZL05yTTJvajFHMm1adWZNZ2luN3lo?=
 =?utf-8?B?cVZuV3UxYWVUdXB0Wm5NaXJXU0d0WWM5RmRHOEgxMy9UcFF6YzRYdUNBNTAr?=
 =?utf-8?B?bFdKMUFSVFIrZXZlZDMrYTVRd2tiaXFBOXhjcUhheXFJaEh1R2E2VzUwSFpa?=
 =?utf-8?B?VjkzR01tSWtxSXdpcDl2YVg2TkdPSlNPUGdRVVpxbXhETTVuekZGV0ozNmNX?=
 =?utf-8?B?Qlk2S0NoQWw4R3ZTSXNBZEp5ZVoxRjZJWmVIQ0FzaEVlUE9BcWRGdE43a1Yz?=
 =?utf-8?B?OXFQalU0OXhuVHlrbGNDN0FTM1VSMGNqWk5vT29OZkwyaXlyK21lWGxXR0Mz?=
 =?utf-8?B?VnlMY0V6SHlIMzNBUVc3UHlyZk1SZHhXVzg4NFZmQlNRY2tVUjI5MXE2eDJu?=
 =?utf-8?B?Q2U2TXhVNFB5N0lUbU1tQm1uMGZWemRPS1dhUGF4eStzMEZnY2srNDc0L1I0?=
 =?utf-8?B?dnhQTnNGUmZvR2hmb1FUWXEvT2hadm9RWTc4T3BxY3BOSlkwQXZVa21yWVpo?=
 =?utf-8?B?MFdCaytnanY5N2pySm5sMFp0ZmJQNUQxZzViZlNadkhZMXFBS0wvc01xYWJM?=
 =?utf-8?B?SzMyeGM3THUxUXNNQXh2UlA5UWgrQTl0dndMYkpBaldrODVmbzl0Um9pSHZa?=
 =?utf-8?B?Qjd1b0d3VEJPN3VGMUNtU3NiNy9VSGJ3ZnRjdkhCSXkxNDA3RkFjaVl0QXZm?=
 =?utf-8?B?V2hHWlRnWlFFazh2SG9OQlFSb3R2czNuN2xFOVFiemtnUlV1Q1A2c05UaFA3?=
 =?utf-8?B?N3lkWHZ3NVVHNkc1VFE1dUVwRkE3emV0czRrUGJNMldqNWRJUXdZWFNvbGdx?=
 =?utf-8?B?VXJrMkl2VjgzT0sva1VITVB1TU9VU0ppVDlqNHRYRWt2R2tCcGxkVXF3ZDB4?=
 =?utf-8?B?VEpGL2lrWFkrTUdCNmdnK3l1V2ozYUVtTEVZL3RGNTZ3WWo4cEkzV2hFcjE5?=
 =?utf-8?B?cXFRTzNIZGtndFVlMW5QN011ckVoaWl0VEdZQ2QycVY2b3lqd3ExQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bfacaaa-3530-47df-8739-08defeccfb81
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 15:09:08.1409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18iKpKyowI/JQsbaGhFIH8MvPbTaDuB96hh+vAWja7R1NlODy0Kdyb9CNNmGXvx3COxIcwpJNSB1axfI3zMYeEyYMKdMvoEjtEqyj8V7Y7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6473
X-purgate-ID: tlsNG-720697/1787238553-309C32AC-5AD203F2/0/0
X-purgate-type: clean
X-purgate-size: 2558

On 20/08/2026 1:59 pm, Teddy Astie wrote:
> Le 02/08/2026 à 15:14, Sergii Dmytruk a écrit :
>> From: Michał Żygowski <michal.zygowski@3mdeb.com>
>>
>> Report TXT capabilities so that dom0 can query the Intel TXT or AMD
>> SKINIT support information using xl dmesg.
>>
>> Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
>> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
>> ---
>>
>> Notes:
>>      v4: fixed conditions for not reporting capabilities (match
>> correct comments)
>>      v4: define GETSEC_* macros used only by xen/arch/x86/cpu/intel.c
>> in the file itself (to not depend on Slaunch)
>>      v4: don't postpone restoring state of X86_CR4_SMXE, do it before
>> printing test results
>>
>>   xen/arch/x86/cpu/amd.c   | 16 +++++++++++++
>>   xen/arch/x86/cpu/cpu.h   |  1 +
>>   xen/arch/x86/cpu/hygon.c |  1 +
>>   xen/arch/x86/cpu/intel.c | 50 ++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 68 insertions(+)
>>
>> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
>> index 70783c9a0a..5ea16ad8a8 100644
>> --- a/xen/arch/x86/cpu/amd.c
>> +++ b/xen/arch/x86/cpu/amd.c
>> @@ -617,6 +617,21 @@ void amd_process_freq(const struct cpuinfo_x86 *c,
>>           *low_mhz = amd_parse_freq(c->family, lo);
>>   }
>>   +void amd_log_skinit(const struct cpuinfo_x86 *c)
>> +{
>> +    /*
>> +     * Run only on BSP and not during resume to report the
>> capability only once.
>> +     */
>> +    if ( system_state == SYS_STATE_resume || smp_processor_id() )
>> +        return;
>> +
>> +    printk("CPU: SKINIT capability ");
>> +    if ( !test_bit(X86_FEATURE_SKINIT, &boot_cpu_data.x86_capability) )
>> +        printk("not supported\n");
>> +    else
>> +        printk("supported\n");
>> +}
>> +
>>   void cf_check early_init_amd(struct cpuinfo_x86 *c)
>>   {
>>       if (c == &boot_cpu_data)
>> @@ -1325,6 +1340,7 @@ static void cf_check init_amd(struct
>> cpuinfo_x86 *c)
>>           setup_force_cpu_cap(X86_FEATURE_XEN_REP_MOVSB);
>>         amd_log_freq(c);
>> +    amd_log_skinit(c);
>>   }
>
> On which Xen branch this patch is based ?
>
> early_init_amd() doesn't seem to have amd_log_freq (which is in
> init_amd instead).

See the cover letter:

base-commit: 7c77acd452fb6a3079661e75ebb5cf23ed985cc7

$ git describe 7c77acd452fb6a3079661e75ebb5cf23ed985cc7
4.23-dev-119-g7c77acd452fb

so it's something recent.

