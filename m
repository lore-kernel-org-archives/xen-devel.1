Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DE3606A319
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 20:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=rmXSMKdw
Received: from list by lists.xenproject.org with outflank-mailman.1458594.1670736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJzqS-0003VQ-Un; Thu, 22 Oct 2026 20:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458594.1670736; Thu, 22 Oct 2026 20:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJzqS-0003VJ-Rm; Thu, 22 Oct 2026 20:57:04 +0000
Received: by outflank-mailman (input) for mailman id 1458594;
 Thu, 22 Oct 2026 20:57:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xJzqR-0003VC-2Q
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 20:57:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJzqQ-0088Z5-5a
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 22:57:02 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ada787f-e002-0a2a0a5209dd-0a2a4505d682-24
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 22:57:02 +0200
Received: from [52.101.201.27]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ada789c-4cb1-0a2a45050019-3465c91b4ee3-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 22:57:01 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB8247.namprd03.prod.outlook.com (2603:10b6:8:28f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 20:56:58 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 20:56:58 +0000
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
 b=sBjNNwx0K9kXKsekeq8s1sPn2Zc44IscJUdu3sGEqNWiZKtZNKg/2sHMq41KYcsLZBqND3NzXbQMf+N9c/c7Er8pSbr/xHQn41MiEw0L7vHlCWQdizExIK3FSTQRA9fpfk7KhSwlEHXqz+QNhqdH4kVAjXbxzW3pKdriSijShav1ugIPiSNSslE+aJve00/Dwquox88KmWabUG1OpeSWqvCbYfKkySBKPE8yLoSKfqPU0Aymtsf0EDRIXLRprpDfNkVzWIo8BTrS+EyqcMItNry16JFkfE2XLsz8uT5t6MQx2pVwAq2b9pTkWcfZVl7Pe8p143ypc0fNl/mmQVnMQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/9kfvwLGOVAuL1tPWOAwcPE1tuUAOUGOL6Hpgau6mc=;
 b=d5mvxavnB81hsplg9GHzfp+L3kkz1+zVd45Oq46aJMNPeM7hhGoQjeHhYl5s8LH3Xy8M3x6CSEAPXuf/tizi4f/F9GMgms3G+mUQFnmty8Uwrey+63zbMu6rgbtJFKj76q/GQyb9eZ7BZ9WPKPNeGLui4hr2H1R/YhnvIw81vfcbFMHlstBo4FxBrFKR/1ify9Ikjb8euYaBG4IgYiOlgYDj2rpMbwM3jcSnM1de1iEYFjLJOV8hRS+BHZ5kxKVr4wbBuUXGAB2cQOaRjZH0ATVhBxOZ7urk9zDDLhXb/3exvrezu10SBsjAOmQU4tC/uTc7KZmqRVLTbZMHHwpqrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/9kfvwLGOVAuL1tPWOAwcPE1tuUAOUGOL6Hpgau6mc=;
 b=rmXSMKdwOxjXy4jaUHTsltqlSdAc/IHDtZGeWIPzTVawkqc5IKUb52RaHOPQlIoY2p7zPy6P4xLRagPmTOyZSTsdZtR1GgW+gi/aIsDNjxFVKdgZ7xUVejnksxmKaIwq2sco8s5m24xi0p82iT5p2ruGecK5AFAq9aohgtlXzrw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Content-Type: multipart/mixed; boundary="------------CzIthXSbkoKnLKBhJCV0jcHQ"
Message-ID: <9019a85e-c121-4d21-95fb-078765e0c3d8@citrix.com>
Date: Thu, 22 Oct 2026 21:56:55 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 0/2] tools/ocaml: bindings needed to build ARM domains
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <1792679039.8631fc262581453bbf619ec5b2062170.1a163ff5306000f79f@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1792679039.8631fc262581453bbf619ec5b2062170.1a163ff5306000f79f@vates.tech>
X-ClientProxiedBy: PA7P264CA0225.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:374::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: 6922f19b-ac09-4f59-8003-08df307f0339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|6049299003|1800799024|23010399003|376014|366016|6133799003|18002099003|22082099003|261022105027099003|261022075727099003|4053099003|11063799006|261009223027099003|261021121427099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	x1CkoOiH6S7botRxR1JWAWGT2atD+yFBsf0Gj7S/AUQ0cKCTEiketlqPDkSgPi0RrCkAGmI0jvQFTzCadrgu9adZQHJM0Yu4WbF2Zf7ze6ZiS/XihLqCYu6V5srEc6ILlTFKnsJVoD3U4RHjJB97VTm2pldJrsyaKkSEMLu5Oz9Teq72jc5fSjw130EcNzNcnYnjhttqnZaN8kRFCr5mWNw3GtRo0z6yEcbbBqfCgqLaAo09YTuuXJAzWiH1L/UPPaiW5Vb9eLk+2Wvrt+y5hfF8jIs5l/IkunpdP5jkwLxSl3beoClzxJ+0Xoe7IbIFOAnZUxh6xs1U8vB7sidQQJqukqbeGE2Ps7EpCRfs2ejad6ghYUErxte8f7mE08+O338Oipbz8iC9haSHLb7Xdpm5oSNqgtWEiMvR9quIuiBgVSiOqp7XdflEQmSRExhArMQ8QQmQ5TgowaTmWI4O9ppzJxfWH8glBys9lO5M7nvWNKpSNx0JJ5/28a46wqjHQVVc4OAkCNIOg5AatMRU/XVFRLtJ7q7On967szLSFTCuObKqP1KxLTx4E6jwe3wAUeS9dCiDjqSU+GorP7Ps47XHKnYhEtJbcIjirJtp5sNPj9Jd/1uP/T06KvB/9dNNsP8LJpMnVMdTRS/pD5HMBVgowdRwTT9IGG41H3yKQhs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(6049299003)(1800799024)(23010399003)(376014)(366016)(6133799003)(18002099003)(22082099003)(261022105027099003)(261022075727099003)(4053099003)(11063799006)(261009223027099003)(261021121427099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2xhcXRFdmhPc29HYTAwNVZTVm8xdjd5WnhhYmE3RFBnbmU5WUxJYzNNQ09P?=
 =?utf-8?B?ckhINy9YYk0xRCtMZHd5dGd1dW5XbHQxQnczQVpUVU9mSEdpQkI4bHhEOW1C?=
 =?utf-8?B?OGEyMWR0M1JxZlY3Z2F6aTVGenJTNnNrYVBDekV6ZkpiL1VvRUI3Q3ZUcGE1?=
 =?utf-8?B?eWZ4cjlsZDkrS3lSczhZSGJtT1hqZkI1WktJWVZrOEtoV2llZUQ0djRQV25C?=
 =?utf-8?B?U1g1SmQxSHQyUVpxUGtCbVhKYmxQSkp6bnYwcjJobXoxa2FaNnNINnlnUWxx?=
 =?utf-8?B?RE5pazBvdUdPbDZvb0J2L3RCQ25xZ1JnWTNzNnJEcWlBbGc2V0JzVTZlRzhG?=
 =?utf-8?B?RnIyeFIzNTRwM212TDcvZThYRmM3YnNKTVZkUlBwbVhBZ3l3Tnk0UTdhcTN1?=
 =?utf-8?B?MFpsMUdNZWN4RXR3T2tRU2ZuWitab3hQWGQ2NDFDY05mUDk1NHk3TytBT05j?=
 =?utf-8?B?WS8xMFJ1dDRqSkRxOTFJMHN1ZzFTNHByYmxOb3RPNGtGcW5NbVZZU0I5OVBt?=
 =?utf-8?B?aUxXL2Fldk5GS3ZPNmxYaUJhbDR1NlltK3lEZG84TDFTekpEZ0NOZWNJTjIr?=
 =?utf-8?B?ZmJ1UGFTREUyV0JMb1NxRU1Mc1BFbWtUelFWOGRRbEFmU0Z2Vy9WNE1SZFhS?=
 =?utf-8?B?WHFPeURLZEQ2TE5helcwL3dla3N2a3UwKzE1cWU3Y0lURWZVSGVmMzE2Q3M2?=
 =?utf-8?B?QWhsOEJMMjVjNlBSb1ZaNWlvRE5tSHhLTDFJUlV5QUN0ZW9HUjkyRnRZeStN?=
 =?utf-8?B?M09WN1lMVVhFUWU1c3VRV0xub2J5cE5oQUg2SzFxWExJeExhdndWVUxRL2Uz?=
 =?utf-8?B?bXQ0cWRKNStqYmlEUGwzU3NFNHRPUGxkellaamo1RkMxYy9OMHZabGU4c0Ew?=
 =?utf-8?B?TkJSZXl1SzJNNkZRN3R5c3FBblFLd1BiQmNZc3o0TEUxM2ZzUTFBRkdpR3dE?=
 =?utf-8?B?SUhCSVlUZ0JtNzVDTENyTUJtamZHMm1SYUxISHdyY1ZlYmsvN1o3THUwUzlj?=
 =?utf-8?B?YVBkWlVZUlZmNkFtYWdvMGNtaE52U0JheU92UExSekdGQTJDNm1LL0NHVUl1?=
 =?utf-8?B?R2s2a3NKZXpVaUxza3VwN2FpaG5jaGJaS0kwUkp3M29qQ0Mzc3Z2YndPNXY5?=
 =?utf-8?B?WUZVNi9JSjlqTUkydTROdWpqMytEMFZuOHJQMUNaclRNQ0hLWEZ6eTRqQm1a?=
 =?utf-8?B?REk2WS9mS0hwd0xIL0N0Y2VjWVNPNXZ2a0U2bFYvckdYTWF2R0d2bnB2ZDBY?=
 =?utf-8?B?aHRuQzZueldRWC9CbG5SVzJEbFErMnJJMWoxaDlOTCtiakt4SDZBYTZzTUFa?=
 =?utf-8?B?azN1MkJGWXFwK2RGeVNVOVJlaEl5RkJLQll1amZJc2kxMzYvSThSWnlIMUlW?=
 =?utf-8?B?Z3RKakptcmczQW1SZXZUZVY5Vlh0UExhbU1nNkpKRkpORkZ3RlNJNTF0eEJR?=
 =?utf-8?B?MmZIUHpjNkFRUHc3M21ncGNON1Z6dG9tdFhuSkFPaDdPZ0F2dGFPR1g3SG9Q?=
 =?utf-8?B?RFNFeFBnS05aWHB1V1dVVXFHMVRYQXF4VVNMVytwOVh3MDErVnlTOVl5emYz?=
 =?utf-8?B?UXRTNzFmL0RHYklvU3hyME5NbW5OVE1vcEZKSmg1UGNneHQwdzhvT3Y1dnpX?=
 =?utf-8?B?bXhOUmN2dzFLZmJUbndTbmhMcGpiYkNrZEFYTmZ0Nm1nYTJVeU0zT2s2QnJV?=
 =?utf-8?B?L2lTNG9weklCNnpCZDR4OFVjOHNWdXRrcG1WS0VCUWI1RXhMa0V6czJTSGZl?=
 =?utf-8?B?V1lSTGZNaFlrcENjSVBvcXlqMU5oRXQvcVYxclBqckZya2lDd0pkT1g0MmFV?=
 =?utf-8?B?THduTGIxSmVEK0N2ZS85ZmNhUjZhUVdMc21GSS96K3o2NStQRFJRZm5icS9i?=
 =?utf-8?B?WnpGNFhpbDJTZmlEOUVKRHVHMjloUmdCeWJWZEx6SnI3SUgrU2poME8zb2VR?=
 =?utf-8?B?UmxSUTdWMjhPQ01UUFRMNnhnbG1TeHhoUk9tYjg2L09JU1Q1dnQzMVNGNzF0?=
 =?utf-8?B?VUNsUVR5bGJqWERxTkdKTVA5dDl1bE5KZkdRck5VQm13NG5kWU9uZWZWa2JY?=
 =?utf-8?B?eHFQeUg5cGZ5Rjl6cVcxUEQzZkhWblBYL1ZKdjhEVnJuMUo1S0VPakVUNUt3?=
 =?utf-8?B?ckMzcUcxUXNZWlJqZmJGVjFNTGtVbUZMZ3BXbVFHam9PWDA2SXh4RVA3NjdX?=
 =?utf-8?B?eit0dFIybHVsVmptbFhzWDEvYlZnc2R3RXRZOUpaUlM5TXdRd2V0azBTQkEx?=
 =?utf-8?B?UTFOcXF1ZUlXc0lXdVRFVmJ0aUdoSWRwbjQxbHl3a3hDSzZiS0lXVzRXbTBx?=
 =?utf-8?B?Q0FpYU5zL09XOFJZa3I4U1Ixa213Zk1LVVJKL2ZwZk92VTV0WGgzZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6922f19b-ac09-4f59-8003-08df307f0339
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:56:58.4866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSMKsyVMPf31Pao15HpoW0N+27n7677E0SHOEp1GLE4yvqgnbqszfKf8UDuWvjM/KTZ5wzXpZULooefcIqTDisx4gqqyukVMUGbVPiDj3gY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8247
X-purgate-ID: tlsNG-c201ff/1792702622-243112A1-0502BDF5/0/0
X-purgate-type: clean
X-purgate-size: 9465
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------CzIthXSbkoKnLKBhJCV0jcHQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/10/2026 3:23 pm, Julian Vetter wrote:
> Hello,
> this series adds two bindings that are still missing for an OCaml
> toolstack, to create and build ARM domains.
>
> Patch 1 exposes the XEN_SYSCTL_PHYSCAP_ARM_GIC_V2/V3 bits of
> XEN_SYSCTL_physinfo in arm_physinfo_caps. Since
> XEN_DOMCTL_CONFIG_GIC_NATIVE was removed, the toolstack has to pick a
> concrete GIC version itself. The OCaml physinfo stub only reports the
> SVE vector length on ARM, so OCaml toolstacks currently can't select a
> GIC version.
>
> Patch 2 adds bindings for XEN_DOMCTL_{get,set}_paging_mempool_size. The
> existing shadow_allocation_{get,set} bindings use
> XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION, which are x86-only and fail
> with -ENOSYS on ARM, so there is no way to size the P2M pool of an ARM
> domain from OCaml, as libxl does.
>
> Even though I'm sending these patches as a series, they are somewhat
> independent from each other. But together with the patch I sent earlier
> today "tools/ocaml: implement stub_xc_domain_create() for ARM", they are
> what xenopsd needs to create ARM domains.

XEN_DOMCTL_{get,set}_paging_mempool_size were added in a security fix,
when it was demonstrated that ARM needed such a memory pool.

A remaining task is to remove
XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION.  Doing so is another small
step along the big API/ABI rewrite, and these calls need purging because
they round to the nearest 1M in various places, rather than doing
precisely what the toolstack asked.

Doing this for the main C code should be relatively easy.  The Ocaml
level is more tricky because of how Xapi statically links.

I expect the least bad option is to reimplement
shadow_allocation_{get,set} in terms of your new
paging_mempool_size_{get,set} in xenctrl.ml, allowing us to remove the
older C bindings.  We can then move Xapi over to the new API, and retire
the compatibility stubs in due course.


On a totally separate note, when you reported the arm segfault
originally, I put together the attached patch which is a derivation of a
smoke test I've had for checking bindings.  The Ocaml part is definitely
not pretty, and would benefit from someone who can write the language
rather better than I can.

But, I think now is about the right time to put this in as a real test
to run in CI.  What I did was a gross hack, but in principle all we need
to do is install it into $(DESTDIR)$(LIBEXEC)/tests and it should get
picked up and run automatically in Gitlab CI.

What I can't find is anything which can truly pretty-print an Ocaml
object without some external structural definition.  To test the
bindings, we need to reference every part of them in Ocaml code (and
have it not crash), to confirm that we built the correct structure in C.

I can probably start by submitting it with test_xenversion only (to get
the plumbing in), and we can build from there?

Thoughts?

Thanks,

~Andrew
--------------CzIthXSbkoKnLKBhJCV0jcHQ
Content-Type: text/x-patch; charset=UTF-8; name="0001-CI-Ocaml-Smoke.patch"
Content-Disposition: attachment; filename="0001-CI-Ocaml-Smoke.patch"
Content-Transfer-Encoding: base64

RnJvbSAzNjgxMmEyZjAwM2I5MTE0Nzg0YWEwODYyY2M1ODZjYjFjNzc3MTE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgpEYXRlOiBXZWQsIDEyIE9jdCAyMDIyIDE1OjA3OjA5ICswMTAwClN1YmplY3Q6IENJOiBP
Y2FtbCBTbW9rZQoKCmRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL3NjcmlwdHMvcWVtdS1hbHBpbmUt
eDg2XzY0LnNoIGIvYXV0b21hdGlvbi9zY3JpcHRzL3FlbXUtYWxwaW5lLXg4Nl82NC5zaAppbmRl
eCAyNDJmZmNhNjkzZmUuLjBhYzMxNTUzYzgxYyAxMDA3NTUKLS0tIGEvYXV0b21hdGlvbi9zY3Jp
cHRzL3FlbXUtYWxwaW5lLXg4Nl82NC5zaAorKysgYi9hdXRvbWF0aW9uL3NjcmlwdHMvcWVtdS1h
bHBpbmUteDg2XzY0LnNoCkBAIC01Myw2ICs1Myw4IEBAIGJhc2ggL2V0Yy9pbml0LmQveGVuY29t
bW9ucyBzdGFydAogCiB4bCBsaXN0CiAKK29zbW9rZSB8fCBleGl0IDEKKwogeGwgLXZ2diBjcmVh
dGUgLWMgL3Jvb3QvZG9tVS5jZmcKIAogIiA+IGV0Yy9sb2NhbC5kL3hlbi5zdGFydApkaWZmIC0t
Z2l0IGEvYXV0b21hdGlvbi9zY3JpcHRzL3FlbXUtc21va2UtZG9tMC1hcm0zMi5zaCBiL2F1dG9t
YXRpb24vc2NyaXB0cy9xZW11LXNtb2tlLWRvbTAtYXJtMzIuc2gKaW5kZXggNWRjMzQ4YzcxYWE5
Li4wZGE0YzViOTcxODcgMTAwNzU1Ci0tLSBhL2F1dG9tYXRpb24vc2NyaXB0cy9xZW11LXNtb2tl
LWRvbTAtYXJtMzIuc2gKKysrIGIvYXV0b21hdGlvbi9zY3JpcHRzL3FlbXUtc21va2UtZG9tMC1h
cm0zMi5zaApAQCAtMjEsNiArMjEsOCBAQCBlY2hvICIjIS9iaW4vYmFzaAogCiB4bCBsaXN0CiAK
K29zbW9rZSB8fCBleGl0IDEKKwogeGwgLXZ2diBjcmVhdGUgLWMgL3Jvb3QvdGVzdC5jZmcKIAog
IiA+IC4vcm9vdC94ZW4uc3RhcnQKZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vc2NyaXB0cy9xZW11
LXNtb2tlLWRvbTAtYXJtNjQuc2ggYi9hdXRvbWF0aW9uL3NjcmlwdHMvcWVtdS1zbW9rZS1kb20w
LWFybTY0LnNoCmluZGV4IDFkNjczZjE4NDI1MS4uYzFmYjY4MTcyNDQzIDEwMDc1NQotLS0gYS9h
dXRvbWF0aW9uL3NjcmlwdHMvcWVtdS1zbW9rZS1kb20wLWFybTY0LnNoCisrKyBiL2F1dG9tYXRp
b24vc2NyaXB0cy9xZW11LXNtb2tlLWRvbTAtYXJtNjQuc2gKQEAgLTUwLDYgKzUwLDggQEAgYmFz
aCAvZXRjL2luaXQuZC94ZW5jb21tb25zIHN0YXJ0CiAKIHhsIGxpc3QKIAorb3Ntb2tlIHx8IGV4
aXQgMQorCiB4bCAtdnZ2IGNyZWF0ZSAtYyAvcm9vdC9kb21VLmNmZwogCiAiID4gZXRjL2xvY2Fs
LmQveGVuLnN0YXJ0CmRpZmYgLS1naXQgYS90b29scy9vY2FtbC9NYWtlZmlsZSBiL3Rvb2xzL29j
YW1sL01ha2VmaWxlCmluZGV4IDcyNTJlYjIzZDc5OC4uN2I3OWE5OWRmMjZiIDEwMDY0NAotLS0g
YS90b29scy9vY2FtbC9NYWtlZmlsZQorKysgYi90b29scy9vY2FtbC9NYWtlZmlsZQpAQCAtMyw2
ICszLDcgQEAgaW5jbHVkZSAkKFhFTl9ST09UKS90b29scy9SdWxlcy5tawogCiBTVUJESVJTIDo9
IGxpYnMKIFNVQkRJUlMgKz0geGVuc3RvcmVkCitTVUJESVJTICs9IHNtb2tlCiAKIC5OT1RQQVJB
TExFTDoKICMgdGFyZ2V0cyBoZXJlIG11c3QgYmUgcnVuIGluIG9yZGVyLCBvdGhlcndpc2Ugd2Ug
Y2FuIHRyeQpkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvc21va2UvTWFrZWZpbGUgYi90b29scy9v
Y2FtbC9zbW9rZS9NYWtlZmlsZQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
MDAuLjBjZTIzYzEzYzNiMAotLS0gL2Rldi9udWxsCisrKyBiL3Rvb2xzL29jYW1sL3Ntb2tlL01h
a2VmaWxlCkBAIC0wLDAgKzEsMzQgQEAKK1hFTl9ST09UID0gJChDVVJESVIpLy4uLy4uLy4uCitP
Q0FNTF9UT1BMRVZFTCA9ICQoQ1VSRElSKS8uLgoraW5jbHVkZSAkKE9DQU1MX1RPUExFVkVMKS9j
b21tb24ubWFrZQorCitPQkpTID0gb3Ntb2tlCisKK09DQU1MSU5DTFVERSArPSBcCisJLUkgJChP
Q0FNTF9UT1BMRVZFTCkvbGlicy94YiBcCisJLUkgJChPQ0FNTF9UT1BMRVZFTCkvbGlicy9tbWFw
IFwKKwktSSAkKE9DQU1MX1RPUExFVkVMKS9saWJzL3hjIFwKKwktSSAkKE9DQU1MX1RPUExFVkVM
KS9saWJzL2V2ZW50Y2huCisKK1NNT0tFTElCUyA9IFwKKwl1bml4LmNteGEgXAorCS1jY29wdCAt
TCAtY2NvcHQgJChPQ0FNTF9UT1BMRVZFTCkvbGlicy9tbWFwICQoT0NBTUxfVE9QTEVWRUwpL2xp
YnMvbW1hcC94ZW5tbWFwLmNteGEgXAorCS1jY29wdCAtTCAtY2NvcHQgJChPQ0FNTF9UT1BMRVZF
TCkvbGlicy9ldmVudGNobiAkKE9DQU1MX1RPUExFVkVMKS9saWJzL2V2ZW50Y2huL3hlbmV2ZW50
Y2huLmNteGEgXAorCS1jY29wdCAtTCAtY2NvcHQgJChPQ0FNTF9UT1BMRVZFTCkvbGlicy94YyAk
KE9DQU1MX1RPUExFVkVMKS9saWJzL3hjL3hlbmN0cmwuY214YSBcCisJLWNjb3B0IC1MIC1jY29w
dCAkKE9DQU1MX1RPUExFVkVMKS9saWJzL3hiICQoT0NBTUxfVE9QTEVWRUwpL2xpYnMveGIveGVu
YnVzLmNteGEgXAorCS1jY29wdCAtTCAtY2NvcHQgJChYRU5fUk9PVCkvdG9vbHMvbGlicy9jdHJs
CisKK1BST0dSQU1TID0gb3Ntb2tlCitPQ0FNTF9QUk9HUkFNID0gb3Ntb2tlCisKK29zbW9rZV9M
SUJTID0gJChTTU9LRUxJQlMpCitvc21va2VfTUxTT1JURUQgPSAkKHNoZWxsICQoT0NBTUxERVAp
IC1zb3J0ICQoT0JKUzo9Lm1sKSkKK29zbW9rZV9PQkpTID0gJChvc21va2VfTUxTT1JURUQ6Lm1s
PSkKKworYWxsOiBvc21va2UKKworaW5zdGFsbDogYWxsCisJJChJTlNUQUxMX0RJUikgJChERVNU
RElSKSQoc2JpbmRpcikKKwkkKElOU1RBTExfUFJPRykgb3Ntb2tlICQoREVTVERJUikkKHNiaW5k
aXIpCisKK2luY2x1ZGUgJChPQ0FNTF9UT1BMRVZFTCkvTWFrZWZpbGUucnVsZXMKZGlmZiAtLWdp
dCBhL3Rvb2xzL29jYW1sL3Ntb2tlL29zbW9rZS5tbCBiL3Rvb2xzL29jYW1sL3Ntb2tlL29zbW9r
ZS5tbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjE5MTA1OTNiMGU4
YwotLS0gL2Rldi9udWxsCisrKyBiL3Rvb2xzL29jYW1sL3Ntb2tlL29zbW9rZS5tbApAQCAtMCww
ICsxLDU5IEBACitvcGVuIFByaW50ZgorKCogb3BlbiBYZW5jdHJsCisgKiBvcGVuIFhlbm1tYXAg
KikKKworbGV0IHhjaCA9IFhlbmN0cmwuaW50ZXJmYWNlX29wZW4gKCkKKworbGV0IHRlc3RfeGVu
dmVyc2lvbiAoKSA9CisgIGxldCB2ZXIgPSBYZW5jdHJsLnZlcnNpb24geGNoIGluCisgIHByaW50
ZiAiWGVuIHZlcnNpb246ICVkLiVkJXNcbiIgdmVyLm1ham9yIHZlci5taW5vciB2ZXIuZXh0cmEK
KworbGV0IHRlc3RfcGh5c2luZm8gKCkgPQorICBsZXQgcCA9IFhlbmN0cmwucGh5c2luZm8geGNo
IGluCisKKyAgcHJpbnRmICJQaHlzaW5mbzpcbiI7CisgIHByaW50ZiAiICB0aHJlYWRzX3Blcl9j
b3JlICVkXG4iIHAudGhyZWFkc19wZXJfY29yZTsKKworICBsZXQgc3RyX29mX3g4Nl9waHlzaW5m
b19jYXBfZmxhZyBmOnN0cmluZyA9CisgICAgbWF0Y2ggZiB3aXRoCisgICAgKCogfCBDQVBfWDg2
X0FTU0lTVEVEX1hBUElDIC0+ICJ4YXBpYyIKKyAgICAgKiB8IENBUF9YODZfQVNTSVNURURfWDJB
UElDIC0+ICJ4MmFwaWMiICopCisgICAgfCBfIC0+IHJhaXNlIE5vdF9mb3VuZAorICBpbgorCisg
IG1hdGNoIHAuYXJjaF9jYXBhYmlsaXRpZXMgd2l0aAorICAgIHwgWDg2IHggLT4KKyAgICAgICBi
ZWdpbgorICAgICAgICAgcHJpbnRmICIgIGFyY2ggY2FwIGZsYWdzOiI7CisgICAgICAgICBMaXN0
Lml0ZXIgKGZ1biB4IC0+IHByaW50ZiAiICVzIiAoc3RyX29mX3g4Nl9waHlzaW5mb19jYXBfZmxh
ZyB4KSkgeDsKKyAgICAgICAgIHByaW50ZiAiXG4iCisgICAgICAgZW5kCisgICAgfCBBUk0geCAt
PgorICAgICAgIGJlZ2luCisgICAgICAgICBwcmludGYgIiAgU1ZFIGxlbjogJWRcbiIgeC5zdmVf
dmwKKyAgICAgICBlbmQKKworbGV0IHRlc3RfZG9taW5mb2xpc3QgKCkgPQorICBsZXQgZG9tcyA9
IFhlbmN0cmwuZG9tYWluX2dldGluZm9saXN0IHhjaCAwIGluCisKKyAgbGV0IHByZXR0eXByaW50
X2RvbSAoZDpYZW5jdHJsLmRvbWFpbmluZm8pID0KKyAgICBwcmludGYgImQlZDogIiBkLmRvbWlk
OworICAgIG1hdGNoIGQuYXJjaF9jb25maWcgd2l0aAorICAgICAgfCBYODYgeCAtPiBwcmludGYg
Ing4NlxuIgorICAgICAgfCBBUk0geCAtPiBwcmludGYgIkFSTSBHSUMlZFxuIiB4LmdpY192ZXJz
aW9uCisgICAgaW4KKworICBMaXN0Lml0ZXIgcHJldHR5cHJpbnRfZG9tIGRvbXMKKworbGV0ICgp
ID0KKyAgcHJpbnRmICJTdGFydC4uLlxuJSEiOworCisgIHRlc3RfeGVudmVyc2lvbiAoKTsKKyAg
dGVzdF9waHlzaW5mbyAoKTsKKyAgdGVzdF9kb21pbmZvbGlzdCAoKTsKKworICBwcmludGYgIlN0
YXJ0aW5nIEdDLmNvbXBhY3QoKVxuJSEiOworICBHYy5jb21wYWN0ICgpOworICBwcmludGYgIkRv
bmVcbiI7CisKKyAgKCkK

--------------CzIthXSbkoKnLKBhJCV0jcHQ--

