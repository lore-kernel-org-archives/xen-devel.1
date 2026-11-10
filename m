Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAE9606A32A
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=QpH1oosQ
Received: from list by lists.xenproject.org with outflank-mailman.1481514.1685413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQjWk-0005gO-5G; Tue, 10 Nov 2026 10:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481514.1685413; Tue, 10 Nov 2026 10:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQjWk-0005gG-1Q; Tue, 10 Nov 2026 10:56:34 +0000
Received: by outflank-mailman (input) for mailman id 1481514;
 Tue, 10 Nov 2026 10:56:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xQjWi-0005f2-LL
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:56:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQjWh-006vTC-RY
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 11:56:31 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af2f840-e002-0a2a0a5209dd-0a2a450cc112-46
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 11:56:31 +0100
Received: from [52.101.193.39]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af2f85e-f479-0a2a450c0019-3465c12779db-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 11:56:31 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DM4PR03MB6016.namprd03.prod.outlook.com (2603:10b6:5:38b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:56:28 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 10:56:28 +0000
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
 b=YhrNuUhW58EDs0fADK4qoXm//PxouxlXFAgngWyonRIbcH29T3u3Ml4wOB4EwQjC1QgmOc4UOUyzx2hOF4rysLdeKL9nhrOOLjfW4QOhn1oh7zfrulnb3h6lKnMlxyHg1XZeZlCeJKLRG3nvQ+ur7gHqiQInFo+g+fnaf4nUATVrFINJGoXP2ySuyajcoUflHUVH3tYS1DwXoq3+2CU8/qiuOzQ83hRmf+AxFoEU9ldZgBfPk7Jt59sfbwDwmXvhGxxrMf7owP9Bz5B0SmY3fkmviEmlm9S3gZr/Qa4q51K7ZG7AyhgE7m/+2r6Qmg4jiY76SYLcqFOmqweMf84paw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4PJnPFnPt+wsbKCRq51OUG024ag8+OsnMLkI+xpR5E=;
 b=F6bP6m1UU8VXX36W9DZK1EoTi7vSXssdMH8JSeSVhA2y8b/DRl86XVog3t6uqoHNQxRlwNCNZ5bgR5aRF2hT2UEFOG1oZoCyRAxVQGq1XnViYBzRo44UDTxlBmc2usRckChFpW1pTt/tLmQBtgOTspWpgq5mzi9844Z5e46XhRt8OhVX/rexFalHpZ5tEZQTLGuqzkdxA0YsVXIhympUjKw7XbNEF+8tHpoUeIPzCo1W4VAd92F+tJO1C3x07SpAGMPt1Q4958HDiyxcm0+PRGtUETMUZXDqdwipW1P0k+3ppOWX8qmcePuTYD4IDKZYeiXfAknVKEJtxC6TxOVjtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4PJnPFnPt+wsbKCRq51OUG024ag8+OsnMLkI+xpR5E=;
 b=QpH1oosQl2DAbTS9g7PShZ45M+AWbZAlawd50Wfrhy5CbeGvRUvPrF5J5qfCsN6bsh3tVPYQ8EUNl42vlcDzyCwQWVUfIbrflBbiI+QC8eFPisM/hELrlXlKOFO/ZeqyU1aavdLJUofZ97+VB0Xmg5SbONK+n2bAAA9/qiQnBD8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d30f3fd6-72d9-4e88-a8d3-68f7a2c13076@citrix.com>
Date: Tue, 10 Nov 2026 10:56:23 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/28] x86/hvm: introduce vcpu_is_vlapic_tpr_emulated()
To: Andrew Cooper <andrew.cooper3@citrix.com>, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, jbeulich@suse.com, roger@xenproject.org,
 teddy.astie@vates.tech, dmukhin@xen.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-12-dmukhin@ford.com>
 <91314054-b75e-4429-9358-c9bc95b40ecb@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <91314054-b75e-4429-9358-c9bc95b40ecb@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0057.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::8) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DM4PR03MB6016:EE_
X-MS-Office365-Filtering-Correlation-Id: dde3804f-c35d-4804-e121-08df3f194585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|4143699003|56012099006|18002099003|22082099003|10067099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	OeIfBwNGypoq/3aTV/th3MZciXO0tNIYKeQnLMbXc7aw+uTPi+PlmkNAW/lGq0jcBYT3XwgnGE568erR5TdqxOBu+1ntSBPxdEydwVP6A3hbz2rVBE9n7C4J5jBLyAGo2c025wFxkBbeRoKGfq73TOv6qVvSYFJs3NyTaqXN4IsZ1p7Kt0zkiP5h+nugr7SLWhadkl5eWl61A+xUG4mhflbA+IEKB2Ek96K5Nb+bUZQw4UcLDZVQH6b+uicwwBbWukSP+LYz2KN5a8on1/Ynfd+WLFkue2/85FgTov+aamDUsdB+o8YMEP59WfmjPpJiI/mVXIuu7ClFwou3Z4aXuAtqHSLFLOilaakDBruP6Qa5XPZG3sxNQZwmXybChNTXsvie0B8x0q+cOSuevXobaEbad55SkNlXJihSP7KG40sHgFFejhXtoaPeHCUHJg0sro/Kd48qKlIITPslESS8VEhUABgLF9JtjLey2RzmQzseV5Zx45mupw6V8H+pZkraDfxQNXbGGPj4734xBquOCO1r4yujE0YkrK91hKgbegRaXWIuOuhbXp5X9zx36T6LQVPisBwIRfkVVJPpWgMhfPCfX4CR5dcjCCLNUyLvcC3bNJb19q33WR9FZZ7qoK9GMMS6/JwjxZ8eVmA9mypawwGNlpnKkeky9s4KAWZCJQ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(10067099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFBwY1RqcW82VW9wZnlpQ1NhQ0dydFBHMW1pTFY5eCtaRUFkTGFyWW1uTXp0?=
 =?utf-8?B?VEVBM1JYelRUbDd3M0NOWHpsTXBvSUVkWWNPbmdXV1pjWmw3dkNFcUg1UzBZ?=
 =?utf-8?B?WDZNbEU1ck9GMG9tU3F6a0lzVE1jWmFUMG00RU0xT2hkVngvd3BvWDlwdnk0?=
 =?utf-8?B?TGVlUmFpMGltWDZwSDBwVS8vR1ZkZTlyd0tHSXlOVlYwaE5vc21tTDlTUVN0?=
 =?utf-8?B?cFdHOGpZMHphQ3B6OWplSXVuVzRnck80YXMwQWFIRHpXVVlSMTN6cXJqeEdV?=
 =?utf-8?B?WktNbU9EL0U5TXJQU2VtSmNuZkpXU0NYRXJ3WEJOdDE5enRtREFlQ01tN0Vh?=
 =?utf-8?B?SlpmbHNXMTJrMk5aZ2xFZTRZYnNIbFU0S25jNEdLUVZ3T0xZMHIxL0VxcWcr?=
 =?utf-8?B?Sm4zdUZnQmNEOVRUWUljYy9ib0dMb0FzbUVTT2U3VWk4dnRyYk9Lc3IyeVhM?=
 =?utf-8?B?UTlyc3RGdW5WNjlKSms0OTR1UmxnYzRkbTZicFNWZE02Qm0vK2FtVWw0endk?=
 =?utf-8?B?bEdvY3U1Qnl1dFczZHQ2a2VkcmFEaC9Qa1pFZjN3OHVyeldHMFpBZXdhNlJI?=
 =?utf-8?B?ZFpyam5lNFUvLzJnOEJJT2NKWVd4dldzNk1yQTdHZDJ3dkN2dW9zMm9YT1B0?=
 =?utf-8?B?UktoLzB2LzJydUhmVEo3dVNwSkx6OW54Y3ducjl2a2UrNjlmWUk2bTE4dG56?=
 =?utf-8?B?cmhQMGF1R29STmEvQk9jZy92ZkpKZkdYUTZHL21yVHhBN2txazlEODFKVmFE?=
 =?utf-8?B?NWVHSWJVa1drVE0yenMveldCczY2Sk14ekxPUHJ0VVcxVWZCaDlVTm80SUFW?=
 =?utf-8?B?VmJmNDJHNTFxWWtack1NVXhJcTF5eExyUXdVbFJkTHcyYUNtbGpzR1JSQlRS?=
 =?utf-8?B?UlVmSEJVWkZBNzNOTUdSRW9uazlGV1FLMkpCVStLVlJWdDIrdG1Wa2RhWFBG?=
 =?utf-8?B?UlZDcU1CeHpDMWpLRzFjMkFBS3g0b3MvRmNucXRVamljU09FRlloYlhSMmY3?=
 =?utf-8?B?Rm5yY0pISm9kQzRxSVZPSkVGelN5YTRMRWRBWUlqc29ZYW5tTTgrWWlidVdS?=
 =?utf-8?B?TlVWWVFXMFp5dFcvRUprYmNaQ0huSzRjVW1EWk92azJuWFh2ZEtXeXZxd0N5?=
 =?utf-8?B?N2hDT3lEbnJBSmxlSVlsaHlyREwvQmtpUXJzbXgxbTFZZ1EzNkJXYVFDeEh2?=
 =?utf-8?B?Rk5qME9GSVUzUDBhNWdreU1mZ1FuOVdWM01FYmp0SmFXUkRCcWhmVGViUjQ1?=
 =?utf-8?B?SU1heXpNcENvNEtqZDVsaW5iQ29pWm16RkdOTUJERFRxK0t2S2w2ZUYxbjB6?=
 =?utf-8?B?aERCRTRwcVF5ZXZmVGZBS1M0M3o5ald2QlBhNTBqQVFSVUs3QnpCdURQLzMx?=
 =?utf-8?B?aEsvbzZwMkJzWFR0OFhRdExuZmhLL0FJMnRTZ3dLOXRZMnl1N1k3clpRUDhB?=
 =?utf-8?B?MWViSDB2UHF3ZjVjS3BtUSs4TVFlUFlneVpMTTZOSkpCMzYvRFBhaStLNGRH?=
 =?utf-8?B?RXFXRVk3enFsb0s2Nyt5cGRaNjdkMTM5QjgrZy83bXFXdldTSGdKYTc5dDI5?=
 =?utf-8?B?K2VLTVlKMXlDWU5EcTMvQXhZdW1UeGJZMXdJemdkMERqSnVnSFJZaFR6K0NI?=
 =?utf-8?B?VjM4bkYxRC9Ma0dTcUFnMDIwUXFlUjhiUU0yVUZpcnRLWGR1VVc3cC8yM1ps?=
 =?utf-8?B?OGp0eFoxTEZaWWdJK3Zub3RRWUwwc1BaVmhwdzlnbjkwV01OdmRWNEtGS0wx?=
 =?utf-8?B?eVRta0J0RkNnY3hTTXVRL0xBbWpWOEhpSlR5SXZiYktIWXpCZ1dhNE9lckYx?=
 =?utf-8?B?dUVselh5czQ2NjcvVEhBendNNTV5dFFZbGpQYWhhQ1pOSDZMRFBpbXByRTZr?=
 =?utf-8?B?MVczaFZvd2NKWEVVd3BkKzh6ME9vODVGaDFibXlubjBGbVJwb2ZiSG5Sdmdu?=
 =?utf-8?B?emZqbHMwYlMyVVlJR0RNZXBja2Q4NFJCcmh4VzNmdCtIcnJScHNvRzQwR2Rj?=
 =?utf-8?B?QUI4Z0V2eGlaQ29JUEZMMnY4NmF0MkVUUVZhek9DelpJb1VKYmw5TUFKN0RH?=
 =?utf-8?B?L2J1T01CMEZKcmYxOG84TmI5VmlwWWlMdzA1VWpYbitmK0RWeGp0eExCWWs2?=
 =?utf-8?B?L3QwSmV3RmJvNjVMcTU0QTZBNU9wcXVqeStyMk5Zc3Z1ZklZRjFRVi9jYXJV?=
 =?utf-8?B?NG9PdUhvMHJwL2J3OTZFemlFZ3Q1bVlDbDJ4RTdzTmtjM3NVSjNlZGljVllk?=
 =?utf-8?B?K2VORU5pNkp4UTNNbUZHK2YwZVdseUg5WUZsZnh3K3dCb0pKUWxPOFcxdDR6?=
 =?utf-8?B?U2ZBeG5ZUG9QbVNQZytvLzJSTE1HL3FPSGtHTTl5b3R2cXR1bXNRZXNTL0pO?=
 =?utf-8?Q?ZfsKkMNyakWco4SY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde3804f-c35d-4804-e121-08df3f194585
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:56:28.3992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1EHhbw2PUDXyryMY87lZIijR19rSR0fF76+BTUW4lUSsRhIAziHYfZNAd4mpMxozERI/V4nKqpAbFAqBeH4U6gPCjon/8V9EPVlGcgnBZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6016
X-purgate-ID: tlsNG-d25034/1794308191-030D9A5B-2CD9B627/0/0
X-purgate-type: clean
X-purgate-size: 6951
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/6/26 1:36 PM, Andrew Cooper wrote:
> On 05/11/2026 1:33 am, dmukhin@ford.com wrote:
>> From: Denis Mukhin <dmukhin@ford.com>
>>
>> Introduce vcpu_is_vlapic_tpr_emulated() in genetic SVM code to account
>> for the case when platform provides accelerated access to vLAPIC's TPR.
>>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>> ---
>>   xen/arch/x86/hvm/svm/svm.c | 38 +++++++++++++++++++++++++++-----------
>>   1 file changed, 27 insertions(+), 11 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
>> index 673c818a0039..14a86ca4ff8f 100644
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -925,6 +925,19 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
>>       }
>>   }
>>   
>> +static bool vcpu_is_vlapic_tpr_emulated(const struct vcpu *v, bool force_noaccel)
>> +{
>> +    const struct vlapic *vlapic = vcpu_vlapic(v);
>> +
>> +    if ( force_noaccel )
>> +        return false;
>> +
>> +    if ( vlapic_hw_disabled(vlapic) )
>> +        return false;
>> +
>> +    return true;
>> +}
>> +
>>   static void noreturn cf_check svm_do_resume(void)
>>   {
>>       struct vcpu *v = current;
>> @@ -933,7 +946,6 @@ static void noreturn cf_check svm_do_resume(void)
>>                           v->domain->arch.monitor.software_breakpoint_enabled ||
>>                           v->domain->arch.monitor.debug_exception_enabled);
>>       bool vcpu_guestmode = false;
>> -    struct vlapic *vlapic = vcpu_vlapic(v);
>>   
>>       if ( nestedhvm_enabled(v->domain) && nestedhvm_vcpu_in_guestmode(v) )
>>           vcpu_guestmode = 1;
>> @@ -959,8 +971,9 @@ static void noreturn cf_check svm_do_resume(void)
>>           vmcb->cleanbits.raw = 0;
>>       }
>>   
>> -    if ( !vcpu_guestmode && !vlapic_hw_disabled(vlapic) )
>> +    if ( vcpu_is_vlapic_tpr_emulated(v, vcpu_guestmode) )
>>       {
>> +        struct vlapic *vlapic = vcpu_vlapic(v);
>>           vintr_t intr;
>>   
>>           /* Reflect the vlapic's TPR in the hardware vtpr */
>> @@ -2538,7 +2551,6 @@ void asmlinkage svm_vmexit_handler(void)
>>       int insn_len;
>>       vintr_t intr;
>>       bool vcpu_guestmode = false;
>> -    struct vlapic *vlapic = vcpu_vlapic(v);
>>   
>>       regs->rax = vmcb->rax;
>>       regs->rip = vmcb->rip;
>> @@ -2565,8 +2577,10 @@ void asmlinkage svm_vmexit_handler(void)
>>        * NB. We need to preserve the low bits of the TPR to make checked builds
>>        * of Windows work, even though they don't actually do anything.
>>        */
>> -    if ( !vcpu_guestmode && !vlapic_hw_disabled(vlapic) )
>> +    if ( vcpu_is_vlapic_tpr_emulated(v, vcpu_guestmode) )
>>       {
>> +        struct vlapic *vlapic = vcpu_vlapic(v);
>> +
>>           intr = vmcb_get_vintr(vmcb);
>>           vlapic_set_reg(vlapic, APIC_TASKPRI,
>>                      ((intr.fields.tpr & 0x0F) << 4) |
>> @@ -3097,14 +3111,16 @@ void asmlinkage svm_vmexit_handler(void)
>>       }
>>   
>>     out:
>> -    if ( vcpu_guestmode || vlapic_hw_disabled(vlapic) )
>> -        return;
>> +    if ( vcpu_is_vlapic_tpr_emulated(v, vcpu_guestmode ) )
>> +    {
>> +        struct vlapic *vlapic = vcpu_vlapic(v);
>>   
>> -    /* The exit may have updated the TPR: reflect this in the hardware vtpr */
>> -    intr = vmcb_get_vintr(vmcb);
>> -    intr.fields.tpr =
>> -        (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
>> -    vmcb_set_vintr(vmcb, intr);
>> +        /* The exit may have updated the TPR: reflect this in the hardware vtpr */
>> +        intr = vmcb_get_vintr(vmcb);
>> +        intr.fields.tpr =
>> +            (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
>> +        vmcb_set_vintr(vmcb, intr);
>> +    }
> 
> There are a large number of bugs here; they're prexisting, but this
> isn't helping.
> 
> First, these final two hunks are wonky.  They're necessary, but only
> because of bugs elsewhere in Xen.
> 
> In order to explain, I need to cover one of the bigger sins of the AMD64
> architecture, CR8.  See APM Vol2 8.5.2 External Interrupt Priorities.
> 
> Windows (at least used to) write APIC_TPR very frequently.  Microsoft
> made demands of the hardware vendors, and AMD made CR8.  AMD invented a
> register called TPR which is an architectural abstraction of APIC_TPR,
> and defined it's access to be via CR8.  They even made LOCK MOV CR8 (an
> otherwise illegal encoding) be an alias of MOV CR8, for 32bit software
> to use.
> 
> AMD state that it is undefined how TPR and APIC_TPR interact.  Intel
> stated that CR8 maps directly on to APIC_TPR, and that the APIC must be
> enabled for this mechanism to work.  AMD do have storage for TPR which
> is separate to APIC_TPR (this has been confirmed), and as a result it
> must be possible to desynchronise TPR and APIC_TPR when the APIC is
> disabled.  Intel's wording suggests that they do not have storage, and
> "SDM Vol2 13.8.6.1 Interaction of Task Priorities between CR8 and APIC"
> hints specifically that only writes are reflected meaning that reads may
> not be.
> 
> 
> Since the outset, SVM had accelerated CR8.  Furthermore, because the
> V_INTR_MASKING controls both the host/guest EFLAGS.IF split *and* CR8
> virtualisation, we can't run VMs without accelerated CR8.  V_TPR is the
> storage.
> 
> This final hunk exists because we have no path from the vLAPIC code
> wiring writes of APIC_TPR back into the V_TPR field.  But, it has the
> side effect of always clearing the TPR cleanbit, and exists only to
> cover an operation where both manuals say "don't mix and match using CR8
> or APIC_TPR;  use one or the other".
> 
> When AVIC is active, the V_TPR field ceases to exist and is now mapped
> directly on to the APIC backing page, without intermediate storage.

Not according to the manual... It makes it clear that when AVIC is
enabled V_TPR is still used with bi-directional synchronization
between the CR8/V_TPR and the AVIC backing page:

"When the guest operating system writes to the TPR, the value is updated
in the backing page and the upper 4 bits of the value are automatically
copied by the hardware to the V_TPR value in the VMCB. All reads from
the TPR location return the value from the vAPIC backing page. Also, any
TPR accesses using the MOV CR8 semantics update the backing page and
V_TPR values.
...
The synchronization between the Task Priority field of the TPR and the
Task Priority field of CR8 is normal local APIC behavior which is
emulated by AVIC.
...
Enabling AVIC also affects CR8 behavior independent of V_INTR_MASKING
enable (bit 24): writes to CR8 affect the V_TPR and update the backing
page and reads from CR8 return V_TPR."

I can't find anything about what happens if the value in V_TPR and the
backing page differ during a VMRUN. Are they synchronized again or not?

Ross

