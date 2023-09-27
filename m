Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4D6E810B1
	for <xen-devel@archiver.kernel.org>; Wed, 27 Sep 2023 09:53:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.608804.947543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlRE7-0008Ua-Kx; Wed, 27 Sep 2023 09:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608804.947543; Wed, 27 Sep 2023 09:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlRE7-0008Rq-DF; Wed, 27 Sep 2023 09:53:03 +0000
Received: by outflank-mailman (input) for mailman id 608804;
 Wed, 27 Sep 2023 09:53:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U53p=FL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qlRE6-0007w0-Fu
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 09:53:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a58a12d9-5d1b-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 11:53:01 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 1A4824EE0739;
 Wed, 27 Sep 2023 11:53:01 +0200 (CEST)
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
X-Inumbo-ID: a58a12d9-5d1b-11ee-878a-cb3800f73035
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v2 3/3] automation/eclair: build docs/misra to address MISRA C:2012 Dir 4.1
Date: Wed, 27 Sep 2023 11:52:32 +0200
Message-Id: <bc2d62ad97a821f9c8e17a1ff3c9ed55922dbbd4.1695801813.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695801813.git.nicola.vetrini@bugseng.com>
References: <cover.1695801813.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation pertaining Directive 4.1 is contained in docs/misra.
The build script driving the analysis is amended to allow ECLAIR to
analyze such file.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- removed useless make flags
---
 automation/eclair_analysis/build.sh   | 6 +++---
 automation/eclair_analysis/prepare.sh | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/automation/eclair_analysis/build.sh b/automation/eclair_analysis/build.sh
index ec087dd822fa..ea7a1e5a59b0 100755
--- a/automation/eclair_analysis/build.sh
+++ b/automation/eclair_analysis/build.sh
@@ -34,11 +34,11 @@ else
 fi
 
 (
-  cd xen
-
+  make -C docs misra
   make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
        "CROSS_COMPILE=${CROSS_COMPILE}"         \
        "CC=${CROSS_COMPILE}gcc-12"              \
        "CXX=${CROSS_COMPILE}g++-12"             \
-       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"
+       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"     \
+       -C xen
 )
diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_analysis/prepare.sh
index 0cac5eba00ae..ebd5a2dde676 100755
--- a/automation/eclair_analysis/prepare.sh
+++ b/automation/eclair_analysis/prepare.sh
@@ -35,8 +35,8 @@ else
 fi
 
 (
-    cd xen
-    cp "${CONFIG_FILE}" .config
+    ./configure
+    cp "${CONFIG_FILE}" xen/.config
     make clean
     find . -type f -name "*.safparse" -print -delete
     make -f ${script_dir}/Makefile.prepare prepare
-- 
2.34.1


