Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF288606A321
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 18:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=InvKD340
Received: from list by lists.xenproject.org with outflank-mailman.1465082.1675934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMUsw-0003UD-JV; Thu, 29 Oct 2026 18:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465082.1675934; Thu, 29 Oct 2026 18:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMUsw-0003U6-G5; Thu, 29 Oct 2026 18:29:58 +0000
Received: by outflank-mailman (input) for mailman id 1465082;
 Thu, 29 Oct 2026 18:29:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMUsu-0003U0-Ps
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 18:29:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMUsu-006bOP-6f
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 19:29:56 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae3908c-2eae-0a2a0a5409dd-0a2a4505ed24-14
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 19:29:56 +0100
Received: from [52.101.43.5]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae390a2-4cb1-0a2a45050019-34652b05f592-4
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 19:29:55 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS6PR03MB837260.namprd03.prod.outlook.com (2603:10b6:8:49a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 18:29:52 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 18:29:52 +0000
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
 b=prnPv8hRVLF9JPeBC85IdX0YS7HkaXIm2SE+OtoCee9hFlWu7vGNS82crGxlqnf9fg+8WEqF1Oi/YaoZvr+HZdHvNIXiJ3MfhwKPFkhDDNvIk8y8C2T6p0QhgNRoexq/H07DnESP1QhwnHt3rFNxWGIO0w01dAUP05zf6XeedUueILx6MU2t2VQaXFkFZhJm/+np3nn2ov4xMyjKSAf8fpqL87ZczmNLbf5TIS0DJXeVMiXm+fKEkeemPlzSMG45c3q3GAFU8O4AOGirgJoET8YIjDCpkyyuJAfuWd1avLpIikjJmQ2Nh8qQlmkSzaVVc2gYxd6eCauUsXy6Cppacg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vfOx4QhKfc8Cb9UMh0pyP2ntXG/QTnm00P5DSImr/U=;
 b=WZegI+vzmRqY/HYr5X+lWFSdnz14ESzrFR8MB+gmBCLn7PLuYddpkPiIwZu7LTwSn5dYWeK92GpZkVe7+KbqzNb5GU85CrESuakMuxx6FviyGAcGP68GMrl2ahSwuX9lFl3vGbQoaGgZd+iFf9fJ2v3ltj0yLDvmhwV0mc75A3FGsN9torci4OQX736HqZRreywNO4VstB4+5rQZmB0lLLm47eZkcmP5f2Upx2M9rMyug+2XaBN55iOsV0uATcut1yoUcXZ/Z7D5zBsk8PSaEJWKSklR1g1INwWkVqaQ0yWeYX91dukUBMRJQzQxZwZI1pNHc+pc91wcpnuQ/u2QPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vfOx4QhKfc8Cb9UMh0pyP2ntXG/QTnm00P5DSImr/U=;
 b=InvKD340XOAitM62omXlHXnWkVGZIcVC5L9d4ew8vEl/sM4nOpna42+KMkdOj/fRYTVvQ5JuFMfTE2/0yIdW72nBdivZ0yOpN6NImDIx1dTLpfvDVfg5kKfpbWC15BVrj7pC9X+DjQAkp/Cu5tk4/HfCyiXAV54z4n0Z/1qc62Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a98d47db-7313-4c1f-85eb-118abbbcdcc7@citrix.com>
Date: Thu, 29 Oct 2026 18:29:48 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "jason.andryuk@amd.com" <jason.andryuk@amd.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger@xenproject.org" <roger@xenproject.org>,
 "teddy.astie@vates.tech" <teddy.astie@vates.tech>
Subject: Re: [PATCH v2] x86/nestedsvm: write back V_NMI and V_NMI_MASK on
 nested #VMEXIT
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?B?Q2h1bmppZSBaaHUg77yI5pyx5pil5p2w77yJ?= <chunjie.zhu@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bdc00337-6197-40e8-8515-6e4c0024c0a1@citrix.com>
 <20261016070611.255322-1-chunjie.zhu@citrix.com>
 <CH8PR03MB82744855BF65535C54D7A3C7F06E2@CH8PR03MB8274.namprd03.prod.outlook.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CH8PR03MB82744855BF65535C54D7A3C7F06E2@CH8PR03MB8274.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0226.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS6PR03MB837260:EE_
X-MS-Office365-Filtering-Correlation-Id: 90472245-16b1-441c-a882-08df35ea9f3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|6133799003|22082099003|18002099003|56012099006|4143699003|11063799006|5023799004|261022075727099003|261026121527099003|261021123027099003|261022105027099003|10067099003|261026140227099003|261009223027099003|261028144727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	pnVI8sEOsOhuOszWqUC+/r3IzXXQ8vRSCrl1hG21h12mCWR/ELttxDMaW0XRcUJQtory8asfhXKhINFHTNSCQIyZOk9TOQCbTAzeDnl9b3OIjBsImUK23SFYv8URxzYX6TwlbJuiGJq9amfdrhNGIQ/xxJMpuBg6Ml4Pdk+vPKveAtgZBs9GSe7QyOkoOQIZMoBvlX7n/fyfwZQARN01lhbz7dbFUQLEEKsBlcTu0RpQsBB1gI+7YVZkBXrd+IOWuiLQPiP937xbwP7pLsKNg2SYcXKijm8YX069uLFrprAgi8tZKiFuk5rZRK5kKb9VIWxpKKIVP2invAy21DSrP0zdn4w07UbvYYqnxos4lOHlwjwPXq1WWkUbto/9AOg1kpK/xWoa103iRszzUyY9gkh1Vt9hCGCronzpwCsJRAWnoZd5ipQPAr3Y+710fzC1unJ/Lu5ajLZvaZenXuAgqai+0wHNBsmzYzrMd5UD4GET/rWXtaEfRu/NdAiG1C4CATiigGXue2LHOw3zuuyD5Pj21CYpoXbDXUKKuVAJnsBC2D3Pzu+Won+y/0q0uBYkK68pNQku4lDDJir5U1gpMwtAjb2lfwRwv04IB60uMAmncsexCzISzxm4zcY+sZBA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(5023799004)(261022075727099003)(261026121527099003)(261021123027099003)(261022105027099003)(10067099003)(261026140227099003)(261009223027099003)(261028144727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmZiYURDeU9pSmMzQWs3a3dlU1J2VGQ1dWxha0ptNVMyZlluZTNWanFHdDZ2?=
 =?utf-8?B?cmsrSmFGcit0N1FFWjhxb1hBY21uajdUVnl1VVNobEhCMXNxNElYNEo1dTdq?=
 =?utf-8?B?Yy9rZ3l1ekNyZjhRTG5rbFBLanFSTUk2ZmxwRHZNeXRtTk5pQkRiRzZZQnUw?=
 =?utf-8?B?VXhjdjA2bzdsaE8vWnBSOWVRYUwxbEdoSGN5bjYrWTdZTDB3c2hyUVpLaG44?=
 =?utf-8?B?bENBZmpZNnlxb3B0ci9Eb01vbXpFcmo0c3hjam4zVG5FZ2hqNmNXci9BWWd6?=
 =?utf-8?B?cjA3NjlReVpwQ2c0U2ZtVzU4RW9XSG5oQVFVSXdOeDZxdUNvZVJ1aGZLTSs2?=
 =?utf-8?B?ZW9FT1ptaGdyM21BOENsYUp1dldDVXNsbFlVcFVDSlpENGRPNTRmZlR0NUs3?=
 =?utf-8?B?dyt6OVdWajM0WmxsdVV4dnRVVGJLU1Y2ZER4R2d0Mkk5UjlrTFdYTmRNVlpp?=
 =?utf-8?B?ZTE2aS9xd3BGN3VQQ0VCZ2I4Z3FQcitCbmt1SitqQzF6cW1ZR2I4NlUzMkVR?=
 =?utf-8?B?MHphbUtjREdFblcwckJaNUVFeUlMdmE1VElaR08vakRwa2Rka3FQMndtdnJl?=
 =?utf-8?B?cDdoZ012SWhZdVBUUFVXd0V5SHV5V1ZWRittcHlyYU1CODNoRDd5L1lqcitP?=
 =?utf-8?B?d09zL3hxUlBaZ2RmbkVnWkNoblZ6Nk1ETERvZDAyTVNYbTRBeXFtN3FONENZ?=
 =?utf-8?B?RVpJZTJSR01pU3RUVlJWZ2hjLzM0YSt1bzZYdnBWcVBvYiswRkxtRWVmZGtj?=
 =?utf-8?B?TXMxOWVrc0ZYa3NUMHAyWjR3RENxeWJudEM2b1k0ejI0TTd3WnZoUGRqTGIz?=
 =?utf-8?B?RUs1Y0p6RHk3N2VTeHBQZTBoRjFpTVlwQTV5dVpFb1BnWmtTYTZlbmx0a0xJ?=
 =?utf-8?B?T2tTMGx6bEtjQzRlR0UxbkZtbld3TSsvOTQwZjFyNHhIRkNuVlJjczQxVjJO?=
 =?utf-8?B?SXNEVi9xejQ1QkZKZjJ2WmFXQ0lLcjRnOS9jYWlJeDl0ZTRLZ3pwK3lqeDFI?=
 =?utf-8?B?YUlYa2NEbUlNOFNJQ2xsUnp6SVZnclliQWkyb0pNbjBDdHYwai9TYTA0STNZ?=
 =?utf-8?B?MVg1M25ma1FmV3RXc0doTnJJenJzOWNJaVloOXpxZG93S0pxQmREN3RaQjE3?=
 =?utf-8?B?SWxYclRQTThvemp2N1BBRVo5R010TUp2V3F6ZHNlckxyQ0JTZHE2QkVocnpj?=
 =?utf-8?B?cktocitmN2xhMUF1djl1cHIrM1UwdG05UUpCRHhxcHJOU2xVZXY3dzBaYmYx?=
 =?utf-8?B?dTRGODJYb05mNWZqaWFGYnEwa0JieFBiU0lIRUU5aHNzMzdObjlzV09lTWpx?=
 =?utf-8?B?MTlDNXVsakFHS1BTbHNjRlVzNlY4VFZiRm1KZHdaR1dhS3Q2dHhrUVd0NGNW?=
 =?utf-8?B?VmkxRTIxZDQyRmpJNGdMWExJaE1UZUJGa3R4VlUrQTNGMEsrWlBBNGltZjY5?=
 =?utf-8?B?aVlsNGQ4cFNVVlEwOUxVSUQzM1g4K1lpbXZLaEJjZWVDU0dBUkF4Skt4MWpS?=
 =?utf-8?B?ODNGVHR0RGhyVXNWcHVRWTBEOXhJd1BNd241UG9BYVNNNmZFMnBnOUpRSll4?=
 =?utf-8?B?Nld5QUo5T29heS9xeDlWTWRIL2IxeExxUXhxcTNOdk92Vit2eW5taWllczNH?=
 =?utf-8?B?dVF3US9iMEMwMk1YYnlvYk1zdTV5dXNsREw5Q01QWlVTQkxPN0NlaWRzL2wr?=
 =?utf-8?B?QUtBa3BQZ0RsbTZTTm4xNzR4UDNNMXRnbTBUZlo3eEJWRlRpeTVhUytQeWdp?=
 =?utf-8?B?b2ZrTzNSTElxMndkUlpYUUlNNElNY0E4K0YzanAxRzVBcmVsazVMT3p3RmZL?=
 =?utf-8?B?ZGxZTFFvYnBWd21LMWV0RjJ1RW1RR0RkdURoM05idUR3MG5uL3gxbURQR2VE?=
 =?utf-8?B?OW14SXdwMlBMYmJ5MEVCRzlMTzlxSWtKbFVqMklFbVdhNXJraVVqZURBdURF?=
 =?utf-8?B?Ym5WUVBZWlBibjA2Tno5eTc4L0x0WTlBVGRLTGs0ZG14WkJEcjRjY2IxSEJU?=
 =?utf-8?B?TjV5cFhwL08wZXgreDArSm9JR0NzSURDOFkzbmNkOFJMTElSalc2SDJ3TzQ3?=
 =?utf-8?B?UTRmNFh2VFFDbGlpSnkxTURwN3hZS1NveHdncHlZYk15WTRtL2p4czluMENw?=
 =?utf-8?B?azZINUtsZmE2YzduSTkzZXZGZGJacnFSeXpkYUg4TTFWT2NEQ2N0RjFZbm1h?=
 =?utf-8?B?VU9UTDVQSllXUzBaNklCOUxJYyt0QWV5QTZLWFdLc1BPNjNWWklZSmNqeHlH?=
 =?utf-8?B?RUk2VTBmaDArTmtTOVltU0ZIT252MGF5SXFQcTcrZUthYWkrNEd6RURKTE1K?=
 =?utf-8?B?RGhWOEozVEpidVU3Tjl3VTJmMlFHRG5vb3pxR2VkNk44RS9NS0padz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90472245-16b1-441c-a882-08df35ea9f3c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:29:52.1022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYVTZ7GFjcCb9TPbWBLDaa3F+f6S7OPcHoceRPC6vBIEoPyxTPkGcy1jBuGjhH6CZ6W3fsBuSdXiurpfjUkr0aPOm5B92F28vR+ESjKQ82I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR03MB837260
X-purgate-ID: tlsNG-c201ff/1793298596-724B42A1-C4F1483F/10/78276251493
X-purgate-type: spam
X-purgate-size: 3960
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29/10/2026 5:54 pm, Ross Lagerwall wrote:
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> on behalf of chunjie.zhu@citrix.com <chunjie.zhu@citrix.com>
>> Sent: Friday, October 16, 2026 08:06
>> To: Andrew Cooper <andrew.cooper3@citrix.com>; xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>
>> Cc: Chunjie Zhu （朱春杰） <chunjie.zhu@citrix.com>; jason.andryuk@amd.com <jason.andryuk@amd.com>; jbeulich@suse.com <jbeulich@suse.com>; roger@xenproject.org <roger@xenproject.org>; teddy.astie@vates.tech <teddy.astie@vates.tech>
>> Subject: [PATCH v2] x86/nestedsvm: write back V_NMI and V_NMI_MASK on nested #VMEXIT
>>
>>
>> From: Chunjie Zhu <chunjie.zhu@citrix.com>
>>
>> When V_NMI_ENABLE is set, the processor manages V_NMI and V_NMI_MASK
>> automatically (including on IRET), and writes both back to the VMCB on
>> VMEXIT (APM vol.2 rev 3.44, "NMI Virtualization").
>>
>> nsvm_vmcb_prepare4vmexit() only propagated V_TPR, V_IRQ and (conditionally)
>> V_GIF from the L2 shadow VMCB into vmcb12. V_NMI and V_NMI_MASK were never
>> copied back, so L1 kept seeing whatever it had last written, regardless of
>> what happened in L2.
>>
>> Copy both back when L1 has enabled vNMI for its guest.
>>
>> Fixes: 86a203ab8d38 ("x86/svm: Support vNMI on capable hardware")
>> Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
>> ---
>> v2:
>>  * Reword commit message: the processor manages V_NMI/V_NMI_MASK itself.
>>  * Add Fixes: tag.
>>  * Cite APM by revision and section title.
>> ---
>>  xen/arch/x86/hvm/svm/nestedsvm.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
>> index faacfe007832..3a0afa98129e 100644
>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>> @@ -1027,12 +1027,19 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>      /*
>>       * Virtual Interrupts.  #VMEXIT writes back V_TPR and V_IRQ (APM vol.2
>>       * 15.6); the remaining fields do not change.  Copy vGIF back only if
>> -     * enabled in L1.
>> +     * enabled in L1.  With vNMI enabled, the processor manages V_NMI and
>> +     * V_NMI_MASK itself and writes both back on #VMEXIT (APM vol.2 rev 3.44,
>> +     * "NMI Virtualization").
>>       */
>>      ns_vmcb->_vintr.fields.tpr = n2vmcb->_vintr.fields.tpr;
>>      ns_vmcb->_vintr.fields.irq = n2vmcb->_vintr.fields.irq;
>>      if ( ns_vmcb->_vintr.fields.vgif_enable )
>>          ns_vmcb->_vintr.fields.vgif = n2vmcb->_vintr.fields.vgif;
>> +    if ( ns_vmcb->_vintr.fields.vnmi_enable )
>> +    {
>> +        ns_vmcb->_vintr.fields.vnmi_pending = n2vmcb->_vintr.fields.vnmi_pending;
>> +        ns_vmcb->_vintr.fields.vnmi_blocking = n2vmcb->_vintr.fields.vnmi_blocking;
>> +    }
>>  
>>      /* Interrupt state */
>>      ns_vmcb->int_stat = n2vmcb->int_stat;
>> --
>> 2.34.1
> The issue here is that Xen allows L1 to enable VNMI in the first place
> while it hasn't exposed the feature to L1.  This is because Xen blindly
> copies the entire vintr field (except V_INTR_MASKING) from VMCB(1-2),
> which incidentally also allows the guest to enable AVIC and unexpectedly
> get AVIC-related VMEXITs as reported here:
> https://lore.kernel.org/xen-devel/CA+aCS-Ha4jSYFfxhOwMGiGJPdCOtgBJLt=3Q=v9dfp6SQJys4w@mail.gmail.com/T/#u
>
> First, we need to fix that bug by copying only the relevant supported
> parts of vintr from VMCB(1-2).
>
> Then, as a separate series, expose the VNMI feature bit to the VM (if
> supported by hardware) and make it work correctly.

This comes back to policy work.

Luckily for AMD it's easy, because the information is in CPUID.  There's
a series of mine from a while back doing this which needs committing.

~Andrew

