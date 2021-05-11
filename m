Return-Path: <SRS0=u2kx=KG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4B8C43460
	for <xen-devel@archiver.kernel.org>; Tue, 11 May 2021 18:20:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7E4F617ED
	for <xen-devel@archiver.kernel.org>; Tue, 11 May 2021 18:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7E4F617ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.125965.237144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWzC-00012t-4D; Tue, 11 May 2021 18:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125965.237144; Tue, 11 May 2021 18:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWzC-00012K-0V; Tue, 11 May 2021 18:20:02 +0000
Received: by outflank-mailman (input) for mailman id 125965;
 Tue, 11 May 2021 18:20:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFnS=KG=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lgWzB-0007fz-5W
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 18:20:01 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44ad55f2-40e0-4b29-b73e-727bf73df6b9;
 Tue, 11 May 2021 18:19:53 +0000 (UTC)
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
X-Inumbo-ID: 44ad55f2-40e0-4b29-b73e-727bf73df6b9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620757193;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wH4ZTnWLfQtQSCRp1fYnZ6Grjr9l6Pd0afiHDgqCHrM=;
  b=GI+dBNyrMhpKjrIqNEqrrLHSe3SoWGBQpwX7ANSAKpVGcn8VwTlcmEq+
   jsvTdMY5gXj3aOWIek1WTxt0oZ5DeczAyXC4e/AjZOqD8itfFk9RBqlV1
   C3ii+Nt3HCCLVJxS+LGjsJ5o0Q9OxJOhSXz9MiArhzj0WmfXUz4fvG5yR
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5dqYvYo9PE6bRcChvJHKFrOgutPz93AFiuEpLzhFm+/o8GJC64ivIpxv1XHEhD6rJzTgW92JBD
 YUgSM6VQ1YfKywzksLHNpmIoaJMQZRaRM95+yvQLvMWVN/oPwS7l+0HICLYKKOdw05jra/1oDC
 Y4R0miiMfKxRECU4tfIcMCu82t/6bUVbHmidc5XljLdtiBewFmG2gVH2uuLimICTTpcPrAgehU
 1FSk4Xl+JCPWgTeVjgsrGOblx4+ld7XKXWT7RxBZRoTZjScQbSdrBvFZPijKNqhdFZZHkZ+YoC
 prU=
X-SBRS: 5.1
X-MesageID: 43562377
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:cDkGHakVqebc6LuaNIr1rdhr2xrpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43562377"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 10/17] tools/ocaml/libs/mmap: allocate correct number of bytes
Date: Tue, 11 May 2021 19:05:23 +0100
Message-ID: <f235418a0632d7aa6e3fb9d611faf31325a8336e.1620755942.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620755942.git.edvin.torok@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

OCaml memory allocation functions use words as units,
unless explicitly documented otherwise.
Thus we were allocating more memory than necessary,
caml_alloc should've been called with the parameter '2',
but was called with a lot more.
To account for future changes in the struct keep using sizeof,
but round up and convert to number of words.

For OCaml 1 word = sizeof(value)

The Wsize_bsize macro converts bytes to words.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/mmap/xenmmap_stubs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/ocaml/libs/mmap/xenmmap_stubs.c b/tools/ocaml/libs/mmap/xenmmap_stubs.c
index b811990a89..4d09c5a6e6 100644
--- a/tools/ocaml/libs/mmap/xenmmap_stubs.c
+++ b/tools/ocaml/libs/mmap/xenmmap_stubs.c
@@ -28,6 +28,8 @@
 #include <caml/fail.h>
 #include <caml/callback.h>
 
+#define Wsize_bsize_round(n) (Wsize_bsize( (n) + sizeof(value) - 1 ))
+
 static int mmap_interface_init(struct mmap_interface *intf,
                                int fd, int pflag, int mflag,
                                int len, int offset)
@@ -57,7 +59,7 @@ CAMLprim value stub_mmap_init(value fd, value pflag, value mflag,
 	default: caml_invalid_argument("maptype");
 	}
 
-	result = caml_alloc(sizeof(struct mmap_interface), Abstract_tag);
+	result = caml_alloc(Wsize_bsize_round(sizeof(struct mmap_interface)), Abstract_tag);
 
 	if (mmap_interface_init(Intf_val(result), Int_val(fd),
 	                        c_pflag, c_mflag,
-- 
2.25.1


