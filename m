Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46CDCA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 14:09:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440896.1658413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDjNT-0003y9-VH; Mon, 05 Oct 2026 14:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440896.1658413; Mon, 05 Oct 2026 14:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDjNT-0003y2-S3; Mon, 05 Oct 2026 14:09:15 +0000
Received: by outflank-mailman (input) for mailman id 1440896;
 Mon, 05 Oct 2026 14:09:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDjNS-0003xq-JV
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 14:09:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDjNR-0098s8-SD
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:09:13 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac3af84-e002-0a2a0a5209dd-0a2a450187ba-14
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 16:09:13 +0200
Received: from [40.107.208.2]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac3af88-5984-0a2a45010019-286bd0021ad2-4
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 16:09:13 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB612249.namprd03.prod.outlook.com (2603:10b6:806:5a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 14:09:08 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 14:09:08 +0000
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
 b=jb46OOhEUApwtHX1eNBiYXa7UWq0kVT7LX5jqIrsBN72838pkGa3Zq+hu6z5dChj7rO7nW4HSr9o2uK2c4TLYHjPRmFsOaFQ54BPjFyShc4F/ewzdM+qsb5NFjJWT3GI4mViiu9CjBkW1nFDx/3FAjk9Ip8OdifnGYSlqGnjCkjIiOUQNYUAs9BUJlra/yfj8gjSMoLxoJsFtJAL6Cu7MVmHWqFs6y91npYWxqQ6zMjDFmk5S/BMnNQgUi8oICdHIaqw8friPLSc9pxlcojKI8Tn2Yfl8nHeq0xGFnkpf5vtZ+josnO9IPLisDjDRrYX+xpbGSw9F25HreSrmaKGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BYmbbGBGNk9LoFC7PO4PfZzPCIpccYFQDxDngO75ro=;
 b=AmkKdpA66nR4teOWmX+lzez3tujem0YnxHRS76USIQQ7IRZPInbZc3my9qDXBcfQbb0iR49QRWTj9jJ88eS8H6sQRgvMXeSzah21LxEFWJ6VIQCAa6sw73B0EulkKetYx1n2nV7siZbDYgQAco7vIfgQ4vFZl9tViizVVFCjbK3dfZWmKCVS65lpTlw5RZ+o70Vh05ZqKpdPX/V2rcZPE/Bju2+XiCp9IhYlPpTJZGUYI6VKrrlleDv6pnEp65UfH+lz8pNSEruoIAdvaO3cCdb1LdJo+KzYBfb59KEqO3yu3GVtrdOxKONFBlz776PplK+hpmaU3M5FycXASJK9+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BYmbbGBGNk9LoFC7PO4PfZzPCIpccYFQDxDngO75ro=;
 b=dR8SK9lNL6CbNy4uUXJ9gHfWYj0m1wM7ZMvFISnFk3lJQIRvFcsD9kXvPPDBMdm6DPzv6Bt/wJ9gZsn5AYuV9u+IsUCt9loSN/i5YoHrHIEQL4MdnmxtquX0qridMFYNjvdZ2wD3YX0G7lI9gdMecVYprrdMlwDfjvc8yVW1RhY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <51c31589-5b82-44fb-8756-d98cacb9c685@citrix.com>
Date: Mon, 5 Oct 2026 15:09:04 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH 03/14] x86: have cmpxchg16b() obey to Misra rule 11.8
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <8ae3cc08-2011-4689-8530-f3b962ed4d72@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8ae3cc08-2011-4689-8530-f3b962ed4d72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:377::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB612249:EE_
X-MS-Office365-Filtering-Correlation-Id: 96cebcdf-2725-4cd7-2bb6-08df22ea38bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S7Ldos/6vs1zheQYLvCOZ9nPLx6A4CB8i4pDMbuSuiA966eQUop602bHlZRqTdJ5XMxNfSNT0JCaEcAsJvIHSzcUmjHb2W6IWe3gra1gAPVYHKzXU+mt+4ms1f9UdYlq9EcP19DVVzxLB0juZ1KnkpsTUq9lFvDBXhgYhZxRWO5zckC0VgHnDeYcwZdmftKqeqPj8w4+XfME9QCFm0HkJmE4WfXRCXXGegGq4TeKchblaKdoiEV8ceTzGBDc9jqWQy2zSQuUZSo8NEe0wDEKJtalZQMfjR2zvHJZJZeq03QQyyqYOIBiSWkW98RUSYzbtweHo/MNMc9FpIslDfxlJAHSRfNeJTE4iVYkpEd7YDaSNUEXLSUh5tVMnEn4TPWRZrTdO7gVS0muWeI6QN6UbIVCkz6S0Gkl/nEu71LBF4OrD+tjcJqv/XJmoeouluFpsq6d5N4GtNf1bhEMveYEYdluEp1tnkdcvTXoR7fn8xDZAmI6KIuIupIQRTeodoYFrUV6R9RTjB0DC7swd0ATijrLQTOxcO/tp5hv1JY4MahnxSg4jYLjiQgyCAPoTBqUUIA6f/b1x1Hmlw3637+sWEk6pRqWPRtDIcNcDDYnHZcTdKx6rjRM5rnRaFDHdlsAE0Nsz7YzlJqNT2ri85gZ3o8uAFpaUle2ps157NOixkQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXJDckhhckRZZDN3Mk5YR3JnRHVBUHlhMmYvWGNtcG9kV2VtRWRsQmtXTWw3?=
 =?utf-8?B?SytFOEdJSWEwRE5vb1JIZWJQV1hRMkJnb0hKN3ErbW8xeVBLekdueW11bzFm?=
 =?utf-8?B?ZHNHamhmVmIvYTE4cm9XK01wZ3ZtWnlveUZwMWRyRzJncHlhenM3MHJnZmJS?=
 =?utf-8?B?bXJzZDRSRVFILzkwZlRsTnB2TUduZmliMGJ3WEFXWjhCQ0Rnbis3QnlVU082?=
 =?utf-8?B?SjdTd0V1WFJPRHRKcE9oYmxOTGROK0FycllpOG94Y3VOK1E5bGRYMkd2M0VQ?=
 =?utf-8?B?dUdaTmRMd2F2b2drWlh6UlRyWXZiVnBwcm5VeDN0Y0NwTlJ3Z2c4M2ZrdnlT?=
 =?utf-8?B?Y01ucFZpaitVaDQwZ1lITmtCa1haV2Fka0d2SFJ4Mmo4Z21ZK2FtQUY4anFY?=
 =?utf-8?B?RkFwQUw1RVJBMzg1RXJ0WHBQWktON21pWUNIN0xiT09nNDdoTEphaUNEaks3?=
 =?utf-8?B?bEZVckpuL1ptS21yditFUVl6N2h0SXlPUWZKeXhUNnU3UUFwVnk5SmJJRU1G?=
 =?utf-8?B?eVY0NHZ4VEZDRE1xV2FZVDVwSkpKUWEydEdxaWZWRFlvend2YkxkUk1QSzBn?=
 =?utf-8?B?UEtpblRkVjE0Q3hBdG9WVzZFbkRKREF4Tll1bDJsWTFiK1VoMUF5Y1FFZUtn?=
 =?utf-8?B?bFh4UE9pdEFBdXFobkVIMm1zQkg1aTNQRk40OW9QTFUwUEtqdU1FeWZhSEJ5?=
 =?utf-8?B?R0RtZGgzTitqdFh6SEYxSWZPeTA4MkoweFZ3R0E2YWtjYURXZENHd3o0SXNL?=
 =?utf-8?B?ZDBGOFBocXpWdFI4V0l0bnkwZlpXN0hJMVk3Z01uTXNIOFk1dkhlOWFtWXhN?=
 =?utf-8?B?TlcvaHFVcmtvaFpLd1hiaG1kbk5oRTVlMFpyZEhISFdjWHpJZGd0QzI0M2d6?=
 =?utf-8?B?QS9DZFlBVVJwVDBrUFBMZ2g3V1F6eGR3MW1hQjdsQnpIMkJNdUNIemppTkNn?=
 =?utf-8?B?YTBCMmQ2Q29sQm95Z012UG9nZUNOZExZV1lsMFFlVTVCb3NWN2duVmxpN1Yz?=
 =?utf-8?B?dDRIR3VBanUrVG5TZ1IxaHB3WHpxWGZLaFhmZUZKOFMyeWZ6SUlDRHd1TEtU?=
 =?utf-8?B?a085c0pmU1FsUUVhZEVqTUEwbXg4QTA0WjB6Y3lKa3RNMGJsUzJOcnVSZnJN?=
 =?utf-8?B?Q25zdFJ4RmVpNktUNTIzS01zUUh5TDEzR1hzN1hLVWZ0cXpLZkZHT1k5Ym9G?=
 =?utf-8?B?MkFoVlRjSldmeVdjNld6Yy91Y3Bya2N2Wjk1MXZjUk9scHpybGdrR3hsZzdm?=
 =?utf-8?B?bTZzYXJSZGtnOFhPRGdNR3l0ODVuZE1ETW94S0ZPNlRpb0U4bWRVVnpKVE9z?=
 =?utf-8?B?dUNvMU1DU00wcDF5YnArMGprWGtZNVNidDFBZlc5YmQrTkRGNkh5S3FFRXNX?=
 =?utf-8?B?a0lRUWFqcUl4Sk15TUJINTEyV056eFFoa284T0FYaUE1Y1lLaUIxNnlMNnFu?=
 =?utf-8?B?MU5NRmdYR3NiNDRGUzd3SXRGU1U1WHJQVmRFeUk5bkM3UUV1Z3RVLzFLRjFl?=
 =?utf-8?B?R2ZMNVQxSXo3czgrQU1hTEIzbm1TTWljY1Q0YSsrR2pGdWdiWmNlMGdXbFhy?=
 =?utf-8?B?RFBtaVRqMEkvVVFNbk9DU2pHNFZ6Nk5YaWZBb3hUZnBMaGZaVC81MnNqTkxz?=
 =?utf-8?B?R21lUkk3dDc3eUg3VG4vMXhHTFpsbnpJNExNeXlVaVpCQklMeVlLc0E1Vnd6?=
 =?utf-8?B?b041K0o3TFl6V2o1Z1gwSitnQ0gyejVYZGRRTnVXdGovc21WWWJGWW1MUk9L?=
 =?utf-8?B?T1laMGF5L1JManlRQ2dHK0VYdGRhVnVlNjhzZnZIWVk5RXlPa1VHM3lmamVm?=
 =?utf-8?B?cTZRaWhTeUM4Kzd1aWVpc0NsU0lxZzB5alpCZ1pQQnNQWGRidkt3TDd1dFdB?=
 =?utf-8?B?Q2ZvcFo3Qy84MEIvSzFuTnJyTm9nZFJNY1V2VWVXaTdaT0grYy9LVTBwQ05y?=
 =?utf-8?B?ZW9VYlhrV1ZzemF5cVlrcTJLcnZ3Z2NCZVh3U2QvaExKU1NLZ3JtNWxaek9u?=
 =?utf-8?B?TlVreHVHUmtpbkRtVEhIeTdFWXBMZUVMVTVlai8yb0JyK1FhUjJNQ1oxeUhE?=
 =?utf-8?B?UlloQURGR2lYd0FMa25BN1NGWFhLVVlkcWJZazZ1UzFVdnZkT1JRc2p5TEdz?=
 =?utf-8?B?TXBxS2pacDNoSGZqOE1HczZkNlRmRVRoVVNuNUVIYUpWbU00cjFGNzNKNy96?=
 =?utf-8?B?SVZUYlltU0RMeXJNZ3FqeFZrai9rSzZzMVZwYVQvUmFhSmRxUks5bW5UeURy?=
 =?utf-8?B?NUZHNGRtTk1FVENxajF6VUxBNXY4L0N3b2xlMDNFZE5oYTZCMWJ3NEhGQU1s?=
 =?utf-8?B?L3R0OFUxZjlnR3BKc1pUYTR0c1lHUkpjRCtMWllGMUx4YllBL0R1UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96cebcdf-2725-4cd7-2bb6-08df22ea38bf
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 14:09:08.0266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAj+TAvg1Zi6sTOU7yfADLtfl5m+ukcANlrqr7k4ID7iuTiWSUHcv8g0g7wAeeykIuNsidAqFk29PFCdxrvmOUqEYuszwokhbtTfmWEVmNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB612249
X-purgate-ID: tlsNG-d62444/1791209353-BC359757-C819C7A8/10/78276251493
X-purgate-type: spam
X-purgate-size: 354

On 02/09/2026 7:31 am, Jan Beulich wrote:
> Casting away const-ness (or volatile-ness) is never a good idea, and
> there's no need to in cmpxchg16b().
>
> No functional change intended.
>
> Fixes: e0116acbbd0b ("x86: add cmpxchg16b support")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

