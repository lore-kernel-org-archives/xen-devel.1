Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF99606A31D
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=OVX5GkFN
Received: from list by lists.xenproject.org with outflank-mailman.1457982.1670445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJrBw-0002xh-Us; Thu, 22 Oct 2026 11:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457982.1670445; Thu, 22 Oct 2026 11:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJrBw-0002xa-RU; Thu, 22 Oct 2026 11:42:40 +0000
Received: by outflank-mailman (input) for mailman id 1457982;
 Thu, 22 Oct 2026 11:42:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xJrBu-0002xQ-II
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 11:42:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJrBt-006lED-TV
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 13:42:37 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad9f69a-e002-0a2a0a5209dd-0a2a4504c87c-28
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 13:42:37 +0200
Received: from [40.107.200.53]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad9f6ac-b57f-0a2a45040019-286bc835f527-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 13:42:37 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN6PR03MB7767.namprd03.prod.outlook.com (2603:10b6:208:4f1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 11:42:34 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 11:42:32 +0000
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
 b=bYK2qnLgutMICcET0AdN+dfbe7n4YC3DYFCNXSwv7vqtkdZwFm+ATC7CPkSZkrL74Tpb9okEf5YN+gHdsyq0VGU5pG5mPCh5hcU1eNJFj7TqvjoqinySosr+lWqOFjOVlsG/aeEwOjaJhLgzySiSO9VNldkyzw9Zx8ogGyU+GeoTpb9AuTlddaS90QcAtqQOa0WWLiE8njrTQVMsLfEgFtxJTkUzzVKtozgRgVLTTzeV308sMfypH6LFRe4bNBwUYqstJyJcAjY+6MLrPhkv9uxqtgfNZ8sPmFXRyDR+u3QyQ09emqtEEa5ZjKmdvdZci7pJKAymjGGIgwytAkK22Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQ4ubFdDDVMv1BMRy0WHcKrpEBnB6KRN8+MWDZ4fS3A=;
 b=LeEq65skJC+2RWsm/qARZJbR2xlbx/eJ7Lix2prZ3deg6coUraD9epPJM3wfI79D98OHyxokg2tS1D4UN7tLi1om1vS5LcvmHg7uBZe7QPx0uV46EmrbI1I3RsF7+wf5aty3ZgbFgXNr0FgVUD33hS0lYJ2JFebE7CScPVbF/BtD/lhSrFWwpluq8GvK7jCSmJ741J+yS2SaoYxq/jTt5WsrMQntKxUq3sp916FehSawxERoiRjmE3HEmThA1fbMIAWJJ19d8VgWM/r+yNpZp4oq/gUkPAhBFqpRSevhuNHamb459pzT9RUiBR2oCE9ieif2zBnhGyQTO2V+vLrTqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQ4ubFdDDVMv1BMRy0WHcKrpEBnB6KRN8+MWDZ4fS3A=;
 b=OVX5GkFNfUyvSU7mNt4lSS7yl85mCkoEpy8fSuQOqFagS43numz9r0DyhLWYDQbU16jxwe3A1BDYs/uMVNWA9iuoWXxtyNDY13tzUbC4GRPH32L0ynt9lKgXQ5frg40KvnpdbSkz1KQe7tYJV9Pawzg8taQu8arX3zoIdkAKCi4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fd6d8836-397c-440e-bae0-84d63c62fe5c@citrix.com>
Date: Thu, 22 Oct 2026 12:42:29 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v2 1/1] tools/ocaml: implement stub_xc_domain_create() for
 ARM
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <1792658248.8631fc262581453bbf619ec5b2062170.1a162c2110b000f79f@vates.tech>
 <1792658412.8631fc262581453bbf619ec5b2062170.1a162c493a1000f79f@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1792658412.8631fc262581453bbf619ec5b2062170.1a162c493a1000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0511.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN6PR03MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1fad39-7e04-4eef-fa60-08df30318f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261009223027099003|10067099003|261021121427099003|6133799003|56012099006|22082099003|18002099003|3023799007|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ZHVXI4ee3xzOr53ehBO5luNcvn0bJmjIyCjnXeH4lpogreTliZOWbGX/bgw40bkQVWY4y5MpI/yDiqjOf3nmvjuI1NUaJCssq53b4/+Y3eyj6H5vSQP2TfVaN+o8Dsqbv3LdiAVFULfvpp+WxQoBjOIDYZM8RDncT4RaFKb+Buf9tIS6gBAF/f6IYy1I+iXmYv4lnwf2IqFzDTILWjeo9hFZ2M74YrOXWp9KPf0JG6rKafZyIBbnewfK5NRvrahTHQfqW7pVAIUmDSYQtiVsLF8BfCZezOkerwCaic9eWFWKKZC4CNDRcwAPgdTsdDVnT/enJ0znWoTov3pMNKDaWAJqvv7sORK9YQmtu5m4nuVWEtq4brKkbhY1BuIjcCSTpEQvW4zQnD0TWV94GFB3Z2UnF/a7jbePOI+vQYYJoVmdWxsYr7FBSZggGg0irp2/UEfexjWcDOLcqvwP3qSyAgjqyyrxEVufS1ERNVBJUoC7VO8Zh3uXgcxr+veRKU6ShW4Xo7QBl/1uLSMqznOSQruS+nulKr7I83qlRzR/w7ba6orR/l8yWHiHgXTR+YVaoYo/eOxSf9TGi/ZXaeQyhVHvDglmXssS0ntgJF1Vq/kf3xZfsX7fVkXk39umx6LqLps3iBKJPEylpTebdg4eph7jq5ABNnShq2SZRCzucGo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261009223027099003)(10067099003)(261021121427099003)(6133799003)(56012099006)(22082099003)(18002099003)(3023799007)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RERsVmNTL1EvVUgwRkZ0UmozczVoWEZxK2JRdTZGTDFvZXZVM1NKbWxmci90?=
 =?utf-8?B?aXBFM2FENHltNmRFMjlLVlFERncrNmJJWjBCODRDRnE2b1Fqdkk4R1dXUzFQ?=
 =?utf-8?B?dlVrcWwxR1FmeVBXUitHUWh6QkE1VE9RcmFOSlhmQWdVNWxnK2tDRldrNFBM?=
 =?utf-8?B?S0dPOWNtOFdSV1VIYzI1dEkzbXdIa3BTTXBRWVFUU0JXU0xwYmFEUVJPbjFC?=
 =?utf-8?B?ZGpnclphSlZYRGNKTjhaR2xmcm55czArYjVGNTloYllhWDlxK3NiZXpNWEFP?=
 =?utf-8?B?TjlZRkZGSnBPaThRSk1DbEc4MlVoZXppRXZJNXBxTHQwb2tFQ2hqY25QS3Fl?=
 =?utf-8?B?ME5ja3JyaGxqSFNyU3NwS1IzSENzbm82a3lUWDJIVnBqNlF5TG5WbnNEaEVJ?=
 =?utf-8?B?ZFBWcTNTT3ZzemQ0QU43QlRKaW1EWmY5RURzSUVMMnRKOWFQUXVNSFIvTGJr?=
 =?utf-8?B?TVcvdFB4d0VRZ24vbWt1OHc4MkgzU04wYzZhQW4vcTZvYW1RZEsvc0xOcWhi?=
 =?utf-8?B?bzFyU1NRN3c3R0FObE9pbHRGa25XOUh5RTU3ZlQweWswNnBzZFFSeDhVcHE5?=
 =?utf-8?B?cnhxUllab0lLSmVmUWhGWU1KVWJ0ZlVFYlFUQ2VRTy9kNlp3d0NZcG5GNFlC?=
 =?utf-8?B?RDJBRnRieGNXVHIyVDVvSGw1aXhwZFhSN0w4VFcvWUFzem43V2RtOVUyYnFt?=
 =?utf-8?B?a1lDVHkwQzNDa0xKQ1I0aTdsWEhORitBQ1FEZThUdnQxOVBLeXZkQVdORk55?=
 =?utf-8?B?QU9rYVhJN2tsejBWYndkbHliQkpIaG9zY0hremdlK1h6WXd1N1diakdVRFNx?=
 =?utf-8?B?VUdhMDZjeFJvVWs0bE4wSFl0Ly94dnBtRUVid2xUeDhHMnEwbU9zSmYrSGxl?=
 =?utf-8?B?UUFpbm1PZXUxbTEyKzJYQUhnYmtjZWIvTEJJdmR5aExwVnVEbDJVV01ta1Fr?=
 =?utf-8?B?U2l0ZHliYllRakdsMDlEemVmdHBVSFBwUVlKOWV2MGhZWFJsRlVDNTdsRm4r?=
 =?utf-8?B?V2lnV1lNUU52dXhCSGFaM1QvZVlXdklMN1k2M3VMdW1mNWNPeFV5bndUck1Z?=
 =?utf-8?B?ZnFxTkI3eGRoVTVtZGJWUjJPSHBmMmtud1U3R1RLcHI1eXBvWXI0TFNPeDlz?=
 =?utf-8?B?MFFPemVsNGxrbEhyZUYxSnBuZU9DMHVpbDZYNXFPVFk1YktFQWFha0xkRTlE?=
 =?utf-8?B?Q3BSM1N2RXo0VDVlZnFIYXJ6N2tEcDFMNlZsUnZ1YVlGcnRtOHRRSGk2cEla?=
 =?utf-8?B?VW5xV2dmS0dRcjZBMC9vMXJLWXJiVzYrZVdLLzlLdW1KWmg0Um5ob0R1WlRm?=
 =?utf-8?B?dUNqOUZmUlI0LzlYSFhBdHExMDRjYm1tcVdQYnpabnJIVjZRYUEzMmJ6SGgz?=
 =?utf-8?B?Ri9nQVpEV2xiVDJ6TStqK1FIL2xxVlVvbFlzKzFwb1VFZzUrNEFqNmVoNFMr?=
 =?utf-8?B?Wm5iZXFuUEZoWnpsYVQycjZDbE5kbG03ZXlIclZLdmFIcDZCWHNwVThTaUJn?=
 =?utf-8?B?TzA5NnlqQnB6SXU0clp1c0IrWWRTWGdMUTVPN2tSNG5VcXZFMlVFZEJPYk83?=
 =?utf-8?B?cmw5NmNuTWt1SE1ucmlNaDg5QnJhaEM2QTcyRkR5RmhQVlFmY21vbUNTbzRn?=
 =?utf-8?B?aWN3RTJob1VTaXovNEJ0Qm03L29TeUprTy8yTHNmbU4vZ2ZsNlVvSnZIaWFH?=
 =?utf-8?B?N1YvdGUyOXZNTlJpb1NNd0Zodi85RDVYSzErYm1iVGIzODVUa1I4RUNJQ0JD?=
 =?utf-8?B?Rkd2WmdIRjVtVlVuLzNxNU9Va0pNaGkzUkJjS2l0Uy82a0NScHdZK2ttc2pK?=
 =?utf-8?B?bW8xVHNnR2pCVzNZWTZpKzJHQWUrMjNBN1I4Sk5hNUtaN04vWVloZ2pwbGtX?=
 =?utf-8?B?TWNWc3pTZEVXcU1QZVhWYm1wMGRidTM0NlAySmVZOE5hNFpDMjl5WG9qWWFy?=
 =?utf-8?B?eFdnUTR1dVlLdm5uRVdmdXVTYkVUNUkzU2hmZXJseFZZY2p0aVZVdFhUS1VP?=
 =?utf-8?B?d2dvUHBHSkxPYnJTM0tlL3hzaUdCam9ES0tBWVpoM2FvNnlRUlJhVXIyWDNT?=
 =?utf-8?B?V0l1aTRFdTNTcDZUN2RmQ3FUN0o2OHVkMDhyTHc3eVFGTDJTeTQ4VkoxTGZM?=
 =?utf-8?B?ZjNrK3c0aVBPa2hBN3c0NXE0RzA2SWZCeHgvSmZXQkQ1UUM5dWY2dmhQaEtM?=
 =?utf-8?B?dVFEcUJaWks3c0IwUGlSbFllM0dOVkJtZW9ZUzIzengzS212N0p1OW90a1Fl?=
 =?utf-8?B?YTZlRHB6SDV4NVlLK3RiQ2xGZExPTnN1SjdQZ0o3bFhMU0FjREkyVWh1UWkw?=
 =?utf-8?B?alRXNENaelVQOUptVjVQTk5lVXZLZXl1d1gzUFJCa085M3B2VkhJZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1fad39-7e04-4eef-fa60-08df30318f50
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 11:42:32.7983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r30U+JyAZAMKIlqzVDWWbgQFz0Lnpt+pHoLz2WmNMqZFT1CuMzV8us01XjroD+XqnKh4C6zlf2TJTcFc3xER7jE+1WD8pGkOCsZF2yuCVxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7767
X-purgate-ID: tlsNG-ebf023/1792669357-50EDEB50-454FE0D1/0/0
X-purgate-type: clean
X-purgate-size: 963
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22/10/2026 9:40 am, Julian Vetter wrote:
> From: Andrii Sultanov <andriy.sultanov@vates.tech>
>
> stub_xc_domain_create() fails unconditionally with "Unhandled: ARM" for
> the ARM variant of arch_domainconfig, so no OCaml toolstack (e.g.
> xenopsd) can create an ARM domain.
>
> To fix this, convert the two fields of xen_arm_arch_domainconfig,
> gic_version and nr_spis, into the corresponding fields of struct
> xen_arch_domainconfig and reject values that do not fit, as is already
> done for other parameters. The remaining fields (sve_vl, tee_type,
> arm_sci_type and v8r_el1_msa) aren't exposed to OCaml yet, so they stay
> zero.
>
> Also add a BUILD_BUG_ON() on the size of the createdomain struct, just
> like the x86 case, to catch future ABI changes.
>
> Signed-off-by: Andrii Sultanov <andriy.sultanov@vates.tech>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

