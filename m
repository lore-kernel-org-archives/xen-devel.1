Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FCF606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 19:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=L5PolJAL
Received: from list by lists.xenproject.org with outflank-mailman.1462540.1673501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLn55-0008LG-Ni; Tue, 27 Oct 2026 19:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462540.1673501; Tue, 27 Oct 2026 19:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLn55-0008L9-Kd; Tue, 27 Oct 2026 19:43:35 +0000
Received: by outflank-mailman (input) for mailman id 1462540;
 Tue, 27 Oct 2026 19:43:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xLn54-0008L3-Ch
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 19:43:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLn53-003evf-Pb
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 20:43:33 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ae0fed4-2eae-0a2a0a5409dd-0a2a4506e512-10
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 20:43:33 +0100
Received: from [40.93.201.59]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ae0fee3-195a-0a2a45060019-285dc93b4422-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 20:43:33 +0100
Received: from BN9PR03CA0376.namprd03.prod.outlook.com (2603:10b6:408:f7::21)
 by LY0PR12MB281605.namprd12.prod.outlook.com (2603:10b6:404:21d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:43:28 +0000
Received: from BL2PEPF000352CF.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::29) by BN9PR03CA0376.outlook.office365.com
 (2603:10b6:408:f7::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.17 via Frontend Transport; Tue,
 27 Oct 2026 19:43:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL2PEPF000352CF.mail.protection.outlook.com (10.167.249.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 19:43:27 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 14:43:27 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 14:43:27 -0500
Received: from xsjstefanos-lx01 (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53 via Frontend
 Transport; Tue, 27 Oct 2026 14:43:26 -0500
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpwWC40N/KQNEi7DByonJMlF+WDa3F0PoSdBoSzGPdCNvMB0CfapvSEpLvh1h/fq7PRhvvd5CaTmoDvF1d34e38L9hhzHJ8mZMlzTUguBjES4euOnyd9BupiBKERBwciwVoJsMjGfIDX/nl2AcdzKGicDZvmoZMR4oWY6B9ftslOGfDnyr3R0/nP4zDHWSWirKo+hJ1IZmy0X8vM4j8nTdREsjCmayWAqQUxK0Q5yrGlKnBhAmOVWv+CgLhzZi6dFjaJGlr8JuHhIFDuZ67Wc+fKq6DsNq5dgthnSQI1bigmTKqODUhKlXUDP6zQ+8rx0dyngT1FEo7qotwMwbmD1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJibnbfwoo+ksIv0m66Pm5Kz9nJ7BlLjd5ziZav4PpA=;
 b=mRKElIcdnLtfoGaDd+QehBMRwgD/mRQm9lRoUa98qb5ps3XOuEm4vVZh2+QrOBzKrUOJcbfHYlghtbHnfpOiU0xbnCoafrVQcm6mn5MBEJmeefoCX+Q1isRyE6Z+7DhmciCDdaArto/ZJo8x8wc8VIqbPyA0qOaZKPT6Ls3z1blXxpU5MvmWME1SklwBFiF6ll1uqrJ3Lh+lUQXnJIsxHphqgMeu15D33sTTuHY0wthd7WtdIDjgiqLOFLuQhNj7RzgERFSbFmzCEIjZRBvmaWZmCvPlfqnZl3BwonWQtGyN0ct5FC1VeXEi5hW+6WQUxrYW5g1eoWT+/iCwUs+h6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJibnbfwoo+ksIv0m66Pm5Kz9nJ7BlLjd5ziZav4PpA=;
 b=L5PolJALloCuXkHSsL/7ld05RlyKhcy0sFPZiRvmXKG4ZJeGHHXQdlJun8oCeBKxpa5gNiYl33cEJ2bj/+jK6CevcBhgR0Ns2RAiRrbYKXaC6OhJ0RUxm5DtA6Hf5lg6DYsYCkpSCav+01/yCCgiMMOiNbjs0wBQ9bRU5VmYdCI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Date: Tue, 27 Oct 2026 12:43:25 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>,
	<andrew.cooper3@citrix.com>, <roger@xenproject.org>, <jason.andryuk@amd.com>,
	<teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] x86/bzimage: Check that the payload lies within the
 image
In-Reply-To: <19979fff-0554-4ec8-969b-6fe50606b1b1@suse.com>
Message-ID: <6df73c0e-0d78-d7e4-3837-e4622271f02e@amd.com>
References: <20261020214825.3655848-1-stefano.stabellini@amd.com> <20261026221008.1143527-1-stefano.stabellini@amd.com> <19979fff-0554-4ec8-969b-6fe50606b1b1@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352CF:EE_|LY0PR12MB281605:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f82c602-ab69-4736-2dc3-08df34629289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|18002099003|261026121527099003|22082099003|3023799007|4143699003|56012099006|11063799006|10067099003|261021121427099003|261022115727099003|261021123027099003|261022105027099003|261022075727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	RjABOAc3tWf4Xn9qKC6Ke1MjAHadDcYGK+C0zA7Gqm40ZgouOSDiPBbvKFVxo2n5kE27H4MlI1vT6mqvlHNWJhd82nhPy5POVgQAvGqqIsi9gNCuOf2IUMvelMrAsECeWXTE0VZeUSvGRQhgNZkY83bexk9iLOBOlZ61Q6TfD8Ha7qz4fxX+3P+8X9ulH+Pwr+y6fzyTuxBXu7kFdo8+cOGn1MjgtLTm//zDa8m73JDHxyBvF3hxynaETs7f2FWztIVNA0GTXbMi335xH5TuPyMY7C9OgNfXoR6gUxkouN2MZ7nZpziXUHZbuDOcqSBqBcCXRGzcmh8WjSd7LxiR54GlkVv30xqSPZvJubRanasr8+xFYr3LVwe1r0ifZYx1YSQqgn/KQNG8QF5vWHjEdWJTOxNFcL0pP7ZqlFHFCom++AUMe5dstIrMv0HQVgUCzwBV7IZgn1ntuh1Cjg6GNvE3T761HBe31un1FhEby5sbgHtHivGmXb+Y0nXeIkDFk4Nz5mEDaNHGtnWhZR4Q6nCI+SbIxrLgJnoB0ZlMaQYWVHvG6neA9kgP//Yzc4za5WYf8nX0hCA2wldu9B2H3Se1J9F68eJoTMDSig1kXDXGr6Fe/xtCgJpxtVhg4HV0csI9vWJvcCrdHYpFcm0OP1A8vp3QItwX0b6xyzsTDvGVimZRQiE4Hcp5SXipezHevQhfzKTJZBU+UnApVm7HuQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(18002099003)(261026121527099003)(22082099003)(3023799007)(4143699003)(56012099006)(11063799006)(10067099003)(261021121427099003)(261022115727099003)(261021123027099003)(261022105027099003)(261022075727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EbfS6TaOsNgd7gbcFZ1Qt0mo1b+Bcj1aYV06dY73Us7XAFihIB0V2qOve/XssMD0xla42VoLp7yhqUl7qNGEhRY6/DmSwhYvbb3lOOBEtQ+FSvMhHpEhM0jpJaQfC6W1ckWIgtqO1x0F8gXeCiPUnHkuNoAmDFGHSFZV9LIFe9XnxaVkvYUJMiIYoeMb+7pMSaD7gy6kzScJO2PIjxGTrGee/bBvhYY3JoJJsPaMxiSTpFkvgIdBKHaI4ZUIYhdcGNIpww73UbUmbIrPdBT1iIAOOC99MTcv5jXnnSC0KrL7hp2RAyTmvsXPYvmf2G5EVJ9NvQjQRbKnWjquKOjJputFLN919zvFCvrS6Qsqke4ZFhhWd3Gx7QRRar8kEkHyXNc5ykZH9mLDdzKKTQUammsoAO3RoG4jRzhaaEJf3BxRjVp/hoNRRW7M4PpXRAMm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:43:27.9342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f82c602-ab69-4736-2dc3-08df34629289
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB281605
X-purgate-ID: tlsNG-16d1c6/1793130213-F6A7477B-C27D1372/0/0
X-purgate-type: clean
X-purgate-size: 4694
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026, Jan Beulich wrote:
> On 26.10.2026 23:10, Stefano Stabellini wrote:
> > bzimage_check() doesn't validate setup_sects, payload_offset or
> > payload_length against the image size.  A truncated or malformed bzImage
> > therefore makes bzimage_headroom() and bzimage_parse() read beyond the
> > end of the boot module, which shows up as a fatal page fault, a bogus
> > headroom, or a decompression failure, rather than as a bad image.
> > 
> > Reject such a header up front.  bzimage_parse() passes bzimage_check() a
> > length which includes the decompression headroom in front of the image,
> > so subtract it to check against the image alone.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > Changes in v2:
> > - drop the UL suffix: setup_sects is 8 bits wide, so the multiplication
> >   cannot overflow, and the offset is now computed the same way as where
> >   bzimage_headroom() and bzimage_parse() use it
> 
> Upon looking again, I think this may have been a mistake:
> 
> > @@ -65,6 +67,15 @@ static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
> >             hdr->version >> 8, hdr->version & 0xff);
> >          return -EINVAL;
> >      }
> > +
> > +    payload_start = (hdr->setup_sects + 1) * 512 + hdr->payload_offset;
> 
> The multiplication can't overflow, but the addition can. Question is what
> the behavior should be in that case: Adding back the UL suffix would allow
> payload_start to go beyond 4Gb, but that may not be what is intended. The
> alternative would be to check for overflow in the calculation (easiest by
> way of using __builtin_add_overflow(), yet then needing adjustment when
> backporting to 4.20).

What about this


From: Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v3] x86/bzimage: Check that the payload lies within the image

bzimage_check() doesn't validate setup_sects, payload_offset or
payload_length against the image size.  A truncated or malformed bzImage
therefore makes bzimage_headroom() and bzimage_parse() read beyond the
end of the boot module, which shows up as a fatal page fault, a bogus
headroom, or a decompression failure, rather than as a bad image.

Reject such a header up front, including one whose payload offset
overflows the 32-bit calculation bzimage_headroom() and bzimage_parse()
use.  bzimage_parse() passes bzimage_check() a length which includes the
decompression headroom in front of the image, so subtract it to check
against the image alone.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v3:
- reject a payload offset whose 32-bit calculation wraps; the addend is
  at most 256 * 512, so a wrapped sum is smaller than payload_offset
- drop "the" from the error message

Changes in v2:
- drop the UL suffix: setup_sects is 8 bits wide, so the multiplication
  cannot overflow, and the offset is now computed the same way as where
  bzimage_headroom() and bzimage_parse() use it
- reword the error message
- drop the dereferences from the comment
---
 xen/arch/x86/bzimage.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index 66f648f311..a0cba65000 100644
--- a/xen/arch/x86/bzimage.c
+++ b/xen/arch/x86/bzimage.c
@@ -54,6 +54,8 @@ struct __packed setup_header {
 
 static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
 {
+    unsigned int payload_start;
+
     if ( len < sizeof(struct setup_header) )
         return 0;
 
@@ -65,6 +67,16 @@ static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
            hdr->version >> 8, hdr->version & 0xff);
         return -EINVAL;
     }
+
+    payload_start = (hdr->setup_sects + 1) * 512 + hdr->payload_offset;
+    if ( payload_start < hdr->payload_offset ||
+         payload_start > len || hdr->payload_length > len - payload_start )
+    {
+        printk("bzImage payload %#x@%#x past image size (%#lx)\n",
+               hdr->payload_length, payload_start, len);
+        return -EINVAL;
+    }
+
     return 1;
 }
 
@@ -107,7 +119,8 @@ int __init bzimage_parse(void *image_base, void **image_start,
                          unsigned long *image_len)
 {
     struct setup_header *hdr = (struct setup_header *)(*image_start);
-    int err = bzimage_check(hdr, *image_len);
+    /* image_len also counts the headroom ahead of image_start. */
+    int err = bzimage_check(hdr, *image_len - (*image_start - image_base));
     unsigned long output_len;
 
     if ( err < 0 )
-- 
2.47.3


