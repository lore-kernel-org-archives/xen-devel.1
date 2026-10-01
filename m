Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46910CA5FB3
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 12:33:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438296.1657169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCFyJ-00028Q-6M; Thu, 01 Oct 2026 12:33:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438296.1657169; Thu, 01 Oct 2026 12:33:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCFyJ-00028J-2l; Thu, 01 Oct 2026 12:33:11 +0000
Received: by outflank-mailman (input) for mailman id 1438296;
 Thu, 01 Oct 2026 12:33:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xCFyH-00028D-Q4
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 12:33:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCFyD-000Fwl-QP
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 14:33:05 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6abe52fb-2eae-0a2a0a5409dd-0a2a450795e6-32
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 14:33:05 +0200
Received: from [52.101.46.45]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6abe52ff-b4ea-0a2a45070019-34652e2de2df-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 14:33:05 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH9PR03MB731891.namprd03.prod.outlook.com (2603:10b6:610:315::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 12:33:02 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 12:33:02 +0000
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
 b=MQPvZtxlIoUuqBMAuyBG4VQFQQGpAkamF9+FGDTP6wBWowKU34pVnPIWBNoL6ZPcjt+RpcxC/h5g38sOjnjZ6rXM1bBc2gC01F0WXN+GTKhxdN9AXaaws5mj6Cv6qxT3E716feslrxkiMED0LAe+XYBoNyoh7gdwQTRfuvX3hyIlIGIDvocXicZ2X8TfNge4KWagzkyrIOTEOb1KXimMPPuUPfGHcVqKNgL9P9o/+OXBgJT1mOpMiXS66GBLPswPMCdryDUwizVTS7njlBLSYvKjjYPXC3gBOABu9hc5jHXLCToVF4WC308epn4yg30NPOEJPzE637Eh8KXwztnjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJ7udDsAE5YbltXcZPjf9RWVrFjR+37WTwSyC9Vm7js=;
 b=aYKb7l4dkmem8juIHbR53dscIrYBNyCb6GwaMpl5q8u2kSMpzFh3/u0RA/EorcAqbZbTxV2M8Jy6XyTGTUBFUAk9gv8N12+/09cRDfnzpA5xoC9hEQPqDXerwJUFmW7IeNVgKldLlp3JLb6YrMSP0sxsq7vyTKDz6Sd13WJ3kRJd80wW/wdQ9UPQjjA8uY53etFxkzU/GJegJB2/bKNAtVbuNXibRnZZWfnTj8MR4wE863uOrP+E4v9WogyIxWD+1FGFKwilZ070Ihj2rYCHHd4kwCa2oLK+9AlTbJWHQKlPwnY7KhznerVg5/uAigxKUvIWm36PhwnOa9HuwdnUFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJ7udDsAE5YbltXcZPjf9RWVrFjR+37WTwSyC9Vm7js=;
 b=q+xNTMsMEsLcb20rcqHtkvJYIqTI1WQ93HGZudPNG7+EuxvG2eXBBg9s7uFLV1LlNxqgxTY9CLP1IJelfT7irCUZMZdd1+ttFN4/FTTPKcRlG/E67w+FJm46TUSGm982gOcuuWy6zqHtxsegsOE+jgBDruJNMLQQiBkj6HJk7mg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3b206b17-d1e5-4c63-9e75-1e10c68bf226@citrix.com>
Date: Thu, 1 Oct 2026 13:32:58 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH test-artifacts] Build minimal images with Buildroot
To: Titouan Christophe <titouan.christophe@mind.be>,
 xen-devel@lists.xenproject.org
References: <20261001115226.471814-1-titouan.christophe@mind.be>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261001115226.471814-1-titouan.christophe@mind.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0421.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37d::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH9PR03MB731891:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e543b8-4640-4613-1609-08df1fb82291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	VXH06qOeydCdF4hlgm2dGw/n2n/eTEO4tAOZbhP1fwD85z61VQvoZKe4iLQyChenJHHCUqveJrcPy3hBVwYlx0ZBbXonz7fTsXZ6hFJY3D1IIjsg1GF/18RrYqavthQ67+CODYIhSfYsBQYpCmz8LQ8Fwbh3cjJzC7+ELFyXrMP3lUYMVBEcFGvCTLdIeT6dTvzpiyDEL6b+cIE9f1lGuuuUhR/ViIFWGfQmuygj08I4bdNCjmEf84YXqAMkgSLEVYlSGMFIaG20U9uBb2+t/1k5me+d08bsU3dPfg8K83pCzrB+yCd25aRhAA9oSXE1h9Vq4JOrFOcbZzACD3wfUdC1tKm7PcRpsKu0H0X9Lo5WKiCLF8XEVCW6EhMgyKJhliJZ/VZKbQ9kXLXLfgqE4CpEqUZ12xZBtpUVCaAnGhNuTuHZANfufCQCjwbHOFHNWbOtiDY5E6igM+haIU4QYv+aNY+3s2pomoCdfIYb99pLKS523SZHQDYhrqCBfM2AZ/2GXlsGnOAfkFOFuqN+bb5TsbrN+qZFbMLuuH0D4KV9//PTZ1bZcoqYl/4U9dftkz9yAp8/aHM/WYIj1r4dEHkDNIU+np0+EO6BxS/YTNo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXBENmRpd0pQRjhtM1FqS21scE9yL2o0dzNBM1A2UFVWMGY3Ky9aUVl4bTdH?=
 =?utf-8?B?WTJ3ZlJldWhaWFFRVFZNU1FqUWRQRUhHRE9ETWQ3U1oxZmNrOTMxUGt1UXpy?=
 =?utf-8?B?RGZTNGpmVittcVRqZThEZk1oS1FodmZvdEYzY3R3T0R2SmdQbStPQ2Z6UHV2?=
 =?utf-8?B?Mzh5WG5PazN4ZU55WUd3WkZONk1yTUdkWnNSYjUyRUhDU1h1czFKOHF3S0ta?=
 =?utf-8?B?a1o0SGY3N3ZOTlIxdHl3ZzkrUnRLZWtpNnAveE8xQ0F2enpJcTBwdDh3MExC?=
 =?utf-8?B?M1VXOFFxNlA0OUFSM2ZwYUlhc1lMQ0lsOHlZam1tWVJGWU1MTm54b2tPNzNF?=
 =?utf-8?B?NTFzUTRzS0d1QnhYaEc1elpJR2lWdEx3OSthWXRKaUJVcFVtdjg5Smpjc29F?=
 =?utf-8?B?REJQWHNOeUhhNkMwaENOSmxaOWhMR1Y4Wm51QzMvOTI1dk9JeEM1S2xnZjZa?=
 =?utf-8?B?ZkJWMU1pdHVYOEVCRVl4ZDZDckc3bWlMZEtwMTd4ZVBrb2FsM0NRODloMFdO?=
 =?utf-8?B?ZXVFL3Bpd0RxRHJtYjNNd01BSFRvRjB0OXRYYkdIQ3lYRFlFa01PZ2lZVVFB?=
 =?utf-8?B?aGp1dkxUNzlzRHFGWWFvbWNjVDZzbnZRUzBZMTVnRDUwT0VVUG5wZjMvRVJt?=
 =?utf-8?B?Sk1sMDNYb3FzR3NkTVJUSnpvcFBxYWtvK1RNRW5pYUhMRGVtcmY0YlkxV3dO?=
 =?utf-8?B?cWRCaWFFcjRwL01HcG8ycHhTcHF3MGpZdWZrdXpTeS9OY2pPajVsVHZ3Tjl4?=
 =?utf-8?B?SkFlMDhtUDNHWksvckgwZ3dWemJERUVZZElKNUR0U0RLbURXOFhPcXp3U2Nk?=
 =?utf-8?B?QU9WNldLalBGREZjT3I1VlpoeStkYmdiVUNxR3VtYi9xbzMyM1U1UkFHYnA3?=
 =?utf-8?B?dENGVjFmVlhUd2tPS0haMTB6SEJ1MVBGaDJvV1lBS0FDbDZ2WTZadlVjZFFL?=
 =?utf-8?B?NDJYYmdEbm5vWk0zcVgvMFRabE4yeTJaMTFLa25RdVYrSFVrbzhWN3ZuTjdJ?=
 =?utf-8?B?YkRzYXdKT2ZRVWxUelVpUlB1TjhqN3dkZHQrN3pibDhnNjEyaXRFMHFxYnQv?=
 =?utf-8?B?Zy91SU5nV3dReDMwZjVtUmcwUnpJZmtMaGNra0RhVjMxQzhnbzNVaXhUZDhT?=
 =?utf-8?B?Z2h3VjFkbmdsWUFJdU94d01WM1VLSEZMY0lnTkNxRTFDenpVYWg4WndSeDBr?=
 =?utf-8?B?Q1dmL0crK3B1MVVhZG9aTXVpNFNrTTRRWmVTa1VKVUxlc2ZOSWRWT0xjUUxE?=
 =?utf-8?B?RmNoa1hhUlRuRi8rTjg2SlFnQW5kUlpwMlZzM2MvTnd0SlUzbWpvZmhxd0dI?=
 =?utf-8?B?bVJuRzhpa2tlelJLTGE2eDhZeWEzSytXczFIejRSeW9jNS9tUm9tV0FKQzl3?=
 =?utf-8?B?WHlqVUY3TlpuRFhVNUdVcklqSVBXYmdoYktrMkcra2gza09WK296THVRRS8r?=
 =?utf-8?B?M080STJUVHdHT3B2WEFydm5wT3BUam9IRjlUbGxIOStkUVZ0NGIxR0dCSGQ1?=
 =?utf-8?B?dkFoN25BdEcrSkFSUTAwL0FyZTh0N0E0MUtwL1NtTWNQK1ZGSTQ2Tm5jVFlI?=
 =?utf-8?B?K3g2OW90cG9VaXZ2TCtJRllGck9ZdVByYU84UXVGUlZpUDljTnB3TmFTY2xY?=
 =?utf-8?B?Y2xxSnBwcUhrekhyYzdGdXNNdis0dEdxZWQ0N2RqbW5zaDJqZjNWMTJhYklk?=
 =?utf-8?B?SzQrRys0K2N6cFNFTm9UaFplUE4ySmloaUJRTFVocDUrNGNaUDNUSmswZGtP?=
 =?utf-8?B?RkVRV2J4MllvZW5XRWNnR1BkT1NMZGFHZUo5STFLYlpKelNFMHVVWnBzZWFl?=
 =?utf-8?B?a0xLai9QWC9YK3hpRE1taDJocGdoOGpBWVNKbzBMZFdDWTMxaUc5WFY5QXVO?=
 =?utf-8?B?cXRSa215SC8zV05FblFxNjd1Q1c2R0txLzlBamg0cnVlM2lkZzltK1hjT0gz?=
 =?utf-8?B?TDBDVWY5MXZuSjRsZzJtY0JiNDNVQ3ZrS1FaajZzQnk2WFlDT3ZNUzljQmpk?=
 =?utf-8?B?QVVVUFN5cjJWU0U4cUFSNERMTW5oNnFyejBiVjVPSG1ZVjc1TFJJSFBwK2dr?=
 =?utf-8?B?OVA2ZzE0blNvcG9iQjExYXI5MmhQQjlkOXYxN25IVkRpVkpZcGo0aUtCczg2?=
 =?utf-8?B?b1BFbStMTVQ5WmUvV0lKd21RbmVBVm9VcFIxdjNqbjJINDhZTzRoVUxJVG81?=
 =?utf-8?B?SVc0czNZaUxNRURFbXh5b1pQMEZmUVd0ZXBaRHIyaFBLeTdWenMxYWxqdCtE?=
 =?utf-8?B?c3U0MDlSaW5tZGU5aTFqK2FCNUx0VkxPNnlOeVM0M0FKZmphVGRaOUdPNVNU?=
 =?utf-8?B?eEhqWlFtazlndEYrRVVnKzgxd0ROb0IrOVhVN1Y4ZVBIS0Y5aTIxdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e543b8-4640-4613-1609-08df1fb82291
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:33:02.5011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69brDaPq1Bc9ldiYQb/zVsGLcvA8dDOQYnHflFev1Ycpi8RZqBO0xl96eOf5xsXkUd8rUY4zUEiW9J4Q+3Mf+GmseKXPWjog8Cu59FRwNOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR03MB731891
X-purgate-ID: tlsNG-ef75cf/1790857985-3C212AE4-54BE517C/0/0
X-purgate-type: clean
X-purgate-size: 2404

On 01/10/2026 12:52 pm, Titouan Christophe wrote:
> Add a way to build minimal Xen + Linux dom0 images, and their corresponding
> cross-compilation toolchains with Buildroot [1]. This effectively provides
> a consistent cross-architecture development environment.
>
> Buildroot is a project that makes it easy to build embedded system images,
> including Linux, Xen or bootloaders. Leverage that build system to build
> minimal images for use in the CI environment of Xen sub-projects, namely
> Unikraft.
>
> This approach is based on a Buildroot External tree [2] which currently only
> provides 2 target defconfigs (arm64 and x86_64, both running on qemu).
> It uses a recent development version of Buildroot that integrates changes
> to build Xen on x86_64 [3], on its latest official version 4.22.0 [4].
> It also includes the latest kernel (linux-7.2.7 at the time of writing).
>
> As a byproduct, aside xen+kernel+rootfs, we also get a cross-compilation
> toolchain (that runs on x86_64 hosts). This makes it easy to cross-compile
> domUs for arm64, and it alleviates dynamic libraries mismatches when
> adding userspace programs to the dom0 Linux image. As an example, one such
> problem: Alpine linux is based on musl while your regular development
> computer is probably based on glibc, which causes issues if you are
> recompiling `xl` and try to use it in the Alpine image.
>
> [1] https://buildroot.org/
> [2] https://buildroot.org/downloads/manual/manual.html#outside-br-custom
> [3] https://gitlab.com/buildroot.org/buildroot/-/commit/0bf8b2ecee6b1b41746e8863b57c2c5ba3a623b1
> [4] https://gitlab.com/buildroot.org/buildroot/-/commit/a962be2eea146e06661712159698bc7cbf3305f2
>
> This work is derived from this original series:
> https://gitlab.com/xen-project/fusa/unikraft/-/merge_requests/1
>
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Thankyou for your submission.

How are you intending to use this image?  There's no consumer shown, so
it's hard to judge the patch.

One thing I see is that it intentionally embeds a fixed kernel and
(commented but not actually added yet) Xen, and I'm not sure that's a
route we want to go down.

As for compiling the binary somewhere and copying it to a different
environment, we have build containers for that, and I don't see how
using buildroot changes the problem.

~Andrew

