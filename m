Return-Path: <SRS0=+ST8=CG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05E8C433E2
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2020 15:08:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C7F12075B
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2020 15:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C7F12075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBfz2-0004fm-OK; Fri, 28 Aug 2020 15:08:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pjxq=CG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBfz1-0004eG-4p
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:08:03 +0000
X-Inumbo-ID: 8c572d87-0582-4a3b-9d71-acce5cf17360
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c572d87-0582-4a3b-9d71-acce5cf17360;
 Fri, 28 Aug 2020 15:07:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 662C0AEB6;
 Fri, 28 Aug 2020 15:08:23 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v4 02/31] tools: drop explicit path specifications for qemu
 build
Date: Fri, 28 Aug 2020 17:07:18 +0200
Message-Id: <20200828150747.25305-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200828150747.25305-1-jgross@suse.com>
References: <20200828150747.25305-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Since more than three years now qemu is capable to set the needed
include and library paths for the Xen libraries via pkg-config.

So drop the specification of those paths in tools/Makefile. This will
enable to move libxenctrl away from tools/libxc, as qemu's configure
script has special treatment of this path.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/Makefile | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/tools/Makefile b/tools/Makefile
index 198b239edc..7c9f9fc900 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -245,32 +245,8 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
 		-DXC_WANT_COMPAT_GNTTAB_API=1 \
 		-DXC_WANT_COMPAT_MAP_FOREIGN_API=1 \
 		-DXC_WANT_COMPAT_DEVICEMODEL_API=1 \
-		-I$(XEN_ROOT)/tools/include \
-		-I$(XEN_ROOT)/tools/libs/toolcore/include \
-		-I$(XEN_ROOT)/tools/libs/toollog/include \
-		-I$(XEN_ROOT)/tools/libs/evtchn/include \
-		-I$(XEN_ROOT)/tools/libs/gnttab/include \
-		-I$(XEN_ROOT)/tools/libs/foreignmemory/include \
-		-I$(XEN_ROOT)/tools/libs/devicemodel/include \
-		-I$(XEN_ROOT)/tools/libxc/include \
-		-I$(XEN_ROOT)/tools/xenstore/include \
-		-I$(XEN_ROOT)/tools/xenstore/compat/include \
 		$(EXTRA_CFLAGS_QEMU_XEN)" \
-		--extra-ldflags="-L$(XEN_ROOT)/tools/libxc \
-		-L$(XEN_ROOT)/tools/xenstore \
-		-L$(XEN_ROOT)/tools/libs/toolcore \
-		-L$(XEN_ROOT)/tools/libs/evtchn \
-		-L$(XEN_ROOT)/tools/libs/gnttab \
-		-L$(XEN_ROOT)/tools/libs/foreignmemory \
-		-L$(XEN_ROOT)/tools/libs/devicemodel \
-		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/toolcore \
-		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/toollog \
-		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/evtchn \
-		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/gnttab \
-		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/call \
-		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/foreignmemory \
-		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/devicemodel \
-		$(QEMU_UPSTREAM_RPATH)" \
+		--extra-ldflags="$(QEMU_UPSTREAM_RPATH)" \
 		--bindir=$(LIBEXEC_BIN) \
 		--datadir=$(SHAREDIR)/qemu-xen \
 		--localstatedir=$(localstatedir) \
-- 
2.26.2


