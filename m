Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4A4C53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 12:25:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375708.1622781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp3Li-0005nM-EC; Wed, 29 Jul 2026 12:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375708.1622781; Wed, 29 Jul 2026 12:25:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp3Li-0005nF-BO; Wed, 29 Jul 2026 12:25:26 +0000
Received: by outflank-mailman (input) for mailman id 1375708;
 Wed, 29 Jul 2026 12:25:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wp3Lh-0005n9-G8
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 12:25:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp3Lg-00EOFv-Sb
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 14:25:24 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a69f130-2eae-0a2a0a5409dd-0a2a45069f56-20
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 14:25:24 +0200
Received: from [52.101.48.7]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a69f132-195a-0a2a45060019-34653007cdb3-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 14:25:24 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA0PR03MB5449.namprd03.prod.outlook.com (2603:10b6:806:bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 12:25:20 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0245.012; Wed, 29 Jul 2026
 12:25:20 +0000
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
 b=tjPty20R9kfCSUtTsUJJeEAGnvTMMFzn0DXP379seeJloMhBhz5h8tQHM64puuTghuQcgc1EE4hstZRkuZbiCct9mviDnT2ik1imHjkaw+X94PIZUBRcb/YuKkc1KdNPwrx5FBbNKIwGH9gkCcMLi+Jt/Sr7fJqcbR5I+pbSx/8fGlKJ+HyKLPtXQm2qs+jemDoP4FIc2Tr0fsnJoIUuYxTphWyaGzsBLWx0rF/Q2hufBDTwyjY7ym427N+VChBHSLJ8iiB2KnbY0SSx5t6j9S+hWQ/+UMA8eWHpGklig3CM9b+eOGI3shJsHfTp0oI4nu0r+N3YkRShQ6kz2kKngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRTr+MpMRahb8jgY2LaKs0uMyDWCcmLT0Dg1sYdhLGs=;
 b=xVrfT7Yyzj2rXfWgCT6TK4rEvNSD4n/SxMZgQ2F/Zb5DF5Fiib86AqITY/pMRbHaQv3Pp2fpugXv5eEN8hl0O7YLO8DUmelwwaIf8ps2mqOfA0zOarcnY1i61gik1puKF1ociDyWTi37bdI6D3WLtTVv3CBVR4EbJBPxJDdeTgHYfWU9AGE7JFcIlOGPRFcAUiWAwEtR9cI5Nf6r+A7PLbWgYGQD11wb9uMAtSmcRkMOa/xiFCnrKSU0shQsFBFAO0vE2QZ4HA1K39wmOjvHZszZwX+WusBGaE9qnM3jdvW/fVpQffspkuU5N9StCQbqfLDfLfM7wVdsLW1oiRHxDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRTr+MpMRahb8jgY2LaKs0uMyDWCcmLT0Dg1sYdhLGs=;
 b=Zapq0CXUQuUx8I24KDlUxEXSpv554ASRUh+uxUyTUPJlFGVx5eIFXFsRFOLgARcasDH4soj3UEIZ01TGS1dNwfTVFI6OKrebKPwCqsAYpZ1RUO1wtg03n0MIx5062uEeNTnWHrRxqAUtnFhcezz16La2+vkNiSySqhmTyWOVc8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <92e22a7f-b38d-46f6-8380-915434910a9d@citrix.com>
Date: Wed, 29 Jul 2026 13:25:17 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Dietmar Hahn <dietmar.hahn@fujitsu.com>
Subject: Re: [PATCH 2/2] xen/sched: fix schedule_dump() handling of free cpus
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20260729120643.327387-1-jgross@suse.com>
 <20260729120643.327387-3-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260729120643.327387-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA0PR03MB5449:EE_
X-MS-Office365-Filtering-Correlation-Id: 15b6d13d-d1aa-48e8-42a3-08deed6c74b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|4143699003|10067099003|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	e47FkXgB4Pf6/RcJRWebzIrcYiaG+k3+tbiLz9RW+BvxLFG17Xh8gHOAExMqCx4+lKrB8TadPB2vL8x1hUlYR5cmbidKa/dddYk3g0kbpHW8ePNRJmuSs5Cp+C51m59udTkTXnTL50zk65ywNyJZzeRla5VhGE29xIv6pvrPzkoFW2Ur+XgN1U0SR8647ng8NvKbN002snVBxo4kRfEm206QNqrb2Mrq9Ys3Vd4zG5iQfDDCTrIAulbmieD9Kpv4XaWeyb3XhCMarQFRfWQ5E+SRUQkJDnZ8uw+63+vPj5I/7Te5K7MmiDPCd8cRAsN6sAW1LjPb3lV/bNUnDgFe8b3s62B/SOIQLU5WZET+P4Ea4+M9e8xBlEW9ug/qjHOYm6xwJkUsDXPtMqUWt3C4kEsCC78YyoNItlP6jZouzJL/nOK4UdJ7Pg2Q8Z31aYxBg3rxRENI/jqx/A4SHpwhMylw3dReSV+siRpxTSTsdXcs5bPvVkjU82IQImnVd8++2N5q7uciKk7h5QQHUAbyV5YPkGAc19NKw8doLjtQ8CHadmefjyq+wgQgsDC4jyWyEbHWOptEOnQVHsuob2W4sWYeISkxSGSpdW4LseUOcuZAoxJYJVaAOh2uydFXsIBv+HTBGwjA151LjEzA2nKuVyTBgVlYmS4L78j3V2n07vA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(4143699003)(10067099003)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUtsUlFGWFgwZnZWeDdpQm1SbC9qMUVhZjRJci9rOUtmbDFlQ0pMSHRlTHB2?=
 =?utf-8?B?bnNPTkFLMWNWQTNpTjZKQitZQ1dKNGdaVUw0TVlUaUVhODdJZHp2MGhhS1B6?=
 =?utf-8?B?eVYyQkxQQlNwNmhCOU1admFhNzdrWnBzQ213d0w3SXlVdlJyMnJHQllNZng5?=
 =?utf-8?B?aDdpZHVBRXdQVmViZmY1ZWc2aERpZXV5Ymo2ZTlTMXorWXhtS05EN0VzMm94?=
 =?utf-8?B?K0x6WG84YlNrakZYajJwaEZEWW1OMkNLanNScWFsSk1kRU9MUmFaZ1B4QWFt?=
 =?utf-8?B?VlZsY25KSE16ZVBWTjZWeVB1dFhYYksxSTVzb1hCQ3k3Z0t1SmlvMHdnZHdO?=
 =?utf-8?B?bFlyQ1B3bC9LbTdUeGFuVzIrcEhqQnNia2piUW9CZDdzUnYyOUJOY2RqVW5S?=
 =?utf-8?B?K3NaejdJZXVoWHNVWUZZMkovL2l3dDNYY3kyZE9kWHJuSlNCUlZDQXIxbFRN?=
 =?utf-8?B?U21pbCs2YllZMVJlTDJNQ1lMQlducFVTWEc1VHZoNUNLMDFUZUxWS0pHa2xK?=
 =?utf-8?B?di91KzVOb1plbjNPMXk2c3d1dWZjQWo2VlRqcXRVRVFDcTdJMk5wRDROM3lB?=
 =?utf-8?B?TXE0TjNHdnB3RDduNEJ3ekRHSUYyMU5yWmZ3VDAzbnJlVDUrVkdCN3JxV0Jk?=
 =?utf-8?B?TWphcnBMRld4WVRtMU80M2FiZlNFbUsrcFJRL3lLOWgxdmJVOWxxRU5lcFJK?=
 =?utf-8?B?Z0tSR1pMNjhkcThQeGQ4TFNuM3l0andIc3ByaVBPUExTaXByemN1d2hBajlz?=
 =?utf-8?B?OEsvcFFnbGpFZjJwOTloaWpjTExBS2hXcGovTlNBRU1SaFhJUEVHbXZPam1T?=
 =?utf-8?B?MFNTcStVa2dmNkhuTExVWnI1MzM4UDFOTFhqNXRsSDRldnNuYTZPSFY3R1dL?=
 =?utf-8?B?R2J6QXhPbUkwQ2laZCt6R0txazVkUTAzMSs0bUhwZWE2bFlYWHE5VGw4RS9m?=
 =?utf-8?B?azRhYndLS09TMUdKZU5CTitzQU5va0gxaStNU1lMdWhMYzgxdHY5MDlVSllr?=
 =?utf-8?B?UVB3MjZPcmExVHVGbkszYkRsRmJkUFVxNFQvdmlMMlNmUDhIYW5SbyttaEhE?=
 =?utf-8?B?dlhJbjhqSEdVRzhneGp0azV6UlczZ2FhbmNDMDlIYkptMEZOT1BEdnBhMFpT?=
 =?utf-8?B?eFArV0hRUUR1Zi8xS0tjRW8yOUcyWjJiUEd2aE9ZS3FyUkQxOVVkQUE0U1JL?=
 =?utf-8?B?MU1JUmgxSGlsaS9HMHp2dno1V1lUcldGQlBqbTcyZEI4bXVra3NtQmxBdUk4?=
 =?utf-8?B?SjRmVGhXbU1kc2tVTktOQUNYdVZFNFlNd1J6ekNDOWs1aDY1NVFsSDMyN01q?=
 =?utf-8?B?OVBNcWx3TU5wWEtSZ0NweUFncVl1djViK1YvNTdqbnJFV2dwMzRob3NBdTht?=
 =?utf-8?B?ckIvNnk2YVBWaE00cmJLMUhiYnlBZ21XczRUcXQ1OGxhNEhjdXltcU5ZR2JQ?=
 =?utf-8?B?RVF6ZEQ3czUrOE55M0FUdXRQMStQc3ljSndXVElBbERhTzJUYWFzN1I3UE1t?=
 =?utf-8?B?RHdKL3dQYkMrNjhmT3J2dWtMRHdhdjQ0aCtvQkRkNmFhNnBCWnNyblV4a0lW?=
 =?utf-8?B?WVVkNWI1U3kzYWY4NlRuYlZ3My84NkU4T2tNRzlvdjlVcG1EQkkxMjdXYTRo?=
 =?utf-8?B?V3BuR2JhMW1wZkt0T3cxYkI2UWVmOUhXTHNNTFNoV0ZGUWQwVzNmMnZDbHBO?=
 =?utf-8?B?S2pUaFEyTGFhVUF1T1hUd2w3L0Fvbmo2V1pybFFjNCtGdk5qNmF3NC9TenlX?=
 =?utf-8?B?S2FqMmVhaVRZeVNvY2RLbjF5S1k4eTVYc3hScHhVVUdRaHpSM2d6ZjIrLzNM?=
 =?utf-8?B?dDFITUxxQWJKS3RzT1hOZXllckxGVC9LN1AyaklVS3VIdEk4WTlBNGdJaU1T?=
 =?utf-8?B?VkJWQW9Ca1ZZN2lRdzNzMkxPNGI0cHduOW9WeWgzN0ZhdXlQenlHeHVnQTZ6?=
 =?utf-8?B?Uno5OXc4MkVhWUxoU3RzM0hNUXV1OG8vbzlvTkpxVVhpNUM2UVk0NFhINCtP?=
 =?utf-8?B?OXBiNFN6SjdmcFg5am4rakMvSVhEbjZYYnI3bHJZajcrMVhWOEppaEpkRk1n?=
 =?utf-8?B?YkcvY0kzQi9UNXBiYmdNMlY0R0FiNG1EUjBFVHV6ZXRwU0FnaGhnUFB6VUxJ?=
 =?utf-8?B?RnRwY3dHYmNMQXNFMEFWNCtKM1ZSNXdFUGFsYnMwSnYxbjJRL29tckFNSzg5?=
 =?utf-8?B?VURaU0lYZld2aE5Ba0NkbGpqZUR5UTZWNEJLaW8xL0hqV05qdTFEM1lNUHE1?=
 =?utf-8?B?bDR4YWEyTjlURFo2czI0K2dCOHNHbFUzRmt6dWg0NmdGemRuY0k5YWJaQjkw?=
 =?utf-8?B?ZHN0eVFmai92dmpiUmJIdTNWK1ZhdXUraDhBRm9pQUxrSDhtdWRRdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b6d13d-d1aa-48e8-42a3-08deed6c74b1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 12:25:20.3954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/HS5aLGAbLtRDTZ8R13L3laX075NIwZ9MipD+137xucp58UPB8pebfJmYxl/q4/VWdGuyA3jdAmI6eYmfe5DvQ87JNC5R62m+Ad5TxbdnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5449
X-purgate-ID: tlsNG-16d1c6/1785327924-F74C977B-A9D3197E/0/0
X-purgate-type: clean
X-purgate-size: 1450

On 29/07/2026 1:06 pm, Juergen Gross wrote:
> With the introduction of core scheduling cpus not used by any cpupool

You want a comma between "scheduling, cpus".  It took a little while to
figure out the correct parsing of this sentence.

As written, it's ambiguous with one interpretation being "With the
introduction of core scheduling cpus, ..." but with a grammatically
invalid remainder of the sentence.

> have been switched to use the very simple idle scheduler instead of the
> default scheduler.
>
> Trying to obtain diagnostic scheduling data via the "r" debug key is
> scanning through all cpupools using the per-cpupool scheduler to print
> the related data. Unfortunately the switch to use the idle scheduler
> for free cpus wasn't reflected in schedule_dump(), causing the default
> scheduler's dump_cpu_state callback to be used for free cpus.
>
> This causes NULL dereferences in case the default scheduler is one of
> credit or null.
>
> Fix that by using the idle scheduler instead of the default scheduler
> for free cpus. Note that it is fine for a scheduler to have no
> dump_cpu_state callback.
>
> Fixes: f855dd962523 ("sched: add minimalistic idle scheduler for free cpus")
> Reported-by: Dietmar Hahn <dietmar.hahn@fujitsu.com>
> Tested-by:  Dietmar Hahn <dietmar.hahn@fujitsu.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

FWIW, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


