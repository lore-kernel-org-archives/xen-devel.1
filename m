Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AD2606A33E
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=cW1sP5Uv
Received: from list by lists.xenproject.org with outflank-mailman.1469509.1678302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOCHK-0000se-LY; Tue, 03 Nov 2026 11:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469509.1678302; Tue, 03 Nov 2026 11:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOCHK-0000sX-If; Tue, 03 Nov 2026 11:02:10 +0000
Received: by outflank-mailman (input) for mailman id 1469509;
 Tue, 03 Nov 2026 11:02:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOCHI-0000sO-K0
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 11:02:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOCHI-006QTy-0A
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 12:02:08 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae9bf2f-8faa-0a2a0a5109dd-0a2a4502ea16-0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 12:02:07 +0100
Received: from [52.101.201.71]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae9bf2d-6ca4-0a2a45020019-3465c947052a-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 12:02:07 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL1PR03MB6023.namprd03.prod.outlook.com (2603:10b6:208:31b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 11:00:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 11:00:37 +0000
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
 b=W9EmH48V6yo/AWPehpEHTSzO9+RS+5CAJpmWVRbRFrva0RjkFJuDXs+8s3diokYYmM7k+Nm8Bts3xm1F9t5vH4dHCiBJEZ0sBjLJWhv7IEV5V1PcKqIAbDtJWIBrWAxXmkkuZ0rhkJn2L2iwGi/OCe1qMT5WUXob7tFZR8Pf4zlSe4ZfqN+DJNY4410c7+GCNJbdcvPEbHWc3e4U4y70P4dZu2R3hFR2L09eef8XBc4al23xIrK3CelbSz1Y5q2/nbRZ6OccLufJac/A4rNqByJMq+0cZM6q4dis+2xjN9J9+iKPQYiJqIBBXdrlcCJQ6t/eG7qmCQlZxXowyw7qFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Kbflmflv6ljKJCfmUEffnbrB8ReuLm6KXSPJWqAABI=;
 b=alBcd1Pd7NEVwnCI6+c+eGewQ1BnivE83/JSewOSxO8w2oEKzo1PadMHRjjgMeMzR9joPaXgZM/a3GvDfCbB5S2H/3c1dPoaEd6TYvCyEsa5Sxv85bPBP+GcyVu/wJV4VX9LzrdVOFWuxevu3+YlyH/0aaR3gx4KD+8tRZqw7W6jVQPPDHJ/CFNxiJlKJt3wBcQg+aM0lre9JSmSCdelv7Kpcnjo6W9xypglAyEBL5/1ZUZsFWX/KB9HAD4k+bEVjfjIMx1rOyTptZsn23w2bTV+oA+VYx4B0oxZx5GSGQV+zoLc5MAI8Fqbzuc6qAcjAHZIr7fMYzGI9QZ9HS7qNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Kbflmflv6ljKJCfmUEffnbrB8ReuLm6KXSPJWqAABI=;
 b=cW1sP5UvoGmQdp3YRlexn9OiykLcay1GZh+QPQ1PajfMGmu8fVnHMOvYdyWOQhKwLeyQrqbKkSgXUZHsthyvK664pQfw6P7gFBv5cZyvELosW1JIJlF+JxRFL4uS/1pvmB9g2mXuWIX3F1SdUop7/DKrt5tnPchPWB0M/DC8Tr0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b3e50554-a045-42b7-908a-7e7c34c0dd90@citrix.com>
Date: Tue, 3 Nov 2026 11:00:33 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/pv: Improve code generation in
 async_exception_cleanup()
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20261102174234.1764070-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261102174234.1764070-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0224.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL1PR03MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb80e0b-d041-4de0-a585-08df3999b0ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006|261021121427099003|261102123227099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	N38ZqJjCfPmqZreZpxiyGaUPC2y1Hd9i40fCWvQi0V664igICzZOADJiSTbhH2DB18PbzTh+iiNdJVBNBlFrIOpimA7otGDyRzVprXQl0FWTusVkoUJr0GA04jyre4lDMC+uWBBXCwbp657c8ybXkh8l8WTJJhz87fSJLgkGyF1UmK1/LKKoNLBzrzfEcU+Kd8jW9CPjEfYmin+wnRDAE8526xwss4PbYJ+GMn4/QiG9E1/2nvRP0ZqdKPcmF28EjJJk0vGx4lI4zcgqEHcEiLnhbXb5R537FnsmtRUvitlFldtdQeu4CDlbQxTun36mhoxFtgs3c6RaX8ANFBy+cmcgRknB7igdguKDiHk6/cWDnu5aziEkjI03r7K1J0Az+aMgnie/95UvjLl/BPnKUtiZMDX/fyZg87cV1ZFaltNttTlO5SkhIWtQ46Egs3q7HUFxF/E/ZNHqRMIg7SB+cQCxZ0HpKGg5n1prHjzLJZt+WcHXA/827AOZm0A1DydoJiBsjwQX/pL04oykr+p0Bp4ywcIlOf6nuaKHrq+tohJa79xkl8E2b6MjKFzGK2RuQfQkfQuyZIjtpGAK7ZJzGp5zuTZXhRB0mqMOZ9n8b32GVBfSEWgyNDN7QTQFTzxvnyrGpoBdTDo0jf0XpK71VXs0Bi9e0xKDSwbJn3EVND4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261021121427099003)(261102123227099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjJnalI5TFFQQ3QyM3B5T2Z0dmJHL0lKbm0rZ0VDL3NUNGVTUW9uazZFU3No?=
 =?utf-8?B?cFlQdWExOVZvcC9qQlNqSzBpbGp5K1VMSFY3ZlhkTHQyVGJBbkFMQlUwTG1Y?=
 =?utf-8?B?Z3dMZGlIdkFuRGR4S1VJNXI0eFhXdklWeml0Y1cxYVNvZXl0Y2tleFlNK3lH?=
 =?utf-8?B?S3dEeW5sZ0xKZ0xUOTB2ZWp0cElrUDJJUVlYTXpKMWY3MXlFWDFMM2dpL0w0?=
 =?utf-8?B?UW5OcGg4UEhXcEprMUJLSTB4dDU4V2t4N1BYam4wWXN0dDlYQW1zSkpma0F1?=
 =?utf-8?B?Sk1yNWZnUFBENTkzbk9qTUN1SXFQQW5DL055WDRLMjcwUHoxVDZQbWJXcENm?=
 =?utf-8?B?YzFrMWVYTzE4VTVpQ3JXL3psTmd6ZnJlY3VwYTZNL3VMTUJnTDd1OEVIOWk3?=
 =?utf-8?B?MTB3NGpiOHdLeHgxTm9jb0xiZTlMMVlDUHNiSjRWeHg2MmhvL0RmSDF4cldt?=
 =?utf-8?B?YTJPYXBmY2tKUWRETmxhY2ZhUHQ1ZXpOamNDR1p3QjJiaG9TRi9JT1NlZEV4?=
 =?utf-8?B?bnhEaHFOM1JrbGZ0aS92cS93cGZmdlFZZXJaT2VZZmZTekVmbVp4Z0dCOE5U?=
 =?utf-8?B?ek56bGtoQVZiKzBZSkFmdG1HeEVJQUhZYko4aHlpZW1ONFFKbHdKdTdqemxO?=
 =?utf-8?B?a0FhZnFkOEtWVDlNcEpkSmR3TXFvQmd5NVRkQUFPNXBPT3VSWGFLanJQbnpm?=
 =?utf-8?B?NjM3Y2EvMUhaNXJEelZCNVdBVkVXTFdUbklJRWJLY05HM2l2ZmY4VjdudDVR?=
 =?utf-8?B?R0pDbGx6cU94bEYycCtnejkwOEFiWnNmcXdGWDdEdUt3TC9lOE9JSjc1ck82?=
 =?utf-8?B?emd4SlFLYzU4Q0QxOHUwbWRXWG1hMnEyMHczWWhCdEVvc3ZyT3BacDZBeHc0?=
 =?utf-8?B?WnJjZVB6eVozVHdGTUdmZmk5UVV6WjY4VVZkWFhkZm9BQTdPYzM3a3hYQnpS?=
 =?utf-8?B?MXFyd1RHOHJNeGUxaS81RXZOOVdZSFZFamc5R3JKMTdJS3Fud0JzOGxHSHhK?=
 =?utf-8?B?M0hPb2xVNWp6d0U1dlhidU5leVc4SXVuU0xuWVVucW1WMTIwS3dpRU8rN1RQ?=
 =?utf-8?B?RDlTNGdzZVVtR2REMUNtNzRlZlJoR1F3RVN4Ly9aOEFFbDBydE44RzlxVEE4?=
 =?utf-8?B?cGpreUx1eThUNXhTQzdIakkwamN0emp1ZzRsYTNsQWhwNUVlWk40UVRlZHNW?=
 =?utf-8?B?UThzRGxyT0IwSTEvMDBQRnRTK202TE9YZzZYbkRFSkhPREdRRXRtM29WcExy?=
 =?utf-8?B?dmhhcjc3S2tnZUtGRU96NlRESFNqTG43ZEFBVThnZEZFQURZZU42R3dIWVlO?=
 =?utf-8?B?RmxVRFJ6c29saGlSN1dGNDViREtERWdjeW4xVmpyaU1nUHJ1eWNrTENOUWFF?=
 =?utf-8?B?SENJSEpXc3dOZjJkMytNb09YaCtFVXBlMjl0a1RkdGUxSzlkSktpUUZaOGJv?=
 =?utf-8?B?c3Ftc29XTUdmTjFWbVJON2lBNXlGRnpBWnJMazNpTEE3UGNjQjZXWXc3SFVH?=
 =?utf-8?B?K3VmV2VzNG1JZmo1TzdXc2VveE9uVXBaeUlkaUNSUldUVGpnblIyb3d1c01H?=
 =?utf-8?B?TzJzUDBiVmdTMHdUa29DMFNkN1d1R0s4Q3A3YjcwRENSNVpINFVJd0RtNU9i?=
 =?utf-8?B?RFFFMEF2eHdKUmVyWVN4UjcxNWwrNXlzWXpWVE1RYzZVbWNNZjZIQ1k1TWtO?=
 =?utf-8?B?aHVSblFyUmRpckpIWmw2MGVkQzZnbkdBNDRjNVFmVGx4Q2w1dU91RG1yaWJP?=
 =?utf-8?B?V0tLRzdIYysxQktGOS8vOWM4VTR1Y0FqZVF1aUNJdmJwR2RBWjhlblZxWDFj?=
 =?utf-8?B?bklJdWhWc1IwZ2FqM25PUzM5OGZCUlJTY0lCUnY0SGNOR09lRVZ2bjBZL1BO?=
 =?utf-8?B?a0xPS294ejhJM0t1R29QSmFyQzNPbVNRRHMwV05QVmRpYi9XSGNWdEZYUHFE?=
 =?utf-8?B?cVI2dDUwc2FCZnZHTDdXYnJJQW5LeitCRFJTV2VldVpycG1mWEpLV2pVQnlT?=
 =?utf-8?B?VVJoN2IxMEphRC9jMHlHY0p4WXZHNUdxNSt2UG9xWkZhSzZJMldZTlBaRGFi?=
 =?utf-8?B?eG0xT3l6WVJ6YWY0MWV1d3hTcVNHNlZYRTBkd1MyaWwzVThHMWViaVZYaEx1?=
 =?utf-8?B?YytIb0FJd0xYc0dtb0dQWjg2aHpGTDF4L2x3eEtqRkhhSW1ZcUFRYVVIeTBF?=
 =?utf-8?B?endaVW1OdHVhUUo1T1NBNWtFTmFEZ1A4YUwzZTIrNjhHanM0dWNrYVByakFw?=
 =?utf-8?B?Rk83blVDL2V5b0UxT3owc0NLRGpEbEVxUmRjaFR1VVN6aUlMNCtjNEdkV0I4?=
 =?utf-8?B?U09BYW9Wemk4WG5BbTh4RzRDNnJidkZOTUo0dmhVT3lqRmFUelp1QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb80e0b-d041-4de0-a585-08df3999b0ed
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 11:00:37.1911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0YnX3VnoyGHp2j+TsJUoIrZ8m6sgO3nIFOKN8abv4EeGXquteRxWm7g51OItHtW9A4d9hxmVd8y1D8S9DUbc5f5qUF6w3BlSAx9SK6deYVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6023
X-purgate-ID: tlsNG-720697/1793703727-F02992AC-1DA8561E/10/78276251493
X-purgate-type: spam
X-purgate-size: 1288
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02/11/2026 5:42 pm, Andrew Cooper wrote:
> Use new helper functions to simplfiy the logic.  This removes an alternative
> behind the scenes.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger@xenproject.org>
> CC: Teddy Astie <teddy.astie@vates.tech>
>
> async_exception_cleanup() is complete nonsense.  It's not remotely close to
> how interupt blocking works in x86.
> ---
>  xen/arch/x86/pv/iret.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/x86/pv/iret.c b/xen/arch/x86/pv/iret.c
> index 39ce316b8d91..0efc0c7f12f3 100644
> --- a/xen/arch/x86/pv/iret.c
> +++ b/xen/arch/x86/pv/iret.c
> @@ -31,8 +31,8 @@ static void async_exception_cleanup(struct vcpu *curr)
>      if ( !curr->arch.async_exception_mask )
>          return;
>  
> -    if ( !(curr->arch.async_exception_mask & (curr->arch.async_exception_mask - 1)) )
> -        trap = __scanbit(curr->arch.async_exception_mask, VCPU_TRAP_NONE);
> +    if ( !multiple_bits_set(curr->arch.async_exception_mask) )
> +        trap = ffs(curr->arch.async_exception_mask) + 1;

This should of course be a -1 rather than +1.  Fixed locally.

~Andrew

