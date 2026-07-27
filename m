Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CA6C531FC
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 15:05:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371724.1619217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woMtK-0004J8-WD; Mon, 27 Jul 2026 15:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371724.1619217; Mon, 27 Jul 2026 15:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woMtK-0004J1-Sk; Mon, 27 Jul 2026 15:05:18 +0000
Received: by outflank-mailman (input) for mailman id 1371724;
 Mon, 27 Jul 2026 15:05:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1woMtJ-0004GB-3D
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 15:05:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woMtI-008bcG-GJ
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 17:05:16 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a6773a7-2eae-0a2a0a5409dd-0a2a45068392-24
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:05:16 +0200
Received: from [40.107.208.39]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a6773aa-195a-0a2a45060019-286bd027246f-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:05:15 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SA3PR03MB8182.namprd03.prod.outlook.com (2603:10b6:806:465::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 27 Jul
 2026 15:05:12 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 15:05:12 +0000
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
 b=JWcMQ3ykFM9xof0UWt7anfKXNQuKG9b7XTca5CaFjffp/OcKEkkDkA7nZIH3BMW7KqsBcqNI/GcFQInhLlLj02p4DuRUgajp2qdOe3Mip83+5quG4DGon28QEqItpwwCS7mOQk//wpRpDy5ebc1x+ztTLzbgF+xzSA39++DRmiDgzhyP4cW1G9dFm3FRdz9lcO+Y44i2BtZRekvuEILTHcz05CoiuSxBaQ4iLs4iDF5Wmsc80Fz4A/7F8k5rcCVPNwz5+ipY6oNbeMN+9m+1rEkDS3xHclDz4sN/0Zmr2le1ZyO2hJ50tT/VxIQiCAwbTIGptydA8h+i2C9WizOjVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srJPZVfKyCLc9jNc72RgnPcAtxJpFYEiKTbfZigXhyU=;
 b=AWfwf0VC+jJcxruADW6rJU+LtyAW7vNYwXb+gsBs9DqU2Vkpstc2uQR8lwunCdERaJLZ9gNx3Gdo5E3aW0Nq5KAGW7poqi5x2iUahcK4LSiGwkttZo20oDCyC21VdCpBa+W4y3z8/eW+hobgQ3Emy7t54+V/iPTE61tvKWjNKnSHmCWVfZ1s+2MgER1BmMIDYPRG8S7LLvH7zhtdYe6BwbmoXCLmzTdGvsK40lUswlVBZX/rMSPXJ0UAvEeIWv6SyoJczd04VpvK1SKGC1INVn/hyt/ov7KBhAtb9qWXH5S8z8TnS+jXFwk5ebnAcnSmCtZ3ZLA6wWfOEcsx5Sm13Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srJPZVfKyCLc9jNc72RgnPcAtxJpFYEiKTbfZigXhyU=;
 b=xCMdwgknE5+30ehzknbRtBzmRpYVpEd0OhpzwfVGTWWd7rQ3b6/aXUjSC70D0p+flSazGxzVvkNjudk1DAZ+quMs0vYrT4ZiUOnSO5Ag9dwBIEXjqbNsYlfZCmCYN82oYQlM+jr8qkPf9DOjjLaH1krjNyV2/apowsChBEig5XA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH 3/4] x86: extend do_mmu_update() to support returning the old PTE value
Date: Mon, 27 Jul 2026 16:06:14 +0100
Message-ID: <20260727150615.1373200-4-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260727150615.1373200-1-kevin.lampis@citrix.com>
References: <20260727150615.1373200-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0470.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::7) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SA3PR03MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: b62bd515-cbd6-47b4-959e-08deebf0751e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|56012099006|11063799006|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	PwWkAVObzw1bf6HxQ6XrXvXyU2p6FCHRPzzODmHsnGtmgwNfzMFPYIBFvuRtD2oNL6Aj3Y7mShJKpyHzleidZuz8dPFcZbCE4uYssiu40gCD8af4dwfjj0De6J8NDO47k0ERSTDJrtPqi4WC7sqOjgg5G2r/bCH1PyhHqUPdToo2Q2350zeJzhGEeeKN+FzlcIACX5H8NcM1JLCZ0z1x9Wj7xOyxa2+e3xueAIM92PxQm1J1sST2rLnX++ceF1SK5KjMuXmdGPSpNYi1RDjHybgUSKZAGLSQgk4Vs2Bsp083cRCD0Yzxoa8+81jDOZNgw3exG9A8Dh4LqkVUMo8XqaHx43oBHkpyENOD4uWlo4uonCSt91FM4yf4enTjVX4OEfHr0iGjzuszuB+3xwJ105EN3ELWNbxXaYTSAM6xLyfNEX4UiJLuULL2g0NNLugW2xamb8WlcG2z3LWTxEnxpfDqgtiZnC45Nnzb79jz3UnMW0AHOY3xFn7PsquYGUPzDMuzFVHpHNAp0VH4VLCMnApB0zzc58GS0sj4g9wM0rK1MY3mSn0Ufwe3DkzKu+SqWvf8h7JtFX4eNnzaKA4RMglMmKxdoiolm4HwdqBum1bi4NAjrWG8iQCeWGQdbswXUPFB29/7SuqneVcQgyLGYWDlLWxBMjtk3xEj/tc0jBU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(56012099006)(11063799006)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E8hN9BTCtNKllX1wrEPea5yMeixEfw6RsabQwKkYy0ymqi5kXFBe7s7685R0?=
 =?us-ascii?Q?Vxl1a7otfdwVtpfl+O1WZJH26sNO7LAmpR26CquJf5GpNr3lUdyvllMFeVHO?=
 =?us-ascii?Q?LeFrdJiropQb6UTTCd3wxvodBJzSdqMHECaUzCGAdOGFbwyJWrnI5rR//ZxJ?=
 =?us-ascii?Q?+8rwbrp7zfH4q+fPU/MrsM7Z6/5VamZtLxI9lXQLx/6S8kWugGEyb0cOr64U?=
 =?us-ascii?Q?0wCRs21XbwEPFXjUs7NxO3RzvYnHtVLNBlKYUkIP1VTSF7NAWZ/5fSg9v7Bm?=
 =?us-ascii?Q?r+Udmn7fjuLcmuFg/m+RTa8P59d/B7TLPFDy3mgIIOeyXa61y1wNkWu86Rkc?=
 =?us-ascii?Q?1jgAjXIRApBvKDw194ukXFfBMA6IuOxyMxIquVgGnZHD58jLdgLewLWQO3Hk?=
 =?us-ascii?Q?6pVOr2w/DM/XwhD5ycRC8akyoxtdYijWFCcEIUgvE4uWe4YoZIuSiV1G3e/h?=
 =?us-ascii?Q?Mo7SVsbUUFafU9sNTP/KB3j6aJxCJ/2mPhkwXF9fAs7LigF3tedjMDwAyV71?=
 =?us-ascii?Q?rUCXasenJd3Wv3p0iPQg/pVkrJpWF043Imj5Ot4/Y7wZkruk9rd4hbcIr52g?=
 =?us-ascii?Q?GIcjWmmcVGXKdt097COWX322wplBH69lDJe1MNgEW/XtFT3nx29R74jDkSPQ?=
 =?us-ascii?Q?XDdlfTiJOQE8IfWy4rYzOwukeR4PgqREIYb0+X6uMLTuIFBpxJAUzmRM+/bg?=
 =?us-ascii?Q?8y2DKN6OTmKiyiDfH/U4MW+sUNlwwL+IRmkoTpdG3lQs4lmtpfd63kyV0sxV?=
 =?us-ascii?Q?DITmJHcQUf3J0+7NjhppFVzB7kcqYfWNuAW5HC6+PFhXX0VuqTbqZNraQ8kc?=
 =?us-ascii?Q?JhtSK6HVA7uXsJEaXwUjsxK1buSF3PyIGvfNyK9akzlkBzrwxInAAjIirkFY?=
 =?us-ascii?Q?O19aEpTq7VNJx7h0XFHtR0FMNLnMp9Aa6zluM0I5GtoTtKzzjvScOggwjUpU?=
 =?us-ascii?Q?fRoTNwyeyHJ6fbWXUtm2L/mJaU0meE6L4vFjxxSCxKcr4MOQZeaIqpuS3U9P?=
 =?us-ascii?Q?KJhlt6/3sbaCacrSlD/oi93CkDlyF/1pKrK5eLZFOJpsaftu7AbH5mqibO+m?=
 =?us-ascii?Q?W2pomkmlZR3CQCVhdiTiFU4obV9/vRmyA5zyj7PEzE7mDY5cmikGjUCDnqhy?=
 =?us-ascii?Q?rkwQrIoxTERiWpAUgy3QGGeUCI9A+8ulunGfhpWCOLV6elK+hbCyv4kMR594?=
 =?us-ascii?Q?XPemxViZitk54iFLrEjA4ZuCZsFOqHajtGisHwPhmc/q9JRFE4v9qFmMU/r1?=
 =?us-ascii?Q?sDMko2gdJSWQPgF3PsV2mf9toOUIZUhMxKtCTt3zcOpE7CbA2t0EIW3izSTA?=
 =?us-ascii?Q?tzYQydIDqK2VMXBTxH7uJv8MvnGbzwspQn0PtOxbOIGWf1NHOUqZZXZU25Ec?=
 =?us-ascii?Q?tNh0OiYmORhWti6ZUFywcx7+W5WeepafENwU/JweKGM12V6SCG0rZfNDfPeF?=
 =?us-ascii?Q?TvqxoSaBLNQCJuGn6cxEWz2M5ziu14n0RPdGBpoTe0OWQO9uNmHi1O0LAHmY?=
 =?us-ascii?Q?WgrjiKuVFNCjBz1CI6AmMHxYpdQTpEjoIjbOeeHERa7aq6hrm26u/mp8kOLd?=
 =?us-ascii?Q?8vsBy0BNPIaehk8GQvukN9z6t452jdCEYGMOL6dGXMXIq7shLwk/B7Lg+pjw?=
 =?us-ascii?Q?KSwfFgyplposNlNuxjxaLK7L6AZXpo1bOHpiQTUvqeDs//g5cNCifWofYZ7B?=
 =?us-ascii?Q?jwOPq1SnaDq1EqDboRHVjui4JQwAKyboJpgJo7KLQAu12zxpVey1aV17MPwI?=
 =?us-ascii?Q?H0hlWAy0yQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b62bd515-cbd6-47b4-959e-08deebf0751e
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 15:05:12.3559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+tc0ShppoZdiQzkvMQAOf+x8AdqRmDhtuMR69GYGLw4NLiMLiPNjRUwfrOUVNaicUyG893hsie0DfOeTMwsLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8182
X-purgate-ID: tlsNG-16d1c6/1785164716-1FCCD77B-FFBA1D60/0/0
X-purgate-type: clean
X-purgate-size: 5251

A new parameter write_back_old when set will return the old PTE value.

- The new PTE value in req.val must be 0, this is for clearing only.

- The PRESERVE_AD flag is rejected with -EINVAL because preserving
  Accessed/Dirty bits into a zero'ed PTE doesn't make sense.

- Only l1 PTEs are supported because they are the most frequent and have the
  biggest performance impact.

- The old PTE value is passed back to the guest through the req.val field

If the write_back_old flag is not set then the old behavior is preserved
  do_mmu_update -> mod_l1_entry -> UPDATE_ENTRY -> paging_write_guest_entry

The new get_and_clear call chain looks like this
  do_mmu_update -> mod_l1_entry -> update_intpte -> paging_cmpxchg_guest_entry

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
 xen/arch/x86/mm.c | 62 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 58 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 500549c8e036..278b992aca5c 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3988,11 +3988,12 @@ long do_mmuext_op(
     return rc;
 }
 
-long do_mmu_update(
+static long __do_mmu_update(
     XEN_GUEST_HANDLE_PARAM(mmu_update_t) ureqs,
     unsigned int count,
     XEN_GUEST_HANDLE_PARAM(uint) pdone,
-    unsigned int foreigndom)
+    unsigned int foreigndom,
+    bool write_back_old)
 {
     struct mmu_update req;
     void *va = NULL;
@@ -4144,13 +4145,41 @@ long do_mmu_update(
                 switch ( page->u.inuse.type_info & PGT_type_mask )
                 {
                 case PGT_l1_page_table:
-                    rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
-                                      cmd, v, pg_owner, NULL);
+                {
+                    if ( !write_back_old )
+                        rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
+                                          cmd, v, pg_owner, NULL);
+                    else
+                    {
+                        l1_pgentry_t ol1e;
+                        if ( unlikely(req.val != 0 ||
+                                      cmd == MMU_PT_UPDATE_PRESERVE_AD) )
+                        {
+                            rc = -EINVAL;
+                            break;
+                        }
+
+                        rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
+                                          cmd, v, pg_owner, &ol1e);
+
+                        if ( !rc )
+                        {
+                            req.val = ol1e.l1;
+                            if ( unlikely(copy_to_guest(ureqs, &req, 1)) )
+                                rc = -EFAULT;
+                        }
+                    }
                     break;
+                }
 
                 case PGT_l2_page_table:
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
+                    if ( unlikely(write_back_old) )
+                    {
+                        rc = -EINVAL;
+                        break;
+                    }
                     rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
                     if ( !rc )
@@ -4160,6 +4189,11 @@ long do_mmu_update(
                 case PGT_l3_page_table:
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
+                    if ( unlikely(write_back_old) )
+                    {
+                        rc = -EINVAL;
+                        break;
+                    }
                     rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
                     if ( !rc )
@@ -4169,6 +4203,11 @@ long do_mmu_update(
                 case PGT_l4_page_table:
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
+                    if ( unlikely(write_back_old) )
+                    {
+                        rc = -EINVAL;
+                        break;
+                    }
                     rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
                     if ( !rc )
@@ -4198,6 +4237,11 @@ long do_mmu_update(
                     break;
 
                 case PGT_writable_page:
+                    if ( unlikely(write_back_old) )
+                    {
+                        rc = -EINVAL;
+                        break;
+                    }
                     perfc_incr(writable_mmu_updates);
                     paging_write_guest_entry(v, va, req.val, mfn);
                     rc = 0;
@@ -4366,6 +4410,16 @@ long do_mmu_update(
 
     return rc;
 }
+
+long do_mmu_update(
+    XEN_GUEST_HANDLE_PARAM(mmu_update_t) ureqs,
+    unsigned int count,
+    XEN_GUEST_HANDLE_PARAM(uint) pdone,
+    unsigned int foreigndom)
+{
+    return __do_mmu_update(ureqs, count, pdone, foreigndom, false);
+}
+
 #endif /* CONFIG_PV */
 
 /*
-- 
2.52.0


