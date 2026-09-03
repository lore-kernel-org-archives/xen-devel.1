Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D6AC624D7
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 07:34:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406473.1639756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x21xY-0007ip-Bo; Thu, 03 Sep 2026 07:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406473.1639756; Thu, 03 Sep 2026 07:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x21xY-0007ii-8g; Thu, 03 Sep 2026 07:34:08 +0000
Received: by outflank-mailman (input) for mailman id 1406473;
 Thu, 03 Sep 2026 07:34:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x21xW-0007iU-UY
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 07:34:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x21xW-002gsC-AS
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 09:34:06 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9922e9-2eae-0a2a0a5409dd-0a2a45038de4-24
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 09:34:06 +0200
Received: from [40.93.195.55]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9922e8-fae8-0a2a45030019-285dc33734df-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 09:34:05 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB7148.namprd03.prod.outlook.com (2603:10b6:806:33f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 07:33:56 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 07:33:56 +0000
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
 b=lZ9GJF6uwQyVmONvdO3KV+jdFVxy+QymO/83cy+N11SRVh8a5qMuJqO8WhNynbTruOskelrXYtwhdDiysJUSUROirizRZl6ups3jWFEyVklG1Y13n9+PiIbWNNUzrPELJgHV/LoXhyA+0Rdxz1dmrcwNQeNdJwXIz85QpDVI69TqZWTw5rg28c9N51Qlgcih+SyoAxt+jduQ7p8Nyoha8/SyrCxTmPRem9qVfBr7KV2oB0crXh8/1FkbYv5TL/9B4fka0PxpR4DBJUkxMxe9n/DVVnoqFc0avLngJBhROoZJUDBGPSG6SUR3x7kqQsqqnkad6WfoOjcpj1+cLJ4wUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDqhLnYaZATcSn7LLUG63PvjBhjopPL1L8K2aL7Jl3k=;
 b=XNHPuKPXrOqeaT/F02PXmlgf679g8/tY6fCM+HKO40FZ8QbSsPPsfVuCIZmk9kVZxAFOlpZPH1sHslDJ7AUedNPQdblF7sMHwibPwZqw5IhdXSt5N6pRYQdt5i8P9KSUzVhVlbZlKinYzmSc7/q+upWlWxgzNbP1EiNlV6ASWAxRoea0y3pNC3jXelwkJBWYBMlFY1AFmsXWD7YaHWiGJHs+wuUdyyuNMtKROSTibiR1O5lBWVe9veD5OzvVn24E8gm+Ph8QBye5Km0IZjE7haAg4YqL1lpEB789B9yo1LzlqUNUuFYL5D2p0awmHpc2g1/6qEErSRVNJJItIoKD1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDqhLnYaZATcSn7LLUG63PvjBhjopPL1L8K2aL7Jl3k=;
 b=Q4YvIoUYLk6Jos/2u92q9IWc0SgadbkucYzf3keyMclZkZNAaypIcQqUYODLlhkJNk7fAASwzNbKRtOUb61zD1XpJcsQq0TLB2isbF74VlRrZov3HHd0+LRTHSx8Rvlk4E4HbTJdTukuNcvBKe13FpQRc6yOQXv2R3seKbMe7cU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6eb4e647-d737-458f-b91b-41d5915814f1@citrix.com>
Date: Thu, 3 Sep 2026 08:33:53 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH] x86/ucode: Work around Granite Rapids erraturm GNR98
To: Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260902221000.2967167-1-andrew.cooper3@citrix.com>
 <1788389520.8631fc262581453bbf619ec5b2062170.1a064527434000c4f3@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1788389520.8631fc262581453bbf619ec5b2062170.1a064527434000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0168.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bef4352-6bae-4796-4a1e-08df098db663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5Gr/i9+jxlxxDf0M3i5+HJt/fWLZsr8yl9r4/jQZbOwQtSmVcbXeo+EOPKGak+JHz26bivt1I5oXNg1v8NGFb92lkGjtni3NTbn5h2YyFCPACKWZ6Q/RsmicBeaswhCFjgXNjkmIy+n58RNr9kSwub2ZV1iEnB52kP23hTGlA5FDiRVe1rcHdMDBiM3lqSqD9/G9X51/+6TNLcTzWZZ/dGs/oKNGFt+odNz9Hd8fabW6egYcvG0WEWn+Q37KAS7jChFg/kAvnMBx4KZXPsd/LiTTtjgU9G2mIGLrhCgT56aR/nHAVHJFd5ZQVzGGUiP3iERc9FsCz0r+1Nxbqii0KtwfxIyGge60gZYPUCaQIQCQAnITIFRbjoEmkS44qHMLvP8IrELr70iqLZ2ZcMb5aVDDWmN5ab99NQyWuoLmAGonlY1L8akt9CPK6lgVqbMCOLLO6ITyvjth1P7HspMxdJA6lWxt+blfhD40Mp3ElQV+YHCD+66ZxOLCQNzKlxReGCCG+CNrcD6a749e/XQqARq/xBbeEyIxxHmviaWRibr2geNHSN6UH1lrEsSDk8TZD3j3+IHuzUetd5CklrWb/pdKfxIZS1zBoSTrYPzkG/TuIcTMrAeTKmrYojerl8n5pVhKifqpCdPmTIIryv6H8MLz7oL6MWADtwZxcsA4EG4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlFIbWFyUUs2cGhtbmVOcW5SKzRYNVdTV3JFalVzNW1kNG9RNERTYWpJZkdY?=
 =?utf-8?B?b3prWmE3TTNSMUZsa2NmMU1MVnhCRTZJcktCSjVpWk40bytRQlVIKysxSkRG?=
 =?utf-8?B?WE9xQWtEMEhENXhaRGx0a2p6QnFnN1dJQnlFRXpVY2NCMmVRNURHOWJWZ09j?=
 =?utf-8?B?NC84cDRoNUx6WDBHWFJjbkk3aWVFUUNlZEpGQld6K050cEdITzhzZVNaaWVt?=
 =?utf-8?B?TG5XWGFFdDhQRE9UYloxSmNvRVo4Q2ZXSzljTS9vZWZlVTNibWMrb3p1UEV0?=
 =?utf-8?B?NTdnand2ZlVESE1jWDIxdzYrdDRqZ1hFNE92ODN4RGNEeEhwNlNST3VxQzF4?=
 =?utf-8?B?eUw4M1lUSDVJdjVnaFdhNHU3aVRNaHVhRWNERForT0g3T3BDdTY2TWtBaEtp?=
 =?utf-8?B?U3RpVU1NZHQ3dTFsNWhjODhXL1kyVWJUVmczYi9lZlA5V1dlWjliV3A5Mi9i?=
 =?utf-8?B?Wm9nN2xzcUhjb05rYnF0MnJOY1BZenVnY1JERmNvVC9XdW1mQXo3NEdmR2I0?=
 =?utf-8?B?SDVzbVZjeHQ2MHluRWdoQ2Jpakg5aXQ1TGlxUGxyamNTVjhIQXh0TzFFYU1T?=
 =?utf-8?B?cnB5RE1HMVVpMHYzOWxMdlRaWTlnY1gyTG15T2JuWmdoV3l5NUZmVWZ2M1Fv?=
 =?utf-8?B?ck1lRmY0L2U4K3pSUXp3V1pmVUxldjBuRlZvSlVOQ0N1THdNcVN5ZXYrUnVZ?=
 =?utf-8?B?MUpxMm1UaHozRDNlM1hBbVMrdi9Vck9DZTNoYUcxT0RHWEN6dm5WaWJBNjlG?=
 =?utf-8?B?MUpxQWprdzB0eUw1NzhQcmJYTWgyY2J5TVhPdjN0bmQzVHVGS2Myb2ROQWZu?=
 =?utf-8?B?Q3VnQ3lEdVcxdXFzK3lISUNodC9PTWF1cVg1R3dGckxjeVh2N2NlSUxQNnBs?=
 =?utf-8?B?ZGg4blJoTFdBbzR4TW83bG1RSlRNOVFRS3FUT3VndWRvbXdETDJOeFZ4UlAz?=
 =?utf-8?B?ZHpaV2E4VVJocFVKT0dLeXRzdWpNcUU1bVB0eDVrVUNST2hlWHp2MXEwNVlj?=
 =?utf-8?B?OEdMUUthTyszaHdSZ2R6cEg0SHpCY2QxN1cxSHJ3dVY0dzk5T1ZxM1VPekpZ?=
 =?utf-8?B?KzV0TzZDcGpYNE9qb1pIUXZXaXVTcVJzNmpmQmFSdVFqOG5RZ09jaXhYZ2Qx?=
 =?utf-8?B?MTV4MEpNU0FtdTNqaFZITkNqc3FRc0JWaHBlMUk2Rm5lOEgvVVUxcS92N3FT?=
 =?utf-8?B?dFhJQm9oRjltODJOM3N4VWU5Tnh3a3pRK3FVaWJzMXU1bFR6UXgvZUt4cHZN?=
 =?utf-8?B?a1BROXpDbHlhTnBsMnVwU1ZySmtyczdGdnMrT2dKUGJtTEEzNEVibXR5bi9i?=
 =?utf-8?B?bWwwM3p5VzBNV3pabVErNnNqdW5VWlZ5bkNzWmZNcElpME5qYndDS3RIRTdI?=
 =?utf-8?B?bloxVWNSdGQyWDE2LzVYUTdUWkFQUEFxU2d2TDFrVDR4aWRpOE96R2E1TFl6?=
 =?utf-8?B?enJCemo2b09ncTNkZUE0SFJzZXZCenhaQUdVNVI4dEpCUVBEaVBoSVZiZVA2?=
 =?utf-8?B?WjdtUnF6c0NmakFTNXk5ZHl0dW42R0xQdjREZ2FIM2dqNkxUZDVsZ3pRakVH?=
 =?utf-8?B?TEJHYXRRdjdCbTMyWWxhRi81Z2tOelR6SGJLSWtIajIwRVNWMCt1V1NqS25s?=
 =?utf-8?B?OEZIdGtoQ21iVjRrZmduOWo1WnBpL3U0RGt6Y2dKSGtNS0NIamxGZlNWd0dk?=
 =?utf-8?B?RnFCOUZNVzBOY3J4eXd5SktaNXBWOG44RlhldXZ3VHdDbEQ5dXFldUoxSmlP?=
 =?utf-8?B?ajgwV1c4T1dGWFZZTWQrM3d2QzBUVFQ1ckY2QVQxWlQ1TDN0RmFmR0Y1Mld2?=
 =?utf-8?B?R3NoY2RnSUwweU1SVXRqMVVvb0l0dHVSNlJGZWFISzY0d3VXdkdiN0RpM0hS?=
 =?utf-8?B?S1NJeS9ZYXEveUFzQkNsRm0vOEExNFVqekZiQzBLZTdlYmlsUTYvMnRwTG9n?=
 =?utf-8?B?dGtyalVrRDVoejVrMXJacXh0RTlBaHFLS3ZlZHE0V2JFYUc5b3MvaVdPMVF0?=
 =?utf-8?B?TktqNVJRV21aalhGT1VURVJZYUpScDc4aGFXSDlMVFNETXdXaXEwTGE2c240?=
 =?utf-8?B?d3NSMUhVbjRvVVN3R240SWVVUkl2N2FXck9ZYUZiWUw1cE5nbTk5WGtTT1da?=
 =?utf-8?B?UHM4YU5GdkJCWXJLZ3ByNTdqRm12NldHTDZRc3VkR040VEZ3Nzhyc25rSmlL?=
 =?utf-8?B?RUJuY2RTV2tCSC9iR01jVHBhS3RobUNHMWtqTng1S25KVUNLMWVVQnhGeEF1?=
 =?utf-8?B?d1U2NzlEUFFMSmJWOVl2cmhHNERTSEY0ajViaVNEajd0NENUbU9aZFVtRnVH?=
 =?utf-8?B?MFdyVG5EdDlUNEJjVE11RWN5YkdWc041SXlHZ081VVp5dHllU0hKUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bef4352-6bae-4796-4a1e-08df098db663
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:33:56.6738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWCnZpAAWCCojYwGGl9LdDoUFlg5w+DWO2ROcnDccSOURQLmhq1sLmIY4qkVBCnWuCzgO9NZ3L5pp3KgNWicQPW8cJPzfPjF7syvx04LDnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7148
X-purgate-ID: tlsNG-33051d/1788420846-764FC4E9-0EA224AE/0/0
X-purgate-type: clean
X-purgate-size: 3785

On 02/09/2026 11:51 pm, Teddy Astie wrote:
> Le 03/09/2026 à 00:14, Andrew Cooper a écrit :
>> Block loads which are known to hang the system.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Roger Pau Monné <roger@xenproject.org>
>> CC: Teddy Astie <teddy.astie@vates.tech>
>>
>> A more complete solution is in the works, but it's taken 4 months to
>> get this
>> much published...
>> ---
>>   xen/arch/x86/cpu/microcode/intel.c | 31 ++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/xen/arch/x86/cpu/microcode/intel.c
>> b/xen/arch/x86/cpu/microcode/intel.c
>> index c45b00c6b033..2160befd3197 100644
>> --- a/xen/arch/x86/cpu/microcode/intel.c
>> +++ b/xen/arch/x86/cpu/microcode/intel.c
>> @@ -27,6 +27,7 @@
>>   #include <xen/string.h>
>>   #include <xen/xmalloc.h>
>>   +#include <asm/intel-family.h>
>>   #include <asm/msr.h>
>>   #include <asm/processor.h>
>>   #include <asm/system.h>
>> @@ -273,6 +274,35 @@ static bool microcode_fits_cpu(const struct
>> microcode_patch *mc)
>>       return false;
>>   }
>>   +static bool microcode_safe_to_load(const struct microcode_patch *mc)
>> +{
>> +    struct cpu_signature *cpu_sig = &this_cpu(cpu_sig);
>> +
>> +    /*
>> +     * Treat pre-production as always safe - anyone using
>> pre-production
>> +     * microcode knows what they are doing, and can keep any
>> resulting pieces.
>> +     */
>> +    if ( cpu_sig->rev < 0 || mc->rev < 0 )
>
> cpu_sig->rev can't be negative as it's unsigned int.
> I guess that's something to fix in our struct cpu_signature and how we
> get it. Though the structure is shared with AMD, and I don't know if
> it also uses "negative" revisions for non-production ucode (PPR
> doesn't tell anything in that regard).

Oops, yes.  To answer Jan's question, GCC was perfectly happy with the
logic in this form.

The field needs casting locally.  It's officially unsigned according to
both Intel and AMD, despite Intel actually using it as a sign-magnitude
number indicating debugness.

>
>> +        return true;
>> +
>> +    /*
>> +     * GNR98.  Granite Rapids systems hang when loading new ucode on
>> +     * sufficiently old firmware.
>> +     */
>> +    if ( boot_cpu_data.vfm == INTEL_GRANITERAPIDS_X &&
>> +         boot_cpu_data.stepping == 1 && (cpu_sig->pf & 0x95) &&
>> +         cpu_sig->rev < 0x01000405 &&
>> +         mc->rev      > 0x01000405 )
>> +    {
>> +        printk_once(XENLOG_WARNING
>> +                    "microcode: Granite Rapids erratum GNR98
>> detected.  Skipping ucode 0x%08x\n"
>> +                    "microcode: Firmware update recommended\n",
>> mc->rev);
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   static int cf_check intel_compare(
>>       const struct microcode_patch *old, const struct microcode_patch
>> *new)
>>   {
>> @@ -365,6 +395,7 @@ static struct microcode_patch *cf_check
>> intel_ucode_parse(
>>            * one with higher revision.
>>            */
>>           if ( microcode_fits_cpu(mc) &&
>> +             microcode_safe_to_load(mc) &&
>>                (!saved || compare_revisions(saved->rev, mc->rev) ==
>> NEW_UCODE) )
>>               saved = mc;
>>   
>
> The rest looks good to me; as my concern is unrelated to change itself
> (and doesn't affect production microcode anyway).
>
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Thanks.

~Andrew

