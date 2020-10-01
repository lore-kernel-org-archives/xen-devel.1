Return-Path: <SRS0=Mf7K=FL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCD2C4361B
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 19:06:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0459F238E2
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 19:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0459F238E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.46923.83142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmLq9-0002eh-Gk; Mon, 07 Dec 2020 19:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46923.83142; Mon, 07 Dec 2020 19:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmLq9-0002ea-DJ; Mon, 07 Dec 2020 19:06:29 +0000
Received: by outflank-mailman (input) for mailman id 46923;
 Mon, 07 Dec 2020 18:31:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KVsS=FL=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kmLI1-0007r5-As
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 18:31:13 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37e468e2-ea19-4f08-b2b6-22dcff629aba;
 Mon, 07 Dec 2020 18:31:11 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0B7IV1BS033689
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 7 Dec 2020 13:31:07 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0B7IV133033688;
 Mon, 7 Dec 2020 10:31:01 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 37e468e2-ea19-4f08-b2b6-22dcff629aba
Message-Id: <202012071831.0B7IV133033688@m5p.com>
From: Elliott Mitchell <ehem+xenn@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: "Marek Marczykowski-Górecki" <marmarek@invisiblethingslab.com>
Date: Thu, 1 Oct 2020 15:19:33 -0700
Subject: [RFC PATCH] tools/python: Correct extension filenames for Python 3

Python distutils really looks like between 2 and 3, it took two steps
forward and then two steps backward.

First, it broke the linking step off of the compile step.  Thus CC and
LDSHARED were separated, thus CFLAGS and LDFLAGS were separated.  A
substantial step forwards.  Yet then CFLAGS was appended to LDFLAGS,
meaning LDSHARED needed to be able to accept CFLAGS as arguments.  Thus
effectively reuniting them.

Second, now distutils includes the host type in the object file area and
the full host triplet in the shared object name.  As such now a
filesystem can be shared by hosts with distinct architectures.  Great for
mixed environments.  Yet the build machine architecture/triplet is
assumed to be the runtime architecture, thus we end up with a workaround
something like the below.

The current state of this seems like a pretty awful hack.  I'm making
assumptions about the architecture which I won't bet on holding.  This
was really a quick hack for Pry Mar to assist with the current situation.

A proper solution is needed.  This feels like a proof-of-concept, but
needs refinement before ending up in any tree.

---
 tools/pygrub/setup.py | 16 +++++++++++++++-
 tools/python/setup.py | 16 +++++++++++++++-
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/tools/pygrub/setup.py b/tools/pygrub/setup.py
index b8f1dc4590..737f97d679 100644
--- a/tools/pygrub/setup.py
+++ b/tools/pygrub/setup.py
@@ -7,6 +7,19 @@ extra_compile_args  = [ "-fno-strict-aliasing", "-Werror" ]
 
 XEN_ROOT = "../.."
 
+from distutils import command
+import distutils.command.build_ext
+class BuildExtArch(distutils.command.build_ext.build_ext):
+	arch_map = {
+		'x86_64':	'amd64',
+		'x86_32':	'i386',
+		'arm64':	'aarch64',
+		'arm32':	'armel',
+	}
+	def get_ext_filename(self, ext_name):
+		name = super().get_ext_filename(ext_name)
+		return name.replace(os.getenv("XEN_COMPILE_ARCH"), self.arch_map[os.getenv("XEN_TARGET_ARCH")])
+
 xenfsimage = Extension("xenfsimage",
     extra_compile_args = extra_compile_args,
     include_dirs = [ XEN_ROOT + "/tools/libfsimage/common/" ],
@@ -25,5 +38,6 @@ setup(name='pygrub',
       package_dir={'grub': 'src', 'fsimage': 'src'},
       scripts = ["src/pygrub"],
       packages=pkgs,
-      ext_modules = [ xenfsimage ]
+      ext_modules = [ xenfsimage ],
+      cmdclass = {'build_ext': BuildExtArch},
       )
diff --git a/tools/python/setup.py b/tools/python/setup.py
index 8c95db7769..4d761f9360 100644
--- a/tools/python/setup.py
+++ b/tools/python/setup.py
@@ -17,6 +17,19 @@ PATH_LIBXENCTRL = XEN_ROOT + "/tools/libs/ctrl"
 PATH_LIBXENGUEST = XEN_ROOT + "/tools/libs/guest"
 PATH_XENSTORE = XEN_ROOT + "/tools/libs/store"
 
+from distutils import command
+import distutils.command.build_ext
+class BuildExtArch(distutils.command.build_ext.build_ext):
+	arch_map = {
+		'x86_64':	'amd64',
+		'x86_32':	'i386',
+		'arm64':	'aarch64',
+		'arm32':	'armel',
+	}
+	def get_ext_filename(self, ext_name):
+		name = super().get_ext_filename(ext_name)
+		return name.replace(os.getenv("XEN_COMPILE_ARCH"), self.arch_map[os.getenv("XEN_TARGET_ARCH")])
+
 xc = Extension("xc",
                extra_compile_args = extra_compile_args,
                include_dirs       = [ PATH_XEN,
@@ -51,5 +64,6 @@ setup(name            = 'xen',
                          'xen.lowlevel',
                         ],
       ext_package = "xen.lowlevel",
-      ext_modules = modules
+      ext_modules = modules,
+      cmdclass = {'build_ext': BuildExtArch},
       )
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




