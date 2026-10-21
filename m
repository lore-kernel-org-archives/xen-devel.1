Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2027606A319
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 02:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=BKIGXFmm
Received: from list by lists.xenproject.org with outflank-mailman.1456695.1669877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJLmv-0000I8-T9; Wed, 21 Oct 2026 02:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456695.1669877; Wed, 21 Oct 2026 02:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJLmv-0000Hv-Pw; Wed, 21 Oct 2026 02:10:45 +0000
Received: by outflank-mailman (input) for mailman id 1456695;
 Wed, 21 Oct 2026 02:10:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xJLmu-0000Hp-Th
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 02:10:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJLmu-004BgJ-3w
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 04:10:44 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6ad81f24-e002-0a2a0a5209dd-0a2a450993cc-0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 04:10:44 +0200
Received: from [52.101.193.62]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6ad81f22-be1a-0a2a45090019-3465c13e90ba-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 04:10:43 +0200
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by SA6PR03MB7664.namprd03.prod.outlook.com (2603:10b6:806:43d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 02:10:39 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0522.016; Wed, 21 Oct 2026
 02:10:39 +0000
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
 b=PXI4X/YaVYYRH9cxZld1AgL/inAwnn1z3B+ViQkqjh903++Fxz/eqL3MMA/p0FhTUD8JSI2EMR9rlGoE6XH0KNyb0CrG8yLSZuOcEPV0cKisAMagCymd4Dtnr4RYm4M2ZRN7z+Om1/A4C4LMypm4OzE8FnVWEPO00ozh8PgnVqttzNnJxztJVMKRpXbQu/dbOcFs5jPnzuH4Vv1+Mwk/8cifVOSau4JBw3sU5xzYBqRLrkdqprAFTt7P6OgHu0qzY24WVrPpFIjP6WvMJbJ5kKqYovMxc8C37hB1JBJWDFWSDqz10EjRYFcqyej1Cmhjx0ySSh9kx6lSdMrFX+Wq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLLtrtQSv/K1xygCbcjAPnvdR4OzMAFi5DJIFNHliR4=;
 b=sbQu+6NulpNpy0QvMI2D1iXLkErQLHRGPNWHFgMo2Hb4KNdSaw+cMsck0VpW9cSk62Rxs483wWvpGiG+/WN+De7ul4siOGiMH6JLMWbKKIsdO2264yc9fN+XBOF8qt+ImZymQM4aAdX6uFxptPDzAubzQLochRosU58zEV5UOE4QZIqbop+CUzV1bEmTozHLUC9UkjZokirt+N6JaCJg+ArQNZdlZAaHH8IDPvcVKcR6V8yVFkksPmwUQbBvASLTo70kyq8hSltf3sL+KotFP+rNJDM4Sut18AZwlYtrjt96+c4hhkiXhHzTjSFe2kr4TcSfWqmB0KhYRAf400ZAeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLLtrtQSv/K1xygCbcjAPnvdR4OzMAFi5DJIFNHliR4=;
 b=BKIGXFmmKGgoGFXSFG95zNmdtWL58tk360vL1XaIa/yXmdccFzcJMNWKU3Mr9JKSFIjlyEKxiZSSACNuCy9ZgpLYNDeF/eGwysrOcuPgRmcl9S16x2JppMiw96VR2ki1YGkZlCHA4FPSY/Cx27E9p2wIlWfJcr6tw54zWQxPdm0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stephen Cheng <stephen.cheng@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2] x86/np2m: flush the np2m on an SVM nested TLB flush
Date: Wed, 21 Oct 2026 10:10:28 +0800
Message-ID: <20261021021028.123867-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <7757cb6d-78d2-4d73-bfee-f9d5db8f15a1@citrix.com>
References: <7757cb6d-78d2-4d73-bfee-f9d5db8f15a1@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0039.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::8)
 To CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|SA6PR03MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: 73fdaaa4-acc2-4376-4527-08df2f1880a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SZq8Wo8Be6fNuQ1ZsEYDfzgrCqQG6dFw7aAJvKGHk6r5sRr6+5syqXnighIIMbXlSfOTum/VupBnPcklIH3kHXl5UWAs3CaLTkvIH2F1mq3w1snjThWargftOJ+P5diC8wxCAIm6szdOq6O5X47ynX2P2Qspm7DQ+xNdKrAkNNmzOcGlIRzeZ3Y+WfLyp8plILWFtrPziA/e98mYqL+IxcRugRGWtYP7Ml2ubz6Waxt817D19dH7cDZ6VqVxSmAG5oqmhrqEUiMDDHGTH5+qswFrPHbVD/i8d9L15Zk6NDeO7YuX3jDT8EdUXqm0xds1+lVdim9rMyOIXAwkGtDMXcNib/XeqH4L/lqgGRJIfq/PkNCHBzYB+0swY/N1l8dh3CRO1KyzXvEfolXZan3uFIJ6qn9YsYYUM1u3tEIKfV2tY6U2b79ZXFPfEt9dWGOSRdGLG5KwIsgsTiTZEeyr1oi5whc7flHDBech7P4vG2BIRAPaDM2UFZeZUJHTWDpC/rTVF9LLlhSEwGWXIQ5Bl78AijVDvTio3znK2R/inw63T5qmQPq/5wiQD0z9Dwr2Cxf0ilXEH1IuJrOiemR2ARG6imiPBofoFnC3xH8ht52BIOJ0KowIyZjuanDNLimM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uCwlO0TWZ5qhtoRyS/uOiRa27sfs6RHiGp0fSKVQ6tYAeLZILupP3CE0h8Lr?=
 =?us-ascii?Q?YyYCkv8xibQ5JmOTCTTIF9/QoixzRhDRO3TGs7N6ysrQSP1Keta3e5/tiCTq?=
 =?us-ascii?Q?y8Y4+7PDwoIovC9gU69skD4+rEzQeowMUz7+MVNx7amuGOYfSAgqHstb9jEe?=
 =?us-ascii?Q?wrVIDk8Q9RouBRGtB6vnQYdEDB6z4vroLl3lhIAi3uSa9HbZWr9rkEaWySVu?=
 =?us-ascii?Q?yK7udLagj/NSO71pDPVdtdGYOdwcxem871MfbCyDvhxeU1IvcyiYa7hod4Vr?=
 =?us-ascii?Q?m9BC6C87emLK0Jw0RcH5XgVW6TrOPcxzcZnRdbUbEMjm8huknZLRTFxgIbao?=
 =?us-ascii?Q?r+5PmaBOpnQNY9iKqOvYStMaOsS4pMSQhqeKpjkie6vHgTubA28eNUhRqD8S?=
 =?us-ascii?Q?gCRhZ74/zjw7MKYPakceqmQUenYEiOROH+OlhWnkFx5fErvFQ8CpbRZ4z1Gl?=
 =?us-ascii?Q?6LKU9pzLV9QjB9/L+SpEvdESfriHpOY9fA063m4Yq5Twp4xXe0+1E+CnuR4H?=
 =?us-ascii?Q?+HYQGqFZWM12seKFOtU59Fc4iZ2EsPEkotwOMlFiECV6z+vAOS0vZaz1AhYA?=
 =?us-ascii?Q?0g+7bzh1HgCwuPRN5FgfSz1V/knjUGmsqttdAR6N6dnRAuUkAnIWYFY0ex/i?=
 =?us-ascii?Q?fPdYKx/ZcipHEyjkrSSG/F8SeBsNTMH3D8espcIIHQd1fouX0Josh89rcICw?=
 =?us-ascii?Q?mqlWbIKGr4l0fFe7ArvI2bZF4lVR8tBHwIFuPGWALdi6MKizknDlf2bOsQ/+?=
 =?us-ascii?Q?QoJsxKE9+u3kvmMVTcVq7keX/WxPTZQeyA4gzEXzuD7pTiWD4CF65piFPmuv?=
 =?us-ascii?Q?fKvWQzf/ede3rJ4PAk1wKTjd8/FZXy+4jcshhJ7ZmVtJfN+YHgcoRWahFoaw?=
 =?us-ascii?Q?aF41iNzthBNoCFhHRq5kKXMqZn1IzOevavdSy1vERmAg4mOXN8ZYjsTOmoS3?=
 =?us-ascii?Q?SzVZRdr9yzsYhXAibvv6gdf3uqZYzRAedIeSQ8CQuzfkXb1ptl4/dK7lGQLJ?=
 =?us-ascii?Q?91JbVLsOAXBLrbPesvKYXgpWRi2qrA/dkrcUbyyQSlYBRrq0+cbW3AjLEdmh?=
 =?us-ascii?Q?j+ATwu3jxRft8SCHh2gmvhrpAY4kGWzopTUs+5DeolGV6KFEOemC9d5K5P0q?=
 =?us-ascii?Q?evN4J6xi559VR7zzeJxStD3s3TDSWRORTchaWtPXGIjymsqydH1+zo7YHl6s?=
 =?us-ascii?Q?ox1KZFU65R/5HkGcdwNSFhQ9Aj6LoKyHo8tvct8BDkMFLStd+0dDrqdh2leo?=
 =?us-ascii?Q?XH7ozQpDN+eYoKFGdM0hkzd9dpJw+Py+jPs5DN07PyDhEqV5boMtEQy2us5y?=
 =?us-ascii?Q?QKsXFO/rxusBkWntmF/uDE90zAcRNv98VY00N52UnnUHqRKRJJy5A38izT7d?=
 =?us-ascii?Q?cm5B5Xcx9TA2HSHQbVFf9TI6aCpwJC/qjLx1YfruByh1LYFCiSVW+Z7ZpRGW?=
 =?us-ascii?Q?qx/RVdnvGZUg2fk5K/SwoZP8vlMeM3tKY4rIWLb4PoZ+5LQJTTYEQ2gqd5V2?=
 =?us-ascii?Q?s63oyhPU4lX2WFX2RsPMOwNcxTEKu8Cd6fxMuymEtbBq+MqhqEaNh0iS6uad?=
 =?us-ascii?Q?BY5UQzuLCRwmklAVbSaLwDwYypi8QNPjKV1p1CmfUiy5meF4XfcHFrtL7/sb?=
 =?us-ascii?Q?JL5kiFEaovS7kc+N4h8NGKyKn4SKCUZYec8Z4FmcqS0IHoWx1NLvC/uYLfC0?=
 =?us-ascii?Q?KVeyImG+FY6/snpnZKMJ4nKnlP6detLQPKiLgPH00sSEuj4SJjUhCqwzIqTz?=
 =?us-ascii?Q?2JzvhDA/9Q=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73fdaaa4-acc2-4376-4527-08df2f1880a8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 02:10:39.6811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGrfdgjjAnqk1fVRVknJkSWmX6Mn1FXzdzET+4RkXmMiH9qKGJBvKSBAKc+/GP/xbCZkxOjeJ0p92QJYmE9LGm8AB5stVtflHHR+rFGRRb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7664
X-purgate-ID: tlsNG-bad1c0/1792548644-FD06B034-682A0A4C/0/0
X-purgate-type: clean
X-purgate-size: 2338
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On SVM, L1 flushes what is cached from its nested page tables by setting
TLB_CONTROL or using a new ASID on VMRUN.  Either sets nv_flushp2m, which
p2m_get_nestedp2m_locked() handles by only dropping nv_p2m.  Since np2ms
are shared between vCPUs, the lookup then finds the np2m for the same
N_CR3 and reuses it as is, so L2 keeps the mappings from before L1 changed
its NPT.

The obvious fix, flushing nv_p2m (the np2m this vCPU used last) before
dropping it, is not enough.  It covers a vCPU re-entering the same N_CR3,
but not one entering an N_CR3 whose np2m another vCPU filled: on its
first VMRUN (nv_p2m is NULL), with an ASID new to it, or when switching
N_CR3.

Instead, flush the np2m for the incoming N_CR3 before reusing it, as
nested VMX does via np2m_flush_base() on INVEPT.

Fixes: 6df4b481b0c5 ("x86/np2m: implement sharing of np2m between vCPUs")
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
v2:
- Explain in the commit message why flushing nv_p2m is not enough (Ross).

Ross Lagerwall's partial fix, which flushes nv_p2m, was part of v1 of
Chunjie Zhu's "x86/nestedsvm: rework nested VMRUN/VMEXIT handling" series
(patch 5/5, dropped in v2):
https://lore.kernel.org/xen-devel/20260924091605.344577-1-chunjie.zhu@citrix.com/

         if ( nv->nv_flushp2m && nv->nv_p2m )
    +    {
    +        p2m = nv->nv_p2m;
    +        if ( p2m )
    +            p2m_flush_table(p2m);
             nv->nv_p2m = NULL;
    +    }

Tested with an XTF test that is not yet upstream: L1 repoints an NPT
entry, then enters L2 on another vCPU or N_CR3 under a new ASID.  L2 saw
the old frame before this patch and sees the new one with it.

 xen/arch/x86/mm/p2m.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 027b9ae69b..52cadd9b25 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1547,7 +1547,11 @@ p2m_get_nestedp2m_locked(struct vcpu *v)
         p2m_lock(p2m);
 
         if ( p2m->np2m_base == np2m_base )
+        {
+            if ( nv->nv_flushp2m )
+                p2m_flush_table_locked(p2m);
             goto found;
+        }
 
         p2m_unlock(p2m);
     }
-- 
2.49.0


