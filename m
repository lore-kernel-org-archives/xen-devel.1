Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952EA606A326
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 07:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=jxfg3+vL
Received: from list by lists.xenproject.org with outflank-mailman.1467794.1676836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNmf8-0005nv-Ue; Mon, 02 Nov 2026 07:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467794.1676836; Mon, 02 Nov 2026 07:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNmf8-0005no-RL; Mon, 02 Nov 2026 07:41:02 +0000
Received: by outflank-mailman (input) for mailman id 1467794;
 Mon, 02 Nov 2026 07:41:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xNmf7-0005nf-Be
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 07:41:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNmf6-008UYS-6A
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 08:41:00 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae83e81-bab6-0a2a0a5309dd-0a2a4506a998-30
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 08:41:00 +0100
Received: from [52.101.52.46]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae83e8a-195a-0a2a45060019-3465342ede1e-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 08:40:59 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by DS3PR03MB873329.namprd03.prod.outlook.com
 (2603:10b6:8:43b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:40:56 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 07:40:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXSlcyAAMvOqUm+78u5BHC8IKK4xPg0czm0XK+Tmim4t2eNtfR6XSjVPW/3nt4haQ0OrzzWX6sK/CIGlBafr1/M5kt86hXPlEFqS2LPZ7ElWYZXvxQPa7qXTpWhlYUaJFTVNUStM2ne8t+f2URHoF0gAPX3gPprpKHkbmKKMYOSvmP2NRryLi3mBA14j8LNUVSejjNAIdzq5llzTzHYlC859RTU2F6lZTaoGOwtaCSKPLSD0seOswuSUuclYFKxNqI7lTwaeW71RH9k2fKWCJDQLhHJOymKyLXiehZOUDrpG98CT/moyDbhFoq7LfUhLsB2JYs6hZCzg0A95tgpsHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OR0Ckv7xEebSlla+f9OO1sjMyqjy6XAa0wMxax9/WG4=;
 b=gFvxVyHUY65PhfkpvXmfi42SIuz3LXwMvc1nszUbfb0V7XGReahPUrl2GKqNxOWtju9fmMUc57yqNTgriEjLHFcd0iW9WDofZ8ZwlTPpogsniny5/bYXIqNREPPkLeVOapgNtdxcm+ahrcY6l7zXfc+PvFGyDrtaoaijtR+fEIF8HQQG2/Da8aDjcOreW5ojRFzVJZYpuNIP9mPztTBXkPf0+NHtXHOgs71398zV6DKzUwLFc9ArDZmRDyxLTmvtLaHh8Otl9QMfgv+zpb+dcNNQT/XYDMAnwr1lbNMKSuUICcvo9WOaUpuFyEVye30nh2S4b73kuPbrl0tNZhKTjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OR0Ckv7xEebSlla+f9OO1sjMyqjy6XAa0wMxax9/WG4=;
 b=jxfg3+vLV2+1pRGf8CWPwF2PfzN/ULrN09HfcJxxynVvytelbzmvwhTw2dfTM9CS8g+Zq3FxBkGcLkXjI+LGwcBKl97wBCX3iOI6AnYpYLDiqy9Ghl3Q3gMY6W7EZpLgfI1HmOUmZ7twMDdxtjq6p14cmnUOjtj+POGOd20VCEE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: roger@xenproject.org
Cc: andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/2] x86/hvm: sync APs TSC with the BSP at creation only
Date: Mon,  2 Nov 2026 15:40:42 +0800
Message-Id: <20261102074042.178236-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030132419.84264-3-roger@xenproject.org>
References: <20261030132419.84264-3-roger@xenproject.org>
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: JN3P275CA0122.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:d1::15)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|DS3PR03MB873329:EE_
X-MS-Office365-Filtering-Correlation-Id: b9e3a139-4041-4385-90e3-08df38b4a148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|18002099003|22082099003|56012099006|11063799006|261021121427099003|261021123027099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	9AUTGU/sWTlqiVO3dXywcko0PGpwVyhskFxBsQRjMuk5yXrFNJGuBt0I+MVhCxxUR0I5UqP1vfUumUEJnuCvDVr7Ea/yODXEf0VrQIGK5NQQWYYV2Uxy24OQBq1qvVWCWt7OqMQ08+LWXmXu33cf1bCQVeR9fcpxXZcgWCOd7c5f7kUkMZs+471VF+pPivXdxLntTrrYdf/WJw2OI+h3hEDlYL+LA+DPE1DA9RcSJd0Rym0SXRKG84tEk6uLmImxndKw5YVGwNQaDWEa1KNoNNf2p83Wb0qknaUn4EvAGjwnAtScLJP1y9hcxFeTX0B3ZuQfXUrKV77SPuE4JouDKG3tHFS45lU5tauKX9Sz+OjcGDwbP8fT3hiSPttv/d5uTDpYRz3yXUcS8frLnZ/wCi20LEDp61vej1K8M0ge9BwIUalYmR4ZHqYIwJUHN0y1oByI+Es5msBj2KSz5UrIysef/R/I2teuXxbk5GOZ9mXpobWqUYNY+kYa+A3t7YBN9efY5IKqEPpJg+7qniUrHvoCs3BVzZ8MQOf15j+8kIz1bXaSuq3rpvqhyC8a5oFaqytXiUhwfSHPB+LeIs+jRSV6TX9O0dBeWnKqC0ev54GTJ3J7JHldr6ARxGsEG2d8PXq0ltTApCQH5Nt2TQXF+74Rc/kLbskIVn86MfrQzHU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C0ZncV+UitzTs9Y3Eyy1C2s6auZiCas96b1f4QnXM+gllhSrLkf3NyIakZdA?=
 =?us-ascii?Q?6H07zvtEkNNMOq9NCE0LpCtqVffuD7tdP1m3KGFNhKEtYAsGrQqPLjg5SUwT?=
 =?us-ascii?Q?JGAhJwgfXizC54jWIodorSlF269xeMb4MMkLRcnsMQtm+M5KXDppSkQtpRot?=
 =?us-ascii?Q?kttyW9AAXOqYLXG+UO99CW6a7YmKy4xkw31VkhjCjhAQkiTIZkDsSW65kLwU?=
 =?us-ascii?Q?WKTP04apfHUBdssRDLmrQEsX8V0jEU0j0naRfGimvBXZ8yUvuP8MDfi+ssCl?=
 =?us-ascii?Q?PqmrjpnZESFCXA2pX30RlD8u/oPFZsvK2/j/6xCMA/6VZOtMJqQtfDBOeZoN?=
 =?us-ascii?Q?qzw+/6gtW9iQdLuCVDkjMbC/bxXNfHdVH+BHkCHizaRnXfobJFiltB9/ezI9?=
 =?us-ascii?Q?phaNHvMrwkJFzTom+bJ4D9feEZ/0fkCwmYpxpKwJOC6WlK5HtGHp3fWm8p0+?=
 =?us-ascii?Q?2py7o7QatxocVylABdAnNK6JBPfGYquI3KJs8MsbegoQJpu5xp029UVnVb2D?=
 =?us-ascii?Q?ms2V0ilGkK6gfT5CgTovOqojNvTTLZAcNuXAuq+pxtYA09EU00bucKypvOFZ?=
 =?us-ascii?Q?rs6ZTHKBgMpdKFn8s8w3QC96Wrhe24vEHEvix2xhhJv2r33KBV6mfzDvBsjt?=
 =?us-ascii?Q?5bs7NOl+k9NUSW+RBuzWyJAP9D2OOzBH1p4u82m4X6uxBhVwrDj+KRVHeVQk?=
 =?us-ascii?Q?T/1qG8qpBArN+h8fsaf5wokPFqQGw1Q4leuW7FbpiFxqCIn1P9WjMtDFaZVe?=
 =?us-ascii?Q?IbLHaMF0CDAE2IS9OipiH5cgyCLM6xg4tArkiZuSNxr1SUgi0n4UhJik6xJV?=
 =?us-ascii?Q?jUN6WDo/DuzXUT2xL4IppnHMr1v/wtU9tYDV907uOD4Fw8VLe8QbfEYPvcRy?=
 =?us-ascii?Q?D2s+ZtOzBLmZNhIf1I4hZHGpIGpnSYaxajWGrjIvsrI8/ofpiSQguNSKNGz0?=
 =?us-ascii?Q?Uf8mheU2FeOmLOr2UQuH28hrpLV/L3EQclHL0BnriMk1EXhRD4C8vcj12jTb?=
 =?us-ascii?Q?l992JMfBc0PUsY4seCx4VAL9anijLJ65G5AV88Gf8MTt5zekdzErNUva/JZX?=
 =?us-ascii?Q?aePHtUiMAyeBwHp+3GaequevbxzvfzpETasNSs+hmTTHpYy+gjGfDKRxsn8o?=
 =?us-ascii?Q?wVSJWD8C88hb1dgy+6Nh8jKz5deDI+HrRyRGiV2zoW1cl6+Nse7GVwvPru2X?=
 =?us-ascii?Q?UOp9ChwugNdFgl34KoRGCdluUEjRzAQnHgkcJgfLYQCOCbLwUqtVL2h9fwKO?=
 =?us-ascii?Q?uEyOod3fL5q5fj4vkBvRk6xM69bh9twh8bN8WY8FScVkopG8fajKpthTo7aQ?=
 =?us-ascii?Q?Z32wRbRiQly91ECgTBWweEdF9F0SirmbN5GMEsJnfEMGFy6J5qjD3G+HemZq?=
 =?us-ascii?Q?7vmogN6j1Ngk6ddxhTg0311sx4q2C813quukVpmh9I/fOemf25Tr89XWKp1K?=
 =?us-ascii?Q?xGdGtJU3r4OaGKWldD4ZDnXI83ZpUqvfIHYaJ7fJVdOBtxVmKc5NRAtJOqdQ?=
 =?us-ascii?Q?fWrZsqBj6Xi/LZ2kR8Xd3kqYdukufPyAFiWS3YAG6Cg+SFX2gifSFMt8aaxh?=
 =?us-ascii?Q?TWe1GQ8wwesjnP+DWJn9BduuRU9c+aHyvhVgCbhQOYUbQK8XvtmJJVsALGKL?=
 =?us-ascii?Q?bj+0Y51pzqlXuzNbDBoUGajKrJ3vPhsBZqGASGLAtblUcZAjFXh6f44BQfRI?=
 =?us-ascii?Q?j5pi+6dH/N4sPASUWvLyaoW8LWYtRTgbXRzG/83H6PQxoxNrUz7M8GU70kgA?=
 =?us-ascii?Q?9th0vTrwJQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e3a139-4041-4385-90e3-08df38b4a148
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:40:56.6150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2EYLRfDwCltD4JyRDDkI5B0zLLuOtGc83LtJcp9tyHjm3F1i/dm8f7dUGTQCxNo4UFVwgg6fk+H+fTrznf0HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR03MB873329
X-purgate-ID: tlsNG-16d1c6/1793605260-1F0C777B-794809F7/0/0
X-purgate-type: clean
X-purgate-size: 7193
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 02:24:19 PM, Roger Pau Monne <roger@xenproject.org> wrote:

> The current logic syncs the APs' TSC with the BSP both at reset and when
> setting the vCPU state.  This doesn't match hardware behavior, where APs
> are only in sync at platform start.

> Move the TSC sync so it's done in hvm_vcpu_initialise(), that's called a
> single time at vCPU creation.  This matches the hardware behavior.
> INIT-SIPI and VCPUOP_initialise no longer re-sync a vCPU's TSC to vCPU 0's.
>
> On migration the TSC offset for offline vCPUs is not transferred
> (hvm_save_cpu_ctxt() skips offline vCPUs).  To avoid an unexpected skew
> synchronize offline vCPUs with the first online vCPU, taking into account
> the TSC_ADJUST value.
>
> The clearing of TSC_ADJUST is also made consistent with hardware behavior:
> clear it on S3 resume, but not across an INIT-SIPI or VCPUOP_initialise.
> Additionally, on S3 resume start all vCPUs from a shared TSC reading, so
> they are in sync.
>
> Fixes: c31f8336e64e ("[HVM] Initialise AP TSC to same as BP TSC.")

This looks wrong.  c31f8336e64e only added the sync to hvm_bringup_ap(),
which no longer exists.  The code removed here comes from bcba667e12e3
(INIT-SIPI) and 192df6f9122d (VCPUOP_initialise).

> Fixes: 6e0336351ed9 ("x86: Implement TSC adjust feature for HVM guest")
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>
> ---
>  xen/arch/x86/hvm/domain.c |  5 -----
>  xen/arch/x86/hvm/hvm.c    | 19 +++++++++++--------
>  xen/arch/x86/hvm/save.c   | 34 ++++++++++++++++++++++++++++++++--
>  xen/arch/x86/time.c       |  5 ++---
>  4 files changed, 45 insertions(+), 18 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
> index 978d8b222256..71f49ec7ce9f 100644
> --- a/xen/arch/x86/hvm/domain.c
> +++ b/xen/arch/x86/hvm/domain.c
> @@ -312,11 +312,6 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
>      hvm_set_segment_register(v, x86_seg_es, &es);
>      hvm_set_segment_register(v, x86_seg_tss, &tr);
>
> -    /* Sync AP's TSC with BSP's. */
> -    v->arch.hvm.cache_tsc_offset =
> -        d->vcpu[0]->arch.hvm.cache_tsc_offset;
> -    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
> -
>      paging_update_paging_modes(v);
>
>      hvmemul_cancel(v);
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index ef9c7cd05777..81e90cc8fc8e 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1667,6 +1667,12 @@ int hvm_vcpu_initialise(struct vcpu *v)
>          /* Init guest TSC to start from zero. */
>          hvm_set_guest_tsc(v, 0);
>      }
> +    else
> +    {
> +        /* Start in step with vCPU 0, as all CPUs do at power-on. */
> +        v->arch.hvm.cache_tsc_offset = d->vcpu[0]->arch.hvm.cache_tsc_offset;
> +        hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
> +    }
>
>      return 0;
>
> @@ -4021,13 +4027,6 @@ void hvm_vcpu_reset_state(struct vcpu *v, uint16_t cs, uint16_t ip)
>      hvm_set_segment_register(v, x86_seg_gdt, &reg);
>      hvm_set_segment_register(v, x86_seg_idt, &reg);
>
> -    /* Sync AP's TSC with BSP's. */
> -    v->arch.hvm.cache_tsc_offset =
> -        v->domain->vcpu[0]->arch.hvm.cache_tsc_offset;
> -    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
> -
> -    v->arch.hvm.msr_tsc_adjust = 0;
> -
>      paging_update_paging_modes(v);
>
>      v->arch.flags |= TF_kernel_mode;
> @@ -4079,9 +4078,13 @@ static void hvm_s3_resume(struct domain *d)
>      if ( test_and_clear_bool(d->arch.hvm.is_s3_suspended) )
>      {
>          struct vcpu *v;
> +        uint64_t at_tsc = rdtsc();
>
>          for_each_vcpu( d, v )
> -            hvm_set_guest_tsc(v, 0);
> +        {
> +            v->arch.hvm.msr_tsc_adjust = 0;
> +            hvm_set_guest_tsc_fixed(v, 0, at_tsc);
> +        }
>          domain_unpause(d);
>      }
>  }
> diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
> index 8ab64057064e..65ebfd384d69 100644
> --- a/xen/arch/x86/hvm/save.c
> +++ b/xen/arch/x86/hvm/save.c
> @@ -289,6 +289,7 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
>  {
>      const struct hvm_save_header *hdr;
>      struct hvm_save_descriptor *desc;
> +    struct vcpu *v;
>      int rc;
>
>      if ( d->is_dying )
> @@ -302,8 +303,6 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
>      rc = arch_hvm_check(d, hdr);
>      if ( real )
>      {
> -        struct vcpu *v;
> -
>          ASSERT(!rc);
>
>          /*
> @@ -341,6 +340,37 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
>              /* Reset cursor for hvm_load(, true, ). */
>              if ( !real )
>                  h->cur = 0;
> +            else
> +            {
> +                const struct vcpu *base = NULL;
> +
> +                /*
> +                 * Offline vCPUs have no CPU record.  Adjust the TSC offset
> +                 * based on the first online vCPU, taking into account
> +                 * TSC_ADJUST which is saved regardless of whether the vCPU is
> +                 * offline.
> +                 */
> +                for_each_vcpu(d, v)
> +                    if ( !test_bit(_VPF_down, &v->pause_flags) )
> +                    {
> +                        base = v;
> +                        break;
> +                    }
> +
> +                if ( !base )
> +                    return 0;

This silently skips the offline vCPUs.  If that ever causes a problem it
will be hard to diagnose, so please add a comment or a log message.

> +
> +                for_each_vcpu(d, v)
> +                    if ( test_bit(_VPF_down, &v->pause_flags) )
> +                    {
> +                        v->arch.hvm.cache_tsc_offset =
> +                            base->arch.hvm.cache_tsc_offset -
> +                            base->arch.hvm.msr_tsc_adjust +
> +                            v->arch.hvm.msr_tsc_adjust;
> +                        hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
> +                    }
> +            }
> +
>              return 0;
>          }
>
> diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> index f37fddc61e47..79c7123c0a5b 100644
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -3087,9 +3087,8 @@ int tsc_set_info(struct domain *d,
>               * set_tsc_offset() is called from hvm_vcpu_initialise() before
>               * tsc_set_info(). New vtsc mode may require recomputing TSC
>               * offset.
> -             * We only need to do this for BSP during initial boot. APs will
> -             * call set_tsc_offset() later from hvm_vcpu_reset_state() and they
> -             * will sync their TSC to BSP's sync_tsc.
> +             * We only need to do this for BSP during initial boot.  APs copy
> +             * vCPU 0's offset when created in hvm_vcpu_initialise().
>               */
>              d->arch.hvm.sync_tsc = rdtsc();
>              hvm_set_tsc_offset(d->vcpu[0],
> -- 
> 2.55.0
>
>
>


