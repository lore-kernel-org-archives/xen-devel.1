Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EA1606A330
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1gPxZizR
Received: from list by lists.xenproject.org with outflank-mailman.1501936.1697923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW99m-00074C-55; Wed, 25 Nov 2026 09:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501936.1697923; Wed, 25 Nov 2026 09:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW99m-000745-2F; Wed, 25 Nov 2026 09:19:14 +0000
Received: by outflank-mailman (input) for mailman id 1501936;
 Wed, 25 Nov 2026 09:19:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1xW99j-00073z-QU
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 09:19:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xW99i-004ZWB-LN
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 10:19:10 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6b06a7f2-2eae-0a2a0a5409dd-0a2a450bdc42-16
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 10:19:10 +0100
Received: from [40.107.201.46]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6b06a80c-b7e8-0a2a450b0019-286bc92e95eb-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 10:19:09 +0100
Received: from CHBPR12MB780315.namprd12.prod.outlook.com
 (2603:10b6:610:36a::15) by DM4PR12MB5723.namprd12.prod.outlook.com
 (2603:10b6:8:5e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Wed, 25 Nov
 2026 09:19:01 +0000
Received: from CHBPR12MB780315.namprd12.prod.outlook.com
 ([fe80::6f6:156c:5674:75e7]) by CHBPR12MB780315.namprd12.prod.outlook.com
 ([fe80::6f6:156c:5674:75e7%6]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 09:19:01 +0000
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
 b=o+qW+konlvAUymZJjCe9vXQYvdOykkHddGDB7JXOfqb5vACU8K2WKqeWsTRLXg8PWDobaeKfvJYzMqGPlvW6+meqqMBWO/umnuDvePXU8qpCQhZjI2+K1TLEU0aDzB9zFelyEqfFoW1HeviACWmBwjVp82rPptFoPge+KiTwVgJCWaD3CH1h6Vyumtlkn7DTtqOH5kDjj4QVxddbtbAK/7+cpKW1mONV84KYWJFUqLS0A8XkbAfP3eBcXLHkkPUpnVqIFG1z04dXLlY63m52Vmqgl5ND4fROz/Yc/tj6uYiZyRyoR4tFN6FWT4XenRW3Hmc2odSwPCQHoSgpNEALYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBrrC1wN9CsNKO2QHec/To8icPODWMBkFBu8ujxY/lk=;
 b=w/dWgq0/OzQ80wFYIOSEoN42AQcbLLelFCyzVqiOFoU7QiwXtSQ4wMnC+0+6wwsFCui04A/gV9xVcyVAZ0lJDS/0pLOGJSfauR5FJTxA6tYQxONGASMFOAeRX6LQpyyZGz7c2LPCLdkPmhH91fYBPKniERo7CM6W8o/N5rYnPUFhLnOrQ+vNwMABC2dVbvuc7PprFdiRgWmqOoWkn1FTxYChm3PZioYch67wy9EHScQ8UGoNNPKZ1nOv8ERrFgpwA54ZW6RjyQmmhFgOdM9wlb7q3QFDyVxPWWAVrh5e9jqHxOxYxzOBEbd4eKAU2/F/tqFr3TnJCePotNyGpOpu7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBrrC1wN9CsNKO2QHec/To8icPODWMBkFBu8ujxY/lk=;
 b=1gPxZizRESVD8edzNI677oF2/bG9ser8a9D3N2DGpnfJ87G//V4YCGEy3ndkPzGm/uQYQYHCEifDNhIbUrovbuT/EXrBr3N8UhNeOr1tLiuPMWTPSWZMef+6i6LUj+/0WVlD98CU82+xZvVq4vmvRGF/pTRnwze2YdzuE1LMl1U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <00259456-04f4-4a15-931a-3af4fceda2d2@amd.com>
Date: Wed, 25 Nov 2026 17:18:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] libxl: wait for QEMU exit before restarting a domain
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <penny.zheng@amd.com>
References: <20261116064658.980330-1-Zhao.Jiaqing@amd.com>
Content-Language: en-US
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
In-Reply-To: <20261116064658.980330-1-Zhao.Jiaqing@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0006.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::6)
 To CHBPR12MB780315.namprd12.prod.outlook.com (2603:10b6:610:36a::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB780315:EE_|DM4PR12MB5723:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e730339-bfd3-4729-1416-08df4ad52492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|5023799004|261026140227099003|261022115727099003|56012099006|11063799006|261021121427099003|261022075727099003|261028144727099003|261026121527099003|261102124527099003|261021123027099003|261102123227099003|261022105027099003|261009223027099003|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ajvwjyXs7W+MN0lQnGxaDNqUIkrXK8TdHb6wCYGrm5EgoZpUdfysEmqPooBd4lvbFRp4Sj4OtbTKfsYkPKHyWUaNt0pAVX8HjTwAlGaBXekI6iupYgGx2Y8b6RrynQqfl+UQeajU3vzD4fAfH8pDWUm41QIMuO6vKaVwr3ZdIN9Od6mFnnlj8waQJGOhfl+qfNbPbgiloZjFvtSisJuMAx6WlCxAoP6f9nd5RLfgHucRbw5Ok7h3KD0L+M/lTcjgtbPto98WyZl4YmizUuKrrAWBrToFr0T74V4pFjyefoLFa+RDGBkZeM0kg0uhv5LW2gQKnGayb72eFpuSz7IwDxcGHo6Hyzlym3Enk2pNR9VwYNRZ1j2PS8KwGvg3GcrNRoVOT6h4UIGXL6tF/AcPoki2WorMmo7VRGG+ySLC4kjJ44UJaYq6pABvXxh3dHJvBNqLfJbbEcq1dLYmBF11i+g3CVXCiBoWFBiJ4AGyxpyJpkjAlvI5WQYAwlDjazyb8Fe4Yfs1fQzv55YhPu0/0tRWfDS7ei5zHfI5mwEdbDsu+LXAEjal/71cXrm8d5GvWsGoiR+pxIxkyivKIaAbi4VcGnOKQg+wHzio1wpQR/81c8Fk5Iyc2aIYWH1JDSdyU57GoqXfgbXmBjkF3rB6FYIVZ3Lon0OHYysV8QtUyOM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB780315.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(5023799004)(261026140227099003)(261022115727099003)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(261028144727099003)(261026121527099003)(261102124527099003)(261021123027099003)(261102123227099003)(261022105027099003)(261009223027099003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzQ1Y3pvSG43YUs3aEYyUGExdEh0cjk0MU40TDJWUzcxczhEMDZMQWp4TWZD?=
 =?utf-8?B?VzJUczFlYzVnOXdrWmZFT3kxQ2E5L3NPVXZoTkpEYWlJRVA3dTk0R2JNWFhn?=
 =?utf-8?B?eW1nMmJnZy9URVhJZnFWUUF6Nkw3MXlzcDMxTU12VFd1a2tWeGpUZHEwK0g4?=
 =?utf-8?B?VGV1ZmhZRlBXMDRNK2prWDZoTitpSkFSaGFtTzN4RWwyYkdwMVBla1BxUzZZ?=
 =?utf-8?B?enpEUVFaQmtZVFN3Mkl3M21pRExBbURiQlp5ZTVjeURra2J5YkViQjgzeThx?=
 =?utf-8?B?WXZnRExPd2xETGZCVTQwNUdVWVZ0K040QjIvS25EVEtMUHNLMFVRMTJiVWtO?=
 =?utf-8?B?a3dEekVmSWtkaDY3TndVcGJGZ1ZkcEVyVlRyNHhsWi9ocXZZYy9ZZVJHdW50?=
 =?utf-8?B?UCttdEkyNEpXRG5XdG96bnJNcGMxTXdkeG1zVXMrRVFwVUZQbSt3WGZEMWdh?=
 =?utf-8?B?WlJySTlQaVM1Y2tCQi9xdWFSWmRKMHd2R1RiaGFpZDczNnBMK1NsOHhkYU5T?=
 =?utf-8?B?bWJob1Jsb1FOTHVTKzROUGUzTmRTczN0Y0dmcU5hakg4b05UbFpEc3FFVUlU?=
 =?utf-8?B?eTNUZTNtdjh1YVJaRm1vSHo3NnFtdlNRNTNFcFR6QTFOVUZhakJ5ZEdNS0p0?=
 =?utf-8?B?U2w2S0krRE5VTTVMTDl3NFRCV21jR0ZHQ2sxZDI5dHhLMjE2Znk1d1RKMFVB?=
 =?utf-8?B?RzRxaHVRdExqVjh5MXNqclJxcUh4SUxiRXVJdFhlclo2ZDJhcXFqQ21rRTQx?=
 =?utf-8?B?eTlsUWh3RmpPNnJaQTRmWFh6cUxKRzhpS0MwdWhSeFMvZ1JBWGhqZU91Y1Zr?=
 =?utf-8?B?NmJBUEVSUitxNFBzcUhhYkFETnc0QWJKRFpxY2JqaW1sUXYxL3JvZXllUWRz?=
 =?utf-8?B?RTNnbjNrOEVCUDA1V3BVYXBqWUF3ejhlZzFHVlZSRVo5MUpodDh0T2YyTEkv?=
 =?utf-8?B?RnpnYVZyWGZYOXh5eUQ4TGtLSmErcEdMYmwxMFIzbFhvbWhmS2RFV0tlbGta?=
 =?utf-8?B?R0NocGtyQk1QdGdGek96MFpKM0wxSm1vR0ZCc1RnTUFnZk1IUkgvcUlUK0Ir?=
 =?utf-8?B?VDZUTktLeDJxQjkvc0JzNUFYOGcvRW1jSWFWakgwM2tmdGxxQ0htRm1XQTdU?=
 =?utf-8?B?ZTZKOFdlT25EMWUxZTRKWGRiS3FuazV1cEQ5L1c1c1FTcEM0Nm8wTU1KS1Fq?=
 =?utf-8?B?cUtRODF5T3R4aVJHeUFETUV3OWI5azZYZmE3b2M0YnkxWlVQVnRhWlpwN3Fm?=
 =?utf-8?B?SC91cjJKL29rRU04SFlHTXJ4UW1ERUZVMTFiREhlQVhXOXM1M2R3MXFOcEJF?=
 =?utf-8?B?aW5URzk2MmFydWRxM2pkS1lCa0dsMWJDajJZN0J1U0hCVXJ2NjBVK0xqbjdh?=
 =?utf-8?B?akgzaE5obnlQeGtnRjE0SFhVeXgvWTJxRFQwZ01FZzhIdWtGT2lLbitVWW1w?=
 =?utf-8?B?dTlsb3ZQTW9ieVp3SXhUN1BDM2ZjbjlYM2djS2Y0RUdJUmRJRCtoOFpZL3lt?=
 =?utf-8?B?QWphdmV2L0s2dkV2azdyWFFtMnphZ085Q0dvS2twdkNNNm4ySnJ0ZGxqRkoz?=
 =?utf-8?B?WDhkRm5IVzB5REcyVmtQSCs5VlFXWlNBYkdvd1c1UWdjQVJ2Rkk5LzhWbHNs?=
 =?utf-8?B?YmgybTFOLzdpU0FqbXFPQWdUcmFTOE1MRytrTmhndGdhZWJWSVJxVVJrSU1s?=
 =?utf-8?B?TWxDZ3pxb2YxMXNwYVl5YjNUY2NOc0JTSEVENDFybFM5R0F6cnI2S2lycDd6?=
 =?utf-8?B?ZjdjTzNIbDRjcFQ3ZllpOFZrVlpwYWFGQ3owOWlPM2NwU3JCTzRQSExDYWVE?=
 =?utf-8?B?YVNCaE9ZQis5OUd2emhaamNQWTU5eC9XV0ZNMkpucFptZFhsMWxnTXpKOHdR?=
 =?utf-8?B?V3JRQVYyQkVlbE80NktGSkROYWluZVZWQnliandwUnpvYmQ3T0hTNjVKSlhu?=
 =?utf-8?B?cFVIYTM0NEdXVFVYeWhXWEZjYXZ6bWV1OHhmWWVERnpYYno5VmhrTDZWaTRt?=
 =?utf-8?B?S0FBb21Gb0hzREFtQjZFK3hoSmtrd0ZpM3hoV3gwUkM4RHdacXgrUUlLaFRz?=
 =?utf-8?B?cFdhdUVEenVxSVdnZnczSXhUUE5XeGtseHFPU0NNK3FYNzA5NXdhN2QrQzE3?=
 =?utf-8?B?WlNEd3JSQVYySG5qczk1YWhCVEt4dmptdXNKejczcTVtWGlQN0JlMm40Mlpj?=
 =?utf-8?B?UGVoYlhGY1Zpa2VPL3NLeG9NNjlDdWk2Wmw0eXZGNjJ2ZFJTeXdYWnFJTThh?=
 =?utf-8?B?cDh5MmY3NjFkSS9EL0NodHRTMmVNaWUyTkZNTzNJRHlLWWprdWtLbUM5TUgz?=
 =?utf-8?B?NHRUMGViUmVZQ3dLRWZ6bzIwaXFWd2QzSCtRdDc4NTIzSFFudGFYZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e730339-bfd3-4729-1416-08df4ad52492
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB780315.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 09:19:01.5011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bP55iRBrT1aR7oQQtJPlMIWTuWP5D3cYkS/TU9dXNkkEA7nGKhNmkFg5x3SGNFdVWT2GF8Eg1KV9p16pTtXRTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5723
X-purgate-ID: tlsNG-42698a/1795598350-A8AC89EA-AC661E63/0/0
X-purgate-type: clean
X-purgate-size: 10651
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ping to bring some attention in case it was forgotten.

On 2026-11-16 14:46, Jiaqing Zhao wrote:
> The PID-based device model destruction path returns immediately after
> sending SIGHUP, before QEMU has necessarily exited. When an HVM guest
> reboots with VNC enabled, the new QEMU process may fail to bind the VNC
> port because the old process still holds it.
> 
> Wait for QEMU to exit in a child process after signaling it for at most
> 60 seconds. If waiting fails or times out, log the error and retain the
> existing domain destruction behaviour.
> 
> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> v3:
> * Restore timeout to 60s for possible slow QEMU shutdown with flushing
>   block I/O.
> * Add Reviewed-by from Jason.
> v2:
> * Share the fork, error handling and child exit handling between UID and
>   PID-based destruction paths.
> * Reduce the device-model stop timeout from 60 to 10 seconds.
> * Handle unexpected errors from kill(pid, 0) explicitly.
> * Fix misspelled "signaling" in commit message.
> * Coding style fixes against tools/libs/light/CODING_STYLE.
> ---
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Roger Pau Monné <roger@xenproject.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Penny Zheng <penny.zheng@amd.com>
> ---
>  tools/libs/light/libxl_aoutils.c  |  8 ++-
>  tools/libs/light/libxl_dm.c       | 98 +++++++++++++++++++++----------
>  tools/libs/light/libxl_domain.c   |  2 +-
>  tools/libs/light/libxl_internal.h |  3 +-
>  4 files changed, 75 insertions(+), 36 deletions(-)
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
> index 511ec76a65..104c48a07d 100644
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
> @@ -3454,6 +3455,30 @@ static void kill_device_model_uid_cb(libxl__egc *egc,
>                                       libxl__ev_child *destroyer,
>                                       pid_t pid, int status);
>  
> +/* Wait in a child so the libxl event loop is not blocked. */
> +static int wait_device_model_pid_child(libxl__gc *gc, uint32_t domid,
> +                                       pid_t pid)
> +{
> +    unsigned int i;
> +    int r;
> +
> +    for (i = 0; i < LIBXL_DEVICE_MODEL_STOP_TIMEOUT * 10; i++) {
> +        r = kill(pid, 0);
> +        if (r) {
> +            if (errno == ESRCH)
> +                return 0;
> +            LOGED(ERROR, domid,
> +                  "Failed checking device model [%d] state", pid);
> +            return ERROR_FAIL;
> +        }
> +        usleep(100000);
> +    }
> +
> +    LOGD(ERROR, domid,
> +         "Timed out waiting for device model [%d] to exit", pid);
> +    return ERROR_TIMEDOUT;
> +}
> +
>  /*
>   * If we have a uid, we shouldn't kill by pid.  This is because a
>   * hostile QEMU might have exited, in which case the pid we have may
> @@ -3477,6 +3502,7 @@ void libxl__destroy_device_model(libxl__egc *egc,
>      int domid = ddms->domid;
>      char *path;
>      const char *dm_kill_uid_str = NULL;
> +    pid_t dm_pid;
>      int reaper_pid;
>  
>      ddms->rc = 0;
> @@ -3513,46 +3539,54 @@ void libxl__destroy_device_model(libxl__egc *egc,
>      if (dm_kill_uid_str) {
>          LOGD(DEBUG, domid, "Found DM uid %s, destroying by uid",
>               dm_kill_uid_str);
> +    } else {
> +        /*
> +         * No uid to kill; attempt to kill by pid.
> +         */
> +        LOGD(DEBUG, domid, "Didn't find dm UID; destroying by pid");
>  
> -        reaper_pid = libxl__ev_child_fork(gc, &ddms->destroyer,
> -                                          kill_device_model_uid_cb);
> -        if (reaper_pid < 0) {
> -            rc = ERROR_FAIL;
> +        path = GCSPRINTF("/local/domain/%d/image/device-model-pid", domid);
> +        rc = kill_device_model(gc, path, &dm_pid);
> +        if (rc) {
>              ACCUMULATE_RC(ddms->rc);
> -            /*
> -             * Note that if this fails, we still don't kill by pid, to
> -             * make sure that an untrusted DM has not "maliciously"
> -             * exited (potentially causing us to kill an unrelated
> -             * process which happened to get the same pid).
> -             */
> +            LOGD(ERROR, domid,
> +                 "Killing device model pid from path %s", path);
>              goto out;
>          }
>  
> -        if (!reaper_pid) {  /* child */
> -            rc = kill_device_model_uid_child(ddms, dm_kill_uid_str);
> -            assert(rc <= 0 && rc >= -125);
> -            _exit(-rc);
> -        }
> +        LOGD(DEBUG, domid,
> +             "Waiting for device model [%d] to exit", dm_pid);
> +    }
>  
> +    reaper_pid = libxl__ev_child_fork(gc, &ddms->destroyer,
> +                                      kill_device_model_uid_cb);
> +    if (reaper_pid < 0) {
> +        rc = ERROR_FAIL;
> +        ACCUMULATE_RC(ddms->rc);
> +        LOGD(ERROR, domid, "Unable to fork device model destroyer");
>          /*
> -         * Parent of successful fork; execution will pick up in
> -         * kill_device_model_uid_cb when child exits
> +         * Note that if uid fails, we still don't kill by pid, to
> +         * make sure that an untrusted DM has not "maliciously"
> +         * exited (potentially causing us to kill an unrelated
> +         * process which happened to get the same pid).
>           */
> -        return;
> +        goto out;
> +    }
> +
> +    if (!reaper_pid) {  /* child */
> +        if (dm_kill_uid_str)
> +            rc = kill_device_model_uid_child(ddms, dm_kill_uid_str);
> +        else
> +            rc = wait_device_model_pid_child(gc, domid, dm_pid);
> +        assert(rc <= 0 && rc >= -125);
> +        _exit(-rc);
>      }
>  
>      /*
> -     * No uid to kill; attept to kill by pid.
> +     * Parent of successful fork; execution will pick up in
> +     * kill_device_model_uid_cb when child exits
>       */
> -    LOGD(DEBUG, domid, "Didn't find dm UID; destroying by pid");
> -
> -    path = GCSPRINTF("/local/domain/%d/image/device-model-pid", domid);
> -    rc = kill_device_model(gc, path);
> -
> -    if (rc) {
> -        ACCUMULATE_RC(ddms->rc);
> -        LOGD(ERROR, domid, "Killing device model pid from path %s", path);
> -    }
> +    return;
>  
>  out:
>      /*
> diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
> index 37fcd92871..6e332cfed7 100644
> --- a/tools/libs/light/libxl_domain.c
> +++ b/tools/libs/light/libxl_domain.c
> @@ -1270,7 +1270,7 @@ static void dm_destroy_cb(libxl__egc *egc,
>          libxl__stubdomain_is_linux_running(gc, target_domid)) {
>          char *path = GCSPRINTF("/local/domain/%d/image/qmp-proxy-pid", domid);
>  
> -        libxl__kill_xs_path(gc, path, "QMP Proxy");
> +        libxl__kill_xs_path(gc, path, "QMP Proxy", NULL);
>          /* qmp-proxy for stubdom registers target_domid's QMP sockets. */
>          libxl__qmp_cleanup(gc, target_domid);
>      }
> diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
> index b65e0064b9..f4fde8009e 100644
> --- a/tools/libs/light/libxl_internal.h
> +++ b/tools/libs/light/libxl_internal.h
> @@ -97,6 +97,7 @@
>  /* QEMU may be slow to load and start due to a bug in Linux where the I/O
>   * subsystem sometime produce high latency under load. */
>  #define LIBXL_DEVICE_MODEL_START_TIMEOUT 60
> +#define LIBXL_DEVICE_MODEL_STOP_TIMEOUT 60
>  #define LIBXL_DEVICE_MODEL_SAVE_FILE XEN_LIB_DIR "/qemu-save" /* .$domid */
>  #define LIBXL_DEVICE_MODEL_RESTORE_FILE XEN_LIB_DIR "/qemu-resume" /* .$domid */
>  #define LIBXL_QMP_CMD_TIMEOUT 10
> @@ -2659,7 +2660,7 @@ bool libxl__async_exec_inuse(const libxl__async_exec_state *aes);
>  _hidden void libxl__kill(libxl__gc *gc, pid_t pid, int sig, const char *what);
>  /* kill SIGHUP a pid stored in xenstore */
>  _hidden int libxl__kill_xs_path(libxl__gc *gc, const char *xs_path_pid,
> -                                const char *what);
> +                                const char *what, pid_t *pid_r);
>  
>  /*----- device addition/removal -----*/
>  


