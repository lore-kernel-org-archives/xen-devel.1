Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A1F606A31B
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 17:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=fcBMeCk1
Received: from list by lists.xenproject.org with outflank-mailman.1458457.1670692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJwHO-0005Mq-KT; Thu, 22 Oct 2026 17:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458457.1670692; Thu, 22 Oct 2026 17:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJwHO-0005Mi-Fq; Thu, 22 Oct 2026 17:08:38 +0000
Received: by outflank-mailman (input) for mailman id 1458457;
 Thu, 22 Oct 2026 17:08:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xJwHN-0005Mc-0G
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 17:08:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJwHM-00EGEk-5v
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 19:08:36 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ada42c7-2eae-0a2a0a5409dd-0a2a4504bc54-24
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 19:08:36 +0200
Received: from [52.101.85.30]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ada4312-b57f-0a2a45040019-3465551e979b-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 19:08:35 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB5301.namprd03.prod.outlook.com (2603:10b6:610:9d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 17:08:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 17:08:31 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifMDwCHEwRHq13CmiVej6qb1F3hoR+ule+o+kvKDz8NO+4rU6F/qxxumOpjmsEi4ucBU3O4DPCDS5kRS4973IwEvQiaeN/KOuabEDLqJchneUKgeBsCQnhzc+jITvvSRUEAFca9Oi0iS7VZ4JT0r4yrwUaY7gEEp/wUVW29qtpMsg+TG++uCD4aWEWaNZlLPgEwLNoaJCx4FY8ocwAhUUk0APPxgT1KRE0GI2IHtoBKwpu1f/1sbGVXpUbgTYfUtYeS6L22kCJVN17kPkIsFR/yaI0aszo/RKOKn+SGXcYfMfbeQL+CoKpKPJ9lBR9W7gcUpfmM2XKx8M81zNnqBAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7LXFtEsWDolrsJFGMGXmMfEF4jyBd86w9aFZXL3WXU=;
 b=woOQcPKKiGccmq5dXWSm/l6NK8P/5LVbqR4wq1ljgImyILal3l9ly5skS+/IXYuyUqObx0LeFF40RL7PCqLJe6Vbf/zjAN17ZXr83zTRWYAqpiee0VOg+C2WU+abVFhXpw+XLlNbv7Mwd9e75uLS278apiqlgceZtKlkdZo/PeJD4sjJnEcGHMtEIRyd47fWsqNGT9pqmdkIi86xdW0SlJ120ULowRMtr+2Ec8OZngNN8e8Wg97cR4m5Ld6GoKnwBMaiRyk/VEPl/GA4sYs4GZvf15Io8p78TVnYJVuhLFKMtjcRwLuu5hp6R8mxsiaV0cDx72CvdDWuffKt4fiiQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7LXFtEsWDolrsJFGMGXmMfEF4jyBd86w9aFZXL3WXU=;
 b=fcBMeCk1jMiuPUqLd8Y5iCIAXjIiVGiWAIDlPjoqnu4k6dI8BSc3mVSYwgYphc6tAkjWE3Ui/D1HgqPXReBChJy9qy8+brE4HjMxFHD3FfqvkmFSXKiArcxaKCUXOiB7LzvQGYHcjYmYEo/0bufYY9oUAVSN+TVB/cG8GCQjTMA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <192c430b-565b-4b89-957b-01b80ede9049@citrix.com>
Date: Thu, 22 Oct 2026 18:08:26 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger@xenproject.org, jason.andryuk@amd.com, teddy.astie@vates.tech
Subject: Re: [PATCH] xen/x86/svm: Apply the virtual-8086 IOPL check to INT n
 only
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261020224123.3710391-1-stefano.stabellini@amd.com>
 <86d6b7b5-41f2-41b4-8710-7356c78fd15e@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <86d6b7b5-41f2-41b4-8710-7356c78fd15e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P191CA0050.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::25) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ad8888-a909-4a99-7927-08df305f18fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|4143699003|11063799006|261021121427099003|261009223027099003|261021123027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vSaW3PJPBIf//IdvaI0aKrV2QxMlknSKHDxV91+mJlSTbsRLIKxHG9C5F+aUtpB2zXXtOXlZRiNSDaOHbWsCqTxB7T7Bam5LR0uxJQxoXI2JoSOmuEjU0dd5KwKm8dz4uhH6LtuI5467Y3pX9APTsSmleXznbFY0RtooIt/aEsZE25BDTfGi+miUiDh6E+vNYXrWH2aAW/2OUdDMvFvAu3Wize9yywv3ALTy4mE0ndv/iT4ZTb9xgq3mOlToLxd6ecV5RNmp5xFk4quH1kwwY3VXy/y+UKqaRsRuEEWRtx8R1GKPK8RTxXlD7pLn3IcNFyMfKRl+SZgqrGe36IL/XSXSpHJ+KxWlbtS9hTF1rZUrHrPobpNplzx4XZ10mPQ6/WcHc8N21XPWxaOG5R6L/xwljGfX7z5D1vAeimiwyXIePCM8e1ChuZRxZ1zxfYMQ2zyGFZRJyu0DcL0kaVBU6akyIRg/Q8H7ugni+Ba9FCLfaTlzHeVPrdGRgOiuIbFpUqFhe5As6pFedsL0lcrpCWd8sP5VHOCa2W+ICf2oUAQB97IQsRHLZNXrykjG8eWjeBdsfNmz0V7uazZtjptHeoCMZs7g6h3xppkOBUHaljukrvrsFyeO11XxOxDSPT+Y2bAnIv0AoDanw2aUE1cD2oHA++j0h+VnG6+MtE4X5qc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(4143699003)(11063799006)(261021121427099003)(261009223027099003)(261021123027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGlsVkVBc2lyS2dxbkxDallYUThXQlBCNmF6ZjVuTWtpYVk5UTRwYWl1Y0lS?=
 =?utf-8?B?cm9ZcmV2MVJoeUNnY3RXSDN2eHpBRXJCRmN2SU95eUdUUDVpRGROTGMvTmxT?=
 =?utf-8?B?ZnRHVnFuSHB6OW9MMC9ENTkrbStPVUwrZ1F6K0NWdUdZc3A4VWREMzdmNlVJ?=
 =?utf-8?B?QzlBWjZmbm1VK1hnUUg2ZmxWU1lwZEx3Qk9HVW0ram5weHJDQUtoRjcvRGxn?=
 =?utf-8?B?bTZpUmxjRHBsMWJ1RVpqNlpEK3JBWmpsbkJvMndkT0hwSWlNUHNIcStJTkZD?=
 =?utf-8?B?eTVUZllXai9MMEw0WG5WWGlyTzRXS1JwQzFWbVNrUVNmY2M0ME00SEh5QTVz?=
 =?utf-8?B?ZmR1ckViNlJLOEdSUDZxeFBaSkxmNFZ0TlF1cG9LbE11VmtWVENRcGM4REt0?=
 =?utf-8?B?Q2Z2c1lxUzQ2aTdFQWZTOE5WUlk5OHRJOEh5Y2VnbFA0QXFEeUp5S1BuV3RB?=
 =?utf-8?B?b29DRW5HbkNOUWVnMVpVM1U2WkJUcWF4SlhETFJDbXhhM0NQUzhDNXU5aHlV?=
 =?utf-8?B?TnZSQmg0WGhSWmg2VEZmcGZlWDI1ZUhUV012WW9lYXVFb3ZYYjlCN3ZTb1Ez?=
 =?utf-8?B?OE9UVW9ZMVJ3Y2ZFN1FvakFpQ0Myb3plbVV1ZTFmV1RmczNPd01tZ1Z0QW1D?=
 =?utf-8?B?RlYxcVl0dmgyamJCS0ovTW9rTWJ6cnh3WE1YQnBwRTZ0bDBYR2VvOFEyM1VF?=
 =?utf-8?B?N2tiYnBFbWV0TmZtcmVEMVFtQVRRSjI0OGdrbE9NQ3o0OGVFR3FmTmVBRWxR?=
 =?utf-8?B?c3o2dlBsV01aN2dCQnpmeVU1Ty9SZlN2MWZHNFdFdkRNcG5pbVh1RThiSjdx?=
 =?utf-8?B?YnVmRy8rV0U1MWd4bDFQM1c0Y1lJeWwzS2RUVGFvbGJxNlhtKzZnMGlNNzVi?=
 =?utf-8?B?WUY3Tkt1M2pCWmk3MkRuVGhUSENjbzFkWTdXNW9mYWhFQW9FVWMzM045QWNS?=
 =?utf-8?B?enNaYyt0bEpXeG1MRHl6TGZ6TFRVYjZodUVjUVF3VDJaeUFibUQzUnQwQUhF?=
 =?utf-8?B?NGdVaG9zQTF4dnRNOUtpcm1nWXp6TjZ5Nm9IeUhtTytQVGl0bjhaOHlzN0Z2?=
 =?utf-8?B?TjNncEdrQWY0M25YOEN6ZTloMFhXYzFVYStVa2ozdkVWWlBNQ3FMVFlvQ3Z1?=
 =?utf-8?B?eWxaajJrdVFWVXRzNlVyVzJ1ZnZjVnh6dWZmc0JBOVJ1SGZxUjRtbXRlSGZa?=
 =?utf-8?B?ckxpSWpOK2tPZWV5YjI1RVkxOGRtNDZsbXo1WjBQbEhnZU9hTGNoQ0lXQ21J?=
 =?utf-8?B?Y3JBSTdieng4dzZiRUhXN3JLVyt1TmRhaTZaVjVhc0N3OXNhS2VvcVFHY3ZF?=
 =?utf-8?B?c2l1WHdTWVRZYlIzS2pRWGtxSVliR1F2RmN6Nk14aHd0OEQwVjk2elBNT2ph?=
 =?utf-8?B?TDd0OHRxekNYMXZlZUdTZ1dwaGdRengxSWlJQ2wrVHpwYjZTcFBDU3NvYnkv?=
 =?utf-8?B?OEt3MkNsVGZzc2hoVHJPbURKUFVGRUdNb0ZvRE8yTUpzdlJnSEYzNmVsZTVq?=
 =?utf-8?B?dDhjbkRQZmZmZEo5QVQxcnY3a1pQZWdDbGFwVDMwZ1pVSzkyRUEzbFhTWEZi?=
 =?utf-8?B?NTlEcHJ6c1Y2L3hZVmRPSGRHVkFBMjhGV2piT0U2SFREMFJqWWRYV1o2ODh0?=
 =?utf-8?B?OVpyT3ZhYTh6bXRtNUJzcnpzRnA3OCtBeitOT3BHWDdyUWs3ckVCckZyQlJn?=
 =?utf-8?B?aE9Ud0o5RVpKU2E3L1RNSnhMVFFLZm9QZGQyd2lGdEVFOGdUbWJqMk5nU2or?=
 =?utf-8?B?Z1k3ZnBtUWxPcUZzcHpGeWp3Q1JhUXZqVmRiMVZhRDdDQW1jdmFIOXFzajRH?=
 =?utf-8?B?dldLMEozNWtUUnpCb0p6NTNaUzlybFJoVjJ1ZFFhRmJFR2hXTTBNRERkS1Y2?=
 =?utf-8?B?anU3b3FMZ1Y1V0FLcnA4Y3drczl1V2phRGRIUVRMcFk4NE84cnU2NTgvKzF2?=
 =?utf-8?B?OTVHaDVWZTdoblZUSDdodFpHUlp3U3lnMTZ2SHRTV3VhYnMrbllCRHhpZDJT?=
 =?utf-8?B?TU1zM1hZZXBrejE3UnQ1T2lMMkdhYVV1OHcrM1ZFblNXNHBaSkQvbmszRFFB?=
 =?utf-8?B?Z3FTNmE0WXZaUlFqVTRUU1k5Q2UxVlo2S0Q0WTZRaGlTQkQzUktpT0hvZi83?=
 =?utf-8?B?STArem1vSUdkaGk3bEk4STA2dmcxeWhranEzdUZJc3hGbWNuRG5JaVpCaEs3?=
 =?utf-8?B?QVErVkNQaG1oaUFhUkRnUlNsaVRmSnAwQzJBR3NWajVYWHZadnFKQkMrdWIy?=
 =?utf-8?B?Ull4d1ZrRmsrSU1vMm13QkhNMUFqSElUaFRLT1lGbEtqY0NEbGNPVS9qallW?=
 =?utf-8?B?RmpDbStiQjNqMWdtR0JkVG1WTzUxZ0NYRU96VUVWbnU1ZktkSW1zZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ad8888-a909-4a99-7927-08df305f18fc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 17:08:31.1047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AkK5ERK3Q0KtVJDzJ9EGBXzRWD7Glbiz2o00R926yci6CpO/uFnpGM4h2YkT3elSCji6pUlYznHApyovrIoLOqVuy9C0TGNXjHoQ7fqrOws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5301
X-purgate-ID: tlsNG-ebf023/1792688916-C06DAB50-307BA9FF/0/0
X-purgate-type: clean
X-purgate-size: 3868
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22/10/2026 2:55 pm, Ross Lagerwall wrote:
> On 10/20/26 11:41 PM, Stefano Stabellini wrote:
>> In virtual-8086 mode with IOPL < 3, INT n raises #GP(0).  INT1, INT3
>> and INTO are not affected. They are delivered normally.
>>
>> svm_emul_swint_injection() applies the check to all of them, so an ICEBP
>> raises #GP instead of #DB.  It also reports the IDT entry in the #GP
>> error code instead of 0.
>>
>> Limit the check to INT n and use error code 0.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> ---
>>   xen/arch/x86/hvm/svm/svm.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
>> index 71e48351f2..df74531d1a 100644
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -1153,9 +1153,12 @@ static void svm_emul_swint_injection(struct
>> x86_event *event)
>>        * 32bit OS.  Someone with many TUITs can see about reading the
>> TSS
>>        * Software Interrupt Redirection bitmap.
>>        */
>> -    if ( (regs->eflags & X86_EFLAGS_VM) &&
>> +    if ( type == X86_ET_SW_INT && (regs->eflags & X86_EFLAGS_VM) &&
>>            MASK_EXTR(regs->eflags, X86_EFLAGS_IOPL) != 3 )
>> +    {
>> +        ec = 0;
>>           goto raise_exception;
>> +    }
>>         /*
>>        * Read all 8/16 bytes so the idtr limit check is applied
>> properly to
>
> I think this is correct. The check could perhaps move earlier to avoid
> needing
> to reset ec to 0.
>
> I do wonder though if there are other cases in the function where ec
> needs to
> be reset to 0? The pseudocode in the APM seems to have at least one
> other case.

I confirmed, and indeed it is #GP[0] not #GP[sel].  Also that
ICEBP/INT3/INTO are not subject IOPL like this.

I agree with Ross that this wants moving earlier; between the CR0.PE
check and deciding idte_size.  The comment also wants adjusting, so I
think it wants to look like this:

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 71e48351f22c..c83b28d29727 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1140,6 +1140,17 @@ static void svm_emul_swint_injection(struct
x86_event *event)
     if ( !(vmcb_get_cr0(vmcb) & X86_CR0_PE) )
         goto raise_exception; /* TODO: support real-mode injection? */
 
+    /*
+     * In vm86 mode, INT $N is subject to IOPL.
+     *
+     * TODO: It is also subject to CR4.VME=1, which would require
reading the
+     * TSS Software Interrupt Redirection bitmap.
+     */
+    if ( type == X86_ET_SW_INT &&
+         regs->eflags & X86_EFLAGS_VM &&
+         MASK_EXTR(regs->eflags, X86_EFLAGS_IOPL) != 3 )
+        goto raise_exception;
+
     idte_size   = lm ? 16 : 8;
     idte_offset = trap * idte_size;
 
@@ -1147,16 +1158,6 @@ static void svm_emul_swint_injection(struct
x86_event *event)
     ec = (trap << 3) | X86_XEC_IDT |
          (type == X86_ET_PRIV_SW_EXC ? X86_XEC_EXT : 0);
 
-    /*
-     * TODO: This does not cover the v8086 mode with CR4.VME case
-     * correctly, but falls on the safe side from the point of view of a
-     * 32bit OS.  Someone with many TUITs can see about reading the TSS
-     * Software Interrupt Redirection bitmap.
-     */
-    if ( (regs->eflags & X86_EFLAGS_VM) &&
-         MASK_EXTR(regs->eflags, X86_EFLAGS_IOPL) != 3 )
-        goto raise_exception;
-
     /*
      * Read all 8/16 bytes so the idtr limit check is applied properly to
      * this entry, even though we don't look at all the words read.


I'm happy to adjust this on commit if you're happy?

~Andrew

