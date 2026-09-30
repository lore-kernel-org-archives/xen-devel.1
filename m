Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E62CA5FC1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 08:59:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436953.1655647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBq9h-0006SU-Az; Wed, 30 Sep 2026 08:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436953.1655647; Wed, 30 Sep 2026 08:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBq9h-0006SN-8E; Wed, 30 Sep 2026 08:59:13 +0000
Received: by outflank-mailman (input) for mailman id 1436953;
 Wed, 30 Sep 2026 08:59:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xBq9g-0006SH-L0
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 08:59:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBq9f-008vI9-5H
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 10:59:11 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6abccf42-8faa-0a2a0a5109dd-0a2a4505df66-44
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 10:59:11 +0200
Received: from [52.101.48.9]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6abccf5d-4cb1-0a2a45050019-34653009236d-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 10:59:10 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BN8PR03MB4963.namprd03.prod.outlook.com (2603:10b6:408:7e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 08:57:04 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 08:57:04 +0000
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
 b=vQRAqM1Ywu8Gwx5w4J3mhUr2WtqzMMbVgQNuI7er7rzfhtHrLwrPQlSkGOQIdVkqL61B0OYFTkzxhCiPUpFgOaKss4nYPrxRikMQNUOxGUatPWJPjGfWY7QZqki9V6CVdOh2P99k7J2QA4KZkrLw/0G/q/FKpIFYghOCtmx71er+oqzMsCnxVteG5OH8r/DIiC/C6JvQKx6NZifvQ7ZoZ+u4aYE9yDPaqBt7eVzZFM8Hirua33DFpHPtAHrGzBJKhlCtcUyv9NtAQg4T5//hMflTWr2X4EbYOWlSj1PJsWlh70aHlJuBX+IRnIsw+2qHYZUnFOypSpApTk+fSyyQOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obCd/QUJBjHK5ldBfJK70A1WaFF+12J7iNH70ITw0uQ=;
 b=J/B29xSIzOQw1NHcR2BySZYDfa/8nF1s3D+3KX1H83lfzFoeRMD2cYpFJJ/pFwtqTl87s03FQhLs4GF/Z9hId6GT3aah72g+TT2pZ90cVqoENldiCwoPR2D3PBnqIY6dCKRbMYR2qKCgajz4Q0kVbByKsJICAbDZn7S8J8LwzazFkl/YsoEhHN4BqxoKRRgttV6e+ttAGKH/fo4zh+33VNvZpaYtQjEQLjq+FpweeJ4JJ2I35kP6u2TMsX8BaOJ4WjLyXvSyvFCQNjdg5a0BhOUK594+7deneo7AwcSAwKuLAncxuwmM1WqmyQLPjzMhu6Zjn9W+My8Mjzw2X37gjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obCd/QUJBjHK5ldBfJK70A1WaFF+12J7iNH70ITw0uQ=;
 b=OPjx6ZgLQ1EeoYLGLzwpUClUUvtRyUtzqFBU8owmzVXfP448ARmAhN6sZGpepDYE26EcY79n8+1lzPqWGhHuFZfptp8duryNZ0Izmk9Ibhm4jOhD6PY4TypREbddA2zKZi1NMPLc49+5oM+tmZ9pBI444vQVtQmUhWy65wT2li0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <64f721ac-027c-4b6b-b7af-6a9f9a941f91@citrix.com>
Date: Wed, 30 Sep 2026 09:57:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/svm: Cleanup vintr_t type
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
 <20260928140248.1543013-2-ross.lagerwall@citrix.com>
 <fa98bc43-afde-4696-9037-22961791c8ed@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <fa98bc43-afde-4696-9037-22961791c8ed@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0294.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::7) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BN8PR03MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e3b582c-7e5b-4425-e9a6-08df1ed0cc75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	i0/SCGYwapPVZmEZvhwOEIIIyvIJupoS8fMsxPO0xAal9J2jcc7P1VwCzzBdPvVwoRSfgF55LJ4lnXuudCQxFq4ZtDUX+vK0OeDfbbbpIZU2g5IQ8Kxg8DLMjGzLgS0BKxNxdv1It3rEnAWAQlZz/cyXpkDsp5X+3wyJCGw5SR9R9BPKme4zgEs4eIq68saG7/ZajQaXdu8Sw1FuqSjY+xpKUJlCPI1Omyyhwdi9s+lBAev9qNRMOJYfdc09RItFnjoVtJ9YdEANYkbFPEhUvJmP58OB7MvNAj2HVgv7u24GiLoBoyPmGIn2ERIabZ9afygIOlP0SBvlgf0xl85amE43EH1uvC18IE+SfaI2deFRM+PGOj5asmMR+ZyIFkw+65xWUtiY7XDHjZoQ4ADXOVuW49f3mMpJrQNLLHyro2Xz9yvnwJJ6con4ruMzd69AyIk8NnKzB/sJh5KPg3fngOYSAvG2jKAmm1MbZKN3j44zSOH0PTQ87D9MdZ1Yg0a7n+OWM6OcChxcthUYWq4R3qAtpxkn7kMAg0ltQewd/QRerKeSTls6f/J6iltnMyWwwmt1b0zkN+eZuUcymOO7VR6pa73hqo8fYAp0fEkRMIf8eJ75xmXc1fj8l12EQBRdxT0DOchHHNyY7JhIhOSJyr3eNqo5/jVihBIgG5eh6qc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzcxOFA2QllGK3c2WWo1aWlPQkVWN2FWVm15aHdSUXRHTDBDSXZ6dnU1d3VF?=
 =?utf-8?B?VjJHMGI5aUozUXF3MVFsWExGWHFoVnFrSDl3YXlIYnQzNjhYcjZWNk5uUTBY?=
 =?utf-8?B?K240RmVvWmNzSUJrUHVnYk5ORFVpeUQyejFUK2owNXR5VHV0UGkvSTRxRTNt?=
 =?utf-8?B?RFNkMWY0NVZDc0VHOElia0k1bzBnNGZiV1BldmozQTEvSXc0MmxkRkZKMSsv?=
 =?utf-8?B?aENrUnU1TUlaTDI1WSsxSjJZV2RyQkNRMkUxTDR6VUNrTVJXeXY0blVKN2Q1?=
 =?utf-8?B?Z251VUxIRi8xNUFadGZGOWE0cFdIbUFLMmZwN29lYXVWUExwNVJtbGtJZnE5?=
 =?utf-8?B?QUxXVmpKT1l4QS9wbDI5V01iZG95LzJXTlI3NGE0L0ZFaHlWRXdaa0hoVDQz?=
 =?utf-8?B?M2VxOTZabEJhcFFidlJETysxRDVxemlCelcwcUVJQzdoUFp0SXJPYkFLVWg1?=
 =?utf-8?B?ZVN1MVVjNjBzM2hTUEsyd2l6VXlzeTZzZmpxa3h3OXRJbXhsb295VkVybm1S?=
 =?utf-8?B?Tm1nWTd1REFBZnRranhteVFWWml5NWxyZE91S2ZUYkJHTFl6YWxmUmFCMnhG?=
 =?utf-8?B?aDZzSGIvQXY1N1g4Y3g4VkpUNFRsdVRDSXZmQnZNOU1hWk01MWlhWSsxMVBp?=
 =?utf-8?B?cWN1Q21aMEUzam1KUmR0blprN20zdUh3TStTVFZoNkVqYU9MdEMycDdqNjdS?=
 =?utf-8?B?T2FyWll1MzF0cEFVeFJLbXZOcCszK1Z4VGE0TVkvSFJLV1hIN1NZcTNtaGR0?=
 =?utf-8?B?cWtyeVY1ODArS0E0ZVdpeVN5ajJRR00rcGFGYU4zOHh4QUJ2Vm1wcWM5THJi?=
 =?utf-8?B?ZGcwdDNnRzU4M0RHUTUvM0hONmdjTlVhbEJScFJXZWE3WnRsYkY3ZWhrUjlJ?=
 =?utf-8?B?RUtYUTJtb1hZZHBldGJZaGpwaGsydDh1eUZKdTIwWEJyVVRJaHFRSGloSEtN?=
 =?utf-8?B?TFJwUGs3cGdVcDNZWENvQW02RkhEOUVCR1EzQ0J2SGdhV2hGaU5WOG5veXBt?=
 =?utf-8?B?MCs3NVJwS05LTXJkQXFBeE4ySXBjTFJBam0rMnc5c0c1MGxWVld6RytzV3lN?=
 =?utf-8?B?VUdqdkxjSmgvc2d1cFBSMjFsZGk4SFJEZDZxUFp6WXQ2VnBZTUZsZEdkV1ZB?=
 =?utf-8?B?Y29JWDRPUmNRUjdDQndCREFvVFA0WDcrNG5WbGh5dEdXTVRhZ0h6REdORVdQ?=
 =?utf-8?B?VnpLeThiRG5lalpvSkh5Vjl5WjZQTTV1TllNR0tEY1FCMVlMNnBzMlowQWRQ?=
 =?utf-8?B?RkpaUFlhVVNVeCtJYkxYV1I5VUkyL2ducUwrUklhME9ncEFUSGg0VjZaTHBD?=
 =?utf-8?B?L3oxN3FFYXNpL2E1WS9Zc3ltMUN6aGtnWTZ0cHNsc041ejExRlUrc1A5VlR3?=
 =?utf-8?B?WUFCLzM5ZkVNalNNN09UdFV6bnFCdDBxVmt6WjRBQXoydStwVTI1dERnNlNy?=
 =?utf-8?B?alBOUU81RlkrS2xDWTF5L2ZVbTZiSHhpY3BUcDRXUVh4OWR0MytuZUZXMUls?=
 =?utf-8?B?RjI3aTZmTk5QMUxOdFdybVJOdDJBZS8rQkw4eHAzRGpPV0JTV3IvTVRFdlNo?=
 =?utf-8?B?cUtnNmRTeFFWVzFISTZMTFkrb1c4U1hMVEJ1MDdXZWtSUTUwT21BN2I0enZV?=
 =?utf-8?B?SzlESlZjOGtBbjVPM1FIWUhLU05oVGpPcHlKdy85RHpDZmFmSjNMUno4YnE2?=
 =?utf-8?B?VVg2eDRRc2ZTcHp4b3NON2pxTFdRSFp4ZGg5NWxYdGt0Y0lldDZTVU45ZVlP?=
 =?utf-8?B?ckI1N3VSVHZGUDVOT0JlajhZNlpJUlFvNWo3QXM1cVJtTnlCZTNxa3Jqa2tO?=
 =?utf-8?B?V0REZVlCUm81VmRLVk5YU0ZIakc2K2crbVlZbDVTUWxEazNJZkZOZXVmQUx1?=
 =?utf-8?B?UUpQeHk1SllmNTNhVEZQa1JBdlFKdWxkcHp0T3dXNDVVZmZDb3prcVVacWtM?=
 =?utf-8?B?cFNWRm5MN1hyQ0lxb0IyTUlJRGtzd3ZqRHNwYjgyYU9HK1I3aGM4NXJTaHJY?=
 =?utf-8?B?aElBc2FTSzhldnQwZDVBTjhUblNQWTdudEVsTTRVZU94bmErNlFQNjNRWGRC?=
 =?utf-8?B?U0tydWNzNUF4MkU2MjFNYlZBcld3T2R3SjVLVEJnL042ZWtTVzQzNzZyd3Vv?=
 =?utf-8?B?c0VRdVpJOTR3QlZkeG5WWlQ4aHNyOHE1UlJLUHhPQUZVOFRwalBFUkFRNFd4?=
 =?utf-8?B?UEpCdVRiUmk1MHJNYTRCVjRsN251L2FZenhvYlE5NFRQMk85clcwd0t2bTdx?=
 =?utf-8?B?a2ZiOGdkbVMySVR0TTRBWDlGRUpEVWlSZEE2R0VmS1d1dTVjd3FBSGc0QnQ4?=
 =?utf-8?B?MnBGTTVyQ0c2M2tOVDRGd0c1M1A5M0dMT01RQ0VscFlqSStvM2RQQnlEQzlo?=
 =?utf-8?Q?q38LTn1jiSoGqm6M=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3b582c-7e5b-4425-e9a6-08df1ed0cc75
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 08:57:04.3879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: um/NctUQG/2/s1y6DmZCvXevTVpWpnXEW4FFJQgxSO1CyRPSUhGQruIq3cQLicKgK+mRJRipbl2xqWywgi+SgkdG4sYQdL0+uaWK6ylL2O8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4963
X-purgate-ID: tlsNG-c201ff/1790758751-F6EB12A1-289AF53D/0/0
X-purgate-type: clean
X-purgate-size: 5175

On 9/29/26 5:05 PM, Jan Beulich wrote:
> On 28.09.2026 16:02, Ross Lagerwall wrote:
>> Rearrange the union to drop the .fields infix, rename bytes to the more
>> common raw, adjust types where appropriate, and simplify some names.
>> Adjust the users accordingly.
>>
>> No functional change intended.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> ---
>>   xen/arch/x86/hvm/svm/intr.c      | 16 +++++++--------
>>   xen/arch/x86/hvm/svm/nestedsvm.c | 32 ++++++++++++++---------------
>>   xen/arch/x86/hvm/svm/svm.c       | 18 ++++++++--------
>>   xen/arch/x86/hvm/svm/vmcb.c      |  6 +++---
>>   xen/arch/x86/hvm/svm/vmcb.h      | 35 ++++++++++++++++----------------
>>   5 files changed, 52 insertions(+), 55 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
>> index 4b0debfa9a2e..883fde873e73 100644
>> --- a/xen/arch/x86/hvm/svm/intr.c
>> +++ b/xen/arch/x86/hvm/svm/intr.c
>> @@ -33,9 +33,9 @@ static void svm_inject_nmi(struct vcpu *v)
>>       u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
>>       intinfo_t event;
>>   
>> -    if ( vmcb->_vintr.fields.vnmi_enable )
>> +    if ( vmcb->_vintr.vnmi_en )
>>       {
>> -        vmcb->_vintr.fields.vnmi_pending = true;
>> +        vmcb->_vintr.vnmi_pending = true;
>>           return;
>>       }
>>   
>> @@ -90,7 +90,7 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
>>                */
>>               ASSERT(gvmcb != NULL);
>>               intr = vmcb_get_vintr(gvmcb);
>> -            if ( intr.fields.irq )
>> +            if ( intr.irq )
>>                   return;
>>           }
>>       }
>> @@ -119,10 +119,10 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
>>           return;
>>   
>>       intr = vmcb_get_vintr(vmcb);
>> -    intr.fields.irq     = 1;
>> -    intr.fields.vector  = 0;
>> -    intr.fields.prio    = intack.vector >> 4;
>> -    intr.fields.ign_tpr = (intack.source != hvm_intsrc_lapic);
>> +    intr.irq     = 1;
> 
> The field changes to bool - imo that means we ewant to use "true" here.

OK.

> 
>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>> @@ -442,7 +442,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>>       if ( !clean.tpr )
>>       {
>>           n2vmcb->_vintr = ns_vmcb->_vintr;
>> -        n2vmcb->_vintr.fields.intr_masking = 1;
>> +        n2vmcb->_vintr.intr_masking = 1;
> 
> Same here.
> 
>> @@ -652,7 +652,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
>>       svm->ns_hap_enabled = vmcb_get_np(ns_vmcb);
>>   
>>       /* Remember the V_INTR_MASK in hostflags */
>> -    svm->ns_hostflags.fields.vintrmask = !!ns_vmcb->_vintr.fields.intr_masking;
>> +    svm->ns_hostflags.fields.vintrmask = !!ns_vmcb->_vintr.intr_masking;
> 
> No need for !! anymore?

Yes.

> 
>> @@ -738,8 +738,8 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
>>       struct vmcb_struct *ns_vmcb;
>>       struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>>   
>> -    if ( vmcb->_vintr.fields.vgif_enable )
>> -        vmcb->_vintr.fields.vgif = 0;
>> +    if ( vmcb->_vintr.vgif_en )
>> +        vmcb->_vintr.vgif = 0;
> 
> As per above, "false" here? (And I'll stop enumerating those cases here,
> there are more further down.)
> 
>> --- a/xen/arch/x86/hvm/svm/vmcb.h
>> +++ b/xen/arch/x86/hvm/svm/vmcb.h
>> @@ -330,26 +330,25 @@ typedef union {
>>   
>>   typedef union
>>   {
>> -    u64 bytes;
>>       struct
>>       {
>> -        u64 tpr:          8;
>> -        u64 irq:          1;
>> -        u64 vgif:         1;
>> -        u64 :             1;
>> -        u64 vnmi_pending: 1;
>> -        u64 vnmi_blocking:1;
>> -        u64 :             3;
>> -        u64 prio:         4;
>> -        u64 ign_tpr:      1;
>> -        u64 rsvd1:        3;
>> -        u64 intr_masking: 1;
>> -        u64 vgif_enable:  1;
>> -        u64 vnmi_enable:  1;
>> -        u64 :             5;
>> -        u64 vector:       8;
>> -        u64 rsvd3:       24;
>> -    } fields;
>> +        uint8_t tpr;
> 
> While "unsigned int tpr:8" would be an option here, I don't mind the type
> choice in this case.
> 
>> +        bool irq:1;
>> +        bool vgif:1;
>> +        bool :1;
>> +        bool vnmi_pending:1;
>> +        bool vnmi_blocking:1;
>> +        uint8_t :3;
>> +        uint8_t prio:4;
> 
> For these two (and two more below) I question it though: Why can't these
> be unsigned int? There's no need to engage an extension here, is there?

This follows the same style from the previous cleanup to intinfo_t and parts of
vmcb_struct. I don't have a strong opinion about it but maybe Andrew does since
he did the previous cleanup?

> 
>> +        bool ign_tpr:1;
>> +        uint8_t rsvd1:3;
> 
> Other reserved fields are unnamed. Can't this field's name also be dropped
> as part of the tidying?

Yes, sure.

Ross

