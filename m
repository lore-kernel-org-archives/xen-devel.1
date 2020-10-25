Return-Path: <SRS0=opzi=EA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC42C388F7
	for <xen-devel@archiver.kernel.org>; Sun, 25 Oct 2020 10:11:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D41A420936
	for <xen-devel@archiver.kernel.org>; Sun, 25 Oct 2020 10:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="GnGdjSc9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D41A420936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.11801.31162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWczv-0004C8-LY; Sun, 25 Oct 2020 10:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11801.31162; Sun, 25 Oct 2020 10:11:35 +0000
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
	id 1kWczv-0004C1-IJ; Sun, 25 Oct 2020 10:11:35 +0000
Received: by outflank-mailman (input) for mailman id 11801;
 Sun, 25 Oct 2020 10:11:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hByA=EA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kWczu-0004Bw-5U
 for xen-devel@lists.xenproject.org; Sun, 25 Oct 2020 10:11:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29e5e7ec-1e6b-4c76-ad3c-9c99d5d5a695;
 Sun, 25 Oct 2020 10:11:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 116C6B919;
 Sun, 25 Oct 2020 10:11:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hByA=EA=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kWczu-0004Bw-5U
	for xen-devel@lists.xenproject.org; Sun, 25 Oct 2020 10:11:34 +0000
X-Inumbo-ID: 29e5e7ec-1e6b-4c76-ad3c-9c99d5d5a695
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 29e5e7ec-1e6b-4c76-ad3c-9c99d5d5a695;
	Sun, 25 Oct 2020 10:11:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603620692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=raNB0yYuAFJJIBaE4EtGmLT9bOORIVRZjUCtlK/P0+o=;
	b=GnGdjSc9xiqh7P1KQxF+XPTCoKY2UUQthboVD3tGA3Y3LfsN1ldW9P6hWtsiJsTkNderJW
	DXnVS665P4jX0xi21Z5XJyb1EU5uIgyWPDgz7nt/WrE8IPFIkeM5Mn2/Saf5JlbAqoFwpf
	sz02Cna1LaTL1m1KRYqEzpo2TdYU4NY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 116C6B919;
	Sun, 25 Oct 2020 10:11:32 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools/libs: let build depend on official headers
Date: Sun, 25 Oct 2020 11:11:29 +0100
Message-Id: <20201025101129.19685-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The build target of a library should depend on the official headers
of that library, too, as those might be required for building other
tools.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/libs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 959ff91a56..b0e785b380 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -57,7 +57,7 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 all: build
 
 .PHONY: build
-build: libs libxen$(LIBNAME).map
+build: libs libxen$(LIBNAME).map $(LIBHEADERS)
 
 .PHONY: libs
 libs: headers.chk $(LIB) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL)
-- 
2.26.2


