Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1268E606A321
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 16:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jOySaqb9
Received: from list by lists.xenproject.org with outflank-mailman.1500487.1696631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVWgn-0003S0-Np; Mon, 23 Nov 2026 16:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500487.1696631; Mon, 23 Nov 2026 16:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVWgn-0003Rt-L2; Mon, 23 Nov 2026 16:14:45 +0000
Received: by outflank-mailman (input) for mailman id 1500487;
 Mon, 23 Nov 2026 16:14:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVWgm-0003Rn-9g
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 16:14:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVWgl-005oNv-6e
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 17:14:43 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6b04666c-2eae-0a2a0a5409dd-0a2a4503c40a-12
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 17:14:42 +0100
Received: from [40.93.194.55]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6b046671-fae8-0a2a45030019-285dc2373e03-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 17:14:42 +0100
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by LVUPR12MB999137.namprd12.prod.outlook.com (2603:10b6:408:39e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 16:14:30 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 16:14:30 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOA097V7tEv3ci92QyUWMFakh/HsGTl2LekytrVOJhPdcjO7Wy/QBADsUXp9avV6hhzty8YMseP1Iu3eBn+J4rqA1mRH0HI/OG1pwWrO6VenfyRGBGncKz9MO+DUhhDsHv9U9aojMl4hOHewCMfRJPdmct1deGwemNJVWUiNwjYbzT0QM6UJmbejxXqaKakIJkqLvzKK2eLCDDl5urZtc3atyjmv4yCrWFRIKsPs3GNGMmdwF7IN/bfw0MV8O8AJv4tjXPrCGx6iF2Iui/FM9PnMavj1rpnBvH2zhsx5WYMEnPEgPbD9Qfb0w1RvtKPswiHWLyzaIcu/lQFYVEnTFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aO0PYDmVjxoRk2WttyohG69ZVL+77WLBKKYTjNinLB8=;
 b=s/Ub8htnGfQdd225WsyNBFGnKdG8+q9aBilI9oIrmFb89UpKSM+NGC2WTrRlSVhfjM4FuHTLrPzj5QyK3ErEKu2nrJhbs+8n75uURsYCWoDoCE52r6yqDEo8LRIN5v3HZSusUH6TJ6/ZdOfkjyoj6lZo2aix5GB6QDvJWAWbpJ4DJhB242LoneeHetDmWjhDfUkFoG77pZOAJynObSNueyV9k5Thi587lOvzrOBK/1EV3g00EbeN3J5BRSqPD3dBV2fXa824dVHKvEWzPLjtHjNeeMvJv+tKopURk31SgtS2C2EuSX6GqmULiK1sCScztAJxv/UGR9OY1i2IfmFVFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aO0PYDmVjxoRk2WttyohG69ZVL+77WLBKKYTjNinLB8=;
 b=jOySaqb9Mn0Bs+RhJUt8tYR7i11MdCvs3XvJ2NkjKliphEaWmFKGud+0PdLICUTXz82HZd7F7tm25D3zYdZxU5U07U2Wi1qy4BMxnKaiLA5wvv02IHu9mpCcJMB9hGXQgsCRwyP4ALuPy51NBQSuNagdpglPoT3MnlaEYyhPmUs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 17:14:27 +0100
Message-Id: <DN2Q2LULV7VS.13M3XY5EM4ATG@amd.com>
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, "Teddy Astie" <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/amd: (More) use of U suffixes on integer constants
X-Mailer: aerc 0.17.0
References: <20261123154815.196410-1-andrew.cooper3@citrix.com>
In-Reply-To: <20261123154815.196410-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MA2P292CA0021.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::13)
 To BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|LVUPR12MB999137:EE_
X-MS-Office365-Filtering-Correlation-Id: ba833a71-d042-4d92-d783-08df497cda65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261102123227099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|5023799004|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QKZ8zD4Tv4j0JwsgL6VYknZ7eufXJQmgCbLEY2aKAjqsQPZa/BnxTuQ7xLyzHWKQEcfp/FGzlmjI5k49jswf1CopOo6+OIHPDx/NMd1W0aRSqgYm1nqsgzQb3MaeN4OS+ikK+Iy8234TiJ4OgcNvWZnMbq4aro4BBUfL8vhZOOHnZzojk/PzCt7lswkiW4JW9BveKzuk1CNH47WUw1ntXUaX+FwRcEmory+GcAo+jcNbr6oDzQzRHlcwaL88KhQw7hdcFuLGcInwN5xHl3T9TWp1a8AOJQ1UUlJJnqjNCAOFe/lpRJh+jC45GSXj3IO4VRAvUIQU0Y75BNKvOLf3O5cPj6hjhNETg84JZNQPn99hPjTV0F2+7GIRRq3cnoaxu/13VOK5HBQUuQsJ9f5mkY6G4iBY118MdH0D7XGfyvXUKdcPTUBCfGFeJC3lMND/Q8kDzXwPq4aQUdrPldAtzQEOCrVs+kpQO9kUIm0AYPLZyKPradBFt93xxze08Xh/Y3dZ5Ku89lKAaLPMvIhhqaqomPFM5ffIkCUAaFcpe6hfft1WfVACouu29FDXwQ/o9tSqMS52LCXZ9rIJ+c8PjkMSjLTsdBczvbIgVaNZgu1hxjGJJbBPPTA4n2+ZD5C+RLsKp4F3fx0wzFUqhvt9LOFq8wzI0XR9bx18H06y4/E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(5023799004)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3dQNVVmeGs3T1V1cmp0dWJQVy82WlEveG9EWWZDdDhZSlozMDFQQ1JyOERX?=
 =?utf-8?B?aFdiQWV3MmlxeTZxL2cxdVBSUEZlMGVHb05lVDBQZHdUVkR4L2E0cmZSZTA1?=
 =?utf-8?B?eFNnQ1E0VkFucEM2RXdWTTNiZndlRUd4MVpXNVpXdCtISHlxdk5GYTBFMTJ1?=
 =?utf-8?B?UDQ4VkhSREVLODZtTG1qU2ZKU240WHEwSnd2eVh4ajZwNlJiL0pjMXB1Q01x?=
 =?utf-8?B?RnpCbVl0YXA5blZ1YVdSb3lubjVQa1p5RlVOM3VjdmlIbmhZdFN6VEJ5cGZq?=
 =?utf-8?B?eUpKbWw5cFpvTGFyeWJTVXZPTHBqU0phcFFYczdubW5qak1abmlpOXJiMGdQ?=
 =?utf-8?B?c1lUSHlHMUE3OCtRUXczS3VFeU4xWlFSN2RuU0tpSTFraFg0ZS9jSHAvUDJr?=
 =?utf-8?B?a1I1VTR4c1hxQnZmeThDM1dHUkRkbUplUTdicWE0ZGN0T0g0UGE2aTB5NGRy?=
 =?utf-8?B?YTRXZU4rR1VJSHFQZWNnbVVjNjRrMmJrRXJ4d0wrSEFtM2xoYWQxNlRNWWpZ?=
 =?utf-8?B?MVphU2l4dHZpZ3gyS21tK1VqOEVIZHN4MGNoU3p4S0tSZ0xXVUhKcWg2ZFgz?=
 =?utf-8?B?ZlM5dDkzSmE4L1VhdG0vS2FRVVkzT2JNUXdURGw0QWxVM0ZyZGgrZlMybzlm?=
 =?utf-8?B?VFpRblJ5UG9EaXJvMytxeXNYYmhvckJDa0hualJuc05pZVBYUDZiSDNGWHlJ?=
 =?utf-8?B?SkhzL1dteTJwWjd6TVhpcHE2bThDZjNSYnZYVDBTTWIvSnArUnMzRENDaE1r?=
 =?utf-8?B?NTZEZENBcUxEMGlEUVdCQzF0WFd4VStqRjVoMk1wdWFiVzF5T05COWM5K2pP?=
 =?utf-8?B?eVVCZ2FaZmZrK2ZLZjIrTUdsTU5EVWFuN2JuSEQzdmx5TFdrQ0FwZGlJTFEw?=
 =?utf-8?B?Y3d6akpGdXBWMDRrV21TamJxWDJnV3BGOUtqVWNSWE9iZXVDZVNMVlR6aUs4?=
 =?utf-8?B?TnJESDRUemZZK0RWS05SRG1DRlY3SUlOZzdaNVRTblJGOVlxMmVXQzJTbmtX?=
 =?utf-8?B?eW80RjJCVGZ3R24wdm94WW5VbXM4M1BwLzFUVU1Eb0UxTXd4ZWRWU1hqdy9x?=
 =?utf-8?B?N0tVYzlpdmJZVnBtbDdhZkIxWkk2cytWVUFIbkROQjVmT1NJaS9BTE1VOEta?=
 =?utf-8?B?bmw5Yk1JbE5CQ21GSzE5cE9DQzZncGMydUJFMkV6enJWdFZkQ0g2Wnlkd1Fx?=
 =?utf-8?B?RFRrVHk2MXBBMWVxcUNUWnVhM0tMQUhiVmM4V2ZlclZWS1ZnQm1EWjR5eUdJ?=
 =?utf-8?B?aXBRTXJnYzk4bTRCSmNxMWFNZ1FtbVBrTkVVK3hSRnpaMFYzbGw3a01VRTNC?=
 =?utf-8?B?ZlN3dG80SGRKQytTajVvVHAwUnZUWEtpbzVwZG5LM1h4cnlCVmlxZ3o5Ymdt?=
 =?utf-8?B?Uk80cy9GRmN1MENnUlRyUkdXM0ZIVUZVNzRmM2diMU5ZUGdaWUg5U04ydmVs?=
 =?utf-8?B?dlpXZUJPdTVUcHdqa1dtY3lWcnl0aHlXOEUwNWc5anZKN2dsRTE3OUtYUS9L?=
 =?utf-8?B?ZHRaWGR5UG9TZWRad2FEQVF0TFB1R0NKanErMm1NQ3Y2WVIwcjVnMk9XeWZE?=
 =?utf-8?B?OWF6MnlzWmtQS2FuMExuT2lKaFNyM2FGOWVnZFoweldTdy9JV3N2cEVQRE9D?=
 =?utf-8?B?R3N4SlVQZXhyL1p2MzFvNy9LUTlHWlF5QlNzTUpBUEFrZkVuVVZCdGs5RkxF?=
 =?utf-8?B?bVRyVGN0YWlVcmIvK3E1MzBMTmQxSzhZRHc0Ty8wUXNMeENVd3Vrd1FPMFVR?=
 =?utf-8?B?WW1sL0p3SHV0R1oyTDZvWWxNWUhTZUlpTXdPUjNxbllpV3pPeVFwVnBrK3Yx?=
 =?utf-8?B?QzVhblJCTUI0MURram9ycFo4bXRqaXQvQlhCRVZFU3luRUd5UjNMZGZYc1Fq?=
 =?utf-8?B?a1pRZnozellLOWo1cVhmMkJDd0t2TW5ab1Uwd3ZJMnJ2ekFQZk95cW4wUlI1?=
 =?utf-8?B?aWovRkN2TFVqeFpTekxEbnMzSFJ4ODJBS0R0U2YxMUJxSk5nVkFuaWtVRXNr?=
 =?utf-8?B?TmdtZDg5bWNmQnFudlVlalpCOThJcVlnWUdWRUprcUVaSlVjK3JKQndJOFRZ?=
 =?utf-8?B?UmtjZGd5VkxZYk1SN0g2Tk9VVUZzcEIyTUVpTHQzKzhub1RNVEdkK3FHeGRR?=
 =?utf-8?B?NGpsQUpUMVF0Y3Njd0lhMlU1ZGswUDlSSGJKbjdndFVJUmticDNDVStPZ0tY?=
 =?utf-8?B?aHRtN1FHVnlnYTR2SWh0aDBDK2hyN1EzVXNMMGkwc09kRUxnVXFNMTA5TFpK?=
 =?utf-8?B?OXJRK2s4Zy9XOW1sSW8wSWRXY2NyeWt6cFoydDJUbE5ZSFRMWk9mYTFlRk14?=
 =?utf-8?Q?NYv8hrEZNVCN5emygc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba833a71-d042-4d92-d783-08df497cda65
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 16:14:30.0024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8ErRxRJrDmwvM4W+q+U7pdl9yQDpaKup216bMo1FBU7kLWSUG3lLTD1ApneFwkH75XdJwD/evw4bFnFoP4ukg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999137
X-purgate-ID: tlsNG-33051d/1795450482-77AF14E9-BB284EDC/10/78276251493
X-purgate-type: spam
X-purgate-size: 1475
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon Nov 23, 2026 at 4:48 PM CET, Andrew Cooper wrote:
> This was missed, but necessary to fix in order to

You probably meant to write a bit more.

  "This was missed, but necessary to fix in order to add amd.c to the
  set of scanned files"

With that, or something similar,

  Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

>
> Fixes: 92ddcda17fb0 ("x86/cpu: Use U suffixes on integer constants")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger@xenproject.org>
> CC: Teddy Astie <teddy.astie@vates.tech>
>
> Found by an AI review looking over recent commits into staging.

I didn't notice this (for me) compiled out hunk

> ---
>  xen/arch/x86/cpu/amd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> index ff9fc0689f3a..8fd0b675161e 100644
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -39,7 +39,7 @@ static inline int rdmsr_amd_safe(unsigned int msr, unsi=
gned int *lo,
>          "1: rdmsr\n\t"
>          _ASM_EXTABLE(1b, %l[fault])
>          : "=3Da" (*lo), "=3Dd" (*hi)
> -        : "c" (msr), "D" (0x9c5a203a)
> +        : "c" (msr), "D" (0x9c5a203aU)
>          :
>          : fault );
> =20
>
> base-commit: ada7fa3491668bbcf1afe525057c470903625d26


