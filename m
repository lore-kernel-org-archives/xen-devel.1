Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFCD606A31A
	for <xen-devel@archiver.kernel.org>; Sat, 24 Oct 2026 14:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=kq4UfABF
Received: from list by lists.xenproject.org with outflank-mailman.1460091.1671550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKcfi-0007K9-3R; Sat, 24 Oct 2026 14:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460091.1671550; Sat, 24 Oct 2026 14:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKcfh-0007K2-Vd; Sat, 24 Oct 2026 14:24:33 +0000
Received: by outflank-mailman (input) for mailman id 1460091;
 Sat, 24 Oct 2026 14:24:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1xKcfg-0007Jw-Aj
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2026 14:24:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKcff-00FXqa-Gq
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2026 16:24:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6adcbf94-8faa-0a2a0a5109dd-0a2a4508acde-12
 for <xen-devel@lists.xenproject.org>; Sat, 24 Oct 2026 16:24:31 +0200
Received: from [52.101.56.47]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6adcbf9e-f659-0a2a45080019-3465382fc428-3
 for <xen-devel@lists.xenproject.org>; Sat, 24 Oct 2026 16:24:31 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by SJ0PR03MB998646.namprd03.prod.outlook.com (2603:10b6:a03:40c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Sat, 24 Oct
 2026 14:24:27 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%4]) with mapi id 15.21.0546.021; Sat, 24 Oct 2026
 14:24:25 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjgcKdEGmBatM2Lo4lTwC4Losfue4ua5MaEZezs7ZUjhjecqoYiX+TCrwL0mXkqjY/AfYgPTi4dHa5cedz4hSos0CGVDUYj94gA6LTD/jAm9Hl0kudZ6mii4W785vHGJRpB/PecoemRbN6fQobYbBj7Dx/eVOZbtNyjEFB75EkhpITo4WGpZJhQTgu8k8jAnxTdaKWQ18DmabhR36D/YaQJHUD06mlwLpfYrJV0WZTDV0P7qSz3jg4tpbmw7tPW2hiioyPC62U/O4qy+dqEhv75+ZM4qf68sObCJ8pdgn1q4BUM79ciQYCPBL/HmqtVjO18v+ihS877PHbJRoSeg4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5GSCA2pJvjcuIIR1ofLXFbv/S35L8a2Th1hWUXAMl4=;
 b=TibvX/i2/FxWWgScxA6F5sC2skv9vjr/65Xr/wwJWDLIR66iMyXQ+Au9iPOvJ51bnpla1pGXv+gPWNFIX/3C4K+S/Osmk8d2QDWHlLXLavZJXTGtZMxmmYWo0iPxxCrtv3jsOX2UBpYW+1JMpMznXBtioseH806MiuGGYzqYTtE0GJNf/AlBmjVjU61UOh2X6kHWjBoJCGtFOO6tu4Cf5ypVqddaynwZDMChIimOvEUJ5bSI+bpninDJH+XiN/0msEPhsDe4m+QTxsQgQWUcNM5tGS/opJBYrpofcNScRGAU7cZRcQOdh/Bw41xUfb1pSuQPB7S5HC4w4sJ5PltQng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5GSCA2pJvjcuIIR1ofLXFbv/S35L8a2Th1hWUXAMl4=;
 b=kq4UfABF3imyNXdpSnhlQDF5E5OkQXmGMpR8uSVQQ9sWBsOlhpvzpO3+zDQpu3ewJSlsZINvFjVczSerxNAx1+wLFfj1Reyh4Bhyyr38pLmpZDS6l9AtjevM2u1j7rZgqjc08mM+eaFG1MUSwBzueU892P+cnKmTq1iTKJrhOQM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC 4/5] xen/tracing: Add a function tracer
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Ryo Takakura <takakura@valinux.co.jp>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
 anthony.perard@vates.tech, michal.orzel@amd.com, jbeulich@suse.com, 
 julien@xen.org, roger@xenproject.org, sstabellini@kernel.org
In-Reply-To: <20261023045655.164966-1-takakura@valinux.co.jp>
References: <20261023044809.162759-1-takakura@valinux.co.jp>
 <20261023045655.164966-1-takakura@valinux.co.jp>
Date: Sat, 24 Oct 2026 16:24:17 +0200
Message-Id: <179285185778.1706038.7602957469449476344.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792851860; l=5662;
 i=bernhard.kaindl@citrix.com; s=20261024; h=from:subject:message-id;
 bh=xK0gvg963YEcqBC2gZWFWbFM25fn0Hffi90fEOnOreE=;
 b=f+CInI2hMOm1/I3pfjZRQvcovX8r9UtCD1zyqsWLoQvT55ZeFkUAFlVhl0DkuNUhx2FXLP8nE
 GxW2+vr76GyBWPl0cII/rHkCttVO7n4OLQcDazy0FUaI6ENh2r25O5P
X-Developer-Key: i=bernhard.kaindl@citrix.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=
X-ClientProxiedBy: VIVP296CA0032.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:356::9) To LV3PR03MB7707.namprd03.prod.outlook.com
 (2603:10b6:408:28b::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR03MB7707:EE_|SJ0PR03MB998646:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f14402-267e-4e03-6234-08df31da8190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|261009223027099003|56012099006|4143699003|11063799006|10067099003|261021121427099003|18002099003|22082099003|3023799007|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	Wylc5ICTrtSR9CSy/LBpTcqnCUu9iHn9L2OLWkmi+cWUZvwim+LXlQ7aa8ohIOXHeY7sI9M5fTxDmcq6ySR9IQvW4IG7Xp5lJYsLHRHWH8XZic4oiD5jsAl6ZI0f67yUPg6mLRCEUekRnZF72b/uLuM+1SLeNvxkdKXoM1Shb0+z0rCzgFyEqqS/6R/biPtCYn1TFrK+OLwF8g9nLkGPKEXQUsJ//LVjdBL0ZsNJqFqSe/kVx66O0S6CSmV2PW4Rk/N1Xq1E2hZ7yEJFHI9MLduNoW7R3qHWNoq7H/Qo9+e+GVhiaJoafrqkfIWV2F3vydw0AL1Q0mGKxo221LyyBAIrboRbjZ3noGmGOVcsQJ4sl++of7iS7lyTCriOaBWi/CAeQ5rNkUOdRnDRyQrufWhGfLNKUWkNx8VRmqtDupkqB/QP2UB4wmnjBdTgQ4M/gDNAs+fBnc+zVNh8EWN3gebBPTZtAeb0ReO+nyD2tlHfpZhsaeU+SrUgWmpSqEU4jrC1ZG9z1NdY4+GoQWesvTvFFEOn1SApnpD3OYDIBqRYSdz9orFA8AmE6vWGmLOLTMeQXt6DvcO8SqFKPj5vhHXX5MNLzDDQc9PkcdPmlvW5ylcSTrirXxG3E/sdpAj85EevibdJTMbiwqYOC46q+PUTwThpUCY1tJOpGPSFb/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(261009223027099003)(56012099006)(4143699003)(11063799006)(10067099003)(261021121427099003)(18002099003)(22082099003)(3023799007)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RW5UR1dNcnRiVDJocTIxT3ZMN3lLR1NWK3RrWVc1bjVscWs5bHVxTWJEci9R?=
 =?utf-8?B?bngzcHZuTStSaTVUQmNiWG95OGR4OGFUa2VlT0NKWCtxMGdPeHpyeWlQRHRq?=
 =?utf-8?B?Q3hYUTVQR29ZSU5sWDJsbGhtUE9SL3BsUXhtbUhKeHZaY0pkV09GdDNCWTlZ?=
 =?utf-8?B?Qk84alF1enBpempjcm5uMWtlMnhGYnBIWXJvR0ZtRWRtQjdyYzlEZU9nZWpD?=
 =?utf-8?B?NzhTb3RKbGI4dXJSRWZKdmpVUzIyL3NoRHdER2xhNnBqT1RQTkJ2M0d2Q0Nm?=
 =?utf-8?B?RlpPVys0OFI0emUrb2ZqN0lBV2tqczhSVXJVSGdsVHhrcGs0SG13UDU2ZGZr?=
 =?utf-8?B?YVNTRHRCWHRHYnprNFNSenlIRnRWOGcwcEZNSTFncHV1TzE3ODFRd203T0dI?=
 =?utf-8?B?SXJrQ00zcm1Dc0E0eWtINVJmTW1KQm9tNSt5TFBoS3k5a0s1QnVSZUpxT1pj?=
 =?utf-8?B?RmxGdVUwcXB1ZC9idlVjVzExeHdwaW5OdnpPZnFzQVlaOGJxTlFncmJKLzFu?=
 =?utf-8?B?TmZTOTJkQWJlSWtBcUJxUVQzaVoyaTd1NHZRajdpaGlWbTd0dnV0WkxLVDhh?=
 =?utf-8?B?K1BSZ3V6SmVTdHZrdjVVUndpd29mSzZ6a2pVYUx1UHh1L2xHZnd5NUZLNm1Z?=
 =?utf-8?B?Nk1CK1ZwRGllUmVGajNkRjR5czFGUEhiNE1DZG9kK3c4dDdVSndXbHRURG12?=
 =?utf-8?B?RkJINng0U05sc2Z4L0U0aXhlclhta0FXWElXaVhINTc2bWdwbGVwU1JSYkxv?=
 =?utf-8?B?NHhDbzBDeVV6YnVoanBMNG13RDRaS2psS3NNNHlzbXgzRjVSL01qRU1sSGVK?=
 =?utf-8?B?RForTmxzU2V1ZHNVR1o3bElvQ2poZmQwdnJPajFUN0ppaEFzTzZjQURCRWtj?=
 =?utf-8?B?dXRCYnQ1OFp6MHBRSjAveGkwM3lUSlBFZ1dkT2NodEpyalBGWitSL0FuTTBC?=
 =?utf-8?B?aTBXRVdIMXY0UXpWMjFxMk5kY2RiZ3BRZnZGYjVjL0d4RzNkN3dGdVBhMFMx?=
 =?utf-8?B?bUdXOGVlYWJTbEFqcHhSY25BcnFaK2xheXQ5eDRocDNFUVhzYVJQbE5xS2lJ?=
 =?utf-8?B?UzVEYk90K2xxbnBVTndxRlE0OGVweFlteEgxRzlrcFB0Q3NPS2lkRUtucWR6?=
 =?utf-8?B?c3BxSjBGZUtyb3ZaV0JuTlFNZVlVTGs5T1J2a3I1OTBvclBIWVZaYXgxZjQx?=
 =?utf-8?B?Q3F1UkRFUkRXYjVYNDg4V0dlZ2V6M25pcVQxMUl5YlRJa0NVaFptYnNQbGxx?=
 =?utf-8?B?dnRFU1RZQzZhVGlDbjFnbnVIR1lkQ1RZMjc3Q0R0N1JTNHRjVjRvZlNYNWdz?=
 =?utf-8?B?TGdwZHZMUU9GaDVIZU5SVWtjRnhPcE9WT2FzRUNxalNSMitkdW84ZFVURnox?=
 =?utf-8?B?alFPY1NvSmFKbkRjaEV0M041UytmWnJ3V3FjMDZicjN0VlZ3aFJoZThveXVN?=
 =?utf-8?B?Z3VJMGF6MnJGYjJkZEtyODMzc3BkRE53UGZEZWVOdjd5TkoxVzBWbWVudW1w?=
 =?utf-8?B?SjVHVExtaFV1MWx4WDE0cXZPbWVyaSt6bVNrbkV3ZGx4YWlkTzR1WnFMOGdR?=
 =?utf-8?B?WU5iUEdtaUhseE54bEFIRGVQMmFmdFhqVVgvSlZ0clRTbHpMa0hVdW5wd1Fx?=
 =?utf-8?B?eTQwYWlEQTJrNVpWNmttYlc3NnJQNHNIY0hPVDlsaCs1YlJGOTNUTWNSQjBh?=
 =?utf-8?B?RzNKdkN2NHhaK0t5UjZZb0oxZDdsU29zR2JDMWZjc2laTWF6Q3BFZGZiQ0Rl?=
 =?utf-8?B?TmROM25IYTFJbzVDYmlrMUZKWkh2QmxqZlJJRnh0T0xvYU9ZRVdoUHFTV2pp?=
 =?utf-8?B?UVkva0Q3K09GZ2dWMjZiK1ZBZ3I3YStsWkNOS1RmS0JKNmdZbTZwVGRHQ3Nk?=
 =?utf-8?B?b1dybTkxaTZVTDMvcEpNNk5ubENkT3BYdVBZZHdQdUdsRmpTd3JpZ20vT2NO?=
 =?utf-8?B?SVQ3dENMelpaeit0K0k1NmlvNU5PQzY4V0FyOHFjSTdKUlB5Ykl2T2VxdnAw?=
 =?utf-8?B?UUpSSFVjQTlmOU9oNzNSVEFHdk1Wdmt0WVNZeXRvcGE1ckdvVDhueXFaZ1Fm?=
 =?utf-8?B?MDdZaXhIcFZwOVVtTlNjT1FwUndlTW0vNEYrYitQdDNOZ0hBLzl3UTNYVWV0?=
 =?utf-8?B?NmtWeDgxb3VXb283RUFxOEJydUVWYkFoekZaWkJGN1BDSXBCNHYySTVuOGdl?=
 =?utf-8?B?cnVtcExuR0NPUHYxL2tHSkl2T0tUY04zaW1JVE5ZTTB4OHdLc1dmamRVcUEv?=
 =?utf-8?B?cERkNTNsbkl2SUNnakI4TndZM3JxQ0RRWldQSjhLVnIwaHk2d3pZWitjUGlB?=
 =?utf-8?B?WGVicEptU0cyalNkMUFxWDgxa21RTURSeEwrazBWOWFMRHc1OXlsS2ZXU3Vy?=
 =?utf-8?Q?gPARVuubax//oOXw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f14402-267e-4e03-6234-08df31da8190
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2026 14:24:25.8158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHzzg4H7YABFApDp+DvVLpWYFQOz3sw7gDqdYiUz5p1/GriWhGdq8tWNSC8/pdBvuvtcIpuUWzIFSBD6MMAFzuS7CmIqWlFAtCOEmXZdlcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB998646
X-purgate-ID: tlsNG-c1860d/1792851871-CF15E87B-38CFF08C/0/0
X-purgate-type: clean
X-purgate-size: 5662
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ryo,

Thanks for including a function tracer to try with the new interface.
I'd like to help check the buffer handling, with LLM assistance as I'm
still getting familiar with this area. I may have missed a guarantee
around stopping recording; could you help me check the following?

> --- /dev/null
> +++ b/xen/common/function_trace.c
> @@ -0,0 +1,274 @@
> +    if ( this_cpu(function_trace_recursing) )
> +        return;
> +
> +    this_cpu(function_trace_recursing) = true;
> +
> +    buf = &this_cpu(function_trace_buffer);
> +    rec = &buf->records[buf->head];
> [...]
> +    buf->head = (buf->head + 1) % FUNCTION_TRACE_BUFSIZE;
> +    buf->written++;
> +
> +    this_cpu(function_trace_recursing) = false;

What ensures that a callback which has already passed the dispatcher's
tracing_on check has finished before another CPU reads or clears its
buffer? The tracer registration does not appear to provide a stop hook:

> --- /dev/null
> +++ b/xen/common/function_trace.c
> @@ -0,0 +1,274 @@
> +static struct tracer function_tracer = {
> +    .name = "function",
> +    .init = function_tracer_init,
> +    .reset = function_tracer_reset,
> +    .clear_trace = function_tracer_clear,
> +    .get_trace_size = function_tracer_get_trace_size,
> +    .print_trace = function_tracer_print_trace,
> +};

For reference, tracing_set_on() in xen/common/hypfs_trace.c, introduced
by the preceding patch, disables recording with:

>         if ( tracer->stop )
>             rc = tracer->stop(&global_trace);
>     }
>
>     if ( !rc )
>         global_trace.tracing_on = on;

Could an already admitted callback still hold a record slot when this
clear resets its CPU's counters?

> --- /dev/null
> +++ b/xen/common/function_trace.c
> @@ -0,0 +1,274 @@
> +static int cf_check function_tracer_clear(struct trace_context *tr)
> +{
> +    struct function_trace_cpu_buffer *buf;
> +    unsigned int cpu;
> +
> +    for_each_online_cpu ( cpu )
> +    {
> +        buf = &per_cpu(function_trace_buffer, cpu);
> +        buf->head = 0;
> +        buf->written = 0;
> +    }

If that callback then finishes writing its old slot and updates head
and written, could the reset counters describe a different slot from
the one just filled? Could the print path likewise observe a partially
written record? The per-CPU recursion flag seems useful for nesting,
but wouldn't it leave these remote accesses unsynchronized?

Would a stop-and-drain protocol shared with callback removal let read,
clear, and reset operate only once the buffers are stable?

There also seems to be a size-check consequence of a late writer:

> --- /dev/null
> +++ b/xen/common/function_trace.c
> @@ -0,0 +1,274 @@
> +    for_each_online_cpu ( cpu )
> +    {
> +        buf = &per_cpu(function_trace_buffer, cpu);
> +        count = min(buf->written, (uint64_t)FUNCTION_TRACE_BUFSIZE);
> +        size += count * FUNCTION_TRACE_RECORD_TEXT_SIZE;
> +    }

The existing hypfs_read() in xen/common/hypfs.c calculates the size and
checks the guest-provided length before calling the reader:

>     unsigned int size = entry->funcs->getsize(entry);
> [...]
>     ret = -ENOBUFS;
>     if ( ulen < size + sizeof(e) )
>         goto out;
>
>     guest_handle_add_offset(uaddr, sizeof(e));
>
>     ret = entry->funcs->read(entry, uaddr);

The trace_read() callback in xen/common/hypfs_trace.c then samples the
tracer size again, allocates that size, and later copies that amount:

>     size = tracer->get_trace_size(&global_trace);
> [...]
>     buf = xzalloc_array(char, size);
> [...]
>     if ( copy_to_guest(uaddr, buf, size) )
>         rc = -EFAULT;

If a final callback increases written between these two size samples,
while the ring is not yet full, could the second size exceed the length
already checked for the request? Would an owned snapshot, or a shared
stable-size protocol, keep the checked length and copy consistent?

Could the snapshot also use a stable CPU set? The sizing, clearing, and
iterator construction each traverse for_each_online_cpu(), and the
iterator retains buffer pointers while producing the output:

xen/common/function_trace.c:
> @@ -0,0 +1,274 @@
> +    for_each_online_cpu ( cpu )
> +    {
> +        const struct function_trace_cpu_buffer *cbuf = &per_cpu(function_trace_buffer, cpu);
> +        struct buffer_iterator *iter = &iters[nr_iters++];
> +
> +        iter->buffer = cbuf;
> +        iter->count = min(cbuf->written, (uint64_t)FUNCTION_TRACE_BUFSIZE);
> +        iter->start = cbuf->written >= FUNCTION_TRACE_BUFSIZE ? cbuf->head : 0;

For reference, get_cpu_maps() in xen/common/cpu.c uses the CPU-hotplug
lock rather than the HypFS lock:

> bool get_cpu_maps(void)
> {
>     return read_trylock(&cpu_add_remove_lock);
> }

Would it make sense to pin the relevant CPU set while taking a snapshot,
and use that same snapshot for sizing and rendering? What should happen
to records on a parked offline CPU? Could clearing only online buffers
allow its old records to reappear when that CPU comes online again?

It looks like there is a design question of the stop-and-snapshot contract
to drain callbacks safely in their permitted contexts and preserve
one snapshot across HypFS's size check and copy. Locking each traversal
separately would still leave the gap between the two size samples.

Thanks for checking these interactions. Is there an existing mechanism
that already keeps the buffers and CPU set stable across these steps?

cu, Bernhard

-- 
Bernhard Kaindl <bernhard.kaindl@citrix.com>

