Return-Path: <SRS0=CtBx=E7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C473DC5519F
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 04:28:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C83520789
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 04:28:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbJ50Q9B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C83520789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.37141.69385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPL-00011H-DX; Wed, 25 Nov 2020 04:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37141.69385; Wed, 25 Nov 2020 04:27:55 +0000
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
	id 1khmPL-00010s-59; Wed, 25 Nov 2020 04:27:55 +0000
Received: by outflank-mailman (input) for mailman id 37141;
 Wed, 25 Nov 2020 04:27:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khmPJ-0000sM-W3
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:27:54 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27dba9ea-9baf-49e2-9528-4bfb9ac189fd;
 Wed, 25 Nov 2020 04:27:49 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6893320DD4;
 Wed, 25 Nov 2020 04:27:48 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khmPJ-0000sM-W3
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:27:54 +0000
X-Inumbo-ID: 27dba9ea-9baf-49e2-9528-4bfb9ac189fd
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 27dba9ea-9baf-49e2-9528-4bfb9ac189fd;
	Wed, 25 Nov 2020 04:27:49 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6893320DD4;
	Wed, 25 Nov 2020 04:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606278468;
	bh=bKnR+2zoa7sLbY03YwLsVroT6DJBBetQKM/lBzR8Y7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jbJ50Q9BcJMOAqVD8UM9dUWPmr8HUr8PANaxbNseQmsJp2lwbjhsHeUCfpZWwQlYs
	 NfzoMQDRKJqfBf+aIzUXJSCedsmbxjpZb6MN8UwZYF3p97nDjOv2qWK4X615iOA7LQ
	 x7ZBQXftuWnwcztJre2aO3ZTCJAwMrTEaogbp+gI=
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3 04/12] automation: add alpine linux 3.12 arm64 build container
Date: Tue, 24 Nov 2020 20:27:37 -0800
Message-Id: <20201125042745.31986-4-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

The build container will be used for a new Alpine Linux 3.12 arm64 build
test.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 .../build/alpine/3.12-arm64v8.dockerfile      | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 automation/build/alpine/3.12-arm64v8.dockerfile

diff --git a/automation/build/alpine/3.12-arm64v8.dockerfile b/automation/build/alpine/3.12-arm64v8.dockerfile
new file mode 100644
index 0000000000..d6cdf5b200
--- /dev/null
+++ b/automation/build/alpine/3.12-arm64v8.dockerfile
@@ -0,0 +1,52 @@
+FROM arm64v8/alpine:3.12
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+# build depends
+RUN \
+  # apk
+  apk update && \
+  \
+  # xen build deps
+  apk add argp-standalone && \
+  apk add autoconf && \
+  apk add automake && \
+  apk add bash && \
+  apk add curl && \
+  apk add curl-dev && \
+  apk add dev86 && \
+  apk add dtc-dev && \
+  apk add gcc  && \
+  apk add gettext && \
+  apk add git && \
+  apk add iasl && \
+  apk add libaio-dev && \
+  apk add libfdt && \
+  apk add linux-headers && \
+  apk add make && \
+  apk add musl-dev  && \
+  apk add ncurses-dev && \
+  apk add patch  && \
+  apk add python3-dev && \
+  apk add texinfo && \
+  apk add util-linux-dev && \
+  apk add xz-dev && \
+  apk add yajl-dev && \
+  apk add zlib-dev && \
+  \
+  # qemu build deps
+  apk add bison && \
+  apk add flex && \
+  apk add glib-dev && \
+  apk add libattr && \
+  apk add libcap-ng-dev && \
+  apk add pixman-dev && \
+  \
+  # cleanup
+  rm -rf /tmp/* && \
+  rm -f /var/cache/apk/*
-- 
2.17.1


