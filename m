Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A78606A319
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:26:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454745.1668256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIt0T-0002I1-4d; Mon, 19 Oct 2026 19:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454745.1668256; Mon, 19 Oct 2026 19:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIt0T-0002Hu-1M; Mon, 19 Oct 2026 19:26:49 +0000
Received: by outflank-mailman (input) for mailman id 1454745;
 Mon, 19 Oct 2026 19:26:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xIt0R-0002Hk-VV
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:26:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIt0R-002KND-8f
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 21:26:47 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad66ee8-2eae-0a2a0a5409dd-0a2a450cd37c-18
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:26:47 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad66ef5-f479-0a2a450c0019-4a68bc043034-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:26:47 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69JJQW8v053208
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 19 Oct 2026 15:26:38 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69JJQWuX053207;
 Mon, 19 Oct 2026 12:26:32 -0700 (PDT) (envelope-from ehem)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Message-ID: <376c64cd689c50bba174ef5b0f5cdbc192487077.1792436534.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1792436534.git.ehem+xen@m5p.com>
References: <cover.1792436534.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        "Roger Pau Monné" <roger@xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>
Date: Mon, 19 Oct 2026 12:02:14 -0700
Subject: [RFC PATCH 5/5] scripts/git-checkout.sh: store repositories with Xen, use
 worktrees
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-purgate-ID: tlsNG-d25034/1792438007-5290EA5B-57FAED2F/0/0
X-purgate-type: clean
X-purgate-size: 6587
X-Archived-By: <archiver.kernel.org>

Date: Fri, 16 Oct 2026 19:42:44 -0700

The problem with checking out repositories in subdirectories is they may
get removed by `git clean`.  Whereas storing them with the Xen
repository renders them immune to this.  Then git worktrees can be used
for checking out the specified trees.

Remote the addition of "-remote" to the checkout directory names.  This
is very confusing and a great source for bugs.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
WARNING: As of this writing this is known to break qemu-xen building.
I've been trying to figure this out, but so far I'm puzzled.
---
 Makefile                | 10 +++++++---
 scripts/git-checkout.sh | 42 +++++++++++++++++++++++------------------
 tools/Makefile          | 12 ++++--------
 tools/firmware/Makefile | 14 ++++++--------
 4 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/Makefile b/Makefile
index f063ce56819..495e2387db2 100644
--- a/Makefile
+++ b/Makefile
@@ -22,6 +22,7 @@ include Config.mk
 mini-os-dir:
 	if [ ! -d $(XEN_ROOT)/extras/mini-os ]; then \
 		GIT=$(GIT) $(XEN_ROOT)/scripts/git-checkout.sh \
+			mini-os \
 			$(MINIOS_UPSTREAM_URL) \
 			$(MINIOS_UPSTREAM_REVISION) \
 			$(XEN_ROOT)/extras/mini-os ; \
@@ -31,9 +32,12 @@ mini-os-dir:
 mini-os-dir-force-update: mini-os-dir
 	set -ex; \
 	if [ "$(MINIOS_UPSTREAM_REVISION)" ]; then \
-		cd extras/mini-os-remote; \
-		$(GIT) fetch origin; \
-		$(GIT) reset --hard $(MINIOS_UPSTREAM_REVISION); \
+		rm -rf extras/mini-os; \
+		GIT=$(GIT) $(XEN_ROOT)/scripts/git-checkout.sh \
+			mini-os \
+			$(MINIOS_UPSTREAM_URL) \
+			$(MINIOS_UPSTREAM_REVISION) \
+			$(XEN_ROOT)/extras/mini-os ; \
 	fi
 
 export XEN_TARGET_ARCH
diff --git a/scripts/git-checkout.sh b/scripts/git-checkout.sh
index 7dde6702b6c..49c5f4b10fd 100755
--- a/scripts/git-checkout.sh
+++ b/scripts/git-checkout.sh
@@ -3,28 +3,34 @@
 set -e
 
 if test $# -lt 3; then
-	echo "Usage: $0 <repo> <committish> <dir>"
+	echo "Usage: $0 <name> <repo> <committish> <dir>"
 	exit 1
 fi
 
 GIT="${GIT:-git}"
 
-REPO="$1"
-COMMITTISH="$2"
-DIR="$3"
-
-if test \! -d "$DIR-remote"; then
-	rm -rf "$DIR-remote" "$DIR-remote.tmp"
-	mkdir -p "$DIR-remote.tmp"; rmdir "$DIR-remote.tmp"
-	"$GIT" clone "$REPO" "$DIR-remote.tmp"
-	if test "$COMMITTISH" ; then
-		cd "$DIR-remote.tmp"
-		"$GIT" fetch origin "$COMMITTISH"
-		"$GIT" branch -D dummy >/dev/null 2>&1 ||:
-		"$GIT" checkout -b dummy FETCH_HEAD
-		cd -
+NAME="$1"
+REPO="$2"
+COMMITTISH="$3"
+DIR="$4"
+
+# Setup a remote for keeping track of the specified repository
+if ! "$GIT" remote | grep -q -e"BUILD/xen/$NAME"
+then	"$GIT" remote add "BUILD/xen/$NAME" "$REPO"
+elif [ "$("$GIT" remote get-url "BUILD/xen/$NAME")" \!= "$REPO" ]
+then	"$GIT" remote set-url "BUILD/xen/$NAME" "$REPO"
+	rm -rf "$DIR"
+fi
+
+if [ -e "$DIR" ]
+then	if [ -d "$DIR" ]
+	then	exit 0
+	else	rm -rf "$DIR"
 	fi
-	mv "$DIR-remote.tmp" "$DIR-remote"
 fi
-rm -f "$DIR"
-ln -sf $(basename "$DIR-remote") "$DIR"
+
+# Retrieve the specified commitish
+"$GIT" fetch -n "BUILD/xen/$NAME" "$COMMITTISH"
+
+# Checkout the commitish as a worktree
+"$GIT" worktree add -f --detach "$DIR" FETCH_HEAD
diff --git a/tools/Makefile b/tools/Makefile
index 46847fca998..5739064db98 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -111,9 +111,7 @@ endif
 #
 # Directories for external trees:
 #  ${target}-dir
-#    Used for local builds.  Usually a link to ${target}-dir-remote
-#  ${target}-dir-remote
-#    Where remote repositories are cloned
+#    Used for local builds.
 #  ${target}
 #    Where a copy of the source files are put when building a source 
 #    tarball for release
@@ -134,17 +132,15 @@ qemu-xen-dir-find:
 	if test -d $(QEMU_UPSTREAM_LOC) ; then \
 		mkdir -p qemu-xen-dir; \
 	else \
-		export GIT=$(GIT); \
-		$(XEN_ROOT)/scripts/git-checkout.sh $(QEMU_UPSTREAM_LOC) $(QEMU_UPSTREAM_REVISION) $(XEN_ROOT)/tools/qemu-xen-dir ; \
+		GIT=$(GIT) $(XEN_ROOT)/scripts/git-checkout.sh qemu-xen $(QEMU_UPSTREAM_LOC) $(QEMU_UPSTREAM_REVISION) $(XEN_ROOT)/tools/qemu-xen-dir ; \
 	fi
 
 .PHONY: qemu-xen-dir-force-update
 qemu-xen-dir-force-update: qemu-xen-dir-find
 	set -ex; \
 	if [ "$(QEMU_UPSTREAM_REVISION)" ]; then \
-		cd qemu-xen-dir-remote; \
-		$(GIT) fetch origin; \
-		$(GIT) reset --hard $(QEMU_UPSTREAM_REVISION); \
+		rm -rf qemu-xen-dir; \
+		GIT=$(GIT)  $(XEN_ROOT)/scripts/git-checkout.sh qemu-xen $(QEMU_UPSTREAM_LOC) $(QEMU_UPSTREAM_REVISION) $(XEN_ROOT)/tools/qemu-xen-dir ; \
 	fi
 
 ifeq ($(debug),y)
diff --git a/tools/firmware/Makefile b/tools/firmware/Makefile
index a14e7cadd05..0b4d1904e28 100644
--- a/tools/firmware/Makefile
+++ b/tools/firmware/Makefile
@@ -20,11 +20,11 @@ SEABIOSLD ?= $(LD)
 SEABIOS_EXTRAVERSION ?= "-Xen"
 
 ovmf-dir:
-	GIT=$(GIT) $(XEN_ROOT)/scripts/git-checkout.sh $(OVMF_UPSTREAM_URL) $(OVMF_UPSTREAM_REVISION) $(XEN_ROOT)/tools/firmware/ovmf-dir
+	GIT=$(GIT) $(XEN_ROOT)/scripts/git-checkout.sh ovmf $(OVMF_UPSTREAM_URL) $(OVMF_UPSTREAM_REVISION) $(XEN_ROOT)/tools/firmware/ovmf-dir
 	cp ovmf-makefile ovmf-dir/Makefile;
 
 seabios-dir:
-	GIT=$(GIT) $(XEN_ROOT)/scripts/git-checkout.sh $(SEABIOS_UPSTREAM_URL) $(SEABIOS_UPSTREAM_REVISION) $(XEN_ROOT)/tools/firmware/seabios-dir
+	GIT=$(GIT) $(XEN_ROOT)/scripts/git-checkout.sh seabios $(SEABIOS_UPSTREAM_URL) $(SEABIOS_UPSTREAM_REVISION) $(XEN_ROOT)/tools/firmware/seabios-dir
 	cp seabios-config seabios-dir/.config;
 	$(MAKE) -C seabios-dir olddefconfig CC=$(SEABIOSCC) LD=$(SEABIOSLD)
 	rm -f seabios-dir/.version
@@ -95,9 +95,8 @@ subdir-distclean-seabios-dir: .phony
 ovmf-dir-force-update: ovmf-dir
 	set -ex; \
 	if [ "$(OVMF_UPSTREAM_REVISION)" ]; then \
-		cd ovmf-dir-remote; \
-		$(GIT) fetch origin; \
-		$(GIT) reset --hard $(OVMF_UPSTREAM_REVISION); \
+		rm -rf ovmf-dir-remote; \
+		GIT=$(GIT) $(XEN_ROOT)/scripts/git-checkout.sh ovmf $(OVMF_UPSTREAM_URL) $(OVMF_UPSTREAM_REVISION) $(XEN_ROOT)/tools/firmware/ovmf-dir ; \
 	fi
 
 subdir-clean-ovmf-dir:
@@ -109,9 +108,8 @@ subdir-clean-ovmf-dir:
 seabios-dir-force-update: seabios-dir
 	set -ex; \
 	if [ "$(SEABIOS_UPSTREAM_REVISION)" ]; then \
-		cd seabios-dir-remote; \
-		$(GIT) fetch origin; \
-		$(GIT) reset --hard $(SEABIOS_UPSTREAM_REVISION); \
+		rm -rf seabios-dir; \
+		GIT=$(GIT) $(XEN_ROOT)/scripts/git-checkout.sh seabios $(SEABIOS_UPSTREAM_URL) $(SEABIOS_UPSTREAM_REVISION) $(XEN_ROOT)/tools/firmware/seabios-dir ; \
 	fi
 
 subdir-clean-seabios-dir:
-- 
2.47.3


