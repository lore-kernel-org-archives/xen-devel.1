Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97486C9833E
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 08:31:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435761.1654552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB6lm-0005LZ-Mb; Mon, 28 Sep 2026 08:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435761.1654552; Mon, 28 Sep 2026 08:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB6lm-0005LS-Jy; Mon, 28 Sep 2026 08:31:30 +0000
Received: by outflank-mailman (input) for mailman id 1435761;
 Mon, 28 Sep 2026 08:31:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xB6ll-0005LM-Kw
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 08:31:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB6lk-0023Vi-ED
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 10:31:28 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6aba25d5-e002-0a2a0a5209dd-0a2a45079ace-46
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 10:31:28 +0200
Received: from [52.101.52.4]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6aba25de-b4ea-0a2a45070019-34653404d95b-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 10:31:27 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by LV3PR12MB9143.namprd12.prod.outlook.com (2603:10b6:408:19e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 08:31:24 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 08:31:24 +0000
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
 b=siWATHASvS4iRyzXRbl36/J2cizqnkeUOO3wNekifmgvwXzxWSed0vaz8ncOFocT3QbZE/+o0ora1ujUI/uaUxxP+SdsLB6Dm6+Pejo25+ycxZV1GPidsNI9046j7mDa2PX32oUDRHVF64YhAHByocdsjA2rBxX8VRQEyHslPYWBCS0HIu5b24e6PZ6a633bPmDJGm25anOB+FVUUWU7G0vjx3sS0kdYHD/ztOoJzVfVhfFhRQPXS4XoEfbvbC/4Q1WGr9KYuEN/C5Qm0e54ZAyEsecLDDD8gdAFWAlv6bq14Ff4TLR8wo21URbBlBtBR5Uj45fwnmRlONUB4Imjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMS9JxRqfXbVA44+MvY+XQ2cAB2GHvBaMtCG+89x9A4=;
 b=dLoz2N9vABWxCJgEXUeu1Qfvy2COCDy5vVhN6X0dLF5+5Id+aNLfpeqSfDKjGXQVPDuqyi5oQnjUwNQ/n9c9xrvuRvyaRudD4ocsBoc3XF4i/GJDSKxgWRZnShHdsBxH49XCAqDt7UKmxfv7RnfBYZw/2nEr7D/w10BUVTGnNTRpCAi0I0Tp//IlM9B+hE5bSFeztNndOiQ8ZEB16W5f3k0hakiIJ2DL98QRN7VR8YgCbWGb1BVvwRaXh1FQGBF1fRTed24rQ/4X93BnwZLfkfM40rVKCvbJQxFeaUm96IQeH0b2sPxuVR0p/Zay2NbM5gg8rcKzQRbLHfuUYT+Egg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMS9JxRqfXbVA44+MvY+XQ2cAB2GHvBaMtCG+89x9A4=;
 b=i4ZHeaJntOUImy7zH5o3yFLXISxHKs7QzkqIFHfpEI6QAVaxiI7SRVtdmJWjIsq9TpWwx9IWSqIBy2ZVIXnBO/CG1tsTBFL20HPaW3lJfIwp+6HAkh5D2ymrCSDseTwDK1aVvc2YT/8j5Lkm0xem5s6PePzcOI6IfDmRLncI8Y0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 10:31:20 +0200
Message-Id: <DLQT5IL8T1B9.1GN63C5Q17HGH@amd.com>
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
X-ClientProxiedBy: MR1P264CA0069.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::15) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|LV3PR12MB9143:EE_
X-MS-Office365-Filtering-Correlation-Id: 55ffeef2-d3e1-4da6-5194-08df1d3ae1cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yZdDS8NsBJmJBU3vu9RRW6JlsVIdp78pYLc6TurvhQXqaXdd/IaYnxL6/SsEVt3Ug+tcmph5dXrkvbTkhsLv2yKLlDxk2pIJ8S1nfEJJ2rU8YovaYrxsc/rKao3mCf68Ui4Bj8Be5MgISjsOYIfW2GDR/VXBflarQzIJboWpAuVq1OaQ/FQU0u78R/SpjdOYFIApbAtvTJu8V8CZeDsXHAGZSa8VMTmR7sJU5q59me7a+3piI4OePI+kwiXq4Mo1gxi59MUTZl0OBdrUdww3NecRGqqLKS5VBzHRUgYal97jRpfIKccgcJc7tassmhuXEZP60yYL5nCJKqv3vXUZZD2ULl4Hz3zRKJ1UbrKBq8Lco29brL2ZXzwKO0rIgaPmOu0Nsk3x/aMaF9pWPs277lWI+9iiMjmsepuRd7roeHCvTt/GqDEhhMsg4E2AGCmACXy43G6iIR7691XuNeAGAhr8oYzOOlRdYaK5eBQkdsNtUkhI0zkoN/A1k+9y4EhtOti09L/uS017vxyGew9ZGyBfqFffWxCKwh5rBf0qtuHsMLJVLZu73yBmLetzC+pnh0JonIbZ/7qP6Hw3KjlHp0cgA4edGqvuqDjKcw+aUbTtvfgNsbbETLv1huJbZkAPMZde3PS4fCrKuVXsE9k+C9dzfCk7R8gnIpjAqCa0Bjo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0lXYnptbWlxQ2hLK05iVjVGK2pBK05VZ1pSUHg1UHlENE5UVTJaeTJjeFRT?=
 =?utf-8?B?UnhJRVRCeVNyKy9pSjJnMlIzL1FIVG5EMVM3REZKSGtVdm1va3FjZ0ljdVhD?=
 =?utf-8?B?ZWNTZ0VUK1BjZWNHTnJYL0RaOEZEZ2dBNlZLbTVINU9uL3RKaURYRS9CR1pv?=
 =?utf-8?B?SmpueGduaTdzMmF4TDVFWU96Mkdoc3FYUWxRM1hNTzArbXZUUHNmc3dvZGJo?=
 =?utf-8?B?YWxIWWJZdFIxNEJ2SnZIQU82cEVncDA5TUJaQzQrb1N2SnoyaHBUa0dISjdI?=
 =?utf-8?B?YnVwN2NQN1gza1hoUGhBUCtpUFZtdStocEVibkVVa3dVV1dHSXpESzFjZXBr?=
 =?utf-8?B?SFpqK21DcGtCNkNoSWtldERIVW5TQnBQWm5wQXRJNEFWUGhaM1BSUjEreC8w?=
 =?utf-8?B?L3NYUThHdnlKSnl3M0JGaDJrNjNZOG1ibU9rNFREWjlqRlphWXRrNFNmcFh3?=
 =?utf-8?B?WlFobzhFdmxvanR4dS9xSXU1bXdqa0tmdm51SWdRMjQ1Tm5mSFJqMFFUaFhF?=
 =?utf-8?B?eDQxWDBvTWRsdWJTQ3k1ZzNBelIxMTFSK2hKTUplK2UwK0ZScGNGQjBHc0Iv?=
 =?utf-8?B?dDBiY0xDNVVSQS9OZDVXVG9Na3ltSFVhZk5lWnJxbWR5MWhhYWNTb29DVFc3?=
 =?utf-8?B?VldEVVZITXNLY3Zsa0VTblF0Tng1V0RQQTJMV3dLR0dpSE5zVjVIVGpodEpy?=
 =?utf-8?B?Q3RDL3JZc0k5T29KbmtkelZmNFBtcTlNWlp1eFBwY0cwbTBNUjR0QTZnUnZp?=
 =?utf-8?B?UzVpbitabkcxN2pTNUI3dEVXUG9HbHcyQk5GMXNRYUdOVkxmMk9WVEpyT2Jj?=
 =?utf-8?B?dWZXYW1wQVRqNmxkL1dQTmVWdnVKekZZc056emJxZHlQZFpTb0VtZDF4bHdL?=
 =?utf-8?B?ZCtUd0JjS0JrTTBML3NzbkFIc2pQczNGd1l1NmVLUUlMOWpLNCtIOVU4TVpP?=
 =?utf-8?B?TlFpcE8xdGR4K0tEaXBlWjZyQzVycXlqUzRKU1EvbVc2NkhDYzNNN21JRUd5?=
 =?utf-8?B?diswYmpsZW8zaVZyb0g4VUpNZjNzbjRVTVlBM0tyMHNhYUI1WCt5ZTdaZXNM?=
 =?utf-8?B?bDQrUUg0YXdNbXN0NmQrZHFNSy9FNEJPblRuNXgwcUxDS1pueXBlNkpKeUdJ?=
 =?utf-8?B?Mk84T1Q0aVdCaEpCLzBvT3BDYlVvWWl1clpsc0JCZ2dCUTdTZENydnE4THd1?=
 =?utf-8?B?RnU2Vmt2SEVNTXBLbzk0d2ZKbFA1cnBpRHdPRG9EYVRSQjA2NU5EVkY3UmNM?=
 =?utf-8?B?anE0UHBOWGNoRFVhTTBFakptMXFtazUxWDE4b3pYQ1g0c2VsZ3JJeWFsMTFz?=
 =?utf-8?B?eUtNbzVuUGczRXpZSWZ1ZlFjZ0d2TUd0TXFOREtsaXFMcThyZmNyYjI2MVdL?=
 =?utf-8?B?WFpZbUZRbnR4NEQybFprYWIxU0RsMmxUeTFxSDRVVXduY3FEeXlLamNwSXdZ?=
 =?utf-8?B?aHlZOEo3Uzl0MUNUQzU3c2FLazV5amNUa1hHUlh6eFRqR1FqUWV3bFJoS2Vq?=
 =?utf-8?B?cUYzYVdyOHI2TEp6c3ZOTlVBdy9pQlRNWWVndlRKejE5bTdXTVFoVS92QXla?=
 =?utf-8?B?UEhySkF4aUtsNDkvMFkwc0U1alJObGVZN1hkZXlMR1Z3UlBiTndiNnZibmRN?=
 =?utf-8?B?RURIdmoxaXM4YmloQktndmpqWWdZZThNZ2FoY3dqMCtDcStsZXBqcGVMaGt6?=
 =?utf-8?B?U1gvcitsUDdZYzNPQlVjQmFtZHQ4cFBGQkFKYkVqUWZrRGQvWFVOYWN3S0NC?=
 =?utf-8?B?TUVHRTFPVjNEUG5oeGFDdERQQ3h4eGVPeWlGVTcxK0F5dXJVcUJwT0FIN2pR?=
 =?utf-8?B?aTRETmYwaHFXTWlneFNFbzRtMUFTS0hpRDJVcFFOWm1uNnNZYTIwWWRMQldL?=
 =?utf-8?B?UDJEblI0TWMyYXdubk4zUkZzRmVXaEpENGpob2FSSnZSd1cwczFwZ05VZ3JX?=
 =?utf-8?B?cCtjNXlEVjVDa2djVVh0THNnVjZCN2EwZitKUVFvOGRMRFcwdFJWNk1EdDNY?=
 =?utf-8?B?dVZwVzlDZEFuL09VSnVxenZTcE9VVlFYam1EbllOU1RKYmFIMzVoRFgwT2Zz?=
 =?utf-8?B?djFaVTdHYmJnV3djYk9OWU1XZEdjODdnL1k0SDZyRmMwUDhKNFFSVmladkNR?=
 =?utf-8?B?cmVNQ3ZrMTdaK3QwNk0yV3NuN1BnMHNmb1VONHZoVXV0TzVuc1p3cm0xOXhR?=
 =?utf-8?B?b3czUmR0UFdObHA1RUtFeFVQUHFoaFdGdk01dkJUcWM3MGdwa2dQckZlOTlT?=
 =?utf-8?B?LzdoYVdFVUIzdCt6bDB0UkNNUGVTMW5DMjkwRTVNbDJlTUdhMDBhUE4vWGdl?=
 =?utf-8?Q?oxpfzyaOx83nrd0bXN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ffeef2-d3e1-4da6-5194-08df1d3ae1cb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:31:24.4485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vvO98fH3Y0egQg277lr+abtonyjv2IbnnXbqt2lNnu5eBmTRhmKgXx2xmcBBIQpUsoD1K/EvVa+9lORJZsXjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9143
X-purgate-ID: tlsNG-ef75cf/1790584288-A72DCAE4-29A9D3A4/0/0
X-purgate-type: clean
X-purgate-size: 1997

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

All review I already did on this was on the applied patch. I find the
diff a bit too unwieldy. Perhaps it might be good to add the new logic
on top first, and then remove the prior logic.

Something like:

#define RCU_USES_EPOCH 1

#ifdef RCU_USES_EPOCH
<old rcu specifics>
#else
<new rcu specifics>
#endif

... then have a last patch that drops old RCU code. Structs, older
functions, etc can stay until then, because they'll be removed later.
It's just a means of shrinking the diff in order to make it tractable.

My .02, anyway. Perhaps you already tried and it's terrible anyhow.

Cheers,
Alejandro

