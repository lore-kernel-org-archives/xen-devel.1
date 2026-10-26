Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB54606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=g8750+JP
Received: from list by lists.xenproject.org with outflank-mailman.1460966.1671858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGrt-0001GK-31; Mon, 26 Oct 2026 09:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460966.1671858; Mon, 26 Oct 2026 09:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGrs-0001GB-Vj; Mon, 26 Oct 2026 09:19:48 +0000
Received: by outflank-mailman (input) for mailman id 1460966;
 Mon, 26 Oct 2026 09:19:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xLGrq-0001F9-Uz
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:19:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLGrq-004yrd-BZ
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:19:46 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6adf1b2d-e002-0a2a0a5209dd-0a2a450a9462-20
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:19:46 +0100
Received: from [52.101.85.47]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6adf1b2e-f2d2-0a2a450a0019-3465552f9788-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:19:45 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by BLAPR03MB5489.namprd03.prod.outlook.com (2603:10b6:208:299::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 09:17:50 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 09:17:49 +0000
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
 b=qQjKSwBkOCfMbTtOac1T7XYa17hAOjIYhlMX/pCbyCvHS2fywLJAJkLgGPC5al3cvLOkfeot+tCu/POe/QY3l5sY1X6OhndeKJiwccZ/Q2sbg4kzVIFf/G4MDGWbwm+lObcvTCXu0Laljf6JW6/bhqUDQowJYrGT/pbsU+Edfa1YCuapxfrFsiwZjZd4gUhaMmwk9bKaJMU8xrfJ6c+w2pxXFwI6z2yDt5WnRQBobrUL8MfsMe4E016BtWgMJ86frnH0EujCTiHTdFetY5Jziv3lYraChIMy+IvBNjhgYxIttJdy5X9kW55kyYm5WiWCYEzVNX3QjbZRx5jV+AoQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Q4cakGw4L+4MXxU0t1Dsdi4OfcnAS0SKvjzDpHV5T4=;
 b=RrIGyOAc224TILKTh9AEJb52SaXlpwLOqnyxnaFX3bvDKTjeHtYilAed+dwdiBC6xPzW6wQ8DjH9NMe04uZhDdV4WtItcCnlIuJfaQqJpoCECl95Lxmb7MO2C0ZEZL9QTyfJWrR+MAoMv8i1f5Pg/Qk7olKkFELP6ntd5Ssyd/1y6Zu/OB+OPaBHIutessstVrxkxpRLSrjR7d1KhtVHl8s4NuTzIFVUTwSq0LHm/MR3Moc6XThdYE69AZgJ3MHjwM5s6LFZbFKT0CVFT6u495Jjuvxkk62I2TQAtPuKlZBClQYTu6ZegTdehIngP/8ThoA74P5UgE3cxgJhXFBYBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Q4cakGw4L+4MXxU0t1Dsdi4OfcnAS0SKvjzDpHV5T4=;
 b=g8750+JPdJ/Xbvz032QcT+roUdQ4fp58I7mC+LGwkvEZQ8HzNVkKrlEYjbD3Hq3W2csHBtnkhM2PIzfNs2NlzL76tJqahv4GvVkOi0np86IfKpm7Kv869D6a+zVOjhLNYGoCidyvIZj0OVgrT/VeJVRXKtr8IJAalgZ9OXS/EDc=
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
Subject: [PATCH v3 2/7] x86/kexec: rename setup_header to bzimage_header
Date: Mon, 26 Oct 2026 09:20:12 +0000
Message-ID: <20261026092017.3880869-3-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261026092017.3880869-1-kevin.lampis@citrix.com>
References: <20261026092017.3880869-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0271.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::7) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|BLAPR03MB5489:EE_
X-MS-Office365-Filtering-Correlation-Id: 82912230-4a85-46b2-d2a1-08df3342019f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|261021123027099003|261021121427099003|261022115727099003|261022075727099003|261009223027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	BIq7QwU8q6R/z6BhHFthYqzsOg8gOfneUF7Qzi/paTuiWn5hEDowI7NzbC+BkbUztvfk60QrcxPUmLfVXe9ge9w7+aSfc+Iwf/99rqneQo7ixdPB/OBxqWs1wLsJ0xxhr/Y5xpkP29Lbld+4gk4Q+9T+7h/5Yu6Hi3oRmCWodbEQMF7cGFg8EdLgXv7irvLQ8GJ99Z05nZKB7GTUbZ5hSh2oPOCTSqYz5tK0MnCxNORlq4InMwBAbDV7mUzkO3GxkWplBGcKLDFGUf4xNlrDVbm3Ki7d4+noRQGB5N5f6Ab3prbZQaoDxGQKV62arIHo2hOjqxnQYHROYkRD03EyJjb9+4uho1lIGauhmlOiIyjFlNoO1HwF9S8BLLruaRtkBhdPRZR2Z8pIgnzn/+rc7K25J+xcQsYjSKsB06Xdyfbw8lnsvrERGc725pSkvjanxE/vkQgbXJrzbY/qUSPFvPHYtPBnS1RaOHLw6JhfstXZjB8+NPJ5qaO77/yleKpNoKAf6VVaUDKF9NIAq3g66Jb3ZZZ6nseo8tDOFinHfSsh737ektg5ljnUVtLjvcFpdlibsXl/l+J6WuD+tMImChRU8kVfvFsEQ1E9aG4W2ehjamZDlPHQQBwSWFfq6pDvLwFaqcyfb0eN/dc40MvSS49AMN8B/xSGwGxWzZMuYgg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022115727099003)(261022075727099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yQL9RBcf3Eg2ZpbrfEAjvZSVgxXXiqujmt/T2QtxfOFyzI3W3B3OE9eXOQ1u?=
 =?us-ascii?Q?6Nn+h1+VBrCYrpRVSFILnbYqLfsh6/eVNL3/Se5XUrE3XxaUrvB+rQ34mtL2?=
 =?us-ascii?Q?lCOPZmaApBYyxyy/aa1KnELpa2zsEvHw32Bf2alS+8MpIdOwHkBsKirI/4qf?=
 =?us-ascii?Q?SOHf4mmo8bxZs88ebOhplFf0rclYolooJMeJFx0CTsphpLD2+f2qOlDPGfVJ?=
 =?us-ascii?Q?XLvZegbbtPcx6m+82BmgFXRSlXHfnne9LF42PDolKqRGF606wx8UWu4GiPrv?=
 =?us-ascii?Q?hirGkMmJOYPXckhtzGa4VWpsj4zvd9YQ6mDI5/wXG2R234EnrambkS5nazGn?=
 =?us-ascii?Q?el9QRJBKeeiE+wkqiMgUbtZ8+02EU793Dyr7V/KTytOrb9cQ9DG2EJyTEC3v?=
 =?us-ascii?Q?8YhHWVUVkdqOVGdBTKYy3NYlzJNCFyeA29bj7bDZKOWzccImIjWhXHtGraOl?=
 =?us-ascii?Q?u+j63pCeOPrAKfKgPGHs3F6SEiM2iDWs8VON4RQuCUxD/DLWDbe7xembmqKX?=
 =?us-ascii?Q?gNr4E+QL5QL16BmGTRMPYt1mKGoZOZTNwyo1QNxLJ1RdnGUoZjJ5tD6Z8jOM?=
 =?us-ascii?Q?EtDfN7JUVEyqkoDmxBUQhFu4FjM8SqFraW79Xns6dG4K3oxcK1vEHZITFjnX?=
 =?us-ascii?Q?cYcTS1da4RbDxqhK8wi9TOA03HlR1YW0vKeT7twKc/+r2usQkMuy7jx3nw5R?=
 =?us-ascii?Q?tY3NBf33FA1GOL9f7N/hrIS2xWMXYZnunM0Gr2qPcziyaoP51Wur4VOmqFsf?=
 =?us-ascii?Q?TukyIyKq8NMe4tEzeNsX9XHQDNsbt2g4BSosYQ953tAiJUmE/b6G93kZIqao?=
 =?us-ascii?Q?OcruhK9OYjex7nlR9gp6CUkDnSZUmTULBvnn1lgIWwLxKrIWWJj0obXzY5B9?=
 =?us-ascii?Q?pYtRS9YXOJ7TniRwmLawxQOoUtqRg5+rmA/UhLdm+++vHM034eos2PJEisp7?=
 =?us-ascii?Q?UXtREoE6EwDiM7OwT+1Rw4ANwwnM0hgQ2FAIYWHjMod4/HyIS2Dy2bmoHg02?=
 =?us-ascii?Q?btm85XIt4KqVYZX/1Sj4Lc2fxIN1x5TA5/aK7eABAvnCneUCNWRxEzC03xGT?=
 =?us-ascii?Q?RmCai6wC1H3WR3uM5fJExN9YuuHzWpPd5Y/1hZaVl4qqJYu9J/nZtXK3+YaJ?=
 =?us-ascii?Q?Aufp1CDB6IHvkF9dJh3bory9ObIhE2eqy567mDlpJeYa1YknkKxOgATR5Ox8?=
 =?us-ascii?Q?f8olpUmwqW4O+X8SsgRTKd1kOm+dDXnANAH9OmVTugU95CDt2+c+iPLSvl2S?=
 =?us-ascii?Q?eE8JNzglNuLcbgkft57TE9y2BDSrj8W+V/fYXyy0HA+dnad8LHsL2OqUAh9R?=
 =?us-ascii?Q?ivrIaKn1SnY43rBdmgOKSgJ4w7oAuqZGUyt+lKooTgGuyvQImrIFi1qW+gmG?=
 =?us-ascii?Q?MIAZqiN8by7QHyZXI0c8vEB1EI/aIfhRWte76Y3LJYFRl7J3Oc+OGGhaAyl9?=
 =?us-ascii?Q?SqDoKRARdVHpWxauv9YQNQQcbBydSsb+sL4ID8tazytj1h2cisDxS1wCB7Vb?=
 =?us-ascii?Q?B5BW463+7ZFl3v2LscvNXJwkud7pTijaMW1uroGhU1bs8dJ0NAWKdP2+w8fL?=
 =?us-ascii?Q?DEhacf3+2+V8Y80ZYvciutwa8ZBLoxTl/n0f5gRROT5y3uFv8drPMcbyiTi2?=
 =?us-ascii?Q?+Y4kq/iQ1MEKQHoFPNRJsZvaEbfnOqTZHWrML190MxDPiy2OsVYdsNnrK6kU?=
 =?us-ascii?Q?Y4WD8Eybb0rhc6Ypfo6fqE/hKItUyliiz7WPCHP2yodSDy0IG2OsT3c5RGcy?=
 =?us-ascii?Q?E0veF0ageA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82912230-4a85-46b2-d2a1-08df3342019f
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 09:17:49.8670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bQKKVb3FrsRS/ANdv55I5Q6MWaNxfw2XO3tGzYFzf4shz2P+VC52rKRE68VGv2COOMdcPlB5d/vhGQUQmn/Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5489
X-purgate-ID: tlsNG-4011c0/1793006386-585CBCFC-F562BFFC/0/0
X-purgate-type: clean
X-purgate-size: 5641
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ross Lagerwall <ross.lagerwall@citrix.com>

The newly named bzimage_header is moved to a header file because part of
it will be needed for Secure Boot kexec.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes in v3:
- No changes

Changes in v2:
- Remove unneeded casts
- Move setup_header to appropriate header file bzimage.h
- Renamed setup_header to less generic name bzimage_header
---
 xen/arch/x86/bzimage.c             | 47 +++---------------------------
 xen/arch/x86/include/asm/bzimage.h | 39 +++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index 66f648f311e4..02433ac46f0b 100644
--- a/xen/arch/x86/bzimage.c
+++ b/xen/arch/x86/bzimage.c
@@ -13,48 +13,9 @@ static __init unsigned long output_length(void *image, unsigned long image_len)
     return *(uint32_t *)(image + image_len - 4);
 }
 
-struct __packed setup_header {
-        uint8_t         _pad0[0x1f1];           /* skip uninteresting stuff */
-        uint8_t         setup_sects;
-        uint16_t        root_flags;
-        uint32_t        syssize;
-        uint16_t        ram_size;
-        uint16_t        vid_mode;
-        uint16_t        root_dev;
-        uint16_t        boot_flag;
-        uint16_t        jump;
-        uint32_t        header;
-#define HDR_MAGIC               "HdrS"
-#define HDR_MAGIC_SZ    4
-        uint16_t        version;
-#define VERSION(h,l)    (((h)<<8) | (l))
-        uint32_t        realmode_swtch;
-        uint16_t        start_sys;
-        uint16_t        kernel_version;
-        uint8_t         type_of_loader;
-        uint8_t         loadflags;
-        uint16_t        setup_move_size;
-        uint32_t        code32_start;
-        uint32_t        ramdisk_image;
-        uint32_t        ramdisk_size;
-        uint32_t        bootsect_kludge;
-        uint16_t        heap_end_ptr;
-        uint16_t        _pad1;
-        uint32_t        cmd_line_ptr;
-        uint32_t        initrd_addr_max;
-        uint32_t        kernel_alignment;
-        uint8_t         relocatable_kernel;
-        uint8_t         _pad2[3];
-        uint32_t        cmdline_size;
-        uint32_t        hardware_subarch;
-        uint64_t        hardware_subarch_data;
-        uint32_t        payload_offset;
-        uint32_t        payload_length;
-    };
-
-static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
+static __init int bzimage_check(struct bzimage_header *hdr, unsigned long len)
 {
-    if ( len < sizeof(struct setup_header) )
+    if ( len < sizeof(struct bzimage_header) )
         return 0;
 
     if ( memcmp(&hdr->header, HDR_MAGIC, HDR_MAGIC_SZ) != 0 )
@@ -73,7 +34,7 @@ static unsigned long __initdata orig_image_len;
 unsigned long __init bzimage_headroom(void *image_start,
                                       unsigned long image_length)
 {
-    struct setup_header *hdr = (struct setup_header *)image_start;
+    struct bzimage_header *hdr = image_start;
     int err;
     unsigned long headroom;
 
@@ -106,7 +67,7 @@ unsigned long __init bzimage_headroom(void *image_start,
 int __init bzimage_parse(void *image_base, void **image_start,
                          unsigned long *image_len)
 {
-    struct setup_header *hdr = (struct setup_header *)(*image_start);
+    struct bzimage_header *hdr = *image_start;
     int err = bzimage_check(hdr, *image_len);
     unsigned long output_len;
 
diff --git a/xen/arch/x86/include/asm/bzimage.h b/xen/arch/x86/include/asm/bzimage.h
index 7ed69d39103d..8c54b21d0685 100644
--- a/xen/arch/x86/include/asm/bzimage.h
+++ b/xen/arch/x86/include/asm/bzimage.h
@@ -8,4 +8,43 @@ unsigned long bzimage_headroom(void *image_start, unsigned long image_length);
 int bzimage_parse(void *image_base, void **image_start,
                   unsigned long *image_len);
 
+struct __packed bzimage_header {
+        uint8_t         _pad0[0x1f1];           /* skip uninteresting stuff */
+        uint8_t         setup_sects;
+        uint16_t        root_flags;
+        uint32_t        syssize;
+        uint16_t        ram_size;
+        uint16_t        vid_mode;
+        uint16_t        root_dev;
+        uint16_t        boot_flag;
+        uint16_t        jump;
+        uint32_t        header;
+#define HDR_MAGIC               "HdrS"
+#define HDR_MAGIC_SZ    4
+        uint16_t        version;
+#define VERSION(h,l)    (((h)<<8) | (l))
+        uint32_t        realmode_swtch;
+        uint16_t        start_sys;
+        uint16_t        kernel_version;
+        uint8_t         type_of_loader;
+        uint8_t         loadflags;
+        uint16_t        setup_move_size;
+        uint32_t        code32_start;
+        uint32_t        ramdisk_image;
+        uint32_t        ramdisk_size;
+        uint32_t        bootsect_kludge;
+        uint16_t        heap_end_ptr;
+        uint16_t        _pad1;
+        uint32_t        cmd_line_ptr;
+        uint32_t        initrd_addr_max;
+        uint32_t        kernel_alignment;
+        uint8_t         relocatable_kernel;
+        uint8_t         _pad2[3];
+        uint32_t        cmdline_size;
+        uint32_t        hardware_subarch;
+        uint64_t        hardware_subarch_data;
+        uint32_t        payload_offset;
+        uint32_t        payload_length;
+    };
+
 #endif /* __X86_BZIMAGE_H__ */
-- 
2.52.0


