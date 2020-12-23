Return-Path: <SRS0=Rlng=F3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE83C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 23 Dec 2020 16:35:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EAA12229C
	for <xen-devel@archiver.kernel.org>; Wed, 23 Dec 2020 16:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EAA12229C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.58496.102926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks76O-0000Vd-PO; Wed, 23 Dec 2020 16:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58496.102926; Wed, 23 Dec 2020 16:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks76O-0000VW-M7; Wed, 23 Dec 2020 16:35:04 +0000
Received: by outflank-mailman (input) for mailman id 58496;
 Wed, 23 Dec 2020 16:35:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ifz=F3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ks76N-0000VR-Ae
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 16:35:03 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8a901d4-b239-4ab3-821f-884361ec54fa;
 Wed, 23 Dec 2020 16:35:02 +0000 (UTC)
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
X-Inumbo-ID: b8a901d4-b239-4ab3-821f-884361ec54fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608741302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J12nue8zO9s1xfEu2GlpYvaW7r0FVfxhrRgoIRus5is=;
  b=bgpdTXCMu22X0z5pC7SfxjK8QGXdHEGp+de9mgmK5s3oC5Eo17hkqZYN
   B6XUc2coSGTcrDbE2SCsCrOnwQOXplKtzsNT+gyvRCHX09ep4aXDUIIzH
   kICIUV15djP+NvQgOdlBJDrRAHHN+2FqvYT0oqnvRg/bH7EBE2SdqB+Ga
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8BUBcM15IGcJTsBlq3qedEFKzHxVzA/I0oq5XV2y2cYzzzjUoH94d8wFpBECH75fjznpvFE9ez
 i707r9ToS/uy3f0vPpQ7eIfb27+vVWeXAujFWYH1fBbR5O/dWkNZsCFb9YWhZSMnlkX21lY6xb
 +y4FK9R+6CZ8Rknb+4erqcHbIW3ch0uHrByrJC++bQiKvsOfxQFeVQsysgAHlemBUTy/aEfdUp
 oQZ8E490HoiFDsI1wzkX6nD283Dl+E4riMQ0YW2gIb8Mh8iQqbUGuD5ic8aEAwVLefSH9f4zJJ
 Nvk=
X-SBRS: 5.2
X-MesageID: 33844236
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,441,1599537600"; 
   d="scan'208";a="33844236"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH 4/4] tools/misc: Test for fault injection
Date: Wed, 23 Dec 2020 16:34:42 +0000
Message-ID: <20201223163442.8840-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201223163442.8840-1-andrew.cooper3@citrix.com>
References: <20201223163442.8840-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>

RFC: This wants expanding to a few more "default" configurations, and then
some thought needs putting torwards automating it.
---
 tools/misc/.gitignore      |  1 +
 tools/misc/Makefile        |  5 +++++
 tools/misc/xen-fault-ttl.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 tools/misc/xen-fault-ttl.c

diff --git a/tools/misc/.gitignore b/tools/misc/.gitignore
index c5fe2cfccd..8d117c3b7d 100644
--- a/tools/misc/.gitignore
+++ b/tools/misc/.gitignore
@@ -1 +1,2 @@
+xen-fault-ttl
 xen-ucode
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 7d37f297a9..5c1ed9a284 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -9,6 +9,7 @@ CFLAGS += $(CFLAGS_libxenctrl)
 CFLAGS += $(CFLAGS_libxenguest)
 CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenstore)
+CFLAGS += -Wno-declaration-after-statement
 
 # Everything to be installed in regular bin/
 INSTALL_BIN-$(CONFIG_X86)      += xen-cpuid
@@ -25,6 +26,7 @@ INSTALL_SBIN-$(CONFIG_X86)     += xen-lowmemd
 INSTALL_SBIN-$(CONFIG_X86)     += xen-mfndump
 INSTALL_SBIN-$(CONFIG_X86)     += xen-ucode
 INSTALL_SBIN                   += xencov
+INSTALL_SBIN                   += xen-fault-ttl
 INSTALL_SBIN                   += xenhypfs
 INSTALL_SBIN                   += xenlockprof
 INSTALL_SBIN                   += xenperf
@@ -76,6 +78,9 @@ distclean: clean
 xen-cpuid: xen-cpuid.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(APPEND_LDFLAGS)
 
+xen-fault-ttl: xen-fault-ttl.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(APPEND_LDFLAGS)
+
 xen-hvmctx: xen-hvmctx.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
diff --git a/tools/misc/xen-fault-ttl.c b/tools/misc/xen-fault-ttl.c
new file mode 100644
index 0000000000..e7953443da
--- /dev/null
+++ b/tools/misc/xen-fault-ttl.c
@@ -0,0 +1,56 @@
+#include <stdio.h>
+#include <err.h>
+#include <string.h>
+#include <errno.h>
+
+#include <xenctrl.h>
+
+int main(int argc, char **argv)
+{
+    int rc;
+    xc_interface *xch = xc_interface_open(NULL, NULL, 0);
+
+    if ( !xch )
+        err(1, "xc_interface_open");
+
+    struct xen_domctl_createdomain create = {
+        .fault_ttl = 1,
+        .flags = (XEN_DOMCTL_CDF_hvm |
+                  XEN_DOMCTL_CDF_hap),
+        .max_vcpus = 1,
+        .max_evtchn_port = -1,
+        .max_grant_frames = 64,
+        .max_maptrack_frames = 1024,
+        .arch = {
+            .emulation_flags = XEN_X86_EMU_LAPIC,
+        },
+    };
+    uint32_t domid = 0;
+
+    for ( rc = 1; rc && errno == ENOMEM; create.fault_ttl++ )
+        rc = xc_domain_create(xch, &domid, &create);
+
+    if ( rc == 0 )
+    {
+        printf("Created d%u with fault_ttl of %u\n", domid, create.fault_ttl);
+
+        xc_domain_destroy(xch, domid);
+    }
+    else
+        printf("Domain creation failed: %d: %s\n",
+               -errno, strerror(errno));
+
+    xc_interface_close(xch);
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.11.0


