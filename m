Return-Path: <SRS0=fakL=LQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BB5C2B9F4
	for <xen-devel@archiver.kernel.org>; Tue, 22 Jun 2021 18:21:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6772611CE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Jun 2021 18:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6772611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.146026.268637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvl1v-0003xK-EN; Tue, 22 Jun 2021 18:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146026.268637; Tue, 22 Jun 2021 18:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvl1v-0003x5-AI; Tue, 22 Jun 2021 18:21:47 +0000
Received: by outflank-mailman (input) for mailman id 146026;
 Tue, 22 Jun 2021 18:21:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZL//=LQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lvl1u-0002zl-2D
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 18:21:46 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 502f1c37-ee41-478d-a30e-b37fa28ee278;
 Tue, 22 Jun 2021 18:21:36 +0000 (UTC)
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
X-Inumbo-ID: 502f1c37-ee41-478d-a30e-b37fa28ee278
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624386096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FuX/gdX/Z8iVIv8CdPdcrz1kl6FHA1swtRRbhrQEv1c=;
  b=U9B1y1p3TLadBIoPobG7VilBm0p3/YOsX0pDheUtntruFNOKuQKBoh4M
   AtYkdII3XozdQmiLzIf6AxTIOcHnt84wZZe4UKpTcOCtB3EfOH9/+jCtU
   o/7Jhzkahs00b6rirOJVIaBj+5R2pM3VydH8fuphTH3AdMX+WYIyi+Mnn
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: OGBFqrArpyeROX0zZptHVTRLumLtvycqbI69jAu+cwGqyeLCt4BxrCiuEv1N4fOU7FfvNMSkSW
 uHj3JGzH4+A+cfXakgdxfYjuFLrMKtI3svo6IopvkNnskwqK6wE2VyNrO4qlRoDY6f3gg5un1c
 BIwknrx/utyqJ12m6EKPWSfu+EI7SNu5EzOEtLe03rzMyellzY3TGc/dbducKIPWMZFiWEYyla
 EQak3yGLq3vFabJFNka7EV1SS9RKcnzTlqZoNlegZj5gvKaFgT1XE8QjbkfS819QFHd0b06P3P
 6Tg=
X-SBRS: 5.1
X-MesageID: 46703313
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3mOxfK4tkSdTt2hrAAPXwXWBI+orL9Y04lQ7vn2ZFiYlF/Bwxv
 re/sjziyWE6wr5AEtQ6uxpOMG7MAjhHO1OkPss1NaZLU3bUQ6TRvAH0WKM+UyeJ8STzJ8l6U
 4kSdkPNDSSNyk8sS+Z2njHLz9I+rDum83F6om+rwYLPGdXguNbnnZE422gYzdLrXx9dOYE/e
 2nl7d6TlSbCAwqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uFQ9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+c0zpAJb4RA4FqjgpF+t1H22xaze
 UkZC1QY/ib3kmhJV1dZyGdhDUIngxetUMKgmXo9EcL6faJMA7STfAx1L6xpSGpu3bI9esMpp
 6i0w+ixu1qJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3M8iFW5uYdY99RjBmcAa+S
 hVfY3hzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zI93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkfcIDSGRCdI1Jb4J6d
 n8uX9jxCUPknPVeIKzNcdwg1jwqU2GLH7QI+9lltFEhoE=
X-IronPort-AV: E=Sophos;i="5.83,292,1616472000"; 
   d="scan'208";a="46703313"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH 3/4] tests/cpu-policy: Rework Makefile
Date: Tue, 22 Jun 2021 19:21:23 +0100
Message-ID: <20210622182124.11571-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210622182124.11571-1-andrew.cooper3@citrix.com>
References: <20210622182124.11571-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In particular, fill in the install/uninstall rules so this test can be
packaged to be automated sensibly.

Rework TARGET-y to be TARGETS, drop redundant -f's for $(RM), drop the
unconditional -O3 and use the default instead, and drop CFLAGS from the link
line but honour APPEND_LDFLAGS.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>

v2:
 * Drop -f's
 * Use %.o rather than *.o for Make level wildcards
---
 tools/tests/cpu-policy/Makefile | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/tools/tests/cpu-policy/Makefile b/tools/tests/cpu-policy/Makefile
index 70ff154da6..161732ad16 100644
--- a/tools/tests/cpu-policy/Makefile
+++ b/tools/tests/cpu-policy/Makefile
@@ -1,21 +1,19 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-TARGET-y := test-cpu-policy
+TARGETS :=
 
 # For brevity, these tests make extensive use of designated initialisers in
 # anonymous unions, but GCCs older than 4.6 can't cope.  Ignore the test in
 # this case.
-ifneq ($(clang),y)
-TARGET-$(call cc-ver,$(CC),lt,0x040600) :=
-endif
-
-ifeq ($(TARGET-y),)
+ifneq ($(gcc)$(call cc-ver,$(CC),lt,0x040600),yy)
+TARGETS += test-cpu-policy
+else
 $(warning Test harness not built, use newer compiler than "$(CC)" (version $(shell $(CC) -dumpversion)))
 endif
 
 .PHONY: all
-all: $(TARGET-y)
+all: $(TARGETS)
 
 .PHONY: run
 run: $(TARGET-y)
@@ -23,23 +21,32 @@ run: $(TARGET-y)
 
 .PHONY: clean
 clean:
-	$(RM) -f -- *.o .*.d .*.d2 test-cpu-policy
+	$(RM) -- *.o $(TARGETS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
-	$(RM) -f -- *~
+	$(RM) -- *~
 
 .PHONY: install
 install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+	$(if $(TARGETS),$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC_BIN))
 
 .PHONY: uninstall
+uninstall:
+	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGETS))
 
-CFLAGS += -Werror $(CFLAGS_xeninclude) -D__XEN_TOOLS__ -O3
+CFLAGS += -Werror -D__XEN_TOOLS__
+CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(APPEND_CFLAGS)
 
-vpath %.c ../../../xen/lib/x86
+LDFLAGS += $(APPEND_LDFLAGS)
+
+vpath %.c $(XEN_ROOT)/xen/lib/x86
+
+%.o: Makefile
 
 test-cpu-policy: test-cpu-policy.o msr.o cpuid.o policy.o
-	$(CC) $(CFLAGS) $^ -o $@
+	$(CC) $^ -o $@ $(LDFLAGS)
 
 -include $(DEPS_INCLUDE)
-- 
2.11.0


