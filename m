Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E15DCD6E44
	for <xen-devel@archiver.kernel.org>; Thu, 28 May 2026 15:27:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1321496.1588248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wScdQ-0001rU-9h; Thu, 28 May 2026 15:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321496.1588248; Thu, 28 May 2026 15:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wScdQ-0001rN-5U; Thu, 28 May 2026 15:27:00 +0000
Received: by outflank-mailman (input) for mailman id 1321496;
 Thu, 28 May 2026 15:26:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wScdP-0001rH-9H
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 15:26:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wScdO-008aun-FI
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 17:26:58 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a185ea4-5cb7-0a2a0a5109dd-0a2a450cbd8e-40
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 17:26:58 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a185ec1-62f1-0a2a450c0019-a0658308c942-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 17:26:58 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id BA3EA4347264;
 Thu, 28 May 2026 11:25:52 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH] tests: Improve 'make test': Run all build-time runnable tests
Date: Thu, 28 May 2026 16:25:01 +0100
Message-Id: <72ab1053a6d04f007f70620dace33c1e675353d5.1779981804.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1779982018-E156FCF5-822019D0/0/0
X-purgate-type: clean
X-purgate-size: 9550

Xen has a top-level 'make tests' target. Currently, it only runs
python tests which can run at build time.

Extend this make target to run all build-time runnable tests.

Add a target to run tests using 'make -C tools/tests run' to build
and run all tests that require libxentrl in a privileged domain
like Dom0 to run.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 Makefile                            |  1 +
 tools/Rules.mk                      | 16 +++++++++++++++-
 tools/tests/Makefile                |  4 ++--
 tools/tests/cpu-policy/Makefile     |  6 +++---
 tools/tests/domid/Makefile          |  6 +++---
 tools/tests/mem-claim/Makefile      |  9 +--------
 tools/tests/paging-mempool/Makefile |  9 +++++++++
 tools/tests/pdx/Makefile            | 13 +++----------
 tools/tests/rangeset/Makefile       |  6 +++---
 tools/tests/resource/Makefile       |  8 +++++++-
 tools/tests/tsx/Makefile            | 10 ++++++++++
 tools/tests/vpci/Makefile           | 12 +++++++-----
 tools/tests/x86_emulator/Makefile   |  6 +++---
 tools/tests/xenstore/Makefile       | 10 ++++++++++
 14 files changed, 77 insertions(+), 39 deletions(-)

diff --git a/Makefile b/Makefile
index 67b71ac3d4ff..21ab20e73508 100644
--- a/Makefile
+++ b/Makefile
@@ -92,6 +92,7 @@ build-docs:
 .PHONY: test
 test:
 	$(MAKE) -C tools/python test
+	$(MAKE) -C tools/tests test
 
 run-tests-%: build-tools-public-headers tools/tests/%/
 	$(MAKE) -C tools/tests/$* run
diff --git a/tools/Rules.mk b/tools/Rules.mk
index d9b9c740e964..2888d928ae3d 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -189,7 +189,7 @@ INSTALL_PYTHON_PROG = \
 %.opic: %.S
 	$(CC) $(CPPFLAGS) -DPIC $(CFLAGS) -fPIC -c -o $@ $< $(APPEND_CFLAGS)
 
-subdirs-all subdirs-clean subdirs-install subdirs-distclean subdirs-uninstall: .phony
+subdirs-all subdirs-clean subdirs-install subdirs-distclean subdirs-run subdirs-test subdirs-uninstall: .phony
 	@set -e; for subdir in $(SUBDIRS) $(SUBDIRS-y); do \
 		$(MAKE) subdir-$(patsubst subdirs-%,%,$@)-$$subdir; \
 	done
@@ -200,6 +200,20 @@ subdir-all-% subdir-clean-% subdir-install-% subdir-uninstall-%: .phony
 subdir-distclean-%: .phony
 	$(MAKE) -C $* distclean
 
+subdir-run-%: .phony
+	$(MAKE) -C $* run
+
+subdir-test-%: .phony
+	$(MAKE) -C $* test
+
+ifeq ($(CC),$(HOSTCC))
+define RUN_TARGETS_IF_CC_IS_HOSTCC
+set -ex; for test in $? ; do LD_LIBRARY_PATH=$(DISTDIR)/install$(libdir) ./$$test ; done
+endef
+else
+RUN_TARGETS_IF_CC_IS_HOSTCC = $(warning $(HOSTCC)!=$(CC), will not run targets)
+endif
+
 no-configure-targets := distclean subdir-distclean% clean subdir-clean% %-dir-force-update
 ifeq (,$(filter $(no-configure-targets),$(MAKECMDGOALS)))
 $(XEN_ROOT)/config/Tools.mk:
diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index 2b7af7606992..c2c9ff68111b 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -18,5 +18,5 @@ SUBDIRS-$(CONFIG_X86) += x86_emulator
 endif
 SUBDIRS-$(CONFIG_X86) += native
 
-.PHONY: all clean install distclean uninstall
-all clean distclean install uninstall: %: subdirs-%
+.PHONY: all clean install distclean uninstall run test
+all clean distclean install uninstall run test: %: subdirs-%
diff --git a/tools/tests/cpu-policy/Makefile b/tools/tests/cpu-policy/Makefile
index d8e4d222f4e4..d3f7ed5c14ec 100644
--- a/tools/tests/cpu-policy/Makefile
+++ b/tools/tests/cpu-policy/Makefile
@@ -15,9 +15,9 @@ endif
 .PHONY: all
 all: $(TARGETS)
 
-.PHONY: run
-run: $(TARGETS)
-	./$<
+.PHONY: run test
+run test: $(TARGETS)
+	$(call RUN_TARGETS_IF_CC_IS_HOSTCC)
 
 .PHONY: clean
 clean:
diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
index 753129029ed9..2a675274380f 100644
--- a/tools/tests/domid/Makefile
+++ b/tools/tests/domid/Makefile
@@ -39,9 +39,9 @@ endef
 .PHONY: all
 all: $(TESTS)
 
-.PHONY: run
-run: $(TESTS)
-	set -e; $(foreach t,$(TESTS),./$(t);)
+.PHONY: run test
+run test: $(TESTS)
+	$(call RUN_TARGETS_IF_CC_IS_HOSTCC)
 
 .PHONY: clean
 clean:
diff --git a/tools/tests/mem-claim/Makefile b/tools/tests/mem-claim/Makefile
index 5c090639553b..961e6497fdc6 100644
--- a/tools/tests/mem-claim/Makefile
+++ b/tools/tests/mem-claim/Makefile
@@ -11,14 +11,7 @@ all: $(TARGETS)
 #  Can also be called with "make run-tests-mem-claim" from the toplevel.
 .PHONY: run
 run: $(TARGETS)
-ifeq ($(CC),$(HOSTCC))
-	set -e;             \
-	for test in $? ; do \
-		./$$test ;  \
-	done
-else
-	$(warning HOSTCC != CC, will not run test)
-endif
+	$(RUN_TARGETS_IF_CC_IS_HOSTCC)
 
 # The tests in this directory need to run in a privileged domain (Dom0)
 # with libxenctrl and a matching the hypervisor to test running it.
diff --git a/tools/tests/paging-mempool/Makefile b/tools/tests/paging-mempool/Makefile
index 7444d81b8460..772af6e503c0 100644
--- a/tools/tests/paging-mempool/Makefile
+++ b/tools/tests/paging-mempool/Makefile
@@ -6,6 +6,15 @@ TARGET := test-paging-mempool
 .PHONY: all
 all: $(TARGET)
 
+run: $(TARGET)
+	$(call RUN_TARGETS_IF_CC_IS_HOSTCC)
+
+# The tests in this directory need to run in a privileged domain (Dom0)
+# with libxenctrl and a matching the hypervisor to test running it.
+# Therefore, they don't run with the native test target for build-time tests.
+.PHONY: test
+test:
+
 .PHONY: clean
 clean:
 	$(RM) -- *.o $(TARGET) $(DEPS_RM)
diff --git a/tools/tests/pdx/Makefile b/tools/tests/pdx/Makefile
index 3c431d7c7822..2001a957c4bd 100644
--- a/tools/tests/pdx/Makefile
+++ b/tools/tests/pdx/Makefile
@@ -6,16 +6,9 @@ TARGETS := test-pdx-mask test-pdx-offset
 .PHONY: all
 all: $(TARGETS)
 
-.PHONY: run
-run: $(TARGETS)
-ifeq ($(CC),$(HOSTCC))
-	set -e;             \
-	for test in $? ; do \
-		./$$test ;  \
-	done
-else
-	$(warning HOSTCC != CC, will not run test)
-endif
+.PHONY: run test
+run test: $(TARGETS)
+	$(call RUN_TARGETS_IF_CC_IS_HOSTCC)
 
 .PHONY: clean
 clean:
diff --git a/tools/tests/rangeset/Makefile b/tools/tests/rangeset/Makefile
index e3bfce471cd3..588b87ceda86 100644
--- a/tools/tests/rangeset/Makefile
+++ b/tools/tests/rangeset/Makefile
@@ -6,9 +6,9 @@ TARGET := test-rangeset
 .PHONY: all
 all: $(TARGET)
 
-.PHONY: run
-run: $(TARGET)
-	./$<
+.PHONY: run test
+run test: $(TARGET)
+	$(call RUN_TARGETS_IF_CC_IS_HOSTCC)
 
 .PHONY: clean
 clean:
diff --git a/tools/tests/resource/Makefile b/tools/tests/resource/Makefile
index 09d678fffe3e..9101ff7b3db7 100644
--- a/tools/tests/resource/Makefile
+++ b/tools/tests/resource/Makefile
@@ -8,7 +8,13 @@ all: $(TARGET)
 
 .PHONY: run
 run: $(TARGET)
-	./$(TARGET)
+	$(call RUN_TARGETS_IF_CC_IS_HOSTCC)
+
+# The tests in this directory need to run in a privileged domain (Dom0)
+# with libxenctrl and a matching the hypervisor to test running it.
+# Therefore, they don't run with the native test target for build-time tests.
+.PHONY: test
+test:
 
 .PHONY: clean
 clean:
diff --git a/tools/tests/tsx/Makefile b/tools/tests/tsx/Makefile
index 0bb7e7010347..0225f30a60ba 100644
--- a/tools/tests/tsx/Makefile
+++ b/tools/tests/tsx/Makefile
@@ -6,6 +6,16 @@ TARGET := test-tsx
 .PHONY: all
 all: $(TARGET)
 
+.PHONY: run
+run: $(TARGET)
+	$(call RUN_TARGETS_IF_CC_IS_HOSTCC)
+
+# The tests in this directory need to run in a privileged domain (Dom0)
+# with libxenctrl and a matching the hypervisor to test running it.
+# Therefore, they don't run with the native test target for build-time tests.
+.PHONY: test
+test:
+
 .PHONY: clean
 clean:
 	$(RM) -- *.o $(TARGET) $(DEPS_RM)
diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
index 28b600933291..ceefdd97f43a 100644
--- a/tools/tests/vpci/Makefile
+++ b/tools/tests/vpci/Makefile
@@ -8,11 +8,13 @@ all: $(TARGET)
 
 .PHONY: run
 run: $(TARGET)
-ifeq ($(CC),$(HOSTCC))
-	./$(TARGET)
-else
-	$(warning HOSTCC != CC, will not run test)
-endif
+	$(call RUN_TARGETS_IF_CC_IS_HOSTCC)
+
+# The tests in this directory need to run in a privileged domain (Dom0)
+# with libxenctrl and a matching the hypervisor to test running it.
+# Therefore, they don't run with the native test target for build-time tests.
+.PHONY: test
+test:
 
 $(TARGET): vpci.c vpci.h list.h private.h main.c emul.h
 	$(CC) $(CFLAGS_xeninclude) -include emul.h -g -o $@ vpci.c main.c
diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
index 8210e83345e3..75359df9e5b5 100644
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -7,9 +7,9 @@ TARGET := test_x86_emulator
 .PHONY: all
 all:
 
-.PHONY: run
-run: $(TARGET)
-	./$(TARGET)
+.PHONY: run test
+run test: $(TARGET)
+	$(call RUN_TARGETS_IF_CC_IS_HOSTCC)
 
 # Add the core emulator to the build
 vpath x86_emulate/%.c $(XEN_ROOT)/xen/arch/x86
diff --git a/tools/tests/xenstore/Makefile b/tools/tests/xenstore/Makefile
index 2ee4a1327e75..3ff9b36297be 100644
--- a/tools/tests/xenstore/Makefile
+++ b/tools/tests/xenstore/Makefile
@@ -10,6 +10,16 @@ all: build
 .PHONY: build
 build: $(TARGETS)
 
+.PHONY: run
+run: $(TARGET)
+	$(call RUN_TARGETS_IF_CC_IS_HOSTCC)
+
+# The tests in this directory need to run in a privileged domain (Dom0)
+# with libxenctrl and a matching the hypervisor to test running it.
+# Therefore, they don't run with the native test target for build-time tests.
+.PHONY: test
+test:
+
 .PHONY: clean
 clean:
 	$(RM) -- *.o $(TARGETS) $(DEPS_RM)
-- 
2.39.5


