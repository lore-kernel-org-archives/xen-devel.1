Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A080DC9832F
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 09:05:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435794.1654589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB7IW-0002po-TV; Mon, 28 Sep 2026 09:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435794.1654589; Mon, 28 Sep 2026 09:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB7IW-0002ph-PI; Mon, 28 Sep 2026 09:05:20 +0000
Received: by outflank-mailman (input) for mailman id 1435794;
 Mon, 28 Sep 2026 09:05:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xB7IV-0002pa-9k
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 09:05:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB7IU-00GjWN-1g
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 11:05:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6aba2dc6-bab6-0a2a0a5309dd-0a2a450be060-22
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 11:05:17 +0200
Received: from [40.107.201.43]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6aba2dcc-b7e8-0a2a450b0019-286bc92b56e0-4
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 11:05:17 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by DM4PR12MB6011.namprd12.prod.outlook.com (2603:10b6:8:6b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 09:05:14 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 09:05:13 +0000
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
 b=rvshBoGn43yrr1gl6aKcoG850XhXprmkv68mXOoeNYpaq/W+CjjCJecC+jLpXec+7AiuPcd1Xw9WjoCEawdRWgaw3U86J4eZVJOrJCFRcU7L3chjbzgrIYL/ueAk+/M1JbDImfpD99Ef71cil3usXKzqhgGg3roafYKT/GJnDrhRSLMaDGlTXR0nz1trgroqeR9jCRQUW3tMQ/Kb9IXQbx/c26reYcosX0jwBRbMu1iekVZhJSqonUse1M/ib3Dvg97XI571vUQRhYqJY7mXBguLzrt5sHh58lBQvfZ9SBy6SjlftYckCLf91nNL6nDOIJPyCHao20n4MRmyFS+ZZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opXHP/2XosOSVmMHeQDEwPiF7n1qWURl1xtEQujbT0g=;
 b=AIWatXMCbvGW83cJIkvhKGaSLL2rk23PemzD9fFrnqe+8em+xnvKxvRutLT8eOUi6b7IW5b6id72w34Huufl7umPS3nWv3ykhVYEfsjULULHpDQxF2fuFPdpjt8fGaiGL0LQX0UoGpk2lWRCm51bueldlWTSPI6Xf2LkQaFPjBIhPk5kjnG1gKniy++fk/aT9sKq2Qv95388ZMR4eLDmviHb0twCu5EPq7Okxd1MNU86wK8EKeMf3EDF5o3lQcaSLpYXElNQI1EQ7WHE6G987ikjotSyA44OOWc7G5mH7yNuVMP+Iki+0JB5+XfeddQGYs0hImHRcO9zV4ypVzx3qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opXHP/2XosOSVmMHeQDEwPiF7n1qWURl1xtEQujbT0g=;
 b=Bb5Fxr+jztRLKIyf3tnoezYDLDX8fxaQpumq0XV3pQTyFJazaXVVT+q22uFVbslCdSXN+1NrL0S9h4HH7eR3pjVXbSnAyWiVQhWQvfwsaPvB8fDJzZoqJZDWGRAPaFB/IVEvA//kZ+Zv8w4Yfq3Amd3ri/YbsVgq43qjRg5X2os=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 11:05:10 +0200
Message-Id: <DLQTVEZZBRXP.2TGY8Y2Z1PQOV@amd.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/3] xen/rcu: simplify RCU implementation
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Roger Pau Monne" <roger@xenproject.org>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20260925163025.65217-1-roger@xenproject.org>
 <20260925163025.65217-3-roger@xenproject.org>
In-Reply-To: <20260925163025.65217-3-roger@xenproject.org>
X-ClientProxiedBy: MA2P292CA0018.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::8)
 To BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|DM4PR12MB6011:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fddb855-f8b1-4944-52a1-08df1d3f9b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|5023799004|11063799006|6133799003|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	aklOlhTSo2poS3dfiBH/lAzLBrsQlxLUYbvWq6jaxZIK3Q6LynqankdF8lfs0M8Yy6M8pMG/u1LmNP5PIznRcNkjOBd5ywnfk8urJqkaB5/VIruyWnFuwKqaLiSDEk6ZlGjIAZnmdyIAYIeX1mLmHaBCUvuw6WtC2o6eW3TvsMBzGltS7Ow8eqI/r1UBBoaoFBurRmFRbqz6kwLFPRp3mEKx3HZDqBG0dOT9c39g7Mr+rZnn7RUfGKu+R16nEPNYDvKJY2b+vVbbP1DCrhH1FSoqwAY0II9J2hj618MH9e+8RXmGHc2ig2WdaY85eiirtfZtGR0wLvTjIE2MYPWmVhmNKf54RcgVnNu1187y8bc4UrfLEb6NyKVzL9cPzr94u3QIcYcSyocgiQnPCVuOQb8l0xNmbo/QYN+Z3rJGYfnvq6Jc82TJ+iMYhgECDWRFJR5cwfebRgkZigCkTW7nWI7MC7we2UPThP53N+j0tuT442YAhFycldvmgh0+A8B+89JyiBX/d9v76suA8vl6KSA6nCdXuxD74KBgBKOgFVJpMzdsaa6UnM2opylqcZyiIFYox78RB4Nh+Hn5CeRoi/oGJiTDLARvWZu+2OC4nwYK3E0uPUuyjPGNWwXwzdX52z5bPlwiL0B0vi/wnD/Kgjgu/pBL+LitTGIwneOcDss=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(5023799004)(11063799006)(6133799003)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVMzTS9KcTdUcHNjSFlMZlVidHYxMVc3MTRuR3lxZFFUOWMrK1E0WTN6cTll?=
 =?utf-8?B?TWJlRURmU2N4Z2VEYUlKeCtDZzdmQUlrbW43dE5xQU4yV1lLMk5zcTY4dXg0?=
 =?utf-8?B?VURDTHZBUkhnaU44NytUVFdpaVdoN3lRRXZrYzJDbzZYbjd6MkdLbjRYREdW?=
 =?utf-8?B?MnJTa0ZpMzVjeDhROXFNKzh5L1loTVBhdVF6b3hKWUs1ZSsxMFVlY0RHUDBQ?=
 =?utf-8?B?THRpZXBBdXdRWFJ2WWYvd21WL3Z5ZWU2NER2K3JsaDN3UWhrSXppL29nWWl1?=
 =?utf-8?B?UnBhOXFxRThwSTRQLzhqb3h5MXpQa1laVS9vRW9XN0I3MEt1dEtJM05WZjYw?=
 =?utf-8?B?YXp6cGR3ZkVscklFeDZVU1d6TWZLN3BFSkhmOVRYOTFLUkhJZG15bjN6N1lX?=
 =?utf-8?B?eUt3N1JWbThFSjROeDRIZ0R5cmxaQVF5Qjc5eHQvWWdLMitmVnZTV1ZtMWJX?=
 =?utf-8?B?aXFMKzNtampHcUFLSHUra28xMFhFR2tlajhDWUU2MTNSSldxbC94Tk5aMnl6?=
 =?utf-8?B?U0ZKTGhxeEYremRFYWM2RkJFMDBqS0pqN01XV0Vzd0NUa0FyQU55a0M4NjdX?=
 =?utf-8?B?OGZoczN3Q3p3UW9yakkwb1pZc205d0ppMlNPQk9uRVVvTE5WRXA5SlBpMEJD?=
 =?utf-8?B?Sk1tUkozVlhxdEY3eS9HajhCRzd5S0ZTb1NOQ2FCTGxZUm40eVpOZVd5TUQ3?=
 =?utf-8?B?blIzT2VpRlYxb0U2VEVVdFBQRlNWR2Q0OXI5eHAyR3gvTkhlZXdpZHdCblFL?=
 =?utf-8?B?cENtaW5uMXlDK0FGMEZCa3ZYZjg2c0Q3VTEreWxDTVJCdHlYQWpvR013ZVNL?=
 =?utf-8?B?YWY0T0RtRFg5UHNnSDhSMCtGclgrU0M2cHV5bkdtais0dGNNOW5DTEpFVU9C?=
 =?utf-8?B?Q1BxK21WQnNGRWhzQ0s0clFlMkJueldQNmpueXJmS2x4cFhqNGsya1kzQ3pU?=
 =?utf-8?B?WDEyZ1VGKzdSSzB5eU1saS8wekxOWmhyaXVwbGZOek1rbjUxLy9LOWR3WCtH?=
 =?utf-8?B?dGZQOXRvb2dsMU9KQXdmcDM4SnpySTdzMEVKUHF5Q2lPVHYzdXZhTTcvWWND?=
 =?utf-8?B?dnJNN1dVTFoxZ0F4R0ozU0FiQ1VUc2dEU2hKZk16blkrZnYwREVZLzJRR0hk?=
 =?utf-8?B?YlJTTFR4dTNOd0t2L01lVmdjQ3ZyOGErQzY5Q0pFZnJvSjV3dXJnUnJwc3Z4?=
 =?utf-8?B?ZnhtWXdYT3VnMHFsTDgrTUJzMmpvcmFPMnlMOHllbVBQeXlZRUpZL0lNSGRw?=
 =?utf-8?B?ZHRWVkRhMkJHSFlnY0hTbzhuYUtZWDNoY2Y3OGEwalMxVHdRT0o3QXVuV2Rv?=
 =?utf-8?B?NGQzNDBCczI2UDVuQmNXUG5vVXgyUld6dTZHMzlXdDV0UnF3K3BnSkFFWUZl?=
 =?utf-8?B?TVo5bHJHeU5rZTVOcWs5d1ZZNWpXeFNXa2QxS1NFM2JvdncrRGljM0poeWtI?=
 =?utf-8?B?RVppdFVDN0VRcUxzT1NqWDVtZ1QrMU53VlJjUE5KVTJtL3JTMHY1NVRBelVE?=
 =?utf-8?B?dWE3TSsvZHFBL25OWWNCODBYOEoyamJJMnJ4QlFRdGZFWEZ0OERaUXNMQnlQ?=
 =?utf-8?B?eStUcDhXYlRxdEFuL1o2R3dva0tUVURENUg4Yzd4QnNPRm5DY2NyWjRSQmp1?=
 =?utf-8?B?N3VLQ3FUdnArTnkvb1ZRNlhsWUlNaStjV0VjL0hncmsvSEVpKy9iZGxlZEZR?=
 =?utf-8?B?aG9oRWI4and4ZWVLOHJsS0p3VjhZVHVydHlON2hNRFRZazZRNkZ6eFFjc052?=
 =?utf-8?B?K3lyWnNLSjF4My9PUmFRUTU0Z0xGb2tUdUsxSlhPM0NLem16RUFzOHFCaFpj?=
 =?utf-8?B?VUJFdVJqN0w5Z045U1E0a0xLQS9CN3NvbUhCOWFrUnVqUklpT0puVVFEZ0sv?=
 =?utf-8?B?cEFtYmp0T3lKNG5DWWtJMit2SVlxR0JucjNSVWd1UlFFV3VtNXY3RGNodnZW?=
 =?utf-8?B?K09RcW8zZGhMY2tQM2hOVHJRY2YyNjFXZmdxZnRIV1lkUUUrRFlvUUl5NGY5?=
 =?utf-8?B?OTFwMEN0MHM3QjRJLzkyYWdlY1J1YWNqY1kzU0UvMFF1MXBmOWRCVENEdzVY?=
 =?utf-8?B?cHErNEZhSzVoN25xL3l3NTVPVW9NdVVLZzVWTU14VWd4MitTNXlTMXZqMVJB?=
 =?utf-8?B?bXNiVGxsY3Y1eFZtWkVVaU56c0l3Q25yVUlFK211SklvdFlkV3JGWkl3OGVZ?=
 =?utf-8?B?SlZtWnd4RHpxdnQ0NFQrZFVxeE1oK3NmU3lpL1NDVWhiV0VGb200dk94RENq?=
 =?utf-8?B?SlJNWkhCL0E3aldNK3gvKy9xWE9vbUhlYUVYMWtBYnJPZm1yWEN0bmcxRkhu?=
 =?utf-8?Q?OPyUyT+rrQ+S2bKn8t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fddb855-f8b1-4944-52a1-08df1d3f9b40
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:05:13.7505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eteDJBm0A21PByz9vQFdiikrkXdTYN/+WvK5G0wXYRwp6jMkJq269pIP0QTmMAHGxjCVO3G/NH1fajq01azBZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6011
X-purgate-ID: tlsNG-42698a/1790586317-192CC9EA-028168C9/0/0
X-purgate-type: clean
X-purgate-size: 30193

On Fri Sep 25, 2026 at 6:30 PM CEST, Roger Pau Monne wrote:
> The current implementation has two shortcomings for certain Xen usages:
>
>  * When using the null scheduler it's possible for a CPU to never enter X=
en
>    context.  A CPU not entering Xen context can block other CPUs from
>    executing RCU callbacks, as there will be no quiescent state observed =
if
>    the CPU doesn't enter Xen context.
>
>  * If a certain amount of callbacks are pending, RCU will try to force a
>    quiescent state, by sending an IPI to remote CPUs.  This causes unwant=
ed
>    interference.
>
> Keep track of the RCU epoch when a callback was added, and only execute i=
t
> once all CPUs are either outside of RCU critical regions, or any CPUs
> inside of RCU critical regions have entered such past the epoch when the
> callback was queued.  Knowing whether a CPU is inside a RCU critical regi=
on
> is done based on the CPU rcu_lock_cnt value.
>
> This removes the grace/quiescent period state tracking entirely: the
> control block, the per-CPU quiescent bookkeeping, the batch lists and the
> forced-quiescent-state IPI all go away.  As a result no RCU-driven IPIs a=
re
> sent to remote CPUs, and callback progress no longer depends on every CPU
> passing through Xen context.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger@xenproject.org>
> ---
> The maximum batch of callbacks processed is limited to 10, this is bit
> arbitrary, but I think matches what the current logic attempts does.
>
> There's a bit more pruning to do regarding the usage of grace and
> quiesce in comments or functions names - I've done that as a followup
> change to reduce the size of this change.
>
> I think the manual raising of an RCU softirq is not really needed when
> the queue exceeds a certain length - the softirq loop will already
> attempt RCU callback processing if possible.
> ---
> Changes since v1:
>  - Rework rcu_pending() so it reports whether there are callback ready to
>    be pruned, instead of simply reporting whether there are any callbacks
>    pending.  This matches the previous implementation.
>  - Force a barrier around entry/exit to each critical region, instead of
>    doing so only in the first and last entry/exit respectively.  This
>    makes the logic more obviously correct.
> ---
>  xen/common/rcupdate.c      | 493 +++++++++++--------------------------
>  xen/include/xen/rcupdate.h |  14 +-
>  2 files changed, 146 insertions(+), 361 deletions(-)
>
> diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
> index babaabbbeefe..79d25c958f0a 100644
> --- a/xen/common/rcupdate.c
> +++ b/xen/common/rcupdate.c
> @@ -35,6 +35,7 @@
>  #include <xen/cpu.h>
>  #include <xen/init.h>
>  #include <xen/kernel.h>
> +#include <xen/list_sort.h>
>  #include <xen/param.h>
>  #include <xen/percpu.h>
>  #include <xen/rcupdate.h>
> @@ -55,74 +56,31 @@ DEFINE_PER_CPU(unsigned int, rcu_lock_epoch);
>  /* Current RCU epoch, bumped every time a new callback is queued. */
>  unsigned int rcu_epoch;
> =20
> -/* Global control variables for rcupdate callback mechanism. */
> -static struct rcu_ctrlblk {
> -    long cur;           /* Current batch number.                      */
> -    long completed;     /* Number of the last completed batch         */
> -    int  next_pending;  /* Is the next batch already waiting?         */
> -
> -    spinlock_t  lock __cacheline_aligned;
> -    cpumask_t   cpumask; /* CPUs that need to switch in order ... */
> -    cpumask_t   idle_cpumask; /* ... unless they are already idle */
> -    /* for current batch to proceed.        */
> -} __cacheline_aligned rcu_ctrlblk =3D {
> -    .cur =3D -300,
> -    .completed =3D -300,
> -    .lock =3D SPIN_LOCK_UNLOCKED,
> -};
> -
> -/*
> - * Per-CPU data for Read-Copy Update.
> - * nxtlist - new callbacks are added here
> - * curlist - current batch for which quiescent cycle started if any
> - */
> +/* Per-CPU data for Read-Copy Update. */
>  struct rcu_data {
> -    /* 1) quiescent state handling : */
> -    long quiescbatch;    /* Batch # for grace period */
> -    int  qs_pending;     /* core waits for quiesc state */
> -
> -    /* 2) batch handling */
> -    long            batch;            /* Batch # for current RCU batch *=
/
> -    struct rcu_head *nxtlist;
> -    struct rcu_head **nxttail;
> -    long            qlen;             /* # of queued callbacks */
> -    struct rcu_head *curlist;
> -    struct rcu_head **curtail;
> -    struct rcu_head *donelist;
> -    struct rcu_head **donetail;
> -    long            blimit;           /* Upper limit on a processed batc=
h */
> -    int cpu;
> -    long            last_rs_qlen;     /* qlen during the last resched */
> -
> -    /* 3) idle CPUs handling */
> +    /*
> +     * List of pending callbacks, sorted by ascending epoch.  Use a thre=
shold
> +     * value to raise an RCU softirq if the queue exceeds a given length=
.
> +     */
> +    struct list_head pending;
> +    unsigned int nr;
> +#define RCU_QUEUE_THRESHOLD 100
> +
> +    /* Keep track of CPUs blocking first RCU callback execution. */
> +    cpumask_t rcu_blocking;
> +
> +    /* Idle CPU handling */
>      struct timer idle_timer;
>      bool idle_timer_active;
> =20
> -    bool            process_callbacks;
> +    /* Barrier handling. */
>      bool            barrier_active;
>  };
> =20
>  /*
> - * If a CPU with RCU callbacks queued goes idle, when the grace period i=
s
> - * not finished yet, how can we make sure that the callbacks will eventu=
ally
> - * be executed? In Linux (2.6.21, the first "tickless idle" Linux kernel=
),
> - * the periodic timer tick would not be stopped for such CPU. Here in Xe=
n,
> - * we (may) don't even have a periodic timer tick, so we need to use a
> - * special purpose timer.
> - *
> - * Such timer:
> - * 1) is armed only when a CPU with an RCU callback(s) queued goes idle
> - *    before the end of the current grace period (_not_ for any CPUs tha=
t
> - *    go idle!);
> - * 2) when it fires, it is only re-armed if the grace period is still
> - *    running;
> - * 3) it is stopped immediately, if the CPU wakes up from idle and
> - *    resumes 'normal' execution.
> - *
> - * About how far in the future the timer should be programmed each time,
> - * it's hard to tell (guess!!). Since this mimics Linux's periodic timer
> - * tick, take values used there as an indication. In Linux 2.6.21, tick
> - * period can be 10ms, 4ms, 3.33ms or 1ms.
> + * If a CPU with RCU callbacks queued goes idle before the callbacks can=
 be
> + * drained use a timer to ensure the CPU is woken up to process the rema=
ining
> + * callback queue.
>   *
>   * By default, we use 10ms, to enable at least some power saving on the
>   * CPU that is going idle. The user can change this, via a boot time
> @@ -137,21 +95,18 @@ static s_time_t __read_mostly idle_timer_period;
>  /*
>   * Increment and decrement values for the idle timer handler. The algori=
thm
>   * works as follows:
> - * - if the timer actually fires, and it finds out that the grace period=
 isn't
> - *   over yet, we add IDLE_TIMER_PERIOD_INCR to the timer's period;
> - * - if the timer actually fires and it finds the grace period over, we
> - *   subtract IDLE_TIMER_PERIOD_DECR from the timer's period.
> + * - If the timer actually fires, and it finds out there are CPUs still =
in RCU
> + *   critical regions, we add IDLE_TIMER_PERIOD_INCR to the timer's peri=
od.
> + *   Note this is not very accurate, as the CPUs in those RCU critical r=
egions
> + *   might not be holding back the execution of the local callbacks.
> + * - If the timer actually fires and it finds no CPUs in critical RCU re=
gions,
> + *   we subtract IDLE_TIMER_PERIOD_DECR from the timer's period.
>   */
>  #define IDLE_TIMER_PERIOD_INCR    MILLISECS(10)
>  #define IDLE_TIMER_PERIOD_DECR    MICROSECS(100)
> =20
>  static DEFINE_PER_CPU(struct rcu_data, rcu_data);
> =20
> -static int blimit =3D 10;
> -static int qhimark =3D 10000;
> -static int qlowmark =3D 100;
> -static int rsinterval =3D 1000;
> -
>  /*
>   * rcu_barrier() handling:
>   * Two counters are used to synchronize rcu_barrier() work:
> @@ -246,35 +201,12 @@ void rcu_barrier(void)
>      put_cpu_maps();
>  }
> =20
> -/* Is batch a before batch b ? */
> -static inline int rcu_batch_before(long a, long b)
> -{
> -    return (a - b) < 0;
> -}
> -
> -static void force_quiescent_state(struct rcu_data *rdp,
> -                                  struct rcu_ctrlblk *rcp)
> -{
> -    cpumask_t cpumask;
> -    raise_softirq(RCU_SOFTIRQ);
> -    if (unlikely(rdp->qlen - rdp->last_rs_qlen > rsinterval)) {
> -        rdp->last_rs_qlen =3D rdp->qlen;
> -        /*
> -         * Don't send IPI to itself. With irqs disabled,
> -         * rdp->cpu is the current cpu.
> -         */
> -        cpumask_andnot(&cpumask, &rcp->cpumask, cpumask_of(rdp->cpu));
> -        cpumask_raise_softirq(&cpumask, RCU_SOFTIRQ);
> -    }
> -}
> -
>  /**
>   * call_rcu - Queue an RCU callback for invocation after a grace period.
>   * @head: structure to be used for queueing the RCU updates.
>   * @func: actual update function to be invoked after the grace period
>   *
> - * The update function will be invoked some time after a full grace
> - * period elapses, in other words after all currently executing RCU
> + * The update function will be invoked after all currently executing RCU
>   * read-side critical sections have completed.  RCU read-side critical
>   * sections are delimited by rcu_read_lock() and rcu_read_unlock(),
>   * and may be nested.
> @@ -283,205 +215,88 @@ void call_rcu(struct rcu_head *head,
>                void (*func)(struct rcu_head *rcu))
>  {
>      unsigned long flags;
> -    struct rcu_data *rdp;
> +    struct rcu_data *rdp =3D &this_cpu(rcu_data);
> =20
>      head->func =3D func;
> -    head->next =3D NULL;
>      local_irq_save(flags);
>      head->added =3D arch_fetch_and_add(&rcu_epoch, 1);
> -    rdp =3D &this_cpu(rcu_data);
> -    *rdp->nxttail =3D head;
> -    rdp->nxttail =3D &head->next;
> -    if (unlikely(++rdp->qlen > qhimark)) {
> -        rdp->blimit =3D INT_MAX;
> -        force_quiescent_state(rdp, &rcu_ctrlblk);
> -    }
> -    local_irq_restore(flags);
> -}
> -
> -/*
> - * Invoke the completed RCU callbacks. They are expected to be in
> - * a per-cpu list.
> - */
> -static void rcu_do_batch(struct rcu_data *rdp)
> -{
> -    struct rcu_head *next, *list;
> -    int count =3D 0;
> -
> -    list =3D rdp->donelist;
> -    while (list) {
> -        next =3D rdp->donelist =3D list->next;
> -        list->func(list);
> -        list =3D next;
> -        rdp->qlen--;
> -        if (++count >=3D rdp->blimit)
> -            break;
> -    }
> -    if (rdp->blimit =3D=3D INT_MAX && rdp->qlen <=3D qlowmark)
> -        rdp->blimit =3D blimit;
> -    if (!rdp->donelist)
> -        rdp->donetail =3D &rdp->donelist;
> -    else
> -    {
> -        rdp->process_callbacks =3D true;
> -        raise_softirq(RCU_SOFTIRQ);
> -    }
> -}
> -
> -/*
> - * Grace period handling:
> - * The grace period handling consists out of two steps:
> - * - A new grace period is started.
> - *   This is done by rcu_start_batch. The start is not broadcasted to
> - *   all cpus, they must pick this up by comparing rcp->cur with
> - *   rdp->quiescbatch. All cpus are recorded  in the
> - *   rcu_ctrlblk.cpumask bitmap.
> - * - All cpus must go through a quiescent state.
> - *   Since the start of the grace period is not broadcasted, at least tw=
o
> - *   calls to rcu_check_quiescent_state are required:
> - *   The first call just notices that a new grace period is running. The
> - *   following calls check if there was a quiescent state since the begi=
nning
> - *   of the grace period. If so, it updates rcu_ctrlblk.cpumask. If
> - *   the bitmap is empty, then the grace period is completed.
> - *   rcu_check_quiescent_state calls rcu_start_batch(0) to start the nex=
t grace
> - *   period (if necessary).
> - */
> -/*
> - * Register a new batch of callbacks, and start it up if there is curren=
tly no
> - * active batch and the batch to be registered has not already occurred.
> - * Caller must hold rcu_ctrlblk.lock.
> - */
> -static void rcu_start_batch(struct rcu_ctrlblk *rcp)
> -{
> -    if (rcp->next_pending &&
> -        rcp->completed =3D=3D rcp->cur) {
> -        rcp->next_pending =3D 0;
> +    list_add_tail(&head->list, &rdp->pending);
> +    if ( ++rdp->nr > RCU_QUEUE_THRESHOLD )
>          /*
> -         * next_pending =3D=3D 0 must be visible in
> -         * __rcu_process_callbacks() before it can see new value of cur.
> +         * Raise a softirq to attempt to force draining the queue, albei=
t
> +         * there's no guarantee.
>           */
> -        smp_wmb();
> -        rcp->cur++;
> -
> -       /*
> -        * Make sure the increment of rcp->cur is visible so, even if a
> -        * CPU that is about to go idle, is captured inside rcp->cpumask,
> -        * rcu_pending() will return false, which then means cpu_quiet()
> -        * will be invoked, before the CPU would actually enter idle.
> -        *
> -        * This barrier is paired with the one in rcu_idle_enter().
> -        */
> -        smp_mb();
> -        cpumask_andnot(&rcp->cpumask, &cpu_online_map, &rcp->idle_cpumas=
k);
> -    }
> -}
> -
> -/*
> - * cpu went through a quiescent state since the beginning of the grace p=
eriod.
> - * Clear it from the cpu mask and complete the grace period if it was th=
e last
> - * cpu. Start another grace period if someone has further entries pendin=
g
> - */
> -static void cpu_quiet(int cpu, struct rcu_ctrlblk *rcp)
> -{
> -    cpumask_clear_cpu(cpu, &rcp->cpumask);
> -    if (cpumask_empty(&rcp->cpumask)) {
> -        /* batch completed ! */
> -        rcp->completed =3D rcp->cur;
> -        rcu_start_batch(rcp);
> -    }
> +        raise_softirq(RCU_SOFTIRQ);
> +    local_irq_restore(flags);
>  }
> =20
> -/*
> - * Check if the cpu has gone through a quiescent state (say context
> - * switch). If so and if it already hasn't done so in this RCU
> - * quiescent cycle, then indicate that it has done so.
> - */
> -static void rcu_check_quiescent_state(struct rcu_ctrlblk *rcp,
> -                                      struct rcu_data *rdp)
> +#define RCU_MAX_BATCH 10
> +static void cf_check rcu_process_callbacks(void)
>  {
> -    if (rdp->quiescbatch !=3D rcp->cur) {
> -        /* start new grace period: */
> -        rdp->qs_pending =3D 1;
> -        rdp->quiescbatch =3D rcp->cur;
> -        return;
> -    }
> -
> -    /* Grace period already completed for this cpu?
> -     * qs_pending is checked instead of the actual bitmap to avoid
> -     * cacheline trashing.
> -     */
> -    if (!rdp->qs_pending)
> -        return;
> +    static DEFINE_PER_CPU(cpumask_t, rcu_scratch);
> +    cpumask_t *in_rcu =3D &this_cpu(rcu_scratch);
> +    struct rcu_data *rdp =3D &this_cpu(rcu_data);
> +    unsigned long flags;
> +    unsigned int queued =3D 0, cpu;
> +    LIST_HEAD(expired);
> +    struct rcu_head *rcu;
> =20
> -    rdp->qs_pending =3D 0;
> +    /* Clear any existing blocking mask - we will redo it if needed. */
> +    cpumask_clear(&rdp->rcu_blocking);
> =20
> -    spin_lock(&rcp->lock);
>      /*
> -     * rdp->quiescbatch/rcp->cur and the cpu bitmap can come out of sync
> -     * during cpu startup. Ignore the quiescent state.
> +     * Populate a cpumask with any CPUs inside RCU critical regions.  No=
te that
> +     * CPUs entering past this point are of no interest, they will certa=
inly
> +     * use an epoch past any queued callbacks here.
>       */
> -    if (likely(rdp->quiescbatch =3D=3D rcp->cur))
> -        cpu_quiet(rdp->cpu, rcp);
> -
> -    spin_unlock(&rcp->lock);
> -}
> -
> -
> -/*
> - * This does the RCU processing work from softirq context.=20
> - */
> -static void __rcu_process_callbacks(struct rcu_ctrlblk *rcp,
> -                                    struct rcu_data *rdp)
> -{
> -    if (rdp->curlist && !rcu_batch_before(rcp->completed, rdp->batch)) {
> -        *rdp->donetail =3D rdp->curlist;
> -        rdp->donetail =3D rdp->curtail;
> -        rdp->curlist =3D NULL;
> -        rdp->curtail =3D &rdp->curlist;
> -    }
> -
> -    local_irq_disable();
> -    if (rdp->nxtlist && !rdp->curlist) {
> -        rdp->curlist =3D rdp->nxtlist;
> -        rdp->curtail =3D rdp->nxttail;
> -        rdp->nxtlist =3D NULL;
> -        rdp->nxttail =3D &rdp->nxtlist;
> -        local_irq_enable();
> +    cpumask_clear(in_rcu);
> +    for_each_online_cpu ( cpu )
> +        if ( ACCESS_ONCE(per_cpu(rcu_lock_cnt, cpu)) )
> +            __cpumask_set_cpu(cpu, in_rcu);
> =20
> +    local_irq_save(flags);
> +    while ( queued < RCU_MAX_BATCH &&
> +            (rcu =3D list_first_entry_or_null(&rdp->pending, struct rcu_=
head,
> +                                            list)) )
> +    {
>          /*
> -         * start the next batch of callbacks
> +         * Fetching rcu_lock_epoch out of order is not a concern here: i=
n the
> +         * worst case it's going to result in an older more restrictive =
epoch
> +         * being checked against.  Note the adding of a callback issues =
a
> +         * arch_fetch_and_add() which is a barrier on itself, and guaran=
tees
> +         * remote changes to the CPU mask to be visible here.
>           */
> -
> -        /* determine batch number */
> -        rdp->batch =3D rcp->cur + 1;
> -        /* see the comment and corresponding wmb() in
> -         * the rcu_start_batch()
> -         */
> -        smp_rmb();
> -
> -        if (!rcp->next_pending) {
> -            /* and start it/schedule start if it's a new batch */
> -            spin_lock(&rcp->lock);
> -            rcp->next_pending =3D 1;
> -            rcu_start_batch(rcp);
> -            spin_unlock(&rcp->lock);
> -        }
> -    } else {
> -        local_irq_enable();
> +        for_each_cpu ( cpu, in_rcu )
> +            if ( (int)(ACCESS_ONCE(per_cpu(rcu_lock_epoch, cpu)) -
> +                       rcu->added) <=3D 0 )
> +                /* Record CPUs blocking the execution of the callback. *=
/
> +                __cpumask_set_cpu(cpu, &rdp->rcu_blocking);
> +
> +        if ( !cpumask_empty(&rdp->rcu_blocking) )
> +            /*
> +             * Callbacks are sorted, exit loop as soon as we find one th=
at
> +             * can't be processed yet.
> +             */
> +            goto process;
> +
> +        list_del(&rcu->list);
> +        list_add_tail(&rcu->list, &expired);
> +        ASSERT(rdp->nr);
> +        rdp->nr--;
> +        queued++;
>      }
> -    rcu_check_quiescent_state(rcp, rdp);
> -    if (rdp->donelist)
> -        rcu_do_batch(rdp);
> -}
> =20
> -static void cf_check rcu_process_callbacks(void)
> -{
> -    struct rcu_data *rdp =3D &this_cpu(rcu_data);
> +    if ( queued =3D=3D RCU_MAX_BATCH && rdp->nr )
> +        /* There's more work to do, yield and raise a softirq to come ba=
ck. */
> +        raise_softirq(RCU_SOFTIRQ);
> =20
> -    if ( rdp->process_callbacks )
> + process:
> +    local_irq_restore(flags);
> +
> +    while ( (rcu =3D list_first_entry_or_null(&expired, struct rcu_head,=
 list)) )
>      {
> -        rdp->process_callbacks =3D false;
> -        __rcu_process_callbacks(&rcu_ctrlblk, rdp);
> +        list_del(&rcu->list);
> +        rcu->func(rcu);
>      }
> =20
>      if ( atomic_read(&cpu_count) && !rdp->barrier_active )
> @@ -492,33 +307,26 @@ static void cf_check rcu_process_callbacks(void)
>      }
>  }
> =20
> -static int __rcu_pending(struct rcu_ctrlblk *rcp, struct rcu_data *rdp)
> +bool rcu_pending(unsigned int cpu)
>  {
> -    /* This cpu has pending rcu entries and the grace period
> -     * for them has completed.
> -     */
> -    if (rdp->curlist && !rcu_batch_before(rcp->completed, rdp->batch))
> -        return 1;
> +    struct rcu_data *rdp =3D &per_cpu(rcu_data, cpu);
> +    const struct rcu_head *rcu =3D
> +        list_first_entry_or_null(&rdp->pending, struct rcu_head, list);
> +    unsigned int rcpu;
> =20
> -    /* This cpu has no pending entries, but there are new entries */
> -    if (!rdp->curlist && rdp->nxtlist)
> -        return 1;
> +    /* Modifying rcu_blocking per-CPU mask is only safe if done locally.=
 */
> +    ASSERT(smp_processor_id() =3D=3D cpu);
> =20
> -    /* This cpu has finished callbacks to invoke */
> -    if (rdp->donelist)
> -        return 1;
> +    if ( !rcu )
> +        return false;
> =20
> -    /* The rcu core waits for a quiescent state from the cpu */
> -    if (rdp->quiescbatch !=3D rcp->cur || rdp->qs_pending)
> -        return 1;
> +    for_each_cpu ( rcpu, &rdp->rcu_blocking )
> +        if ( (int)(ACCESS_ONCE(per_cpu(rcu_lock_epoch, rcpu)) -
> +                   rcu->added) > 0 )
> +            /* Record CPUs blocking the execution of the callback. */
> +            __cpumask_clear_cpu(rcpu, &rdp->rcu_blocking);
> =20
> -    /* nothing to do */
> -    return 0;
> -}
> -
> -bool rcu_pending(unsigned int cpu)
> -{
> -    return !!__rcu_pending(&rcu_ctrlblk, &per_cpu(rcu_data, cpu));
> +    return cpumask_empty(&rdp->rcu_blocking);
>  }
> =20
>  /*
> @@ -529,15 +337,13 @@ bool rcu_pending(unsigned int cpu)
>   */
>  bool rcu_needs_cpu(unsigned int cpu)
>  {
> -    struct rcu_data *rdp =3D &per_cpu(rcu_data, cpu);
> -
> -    return (rdp->curlist && !rdp->idle_timer_active) || rcu_pending(cpu)=
;
> +    return !!per_cpu(rcu_data, cpu).nr;

Local reads are fine to be relaxed with IRQs off because they can't
change. But remote reads and reads with IRQs on are subject to data
races.

This read should be atomic. And the writes should be atomic too because
the field is read from remote CPUs.

>  }
> =20
>  /*
>   * Timer for making sure the CPU where a callback is queued does
>   * periodically poke rcu_pending(), so that it will invoke the callback
> - * not too late after the end of the grace period.
> + * not too late.
>   */
>  static void rcu_idle_timer_start(void)
>  {
> @@ -545,10 +351,9 @@ static void rcu_idle_timer_start(void)
> =20
>      /*
>       * Note that we don't check rcu_pending() here. In fact, we don't wa=
nt
> -     * the timer armed on CPUs that are in the process of quiescing whil=
e
> -     * going idle, unless they really are the ones with a queued callbac=
k.
> +     * the timer armed on CPUs that don't have pending callbacks.
>       */
> -    if (likely(!rdp->curlist))
> +    if (likely(!rdp->nr))
>          return;
> =20
>      set_timer(&rdp->idle_timer, NOW() + idle_timer_period);
> @@ -587,7 +392,7 @@ static void cf_check rcu_idle_timer_handler(void* dat=
a)
>  {
>      perfc_incr(rcu_idle_timer);
> =20
> -    if ( !cpumask_empty(&rcu_ctrlblk.cpumask) )
> +    if ( this_cpu(rcu_data).nr )
>          idle_timer_period =3D min(idle_timer_period + IDLE_TIMER_PERIOD_=
INCR,
>                                  IDLE_TIMER_PERIOD_MAX);
>      else
> @@ -597,55 +402,51 @@ static void cf_check rcu_idle_timer_handler(void* d=
ata)
> =20
>  void rcu_check_callbacks(unsigned int cpu)
>  {
> -    struct rcu_data *rdp =3D &this_cpu(rcu_data);
> -
> -    rdp->process_callbacks =3D true;
>      raise_softirq(RCU_SOFTIRQ);
>  }
> =20
> -static void rcu_move_batch(struct rcu_data *this_rdp, struct rcu_head *l=
ist,
> -                           struct rcu_head **tail)
> +/* Sorting functions for RCU list concatenation when a CPU goes offline.=
 */
> +static int cf_check cmp_rcu(void *priv, struct list_head *a,
> +                            struct list_head *b)
>  {
> -    local_irq_disable();
> -    *this_rdp->nxttail =3D list;
> -    if (list)
> -        this_rdp->nxttail =3D tail;
> -    local_irq_enable();
> +    const struct rcu_head *l =3D container_of(a, struct rcu_head, list),
> +                          *r =3D container_of(b, struct rcu_head, list);
> +
> +    return (int)(l->added - r->added);
>  }
> =20
>  static void rcu_offline_cpu(struct rcu_data *this_rdp,
> -                            struct rcu_ctrlblk *rcp, struct rcu_data *rd=
p)
> +                            struct rcu_data *rdp)
>  {
>      kill_timer(&rdp->idle_timer);
> =20
> -    /* If the cpu going offline owns the grace period we can block
> -     * indefinitely waiting for it, so flush it here.
> -     */
> -    spin_lock(&rcp->lock);
> -    if (rcp->cur !=3D rcp->completed)
> -        cpu_quiet(rdp->cpu, rcp);
> -    spin_unlock(&rcp->lock);
> -
> -    rcu_move_batch(this_rdp, rdp->donelist, rdp->donetail);
> -    rcu_move_batch(this_rdp, rdp->curlist, rdp->curtail);
> -    rcu_move_batch(this_rdp, rdp->nxtlist, rdp->nxttail);
> +    if ( !rdp->nr )
> +        return;
> =20
> +    /*
> +     * Append pending callbacks to the current CPU.  By the time this is
> +     * executed the CPU going offline cannot be in any RCU critical sect=
ion or
> +     * queue any more RCU work.
> +     */
>      local_irq_disable();
> -    this_rdp->qlen +=3D rdp->qlen;
> +    list_splice(&rdp->pending, &this_rdp->pending);
> +    this_rdp->nr +=3D rdp->nr;
> +    list_sort(NULL, &this_rdp->pending, cmp_rcu);
> +    /* Clear blocking CPU mask: the top callback might have changed. */
> +    cpumask_clear(&this_rdp->rcu_blocking);
>      local_irq_enable();
> +
> +    if ( this_rdp->nr > RCU_QUEUE_THRESHOLD )
> +        raise_softirq(RCU_SOFTIRQ);
> +
> +    INIT_LIST_HEAD(&rdp->pending);
> +    rdp->nr =3D 0;
>  }
> =20
> -static void rcu_init_percpu_data(int cpu, struct rcu_ctrlblk *rcp,
> -                                 struct rcu_data *rdp)
> +static void rcu_init_percpu_data(int cpu, struct rcu_data *rdp)
>  {
>      memset(rdp, 0, sizeof(*rdp));
> -    rdp->curtail =3D &rdp->curlist;
> -    rdp->nxttail =3D &rdp->nxtlist;
> -    rdp->donetail =3D &rdp->donelist;
> -    rdp->quiescbatch =3D rcp->completed;
> -    rdp->qs_pending =3D 0;
> -    rdp->cpu =3D cpu;
> -    rdp->blimit =3D blimit;
> +    INIT_LIST_HEAD(&rdp->pending);
>      init_timer(&rdp->idle_timer, rcu_idle_timer_handler, rdp, cpu);
>  }
> =20
> @@ -658,11 +459,11 @@ static int cf_check cpu_callback(
>      switch ( action )
>      {
>      case CPU_UP_PREPARE:
> -        rcu_init_percpu_data(cpu, &rcu_ctrlblk, rdp);
> +        rcu_init_percpu_data(cpu, rdp);
>          break;
>      case CPU_UP_CANCELED:
>      case CPU_DEAD:
> -        rcu_offline_cpu(&this_cpu(rcu_data), &rcu_ctrlblk, rdp);
> +        rcu_offline_cpu(&this_cpu(rcu_data), rdp);
>          break;
>      default:
>          break;
> @@ -693,36 +494,18 @@ void __init rcu_init(void)
>      }
>      idle_timer_period =3D MILLISECS(idle_timer_period_ms);
> =20
> -    cpumask_clear(&rcu_ctrlblk.idle_cpumask);
>      cpu_callback(&cpu_nfb, CPU_UP_PREPARE, cpu);
>      register_cpu_notifier(&cpu_nfb);
>      open_softirq(RCU_SOFTIRQ, rcu_process_callbacks);
>  }
> =20
> -/*
> - * The CPU is becoming idle, so no more read side critical
> - * sections, and one more step toward grace period.
> - */
> +/* The CPU is becoming idle, ensure pending RCU work will get processed.=
 */
>  void rcu_idle_enter(unsigned int cpu)
>  {
> -    ASSERT(!cpumask_test_cpu(cpu, &rcu_ctrlblk.idle_cpumask));
> -    cpumask_set_cpu(cpu, &rcu_ctrlblk.idle_cpumask);
> -    /*
> -     * If some other CPU is starting a new grace period, we'll notice th=
at
> -     * by seeing a new value in rcp->cur (different than our quiescbatch=
).
> -     * That will force us all the way until cpu_quiet(), clearing our bi=
t
> -     * in rcp->cpumask, even in case we managed to get in there.
> -     *
> -     * Se the comment before cpumask_andnot() in  rcu_start_batch().
> -     */
> -    smp_mb();
> -
>      rcu_idle_timer_start();
>  }
> =20
>  void rcu_idle_exit(unsigned int cpu)
>  {
>      rcu_idle_timer_stop();
> -    ASSERT(cpumask_test_cpu(cpu, &rcu_ctrlblk.idle_cpumask));
> -    cpumask_clear_cpu(cpu, &rcu_ctrlblk.idle_cpumask);
>  }
> diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
> index 5846e8c169d7..312551d5b089 100644
> --- a/xen/include/xen/rcupdate.h
> +++ b/xen/include/xen/rcupdate.h
> @@ -35,6 +35,7 @@
>  #include <xen/spinlock.h>
>  #include <xen/cpumask.h>
>  #include <xen/lib.h>
> +#include <xen/list.h>
>  #include <xen/percpu.h>
>  #include <xen/preempt.h>
> =20
> @@ -57,7 +58,6 @@ static inline void rcu_quiesce_disable(void)
> =20
>  static inline void rcu_quiesce_enable(void)
>  {
> -
>      smp_mb();
>      ACCESS_ONCE(this_cpu(rcu_lock_cnt))--;
>      preempt_enable();
> @@ -70,19 +70,21 @@ static inline bool rcu_quiesce_allowed(void)
> =20
>  /**
>   * struct rcu_head - callback structure for use with RCU
> - * @next: next update requests in a list
> + * @list: list anchor.
>   * @func: actual update function to call after the grace period.
> + * @added: epoch when the callback was added.
>   */
>  struct rcu_head {
> -    struct rcu_head *next;
> +    struct list_head list;
>      void (*func)(struct rcu_head *head);
>      unsigned int added;
>  };
> =20
> -#define RCU_HEAD_INIT   { .next =3D NULL, .func =3D NULL }
> -#define RCU_HEAD(head) struct rcu_head head =3D RCU_HEAD_INIT
> +#define RCU_HEAD_INIT(head)   { .list =3D LIST_HEAD_INIT((head).list), \
> +                                .func =3D NULL }
> +#define RCU_HEAD(head) struct rcu_head head =3D RCU_HEAD_INIT(head)
>  #define INIT_RCU_HEAD(ptr) do { \
> -       (ptr)->next =3D NULL; (ptr)->func =3D NULL; \
> +    INIT_LIST_HEAD(&(ptr)->list); (ptr)->func =3D NULL; \
>  } while (0)
> =20
> =20


