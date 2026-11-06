Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78557606A333
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 18:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=HZP/8nwx
Received: from list by lists.xenproject.org with outflank-mailman.1477246.1682876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPOJc-0006Uz-FD; Fri, 06 Nov 2026 18:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477246.1682876; Fri, 06 Nov 2026 18:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPOJc-0006Us-CS; Fri, 06 Nov 2026 18:05:28 +0000
Received: by outflank-mailman (input) for mailman id 1477246;
 Fri, 06 Nov 2026 18:05:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xPOJb-0006Um-31
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 18:05:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPOJa-000d5v-Fw
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 19:05:26 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aee16dc-2eae-0a2a0a5409dd-0a2a4508db48-6
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 19:05:26 +0100
Received: from [52.101.56.18]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aee16e5-f659-0a2a45080019-346538128b1b-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 19:05:26 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5219.namprd03.prod.outlook.com (2603:10b6:a03:221::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 18:05:22 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 18:05:22 +0000
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
 b=PTy1QF2N/CMyNLI5BcIHtwjnVjCHdORl0+eg9d5J1sl7q6ZafRLJyT8uGZFhgnLPOFiF5b+xJYo4+cHQOb+nvQLBgrOl1jQ2VCZImkTtmDe/SSGEUnDcwz0AqLGWH70Ou96nCfskB1wq6MwjOi2q0VkAT4SZL6c/L7W40hzafzGSlSGhTX1evL6nvrh5Kxo4NwPDPT0RqMm44AM3inQE3VmtFHmUmZQikwxpAL8OmWZLHprZqWvUSNJLTdkHS3HJeDln+E1bJidDz7/xO01rPYUu6gtA5duV2a2JbaXdKFxHNGnUXSi0I/vRia4cfa1Cc4exOE4vqBU9RJ78cosUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxCpIwpX7U2nCSkPP9SZbTWTqOghYojuYb1/CisydMk=;
 b=opJ9I6f8yXDLd7BEhkGIEYe3nj6gOZ0JW+cZ0VWJYabbhHnbqILh31z8kpN2OwDU08dG+hNZ0Xmbqr/Z1TplAR5U0Do7iPtTSqnAKITxgUctYt9hacOT3JPrt8zcpL4JV8iMSuYwQeAnuKVveKF5L0elVbIhV7RhW7LMoJHCth1cpkcp2h/drdbZ3a0QSKzms9jTL2+6vhPLV82qu2bJh4OQa96NJM2L5mSkX7PmuA+OIvs8QTXHDlnhH+iVI+1EKNLlufJMb/VHWABGO3cWiuz4N/WFipbA3K1+ooo7rdOfawmf2XxYCfgjErHviY5j9F8kuBAVB0vHdUlDRk4uRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxCpIwpX7U2nCSkPP9SZbTWTqOghYojuYb1/CisydMk=;
 b=HZP/8nwxMeT7GD2wWWndDGncyIh3yWJJSwEvfQ+v1HIrqPhVdPb23GyDdOnNSrzLJZWqq1IN7Fu6Vf4pdbcarsBQy5yd4myO6Hi3fUOTVU2kNSbQ9nYrBN5U0gp/inYoihW2E5v1Mru50JFu64bavPbudTV9F6TRFixKh13Qp2c=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <86bf2afd-45c2-46a4-b367-65c546b0af38@citrix.com>
Date: Fri, 6 Nov 2026 18:05:18 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com,
 jbeulich@suse.com, roger@xenproject.org, teddy.astie@vates.tech,
 dmukhin@xen.org
Subject: Re: [PATCH v1 05/28] x86/hvm: cleanup svm_create_vmcb()
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-6-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261105013347.719392-6-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0253.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5219:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a62e02-a9c9-4812-2d2b-08df3c308673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003|261021121427099003|261102123227099003|261022075727099003|261021135927099003|261028144727099003|261022105027099003|261026140227099003|261026121527099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	iFRi3bLBRRI9Ebp6jKPEC5lnXuySkCUUtDxLmAu6lybh32mZCxoGtO6kwBr1SX8fCfcsq5eQn+2RGoPZTEEjAV5lqZ/tEIiMCFD7sSxjUhO6M++lvlM9gVRRkwls+HFJeVRorv4Oqf1QES8Vs2bJYdX06tLbz9WHfvgezhgL6wtcESweG1VlW0NrzXjnPRD0XJsy5PzWtF6UP8npfMq7xQDFuoqHnGj9hM9SAu7ydvn8rlHln+B759hy+nMjShV5PSEyqmKTiCwbsxmmMw2CCyl2+79WyotEQVNN0hr6S13fJLqU1J1UBPoKPQ+muBkTGqb2qK/xicx8aEfGftJnKiYxzB/WDekAAH43nu0aCMmuu7HjYkre+fuJ018ZHCpSWp/UuCb/gL9/zEd5x/+qjrWnaqL7Pl3zd6DPbX3aZo8PP4yefH8FVpzboiHL/g5y9662aZ8M2v2LTMlPGUT9m9pZGA44WJPPsjUccFSDWF9RoDtXvnoInKeouvqG4ppR5pn9NdsO8T8hhfarOGOOSe1av1k8qmsmG1vCZ8awwPL+T0BuKcw4GrqbGDHtmy9NAKQLxp8OHXj4rgFNwBK9Kkoer7qF2PxWcMFLMhCGvak7R0M9OB+hsCoXUNzNkzdFcpJDjNOV/ktyzO3VXanTFOJ9newRW3PzqWQKZTcOl5w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261021121427099003)(261102123227099003)(261022075727099003)(261021135927099003)(261028144727099003)(261022105027099003)(261026140227099003)(261026121527099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzFFTHQrWVZhZVFKTnBIUHUwWEw1MGdZZkoyZTVtTEhCK3ZHVFdRQzJhZG9p?=
 =?utf-8?B?dmJxbjZHTHpvTU4reUlaMW0rZGx1ZHpZTDNzSFJtcjdaeWRYRHYyN1AvVitN?=
 =?utf-8?B?cDdVZzlTOFFaYWxtTXI5RkZqUTU3b1RxaXY2NjFGa3JVUklQVzg1YjZ4eEFr?=
 =?utf-8?B?NE8rZkRIU1BqbmY3SE9PQjY3WVNiN2dNMk9NWFNyNmQ4ZXh6azRGRXV0UERZ?=
 =?utf-8?B?NGtCc3NxNnQ2cGNFSDI4V2dCdXc0T21zdUtmQ2kvaXEyRy9VY2lnR0Y0RkV5?=
 =?utf-8?B?QXpINXRNaUY5ZHFRU3FMK01pTW1ZRFpFSmV3NHJaTWFEbmdqRWxON2hCbWky?=
 =?utf-8?B?TUZ2Y1N3VHlZU3JQampJb3UvbEt4YWY5dnNzRC9sa0E5V2psRlJsaVlxZkd0?=
 =?utf-8?B?Znk4RGVLL1NJMnBkRS9lM1pSdStaRmpJWlBVdFBrVWlIOU10UE5QMGJrZHJj?=
 =?utf-8?B?M3dVa2w5WUswQUgxRjVubVhSYk1teGlEek4vWW9WQmM3TVRValBDNGkxeFhJ?=
 =?utf-8?B?UHlPYUpkd1hrNjZYZnRpNTRubXV2bnNhRFZzSGNIT2pFRWNhUUZaVHdkSHZz?=
 =?utf-8?B?c1RDYzlxNk55aHZ1WGZCY3huaTBWT1Z0dnF2Z0Jkeit5VStEdkkzNW14RHM3?=
 =?utf-8?B?c2lVZHc2ZmhQZHNoYk5jMlJxRjFaN2hQSEtSZ1dNK251N05yLzFmVXE4UXlo?=
 =?utf-8?B?ODd6VHlSNHA1VzBaTnduWklvMWZWMktyTEhRT2didkpEKzF5cW5oYzhlbVNH?=
 =?utf-8?B?dG8rYUNGY3NZSjRydnNEWGxmci9lQ0FiNU5VV1AyVjhGMk9UZmw5VVBPcWNB?=
 =?utf-8?B?RGQ1bUlsV2hmTTdBSWJhQlZLZjlTUTIxTU8vVWNoZHNuTGNZSmoybURPOFNs?=
 =?utf-8?B?ZFNrT3NEOFVqWWdFRHB1WE9ZbmxEazlSM2cvYy8rZDROOCtvZkk4Nm9jS2hy?=
 =?utf-8?B?VTNCdHFoSTk0T2djWUpsVVlxN210elI2U1AwK0Q5cGJIUDg2QmdLa0h5c2ta?=
 =?utf-8?B?ZmluTUVKR2c0bDBLcW1CYlIyUkNWZmFhbm9oQzJmNmlpWTE4c2pYeXhmQjBu?=
 =?utf-8?B?SHBaVkI0bTZpYzcyRWlrNGM5cHROQS9udEpCNU5CZXovOVI4clZ5dEhNZlBh?=
 =?utf-8?B?WHBORFQyT3BONk83TWExdU91ZU1NTWRmOWozOFhUL1VUYjBTNXdXMnF5bWtp?=
 =?utf-8?B?NnpzbXJpZkk0bFl6bmRkbEllSXVITTNaM0VWTzRXYXZpOFhEMmZ5aG40Tkcr?=
 =?utf-8?B?aU9qaGZNVFRhc0tWV3pkOGRkdHBYdE9TbXN4WGxOSmIvTkZoaDhKK0ErbHdn?=
 =?utf-8?B?ZzR5eW9iM2hWbFVTcUNjTHBkNE50TVA1eThubHFwdzNUdkdCUW81Z2gralpi?=
 =?utf-8?B?Tm9YamFPL1czUHI4M0FNRGZGSDZBRkI0NTNtZEF4MXRQK0k2aWs5ckJxNmZ4?=
 =?utf-8?B?UElka0Nna3FZdmplMkY4UFNQUTBvSDRoS0NZRmxkU3ZXK3pqTWZoQStDWnVB?=
 =?utf-8?B?cnRlMk1zU1JXbGRHcFBsakdsdWtIN0N2QVQxV21FUlRLaVRYaEdrbDRjcHFH?=
 =?utf-8?B?Qit5ZFhyNzZjdmxsQVpNc2p0KzRybFBpSVREamwyZnM4OHBwV0VaK0QrOWZk?=
 =?utf-8?B?R2RPY3Y5Yi9nMndNNE8xOS94ZmJvQnV6bDB6TjV1ZVRPSDAxazA4R0ZTNzJ4?=
 =?utf-8?B?eUlBNHVqM2VnNjdFeGlLSk54akxIZ0JXcXRPaFF3UCtKSlZublJGR1ozTlVN?=
 =?utf-8?B?dmZKQnQ0M09VZjMvNmRMT0ZVNWlCR29EcCtvVThmUDFKMGp3Wjd1c09nU1Jj?=
 =?utf-8?B?aTFFTlVva08wNDNLenlnTEd0anZicngydXYzOHhCSmo0VFlFRE9TRXFrY1kv?=
 =?utf-8?B?RFhNVFhVM3p5ajNBNXlONmUrNG9VdmlGaFZiL1VROHJZWE8rNitCV2drZW8w?=
 =?utf-8?B?eUxFYllJaFlIZ0pKUldtWDVWYTREeml5RlRqMWVwTkFvaUw1Y1NKazhZYkkx?=
 =?utf-8?B?aXdiOUoveXh3OHpKQUVDbnJhdFRxMDRwZDFKZFRGYmh3dGNOenh6by9COWFR?=
 =?utf-8?B?bFFiSnFXOCtUWDZYQXIxVUJpOGtNaitCeHBJeTBGbmNPb2hUTmhEaGxJWlFt?=
 =?utf-8?B?elBRZjVrbHd0T3pVOGpVU3NTVUNtdXE0dmplcExnQm5EaDErMmdIdUdtb251?=
 =?utf-8?B?akd3ZE5HVUNqVlpSTFl6b1JnMU96d2ZZNjBHWXJ1QUJSK2JaUjZRZ0tTUmpO?=
 =?utf-8?B?WnhReXpZVnZMeU0venZkVnpoVW9JNmx6SDNlNWl4U01CbnlWdStiWlJzMFp3?=
 =?utf-8?B?eDh4K2hCOTdkR1NYSEVEa3pYaVVXYkVTeWR3Zjc4eTRtaEhuQ1d2Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a62e02-a9c9-4812-2d2b-08df3c308673
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 18:05:22.2421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qG/Xrs1sSGGGfG+qGefomvB3wbVyRF6OiUVWfl95+PTLh/Mufgxd35LwZMAeH6D8d7yJflyJaf+iUYGiNpGdwjBRHFIVOEbEGVuFEAUfVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5219
X-purgate-ID: tlsNG-c1860d/1793988326-D7B5987B-F566A01B/0/0
X-purgate-type: clean
X-purgate-size: 1790
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/11/2026 1:33 am, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> svm_create_vmcb() does not need to be idempotent because in case of
> failure caller must call svm_destroy_vmcb().
>
> Simplify code in svm_create_vmcb() to account for that.

This is more complicated than it seems.

There are two paths which need to clean up a struct vcpu:
1) The domain_kill hypercall (i.e. clean destruction)
2) A failure within vcpu_create()

Nowadays, both vcpu and domain create() end up calling back into the
relevant destroy paths.  This is some work I started a long time ago and
never managed to finish.

We had a number of memory leaks because each init/create function was
required to clean up after itself, and several did this incorrectly.  It
was also wasteful because we had duplicated cleanup code.

At the moment, both vcpu_create() and hvm_vcpu_initialise() will call
the relevant destruction path.

In the future, we want to remove all the create() error handling except
from the top-level, because that removes the duplication.  However this
is a large task and it's the common/arch boundary where it gets
particularly hard to organise safely.


Anyway.  We can take this patch with an adjusted commit message.  In
particular, saying that the "caller must call ..." is a hope, rather
than a clear statement that this is how the code behaves.  I suggest
something like:

---8<---
svm_create_vmcb() does not need to do error handling itself because
vcpu_create() handles this at the top level by calling vcpu_destroy().
---8<---

But, if someone has some copious free time, it would be nicer if we
could do this a little bit wider and make better progress towards
removing the create() error handling.

~Andrew

