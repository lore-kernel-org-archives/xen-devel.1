Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E123D606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 02:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=agjxeqGG
Received: from list by lists.xenproject.org with outflank-mailman.1455071.1668616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIzgC-0003cH-L9; Tue, 20 Oct 2026 02:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455071.1668616; Tue, 20 Oct 2026 02:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIzgC-0003c6-GV; Tue, 20 Oct 2026 02:34:20 +0000
Received: by outflank-mailman (input) for mailman id 1455071;
 Tue, 20 Oct 2026 02:34:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xIzgB-0003c0-C9
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 02:34:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIzgA-003Cbq-BC
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 04:34:18 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ad6d2aa-2eae-0a2a0a5409dd-0a2a4508a3f6-36
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 04:34:18 +0200
Received: from [52.101.56.37]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ad6d328-f659-0a2a45080019-346538258a28-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 04:34:17 +0200
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by EAYPR03MB020516.namprd03.prod.outlook.com
 (2603:10b6:303:300::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 02:34:14 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 02:34:14 +0000
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
 b=KHGT/xCP/lHKmmMUSuq0hdGfRGkSljSqmHjs3i78F5y7cjkFelkpLJyMwBILwV0AmSEO4B/SFchpkWdeW5HAXNl1pr+K72F9QShZy/UKt0KmbhJcVTwH1ftCRQmqUxBv2pAsfrF9GWkRzh0Wyb2dDscS0wNxR5TfUTsj94LdYEmgaZTHJ0ZzIZZHPmli0zN08PNPMIktX4QTHEE257WL5+bJx0VVGdcEhohv7Pd68wpdNfr20M3ZwbaOuwdVOIJ0S94DZR8bWMTuaHATokNxJQun0MqB7ijIVyKMhZMPWN4OZ9oFHHeoB9RKxh83f83RINdY/VAXnWf8jaoXAJ3rcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSyAJ+7mF0iFg6+8/U9QEEA0hLWt2Jce+tVfic3iu3A=;
 b=jDhUza1YTYqhEniKTQkxiAHyu3quiytiDb0py/KAJy3EGHQhX476wCw1tOODfvSJShV8RY6sgK22YNP6F9ecyLCSTmEEm8F76ydcBqeNbKQ6D+UGZS3U+1V0MstC3F1MrrbX/9uY3P1ArtKNu2wTF7T8TmA6faFnLXYdkFn4R+0F+AxZ8mydERdslPlts/FBYOtSmVBqfrqgIdy/c/6400r9oLJGWl6KIMMy2wEMr4EECXcTuH5oUAYNZhS5P+KJHjQnLFyYA+8TmyH+kLc+9YzSGa1WwF3G2KNH77inh6KVSude6I80kE4hni9n4S1fxgzj4RNHmwJA0Ot+NKi4lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSyAJ+7mF0iFg6+8/U9QEEA0hLWt2Jce+tVfic3iu3A=;
 b=agjxeqGGFZC53DX1bm2lJiUQKHoFykQhlqULWPvs3R020swZmNOBDJYcV3W1hodxx3HXn6JsXJ4qUjWDB2sEZOAt1CnHLSXDkhcQZlOj4pGb9+4cB30Dzo31jIiMPseIWsVvfS/trhoOoYzbAfDjKKsRhGNI8rdJHb5VfnQxvAo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: kevin.lampis@citrix.com
Cc: andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/5] x86: extend mod_l*_entry() to optionally return the old PTE value
Date: Tue, 20 Oct 2026 10:34:00 +0800
Message-Id: <20261020023400.295707-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016164815.3109065-3-kevin.lampis@citrix.com>
References: <20261016164815.3109065-3-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JNAP275CA0019.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::23)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|EAYPR03MB020516:EE_
X-MS-Office365-Filtering-Correlation-Id: 6211ec2f-fd22-411c-295a-08df2e52a1b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	YW+mu9WkEpmOP6yzfOxOnN3gKCAlybfRQ1DW3cZkJ4W5j9FdDyAE0CDGtRhYXZfDiuoXMbQ+Pk94WNvAeseF0Ji7+Y07wOZ1B+ey3szq21fpaMRiwR4zrfZCT/uwnYG6wGPg5YRaqe8sPwlTyPnJ44Eom+Ol3mu9wB3DAhgSPVvFx51xfWDC2bETsqWf5di3Qq+0QMOE23GmkBGT3jGZloBt8wQUODrKazkNVN/YOf6nHERyyOmhfh3AovS7o0QWaj57kBtbq67pOXepNEx+BkDOnBQIdxgkCipJSvRH12Erf6x297kzvcU9OgqNKaVDAZjocx8S1npr9BHyAnA3d9gIiz0aKPTSmDPjWk9LBSNPT+8uM8oD6KktBqj6i8YXbmUr6L5ZwGYQ2MwqwEu8CswlD9/LboiC8OG4FjzC3ejenU5CC96afAhMoJtQ+6nzzp3rmr68Agh0YDA5LVS1qIqfrNQt8FRz3iAQbQ5dRz8zYtFvFvd4+Af6QbXOGYNvYPneCEoM1JjaofEeInP+A1ZOsPcWmr2F6huPsVQDY3KOboTWzUWcYdQR/N1H+oAhoAbiWdgZbVBKPtR2jRhtPETdAVUcksqnVw9mJORPuFEFZFgXjJfueGHJVL7Xg/EOx5tLXn7Wyfuodrn6CRzin3dJ1KeyO/vVoPNSrMJAJUg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HLR50HZvW68Mnz2WjpLp5rnWAysPwWLyr/2TANQrCdFqXjQrH6dvHFaz12nQ?=
 =?us-ascii?Q?tQOHYyAkU9iokJFNvl4kGngGHJ3NRO6CQuHtGezYpiGM4iXJKozIURK9s+Ru?=
 =?us-ascii?Q?Ch4fjIoZeX4C6DWEmZzaexA7sDLh3BA72E6zUvFtWtB3jeQxfpJzDDDKViQn?=
 =?us-ascii?Q?h89vUSJPa9i9uXkItSRyGJmOR6JWic4pfRDjRsL3T33y7qMaqR1uk4u7UhiC?=
 =?us-ascii?Q?MbjpwHRUxNtzlveJ+blfqrIpBlrSHZQEhrfsyN3/3xrj9zxGmlR+qdD5RpOb?=
 =?us-ascii?Q?Nb8ekOU3UuzqsYIPap6nD6AlQdpqlH7+eX8a9IAS64ewqQI3EiXQqTqySs0Q?=
 =?us-ascii?Q?6vp2L5pOeDVZ7BzBgWanfEz7REJhjK+dEmuuhSGMYmic5nd6VbbyEqc3qZgg?=
 =?us-ascii?Q?dgQg2JzcPTV/lzp0k5EAnRq/hc6oFmJ9dV5CKmDePTc3dgAGW2a9WMaKIVon?=
 =?us-ascii?Q?6WZsaNiboymAMrimUIXOxaeRrzjVpsKcHnp7P3RAly0GlyOZT8uZ9LWZeQ69?=
 =?us-ascii?Q?7k6hKVxf1lZocpF652L8GZ9TbharkYxHPUw+I5Cz7y8K8B1Z53NOgah8iD4q?=
 =?us-ascii?Q?Dl+3UruuU2fAxvNIPHziq363hnAsd8UcPxBDOwdeiL1feeGx4uRAtEUASUKa?=
 =?us-ascii?Q?5X4FUoxlH9RZfCw39gwhxV4vDzASccYbu3nTP42k0DfHfKcpKgirZda0Xqtv?=
 =?us-ascii?Q?5sLJY2Mwoj+qeTHICznygSF6gEX9xwqcmtfhVB4x5zup1d6Fho1VSTMIvLMH?=
 =?us-ascii?Q?9AHAezMWQ14HqckOCaqcb7anQNCX8hk0Vy5T7sHCc/tuinw3PfZUB5R+LwSD?=
 =?us-ascii?Q?Jsb2QO86mkw7/f95d6sIhVtMirICYiGJmBlNSHFFYhygY5sQTbOmNQK73ACV?=
 =?us-ascii?Q?rkepa8h4Xhlx/B9bipE6X+xOkfJG9tFnMFi1nmrZJDNrXMIco8yI/GPGF1O+?=
 =?us-ascii?Q?WJZ+YxpwLVyyMio48td10X21S9LatNjHjgX5Kgnk3mf28c+ayMRUUqxPcpxH?=
 =?us-ascii?Q?ChYpK/xOIxcRB8bL5j2Yd8HcEb4VLyWPhsgRsWi6vXNEKIQVL0rHQzmkSKVr?=
 =?us-ascii?Q?RoK1Z9YRVL1OUT4a9mFPaUyLmxr7fK6M6T2OVX4sCU1k7JaxQrEQYcj7YNik?=
 =?us-ascii?Q?+ByYcUOdycZA9Azupt41KLWLvbiJxrfrDbKV/1ISr3bzwCwb+VzxVrB1unZE?=
 =?us-ascii?Q?mppkQaw8RaaDBnJJVKy7wNouK6jhBDW8LiOqnyMztCuOg4+XXBM2UFlatwpG?=
 =?us-ascii?Q?s4jLD1E0ecBA7dTbC2Sy6ZN8NvND0pZe5hjKLrtQAorClOrglihw1ccgoyg5?=
 =?us-ascii?Q?WJqaEwpyzaNV3TRMSpD+oPxnisLhwIbcMIjDC1a3foQc9p7leUCoOFE9Bm3z?=
 =?us-ascii?Q?25Js/Hm8LENzkimrpETK4Lk/BZqENGZpA0Au3DV2cfMi8E+YZbXGgXAjmHS1?=
 =?us-ascii?Q?mL2c8wVjLF6Ee+e1OhxnYPa0NNVRTaGbIFybaTKlyxbZLbJJTOEeyfPqfvde?=
 =?us-ascii?Q?OOMAXSVem2x4maOla/hofRuob4K21HWR4UVBgK+u0UngpcU2GRePUk+lKevl?=
 =?us-ascii?Q?07OQYidL5rctTKu4AtrVJnb6K2edqwtXC5Xl+lvuUGXS1RKuUCueZNX2nXlj?=
 =?us-ascii?Q?aGLQUh0G+rVKqd4c1vOHuNVCyLKu1E6utGh9m6UvzJTgtflTmil6oSSnJ+QZ?=
 =?us-ascii?Q?N0exRpN+zRbDp3JjrzQyWZjGonkSrMigTGwY1S+VzuE8N+St2beEiQhHCIHg?=
 =?us-ascii?Q?TfbiMDixMg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6211ec2f-fd22-411c-295a-08df2e52a1b3
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 02:34:14.6225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2APrDg6emZ3vBxiKR2AkW98L8X3DlLo/KXj+gWzfKFSuy8RLjWZT3s2C0iSmUyqqUCS2BcSEUUXpNbl0u4k7jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR03MB020516
X-purgate-ID: tlsNG-c1860d/1792463658-CDB4987B-97CE6F03/0/0
X-purgate-type: clean
X-purgate-size: 2366
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 05:48:12 PM, Kevin Lampis <kevin.lampis@citrix.com> wrote:

> Calling mod_l*_entry() with a valid ol*e_out pointer will do atomic
> CMPXCHG to set the new pte value and return the old pte value through
> the ol*e_out pointer. If the ol*e_out pointer is NULL then old behavior
> is preserved.
>
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
> ---
> Changes in v4:
> - Refactor how UPDATE_ENTRY is used
> - Update commit message to specify CMPXCHG instead of xchg
>
> Changes in v3:
> - Add swap to mod_l{2,3,4}_entry()
>
> Changes in v2:
> - UPDATE_ENTRY now returns the old pte value instead of using an out
>   pointer
> ---
>  xen/arch/x86/mm.c | 106 ++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 84 insertions(+), 22 deletions(-)
>
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index e42cd33c0d09..609c8595a487 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -2193,7 +2193,8 @@ static void l3t_unlock(struct page_info *page)
>  /* Update the L1 entry at pl1e to new value nl1e. */
>  static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>                          mfn_t gl1mfn, unsigned int update_flags,
> -                        struct vcpu *pt_vcpu, struct domain *pg_dom)
> +                        struct vcpu *pt_vcpu, struct domain *pg_dom,
> +                        l1_pgentry_t *ol1e_out)
>  {
>      l1_pgentry_t ol1e = l1e_read(pl1e);
>      struct domain *pt_dom = pt_vcpu->domain;
> @@ -2254,7 +2255,11 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>          /* Fast path for sufficiently-similar mappings. */
>          if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
>          {
> -            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
> +            intpte_t old = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
> +                                        update_flags);
> +            if ( ol1e_out )
> +                *ol1e_out = l1e_from_intpte(old);
> +

Same "intpte_t old = UPDATE_ENTRY(); if ( olNe_out ) ..." code block is now
repeated three times in each of mod_l{1,2,3,4}_entry().

Alternatively, a single local variable per function, assigned at each call
site and copied out once at the end. Does this avoid the duplication?

