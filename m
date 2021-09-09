Return-Path: <SRS0=yIgx=N7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2ED3C433FE
	for <xen-devel@archiver.kernel.org>; Thu,  9 Sep 2021 16:35:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F30861051
	for <xen-devel@archiver.kernel.org>; Thu,  9 Sep 2021 16:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F30861051
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.183372.331505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mON0v-00013I-Uf; Thu, 09 Sep 2021 16:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183372.331505; Thu, 09 Sep 2021 16:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mON0v-00012U-QK; Thu, 09 Sep 2021 16:35:01 +0000
Received: by outflank-mailman (input) for mailman id 183372;
 Thu, 09 Sep 2021 16:35:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5xa6=N7=citrix.com=Kevin.Stefanov@srs-us1.protection.inumbo.net>)
 id 1mON0u-0000zO-WF
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:35:01 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba95b034-5d64-4cc1-a1cd-3fed2c23f413;
 Thu, 09 Sep 2021 16:35:00 +0000 (UTC)
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
X-Inumbo-ID: ba95b034-5d64-4cc1-a1cd-3fed2c23f413
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631205299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XyAZ9tVbkw9oc4UHQy0JFhFEp2DcwLj5o9RUfsQCO+g=;
  b=VFk6BqzxThNnwtO4gmsA9vgW024qNm7ph8AeUvGJfz2IVPQYxkvG9UyP
   fdi3LEayfC4k6SPgBJmKOVSCcBlECmJp1hh9hpMUphZc6ZV5xt9DBpzdb
   pNAHHnG4+tUkGFAHMupxqVvhbvPY5oU9rroDxTJ4qG/KLpyhLAvERtGJE
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: iE/xgJg82yj680ioyAa0b2lSBDNg2lrMOdcpF/khdp9jdLLxQOmQeCOzQtO7f1GJaOgtEH5PBi
 R5oof9iLR+Lxsi1f1hR1tlcwVfcNDowsKLHn7LjqJfyXeYbo8rqHhqukWRLUTLBe29vi1QfL88
 dbs0kweLe5SxIIrUDlgdsRDLixFc9gQBjUmPyKLWsWTIjHVZaE9/WseJoI0vfUDiEBUtKfMbC4
 Pd9lYF+CuxJqqZEnEqitm2CNOc5xUbeo1YVPH761ZYxZ/tdcp3tIcghAWw5XlAPuf/5701V8Ct
 ROtsKKj1iZuocqYWslQbcSHo
X-SBRS: 5.1
X-MesageID: 52390010
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:kN+zQaDblaqxrPvlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.85,280,1624334400"; 
   d="scan'208";a="52390010"
From: Kevin Stefanov <kevin.stefanov@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Kevin Stefanov <kevin.stefanov@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/3] tools/libacpi: Use 64-byte alignment for FACS
Date: Thu, 9 Sep 2021 17:34:39 +0100
Message-ID: <20210909163441.44418-2-kevin.stefanov@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210909163441.44418-1-kevin.stefanov@citrix.com>
References: <20210909163441.44418-1-kevin.stefanov@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The spec requires 64-byte alignment, not 16.

Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>

Note: This does not fix the FACS alignment inside guests yet. See next
patch.
---
 tools/libacpi/build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index a61dd5583a..fe2db66a62 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -532,7 +532,7 @@ int acpi_build_tables(struct acpi_ctxt *ctxt, struct acpi_config *config)
      * Fill in high-memory data structures, starting at @buf.
      */
 
-    facs = ctxt->mem_ops.alloc(ctxt, sizeof(struct acpi_20_facs), 16);
+    facs = ctxt->mem_ops.alloc(ctxt, sizeof(struct acpi_20_facs), 64);
     if (!facs) goto oom;
     memcpy(facs, &Facs, sizeof(struct acpi_20_facs));
 
-- 
2.25.1


