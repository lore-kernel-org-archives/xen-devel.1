Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B136C606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=jQTRO415
Received: from list by lists.xenproject.org with outflank-mailman.1469810.1678567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOEj2-0001hy-PG; Tue, 03 Nov 2026 13:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469810.1678567; Tue, 03 Nov 2026 13:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOEj2-0001hr-MP; Tue, 03 Nov 2026 13:38:56 +0000
Received: by outflank-mailman (input) for mailman id 1469810;
 Tue, 03 Nov 2026 13:38:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOEj0-0001hX-Qh
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 13:38:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOEiz-00ERX3-6i
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:38:53 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae9e3e3-8faa-0a2a0a5109dd-0a2a4505bfe4-44
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 14:38:53 +0100
Received: from [40.107.130.106]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae9e3ec-4cb1-0a2a45050019-286b826a8c8a-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 14:38:52 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS2PR03MB9694.eurprd03.prod.outlook.com (2603:10a6:20b:60e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 13:38:49 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 13:38:49 +0000
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
 b=gK/Fn5tWohoFOGRhsrGd1IXfE2T3K86i5RhBcjhyHH2awlsdXPgx890Kf9gVDhiuVizG11+M4dswrEwOd0EDSMAoxCbR8lD1Q5QqZzkxwUH5Zf4w/fzh54C1YrwEQxrx0g3Inr7Scj2QQomfr6aa5C8Q0f7OsH91ckab7d5n7gHXMFs+PpnSkquHt2lGuqTDR86kxyuDKJSrgKKZpIyztCDc/1lQ+UDxN+IH/sz0nieMx+nLoqpzSVG1AgC8E7RaBWkQf6WFAusakIn1cBiNn+Q9PFWKZOET8AdG9iT7z+DO/neieK3YTuXCEw1px8+e+o9/cd8KGj7/Tfg8mQXhmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQq92vVJ28VanfC/T4dasbuK9cCJxgm/p2+rz9H2dxY=;
 b=Io6ZZDqsWEIsQwuRwKFWhl0o3W15XNnEB4SOuBOiU4gK2KKVCEtR9P9Q6MhDSzuQcSNLP4e8Q7Pi91TQ0PIqew+wZunone1PvInUsa23jc8NnlVp/HBsKeE9u0TIehMVYxElm8oB06BbHYfbvlE3CtvcCFGmXsWs23QVwkySD5/fztvIglkE/B+y8V39VXIdJng5QsX3kvW35hXMf9IA51RDz36ipR+3fncx65DIYIcXpZbdLdgJ4m4OqBQ6L+Csi9JGf3lXMSis32d13b91L1y+gylSlA7iWQkTaMyw7nS/3DzzbVw3AQ2atfMjiwjdcLVuXM2a+BlB8muUhXHwCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQq92vVJ28VanfC/T4dasbuK9cCJxgm/p2+rz9H2dxY=;
 b=jQTRO415uiXihQc7eJY/bOSliikc6649p1QSFbcEixQKoBP88y0Pm+elmLjFCmEZMEUjkrNjV9pPh3IyuQDToCRieSzygeYfQpyE4ib4C1h/bxJVvO7uYY5/1soXh50MWIEWzYUm/9kfOEqcla1KuSOM7/NR31j/9uaIfST+TMYuW56fOC4mEaEWc11niWPo/LtIA8Ioth+wPTXaALt7F1SNwAC7NH7Y4y2M2k2nMOH9Ro0KgnYAfYo6gJ1v3YQ7/6qv4KMOWsTFFlv+GIbtz2Zo1o3s/yQQGE5OxjiwjGO9JK70ZpWvTDa4g4k3T75ucT2EjY0oiVZ/dLgckWi3XQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <f6ca6a64-32db-48ba-9825-71acd41e4539@epam.com>
Date: Tue, 3 Nov 2026 15:38:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: make memchr_inv() compliant with Misra rule 11.8
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <a0974d95-28ae-4205-b8b7-1c49cea2d784@suse.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <a0974d95-28ae-4205-b8b7-1c49cea2d784@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0001.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::14) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|AS2PR03MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0b2862-5bc4-41f6-3ff5-08df39afca43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|22082099003|3023799007|261102123227099003|18002099003|261021133027099003|261021135927099003|261026130827099003|261026121527099003|11063799006|261022115727099003|261022113327099003|261022105027099003|261026140227099003|261009223027099003|261022075727099003|261028144727099003|261021130227099003|56012099006|261021121427099003|261026135527099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	Po0H365+0wX/Y4/fQn8GpdeldfCzJU2lYvDKyln6/OQcB1hQMgo41mZMl8IQT8IHjvyWfVOhr0j7yl82B1Sw3ZYqNYFJXNU1Mx2V1I1cztPp5XQRdYTzVFzMI3ks0eY7GHaQmCpwiJbZS88bCg+PwP2zujflTJWnmLq4eQtuRd9cLu4xd6Puzn4fO+xC3ho9lOg5EFrtgCOrunXh0T+CphZjgoEXcUmvVdobUG3edOWcPBGtVSNUu90evi+vk90MLFx9m6Mqy4+xr97eGLjX/99JDn7xLYNLwI7PjZIRlR+Ozwrq4nHBHt21IXXh2yD8qXFSnpSthqSWgkUST4IkBqQrH2mbpemBDlrxSbTs/BXOv5pwjzM163voCtjUt9F1A+CLs+OgO06VssVYbluRn9WpeijKrfgIG+aCrD5aA/9JZgC3pSFSH1e8l4/TJzsJtJ4OVEJ97wqTjOCcudKWjnJG5j2nPuMuEuw8wcu9b+5U3iyHWHRmlqXn2/kkUXqkVn82I8gqsCklsXYGREVtFkmc4uyNIu34j5i/ON+G/jsU9ixpUWC7remTv38GQysW2FfAe5hXPJbzLho1SQxCNT3kIeAMoL4leQq7QaWF8dA7A1dAeV14d/JWrpArfD+IBPvrcSEQsMfWxYBBTASJxcbfEl6GyHM/V3oAIkSO5VQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(3023799007)(261102123227099003)(18002099003)(261021133027099003)(261021135927099003)(261026130827099003)(261026121527099003)(11063799006)(261022115727099003)(261022113327099003)(261022105027099003)(261026140227099003)(261009223027099003)(261022075727099003)(261028144727099003)(261021130227099003)(56012099006)(261021121427099003)(261026135527099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlVKYUZIbmxFSjZoUnFDOXBTcEpITXZBVjNhUEIxcmxyMHhKajFLYmFuWUxF?=
 =?utf-8?B?M2hHSkVabWsxSWRiblNYd2ltUWduZ0FmRVhuQ3FCT0RwQis3VnVJbUNmK3ZN?=
 =?utf-8?B?WEtwK2RVTEVLcjU2N1ZYSVlvdU9nc1pWMUVHb0lrR2FHSmE4emFkSVN1MG40?=
 =?utf-8?B?a2cvZFQxZVNxZlNqa0Z3aWVDOEQ0Yi9kdjJUL2F5OFV0WkRyWXphMENCUDFu?=
 =?utf-8?B?VTdiZGF1RGpVb3pLNm50T0lQaW9lZVZ3MFU2MzJXbStab255OXRoSzdEcS9I?=
 =?utf-8?B?OXRtYjZRU3FRRXBLWmhOMGhYQ0o0SThMbVluLzE0OE1PM2xtMTh5cmd2Q29x?=
 =?utf-8?B?bnhERXVPbXhnWko0RUFYMVBwRENlMEI4NU9wdTd2c0FGZGxsUHBXdmtoMUZT?=
 =?utf-8?B?UFVxbFI4cDA2YjlteHlDYWloYW5YUGNCQjJPNy84WFBpMFVub3hPOGxHZjhr?=
 =?utf-8?B?TUxwZnpmeHZFWXY4MS9maEJsVGhTb3c4R2IvdEJhQjhEcnhFQW8xdWdRRy9J?=
 =?utf-8?B?cERyeUpFelRXS1UvU203U1FxeVNJZTIvbklKTFhoWmFOSTlQM3VUK2N6UWZs?=
 =?utf-8?B?YXVRNFdidDVvWVdFSEZHU1JNV0o1SGVhbHR1REg4SEY3L095TDRPckJldXo0?=
 =?utf-8?B?N3B1b2tEVU1qTTVFSmJpd0xPZmFTekc1YkdFU0pVQ0JQa1UreWY2U25uaFk1?=
 =?utf-8?B?UGdlQVJhWTFtcHBLa2tBdGJrWE4zL21xTldSUVdGMThWQlBPQjFwSnNBL2J2?=
 =?utf-8?B?N0lTaW1rMHRhNW9ZZ28xOXJwM25ub3JWeEJWY3dtTDNKdmxONE1FRWlGRlda?=
 =?utf-8?B?NmpCSGpGZ2xraUpMeHZMNHEwVHl5ZFk0N3E3VDl2NThnTGhSTURWS3AyOHB0?=
 =?utf-8?B?ek5yM21hcEJDS3FxTXpLYlpLOTZ4RUlBRXdsR2kvdkZFRnZ4K1NWYXhOMkVB?=
 =?utf-8?B?ZklYRUpTSVZEWFJRcDZLeUFNckZrRUNDbVY1aVVsTHpnd2V3Zm5TV3N2a0Zp?=
 =?utf-8?B?Y0MyWjlVZG45ZHpJa0VoMFJVWmd5STVYUG5GYmRDbUlnU2I2Ni9sbU5pVGlG?=
 =?utf-8?B?YUNUUlA1YVRDWUVOcFE1RS8xWnlBWGdLKzdneXNBekw5Zkg1YWN6amhneEhX?=
 =?utf-8?B?NmhUMUNnUExnWUw3MmxIY3k5WkRVb0hiNHdRNXZjcmFublV2REtKNnR4QWNn?=
 =?utf-8?B?OEVyN21IeEF1cGtXWVBzc3djUnM2dVFVMzllUERIN29Oc2h4V0x3Y3Q2N1FO?=
 =?utf-8?B?NTB3QlhDbmdHQm8yeVVCM2pFVUF5Q3VBcmRrRncwbnU3b3NRTlc0a3pWaGxw?=
 =?utf-8?B?clV1MDhaWDhoQUg5V2NRVjhDU01saGZldkdzT2YwOFkvOVFnTDN4K3ExMmo4?=
 =?utf-8?B?YUtnYUJkVTdCaVh5cUoyUStsdktZMENaUWVPaVlpdHdxVWVxSTZ5dXQwREZm?=
 =?utf-8?B?TjNGRTRxRS9FZjJDZllwMEhzTjRvV2JmNEJuUXRKN0hzbm9iVkRJYkFlMWpw?=
 =?utf-8?B?d3l2dUxsb3UvMGs5aFI3Wmo5T1Vka2x2cHhEV3FVUlN5ZllJN2FMQitzd1Jh?=
 =?utf-8?B?aElIckVGRDFWSjFDQmM0ZVBCR1BGbEdyVFNjTUovWjFFU285UURXT3YzRHRR?=
 =?utf-8?B?eU1FeDFnMi9mRVo2SmtST2lwU3B3SjVYUTZiK3A0QjVMN3JDQUlyUlJZZUdD?=
 =?utf-8?B?OFRxVVZHK09VRURFZVIxaFp6cE5ndzNMTzRYUkdSaFZaNmtvRVR5MHh4V1JT?=
 =?utf-8?B?b01qbG9WMGxGbERWWjB1QnlUWDdYd3V4TVRwaVkrNW1paFRFbWQ3am5ReUR1?=
 =?utf-8?B?Q2p1Nk16NzZGVzMwblg1S2ZHdFFreEVIRVhQWE4xNlJPcmJqcmRJSGZIWDIv?=
 =?utf-8?B?KzBRbk1DakFrbWZVUjY3SUF4eSt5d0RUM013RlRXL0tmamZHSzhvSjFTT255?=
 =?utf-8?B?UEM4TzBCUHFPTUJBM3JNSmNOdzE3eFlMb2Q0b2FjM2ZETUhqZklmMGNYckc1?=
 =?utf-8?B?RFkwem5rVzFvRDIzNC9uS3BDdURQTDZneHRGc0hPTXZtK2lXWkQ2YXRKQzlL?=
 =?utf-8?B?TFp2eG1Rdk93bGs2cXllUVJIRmFaNW84cHBsSysvQjc5WU9MdWwyL2R1S3Qr?=
 =?utf-8?B?b3pacGh2S0tTejJrVG1MR2ZRMlJQZjVBZ2U2eFU1alcwSXdhQWRCZXdJOW5L?=
 =?utf-8?B?ajV3NlFSKzNSaHovKys1Rjc5Z3psVi85cE1LS25ya0sxVTcrRmxnZGZpbnh2?=
 =?utf-8?B?Y0dFWnp4b01pb0s1YnliSC8wSXV5YVcvVGg5VGNENUN2T0tNakd3U3o0L3ZJ?=
 =?utf-8?B?OGVVM1J6MnR5TmtjbjZaUklwZUF4RjRMeDc5akhRWkJRZ2J6OVkvK1RUbGU3?=
 =?utf-8?Q?E+cet5aD9WYEf/ek=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0b2862-5bc4-41f6-3ff5-08df39afca43
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 13:38:49.0094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njuxunLZlnXrjyzJSveSk7pkkzGPsIfahGdHuG6R/WZqJEPG3RvLy3ZBGZzFsQSaqJA7RZ2TJj4sL50fT4srvIBRgXILuKAGavdd8xck4zA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9694
X-purgate-ID: tlsNG-c201ff/1793713133-F7CB82A1-FE6D069B/10/78276251493
X-purgate-type: spam
X-purgate-size: 1297
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/3/26 13:24, Jan Beulich wrote:
> Neither the sole present caller nor the two ones pending (in the AMX/ACE
> series on x86) require the casting away of constness.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/xen/string.h
> +++ b/xen/include/xen/string.h
> @@ -33,7 +33,7 @@ void *memcpy(void *dest, const void *src
>   void *memmove(void *dest, const void *src, size_t n);
>   int memcmp(const void *cs, const void *ct, size_t count);
>   void *memchr(const void *s, int c, size_t n);
> -void *memchr_inv(const void *s, int c, size_t n);
> +const void *memchr_inv(const void *s, int c, size_t n);
>   
>   #include <asm/string.h>
>   
> --- a/xen/lib/memchr_inv.c
> +++ b/xen/lib/memchr_inv.c
> @@ -13,13 +13,13 @@
>    * returns the address of the first occurrence of a character other than @c,
>    * or %NULL if the whole buffer contains just @c.
>    */
> -void *memchr_inv(const void *s, int c, size_t n)
> +const void *memchr_inv(const void *s, int c, size_t n)
>   {
>   	const unsigned char *p = s;
>   
>   	while (n--)
>   		if ((unsigned char)c != *p++)
> -			return (void *)(p - 1);
> +			return p - 1;
>   
>   	return NULL;
>   }

Reviewed-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

BR, Dmytro.

