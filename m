Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037DC606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 16:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=cMwnB9qW
Received: from list by lists.xenproject.org with outflank-mailman.1461579.1672620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLNRE-0006VS-Kz; Mon, 26 Oct 2026 16:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461579.1672620; Mon, 26 Oct 2026 16:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLNRE-0006VL-IO; Mon, 26 Oct 2026 16:20:44 +0000
Received: by outflank-mailman (input) for mailman id 1461579;
 Mon, 26 Oct 2026 16:20:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xLNRD-0006TK-Mz
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:20:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLNRC-006J1i-PU
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 17:20:42 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6adf7dce-e002-0a2a0a5209dd-0a2a450290ba-18
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 17:20:42 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6adf7dda-6ca4-0a2a45020019-d155802fb9cf-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 17:20:42 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a208d93758so37454765e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 09:20:42 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a74d7f18a3sm25746745e9.1.2026.10.26.09.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 09:20:41 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1793031642; x=1793636442; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sXJzzQv6ATpOpBIhYviVedyogXog06fauC4uO8Ai1RA=;
        b=cMwnB9qWzBPxuJswGkG4kCuYooxIxWl7pBoW1Ru9LEf5i2Vtf6Q08Ty1uSQhplNDkO
         lhP6HH6VYeIP4KGTgP4u7JOnMbkZ9lCFZ4PwLJY0DWOvqyahiiGSjUPdn9FLKNZK6FFi
         MIonFoxLRbJZud4DTAxVIWM7Wt1iyJRstIsI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031642; x=1793636442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXJzzQv6ATpOpBIhYviVedyogXog06fauC4uO8Ai1RA=;
        b=nUyaDh7OBg0bJitc4tqQATQldg15UVlBZGlhOGYlaSDYiZ8qMv/FzT33tLwdssrqy7
         XXG/fCsO9qRfjTAYEnffmB25V1GqiFdjmTIBDsMPsLuIFT/17HLGaDmYP5C+tH6EnZck
         hr7p3MVKyNwJxc5IFetlSDIdSklZbIuzgjx02oLNMbQOpbL5sOlGDS/VGHKR4fiGZtFk
         EYej+wr79tm/iK6u6NAMT04I79hBWx4VfFM2bkav4ie1BDtNUj73O4b+8xg6CIaRJMJt
         U0EUMeSO8O17eJcb4AgcG4kJPR75qbx+BoNOPX5O1p/OWEgPzRFGzggdOGvBmt3mljqf
         gmBw==
X-Gm-Message-State: AFq9FYK9iFyF5T+915sgLufiUBoNnNonqh18cPH7Aepf21UpDL8jVdNF
	/jXjS8SkUalmMF8P9yi/uqJ6XoZD5LbROaoBLpF2p8u8GkoCW1n78BL/+EKxatUUsNAjWR6INTT
	M/n8YsrU=
X-Gm-Gg: AYBFou0YhIlrLy5f/hDb2IV/2rlJUEqJ+XxVqJ4w0w1u0NEzm8Nd10gTygE8NQkmX0w
	TC0B9G45fuWo4ygxb7AjgEFamn7OPKU7ZIEjKl3EeuMLd0uTs/nLP1qHhYhJhDE/ZIOMHnJHrd9
	XBmFp5oQy/QRRGwe+PWF4/l4S0kDN5MVO+8Q19K0YpXd835k9S+88k4EQPdM2m8tG0Qqxn2KdC9
	LhRUVLZRG9vHzNNfbp1pIJh/veLvwuHG7Hmkb7dXnDwXszAi3SPNysYWPf9Tn6WEuDgtZRRvmyr
	1jAUsLieuXi9bCzY3R22TqapQVuB8Udhtem9i9HFpDvJ4a2K/jVCiuhdjvW5OIjf/+f8IdpKFgA
	STCa/DA2a0pUZlUp4/vblVF7ws1dhZzcMQgEcgjkWUqAsqviImmUCSNURXFSZU0BuoWAEbXKt54
	pFCBHcgdDFFw1hq4c1g6LYUO2D3Y/d4Adhca7EWntrnJtZwk1eZr6z1Pw/v4GwjerTqWosx6A4o
	y2g9AWpECwKvHJr46QlOVgA4pk1B9fZXADNYo+QjpxsKgQCLE+XakzyNrMAMN38GKjvGZQ2233t
	H7n9ZmEvYHeQjBi5sRNCqsxRKLc8dacqT870wE1107MM5IFaB2M=
X-Received: by 2002:a05:600c:4f0f:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a35acba87fmr162105375e9.30.1793031641681;
        Mon, 26 Oct 2026 09:20:41 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH] tools/ocaml: Gitlab CI test for bindings
Date: Mon, 26 Oct 2026 16:20:39 +0000
Message-Id: <20261026162039.1188760-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1793031642-307C22AC-EACD06FC/0/0
X-purgate-type: clean
X-purgate-size: 4449
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

... as building and interpreting Ocaml objects in C is rather fragile.

For C producing objects for Ocaml to consume, one trick to check validity is
Gc.compact() which forces a major sweep, walking all objects.  If this doesn't
segfault, then we at least got the pointer <-> integer aspect right.

For now, start with a very simple version call.  (Re)introduce
tools/ocaml/tests and add test-ocaml-bindings which is installed into
$(DESTDIR)$(LIBEXEC)/tests to be picked up automatically with the other dom0
tests.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Andrii Sultanov <andriy.sultanov@vates.tech>
CC: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
CC: Julian Vetter <julian.vetter@vates.tech>

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2990559670/test_report
---
 tools/ocaml/Makefile                  |  1 +
 tools/ocaml/tests/Makefile            |  8 +++++++
 tools/ocaml/tests/bindings/.gitignore |  1 +
 tools/ocaml/tests/bindings/Makefile   | 34 +++++++++++++++++++++++++++
 tools/ocaml/tests/bindings/main.ml    | 19 +++++++++++++++
 5 files changed, 63 insertions(+)
 create mode 100644 tools/ocaml/tests/Makefile
 create mode 100644 tools/ocaml/tests/bindings/.gitignore
 create mode 100644 tools/ocaml/tests/bindings/Makefile
 create mode 100644 tools/ocaml/tests/bindings/main.ml

diff --git a/tools/ocaml/Makefile b/tools/ocaml/Makefile
index 7252eb23d798..e570e30a6e8d 100644
--- a/tools/ocaml/Makefile
+++ b/tools/ocaml/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 SUBDIRS := libs
 SUBDIRS += xenstored
+SUBDIRS += tests
 
 .NOTPARALLEL:
 # targets here must be run in order, otherwise we can try
diff --git a/tools/ocaml/tests/Makefile b/tools/ocaml/tests/Makefile
new file mode 100644
index 000000000000..e9f3557f1219
--- /dev/null
+++ b/tools/ocaml/tests/Makefile
@@ -0,0 +1,8 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+SUBDIRS-y :=
+SUBDIRS-y += bindings
+
+.PHONY: all clean install distclean uninstall
+all clean distclean install uninstall: %: subdirs-%
diff --git a/tools/ocaml/tests/bindings/.gitignore b/tools/ocaml/tests/bindings/.gitignore
new file mode 100644
index 000000000000..6e9a7f429b49
--- /dev/null
+++ b/tools/ocaml/tests/bindings/.gitignore
@@ -0,0 +1 @@
+test-ocaml-bindings
diff --git a/tools/ocaml/tests/bindings/Makefile b/tools/ocaml/tests/bindings/Makefile
new file mode 100644
index 000000000000..75f8babbafca
--- /dev/null
+++ b/tools/ocaml/tests/bindings/Makefile
@@ -0,0 +1,34 @@
+XEN_ROOT = $(CURDIR)/../../../..
+OCAML_TOPLEVEL = $(CURDIR)/../..
+include $(OCAML_TOPLEVEL)/common.make
+
+OBJS = main
+
+OCAMLINCLUDE += \
+	-I $(OCAML_TOPLEVEL)/libs/xb \
+	-I $(OCAML_TOPLEVEL)/libs/mmap \
+	-I $(OCAML_TOPLEVEL)/libs/xc \
+	-I $(OCAML_TOPLEVEL)/libs/eventchn
+
+LIBS = \
+	unix.cmxa \
+	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/mmap $(OCAML_TOPLEVEL)/libs/mmap/xenmmap.cmxa \
+	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/eventchn $(OCAML_TOPLEVEL)/libs/eventchn/xeneventchn.cmxa \
+	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/xc $(OCAML_TOPLEVEL)/libs/xc/xenctrl.cmxa \
+	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/xb $(OCAML_TOPLEVEL)/libs/xb/xenbus.cmxa \
+	-ccopt -L -ccopt $(XEN_ROOT)/tools/libs/ctrl
+
+PROGRAMS = test-ocaml-bindings
+OCAML_PROGRAM = test-ocaml-bindings
+
+test-ocaml-bindings_LIBS = $(LIBS)
+test-ocaml-bindings_MLSORTED = $(shell $(OCAMLDEP) -sort $(OBJS:=.ml))
+test-ocaml-bindings_OBJS = $(test-ocaml-bindings_MLSORTED:.ml=)
+
+all: test-ocaml-bindings
+
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+	$(INSTALL_PROG) test-ocaml-bindings $(DESTDIR)$(LIBEXEC)/tests
+
+include $(OCAML_TOPLEVEL)/Makefile.rules
diff --git a/tools/ocaml/tests/bindings/main.ml b/tools/ocaml/tests/bindings/main.ml
new file mode 100644
index 000000000000..785837e270ad
--- /dev/null
+++ b/tools/ocaml/tests/bindings/main.ml
@@ -0,0 +1,19 @@
+open Printf
+
+let xch = Xenctrl.interface_open ()
+
+let test_xenversion () =
+  let ver = Xenctrl.version xch in
+  printf "Xen version: %d.%d%s\n" ver.major ver.minor ver.extra
+
+
+let () =
+  printf "Test Ocaml Bindings\n%!";
+
+  test_xenversion ();
+
+  printf "Starting GC.compact()\n%!";
+  Gc.compact ();
+  printf "GC done\n";
+
+  ()

base-commit: 46678752be2d97f61317d793408a59927a429847
-- 
2.39.5


