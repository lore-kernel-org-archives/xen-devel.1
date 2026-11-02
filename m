Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D720606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 10:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=g9kqOH+2
Received: from list by lists.xenproject.org with outflank-mailman.1468110.1677134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNpRk-0004pZ-81; Mon, 02 Nov 2026 10:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468110.1677134; Mon, 02 Nov 2026 10:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNpRk-0004pS-3q; Mon, 02 Nov 2026 10:39:24 +0000
Received: by outflank-mailman (input) for mailman id 1468110;
 Mon, 02 Nov 2026 10:39:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNpRi-0004pK-Di
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 10:39:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNpRh-002r62-JI
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 11:39:21 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae86855-2eae-0a2a0a5409dd-0a2a45028714-14
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 11:39:21 +0100
Received: from [40.107.159.90]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae86859-6ca4-0a2a45020019-286b9f5a7e14-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 11:39:21 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AM7PR03MB6165.eurprd03.prod.outlook.com (2603:10a6:20b:141::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:39:19 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 10:39:19 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7rBQEopWZ7Dx4yl7v2fYL76r0l3ld0VA/c9Nf0PBhU8cW6K+gN2vVTIpBhGwePbKIzg6VJJOxah38EEeYEeDpHUvJtJrDvqYxHzA2tsxw2QKsmF44OZ0KuuyL62XljTtlSrYgIVpH3CGd0NKbG076g7D8NhSnnQId3BnmsZ4WZLxzqN3Ye+XWakBMeLM1vLoZum5remdAGlkBNDEp4/KS6YdMTRSYmu70OfGuWLRWRZf5CeIQfulw9ca5LnETUn2CghNEZPVsOujLWKqGRP++10zDEU8AqflrlmvvbJR8F2piHQGKDwtir3L4gv9TsxIGb+Bv0SyzwFjugzNRiC0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzF5ZIL10DZ4y6+BdoYzA09ao49u041PnHz6hjIkOYc=;
 b=AbmmgiHvRiqaMMBlTGd0Gd/IYwMINh5gk61Ds+M1m+NFYacKbiGyKHuMdNKMxm8BEwaQNhzBO4tz2CFAMnW3B6XKypCmtdnV1iuWnmFpKPr7/adnSG4Ku3sJE8ZUbhcwDhiFUgfUz01+vliYUNYNg39nJcQRa0MdmhEOMjFFeWCCwG2CFiA+J+2adgjy4XWX6y4t71E75DBlMY9ddCKGv4PuhWx/LpI7aIVuHVGNJXWAFKOjkYCy3n6p+UzKuuB23+YeW5oy+UZJJ+9zWdIA8CTpZq5DkiLAH6mUuRPYbyYcD+I8mwJ+8jIPNgR7y+5rXGJoSxkW8i0WtgV4gu77yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzF5ZIL10DZ4y6+BdoYzA09ao49u041PnHz6hjIkOYc=;
 b=g9kqOH+2eypMUKwj7AmoICEaB8bXql7VAau1Ci3FPOvDYBqpk9PSgD0E9kA2QIL/npSAZCklhsYn0i0Bjf1tS1MOxRAH+Mfc9IO1m8gzFf4dNTX/1LocsMd4v79MTpFpyYOeBDoenZ84H77F/Jdsdxpho38Q9fFvxCg9y7KprB1bm3Zm0ViRDTdvgMC9bv2ANlw/FHmHxFkLWX6MujJwCA4kpcxhRDRM+sbaKvwVfbRsGTsgCql6UkafVQgs1OWzMSsZqkaGDg5V1bM3JMj84ohksNybq8ivhd/0gglyIMlg7OYfZ+X1St91skqIzl/IaFiSikPlsdfY444wZ8VNdA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <30f714f4-df1e-4b40-a440-ff15cd7b055b@epam.com>
Date: Mon, 2 Nov 2026 12:39:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
To: xen-devel@lists.xenproject.org
References: <cab890c77bfbb016e79f847d6dfddac993079f40.1792406297.git.dmytro_prokopchuk1@epam.com>
 <f50e40f9-6ce0-46aa-916f-fac7e97b7a0d@suse.com>
 <250b2af2-04bd-4ff7-be00-1abfff52dfe4@epam.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <250b2af2-04bd-4ff7-be00-1abfff52dfe4@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P195CA0028.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::33) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|AM7PR03MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: 0712addc-4e5a-44cb-71f4-08df38cd8d24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|4143699003|56012099006|261009223027099003|261028144727099003|261026121527099003|261021121427099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	vQuxGwGLA5sWf52/PLIhXCTceI4yVjW4um1LnWOLkxtUVykw/Ttjwxjt2ymoP2tmCePgddvMJaK74SRT9/HUMXD+BuVvERAgLqT+QEchcznD/wVHsJ8pcgaovxRX6Y7N+h3oA4DiK3jCmHuR17jn3+/b8E0l79eo74Pyzj2uieTcnWHEIMKwkW/k8xZpSJFdHRrs2qiZFOgrRci/uhSsv5xp40GE6tZlP8FWiI1ht2bXoxMLjhczIHOhyO6FYc8hloHS7Z+b5ogRgZ5acAgoTUUPuAVOmBvUExKk4pQ97jI5f/TbmpwK3M0ugtOFYHRkYMqzaplSLnFK0ylMyWsHEBqVRVllSdnKyWaScFou5Xi1f8hJ1mtAvQ7Iqltmvv0kaAvKTxQSSuCVt0HomcULTc3H8OvagOCulWNDzCadm0v8Dw3VgrucUMRnr7SBqwELKd1TllVda0YmyGU6u8QLUwtluC7FVALSQyoYKKBckfN+VKGyzE+iDsFMrI36IWUznEb8VvlPWEtciLWDGgVf104NnVYmNqAmv9v6JFDI8+dxpKYFqfAo4U3dRfOrJ6Ta1eDMO6zqIfJaBhYaFLlzlDMxO1M5qqmEuAtXgroNHA7V/jLAx/VYYCOz5hzwJPeyySmXWrhBPNY1RtkX70mhaZ7XFrz3Wn5VC6laghQ71j0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlZtWVJ4YSs2dXBCTHlxbXB1dkdMZmRHaVpzemt3MmpLNXhSY2JONUpWQ0Vu?=
 =?utf-8?B?ZFN4ZGJKeURJdDRHd0dSMCs0WHZ5V2IzNjNuZ3JLQWpxV05pRkZ3Tk1wbDBt?=
 =?utf-8?B?NnhvYlFIZ2pPMnZLMklFS0tud0IyUFpzRXUxbEpBa3QxeWIrWm44NzVMOEFR?=
 =?utf-8?B?MGlkeXBlQytEZE9sdGxOWXlEMHB3TDJzL0pKZytKR2JNTklWVVVoS21na3VQ?=
 =?utf-8?B?aFZ0RkJhWW9WZzlDc0UwcFd1VXBCdURmaU9zZFQyN3BoTzdaNTR2MWhCT052?=
 =?utf-8?B?bXlhZ3loS244K1g3cjRWMVlGSkk4TkJTZkR5cnZYV0tnRkVnb2ZnMXlSVVR6?=
 =?utf-8?B?V24wSFpmdVRNSUJVc3ZGYWU3R0Y0ak9EMzcrMlc5cVJHTWJaQmlVWkNubkZW?=
 =?utf-8?B?cGF4aHpMUHYyZGpZWTNLRmpGTStLOTBoT3Y3U0kzUEd0WnFIVXNncVRDeUhN?=
 =?utf-8?B?MytuR1FPNEJ3ZnpOd2tGdHlFdmJMcDNHRUtkbWxEeGo2Wlp1MW5aU3d3Zlpo?=
 =?utf-8?B?OFZnckwrR2dNaWpKKy9vMkMxNjRJMkdxSFFGMUhVV3lLTEpucUR1a2dFM1FE?=
 =?utf-8?B?Qm5OanRHZm9JeHptbklHV3FpeUs5ek9wS2tkTEQ0UktxQTRDb0ZxdUJzd0pN?=
 =?utf-8?B?Q2d2YWs5cmU5ZHJCYmpKTElBdDBUbm1MYkdMMlFjTHVGYi9qMzZpdGlQWFJu?=
 =?utf-8?B?OUowUnFueVNFbmZwZEJjdHVYQlkvOXFxNFNZOERteDJKc3J2MjQyTDZJM1A0?=
 =?utf-8?B?N3kxNU1zTWZVR2RIQzJ4dHdQRXhSNG5FaktxNlBoVjMweDg3d2hiWFRuOGZ5?=
 =?utf-8?B?T2poWmMyY25CMStlTXh5dzhRSmpIUzNBTHdLZW5EcDdFcjFMaTQxTWpEQVF2?=
 =?utf-8?B?NGROOWZDdmJOL1hNNms5eS9WNkdYMUlmMlRsUU9nZk5yckpyb09MMkhsaUJa?=
 =?utf-8?B?RDNXdkVNc21neUcwM0NmNW53UFpnMlpOR0xrZ3NwaTF2dzhLNkswb1RLYmZ2?=
 =?utf-8?B?K0swQ2IzWkdSK3o4L21WU2g3Y3ZaSXpDc0tsMmxmQ09TWTRwY1ZPZFRzSXl5?=
 =?utf-8?B?cUtPbHhjYVZSaTNNV2huZy8xbmROdDVHeFU5Qm1UaElmQmhMenc0WGJjK1NE?=
 =?utf-8?B?YzNpcStYOTRMTS9UbkZOeEJQNUxNRHR4ZzNDSDhWeHpZSmxSRnNINGJvWFZ6?=
 =?utf-8?B?NGg0WkhDenRtUXFYQ0kxM1VqdFJ3YWtuWmxrZU8vbVlyODJFWlZzbVRJRGJp?=
 =?utf-8?B?MDgxWU5adDhtVVZraTVJZk5uQVpUQ05tb1F2bnN2QTNRK0Q0RXdNaTNCZTJ4?=
 =?utf-8?B?VURHVE1yQnBEczRIcnUwenZpbzFtNkZkdlFpWEhDSi9vcTBUdVg3bWUzUGw3?=
 =?utf-8?B?cjRrSklZS1JnWWlRV0UrN2Z2MjBYL3hjRWdjQkl3OEZuOURTbDlzdUEvdy9I?=
 =?utf-8?B?MkNYanJLRDlZdHR0ZzJKYkVydjhKK3hPbHpYeDV6MksyTFN2S1NDREFNN0lU?=
 =?utf-8?B?bElWd0tlSjNOTVhrbmYrb0xVckdoeE9LTzRoL2ZqdzN0c1RCYVpTNmUwNVlH?=
 =?utf-8?B?SUk5TlA1N3IrcVFFMWdCWHZxOFpWbVRhdDFEUWthem9ENnp1ZU9XVFNManpK?=
 =?utf-8?B?ZzZObUp3ZHFCUHZLb1prQUxMbnpvWUtYSUc2Z2Fub2tUVm9tcUU3aHVOTXh2?=
 =?utf-8?B?aDJQVTR1aXZvcmZRUjBiSnF1VHFVa3JKdnR2YjJPWXk4KzdkRm9aem1BUis2?=
 =?utf-8?B?U1ZWaXF5UVIrbmVCcUF1c0JjdytNMml0NmthVXY3eEtqTEl2NjlhZnhMSUFk?=
 =?utf-8?B?VlZ4UmFRTlB1YzlRbDNZS3U3MmZMdytnZFFid1RXb3ZFeldmSzVRMXpJSU9v?=
 =?utf-8?B?K1F5NVd3RlV3S3ZRaWxva3F3eW5qY1RaUDRDZFRwT2w1RlArbmtWbzlDNTlP?=
 =?utf-8?B?blF2emNqQUM2RzdYa044MkJ3N2xwMUxhTVprTEZzQUdBbk56Syt5ZjVoNkRO?=
 =?utf-8?B?RnpTaWo2SHJiUVdoSFFjcVFrdlNuUUJzUVJBQm50aWhFMXkwMjdFQ1Y2VE5U?=
 =?utf-8?B?SHpVQnUzQVpUMWpkZDc0cVpRQXpORDY2ekxkY2lNR0VENFhXMENWVTFBVm1L?=
 =?utf-8?B?eTRFMVZHRzBFQ0Fxb3JnaTk1emQvSUxlYytqTlBEem5WU0JNRC8wSE1hSzV1?=
 =?utf-8?B?clZhQ29oUDQ5RGM1SFZWeGpkZHVNVE5FOUpBc3k2NUk1WWQxWXVzRUZKREJU?=
 =?utf-8?B?ZTRBaHY1YkEvUEFLUFEvTEppTkJ3cmlObXlSS3lUZmkzdVR4eU52SUkyb0xy?=
 =?utf-8?B?ZVlBMTlpUzFaT1NBSEVlV1BDa2svaVFHY0N4UU1UQ2w2azZEQlZzQ24xNlV6?=
 =?utf-8?Q?zNjPUU+e//JUkcac=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0712addc-4e5a-44cb-71f4-08df38cd8d24
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 10:39:19.7976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lizHoGF4yVKhSfQWfDiJMRr3lxnqSPQGcLpBs73UOOOBh4qa+6ya+BsC6ptTVyMxMJ2Xvem/QvTTrq18gYvC0dgtL5T/JCfbTE3v9lWA+eQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6165
X-purgate-ID: tlsNG-720697/1793615961-F0EA32AC-604AC5D0/10/78276251493
X-purgate-type: spam
X-purgate-size: 2338
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/2/26 12:37, Dmytro Prokopchuk wrote:
> 
> 
> On 10/26/26 13:09, Jan Beulich wrote:
>> On 19.10.2026 12:41, Dmytro Prokopchuk1 wrote:
>>> bsearch(), memchr(), strchr(), strpbrk(), strrchr() and strstr() all
>>> accept a const pointer/object but return a non-const pointer to the
>>> matched element or byte, matching their standard C library interfaces.
>>> The casts in these implementations strip const so that callers searching
>>> a non-const object get back a mutable pointer. Fixing this would require
>>> changing the public API, so document these uses as deviations instead.
>>
>> Imo "public API" is misleading here, as it could mean "public interface",
>> which isn't affected here at all. Then ...
> 
> Agreed. I'll reword the last sentence to:
> "Avoiding the casts would require deviating from the standard C library
> prototypes of these functions, so document these uses as deviations
> instead."
> 
>>
>>> Update docs/misra/rules.rst to note that this class of double-use
>>> library functions is deviated on a per-function basis.
>>>
>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> Albeit there another minor remark:
>>
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -450,6 +450,14 @@ write or not"
>>>   - 
>>> config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(file(hvm_guestcopy)&&text(^.*__hvm_copy.*HVMCOPY_to_guest doesn't modify.*$)))"}
>>>   -doc_end
>>> +-doc_begin="Functions bsearch(), memchr(), strchr(), strpbrk(), 
>>> strrchr() and
>>> +strstr() accept a const pointer/object and return a non-const 
>>> pointer to the
>>> +matched element or byte, matching their standard C library 
>>> interfaces. The
>>> +casts in these implementations strip const so that a search of a 
>>> non-const
>>> +object yields a mutable pointer. This use is deemed safe."
>>> +-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(file(^xen/ 
>>> include/xen/bsearch\\.h$||^xen/lib/(memchr|strchr|strpbrk|strrchr| 
>>> strstr)\\.c$)))"}
>>> +-doc_end
>>
>> Can't we fold strchr and strrchr here, e.g. as simple as (memchr| 
>> str+chr|strpbrk|strstr)?
> 
Sure, will do in v3.

>>
>> Jan
> 

BR, Dmytro.

