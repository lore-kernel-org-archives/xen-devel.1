Return-Path: <SRS0=l9VS=EX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6378DC5519F
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2020 18:24:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB96A2467A
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2020 18:24:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="K0t21k+9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB96A2467A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.29208.58508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf5ek-0000T1-KK; Tue, 17 Nov 2020 18:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29208.58508; Tue, 17 Nov 2020 18:24:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf5ek-0000Sq-GP; Tue, 17 Nov 2020 18:24:42 +0000
Received: by outflank-mailman (input) for mailman id 29208;
 Tue, 17 Nov 2020 18:24:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dD8=EX=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kf5ek-0000JQ-4X
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 18:24:42 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a928d525-978b-4330-9a74-8d722926b385;
 Tue, 17 Nov 2020 18:24:38 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+dD8=EX=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
	id 1kf5ek-0000JQ-4X
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 18:24:42 +0000
X-Inumbo-ID: a928d525-978b-4330-9a74-8d722926b385
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a928d525-978b-4330-9a74-8d722926b385;
	Tue, 17 Nov 2020 18:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605637479;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CtykqrKDJP663B6ErlZm6r+lHmD7f9GNtBRjUYk3JhQ=;
  b=K0t21k+9dWUlqzIhKlqURCvhhE58HeSX40fg5zgLYwUcPEmi+UvUn6np
   qNQCJqcwk+V2c7F/dzO6/b8lLf/oFfS28Zu9eyLu8ORocbDR3jTpmVUUG
   jVQlNQGK1zZvaZ5vHFbtQupS0dEpnBNt7pAkRUr/StQGbNgclogiPM7JC
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vV+tv1oYOZIXI216rBlo81pHarJwZSElKGw/uZUv3fXFBMiX8AizwokD/Xz7WCRqWf10mPeoxI
 HzqD1Qgh/Ar/D02fMWFpjmjl46nWBJTm28N7c2l6LvxwINePunbjJrDRiwzgbd3Uc5fRdGuwKb
 IQ6PXXXnS7S/5ya2m6p+7xmqr09AET9rn6h+CezA/zJfr0HP6OA1SFPhs6l7fCpWQD991hG59U
 C/uRZYLzwruOye3A0aTT6RcFIGUYKuJ+rQlqo6hI+2UU3XLMa9jnZnKVuIhLxpHCCO0/EuLINC
 rhA=
X-SBRS: None
X-MesageID: 31365339
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,486,1596513600"; 
   d="scan'208";a="31365339"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: [PATCH v1 3/4] Makefile: add build-tools-oxenstored
Date: Tue, 17 Nov 2020 18:24:11 +0000
Message-ID: <516274ccf7ce5958251fa36b1bd63b3216937b8b.1605636800.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <cover.1605636799.git.edvin.torok@citrix.com>
References: <cover.1605636799.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

As a convenience so that oxenstored patches can be compile-tested
using upstream's build-system before submitting upstream.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 Makefile             | 6 ++++++
 tools/ocaml/Makefile | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/Makefile b/Makefile
index 9ad2602f63..96d32cfd50 100644
--- a/Makefile
+++ b/Makefile
@@ -62,6 +62,12 @@ build-xen:
 build-tools: build-tools-public-headers
 	$(MAKE) -C tools build
 
+.PHONY: build-tools-oxenstored
+build-tools-oxenstored: build-tools-public-headers
+	$(MAKE) -s -C tools/ocaml clean
+	$(MAKE) -s -C tools/libs
+	$(MAKE) -C tools/ocaml build-tools-oxenstored
+
 .PHONY: build-stubdom
 build-stubdom: mini-os-dir build-tools-public-headers
 	$(MAKE) -C stubdom build
diff --git a/tools/ocaml/Makefile b/tools/ocaml/Makefile
index 66f2d6b131..a7c04b6546 100644
--- a/tools/ocaml/Makefile
+++ b/tools/ocaml/Makefile
@@ -26,3 +26,11 @@ clean: subdirs-clean
 
 .PHONY: distclean
 distclean: subdirs-distclean
+
+.PHONY: build-tools-oxenstored
+build-tools-oxenstored:
+	$(MAKE) -s -C libs/eventchn
+	$(MAKE) -s -C libs/mmap
+	$(MAKE) -s -C libs/xb
+	$(MAKE) -s -C libs/xc
+	$(MAKE) -C xenstored
-- 
2.18.4


