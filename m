Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5CBC5DF85
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 15:49:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396726.1634456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx50r-0000yp-4g; Thu, 20 Aug 2026 15:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396726.1634456; Thu, 20 Aug 2026 15:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx50r-0000yg-1v; Thu, 20 Aug 2026 15:49:05 +0000
Received: by outflank-mailman (input) for mailman id 1396726;
 Thu, 20 Aug 2026 15:49:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wx50p-0000y6-Ks
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 15:49:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx50p-00Fmsb-1Q
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 17:49:03 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a8721c7-e002-0a2a0a5209dd-0a2a45059354-48
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 17:49:02 +0200
Received: from [40.93.194.11]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a8721ed-4cb1-0a2a45050019-285dc20be5b3-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 17:49:02 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA0PR03MB5641.namprd03.prod.outlook.com (2603:10b6:806:b0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 15:48:59 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 15:48:59 +0000
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
 b=ja7vhr5fpibeqQGlBlMvm6M3XzIhLwV5BBF6fE4NtCg5PqNuOxyks3vrl8LfpoL80/nT+7VXg22hLkLK3qlUM0eBUcHvxUSW7FVCEfbT3ZAtJCHRUYcSlDrDsSMM/khQWG2HUuU8JMhBoMFWEpuOUunfPSVLVz3ExZAARhkfvItjeV0YwrGTIskNC2wM/u5mu3h87MKmPpHKIexG1xusdwY68Ic8uTrZKQHF/p6ndq161t9AnJWAr20XziFKXBc6KhQLXD7CqdNQ67wTtxGSwj44+gfHs4NnZfAhJBZ/00i5pO8X1mLl9/yryWaAQsDPnDQiuCbXXe4rnRx2CkjB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnefJuIRu0wkShkqU7DiAD46jww2B8UbsQLxsP1uhIg=;
 b=TSEdDm5z9Mzcpy6prFB0/yEpXX8xRFt5AbETnYKgM4Hr511JaGGQST9LSWsJb/KtijWg/yWTQLjB4n5431JeU6+SyTuTxhkvkOzp+jME8kbUQQ/KtytpaLxopoiavVeuIVF8QjEoYcVhsAppFQLqGLDhiSd6Zex68Cq7P95fOCIQ7S17UGnv/JuhZsJNpclBzxeLwmeEei2WvB3AzQtE2fZH4Ln8t78H4s4k2Z20mYCfkmrt7HF59fUY7oGnNL/rVzJYARurAtLzeLJi2Qd7ggq0YAaJmgHTGOw1jWYSuEs+1QZ/E+cD57aakTmQW4ii4PxY4/qVd5C1LK57nT2+RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnefJuIRu0wkShkqU7DiAD46jww2B8UbsQLxsP1uhIg=;
 b=NY+HhPihdfTvrF20pp1TjyCTgIE6w1u6b9FqoWQHASFLFCuS5cRv3nyhjajaX4/Q1fjrsoCQP9oycmhMLbeLPK6RIhEQrOHlTGZmek6xOWUaKQBXEwNi89gdf37WufdA7FXFAbJQFz29Vknp9nrcZ02c/MrxRs+JWWSGkNy+se4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fd51f8a9-b09b-4aaa-8aa9-13a65d0aaa5d@citrix.com>
Date: Thu, 20 Aug 2026 16:48:55 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, trenchboot-devel@googlegroups.com,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 02/23] x86/cpu: report SMX, TXT and SKINIT capabilities
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, Jan Beulich <jbeulich@suse.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
 <be993e757550b69a6f94f89476ba71131b434741.1785668458.git.sergii.dmytruk@3mdeb.com>
 <7489d730-6e91-4d6f-a355-4eaa62698c4c@suse.com> <aob9xUZF12IJhLRz@MjU3Nj>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aob9xUZF12IJhLRz@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0545.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA0PR03MB5641:EE_
X-MS-Office365-Filtering-Correlation-Id: 61c97f37-83e1-4969-e620-08defed28ce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|4143699003|6133799003|3023799007|22082099003|18002099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	4dHmmItxiJT4FsgpFe84jvEZzUtjOicIBmd2Zvoc2SQ+ZNo5/lQux5JiMytKFo5Wae/B36fQwWDKC0x7uK9CLPWU/duzm0sbePq9zlDmPI+bvX8vqmzPEsSVQkJufG+R/S5Bh4dJZnZ+SfIj6tFnpP8lfQcPY7Nr4O9ryJJjEgOMzfbQuiTGO3d/TnfRxWIO88Rvl4g7hVgZpEhJAn0v6wgDt+63l0d+1EaDc0200niryWlsV3xDlC+HBWHHzaKLGMh7dwfguYX0vaum+Unwbc0uqlfp+6+2NBJ8DJocadePTlaSuq+c1FH0cCBoH8CP9RmFHuoouqcb5eGHw5Dppgi4s8cdmZuEcoOHp5pYTLIOVOLUY81fWLtBVTt4spo6PbSdKqEo4p7XmvA3SPDOSXAJSneEVoDLWJit5JHS/ER9JEFzFnZbhRnGMUvqalHHJvjGcrLORSwykrnJzaJ7i0YN1dWcaIkH+2P2N/3mzlJ3Z7C6onbQoR7cYDUCbJugDnLhdRaA286FPli5elBIgCcGrTmOM5JwP18e/8EHQkkGc6/trYhTAhuqDeE16PmTgdeP3PrevFdINEy2KFw5b2kQ5N0lSbckqDhq7aj9b/JjnQzMa5+NHqBRTLhbhwsME0Ua5D3daoLn0DzeMFyW8IK6VLq6mM0jCl1gdiYnaCQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(4143699003)(6133799003)(3023799007)(22082099003)(18002099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEo3bFplOGl1cEtUYTJCcjhzZFA4Rld2S3l0RnhmRG01aDBtQTJubnhrM1o2?=
 =?utf-8?B?Ujd1RE9qMDhvS0k5QXZXUk1XblhnRFRVVk8zVFBOWUYvWVprT0U3bVV1WHFs?=
 =?utf-8?B?aUhlSE9qcitRR0JyVnZ2bkExTW9Wd0d5TWdPTEIvZTI2OGpqK3lsREFFVFNL?=
 =?utf-8?B?eWF0NkN4eG1mQTRHMitXTlpvWlFKV20vY3JIenpTVjB2bmZ4MDllWjNwZTdK?=
 =?utf-8?B?MmZXbzE2UmZGSy9EdStVTmhQV3Zsa3U4ZjNSZlNkYzNRQ2cyUm1XMitGL2NR?=
 =?utf-8?B?VkE1a0ltTndpUDFFWDkwZTA4RWUxUW9iaGRXZit2eDh4aEdhVEU1Z0VZZlBr?=
 =?utf-8?B?RC9Ha2dzSGs4NVRlMWk3djcxcWV5bCtsanROSFBHVEh4T0J2Vmt3dHhHYjNW?=
 =?utf-8?B?WEtFQmR2dWp6NFhldlRvR0FLK1V3R0ZoUnQ2cmJTcUk2KzczSFZ4TkVPaVZV?=
 =?utf-8?B?WEMrekd2cTltKzBrbHg2VUpKdUxXbXdCeHp4TXFuRHNKbEVCVHhHc2hJUTI2?=
 =?utf-8?B?RDlQTDBsc0ZzU0JJa0trVTZqeGFpSmNZeGhsQkRXM0l2Z2dOVEVKUnU2R3Rs?=
 =?utf-8?B?emwxejJTUEowbTIxcmxhcHdFR1UrdkFTUE1pZStlOHF6dHF3L2ZkejByUUk5?=
 =?utf-8?B?MnlLSUR1YzhiNmljTlZWYWZLYWE4QWVqelk3SFZDNnJJTVUrZmEwNkpabldo?=
 =?utf-8?B?V0R5UFhNM3lLS1I0SVg1THkrYUFsU2lwdDc5R2xDYUZwWWtrSmtWLythRlV0?=
 =?utf-8?B?Y0EwVkkrSEV4d3NSVUpvTnZnUnl6OUJ6YnlCZ0JUSFVxK3lsa0dBay9ldC9C?=
 =?utf-8?B?czU0TkhyNExNYUlWNmpiSXgzT2tIbXZZbmVPcVRUWWU2VEpwdkkwRkphYm9H?=
 =?utf-8?B?NU5mMWdmMzQ4bjlpMXNVWGwvdURITzNQWmUvMjFlYzF6REN0WXhCY1BCT1NG?=
 =?utf-8?B?VWU4L1F1SFltVUFOdVBUYVhaYStwQ21seTFHMjV4R0Z1cmdtVlduUkxKN0Uz?=
 =?utf-8?B?bmhpM0pDRDZrVGgwczk1dXpyRFZWZy8zeHJLN3daNVFlbDd1MmRsTVVWL244?=
 =?utf-8?B?U1F1RURPQU85U2RvUXpyaU83OE5wTDVEeVV0V09tSUpaS1lxTFNZREkxUVBC?=
 =?utf-8?B?RUdWZmhlTFQ0UDA5TUxtd0xUZ3cvdVROc1FQQ2Njc2JDWlM3MHJHblIzNTVN?=
 =?utf-8?B?a2psdUpBVG5hNDBNZlRVQVM4VXFaTzdzRVpidFpWRldRRXovOXNYUFNTODVi?=
 =?utf-8?B?N3pSSS9UclBRQnk1amg1VFEyVVlRTklKM2FRRDlGQ2hPdWJoczliM0I3VWwr?=
 =?utf-8?B?dUVPNU9DOFJSZXpvVmJSVGpOK0NXUmtZelA1SlpBeldqekEwM2h4cDE5TGlP?=
 =?utf-8?B?NExsd0FsRWwwRU1zNlRSTlQrcHIza0ZRQm02azk5VENwY1JVREc2NFJyY2pW?=
 =?utf-8?B?cVRCTW1mekdqT3NPMEhCT2NhMzZHbHR0b0VNVWNnZmVtdWxLY2N2WVlNZ0lY?=
 =?utf-8?B?dnk4SmNTOFh3WFNmYS9LM3JReGg2YTRIYkRDVEFuNklhTGhPd0Z1cWVYdzZt?=
 =?utf-8?B?ZCtzUUpwSDc2S3A2TGJ2N0lZakkxb25qODhKZDR5VllUOEZqQ1F1VXQ2OHFR?=
 =?utf-8?B?WjJLTWtKZXAzb3luejlTbUQ1TkhkQTFnVjRVcDM5OXdYK1NkakxWMTdFMWk2?=
 =?utf-8?B?VjRPaDhTYzQxRUh6ZXY1YVNOeDVJUjlVaGIxOUo3VzBsTEdLUk05VkR3TS8w?=
 =?utf-8?B?eGFaVWxwM0QwWm5ZWXZTVUwwSjRiRHVFaGVHZkw0KzkrRGNvUVE4dXBRUWN2?=
 =?utf-8?B?QWxMRkJFYUZlK2x3RVBEbjVyTHp1U0lrd2YzakJyeDA0SWVSTjVWQk1wS05m?=
 =?utf-8?B?KzUyRmpoZWVCaExlL3lQa1VvQ3FHZ3pSZlEwa0lZVmg2QUs5dEtNNC9rbXp4?=
 =?utf-8?B?Tk5UdmtCU1h1c3hHNlAyT25yaURRZm5CcjUyRkV6M1V6KzBlM3cvRXIvMW9v?=
 =?utf-8?B?b0piZ0R4aFRKcFkxdWVVTDVaOTBjRUFlR0ZROEE3S2cwcmU3czN1a0thTFRj?=
 =?utf-8?B?bTlKSnR3Q0dlcjVDOTR5T29Xb09sYmN3NWJLUFJ2U1JNb25mUi9BVy9xbVpF?=
 =?utf-8?B?ZFBVOU11MWIxb3ZhVHFPalF4T2tEeDFnbG5BQzdkTWJ0ZVNXbENTd0JPOXQz?=
 =?utf-8?B?NWFnWVc3SWwxd3B3QWpJQlNleGV0WE5TOXJmWmNLOVN0NGZJazJndWVsb2k3?=
 =?utf-8?B?dTB5bzhtSUYzWTFFYjBVWVMvWENNL1pMbWYySHFYSlNTUnZxV0F2a1NNQ0Vh?=
 =?utf-8?B?cy9ueVdmb1ZDS0syRFRWQ0kyMC90dmlCbDFBUUNtMVVvOWppa01BUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c97f37-83e1-4969-e620-08defed28ce0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 15:48:59.4232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DziTmE5b4hlYcYmeXgr3O0VNoKbcmNMGwWtH7LixpCyYX9C5o+bzTFYVC+HHv9IfFtAzfkZs8YozAZsQ4RDb3/sBmnXSzYVQYYQLdjTCzTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5641
X-purgate-ID: tlsNG-c201ff/1787240942-2491C2A1-69471347/0/0
X-purgate-type: clean
X-purgate-size: 2733

On 20/08/2026 2:14 pm, Sergii Dmytruk wrote:
> On Tue, Aug 18, 2026 at 02:08:48PM +0200, Jan Beulich wrote:
>> On 02.08.2026 15:09, Sergii Dmytruk wrote:
>>> @@ -620,6 +625,49 @@ static void init_intel_perf(struct cpuinfo_x86 *c)
>>>      }
>>>  }
>>>
>>> +/*
>>> + * Print out the SMX and TXT capabilties, so that dom0 can determine if the
>>> + * system is DRTM-capable.
>>> + */
>>> +static void intel_log_smx_txt(void)
>>> +{
>>> +    unsigned long cr4_val, getsec_caps;
>>> +
>>> +    /*
>>> +     * Run only on BSP and not during resume to report the capability only once.
>>> +     */
>>> +    if ( system_state == SYS_STATE_resume || smp_processor_id() )
>>> +        return;
>>> +
>>> +    printk("CPU: SMX capability ");
>>> +    if ( !test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) )
>>> +    {
>>> +        printk("not supported\n");
>>> +        return;
>>> +    }
>>> +    printk("supported\n");
>>> +
>>> +    /* Can't run GETSEC without VMX and SMX */
>>> +    if ( !test_bit(X86_FEATURE_VMX, &boot_cpu_data.x86_capability) )
>>> +        return;
>>> +
>>> +    cr4_val = read_cr4();
>>> +    if ( !(cr4_val & X86_CR4_SMXE) )
>>> +        write_cr4(cr4_val | X86_CR4_SMXE);
>>> +
>>> +    asm volatile ("getsec\n"
>>> +        : "=a" (getsec_caps)
>>> +        : "a" (GETSEC_CAPABILITIES), "b" (0) :);
>> Nit (style): Bad indentation, missing blanks, unnecessary \n, and stray colon.
>> Overall:
>>
>>     asm volatile ( "getsec"
>>                    : "=a" (getsec_caps)
>>                    : "a" (GETSEC_CAPABILITIES), "b" (0) );
>>
>> I further question the need for volatile here. (Like for we have for CPUID, we
>> anyway may want to gain a getsec() wrapper for GETSEC.)
> I think `volatile` was added just because it doesn't hurt, rather than
> because it's necessary, so it can be dropped.  Can add a wrapper, but
> there is only one use so far and a generic wrapper will have to use
> 64-bit parameters (`GETSEC[EXITAC]` sets RBX).

GETSEC is a horrible instruction.  The different functions (eax input)
produce and consume different registers,

This in turn requires different volatilities.  GETSEC[CAPABILITIES] and
GETSEC[PARAMETERS] should be non-volatile (they're read-only operation
without interesting side effects which the optimiser can safely discard)
whereas GETSEC[ENTERACCS] or GETSEC[SENTER] are really "jump into new
processor mode".  They're both longjmp-like so are considered volatile
by virtue of having no outputs.

I was going to request a getsec.h header to abstract these away.  Having
more than one location where we need to carefully check the asm
constraints against the SDM is too many.

~Andrew

