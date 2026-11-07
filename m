Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105DF606D815
	for <xen-devel@archiver.kernel.org>; Sat,  7 Nov 2026 01:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=f0mdwwia
Received: from list by lists.xenproject.org with outflank-mailman.1477700.1683030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPVVP-0008Us-AQ; Sat, 07 Nov 2026 01:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477700.1683030; Sat, 07 Nov 2026 01:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPVVP-0008Ul-7k; Sat, 07 Nov 2026 01:46:07 +0000
Received: by outflank-mailman (input) for mailman id 1477700;
 Sat, 07 Nov 2026 01:46:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xPVVN-0008Ta-LP
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 01:46:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPVVN-003LuQ-2J
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 02:46:05 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aee8287-e002-0a2a0a5209dd-0a2a45088960-44
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 02:46:04 +0100
Received: from [52.101.52.18]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aee82db-f659-0a2a45080019-34653412c099-3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 02:46:04 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM4PR03MB6912.namprd03.prod.outlook.com (2603:10b6:8:47::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.10; Sat, 7 Nov 2026 01:46:01 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.010; Sat, 7 Nov 2026
 01:46:01 +0000
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
 b=y2WRxNeKEwHWk2vGMcVxYppMmXfbOkRaWUBsOw3HQNfSftOUHsOwq/sstwsNJ9MMmNOVBxeaLoLQXJxd4oFwQszVhdf3b7SXHgM/lzE7WVSwwEc5LWOawz1F4W6LVGbanRl3F5OzqKBlvEl22J+M6Bzq3kraGyqoYZIDky6VXzKqU6B3QrSqWwtWZvmjMhQL4QZzCDp9OuhDAWvkf+8jCMeUFLHzLYhXFJ9BbVw18TFQ4XLoZlhpTfp6zKxoPHNE49wYEmfp0aVEKCX1OdPTzmbnLfVvV1/ZxCqiVFPI8p8i2oCMFPfPdhQH8T9lJKIrAgiZThrFEsBmyD3fHwZGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQb2UfympbJStZrL99ocu8PRu91zA7497mY5UtYldHc=;
 b=XmVdrZvZfJxPx2qAFV+BAAGgcKthbY7Lg9IKNv25kYqqwR9Pw3cp6MsaMC5kNR70P0MmLQ1TFim6qnXimpZF+aBPc2cdJ3YMWrzlr+CiArjUD13xQPYMi6XGP87Kmd4cK+C9jIohy4uDZWdv9ROUPs2rRTM41sDFL/2AlyAgOoLbJWPR/pb8EJkT+j9CdECXLqDiPapV6DIyorUShTw0tYMJonzOB8/BhDuDuBwLKMMzCGdbljacuV1cRThn8JlDzrnZp49Dc5NukBk8lv/PuWpWFRP0/xan0YbmKGntxpu39wCKm05oabTfqNLRWtSkpPVu0QBSE5DH+M5QOPDyFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQb2UfympbJStZrL99ocu8PRu91zA7497mY5UtYldHc=;
 b=f0mdwwiarsYtCNO9iMszwMeDNqcb9PRoSGdWMg8tFonjKX1/5KHPvgru5bIgfIOssGstid10uCGomcYhg3tKbJAkkT8L5EtHmFWob14czsHIWVZloSL5gmWHGpWooDgam9i8s6ppypg2rIiUqz8/cWupvc5pNqZZ1Wm5nJN9PZg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a0341ec6-aaa8-473a-a28c-ec99a7b79b67@citrix.com>
Date: Sat, 7 Nov 2026 01:45:57 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] tools/ocaml: Fix cleaning bindings test
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20261106231732.482518-1-jason.andryuk@amd.com>
 <0037995b-dea1-42d6-85ac-cfa7719762a3@citrix.com>
 <936b4d91-cb3c-4be5-9945-4c150afbec3a@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <936b4d91-cb3c-4be5-9945-4c150afbec3a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0066.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM4PR03MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb96fb3-faff-47ff-9e21-08df3c70e0b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|261028144727099003|4143699003|261022075727099003|56012099006|261026121527099003|261102123227099003|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261026140227099003|6133799003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	YddJXeO0AHw+0ozAw/aRkz5fQPX9nRt9PFFcLhlfku5HIXEZn51s6XKrz4HLGb13NS4WF/F0dE76axN6EgFlJ6wCClU4fPDqyt1zNlOLh7knG49O++NJtCtEXGVXbRL79/3ipCGml8QLsZ2pKtE4+76aq/upov6jibcREF1Gx6u4gOxTP0LSL41aSLvmshbqK7EOIZVesHDGlwmLdLZJO4PdWoqEQs2eAbnaTFxPUvzkuo588UI8vwmT16ZGwEPJDmZJfujWNNbCshMmK/t5e51t3FEUvWzMP4rRM6YzNJ7mkrn4L+fVhk8eZZeTzvXMhZx7HZTWWGrWHiuot/fFkMutKmVp8udMX/s7Us7/67+LaIQE+I6eD34eMGZtzNHtH3UOzZfbctWOmm2SSqC7TRAuuRCUNbpCP1NgvpDB4rs96Docy9zo/dGAA1jFi9/gY9if+hHscB2XvOjfkNHKdJM2X9NANXcNQXDR8HMfB/eCjTye8oUqv6C0LFmsqmsGD6n+ePRiiuZuZw5UOj6MT73aQfOhSvpWvxu7AU+o/QFB18q3cB6Wv6PXfn5eNvzBhQcyHfTdasEZLHnNCigo4xjhlNz4ia0hDBACuHHsvFQcL7amZjcpthJMi5SnVt0nkI9o/CgJfpxT+A3UwZHh1wkNOVXjM37hcnav2kriq7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(261028144727099003)(4143699003)(261022075727099003)(56012099006)(261026121527099003)(261102123227099003)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(6133799003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blRxcHV6VnYwdWk1RzgvMjFkUzFJazJxc3IzRWdLellDd281ZjFUbG44dExZ?=
 =?utf-8?B?K3hBaEJNS09aZFJoSXFUTXoyWmk4cVZGRjZ3ejdoQ25FOExLQWhEZVZRSzBh?=
 =?utf-8?B?WHFaSDZ3TCtFZ2x4RGUzV0MzaExmOVQwUUR1Q1F4dFhpcGRvai9EMi80dzY4?=
 =?utf-8?B?YVo4M0Rjb28rWERMa2V6aEgvSjNJczNkTWRoYUlZOG1RdlJoVDgrV0JTNlVi?=
 =?utf-8?B?Wi93cVM0SW5CWWtuSm05dVFhbHRwR0VmMTJLZEtiTkFQKzA0OERCY0NmTEQx?=
 =?utf-8?B?dndlWFBnNVJhQmxKcVljd2V4Wnh6Sit0VWJrZW9sNHNCcWdocWY0U2VTNDNL?=
 =?utf-8?B?Q1pUY01seDVrWUFzZXFxM3JiWFRKWkNwOVlUMFROa1ZWWDJOR3NvTXZ3VUEv?=
 =?utf-8?B?QlVsTGo2NnkycU41Y09DNmpNazg1cXNvSEZ4emEvbVcxQm9nNUVKeDVmb0hC?=
 =?utf-8?B?VjZBNzE4Sm5sN1Q4bHY0d3hzOTZKTjNlcmJwNFZDNnpTWjJZN05RSUhic2Er?=
 =?utf-8?B?aEM2TmpyZ090dnZMckljM1F0T2szSDQ4MVJFa0c3NGN2N2EwMXQzdENjVzBQ?=
 =?utf-8?B?dHh2UGNKeEcxSDJkQUJWUHB6U3dFcXpGTDJwM0ZFaVRiODdlVTFQQ3BQOFYw?=
 =?utf-8?B?a1h2Wmk3cVgwa1MrVW9XaFZaTXFySzF1QjNQdHBTY2ZDN1locVRRSHdzNlo1?=
 =?utf-8?B?WDJaMnJwUnVyTitYOFVQNFQ5L1lqdCt1cDRoeWtYZlNCeVlhVVMycW9leTNp?=
 =?utf-8?B?ejBVU0kzVVNPQ0tjTXlzcDlkTmc1aDd0UlhzaUUyY00xbjYxR3dVWHlwK2k5?=
 =?utf-8?B?cGJnS0NEeEpkeVd4UjN1eG1kOVRtTDRxYVNCNCtyOHNORGQxUFQ4My8zUm1W?=
 =?utf-8?B?N2tieVF2OWVpYXpzazNBSVRDMXFSOGk5a0w0eCtNcCtia0pZOWp2VHlqTjNT?=
 =?utf-8?B?Sm9oNUF0dCtKTFhQL2NBRXF4NldoZUJacHcrS2pTM1pMNjBqWGlidGxaM0JY?=
 =?utf-8?B?YVpqaXlkSHVrT2Vma2I5Z3NTcFp1WFlYVVl2TUd6NkRWZTIrNFk2NFA2M0ht?=
 =?utf-8?B?dWlFM1dIT2FnQyt3a0NTd0h4bXkyTC9FSU03TmZ1Y01ENG1UR00vbkxsZ3c1?=
 =?utf-8?B?SU9WVy9ZU0E3bHBPUlBjNHM3NXF6RnExL2JSWVhPdDJrNC8yZE14SjZTemZr?=
 =?utf-8?B?M2hzRjgrN1c2bnBzSCtuVy92emIyMzRTbTdUSWpLZ3AwekxZaGNaay9Bcjd6?=
 =?utf-8?B?akV5Nk5NV3lLUHV5aXJaeEhTejZIaXpQU1o5RXdnWlkyY1UybSs5eXNRcUVL?=
 =?utf-8?B?MUVRYS9td0JaRG5sNGNJL3ZyMFFEUDF4bEJvMHJFUGZEcm1LNDJLUXUzQ0tG?=
 =?utf-8?B?OFE1dUVkZHY2a1F1Y09aeDU2NXJOR2JkQzRmdllRSWszLzBJQm1QdlR4T29Y?=
 =?utf-8?B?anYyM2FRcXIzaHhmMGVNaERQbXpsRUx2Njd0OTBqQ3hPSUF5Wk1RSUZhWS90?=
 =?utf-8?B?aHFNb1FVSHEvY3NhWHNFRnVYYlp4YTJKbnNRdzIxSmhmS3FPclhLN3U0a0NI?=
 =?utf-8?B?ZzRWNHlLY2o0SWc0UE14OTVra1BhMnhDaE41YnR6T041eEJIN0dqT3VKanNP?=
 =?utf-8?B?U0ZmOVVWcGxlaG1FQzFrTTI1bVVRSWpWeklBdjdQc0tMS0tNeWRPeGdQV2xY?=
 =?utf-8?B?UEJxdS9OWVpNcWVZbTRvTklIaktmcDk5SzBURmlNWXlFZFBvNzhuNmlzcG5p?=
 =?utf-8?B?RDAyYloyT0pTajQveUFQeFlFR3JBMU8wajlQcHVhNnVRYzN6K291VGxaclph?=
 =?utf-8?B?L1ZEaDZGeFBic01XV2JweWs0KzhnNzE1N3pQbFczQThsWHRBaFpiRWxlSWU1?=
 =?utf-8?B?RkJPMnozenoyUXJNemJjTUpEbGpYbElMWlJ2YWZjRHVoWVIxbW9aZGlibTc3?=
 =?utf-8?B?UXhRVjhRTTlZcnZwREhmckFMYk1tMXFVdUNDN2hUYXduVkU0a0ZZTlBtZEhk?=
 =?utf-8?B?WFFoMk8zTlVhRjN4LzJFcjl3ajMvaGNwMmZyUEorV1dCMTM3MXE0eWdwNjZw?=
 =?utf-8?B?bDh3YjFWR3JORTVBeEVKVU9tQmdEaUxZZkR3ZDlubnRLR3JmM1M5eDVabTU3?=
 =?utf-8?B?Z3NkaWRPUXZUZTcvbmIyOXkwUnpweEtKSUQzckJUZjF5Rk9MZnI3UzR5REt4?=
 =?utf-8?B?SjkzTGNDcmRXcFJKdWpROUVUcStzODJEWm9XTVV0U04zZC9TTUQybXIzK3Js?=
 =?utf-8?B?WHBXWGJGSXpOcXNDQmZnd0t3M3ZXUGxncjFaYnp4NHdzK2lGU1JabGhhQS8z?=
 =?utf-8?B?MVJiWUM1VGNxb1VLOE1wV3NRb1JYc0d0VFJRL1BrS1VjbXZkbzZTQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb96fb3-faff-47ff-9e21-08df3c70e0b0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 01:46:01.4640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FV4x33nz6KzvbMxbjc4Zjl5THq+I+uIgduFCzSt3ujpV/Bu4oUgiOJIK9TCh9Pi46gpcvsIyS2qjpFZucTGfYpqw6gaO+cylMzUqsvnb3v0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6912
X-purgate-ID: tlsNG-c1860d/1794015964-CDF4787B-5075ABB6/0/0
X-purgate-type: clean
X-purgate-size: 1319
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 07/11/2026 12:11 am, Jason Andryuk wrote:
> On 2026-11-06 18:19, Andrew Cooper wrote:
>> On 06/11/2026 11:17 pm, Jason Andryuk wrote:
>>> make clean fails in the bindings tests:
>>>
>>> make[7]: Entering directory '/home/amd/xen/tools/ocaml/tests/bindings'
>>> rm -f .*.d *.o *.so *.a *.cmo *.cmi *.cma *.cmx *.cmxa *.cmxs
>>> *.annot *.spot *.spit unix.cmxa -ccopt -L -ccopt ....
>>> rm: invalid option -- 'c'
>>> Try 'rm --help' for more information.
>>>
>>> Split the compiler flags out of the LIBS variable, since LIBS is passed
>>> to rm.  The individual *.cxma files are deleted in their respective
>>> directories.
>>>
>>> Fixes: d97847e858f1 ("tools/ocaml: Gitlab CI test for bindings")
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Lovely...  Sorry for breaking this.
>>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Thanks.  I just double checked and unix.cmxa isn't in the directory on
> a successful build.  So the whole thing could be moved to LIBFLAGS or
> a suitable name.

Unix is from the Ocaml standard library, but you still have to name it
to get an executable out at the end.

I cribbed this all from tools/ocaml/xenstored/Makefile attempting to
simplify it as I went.  What's not clear is why LIBS is a special name.

~Andrew

