Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D14CA1010
	for <xen-devel@archiver.kernel.org>; Wed,  3 Sep 2025 10:24:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1108061.1458218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utkep-0002Bx-SF; Wed, 03 Sep 2025 10:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108061.1458218; Wed, 03 Sep 2025 10:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utkep-0002Bo-Nl; Wed, 03 Sep 2025 10:24:03 +0000
Received: by outflank-mailman (input) for mailman id 1108061;
 Wed, 03 Sep 2025 10:24:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cO1L=3O=rein-hpcbdc09=jahan@srs-se1.protection.inumbo.net>)
 id 1utken-0001Ah-Uo
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 10:24:01 +0000
Received: from rein-hpcbdc09 (unknown [1.6.89.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a6421f5-88b0-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 12:23:59 +0200 (CEST)
Received: by rein-hpcbdc09 (Postfix, from userid 1000)
 id 5F18480C094C; Wed,  3 Sep 2025 15:53:58 +0530 (IST)
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
X-Inumbo-ID: 1a6421f5-88b0-11f0-9809-7dc792cee155
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: xen-devel@lists.xenproject.org
Cc: Jahan Murudi <jahan.murudi.zg@renesas.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 3/4] xentop: update Makefile to link against libxenctrl
Date: Wed,  3 Sep 2025 15:53:22 +0530
Message-Id: <20250903102323.2553142-4-jahan.murudi.zg@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903102323.2553142-1-jahan.murudi.zg@renesas.com>
References: <20250903102323.2553142-1-jahan.murudi.zg@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the build system so that xentop links against
libxenctrl, which is required for retrieving per-CPU
statistics via the hypervisor API.

Also update the build rule to include the new pcpu.o
object file.

Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>
---
 tools/xentop/Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/xentop/Makefile b/tools/xentop/Makefile
index 70cc2211c5..f514a6f7a8 100644
--- a/tools/xentop/Makefile
+++ b/tools/xentop/Makefile
@@ -15,6 +15,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 CFLAGS += -DGCC_PRINTF $(CFLAGS_libxenstat)
 LDLIBS += $(LDLIBS_libxenstat) $(CURSES_LIBS) $(TINFO_LIBS) $(SOCKET_LIBS) -lm
+LDLIBS += $(LDLIBS_libxenctrl)
 CFLAGS += -DHOST_$(XEN_OS)
 
 # Include configure output (config.h)
@@ -25,8 +26,8 @@ TARGETS := xentop
 .PHONY: all
 all: $(TARGETS)
 
-xentop: xentop.o
-	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS) $(APPEND_LDFLAGS)
+xentop: xentop.o pcpu.o
+	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS) $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
-- 
2.34.1


