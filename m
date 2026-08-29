Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5CBC61DD6
	for <xen-devel@archiver.kernel.org>; Sat, 29 Aug 2026 16:54:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402981.1637655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0MJQ-0001dq-6c; Sat, 29 Aug 2026 16:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402981.1637655; Sat, 29 Aug 2026 16:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0MJQ-0001di-1j; Sat, 29 Aug 2026 16:53:48 +0000
Received: by outflank-mailman (input) for mailman id 1402981;
 Sat, 29 Aug 2026 16:53:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x0MJP-0001dc-Cj
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 16:53:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0MJO-00HYCD-Q0
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 18:53:46 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a930e76-bab6-0a2a0a5309dd-0a2a450aa40c-14
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 18:53:46 +0200
Received: from [52.101.48.25]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a930e98-f2d2-0a2a450a0019-34653019563a-3
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 18:53:46 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB989335.namprd03.prod.outlook.com (2603:10b6:510:110::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sat, 29 Aug
 2026 16:53:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 16:53:42 +0000
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
 b=w3bKBD/z39t1ZoCl1nNPuIRWxgQdhyLzsxPyE6uiSfEzOaH6fBz0HcsdJqv884tERWpAVswYgCJ8AzqRu/LSufLYn2j28JL1Eatrfsw339FYo+Di4O79MtnxEhl3hb/F7cfhUAlmlhcD+eTIY96oy8tjoogKw0ODo4Rp75GNx2xtS8OdzXC5wItJlBTf9Ysk1iQcdugjSaWrRH1OfZxSsntcundBAjGFfJcfCKwLKLbw3MpfiQ7wREyXdvzf58eIrq4T1jBQpFfT1BBv7bBlkADwkyMfln++qbNvgETaYUutg9QE106o9LacYHnxkvwI6FERFVG6yMd+H7OaHbVDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/YsbSyZiaIImEk9fvBmsrVjrlUZNcyYpOUUdgH6vmE=;
 b=rmMdBKaaQIfEBBJ73/UkhZjIDZz2CZ6rhkaEdMogDuE5LwM6D6bnpyLZtw+LTbxcLsJiMqIvUFM4yTJOdCfbEg0BA60huzOivdCviF9imO8OkT3wGCcdxnCBhOdrhYTLSxHxVjJiWaDRFFeQ4HSM9cY5x4D2PCJQfcKwvP8FpSqaXWIBc/QCMLCEEI5YhWjxuzsM20xanzT+HT8StjJxwRWhj42Q55fREnQ2NI3k/l0kDSDn2QziaAwtGtPSvHbjYdtdXZJkrAFipGUHgsUQqMAOXHEv+rCMe6irgvFegsEGCIFkUMOamFWNsoRfW6YBMJZoe1fsYrgcyXSGkjRbsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/YsbSyZiaIImEk9fvBmsrVjrlUZNcyYpOUUdgH6vmE=;
 b=qefjEAvjnRZIlARFVLuGbuIRaqhTr10Al93zOvhiHSdwoPSCGn+j5IxouBDtl0AOgvWjd7/EuhPXND732uEN+zrpdqWBgF5Qu45K5q0Rhqa96C6Lcn8Clw2i6DA5v+PHz5xk5mFhxfNXxXzF1Eh+4DS2d9+a0ypIlbyHNAUKi4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5286d0ad-5068-43dc-b23d-e18f05ae4b64@citrix.com>
Date: Sat, 29 Aug 2026 17:53:38 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [RFC PATCH 0/1] xen/arm: smccc: preserve arguments before
 register setup
To: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>,
 xen-devel@lists.xenproject.org
References: <20260829021257.3310112-1-Jan.SetjeEilers@oracle.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260829021257.3310112-1-Jan.SetjeEilers@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0229.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB989335:EE_
X-MS-Office365-Filtering-Correlation-Id: 765d1029-0cf9-4ef2-9444-08df05ee14c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|3023799007|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Sw+f9WJPF4jTQ+q6aB6Fp4NLvTOwjkEbV4E/hJsxrmCbmjpmmjTBRAIQkKpZPyj/C7kWpMlJ1L5Q16AggMpSBfwEKPyNgbT4PclckFBrqo9m4Z8+W9qxU89cEJ5IwbHjdAJYbfS7eoSq7ibbkG0SkmQGPdvdbYPP6YymTUMAbp2PM6mWwaZjqictjBtlLCE/Qd0T00CrluIQn3pFlZAiEqmbBPFu/cqASecarbZpXYcvuAZr006pyakRfsvsMebueFJibfsUcH9Jjtc8MxXMmqeEnPc0Uh5fzUe/uR7ECZ36K7ZOohzRUSgiEYDDy0u7s50OYPa3CDvD4+zqgXScG5qcFfERWV8QZfSPK37EjzBJyV1gqSseWfdOwOsGUnAiyWBhMfd53qdmm0yT8O+mui7blKjEyvkzDs0qYwNXaPslTSBEgHUqOt8ykmaUVnD6LgqqhwiLPios9IIUvlvkpFdqo+lbpcfNl1TeTMj2ZKEVb+B3nnDNNo8RdI4ioLtj1t+ybIG66C28N/6Iih+rvHeAotySxhLmDDN9/mzCL+Dl72TqGwT3mv65IE+lqCQcdu0lnXm1n7xrw+H5LQVEPQQtpbbW+76EcQGamj7tM5xc7gsM4VQg8S+Z/DUZaS3r9WK3we63RmzdH+Uf2O9tFEjbuANf0L2PXrqFh1wgwfI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3JmNUN1WlpNalE3Qm1BMGZtUG82S3pFUWUzeU10d3h4NnJwZzlPV3JNMzh3?=
 =?utf-8?B?SmRPTi9rQWk1RFdwcDlrRFQ2QmkzL2pUU21DcjJHN2pOU3d4dmROZHNlK1hP?=
 =?utf-8?B?bVR2bGVGSjJaVlFuWi9FTXlndC9kMmdSUWQySzZVKyt5ZnhGdkhtUEZCVVRm?=
 =?utf-8?B?ekVqd1lNckJwd1NNd04yV2JUcE9mbEY3Y1FodGVKby82cjBwZEprS0pKamNx?=
 =?utf-8?B?dFBGU2Q0RHVzVUY5THBpZzBVb3dkU1RyMzNNMzJXV0pxTkhnQ2JJblBLNzFI?=
 =?utf-8?B?Z0l2aUFYaDJGY29qaDZ2VHJRc1owUHRiYlBvVmYydmRqSWE4SndwTktBTmhC?=
 =?utf-8?B?ZzhYcGZ1djFaTEJ6c3M3ajZqaWdLY0xpYUVzWml4ZDI2WXFRT09ZbEF6Q2pt?=
 =?utf-8?B?YmFCVXU4K1FKTnZBT0VoSyszc1YzU2Vxd3c5OGZRcnV0blJSUjFDdUtiZFN6?=
 =?utf-8?B?QWJDU1NHek1WUFNodXh1R3llcWlGQmZTN2RpNmhtUkkrdUI0Z282RkpnWk4y?=
 =?utf-8?B?aDdNRmJJNWtNQy93aTZxQlI2V0Z2NUNDaDNQODd0cjBiOTVycWZPVHhOdW41?=
 =?utf-8?B?ZkdEUVBRdlNaeCs3UkpJS2dSWVNiNTVlYm9NUUp3SzNyMlhlYmxuS1l3Zy9t?=
 =?utf-8?B?VTgwVi9XZmJOcThEWlRza0s5VjVPQ05GTndIRDNZdDBFUzVzQUo5UkNUcHJz?=
 =?utf-8?B?c3BweW5vaXkxMjNGNHg4Z1NmT0l1WkdRK2FLdWlseXpHYUp0MjZjZ0VZYnpX?=
 =?utf-8?B?cS8yTitxaUQyUFFNNDdaRUFZVWtrL1ZtdWozZmdIcEZFRm1XVU1Xdm5zcmFk?=
 =?utf-8?B?c1lCOHVkNW5tWVN1RzM5SDgvQVZWNW5nUXVFUXZrNFZEQ2lGRnltNlF5VTFM?=
 =?utf-8?B?UUREUENVRUxNY3drY2RhTEdUUVVva3VnYXNoakhOTUFRazNQVEJiUlhjMS9m?=
 =?utf-8?B?eHJ5MUJQeVVsMFFFeThxbXV5YmJSeUsvc3NZOVhrZHphWU9oRTMwSVQ1US95?=
 =?utf-8?B?Z3diNDM2ZzloRDY3QkZwSXFNVXNIejhYOEtOUmVRaGh6NjU3Sk9TTmVHWTJE?=
 =?utf-8?B?Uy9wejRveXVMb2lwbm5TMjBuNlArRVZRUnRhQVFFdzN6dllHNE1qNDRFQW1D?=
 =?utf-8?B?Z1lpWm53Y0pyeUhhdDNvUWlxTGdUc0paVlJIMFlJdFE0UkdSMG9TNDZxZkJN?=
 =?utf-8?B?cmRmSEJwTTN6Z1lidkZ4bWQyQ2t3NVcyejZTYzBqOUp6QzZYVzJ4czRYZC8y?=
 =?utf-8?B?QkZSaTNiVXVTT2NINExzeUo3RjZ2czMzNzd5bXRmUzNDeTF3dWZIQnZOSnlp?=
 =?utf-8?B?Y0lwRWpwajNucWhBTmFJVXd2ZHh6NXJINHdLdERjUEdwSmNuRWV4Z2pjd2FM?=
 =?utf-8?B?SmhxdFhnTHRkM0JZZU9rU1l4cG9XcU92aXBRWlZRUzlxT3NNbVp1cW1WR0My?=
 =?utf-8?B?ZmlpYjJKUTVWWWhOVlE1K2pCNXlMN1pUcndjMGN4Rk5SQ2ZSZGY0YVQzNmph?=
 =?utf-8?B?cmdXeDFBN0pLN3ZkRUpNNURHNXJuSVR6Z2cwb25PcVZWWVJVNUxHdzU5VFpN?=
 =?utf-8?B?NkhYSHhDMEZjNkc4OHNyU2J6eHFLbU5hVlN1VVJvUjR5ekZXWTJaQ3VlUkJN?=
 =?utf-8?B?b0IwVjBzZ3BJdC9iYWdsUExPeUhPaVZSODVDMGNKcUIyUml0SzArZnFhM3BB?=
 =?utf-8?B?MVg4NVNVY1hwY0l3d3NQQllhZm1MMmdOa3VjY3dqZGRxQkhoTU9ESmNaNG9E?=
 =?utf-8?B?YmVidDE5d093RjR2WGRSd3lrRTczNHhrQjVoWVZlelZ3S3FIOEJ0eko5T1Bm?=
 =?utf-8?B?S3lDREM0QnFjUTBHaXNTNWJUSEtHZ21zUlBzb3ZPL283VHpnYnNoOThDdFRw?=
 =?utf-8?B?ODF2WWxEaFhHMlp6K1VxaDVOak5xVmEvdUUvUXVXNUg3UVJHdCtBQTNSTmgx?=
 =?utf-8?B?anE0ZXZxdkFROStpTjc2Y0dyK3FrZ090elRKRkN2OUwya3NwQldFMWZQUU9n?=
 =?utf-8?B?QjRiTlplTkZuZmJjVk9PSU1yb2hGblZucVNuWjF2c0RyMjRMTE5YZGNpRGZ4?=
 =?utf-8?B?bmpUMEw2cEF0dEs1MFI5U0psaTlFWDdnZkVZOWlxV3dVV3BoN3c2UW9UenBM?=
 =?utf-8?B?TWFpNEZWQ1ZqdDZ1bWVBTzh5ZWphaTF4Ly9heFZqUmNHb3pJMVlFdFdSRklY?=
 =?utf-8?B?aU05NXg4VmNoQ092alFvL0d1Y05BMU5Mb1NJZUppb1RyRTR3WGlza1p3cjk2?=
 =?utf-8?B?bWw1eENNRC9RWUVFRnMyM3UwRGltMkc1S1pOREp5c2Y5U0NlM1FNNTR2bWox?=
 =?utf-8?B?cGtTWFJjbTdJWHVqK2N6d2RwbkNCRnFsSjQ4QjdKajFqbGNMcGNMQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765d1029-0cf9-4ef2-9444-08df05ee14c2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 16:53:41.9343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rjNsRGflok9CIuooNvN0yhQMEgojtSufV7ZzpYihKQnIqKnNqSEw9Wqb6Tmon2evTQV70prIruwmOuqQxOBRKvIgUZUP/4TZOGOdah1OoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989335
X-purgate-ID: tlsNG-4011c0/1788022426-528DDCFC-3CA515F1/0/0
X-purgate-type: clean
X-purgate-size: 2081

On 29/08/2026 3:12 am, Jan Setje-Eilers wrote:
> Hi Andrew,
>
> While investigating an SMC forwarding failure after updating to Xen 4.22,
> I found that firmware could receive different values from those passed to
> arm_smccc_1_1_smc().
>
> Several public Xen callers pass get_user_reg() calls directly to this
> helper.  This includes the SCMI, ZynqMP EEMI, and i.MX forwarding paths.
> The helper puts each value into its SMC argument register as the
> expression is evaluated.  A later get_user_reg() call can then overwrite a
> register prepared for an earlier argument.
>
> The change in generated code appears after:
>
> 67bcf5eae709 ("xen/arm: Simplify type handling for SMCCC declarations")
>
> I am not sure which behavior the helper is intended to provide. Should
> arm_smccc_1_1_smc() continue to accept arguments such as get_user_reg()
> calls, or should callers save those values in local variables first?
>
> The attached patch is a candidate for the first option. It restores
> temporary variables inside the helper, allowing all calls to finish before
> x0-x7 are prepared for the SMC instruction. I am not able to validate the
> public SCMI and ZynqMP paths on hardware, but their generated code now
> finishes every get_user_reg() call before the final register setup and
> smc. With this change, SMCs also work as intended on the device I'm
> using.
>
> If the intent is not to accept function calls as arguments, we should
> probably fix the SCMI, ZynqMP EEMI, and i.MX callers.
>
> Given the existing use cases, this seems like a bug, but your patch looks
> intentional. It's very possible I'm missing the intended design. I would
> appreciate your view on the intended contract.
>
> Thanks for any advice or help with this.

Yes you're right.  My change was buggy.   It was actually part of a
mutli-stage cleanup across several patches.

I'll submit my own patch.  I'm afraid your AI has put in whitespace
errors where a straight revert would have gotten it correct, and left
the 0 case still buggy.

~Andrew

