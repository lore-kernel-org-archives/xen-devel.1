Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A12A606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=aLZlxuRV
Received: from list by lists.xenproject.org with outflank-mailman.1460915.1671805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGqA-0006M1-Fk; Mon, 26 Oct 2026 09:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460915.1671805; Mon, 26 Oct 2026 09:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGqA-0006Lp-B5; Mon, 26 Oct 2026 09:18:02 +0000
Received: by outflank-mailman (input) for mailman id 1460915;
 Mon, 26 Oct 2026 09:18:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xLGq8-0006Jt-Iy
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:18:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLGq7-00FxFv-VJ
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:17:59 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6adf1abe-e002-0a2a0a5209dd-0a2a450290ba-24
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:17:59 +0100
Received: from [52.101.201.53]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6adf1ac5-6ca4-0a2a45020019-3465c9353e53-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:17:58 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by EA3PR03MB455330.namprd03.prod.outlook.com (2603:10b6:303:30a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 09:17:55 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 09:17:54 +0000
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
 b=GJoi/eX1kWY8BfQxEn3d8azvW2oeOiCBPUEEMQiTD4zgSKgeDZZ3MaR6uy+nGqIPjRF1somitiPF9mWohfFh5XAP87KeXtyYqTMqvLEOTOJ1IbgIHgM4Pg+MMgSVlhj/ikQiTAje6SZCHM0Evnt+hO1+1sPbdv1yirgdNiyBgG4q7d1mk4oVKWKCKQFJ8ASA9FqGF+61f6jXn59jiXJntqJn6pslJxLNDsr1FiKR5QB+tRijNkj0fzW9KvyDBBn6BJRKCz7IVMoSdP6xCdba6M6HcR53uctniD3365vPR628loFY6nU5mf1FnpCipcaBwucyFFAvMSqG6REyA/tvpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bMm40wYYoEWuhZeXhJyKdJ2OStFlJlW/9XssLOh4h0=;
 b=MGJ2uqSVRLUHnoFxd9ATpJ4cvnfrif9ZomLfk7R7k4frA0zjUr7TJzTsIAcopYCIIejOKyThbi9+FvnSfGtypy0eEFH8AWhLkKm5C+NjWSmvpIkp1iUp8sTZdsKZ0XR5PnUsdzpHuLme1cTTi8WMV/zEYKzkipvoraubtcFCp/qS3cIF7Hzf3Af+63Q4HE2TmrLPQttuAns8DAEW3jxhZyO/fv+j+20ZY8zxK+IYtF2obX/GoIyafrhp4Qn7GEgJHs8b67/yMlue7OzU/PEeyzwZ3m8e0B93wST63ri/fTdLlePL5mh1ywIYoruhYZcZBuT3FOJXIQfky9Iq/64r3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bMm40wYYoEWuhZeXhJyKdJ2OStFlJlW/9XssLOh4h0=;
 b=aLZlxuRVzdaXFFeTqI7GX+ZZQnUNEn58gxjoUj1P4DOECL47wIBsOAZZiwpc3bp/4IAEZsPh09psmRrp+h9SB5PZeTmWchv195+8mdHy22uujdI4TtHwIJaPZP1is3gLatzvNJ5qmzjPaCJIWcw4+gsQsI9bzM24oaSqqrL5ixU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	ross.lagerwall@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v3 3/7] x86/kexec: add new struct kimage_segment
Date: Mon, 26 Oct 2026 09:20:13 +0000
Message-ID: <20261026092017.3880869-4-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261026092017.3880869-1-kevin.lampis@citrix.com>
References: <20261026092017.3880869-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0010.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::18) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|EA3PR03MB455330:EE_
X-MS-Office365-Filtering-Correlation-Id: b99bf522-2d8d-491a-cfa1-08df33420455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|261009223027099003|261022115727099003|261022075727099003|261021121427099003|261021123027099003|261022105027099003|260925021311599003|260925021911599003|260925022911599003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	372pl3QR3OGmH/U1pWDr6UQchMhv+I2kmseFuwe6xQR45d6RHiauQRHvJ3MQU0LK7kUk2Or1gFv/NhlauC8a9gTJPNhtvWk+ouBN2v2ETrdIWDZzR+42xcvkr7GkGLfz933ezu0wzShOJTakSgF8kIs4fCHv6zFjHwvqtnQEkzPtTLH2XfJYDtUg2Jd153sQx4eA9hCP+2MORcnkcf8JQ98Kobvv9DS0zUlr6HjQcy8QdwVCRyz6N+CrAkml8UdXrJoO92POfVl579wHJltg8aKYzIQoVR7LET2FVyseGpZXfBFLNa73vQcZrJ8IbK+PRunmVGxfV9Lc+mUoJDXqIh6eb9e6nokmVogtC5vuxK2h7YGCx6z5dsCspG6dsvfT/4keSPt2Sec0WSt+eyK+n2xmKizqr5VNBs3QDwTBwdVKwl98G9HwUgjKq6ikbjOaWzA3E5FdzUv0ypJcfORcVG65ASZeSCjs+wPmGB+G5yAXgXyt3Bz6M5aVmO285gsJpRMd/ZUGy8rnzWMGkFRv/aOfCkbIRhVlpmTrOa8WSdFVG/bWlzPH68/hMJc0MJDtEBlhqeCqk3QvklzqLNzlobQDGC0xxxu2kxQsESb1WvTEpTq2L79KdH4PuaH1dFmnuvgqX5gZEvMbk8DZNFhSFXs8ubKLpzeuNu/Pabw3vrg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(261009223027099003)(261022115727099003)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0dUzME5YYoz2Lebs8i+0URyr4B5kEJq9KEoaV25Z4J37kW5sewraC5L9Voj6?=
 =?us-ascii?Q?g5PJeV/SVzc4v6A+rdHFEKcDccLXXw2NPPeDnRke2BbHZsacWvAcFy+DR9MC?=
 =?us-ascii?Q?GkNES8aUa/xxokcFwwtt19CKObhuiuZwOFc3NOnWcLb6VKBHbyAwk2s8a1it?=
 =?us-ascii?Q?zJMw2db4Jgkvw9LYHR7hyOjXMwAiAA3CuT5bg4CVEAhRD/aLzpdM+fetsKfK?=
 =?us-ascii?Q?Vey+QdRok9rKIbo1DatPhM8N5sjMG8UbawdzaP/gUK36JMGB9u7ChcHqMUZi?=
 =?us-ascii?Q?Eo/rvYJ+BRIre9pFb8/UdVr6dBXZ7lV5HPmSJLjWi4+00g6RvNSRuLI4DS89?=
 =?us-ascii?Q?rrvwIPZxIGFquUyw0cVkPAcWXzPSJVtHwqi0WOOxCB6pw2n9r44OgueD0Zjc?=
 =?us-ascii?Q?GhGsQ21JbjmHn54ixe5E2Ks87HOAWlUjJkB1RrP/cgD8kEcxNMVYB9d2uhHr?=
 =?us-ascii?Q?W1PZCee6yPk8LBdYvKshQFuA5dToYyqd78j2gMM98TbGGd6TypQmi67mdTtN?=
 =?us-ascii?Q?Tk1pfV+cLCmJfYy0ZmGkqajjXKLm1FecpcnJivBHycNVPd/lowIPzgb92U7B?=
 =?us-ascii?Q?FnLk7bMzaMl5nnkKU+FSCNY9ozStWc2rGWvVcGFd7Cnz86VtXOor8UcRq9Ow?=
 =?us-ascii?Q?/PwGqIoXrqPoCBkcuYUYTwOR4aoxMzXdqmBz1/7BTEQCdW79QXdYPGLlUQDp?=
 =?us-ascii?Q?efWXkS/opUovB8jeI0hz8nPGhifE1b7zl8TUuudalaZTuiyNZpRVT6VHqpBT?=
 =?us-ascii?Q?NWyZ3yfQNd+zsVEd7/VSMJF1QACO9cOanvGhI2WAyqD5/KkoFUyqWPI8eai4?=
 =?us-ascii?Q?YKD3kBrMoV3KvJwCI5fWJ1P6Ye5ay+cn2U/G3+o41ddPa0V/r/ylr+Y/Sdxo?=
 =?us-ascii?Q?GICbxYz49MirsfVmlEfNfM72Tre/E/0K7Qtl1hJPs7ton/9NLSs0MaWnjs2j?=
 =?us-ascii?Q?dAxEoHHag9psnHxSEx6bU+Vy7LIbOk07EjXE6cRaq9R1Gzpz/m1Ni+g2bxd3?=
 =?us-ascii?Q?Vt5DuE6FFv+FsaB4RjrseGewrVuoQZQvax7SKjAokfAdKuJa+NKKWkGxP/SP?=
 =?us-ascii?Q?Izq0rtG1btD2ezierVM67bsXPJy5Ya7xNtLPVHmSWT7xfLq7i/kMlatuGKcA?=
 =?us-ascii?Q?8GjWA4uKz/bMF4wLLC5AnqzyRDmRaNdtk49aAQ7eUmFmer9VYJPNSVewkFST?=
 =?us-ascii?Q?DM0bGWwAc8Q1lLDJ4/MDy1uOdRoKyKgQgDg7QCWaSN0L+sRm4MlwfV6vLrYE?=
 =?us-ascii?Q?mnLJhW0AxVqdEe73W9FBSe/aOv7p949BuwFv946EWpUsCky9vh4XIxC9QrHm?=
 =?us-ascii?Q?5NhIXmOVcYyzY3RwHyAJprrxUyLQdfGG4D7qVb3HM5b6AZE22TPm+co5hqCW?=
 =?us-ascii?Q?z0xjezdKQlCwJptGOYJ5u0kNnLmiBzsSj0A7teBdww7r4/xXiJVLfBeypMtN?=
 =?us-ascii?Q?b2Ki/JmeY7TkoUj0iNLnZ7hJ7hO4p2Xo0Z85axBToEiITZDSfqD2nRmarS8v?=
 =?us-ascii?Q?vMaRnF4F1by2X7AzrK/bsJyT+uhSER4UL17GeqXqNIkde1bYztIL1Cu3UhoF?=
 =?us-ascii?Q?JjDIc3ooEx5T8DJdox+vgst2UNBDNXeqcIUthUd3XynNAwr/bBKTUc476n0V?=
 =?us-ascii?Q?QPHO80cpH20go5EF3I5fyIsDAU3+CWl7A7X6v6M0W7Ro5EIKKd4vT8V3Et9Y?=
 =?us-ascii?Q?PiJlLwXWLp91lWfVCUzceVaTrttCWXhzhC4YJIQJQskprwf7gcUM1Po/ax5w?=
 =?us-ascii?Q?8zHlkZSUpw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b99bf522-2d8d-491a-cfa1-08df33420455
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 09:17:54.4210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bqT0SHUb1UI1kQuN2uQ+yJSpUK5dyR42/94Wu7w434YrGkGab56Mne0GKcBZfy738KIdueTM4Y93Au/YCIbaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR03MB455330
X-purgate-ID: tlsNG-720697/1793006279-F20A82AC-3BE05A78/0/0
X-purgate-type: clean
X-purgate-size: 8217
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ross Lagerwall <ross.lagerwall@citrix.com>

New struct for internal use because Secure Boot code needs to add an
extra field in a future patch.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v3:
- kexec_load: move variable `i` into loop scope
- kexec_load: Add blank line after tmp_seg declaration
- kexec_load: Don't initialise tmp_seg
- (Jan) I decided not to change uint64_t to size_t/paddr_t because it
  would require pulling in more headers and I don't want to add more
  complexity here.

Changes in v2:
- Read into a local xen_kexec_segment_t variable and fill in segments[i]
  manually instead of casting from a different sized type
- Remove union and _pad from new `struct kimage_segment` type
- Swap xen_kexec_segment_t to struct kimage_segment in separate patch
---
 xen/common/kexec.c       | 19 ++++++++++++++-----
 xen/common/kimage.c      | 25 +++++++++++++------------
 xen/include/xen/kimage.h | 11 +++++++++--
 3 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 68f4c2cb2671..c92c464fe0ec 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -917,7 +917,7 @@ static int kexec_load_slot(struct kexec_image *kimage)
 static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
 {
     xen_kexec_load_t load;
-    xen_kexec_segment_t *segments;
+    struct kimage_segment *segments;
     struct kexec_image *kimage = NULL;
     int ret;
 
@@ -927,14 +927,23 @@ static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
     if ( load.nr_segments >= KEXEC_SEGMENT_MAX )
         return -EINVAL;
 
-    segments = xmalloc_array(xen_kexec_segment_t, load.nr_segments);
+    segments = xmalloc_array(struct kimage_segment, load.nr_segments);
     if ( segments == NULL )
         return -ENOMEM;
 
-    if ( copy_from_guest(segments, load.segments.h, load.nr_segments) )
+    for ( unsigned int i = 0; i < load.nr_segments; i++ )
     {
-        ret = -EFAULT;
-        goto error;
+        xen_kexec_segment_t tmp_seg;
+
+        if ( copy_from_guest_offset(&tmp_seg, load.segments.h, i, 1) )
+        {
+            ret = -EFAULT;
+            goto error;
+        }
+        segments[i].h = tmp_seg.buf.h;
+        segments[i].buf_size = tmp_seg.buf_size;
+        segments[i].dest_maddr = tmp_seg.dest_maddr;
+        segments[i].dest_size = tmp_seg.dest_size;
     }
 
     ret = kimage_alloc(&kimage, load.type, load.arch, load.entry_maddr,
diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index 6e009529ae01..dc4730622371 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -81,7 +81,7 @@ static struct page_info *kimage_alloc_zeroed_page(unsigned memflags)
 
 static int do_kimage_alloc(struct kexec_image **rimage, paddr_t entry,
                            unsigned long nr_segments,
-                           xen_kexec_segment_t *segments, uint8_t type)
+                           struct kimage_segment *segments, uint8_t type)
 {
     struct kexec_image *image;
     unsigned long i;
@@ -206,7 +206,7 @@ out:
 
 static int kimage_normal_alloc(struct kexec_image **rimage, paddr_t entry,
                                unsigned long nr_segments,
-                               xen_kexec_segment_t *segments)
+                               struct kimage_segment *segments)
 {
     return do_kimage_alloc(rimage, entry, nr_segments, segments,
                            KEXEC_TYPE_DEFAULT);
@@ -214,7 +214,7 @@ static int kimage_normal_alloc(struct kexec_image **rimage, paddr_t entry,
 
 static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
                               unsigned long nr_segments,
-                              xen_kexec_segment_t *segments)
+                              struct kimage_segment *segments)
 {
     unsigned long i;
 
@@ -236,7 +236,7 @@ static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
     {
         paddr_t mstart, mend;
 
-        if ( guest_handle_is_null(segments[i].buf.h) )
+        if ( guest_handle_is_null(segments[i].h) )
             continue;
 
         mstart = segments[i].dest_maddr;
@@ -664,7 +664,7 @@ found:
 }
 
 static int kimage_load_normal_segment(struct kexec_image *image,
-                                      xen_kexec_segment_t *segment)
+                                      struct kimage_segment *segment)
 {
     unsigned long to_copy;
     unsigned long src_offset;
@@ -698,7 +698,7 @@ static int kimage_load_normal_segment(struct kexec_image *image,
             return ret;
 
         dest_va = __map_domain_page(page);
-        ret = copy_from_guest_offset(dest_va, segment->buf.h, src_offset, size);
+        ret = copy_from_guest_offset(dest_va, segment->h, src_offset, size);
         unmap_domain_page(dest_va);
         if ( ret )
             return -EFAULT;
@@ -717,7 +717,7 @@ static int kimage_load_normal_segment(struct kexec_image *image,
 }
 
 static int kimage_load_crash_segment(struct kexec_image *image,
-                                     xen_kexec_segment_t *segment)
+                                     struct kimage_segment *segment)
 {
     /*
      * For crash dumps kernels we simply copy the data from user space
@@ -747,7 +747,7 @@ static int kimage_load_crash_segment(struct kexec_image *image,
         if ( !dest_va )
             return -EINVAL;
 
-        ret = copy_from_guest_offset(dest_va, segment->buf.h, src_offset, schunk);
+        ret = copy_from_guest_offset(dest_va, segment->h, src_offset, schunk);
         memset(dest_va + schunk, 0, dchunk - schunk);
 
         unmap_domain_page(dest_va);
@@ -763,12 +763,13 @@ static int kimage_load_crash_segment(struct kexec_image *image,
     return 0;
 }
 
-static int kimage_load_segment(struct kexec_image *image, xen_kexec_segment_t *segment)
+static int kimage_load_segment(struct kexec_image *image,
+                               struct kimage_segment *segment)
 {
     int result = -ENOMEM;
     paddr_t addr;
 
-    if ( !guest_handle_is_null(segment->buf.h) )
+    if ( !guest_handle_is_null(segment->h) )
     {
         switch ( image->type )
         {
@@ -794,7 +795,7 @@ static int kimage_load_segment(struct kexec_image *image, xen_kexec_segment_t *s
 
 int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
                  uint64_t entry_maddr,
-                 uint32_t nr_segments, xen_kexec_segment_t *segment)
+                 uint32_t nr_segments, struct kimage_segment *segment)
 {
     int result;
 
@@ -819,7 +820,7 @@ int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
 }
 
 static void kimage_calc_one_digest(struct sha2_256_state *ctx,
-                                   xen_kexec_segment_t *segment)
+                                   struct kimage_segment *segment)
 {
     paddr_t dest;
     unsigned long sbytes;
diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
index 8ed89d4fa306..0841b6f32114 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -18,12 +18,19 @@
 
 typedef paddr_t kimage_entry_t;
 
+struct kimage_segment {
+    XEN_GUEST_HANDLE(const_void) h;
+    uint64_t buf_size;
+    uint64_t dest_maddr;
+    uint64_t dest_size;
+};
+
 struct kexec_image {
     uint8_t type;
     uint16_t arch;
     uint64_t entry_maddr;
     uint32_t nr_segments;
-    xen_kexec_segment_t *segments;
+    struct kimage_segment *segments;
 
     kimage_entry_t head;
     struct page_info *entry_page;
@@ -44,7 +51,7 @@ struct kexec_image {
 
 int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
                  uint64_t entry_maddr,
-                 uint32_t nr_segments, xen_kexec_segment_t *segment);
+                 uint32_t nr_segments, struct kimage_segment *segment);
 void kimage_free(struct kexec_image *image);
 int kimage_load_segments(struct kexec_image *image);
 struct page_info *kimage_alloc_control_page(struct kexec_image *image,
-- 
2.52.0


