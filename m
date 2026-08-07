Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E516DC5AC82
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2026 08:09:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385832.1628205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsFdK-0003RW-V8; Fri, 07 Aug 2026 08:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385832.1628205; Fri, 07 Aug 2026 08:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsFdK-0003RP-SS; Fri, 07 Aug 2026 08:08:50 +0000
Received: by outflank-mailman (input) for mailman id 1385832;
 Fri, 07 Aug 2026 08:08:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1wsFdJ-0003Pv-AV
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 08:08:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wsFdI-006B0U-B4
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 10:08:48 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a75928f-bab6-0a2a0a5309dd-0a2a4502c0aa-0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 10:08:47 +0200
Received: from [40.93.198.2]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a75928d-6ca4-0a2a45020019-285dc6022029-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 10:08:47 +0200
Received: from PH7PR12MB6467.namprd12.prod.outlook.com (2603:10b6:510:1f5::14)
 by SN7PR12MB7346.namprd12.prod.outlook.com (2603:10b6:806:299::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 08:08:41 +0000
Received: from PH7PR12MB6467.namprd12.prod.outlook.com
 ([fe80::7b8:36ff:4c76:46de]) by PH7PR12MB6467.namprd12.prod.outlook.com
 ([fe80::7b8:36ff:4c76:46de%6]) with mapi id 15.21.0292.019; Fri, 7 Aug 2026
 08:08:41 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=woM3NgpM3IidDHJtcHG76LyptG9cHNCLdJe8t4awZ1RimG1eeHx5r7Wcq7J/2E8klYapX2ifihugV9rSbXpZjZE/fv1cy8dD8qp9YSP+QwkkYtNk1eMKqylbEE9twth5I3WLRPmPxIOpcG1Fhzmca2eOexOjKFfoOsdtDZ68ML2lSYViMk0IOljnf2NvCV2B1IUe43PkF7TKot/GyjFtAijRE+TcwkS0YloZxwnj8AXEDQ4LxUDdHcXjMkE05PMtwRSCVyS/nxCpzlh/aTHdordzhJre69rwBAoD6F+6auUvxFXaKE1pTHlA4zZwEcGwaoXZ3xF84oPRFG2zFkn6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuG3C0E+vQjBn+CrawwxKulOSJySFub1hoxtYYsjEb0=;
 b=tmeEmLCdK4kgo4w9zYL00RM5scGa+OqMYTkq/dNk2/41rZUwqf1uPzzErIsg+dfMfOQcafp8MOzd6LWAeh4WzDEnIjkROpqgWwTgbGu7b+edxMfusKh7Fhy8z2s32eMOBTDLhyNujKQSvx40Pd7ewXtNtYnHbkOpZ8JG5as+bcGZWgFac+kyrGJ48UIC9wLY+PO/TD2B6zuSUA0xNoaFcY2L0aO9bVLCtJtNjxCm04XANmzLHw5cL/pQSy+U0rZgWOE4hIS3Qgu8FoxG4QH+B1Iuingss1+RRb+0Ynz0/JndZDiG8B9TThua1ZCfqgLnr/rtA2NSMmP7tobrGQNXPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LuG3C0E+vQjBn+CrawwxKulOSJySFub1hoxtYYsjEb0=;
 b=cp+IXF3kYg6P4nLaytA9sLwd3wmmwL+lJVXt4h6mYPwNXrB3G0gdOTREQW0LvSDskTwpvRjveIanbyToD8gKrnLt/tmgSeitSdgzDAE0hpZL0LYWsNWIwKSKang8GbuREpjpmZ5Nh/8FyFgHEMPvAGYk+CofZwxeGN7L/wUPoAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b162fe11-1a47-4120-9c61-acec2f5bac1a@amd.com>
Date: Fri, 7 Aug 2026 10:08:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/sched: split scheduler vtable from struct
 scheduler
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, jgross@suse.com,
 gwd@xenproject.org, dfaggioli@suse.com, nathan.studer@dornerworks.com,
 roger@xenproject.org, anthony.perard@vates.tech, julien@xen.org,
 sstabellini@kernel.org, michal.orzel@amd.com, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com, teddy.astie@vates.tech,
 tpearson@raptorengineering.com, alistair.francis@wdc.com,
 connojdavis@gmail.com
References: <20260804055327.22119-1-frn1furkan10@gmail.com>
 <20260804055327.22119-2-frn1furkan10@gmail.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20260804055327.22119-2-frn1furkan10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::7) To PH7PR12MB6467.namprd12.prod.outlook.com
 (2603:10b6:510:1f5::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6467:EE_|SN7PR12MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f8b5865-96a7-4389-f84b-08def45b172f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|6133799003|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ey/7PWvsiJCg+mfjTAsMXyDW1YZr70I008K94rLw7DpgmxNLV7lxtLu73uwzbKnOsbPw96/tfTpodFJgKAgma9U5JWKVMWFHPhSU/RCjLifif4EkvzgCYQGp+a54BrKXRKbQb8aEoxcNlsZGvWlB3rZRpqHztjPJey28bTlcBJ2OTnTmo8N5weO79zJ8x/mlKR+NsqIyON8GvYgZYJ9JvW1PaHSWKCeAqTZrDq8owA6jWmkCgbe8P+O9b+oM6ZmvucpzNWC1glN9F6LTT+YJgOEv3hhT6gE6KPYNJ6jsV3CFfoToGQpYFeX29opkhZn9SiizX9pKWHZUpdNPGQgMwHB6FLdqZ70NzqknTkQ/WN9nZcAuH4XfC3m8HMbGJRKbeLSueyCv5ilz5sUGQYSXUXrbsWYmBRpmkrujbbSfh6CgNit1EH1qeKYmoH1JpWR7kfM3D57mZzOA5euRKxJmCSF2tVCNTWLOAO2HaCt7FDo99K86kv3uME+KMYxPC4sVNY6afbTCwMHxFa5rvRM/+oZjMMlnqrlrCBn3irEJ+iAGktbxjR+Fhaica8ctzLppajKKZuWFc3wJ5kjJukQWaHm4yjaCyqsHn/lNROZYMfl4x/4MBsGpJMH/JOuY2aj+roni27li2qjXUT/sbCUM/twTI2SjQFVLpBgSUl/TVa4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(6133799003)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXJQSnAydGwvWk5veXdkMS93cEp5MFlqbHdnZmxPNWJEL3lwL1ZzNDRSR2Ur?=
 =?utf-8?B?dUpDQndzcmp3VXFpQmFlR1B5VFJKYU1aTWdWOCtNTC9SWks1R0ZibkZnTStT?=
 =?utf-8?B?S2hYRlY4RFBBc0NYNElCanhNZGtGb0ZyMXNNVHpOT3Z0RVQ1cU81QWpQdjdk?=
 =?utf-8?B?UzNlcXd0ZDZ4RUhXQTYvallPbmxtTlpxRWk3MVNrdDdqQUVVcXBLWGdEWmEz?=
 =?utf-8?B?UjNSai94dU03WG84dU8wVmMvNVhYa1BuZ2JJa1VpNE1PWjlQWkFEaFFFNTg3?=
 =?utf-8?B?WklJa0V5aGhXd2w1UjN1YUoxSjZsUUtmS2ZVMXZTeUJFTGJZS1B1U2o2TWQ2?=
 =?utf-8?B?LzhkOEdhWHVmczU3d0cxQUhPajJ2SlZzdWFGSGdQVi91ZUowQmhnbDhnU3A2?=
 =?utf-8?B?dzBQSEE3Q0lVdzNmVWtCZTE5QkthTXpEcXRLZkI2WkYvUTd0UlpzZkxJTFpa?=
 =?utf-8?B?YWtETG9jYkJPYU91anJROURxTjJ4Z2pnTWFNTnZGTkNpeGNFYkQ4QXk1Nmd0?=
 =?utf-8?B?Uzd3dXNRSEJ0emlkdnRBZUJpcENjS2UrTWR2OG8wcitCbXZQYjBpVCs0Wk5J?=
 =?utf-8?B?S1N6Y2VrZGFLOUxueXNtaGZEaHd5WmQzSnFOSDlyQWE5Unl1bUlNcFlXRlA3?=
 =?utf-8?B?WFFWelVVbGZZNk1oN3llYkNkMlVLTXZqcW5WUHFwTUJMbHJwdk5zemRzU2wr?=
 =?utf-8?B?SEFmcm1LTytkY2V4L2lSdHF1N3NvRzJCWDNYTThRdERneE55RjFNSEZHMjRj?=
 =?utf-8?B?cXZNYW5yUC9BeGxtaDI1R00vWkxodE52bnJ0dzMwV0xrK21zS0VxQkJpUjRx?=
 =?utf-8?B?VFRqUVU4QjNLY2dUWlN2bmFqdDB2YXFScWowMWt3Tk5LYmU2dC9pQlZXeEt1?=
 =?utf-8?B?ZnRqaGxoRW9LdkVuTmtvTkpRaytUdGRBNVJhZ3JBM3o1R1NIeWtVRWtjanRw?=
 =?utf-8?B?ditPREJpRXZYNGI0OVZ2NlJCU3Y2QjZMbTFJYXNKOXJMR3hmUnl1QmtrbTBT?=
 =?utf-8?B?OWJ2b0lRVUxsNlRWeHpzbjJZUTk2OVcxVS9MZDlQVVpaSVlaZENZRVIrdElw?=
 =?utf-8?B?bDkyU1dsR200V2U0ZFdrNVk3L0h5aVdtQVprQ2ZFdERvYTBjck1zaHVCN3FB?=
 =?utf-8?B?T05DQUFrektEc0thWXBtNWxDVVc4ME9zNkRycXBMWU9jc1lFTFYzanZLeXQv?=
 =?utf-8?B?NStvOVNGb2RuVEtBYS9BVzNCaXdjSE9lUk1Gc2hxZkVRcXAyWlpNVmJxOWMr?=
 =?utf-8?B?SmRLQlp6MHZhTTFPdURJRTBVZVl4WGI2ZDkrd3ZuVjFOZFFxTWNRbkUyU0hw?=
 =?utf-8?B?dE9tNzdsSXVTOHNpeEFuUG9jdWdqL0tOYXIxRE1GQ0xXblZwSVBaTXRkRDI5?=
 =?utf-8?B?U2E0YUg3a04rNUNOTkQzQzgzS0tVYU5TZmVPcU45bkxUdzlDd0dVS3h6V05X?=
 =?utf-8?B?NUlwc2J3clhZNEdGRElpVU5jb1Z2dUc2NE4zbHN3YmwxK2lqRGtPU1huVE1V?=
 =?utf-8?B?SEJYbGJhTEZoWGNHSk9WNW5BcTljODlnYURCOTN2OWdneW9IU3F6NUEwL1My?=
 =?utf-8?B?a2tza2JWQmhPQUIyWU1hMEIyenh6aHg3bUtZcXZjZVdhK0NVNmxSMzgxckph?=
 =?utf-8?B?Rm1FczZVVXdEVWJHNVJYSERKTWpGNlYydkFDNUtwcFNCWFJTN0N5ZFVWOU1z?=
 =?utf-8?B?Q0MyOTJHak1YVzV6QW5hRDNCZzQyUTNuUE4rcXlXRTY3cjVONlFvSCthVFBM?=
 =?utf-8?B?MjRNV0taODQzUGRITnlla0RVaGtlaGRPVWI0cG80eDVHcnlweGlhY1MveUdD?=
 =?utf-8?B?YUorY1ZqTTZTM2RmSGhSWHBYbk1DWDA3cnpIb1ZDSGlPeUo2RUN6V3gzR3My?=
 =?utf-8?B?MUsvVldadlJvZXo1ZjE0amRnUW01MnpTR0Jpd0Nodm1rbEZMVVg5V3g3R2wv?=
 =?utf-8?B?OThCQnpnaUtmbmZTRmc0Q2lGeW5xYnRYbDZIZ2dPZHorSUZFRTA5NFRlaTRk?=
 =?utf-8?B?THVjNmVXM2RRWU9SMXp4V2ZpcXY3a1dzMXBLTU9NWUIxN3NGMTJBMUVUYXZ6?=
 =?utf-8?B?di9seUFyWGt1b0VxWnZGZ1p3dnl2ZEF6WHVpQk1kV2F2L1hGbXpkTmVMNEdN?=
 =?utf-8?B?WmZGTUx4M09MQnBUTDc2ZEZBWHVpZFNYY1NsV0VFQzJaNnFqeWJvbzhVUnFB?=
 =?utf-8?B?UkNqeEZMVk85NEJLVFRMSHpYS3Z2SzVJR2ZjT1RvRXdqaHBXUHRhMkdhUzdJ?=
 =?utf-8?B?ekFLZEJqM1lpMUl5N3UzVXdNemtYZWNZeHR6czFIbGpGUVlZMHJaUVR4SERq?=
 =?utf-8?Q?/wN/3sqvLuQYrjOx3q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8b5865-96a7-4389-f84b-08def45b172f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 08:08:40.6399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jgvzTlOKLO4TQ1/pJuXJVVWe53JqY+ZXP/HIEUsNpHvcZ1NxMvNKaIoX6/S9SrGXm4GrWqsjUwVX2oaM9zAqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7346
X-purgate-ID: tlsNG-720697/1786090127-F06A72AC-02582F36/0/0
X-purgate-type: clean
X-purgate-size: 13945

On 8/4/26 07:53, Furkan Caliskan wrote:
> struct scheduler currently serves two purposes: it is the static
> vtable a scheduler backend defines (name, opt_name, sched_id, and
> all its function pointers), and it is also the per-cpupool runtime
> object scheduler_alloc() allocates. Being the same type forces
> scheduler_alloc() to memcpy() the whole vtable into a fresh
> allocation per cpupool, duplicating identical function pointers
> across every cpupool using the same scheduler.
> 
> Split the vtable out into its own type, struct sched_ops, so it
> can be shared by every cpupool using a given scheduler instead of
> copied per cpupool. struct scheduler is left holding only what is
> actually per-instance: a pointer to the shared sched_ops, plus
> sched_data and cpupool. scheduler_alloc() now stores a pointer to
> the matching sched_ops instance instead of copying its fields, and
> every accessor in private.h is updated from s->field to
> s->ops->field to match.
> 
> Every in-tree scheduler backend (credit, credit2, rtds, arinc653,
> null) is converted from struct scheduler to struct sched_ops.
> 
> A handful of call sites elsewhere read a scheduler's name,
> opt_name or sched_id directly and are updated to go through
> ->ops as well.
> 
> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
> ---
>  xen/common/sched/arinc653.c |  9 +---
>  xen/common/sched/core.c     | 52 +++++++++++---------
>  xen/common/sched/cpupool.c  |  7 +--
>  xen/common/sched/credit.c   |  3 +-
>  xen/common/sched/credit2.c  |  3 +-
>  xen/common/sched/null.c     |  3 +-
>  xen/common/sched/private.h  | 98 +++++++++++++++++++------------------
>  xen/common/sched/rt.c       |  3 +-
>  8 files changed, 89 insertions(+), 89 deletions(-)
> 
> diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
> index 32c596a23c..746963806e 100644
> --- a/xen/common/sched/arinc653.c
> +++ b/xen/common/sched/arinc653.c
> @@ -702,17 +702,10 @@ a653sched_adjust_global(const struct scheduler *ops,
>  }
>  #endif /* CONFIG_SYSCTL */
>  
> -/**
> - * This structure defines our scheduler for Xen.
> - * The entries tell Xen where to find our scheduler-specific
> - * callback functions.
> - * The symbol must be visible to the rest of Xen at link time.
> - */

The removal of the comment about symbol visibility is a definite improvement,
and I'm okay with the overall comment removal. However, next time I'd prefer
this to be mentioned in the commit message.

For now, I don't want to delay this any further, so for ARINC 653:

Acked-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

I will still give some additional remarks below, but I don't consider them
blocking since they are nit/cosmetic and Juergen already gave his R-b.

> -static const struct scheduler sched_arinc653_def = {
> +static const struct sched_ops sched_arinc653_def = {
>      .name           = "ARINC 653 Scheduler",
>      .opt_name       = "arinc653",
>      .sched_id       = XEN_SCHEDULER_ARINC653,
> -    .sched_data     = NULL,
>  
>      .init           = a653sched_init,
>      .deinit         = a653sched_deinit,
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 9ccf5811bf..5cdae0415c 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -87,7 +87,7 @@ DEFINE_PER_CPU(cpumask_t, cpumask_scratch);
>  /* How many urgent vcpus. */
>  DEFINE_PER_CPU(atomic_t, sched_urgent_count);
>  
> -extern const struct scheduler *__start_schedulers_array[], *__end_schedulers_array[];
> +extern const struct sched_ops *__start_schedulers_array[], *__end_schedulers_array[];
>  #define NUM_SCHEDULERS (__end_schedulers_array - __start_schedulers_array)
>  #define schedulers __start_schedulers_array
>  
> @@ -127,10 +127,9 @@ static void cf_check sched_idle_schedule(
>      unit->next_task = sched_idle_unit(cpu);
>  }
>  
> -static struct scheduler sched_idle_ops = {
> +static struct sched_ops sched_idle_sched_ops = {
>      .name           = "Idle Scheduler",
>      .opt_name       = "idle",
> -    .sched_data     = NULL,
>  
>      .pick_resource  = sched_idle_res_pick,
>      .do_schedule    = sched_idle_schedule,
> @@ -139,6 +138,11 @@ static struct scheduler sched_idle_ops = {
>      .free_udata     = sched_idle_free_udata,
>  };
>  
> +static struct scheduler sched_idle_ops = {
> +    .ops        = &sched_idle_sched_ops,
> +    .sched_data = NULL,
> +};
> +
>  static inline struct vcpu *unit2vcpu_cpu(const struct sched_unit *unit,
>                                           unsigned int cpu)
>  {
> @@ -2081,7 +2085,7 @@ long do_set_timer_op(s_time_t timeout)
>  /* scheduler_id - fetch ID of current scheduler */
>  int scheduler_id(void)
>  {
> -    return operations.sched_id;
> +    return operations.ops->sched_id;
>  }
>  #endif
>  
> @@ -2090,7 +2094,7 @@ long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
>  {
>      long ret;
>  
> -    if ( op->sched_id != dom_scheduler(d)->sched_id )
> +    if ( op->sched_id != dom_scheduler(d)->ops->sched_id )
>          return -EINVAL;
>  
>      switch ( op->cmd )
> @@ -2132,7 +2136,7 @@ long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
>  
>      rcu_read_lock(&sched_res_rculock);
>  
> -    rc = ((op->sched_id == pool->sched->sched_id)
> +    rc = ((op->sched_id == pool->sched->ops->sched_id)
>            ? sched_adjust_cpupool(pool->sched, op) : -EINVAL);
>  
>      rcu_read_unlock(&sched_res_rculock);
> @@ -2299,7 +2303,7 @@ static struct sched_unit *do_schedule(struct sched_unit *prev, s_time_t now,
>      struct sched_unit *next;
>  
>      /* get policy-specific decision on scheduling... */
> -    sched->do_schedule(sched, prev, now, sched_tasklet_check(cpu));
> +    sched->ops->do_schedule(sched, prev, now, sched_tasklet_check(cpu));
>  
>      next = prev->next_task;
>  
> @@ -2989,10 +2993,9 @@ void scheduler_enable(void)
>  }
>  
>  static inline
> -const struct scheduler *__init sched_get_by_name(const char *sched_name)
> +const struct sched_ops *__init sched_ops_get_by_name(const char* sched_name)

Nit: whitespace: const char *sched_name

>  {
>      unsigned int i;
> -

Nit: please retain the newline here

>      for ( i = 0; i < NUM_SCHEDULERS; i++ )
>          if ( schedulers[i] && !strcmp(schedulers[i]->opt_name, sched_name) )
>              return schedulers[i];
> @@ -3002,16 +3005,15 @@ const struct scheduler *__init sched_get_by_name(const char *sched_name)
>  
>  int __init sched_get_id_by_name(const char *sched_name)
>  {
> -    const struct scheduler *scheduler = sched_get_by_name(sched_name);
> -
> -    return scheduler ? scheduler->sched_id : -1;
> +    const struct sched_ops *ops = sched_ops_get_by_name(sched_name);

Nit: newline

> +    return ops ? ops->sched_id : -1;
>  }
>  
>  /* Initialise the data structures. */
>  void __init scheduler_init(void)
>  {
>      struct domain *idle_domain;
> -    const struct scheduler *scheduler;
> +    const struct sched_ops *ops;
>      int i;
>  
>      scheduler_enable();
> @@ -3044,21 +3046,23 @@ void __init scheduler_init(void)
>          }
>      }
>  
> -    scheduler = sched_get_by_name(opt_sched);
> -    if ( !scheduler )
> +    ops = sched_ops_get_by_name(opt_sched);
> +    if ( !ops )
>      {
>          printk("Could not find scheduler: %s\n", opt_sched);
> -        scheduler = sched_get_by_name(CONFIG_SCHED_DEFAULT);
> -        BUG_ON(!scheduler);
> -        printk("Using '%s' (%s)\n", scheduler->name, scheduler->opt_name);
> +        ops = sched_ops_get_by_name(CONFIG_SCHED_DEFAULT);
> +        BUG_ON(!ops);
> +        printk("Using '%s' (%s)\n", ops->name, ops->opt_name);
>      }
> -    operations = *scheduler;
> +
> +    operations.ops = ops;
>  
>      if ( cpu_schedule_up(0) )
>          BUG();
>      register_cpu_notifier(&cpu_schedule_nfb);
>  
> -    printk("Using scheduler: %s (%s)\n", operations.name, operations.opt_name);
> +    printk("Using scheduler: %s (%s)\n",
> +           operations.ops->name, operations.ops->opt_name);
>      if ( sched_init(&operations) )
>          panic("scheduler returned error on init\n");
>  
> @@ -3411,12 +3415,14 @@ struct scheduler *scheduler_alloc(unsigned int sched_id)
>      for ( i = 0; i < NUM_SCHEDULERS; i++ )
>          if ( schedulers[i] && schedulers[i]->sched_id == sched_id )
>              goto found;
> +
>      return ERR_PTR(-ENOENT);
>  
>   found:
> -    if ( (sched = xmalloc(struct scheduler)) == NULL )
> +    if ( (sched = xzalloc(struct scheduler)) == NULL )

The change to xzalloc deserves a mention in the commit message.

>          return ERR_PTR(-ENOMEM);
> -    memcpy(sched, schedulers[i], sizeof(*sched));
> +    sched->ops = schedulers[i];
> +
>      if ( (ret = sched_init(sched)) != 0 )
>      {
>          xfree(sched);
> @@ -3447,7 +3453,7 @@ void schedule_dump(struct cpupool *c)
>      {
>          sched = c->sched;
>          cpus = c->res_valid;
> -        printk("Scheduler: %s (%s)\n", sched->name, sched->opt_name);
> +        printk("Scheduler: %s (%s)\n", sched->ops->name, sched->ops->opt_name);
>          sched_dump_settings(sched);
>      }
>      else
> diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
> index 081e1053eb..640578201f 100644
> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -338,7 +338,8 @@ static struct cpupool *cpupool_create(unsigned int poolid,
>      spin_unlock(&cpupool_lock);
>  
>      debugtrace_printk("Created cpupool %u with scheduler %s (%s)\n",
> -                      c->cpupool_id, c->sched->name, c->sched->opt_name);
> +                      c->cpupool_id, c->sched->ops->name,
> +                      c->sched->ops->opt_name);
>  
>      return c;
>  
> @@ -862,7 +863,7 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
>          if ( c == NULL )
>              break;
>          op->cpupool_id = c->cpupool_id;
> -        op->sched_id = c->sched->sched_id;
> +        op->sched_id = c->sched->ops->sched_id;
>          op->n_dom = c->n_dom;
>          ret = cpumask_to_xenctl_bitmap(&op->cpumap, c->cpu_valid);
>          cpupool_put(c);
> @@ -1294,7 +1295,7 @@ struct cpupool *__init cpupool_create_pool(unsigned int pool_id, int sched_id)
>      struct cpupool *pool;
>  
>      if ( sched_id < 0 )
> -        sched_id = scheduler_get_default()->sched_id;
> +        sched_id = scheduler_get_default()->ops->sched_id;
>  
>      pool = cpupool_create(pool_id, sched_id);
>  
> diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
> index 4dde2ede12..8df746bf6b 100644
> --- a/xen/common/sched/credit.c
> +++ b/xen/common/sched/credit.c
> @@ -2277,11 +2277,10 @@ csched_deinit(struct scheduler *ops)
>      }
>  }
>  
> -static const struct scheduler sched_credit_def = {
> +static const struct sched_ops sched_credit_def = {
>      .name           = "SMP Credit Scheduler",
>      .opt_name       = "credit",
>      .sched_id       = XEN_SCHEDULER_CREDIT,
> -    .sched_data     = NULL,
>  
>      .global_init    = csched_global_init,
>  
> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> index 95946634d1..4949606881 100644
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -4230,11 +4230,10 @@ csched2_deinit(struct scheduler *ops)
>      xfree(prv);
>  }
>  
> -static const struct scheduler sched_credit2_def = {
> +static const struct sched_ops sched_credit2_def = {
>      .name           = "SMP Credit Scheduler rev2",
>      .opt_name       = "credit2",
>      .sched_id       = XEN_SCHEDULER_CREDIT2,
> -    .sched_data     = NULL,
>  
>      .global_init    = csched2_global_init,
>  
> diff --git a/xen/common/sched/null.c b/xen/common/sched/null.c
> index 952bb47444..b3c6651fb1 100644
> --- a/xen/common/sched/null.c
> +++ b/xen/common/sched/null.c
> @@ -1037,11 +1037,10 @@ static void cf_check null_dump(const struct scheduler *ops)
>      spin_unlock_irqrestore(&prv->lock, flags);
>  }
>  
> -static const struct scheduler sched_null_def = {
> +static const struct sched_ops sched_null_def = {
>      .name           = "null Scheduler",
>      .opt_name       = "null",
>      .sched_id       = XEN_SCHEDULER_NULL,
> -    .sched_data     = NULL,
>  
>      .init           = null_init,
>      .deinit         = null_deinit,
> diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
> index d6884550cd..0c5181891c 100644
> --- a/xen/common/sched/private.h
> +++ b/xen/common/sched/private.h
> @@ -294,12 +294,10 @@ static inline spinlock_t *pcpu_schedule_trylock(unsigned int cpu)
>      return NULL;
>  }
>  
> -struct scheduler {
> -    const char *name;       /* full name for this scheduler      */
> -    const char *opt_name;   /* option name for this scheduler    */
> -    unsigned int sched_id;  /* ID for this scheduler             */
> -    void *sched_data;       /* global data pointer               */
> -    struct cpupool *cpupool;/* points to this scheduler's pool   */
> +struct sched_ops {
> +    const char *name;       /* full name for this sched_ops      */
> +    const char *opt_name;   /* option name for this sched_ops    */
> +    unsigned int sched_id;  /* ID for this sched_ops             */
>  
>      int          (*global_init)    (void);
>  
> @@ -366,127 +364,133 @@ struct scheduler {
>                                      struct sched_resource *sr);
>  };
>  
> +struct scheduler {
> +    const struct sched_ops *ops; /* shared, read-only dispatch table */
> +    void *sched_data;            /* global data pointer               */

Isn't it a scheduler instance data pointer, not global?

