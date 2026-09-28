Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788E9C9833E
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 08:24:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435753.1654543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB6er-0003Ve-8k; Mon, 28 Sep 2026 08:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435753.1654543; Mon, 28 Sep 2026 08:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB6er-0003VX-5j; Mon, 28 Sep 2026 08:24:21 +0000
Received: by outflank-mailman (input) for mailman id 1435753;
 Mon, 28 Sep 2026 08:24:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xB6ep-0003VN-LM
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 08:24:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB6eo-003WhY-Au
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 10:24:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6aba2430-e002-0a2a0a5209dd-0a2a450b8ebe-14
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 10:24:18 +0200
Received: from [52.101.201.29]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6aba242a-b7e8-0a2a450b0019-3465c91d7ca9-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 10:24:11 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by IA0PR12MB8840.namprd12.prod.outlook.com (2603:10b6:208:490::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 08:24:08 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 08:24:08 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDu41Gl4cxglpPVVlUDZV40/9e1G7W9iSGrarcH29wWQnLhgeMbUMOnlTI+31w5sgfAZpe9mL+VgX3HsmwJjYNtpfXHxIVBxTFcQbjVUyaU1wBrT4CVm4o3Lh3Fl/DmZ1K4YjBdC13NozlLvnhgFModWHLOpBBuPiVllfNaLCl6Bpz85N3Hu6GxB2kToydHvMBgjNHLyHxJEsN3tFIk+1OnCpQeOSwHm4ZoDZ45j177uEskV8lfs5+To2ScNBJTWxmvrmqJolcOd7PiUOijE5oqIu0BNcgXO2dlewP85K2MwQDyrq17ifGJgXoVQcg4YJNVALOGt+4cRjuLufwKQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjQ0Vrtx1aUThP+u5oKsd6/eLRAVOGOmhBETxvmkcd0=;
 b=tSx42iIDuqIpzQmVKwcXadsbpdSsnaTRc7b5EtnkxMeV3uiPC+mriQPEBSkiAMGVdARVM5C/zI/X//CO6D6BjAbzdgV1aMsfBqLXLjyqV+F8tssGLj5MdEIlF4f2Iugr9/ATT1a/9jAFWSHa4yQmGHik18pBE8ZaPAqRS1yinam3guIeeG+wm0g3bzPhi8ybZc6dxbUZ8hd2QeyS1M+x4i7mXLugsqZjxYUmB4bhsPQe1Jiq8UGQ1TiZoRdDNV7eWVvubEyK6+qPDxlsb7k3cjsEqv/bfq37u882h+XbXyE3XqiMJqgXr3Jvs3VGC7PGXjT9xyyUfZrnbOQdpJekVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjQ0Vrtx1aUThP+u5oKsd6/eLRAVOGOmhBETxvmkcd0=;
 b=U6AQ3UNqe3jPztB6TjuNg3ml3bevrEvsTDB9IgEN93Rb3e1p2Lo5MKeP4DJxrcZKnkRYmPNTOEwdDJzIfoOEQJggjFBaFCR7qKPEpvRKNjgovqBJhrGABZOIULJ4akJ5uqfJPqfC6zhzKt41nSBMHOjxvz8h1w1B8Te5J+8ol1Q=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 10:24:04 +0200
Message-Id: <DLQSZY2KSYDH.1YSCWGQIQYP0H@amd.com>
Subject: Re: [PATCH v2 1/3] xen/rcu: introduce the concept of RCU epoch
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Roger Pau Monne" <roger@xenproject.org>,
 <xen-devel@lists.xenproject.org>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
X-Mailer: aerc 0.17.0
References: <20260925163025.65217-1-roger@xenproject.org>
 <20260925163025.65217-2-roger@xenproject.org>
In-Reply-To: <20260925163025.65217-2-roger@xenproject.org>
X-ClientProxiedBy: MA4P292CA0002.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::19) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|IA0PR12MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: 28083987-56c7-400f-c1eb-08df1d39dda7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hY8fVZHbUysVCZ7KWl3VURElIGiBvk3KxLKQ5blIf8XKm/0fNuw3sHMyjyw8RrWN/p/0/CmYHIOX38ucZpul8BfhWOgM1jtKVIEUIGP6jPbV7Ez24WvUqfPwITmU46acApasbvenVZm38EtSyVCHIx4LvpxgKEi4zu52jm70ft09hHQlo9GHl3UnL5TEO4WqDI03KBIjiDlfHRwt95xDFXLPW/yq/Hhfu2m/+t1xdITQjbO77fqWX7MLQ8B6tXIgKcCZEQlG1CRPPEFN0tPqcNmw8F/G1dBBFetvVrw/vkjDAnstfNpzUzdx4/FBdAK7IyxuXSpF4ifeTlhk7Zdygrtrj5Chk21LYXJP1bMdDbjgV8tvkohEGCB0t5zkBdrFM+R+QKx+S+8PHwHRv/oKJkJHi3aTaxtylsP6BE861wEpdZS7CuH1Kwl2hYK8P2gJSPsFgNhzHNeM6YsYWgmV37omuV9EMvQguQHJc9ecdwfjH+0AAyreyKStFVydNyty9Xp6Ltyy8NDqB7tB1wSaFDvzlOWrhI7023S3GOEyJtcExLLiRTrg8/scdqrr/L9QDwZK7qSr1kyRdxHJVeOlteobSoLqJVKPyOXtCJ0QTeTsZ6mFlDxRjaCsZ03Cx/BEhq0PSVD8kPSmOmq8T5wZPscyJ8jEtwTgIdmSdYNoEDI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2RrZkphWHcwOGo2aGtpZFV0OVYvK1hpcEo3Q005T25PK3V5OVZPTTdXTWRm?=
 =?utf-8?B?M1RNSkxTK3QvWUlZYzcvVnRQaHg3cS81TjdPSHpzNnN0L2N6QTQxWE4vUlM2?=
 =?utf-8?B?Qm9kRWsrM2RDb0F1cUVLVGlNdi9OdHBWU096TnJmK2xCNmUxeXhOQ0gvanZ4?=
 =?utf-8?B?YmtXNXBFT3lHYlNuOGYvdHhIdVMzQkZRbnkwdFRJWFU2YkFSTmovWVFxSVJ6?=
 =?utf-8?B?ZUJuOUFxL01qWVRFbWNpbDJFNjc4bEJkd3F2OFo5Y2dtTTdtRnFkdnNsZmRW?=
 =?utf-8?B?b29BUUZqRnR3WC81MGJYZUpwZVhwanhqWkZlQk1LM2NwNEpYckJCU2RtZnV3?=
 =?utf-8?B?dm5ZTm9yRE5JMlR4NmJKUjBKVEtHTlpVODFnT1UyMDVZWVB0UTdmWUN2OU9T?=
 =?utf-8?B?TEg4K1FQWENnV0d6TjBqbG9adCtUMGczTHVQdUovSnkrYjRvTUpkR0pFSElE?=
 =?utf-8?B?bkpUUTIza2NuL1E0ZmJEV1c2V0p2WGtNaUtnVnlYZWRteHhTc3Q1NWlURjBm?=
 =?utf-8?B?b2h2WEFaQWo0cHl4K3VYVVR4RFlXS0JhcjcyK2lON2xlMHBJUmdXUWZEdW4y?=
 =?utf-8?B?b3V0azVEa0dXMFlxaVdGQlVVendFdkQ4NTNJM0J5YTJTZ1lhcUFMU2N5TVhE?=
 =?utf-8?B?UWgzNXdBZmdHeExFWjdOaEM0QVZYR3Q0emU4R2dTT3ArOUtLRFk1NDV2WlNT?=
 =?utf-8?B?VnEvWW4rc09rTjdrdSsxYVE2bnJ4SCtuWGZONk5rdENiUVliZFJLQnlVeVZT?=
 =?utf-8?B?YVJ2NTJ6YkwyK0EwQlVYOHpObkhUejYvY2xFclRDV2xkNFFDNHIzOVdjY3dX?=
 =?utf-8?B?MkpicEF1QlRBR2NaTXhJYWFjeE5id1RXZVl0ZXdmaEpFQ090U3BnbC9IaEF3?=
 =?utf-8?B?TEw4QUthTE1WL3p5SGNSdllIWk5haW1YUjZ5dlpKcnVNMkdhZjhpa2NZSjRu?=
 =?utf-8?B?ZTArNEgzT2NqWENwa2o2MnFaMmNQaXVPSzc0ai9qR2NsRmVjcTluM3RCWXFY?=
 =?utf-8?B?T2pGMStoc1VuN0ZYdC9ZNS9wZE9yTGNBb2srNGN5Z2l1TEJMdnJuc25aSUpi?=
 =?utf-8?B?VHhObit1Mnk5Sm9EdjlzK3ZKTTVZRmRPd2d6dGxkZ1ZZTUhDK29VL3IrclJ3?=
 =?utf-8?B?dEhQSXdVcW1UM1VXamIraW9yVzlZN3Nsd3NlVk8rQmM3a2cwd055NUxuYVNm?=
 =?utf-8?B?ZGgzazFTTWVTdlF0WUxvTUZ5eGJTcmVXMGVCcTYzN0dIMFNyOEFnREZGM29C?=
 =?utf-8?B?L3pNcGZnbUI1a2trRG9xdnRTSWlpb2JHd0NxcDZpQ2NlT0ZnY0Rad3I3d1Av?=
 =?utf-8?B?UDQyY0JlNWpvTlZ6K1IwSSt6aWdwME4vV1RxQkxob0MrRHlVT2ExY210amFy?=
 =?utf-8?B?bVZnNmJrQUdnNlllRnU4dzF2VUh2bGlWZEtjSWN6bFFqNEJmZ1hraTQxTWdV?=
 =?utf-8?B?am8yb2R3c0ozL1Y4TitwWnE0YnRzL1U5WW5vTFZqaGhLV3R4MElRUXhhRFFv?=
 =?utf-8?B?SFN5TGJvbnQwV2Y1Sjl4Y3FqcXZOTDVZR0ZFSnlVbFgrNUZyR28rOTlhVEc5?=
 =?utf-8?B?TXlXUkpFZVlPZTIzaDRBdnNCUzR1WWtMNXFIdU9IRmJyNTQ3RFFNd25GNjYz?=
 =?utf-8?B?TW1PUnF3MnEwL09vK0l6NjlzZzVuNjV2NXo1TFlLKzh6N25JZEk3WElaMjRM?=
 =?utf-8?B?RUpFOHBKZ3R6U0tCZXpNY2VoamhWekk0UkU5OU9oOVRObEdxYXFaNUtJc3Nv?=
 =?utf-8?B?dTVUQWxRQWJTY3hkM3VibWI5L2h4Y3l6ZHZ6cUFvM056aTFTT1A3M2ZDRUVm?=
 =?utf-8?B?WWc4b1RBOEp1Z2IwQlVjT1FCVnZPUjQvZktjait6NlhkZWdJV0czcUZOR3Yx?=
 =?utf-8?B?MEovQytjeGpHN2VVQmpZWHhENEhSVG5scnU1eEpOUTVUdFhNRDVnZW01TE9Z?=
 =?utf-8?B?TnoxVHpQS0ZCRk5DNmZ4VExoY0RHcU1DSU83dE8xQkxUZmVVU0hwMk9wMG1J?=
 =?utf-8?B?WXRkZS9vSDArY0NMYXo2dXZ6bFZaSUphT0VzVFJlMWgycFUrWjFkcTZ6TzJX?=
 =?utf-8?B?MDRyZ0ZkKy9sUWViQm9mOFBGNE5zUFEweVdFMHlHdE5VLzM4YjhxQWU3eXk3?=
 =?utf-8?B?SndPOVpmU0MvbWpHR200N1dpbndCYUtqeU5rcGZnem9LMG44Z3BKWHorVGY1?=
 =?utf-8?B?czlLRkprUktVQjNrbTBpOWZiQlNFNTlmalAwNVFqU1JiVlpjTVA3bFV6SzI0?=
 =?utf-8?B?MzZsZWJ5WFM0VVIrR1l3RGRJN3hOSGFtU2g0blAyWm5uc1NPYjU0WThvQ0hD?=
 =?utf-8?Q?oe8ocmpYWTHbX61FsQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28083987-56c7-400f-c1eb-08df1d39dda7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:24:08.0042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQivryB/8a2JdDqec6ww1Zgxywuu6ikV9K8MbTfhicf6XrmOqCpwKqSBpOZACFI6lVwq+Iy69ZM8xea02euGtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8840
X-purgate-ID: tlsNG-42698a/1790583851-AA8D99EA-CF879FE4/0/0
X-purgate-type: clean
X-purgate-size: 4383

On Fri Sep 25, 2026 at 6:30 PM CEST, Roger Pau Monne wrote:
> An RCU epoch signals the lifetime of RCU references.  Each CPU records th=
e
> epoch in force when it enters an RCU critical section.  When a callback i=
s
> queued the current epoch is stored in the callback and the global epoch i=
s
> then bumped, as a way to know when all CPUs have moved past a specific
> epoch.  At that point there can be no remaining references to objects
> fetched during the callback's epoch.
>
> The compiler barrier is switched to a full memory barrier, as future uses
> of rcu_lock_cnt must ensure the count is increased before taking a
> reference to any RCU protected object.
>
> Access rcu_lock_cnt, rcu_lock_epoch and rcu_epoch through ACCESS_ONCE()
> to stop the compiler shattering the loads and stores.  The reordering
> prevention aspect of ACCESS_ONCE() is not what we rely on here (the memor=
y
> barriers cover that); what matters is that these variables now have remot=
e
> consumers, so each access must be a single, non-torn memory operation.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger@xenproject.org>
> ---
> Can possibly be folded into the next patch, as it's lacking context on it=
s
> own to understand the need to introduce the logic.
> ---
> Changes since v1:
>  - Do the setting of head->added in the interrupt disabled section.
>  - Unconditionally do a memory barrier when enter/exit RCU critical
>    regions.  Attempting to do selectively is too complex.
> ---
>  xen/common/rcupdate.c      |  6 ++++++
>  xen/include/xen/rcupdate.h | 17 +++++++++++++----
>  2 files changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
> index c1b6b2ae768b..babaabbbeefe 100644
> --- a/xen/common/rcupdate.c
> +++ b/xen/common/rcupdate.c
> @@ -49,6 +49,11 @@
>  #include <asm/atomic.h>
> =20
>  DEFINE_PER_CPU(unsigned int, rcu_lock_cnt);
> +/* Store epoch when CPU entered the RCU critical section. */
> +DEFINE_PER_CPU(unsigned int, rcu_lock_epoch);
> +
> +/* Current RCU epoch, bumped every time a new callback is queued. */
> +unsigned int rcu_epoch;

nit: I'd suggest calling this rcu_cur_epoch, and then renaming "added"
below to plain "epoch". "added" doesn't convey what the field is at all.

> =20
>  /* Global control variables for rcupdate callback mechanism. */
>  static struct rcu_ctrlblk {
> @@ -283,6 +288,7 @@ void call_rcu(struct rcu_head *head,
>      head->func =3D func;
>      head->next =3D NULL;
>      local_irq_save(flags);
> +    head->added =3D arch_fetch_and_add(&rcu_epoch, 1);
>      rdp =3D &this_cpu(rcu_data);
>      *rdp->nxttail =3D head;
>      rdp->nxttail =3D &head->next;
> diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
> index c57f628107cf..5846e8c169d7 100644
> --- a/xen/include/xen/rcupdate.h
> +++ b/xen/include/xen/rcupdate.h
> @@ -34,24 +34,32 @@
>  #include <xen/compiler.h>
>  #include <xen/spinlock.h>
>  #include <xen/cpumask.h>
> +#include <xen/lib.h>
>  #include <xen/percpu.h>
>  #include <xen/preempt.h>
> =20
>  #define __rcu
> =20
>  DECLARE_PER_CPU(unsigned int, rcu_lock_cnt);
> +DECLARE_PER_CPU(unsigned int, rcu_lock_epoch);
> +
> +extern unsigned int rcu_epoch;
> =20
>  static inline void rcu_quiesce_disable(void)
>  {
> +    unsigned int cpu =3D smp_processor_id();
> +
>      preempt_disable();
> -    this_cpu(rcu_lock_cnt)++;
> -    barrier();
> +    if ( !ACCESS_ONCE(per_cpu(rcu_lock_cnt, cpu))++ )
> +        ACCESS_ONCE(per_cpu(rcu_lock_epoch, cpu)) =3D ACCESS_ONCE(rcu_ep=
och);

I'm not terribly convinced about using ACCESS_ONCE() for atomic
accesses. In particular...

> +    smp_mb();
>  }
> =20
>  static inline void rcu_quiesce_enable(void)
>  {
> -    barrier();
> -    this_cpu(rcu_lock_cnt)--;
> +
> +    smp_mb();
> +    ACCESS_ONCE(this_cpu(rcu_lock_cnt))--;

... this variable is to be read by remote CPUs and autodecrement seems
like the wrong tool for an atomic decrement.

>      preempt_enable();
>  }
> =20
> @@ -68,6 +76,7 @@ static inline bool rcu_quiesce_allowed(void)
>  struct rcu_head {
>      struct rcu_head *next;
>      void (*func)(struct rcu_head *head);
> +    unsigned int added;
>  };
> =20
>  #define RCU_HEAD_INIT   { .next =3D NULL, .func =3D NULL }

Cheers,
Alejandro

