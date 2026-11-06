Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D99606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 09:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GkcgkT+g
Received: from list by lists.xenproject.org with outflank-mailman.1476388.1682514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPG51-0004f0-JY; Fri, 06 Nov 2026 09:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476388.1682514; Fri, 06 Nov 2026 09:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPG51-0004et-Gn; Fri, 06 Nov 2026 09:17:51 +0000
Received: by outflank-mailman (input) for mailman id 1476388;
 Fri, 06 Nov 2026 09:17:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Roger.Pau@amd.com>) id 1xPG4z-0004en-FZ
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 09:17:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPG4y-00DFr6-IL
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 10:17:48 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Roger.Pau@amd.com>)
 id 6aed9b38-e002-0a2a0a5209dd-0a2a4506dcaa-18
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 10:17:47 +0100
Received: from [40.107.208.8]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Roger.Pau@amd.com>)
 id 6aed9b39-195a-0a2a45060019-286bd00848d4-4
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 10:17:47 +0100
Received: from SAWPR12MB999315.namprd12.prod.outlook.com
 (2603:10b6:806:560::13) by FT1PR12MB183566.namprd12.prod.outlook.com
 (2603:10b6:170:2b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 09:17:44 +0000
Received: from SAWPR12MB999315.namprd12.prod.outlook.com
 ([fe80::5382:815f:5b37:73b9]) by SAWPR12MB999315.namprd12.prod.outlook.com
 ([fe80::5382:815f:5b37:73b9%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 09:17:44 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NN8z/RXW6wPsu+otmAWxVjlC/ft+kuG8RBq3GDxeaw9Vhg1i3C8ikMLhVSoh1BAiq5NMB6HLNqLiX/EO7nEpE8NhCpIpcpLGnEqhCvw6v9xc3kuPtiLI//US67T4jJCP9/GqBbuUmQwf77WGvR+TKJjA3Uu1I8mLIO2DvswguGyLIPbWP+EMF8EMXO+BoD9BtYU2CwOItz5cGgKuJTUT0V9xkmr4XoPXrCGiaIJAXzkGN82puso7H2oVp8pSuPO+3C+QNBzfSctMznflpu8rkoNySsrAuKELvFytLneKDtzsvASdIFndWV/Pp4w/bR/CPc/JMfxrrCUMG2XL7TWKaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7vr8U9XAP4KsuO2PvdfHTPTfVxbMCpKtocrR+VP+Hk=;
 b=vygOBN1ixwzPQLSYvRJEjp4zuR6Kgq0OQvgZFjzrqZiLWnw5t/u1Hl974hkTVH0gfG74k8eBN7B2rY+vQkLghHO40FYARAKa6koqHZ1UYbhVsSADR6ovaTarPAOsxt4ORPShc+CkO8E7iGzWCD35oyiGRvPTFJ7FwCKrAdZm9jry01SSLHyxVhYbm2Wr9LpSWMl9637Kk+IM8LA4ZO46hUsKWpEEzfy+Khlx16muDpFuk2zbC7vNc5pbowPg3A925YKVmP/NOgISj8vb1z43t0AMqD4Dc5VSWPJRSkGXM1Jya6XJSM8kTq2uTlCjCDUVnIzHvUSm+th7WAI6ST/DHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7vr8U9XAP4KsuO2PvdfHTPTfVxbMCpKtocrR+VP+Hk=;
 b=GkcgkT+gEo1s2wY85FKZ7HVcDG8G+3J4D3M2DDcTWB4anW2g4S9BaOo2KEFCafZOwML217jZmEJuRr8FHnxxW+QsP7RwrV9Za4h48VxvEiRDizxteMYTFvadB63tfKezqNwCCgmDTzy7CZ1tTFxaFaBvOzV1fEbmMpW6NcvxBz0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Fri, 6 Nov 2026 10:17:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@amd.com>
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Penny Zheng <penny.zheng@amd.com>
Subject: Re: [PATCH] libxl: wait for QEMU exit before restarting a domain
Message-ID: <au2bNZiQmElHeEhu@Mac.lan>
References: <20261104064645.1171477-1-Zhao.Jiaqing@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261104064645.1171477-1-Zhao.Jiaqing@amd.com>
X-ClientProxiedBy: ZR0P278CA0118.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::15) To SAWPR12MB999315.namprd12.prod.outlook.com
 (2603:10b6:806:560::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SAWPR12MB999315:EE_|FT1PR12MB183566:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e08828d-d132-4bd6-14dc-08df3be6d0a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|6133799003|10067099003|11063799006|261102124527099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	ULf+Pxo6pWGCiyWM3lyQJKXFFJMjbajzrVOT4wEyuRKSrgfNjcmgjbHCsRXucDk8ci6ULmhrd9T01irdUvYkLp32pLuwWsZMv0C8k+LRhZZX5ERs+mD6QinN9qTVVHmJuelcKpxnaXd8Dwy5w8oHvgnUcE9r051pxBQ+l9zCuqhzHqPNyw9WesQeNh9ySljBQDn/tvoT1+J9LjTh8aqMezqRbil9KMbmE2eLkWodksfyWhwDgLmszvhcES4nTh0aYUYzFJbGIwY5qbrapvIcD1kQTzy6kGcnMHiVmEygz2rUl66SvmndzwnsKUonkL6d1WCUhJPa4z6vTQ6019E9eBXDu9pkVfW34NzgBChEO3S8qOPEfW3HPAv56U5OdY2p6wkK15ZYs09UEnC9q5dDPxN2JaDo3TGW7thrTmiKNjnwG93vjxszL2dFORwMF42TdhW4Uh/kapWPqOPIdhmcU1tP/fA6nUU8awSKUmt3+UYjqBdviDv6BwCDBbLY6PPNgTcspcR4zgL0Y2r7c4oM8mWNlugrc9FQVfD2638DBQzhuueyKAdmYuosP0sZYO2kAdFeCgFsSM62ztVb2DPCUyuMJUNauKJF48kKpy48W2p5UkcbOIT3zbWRAAngK+Vnanmz2Zc4trc7aGn79GudQRCmYAJgYNR4Wc6mKd8QGrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SAWPR12MB999315.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(261102124527099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q29WMW5MeXl4YzFwYnk5VzNxYWFjTU5nSnF2am1XRm9YbkhUWlF3Rkh3T2dX?=
 =?utf-8?B?YlJQbGpNVG5qN2hhUitKM1ZBNGs0aEhkalpOQVVWVGZRdDNtcEdQRGJSNkND?=
 =?utf-8?B?OFk1Umt2WXVrU2YydSt3VzJERUIzK0JBcWs3WTcvTitLRURyc3h1WkpCTjhw?=
 =?utf-8?B?MUdRd1hONWxHZHB4Y2F3WWRLSitrV3dTMVlEVXkrVWR0ZlIydXFkNG5LZW16?=
 =?utf-8?B?aXM2eDZQR1ZUcGJQczJEdk5jU25aakV1RXlIMmNXNmYzUjhsWGp5K2dERzBr?=
 =?utf-8?B?aUVxaW92d1dJRkdQd05tWm1iVkpoZ2czME1NR1FWdGJJL29FNU9Bc1YrcWp2?=
 =?utf-8?B?NHpqelhUejl1VTJxbDZTUFdma0xtUDhDOFJLMlJCQ2FycVozN21PY25xQllY?=
 =?utf-8?B?UUJVUGswWFFxQnlmRFJjbjRhZ3hhNm1vWG05bC81ZmVSNlFvSERlZ2tIczVE?=
 =?utf-8?B?K09GVm02ZHdydXVsdXNjUHNscUpmcEdZRnZIVGgwaGNZclFIUVAyNWhuZFlQ?=
 =?utf-8?B?Qm1hc2FBTS9CRG9JS0Q1bFV3S09HOWpNbGpZa3EwcC9KUDdvUG5nVnQxUVpF?=
 =?utf-8?B?aHZlWFZDTXpocjFNcmVXWmZBeUdhOFdCMWd1N2xub2tpVGYwTmVvMWFZUVNu?=
 =?utf-8?B?bldGZlUxR0xieUF5Ym9OSXZwNkxMNWZpTjltQ2JEQmxmQnI2UjliZzI1cS9z?=
 =?utf-8?B?S3FXNFFhUHY0RTgvWXcyY0hhTGdia0RxVWY4Q2N0cVNvRmJOSDJSSnNLTEdu?=
 =?utf-8?B?RWFnTHVnMm5JeUhhUlVDR1Y5dDUrNjBCTTJWSVpraEZCVVdCL1pLMDNqdHZO?=
 =?utf-8?B?L1VrK2toTFY1Z29Ob25jZFJhcEkzcVgrenZxMWp3a0ZoZWdieDI0TTNtRTlR?=
 =?utf-8?B?QThnMVFLUXo5cFNJdWRjeFRHbWJpbWh6b3VZS2FVeU1QK1NVRmN0cU8ra3Nw?=
 =?utf-8?B?a1hzRDNEQ0RvTEpLcDNKNFB6amZUbjliYXpONVNyd0RIYVI5ODN3aS9mY1Nr?=
 =?utf-8?B?ekw4MDcxK0pPT0FwcjQwT09ldGxwbnNVdlRtb0F3aVd3Y3ZqMk1HajNzVlVh?=
 =?utf-8?B?QkhJd1dscUxyU0RVUUg2M0ZLRExlc2RHelQ3WC9wUHJtOGV3ZFZ5eHAzWkRZ?=
 =?utf-8?B?NjZlVnJReWEyTTVBOFVIK0NaS3l3MnhYWDhZeEZsOWg2RGlnZ0tqZGlFSk9v?=
 =?utf-8?B?TUFiZlR5RG43aU1HelBDMFJVQTdHZU8vSUdrdUxQNVk1bXpiWXlrMENwNXRq?=
 =?utf-8?B?eCtKODY2TGZqQ3l5bWU5d0RVT2tOVjZhbnZHREUwNmp6aU9jL0I1WC9OaC9z?=
 =?utf-8?B?WnE2NktidDB1c1Q4d1FYS0Y4elBsOGpmaGxsZXRDMDk0TGM4cUtIWnNFS1hk?=
 =?utf-8?B?MXE5N3d5UW4vRXhmSjlsTzlYSUp5dUhuV1pGQlFHK3B2eHJBR2JjcThPZkto?=
 =?utf-8?B?aWxKU1NqU2JRWUpNRG1aTXg0WHNIYWZIKzE1cE5MLzlSZGt2N2RUV1o2RHFS?=
 =?utf-8?B?SkZaUy9lL3JYcWFaR0tVckE5RUVQTTBCZk5RRytNVU9Pa2NacHdxano4a1Av?=
 =?utf-8?B?N0xnSitEem5GTDA0YkQwQ2QwWFIzekFnbWtUR0lWdWFWU0pjMnhZbVpnNVZG?=
 =?utf-8?B?SDh1NmtyUXpxTDdMYUN5UEsrUXA2L29vT2xnRDBPOUlWM0MvWlp5VGM5cmNO?=
 =?utf-8?B?VTlkaFdheEVYVmtmb0o0WVU2Q2ZvQzBpODdxeUZxU05GcnNLazJVTjd3Ni9m?=
 =?utf-8?B?aGhxQU53djNDV01QVnlJTjEralUreEorVGJ3WmNlcHJJNWNhaUxpa2U3bzI1?=
 =?utf-8?B?WU1vMU5IalM0NTYvUExFQmxEbEZlb3JhbFViU010c2t1Y1dhUEoxSlZQV1Z6?=
 =?utf-8?B?L2lpYU1ncTZZckdrU0dBMjAyL09ySjdNKzhFMEdBeE81RWZaVjhMaTBlQ1Nk?=
 =?utf-8?B?M3lhSUI0bWFPQmsvM2dmMkpZRHBSbEU0NmN0U3lvSC91NE0zbHJFU0trSGN3?=
 =?utf-8?B?NEJYblFQQ2MrM0RhS0ZaQ21sV0pkTVdSeFJIQnNFZlhka0lybkVHaHBXZFRp?=
 =?utf-8?B?VStveWozNzZtNkt5YlIvN3Rqbm1MTkMrNlpObTk1TGw3VHNEQzhnSDJrUkd5?=
 =?utf-8?B?c3VobSt0a3FUdWNlR0s2aVBtS3NvZTlKWkZKMG1vYWordkZJMEVRM2JLMGI1?=
 =?utf-8?B?Y1hXeHJJRzJLRjlhc0RUVVR6QWxCdURIQUFzbjJGSWZIVDZWc1hkSVhaZmNp?=
 =?utf-8?B?d2JGOHA2eTljMHNZVjhaeTlrUnE3WVhBZ2xqKzhkUkh3ajFXazl1cDJVd1hj?=
 =?utf-8?B?TTY5ak5oY0tXVHptQ0JzQXoyWDNqbWVDZHEzUTRWQy82ZDNkSFl0Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e08828d-d132-4bd6-14dc-08df3be6d0a8
X-MS-Exchange-CrossTenant-AuthSource: SAWPR12MB999315.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 09:17:44.0334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGBRRpq0CDhCXYOqW5Gq/tOfVuc8MWqtC+F9wcYEBrRFRZ9YcvhF/AP3g8abudk+AWymLQBQIx5H163no9WbrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR12MB183566
X-purgate-ID: tlsNG-16d1c6/1793956667-F627077B-5AACCF9F/0/0
X-purgate-type: clean
X-purgate-size: 4632
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 02:46:28PM +0800, Jiaqing Zhao wrote:
> The PID-based device model destruction path returns immediately after
> sending SIGHUP, before QEMU has necessarily exited. When an HVM guest
> reboots with VNC enabled, the new QEMU process may fail to bind the VNC
> port because the old process still holds it.
> 
> Wait for QEMU to exit in a child process after singaling it for at most
> 60 seconds. If waiting fails or times out, log the error and retain the
> existing domain destruction behaviour.
> 
> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
> ---
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Roger Pau Monné <roger@xenproject.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Penny Zheng <penny.zheng@amd.com>
> ---
>  tools/libs/light/libxl_aoutils.c  |  8 ++++--
>  tools/libs/light/libxl_dm.c       | 45 ++++++++++++++++++++++++++-----
>  tools/libs/light/libxl_domain.c   |  2 +-
>  tools/libs/light/libxl_internal.h |  3 ++-
>  4 files changed, 48 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_aoutils.c b/tools/libs/light/libxl_aoutils.c
> index c2d42e7cac..977a2705a8 100644
> --- a/tools/libs/light/libxl_aoutils.c
> +++ b/tools/libs/light/libxl_aoutils.c
> @@ -628,10 +628,11 @@ void libxl__kill(libxl__gc *gc, pid_t pid, int sig, const char *what)
>  
>  /* Generic function to signal (HUP) a pid stored in xenstore */
>  int libxl__kill_xs_path(libxl__gc *gc, const char *xs_path_pid,
> -                        const char *what)
> +                        const char *what, pid_t *pid_r)
>  {
>      const char *xs_pid;
> -    int ret, pid;
> +    int ret;
> +    pid_t pid;
>  
>      ret = libxl__xs_read_checked(gc, XBT_NULL, xs_path_pid, &xs_pid);
>      if (ret || !xs_pid) {
> @@ -640,6 +641,9 @@ int libxl__kill_xs_path(libxl__gc *gc, const char *xs_path_pid,
>          goto out;
>      }
>      pid = atoi(xs_pid);
> +    if (pid_r) {
> +        *pid_r = pid;
> +    }
>  
>      ret = kill(pid, SIGHUP);
>      if (ret < 0 && errno == ESRCH) {
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index 511ec76a65..ac1db9fe6a 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -2859,7 +2859,7 @@ static void device_model_probe_spawn_outcome(libxl__egc *egc,
>  
>      /* Ensure our QEMU command line probe is killed. */
>      rc = libxl__kill_xs_path(gc, dmss->spawn.pidpath,
> -                             "qemu command-line probe");
> +                             "qemu command-line probe", NULL);
>      if (rc) {
>          LOGD(WARN, dmss->guest_domid,
>               "Killing qemu command-line probe pid from path %s",
> @@ -3420,9 +3420,10 @@ out:
>  }
>  
>  /* Generic function to signal a Qemu instance to exit */
> -static int kill_device_model(libxl__gc *gc, const char *xs_path_pid)
> +static int kill_device_model(libxl__gc *gc, const char *xs_path_pid,
> +                             pid_t *pid_r)
>  {
> -    return libxl__kill_xs_path(gc, xs_path_pid, "Device Model");
> +    return libxl__kill_xs_path(gc, xs_path_pid, "Device Model", pid_r);
>  }
>  
>  /* Helper to destroy a Qdisk backend */
> @@ -3433,7 +3434,7 @@ int libxl__destroy_qemu_xenpv_backend(libxl__gc *gc, uint32_t domid)
>  
>      pid_path = GCSPRINTF("libxl/%u/qdisk-backend-pid", domid);
>  
> -    rc = kill_device_model(gc, pid_path);
> +    rc = kill_device_model(gc, pid_path, NULL);
>      if (rc)
>          goto out;
>  
> @@ -3454,6 +3455,21 @@ static void kill_device_model_uid_cb(libxl__egc *egc,
>                                       libxl__ev_child *destroyer,
>                                       pid_t pid, int status);
>  
> +/* Run in a child so waiting for QEMU does not block the libxl event loop. */
> +static int wait_device_model_pid_child(libxl__gc *gc, uint32_t domid, pid_t pid)
> +{
> +    unsigned int i;
> +
> +    for (i = 0; i < LIBXL_DEVICE_MODEL_STOP_TIMEOUT * 10; i++) {
> +        if (kill(pid, 0) && errno == ESRCH)

Isn't this theoretically racy?  How can you guarantee the PID hasn't
been reused, and thus you end up killing an unexpected process on
further loops?

I see you hook this up into the events interface by spawning a process
that does the spinning, have you looked whether it's possible to get
PID state changes as notification on a file descriptor?  That would be
more natural to hook into the events interface, and would avoid the
race mentioned above AFAICT.

Thanks, Roger.

