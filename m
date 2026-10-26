Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957C4606A31D
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=FR0JVMVB
Received: from list by lists.xenproject.org with outflank-mailman.1460913.1671792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGq0-0005q2-6J; Mon, 26 Oct 2026 09:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460913.1671792; Mon, 26 Oct 2026 09:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGq0-0005ph-1B; Mon, 26 Oct 2026 09:17:52 +0000
Received: by outflank-mailman (input) for mailman id 1460913;
 Mon, 26 Oct 2026 09:17:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xLGpy-0005mO-No
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:17:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLGpy-00DLTX-43
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:17:50 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6adf1ab5-8faa-0a2a0a5109dd-0a2a450bda0a-32
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:17:50 +0100
Received: from [40.107.208.60]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6adf1abc-b7e8-0a2a450b0019-286bd03ca113-4
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:17:49 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DS1PR03MB7991.namprd03.prod.outlook.com (2603:10b6:8:21b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 09:17:46 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 09:17:45 +0000
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
 b=Ftd6RKBWpPbdcPEQji4cvv6NTbjMvdzMSXL20m+4/Yb5k3tjnOlvASIxdJHHoUYi4HyNQN3Uuu2AdqQi8w35ENxNoMlgSnuQxHu1RdleKNoJ03Y488+J+iCA7E3uibA1OO+obbs6nacD56XrXFQCAl/d2oFe17hVUcXeAZtJFhs53yWiYcBW7HRhHlbuh4cdofScqSuVdphTRZ4OTSuNVn2nBHBLmYSRB8kyKFRYiHF+HJNN3SB0UaZBcGZDCI4qIKHY3C0wgFRrd0Qg6xov1RVqrA50mYnPhJgxtYia2QFd5efRzMdP6FzLDOFSkD20pVTA4ILdqD9emKNN8bbspg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQKpg0FcY1WqH3GQcUzAyEh301CnfBHGqKg1GHGRaso=;
 b=l276Z00JOMyY/9Kslas8U0/UW+kby5kyc5F/8/2DHyznsSVuy5/oAlQddfJfOY61XYHiB5L28a/oPiSk28j13deAKOfhgQs5fezE0UtsCnEciuNcl5P+d+3leQw+lUfcsRDCWe0HPSy2K8EIgu65NJNK3sacgBCS703/Yq947T8ninCZskUgmVd5Oj6Gj0K4a4r+GiD0DF2HyD3rH1vHwx2OlbV9RH7KZ7BL6STk9m94LaU2VsMi9UiW2TqTw3jqKI77QpzOQeWM/O9syGCZ4hX++rz05U9YPiMO26UvXedsaZD9nogIycTjtgEW+OK+ug4oJKX54CWDDEGac3ih5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQKpg0FcY1WqH3GQcUzAyEh301CnfBHGqKg1GHGRaso=;
 b=FR0JVMVBcW1Mox6XORTqjwFXEoMYqs//9VZuFhl1HORkkA92sQBySlzqqiBzlO8ZwhMmSR+hwkU97VCHHHt5F9M3ErvYuwlZo/niS9Gtus6TPk8OBCr9PwUbkLIgiKfCwW8q6mdxLZcyjnyNhuXur9go28I3AkmKUjqKcL/J1N4=
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
Subject: [PATCH v3 1/7] x86/kexec: add digest checks
Date: Mon, 26 Oct 2026 09:20:11 +0000
Message-ID: <20261026092017.3880869-2-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261026092017.3880869-1-kevin.lampis@citrix.com>
References: <20261026092017.3880869-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0282.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::14) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|DS1PR03MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: b3265369-4c26-4382-14e9-08df3341fee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261009223027099003|261022115727099003|261022075727099003|261022105027099003|261021121427099003|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	rwUSjGn1RPLXyBX1QucTdJuurm18nPGWsZMDXXmbiOlSiNrlchiLKqov1byjUtCkih+M2MSaOygZcH38ruqSH0h9bEFr6o7Eozk0nP0j/3GkKwSm5m8FMgEH2IDGDSwuHQWl30VU0gos1+S78BE6zSYO9TYzxZuu076KcN4rP8kApwhZz0rCglYaL3QY9OldQUhJmRk8YNguVfppcVGR8tZ4hvD4/73Nv3/eitdMSt7uosJpeDKheQWHDOWUgwDD8cUya5H2Ahf+84zkLm4OhZOqPSKq6QD/8/yA8rvC06B/dsJfFhORsRcAPiHReFqHOMbYkoHlAqdStmIenSWLd3JStYAhO3LsssrYdt3/lBDv2nDFZqk6B8tJ3uFE5/wiVbut5TKXENViAPQccREYPvDbTSp81niexFv7PFEzp+lQf1EgTsYxOVOetJ4HTc+IckFZr5MdYejU1t7r9e2pP/brf6AqdXx5uJkoGrcaGrNTzUCQcVJBXartqs0XSWQeFK27u4BHS4e5ZJogtw/0Vl8WKnkJ2hGWrJymHQLFlW2xCNH8Tr+LoH/tujjUBwIVCDOiDppXxHLvqugxyD5bmElbgJqXN+LaMQz91q5/5+cbkVTdglS42/PvvjKGid5iTk9ve4Buj1cUdVNZseKIEaGpQUHTMppKuemiCphXaSU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261009223027099003)(261022115727099003)(261022075727099003)(261022105027099003)(261021121427099003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vf5PQnHcQpFn//LAq51jyZynHyIxgdpczVwiaoUhg63m5mdIX0DqULxTWxnE?=
 =?us-ascii?Q?TmsFTS8oChvRT6Cc47o7/Rn83E/VCXdK+0AMR57wFjY3CQog9mLFBFVtQP8M?=
 =?us-ascii?Q?UVfZDTRRTl9rJajHmHpUYUfFurdWzOFssySf2YQAD2q8/I1i3kpqs4t17IRn?=
 =?us-ascii?Q?DZleO4smgzUGDrVGocHq4/94H2IkyAeSBQ9PbNdnkcbOheK0P2DIdYTb6Aa2?=
 =?us-ascii?Q?l7bg+JXCtC+b6DiZgbIL5plUGuLlyg+cj5QOAuXyKEbXwN7dkRr8Aep96mji?=
 =?us-ascii?Q?sBsg62wYDkPdPn5OhVgq5qwi8tz6U2mJ1m2RUteCJhgOj+moB0Nk9ff4H1d4?=
 =?us-ascii?Q?fBoFvyPRrSckaoMsXo1wn8a+Hdekg0eI/cwWMCPzQEzlsaea+u9OmZD4alO1?=
 =?us-ascii?Q?5O6HEaw73ndLeI4VFTeLQ72KpVHBOocCDKoOKr15pdtK4+ZsebwBhdZsu4JA?=
 =?us-ascii?Q?9pq4Gg3FfSxSmKOg3X5C5pn4F1eN/ggp4Dwvh++9xbC3lEBi1lOYJx58uSLh?=
 =?us-ascii?Q?HL9MFMAGPrFdxhBMXAXu6+Wr04FUVL1cWLttGL3Hs6u+sTkCH7XP1qV2CKBB?=
 =?us-ascii?Q?ZMPQ/sLgC5ADYp01uOEXVt0hcLlJEsyTA8vaENdSzAZ1Iae9cTLrdh7Np4Jx?=
 =?us-ascii?Q?cx0rfAf3M+oWG9tEfWcAfFXJXN/KfwfZS/J2/UaSa5FNPaUPegd4VUv4T53J?=
 =?us-ascii?Q?GW2nA9C1WoO0LxiZL/oma+58YOTq64IQN+kR7GdL1Pi8pX31cdFSB75szaGh?=
 =?us-ascii?Q?gPdw1TsXwAi0vXR1fGBhubzkEeJjV6kC70QZej5Cj6llX4Ob63pKEvMYIiiJ?=
 =?us-ascii?Q?lEEZkepSgkfQai104wFUjnrvZ/eTYLKlyiUm81ruonKUi3xrWh68goZHPqs3?=
 =?us-ascii?Q?Y0KNPMvx0QitujjBtll8dbVHq91jtdGFiBRXqPbd+8sVGDFchDoYG+u/HrT0?=
 =?us-ascii?Q?M0ZTQw5e2PDVfGR1uFtnrqwVWltb3np1PIYxbYi1osI6t7udAZP56kiBWBqS?=
 =?us-ascii?Q?EZWFl374srBWeDB9Tbn1kHN2dg+13Ted8Co3G1WhTAnPCKA8bIi8JKFRr9vD?=
 =?us-ascii?Q?y4+oJ25pb9s4mHg62/m0xAMm4muzi68/W8a9cfujvFGxiXhrbpfLxRNMuM4L?=
 =?us-ascii?Q?Noe+jEoza9AMZZMIIhdL5XjLGak5xdoUvRkcFETST4k9i089Md13uVX4tnti?=
 =?us-ascii?Q?T6RtQ00BUMRQi7E4xy8LlPpT6bbOBHCaUco47XP8fKvpXW9gC0/59vEdrIE3?=
 =?us-ascii?Q?O2dpcfzAVkc7dzRKM0ZfOg7ku3a/0Z4rCe07whUsPz0fXeMjckxeDOpo8qYW?=
 =?us-ascii?Q?B9OdvwMpg4FfHGw0xSu8s7E7aMWfhpmbyIXRDuZUFtFjApjf046zdGKl8wOR?=
 =?us-ascii?Q?hYHwox2Fe/P/CG+9tZWXs8r3YqujPH9WaJIefe9Hqn43FFHYT5MozhQrSP3J?=
 =?us-ascii?Q?RKm413XFTY1k2Ye1/G9b4G67RIvTgPRcTdG8c86jxnCrwtEPclNmVWQeUBzs?=
 =?us-ascii?Q?fmPaBKpOQyoNfygqzFIiK3d+En8/uBeeHNwGmbXu8TZtVptOD6wlefyO1BlR?=
 =?us-ascii?Q?VMtHzVABu9KtTKrPRgQgh/QQGMJIm5SEBE0PgkMZO7qYO58SqXL9H77CGJiv?=
 =?us-ascii?Q?l98UJ6Fwi0HnW+9OqgrXdQHCJ//5G8wd5Js6AYH4G2yL3zhTtKCtHzV6Ro/Z?=
 =?us-ascii?Q?nvaA8xd4g5+bbopcfTd3UfoBylCwMD4EHq2Vz+QNyF+DM2FGoTaV1OHGqqUX?=
 =?us-ascii?Q?gim23lm9oA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3265369-4c26-4382-14e9-08df3341fee1
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 09:17:45.2637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cL0gafFRrQTkKJg/sZtrIqGPiRgJClLgkcpmfmQpsT7okSx0YpBQO+zkV6vWRHTwEaBNXWktyRDM+SUYgtea5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7991
X-purgate-ID: tlsNG-42698a/1793006270-2C59A9EA-077C22F3/0/0
X-purgate-type: clean
X-purgate-size: 5624
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ross Lagerwall <ross.lagerwall@citrix.com>

As part of the work to support UEFI Secure Boot we must ensure that the
kexec image data has changed between loading and executing the image.
However, this is also a good check to perform generally.

During kexec load, calculate a digest over all the kexec segments. This
digest is stored and verified again later prior to entering the image.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v3:
- Reword the commit message to make it clear that digest checks are only
  part of the kexec strategy.

Changes in v2:
- Reword the commit message
- Change the "kexec digest failed" error message
- Remove the `!= 0` from the call to kimage_verify_digest()
- Remove include sha2.h from kimage.h
- Remove error checking from kimage_calc_one_digest()
  because map_domain_page() doesn't fail
- Change kimage_calc_digest() to a void return too
- Remove references to KIMAGE_SHA256_REGIONS
  It was a purgatory thing which is not used anymore
- Fix style on `for ( s = 0; s < image->nr_segments; s++ ) {`
- Add newlines and indentation to digest check fail message
- Make kimage_verify_digest() a bool return value
---
 xen/common/kexec.c       |  8 +++++
 xen/common/kimage.c      | 73 ++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/kimage.h |  6 ++++
 3 files changed, 87 insertions(+)

diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 8ccaef1e0258..68f4c2cb2671 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -389,6 +389,12 @@ void kexec_crash(enum crash_reason reason)
     if ( !test_bit(KEXEC_IMAGE_CRASH_BASE + pos, &kexec_flags) )
         return;
 
+    if ( !kimage_verify_digest(kexec_image[KEXEC_IMAGE_CRASH_BASE + pos]) )
+    {
+        printk(XENLOG_ERR "kexec digest failed, aborting kexec crash transfer\n");
+        return;
+    }
+
     kexecing = true;
 
     if ( kexec_common_shutdown() != 0 )
@@ -940,6 +946,8 @@ static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
     if ( ret < 0 )
         goto error;
 
+    kimage_calc_digest(kimage, kimage->digest);
+
     ret = kexec_load_slot(kimage);
     if ( ret < 0 )
         goto error;
diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index a0e4e67df7ee..6e009529ae01 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -818,6 +818,79 @@ int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
     return result;
 }
 
+static void kimage_calc_one_digest(struct sha2_256_state *ctx,
+                                   xen_kexec_segment_t *segment)
+{
+    paddr_t dest;
+    unsigned long sbytes;
+
+    sbytes = segment->buf_size;
+    dest = segment->dest_maddr;
+
+    while ( sbytes )
+    {
+        unsigned long dest_mfn;
+        void *dest_va;
+        size_t schunk, dchunk;
+
+        dest_mfn = dest >> PAGE_SHIFT;
+
+        dchunk = PAGE_SIZE;
+        schunk = min(dchunk, sbytes);
+
+        dest_va = map_domain_page(_mfn(dest_mfn));
+        sha2_256_update(ctx, dest_va, schunk);
+        unmap_domain_page(dest_va);
+
+        sbytes -= schunk;
+        dest += dchunk;
+    }
+}
+
+void kimage_calc_digest(const struct kexec_image *image,
+                        uint8_t digest[SHA2_256_DIGEST_SIZE])
+{
+    struct sha2_256_state ctx;
+    unsigned int s;
+
+    if ( image->type == KEXEC_TYPE_DEFAULT )
+    {
+        /* TODO implement digest calculation for normal kexec */
+        return;
+    }
+
+    sha2_256_init(&ctx);
+
+    for ( s = 0; s < image->nr_segments; s++ )
+        kimage_calc_one_digest(&ctx, &image->segments[s]);
+
+    sha2_256_final(&ctx, digest);
+}
+
+bool kimage_verify_digest(const struct kexec_image *image)
+{
+    uint8_t digest[SHA2_256_DIGEST_SIZE];
+
+    if ( image->type == KEXEC_TYPE_DEFAULT )
+    {
+        /* TODO implement digest check for normal kexec */
+        return true;
+    }
+
+    kimage_calc_digest(image, digest);
+
+    if ( memcmp(digest, image->digest, sizeof(digest)) != 0 )
+    {
+        printk(XENLOG_WARNING "kexec digest mismatch:\n"
+               "  expected %" STR(SHA2_256_DIGEST_SIZE) "phN\n"
+               "       got %" STR(SHA2_256_DIGEST_SIZE) "phN\n",
+               image->digest, digest);
+        return false;
+    }
+
+    return true;
+}
+
 int kimage_load_segments(struct kexec_image *image)
 {
     int s;
diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
index fccba1d88d5c..8ed89d4fa306 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -11,6 +11,7 @@
 
 #include <xen/list.h>
 #include <xen/mm.h>
+#include <xen/sha2.h>
 #include <public/kexec.h>
 
 #define KEXEC_SEGMENT_MAX 16
@@ -37,6 +38,8 @@ struct kexec_image {
 
     /* Address of next control page to allocate for crash kernels. */
     paddr_t next_crash_page;
+
+    uint8_t digest[SHA2_256_DIGEST_SIZE];
 };
 
 int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
@@ -52,6 +55,9 @@ mfn_t kimage_entry_mfn(kimage_entry_t *entry, bool compat);
 unsigned long kimage_entry_ind(kimage_entry_t *entry, bool compat);
 int kimage_build_ind(struct kexec_image *image, mfn_t ind_mfn,
                      bool compat);
+bool kimage_verify_digest(const struct kexec_image *image);
+void kimage_calc_digest(const struct kexec_image *image,
+                        uint8_t digest[SHA2_256_DIGEST_SIZE]);
 
 #endif /* __ASSEMBLER__ */
 
-- 
2.52.0


