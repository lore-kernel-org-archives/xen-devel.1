Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE69EC1EBE
	for <xen-devel@archiver.kernel.org>; Thu,  5 Feb 2026 14:12:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1221984.1530093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo05t-0006BM-Jk; Thu, 05 Feb 2026 14:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221984.1530093; Thu, 05 Feb 2026 14:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo05t-0006BE-Gj; Thu, 05 Feb 2026 14:12:29 +0000
Received: by outflank-mailman (input) for mailman id 1221984;
 Thu, 05 Feb 2026 13:56:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxpX=AJ=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vnzqo-0002Lg-5i
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 13:56:54 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 838e417b-029a-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 14:56:48 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id 45BCC4290347;
 Thu,  5 Feb 2026 08:56:37 -0500 (EST)
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
X-Inumbo-ID: 838e417b-029a-11f1-9ccf-f158ae23cfc8
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] Xenctrl.domain_setmaxmem: fix 32-bit truncation bug
Date: Thu,  5 Feb 2026 13:56:45 +0000
Message-ID: <7f0c73c140b53cf0777437b46d0a0fda496b48b8.1770299489.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Observed when attempting to boot a >4TiB VM:

After a call to domain_setmaxmem with 6370254848 (KiB),
the domain's maxmem got set to 2075287552,
which is exactly 2^32 smaller.

xc_domain_setmaxmem takes an uint64_t as a parameter,
and the OCaml value is 64-bit already, so fix the C variable
to match the type and avoid the truncation.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index ac2a7537d6..c55f73b265 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -947,7 +947,7 @@ CAMLprim value stub_xc_domain_setmaxmem(value xch_val, value domid,
 	int retval;
 
 	uint32_t c_domid = Int_val(domid);
-	unsigned int c_max_memkb = Int64_val(max_memkb);
+	uint64_t c_max_memkb = Int64_val(max_memkb);
 	caml_enter_blocking_section();
 	retval = xc_domain_setmaxmem(xch, c_domid, c_max_memkb);
 	caml_leave_blocking_section();
-- 
2.47.3


