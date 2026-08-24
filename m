Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCAEC5DF94
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 09:31:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398745.1634880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyR0v-0006eK-CX; Mon, 24 Aug 2026 09:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398745.1634880; Mon, 24 Aug 2026 09:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyR0v-0006eD-9c; Mon, 24 Aug 2026 09:30:45 +0000
Received: by outflank-mailman (input) for mailman id 1398745;
 Mon, 24 Aug 2026 09:30:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wyR0t-0006e7-M2
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 09:30:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyR0s-0019Rk-6f
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 11:30:42 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a8c0f31-8faa-0a2a0a5109dd-0a2a4503db62-34
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 11:30:42 +0200
Received: from [40.107.208.28]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a8c0f40-fae8-0a2a45030019-286bd01c26c1-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 11:30:41 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5716.namprd03.prod.outlook.com (2603:10b6:303:94::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 09:30:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 09:30:37 +0000
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
 b=d69nsy+SK6yf7zOf86X05X25x13sCk+OHqFP7vR6rW9rxppXdF1/CRnq0A7FNU1z0nFm2MxcdoJ2cRetdlS95x11bhJ6H98WEKWQehGpTaNZzSUo/mIETu//6K5eIgIQhh99K1oJeF1BG3DWVDaozU13533cwDpwtnLnqsFPQ1W/pONQFhEm8bdHddb2mvgUoiJjvIBFX/SbgmwEl8CyJrdqqzLvEUR0LOVntdvFXqBYkTqhDjOsu5T1W3xpAsOrIuO67AzHndiwozscv6sFwXz+7VIfJ6+F8bRF2FN1nro1g7H3Om9MSOSNcTWytYC4zENlxq1i0rSYA0GYzUoQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpgqEA7U3s3ys2xJSmSljcRHZ0ngwkE3kq8BdjAA1ZM=;
 b=XUS7i2wZ8bxSuh2F06kXi1zLtLdO6+Xjda4PARDTnPHsJM8kOLCRZSQuB+DNLIAiV/kxRy9whRbyfQpicen5SxUVbAKKogpEr7C5TMx9OP5AZs7peZj98Qd+2zw8wGzdjU182kJA5QcfGc8bVQoBcdM9wLMnngZ2olGJi1E5Fz4iehqjdHmWFVLrs2MzWxAx0GX9yp88fUGHfKim1tunaWmOO6Tt4t78OSL0ovGFE16kNkVxSX3TXNdisztAs87GQZTAHxGokO/jDG9xS6Bgmdlzs37a7yNOeFW06rt4acLFQT9Xhm+bzFV3IHhzYdifO/rPtNoYLFxsovTmo2B7iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpgqEA7U3s3ys2xJSmSljcRHZ0ngwkE3kq8BdjAA1ZM=;
 b=wNd7ZhBzsb+8AxIauk6J/EPgYPz+YHa3K6GTQ4FSdDCcOpYvKxIZtC3Sk709r0ItvTIV3FayAUXDJA6F6M+7RnWqr6Bo8MXB/F5fRzvS+tppNG2A6Zq8QWynSoPK6sGM48VoAlYiqkU/uEq4JLrqRxBx7XGyCuOHuQVYbBsgsig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d938b635-1cdd-46d9-8083-c6f9251ebc85@citrix.com>
Date: Mon, 24 Aug 2026 10:30:34 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Andrew Mbugua <andrewprecious388@gmail.com>
Subject: Re: [PATCH] x86emul/fuzz: sanitize CR4 values
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d3d188c2-32c5-45ee-9b10-1f4ee1b85c6e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d3d188c2-32c5-45ee-9b10-1f4ee1b85c6e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5716:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b61ba37-0a14-4dde-70f4-08df01c25b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Q7xYYaB9Kfjf1ZT//j8npxlGv20+FJlBgdLu+TvCCH5qkvNis3RA5cGF/6fjpbDV3iBxN0y/knAZd/6iNE+CM6F1pQbx5PhnICD+4H5/eh9hQOkth2tl2O6g6ixN9kEdpUd4RCQWIxzWfGT8LEag/qvDDSwHB8/xzrB9m6SBBQhDZ9KjiFGEEAwTVZGtWcGkosh4c8MvyY15Z1zhtHIwQtI5q9PN+BN3BHpvbaz3c9ipHn5JEWYShAoTtEqwBhGtt+aVOCsJ8J3VMS6R9vI5xLxaYg32z29H/I6N4RGaKOC7kNhtn38sPK3GYvvkFbjSOWz5PWnVaOIbjtVCdQqqxISJ7fw4iU8LldlkhwqjRmeCaTSDQknYpPTovxaPo3fH/Zdy8El9Juz/ddPYnKo20dN323mVKjE0G1mEMHGKySzfVmcpYkEDfefcHq5qS57giBP5bfkHL1GhvutPM9BNvjw1EscrWL0FvoCb3QAUzs6NXMwg7Kn17y32KQ/tEBrvHqUUDORL8MHsvuh6UeH0xl9ViL1aAEFMYGMBqZaVPBc6oZRd1RRaO206f1BuTYiZsNoTAg60O2OO/geVoIQShgoVUQ7QPfafIzSxicW/OywTXROX5BHUFz5wch4Ib2RvoDYHl0TuxZikNeSp+Gqi++txUxaalhJgKg2buUXk1cw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlpoTTZtME1oMUdlVjdiNDE1ZFRWSTh6Um1hS0R0NEk0MkJFOVQ5c0tEYnRT?=
 =?utf-8?B?MWZmak5QUmpTanUrMmI3d0l6d09mU2hUN0pXSlp1L0tSbjFuaWc2dGhnRUth?=
 =?utf-8?B?b3JTVzVuL2JqY1NxUXM5N3BzTmg4ZzlVWTBIalBmRXpXMVlWbi9hM01ZRkdO?=
 =?utf-8?B?WkhORVNCSGtmTVB1d0xvWlByTDR1c2gwZFBjN2ZSMUFjL2ppekJHajBNMzR0?=
 =?utf-8?B?TUY2SE04c0Fpb01ob1B5MkZIWlpSbXdranFtQmQzeEo1SkcweW8xcERJWGxL?=
 =?utf-8?B?TWhLbmNEd21ZWHhWc1lqT1h0MGRvTUFQVWc1REFtYmpRRndXYkI4d3Y4bDNB?=
 =?utf-8?B?cG1VVSswME1iMjNZR002N1UxcW5TWW5YN3NJTTBSNnhmV1JHd05yYlJ3OHU3?=
 =?utf-8?B?UWRXbURESFlHdWtkdTA1bXkxd3Uxa0tFY0JONjdsWlNYWlRzaVpVaTQrYTE3?=
 =?utf-8?B?U0ZkTWpVczVPTWlEaUt3OHpMS3pLd1AxR2I0dGRqY0RJcXJiYWpWVEdnSHpi?=
 =?utf-8?B?SXJkUUp2dTNZbWFuR0t5eEc1dkR0R1h1eXd0VFpSSm1hUnQvdzZyQ2NrcFAv?=
 =?utf-8?B?elZGajU2dHNaNFQxRjhxUzlmZ3Y1ckhiaEE4VTh0ZmJBQjVPM204NFU1cHp1?=
 =?utf-8?B?MzYwdGh5WTl1cVR6YnJ3VEsya3JSVytBU3JkR3BYV3BkYmFaOGdMMTZDL1Zj?=
 =?utf-8?B?eEdZWCtrbnRVOGkvcTlHS2VTT2w4Wm45NVBwQytjSUE0cFI4MnY2WFl0TVFM?=
 =?utf-8?B?QWlrUUV6Y1hQOVZHTkRUNTJNV2lYdER1NVp6cUc0OEEzcktmaWRHV1RtWUt0?=
 =?utf-8?B?WlNlcUpsQzFBKzNpY05scVJRN3p5ZVNZbVhEUEkwWGp2eXh0VTNUblF5NkQy?=
 =?utf-8?B?WHRlcmNrVTJGNEdDVDdMYzdsanZHWHFvTG9pdVFEWmFCdGpidGdIbU9sMlNN?=
 =?utf-8?B?b3dydlg3bUlWZDN1QzBDd1NzaVIzZCtMUTFiWkxuVS9RVVZNOG1vbnBYUURX?=
 =?utf-8?B?U2NxZGxLRkRIVWdPZGhXSmpkMXFBUnREWGxpbVV6RE9VeDJkK2s3aWJoVWV2?=
 =?utf-8?B?ckhiWnBjS0RaYnlITDlML09rdjN5bkc4MmRWOW0wWGlWbldBRXFEK2luV25Q?=
 =?utf-8?B?REtReCtheEM5TE5CcmhLRmtIQytiamkvalhNdi9GeGdqOVhXOU43TUN3L3p1?=
 =?utf-8?B?bWxHbW40MUNIaDdhdENBa1RBZGVsUmc4a3ZpY1Z1YzhBMDk2TitlZytBdGhB?=
 =?utf-8?B?Y3NyYlFDT2VJRU91cDlHWGZUc2wzVG95VUc5OXpUdjNhTkZHdDhpQjltaFM3?=
 =?utf-8?B?cFJETUp5SXZnaDh3YmJMWWt2di9WRXlENG9QTkZxeU5BRXlGYkhzRHZWbU1I?=
 =?utf-8?B?RFBFRHZrQmxEM3dvL2VLMkx4KzVrL3RYQ3RUUDFyaXRDOWZENWo0cjlGUjlE?=
 =?utf-8?B?VjIwOFlNVHYrLzkvQjdIb0xzUVFpdFhpZXV4bnI0bEFRWnJBYlZWdWxRYWVt?=
 =?utf-8?B?VWxqb0ppai90K1VRUEh1MmNtcFcxMmZCMFpTL1RNMmFRdVpJSGg1cEZIblhH?=
 =?utf-8?B?emI4VktqbkRLM0R1cExSTkl2UXRGcFliZnVUZjNGVDBYdStJb3doQ25Edlhs?=
 =?utf-8?B?dU9sZTR4b2JYTEcxRGNPKzIxeHRpYUo5L05scjM2cXRka0JaRnJ0ankxWFho?=
 =?utf-8?B?R2Rod2pCYWQ0L244Y2NqV0FTT0Q3ekR0SjFYcEdBcFV6R0ZPVEZoVVBUUmtJ?=
 =?utf-8?B?Zklnb2NqcUtxOVVFd3B2eG85NHlBOTFZaEFBWktML2FOYnhTaXcrRmNoa2sy?=
 =?utf-8?B?TjVkZUZLTzRpZDk4eEF3TzRIWTJwM1IzQXp1djRFdklhSzVLWWZBNTdLQWpP?=
 =?utf-8?B?RmJicXBkRk9HZlMyVDMzbTRjMDFydW8vRGZmNm15alE0K0xGL294em5RTExn?=
 =?utf-8?B?NVdneG05ellvTldqOFBFdHRsaVgzSWh1S1dKMVo2L2pTRnZXOWJZZzFWa0ox?=
 =?utf-8?B?ck9qZ3hkbXY4eHdFOVZCOXYwM3BzbzdnTEcrdkpBQUYyZWR5cXdsOENQU2c5?=
 =?utf-8?B?cUlhVkxYdTVzMkpMTGRLMGluVkhRdXNBcFlhL25MMWlocVp3N3hRYmhpNFo3?=
 =?utf-8?B?VkQ5TlJLODc1YksxMFhuaUNVU1RKQkVabVVoTmFpWS9FMDVMUEw0UUJBT29l?=
 =?utf-8?B?YlZOTHhWM2Nnd3pFOFYyMlE3RGFiS3ZURFRoY0FabUU4cnpQZDN0WTkzUHVC?=
 =?utf-8?B?SDQ1U0Y4Yi9temw3N1pTVVRFM2dBazdMUVMxSGVlclhESWR2QjJ0OXhleEo1?=
 =?utf-8?B?djc4T3lYSFc3R1NvTFlEN0dEN2VkcUI2Syt4MkFNTWdOb3ZlSFZmZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b61ba37-0a14-4dde-70f4-08df01c25b1c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 09:30:37.4544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzFRPiynZUcWN0IvjBCMkWMUjQ286gjdoM1nTdY5ZrN3TZB55w6U5LEQ6eXjz0mZZznk8DD15IfltU3LD35L5Dt339HLjXNQAn5ZEa6D990=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5716
X-purgate-ID: tlsNG-33051d/1787563842-77CC34E9-FE660082/0/0
X-purgate-type: clean
X-purgate-size: 779

On 24/08/2026 8:41 am, Jan Beulich wrote:
> While the CPU policy is obtained from hardware, the CRn values to start
> with are taken from fuzzed input. Since most CR4 bits can only be set when
> the respective feature is indicated as available by CPUID, the emulator
> often only checks the CR4 bit. Without sanitization, assertions like the
> one in emul_test_read_xcr() (checking XSAVE support) could therefore
> trigger.
>
> Omit most paging-only bits from sanitization, as the core emulator doesn't
> itself walk page tables. LA57 wants checking for the bit being used by
> CANONICALIZE_MAYBE().
>
> Reported-by: Andrew Mbugua <andrewprecious388@gmail.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

