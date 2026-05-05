Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05EAFF8855
	for <xen-devel@archiver.kernel.org>; Tue,  5 May 2026 18:06:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1300943.1575356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKK9o-0005fg-LO; Tue, 05 May 2026 18:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300943.1575356; Tue, 05 May 2026 18:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKK9o-0005fZ-IT; Tue, 05 May 2026 18:06:08 +0000
Received: by outflank-mailman (input) for mailman id 1300943;
 Tue, 05 May 2026 18:06:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wKK9n-0005fT-Dm
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 18:06:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKK9m-00Aeli-Qh
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 20:06:06 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fa318a-5cb7-0a2a0a5109dd-0a2a45098098-8
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 20:06:06 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fa318d-2497-0a2a45090019-a0658308bdd4-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 20:06:06 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 82D9942A9297;
 Tue,  5 May 2026 14:05:11 -0400 (EDT)
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
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/3] Sphinx docs: Rearrange the design docs into a new dedicated design index
Date: Tue,  5 May 2026 19:03:10 +0100
Message-Id: <e29452775ab4d42b387265c74c6064607c2eefa4.1778004073.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1778004073.git.bernhard.kaindl@citrix.com>
References: <cover.1778004073.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1778004366-42573A53-90EB120A/0/0
X-purgate-type: clean
X-purgate-size: 4434

The Hyperlaunch Design Documents were stated as needing rearranging.
Rearrange them inside the Hypervisor Guide and fix the bug where one
got the title "1 Hypervisor Design Document".

This also serves as first small step to clean up the main menu of the
Sphinx documentation.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
Preview of the improved menu structure for design documents:
https://xen.kaindl.dev/arrange-hyperlaunch-design/
---
 docs/{misc => designs}/cache-coloring.rst |  4 ++--
 docs/designs/index.rst                    | 16 ++++++++++++++++
 docs/designs/launch/hyperlaunch.rst       |  4 ++--
 docs/designs/launch/index.rst             | 10 ++++++++++
 docs/hypervisor-guide/index.rst           | 12 ++++++++++--
 docs/index.rst                            |  2 --
 6 files changed, 40 insertions(+), 8 deletions(-)
 rename docs/{misc => designs}/cache-coloring.rst (99%)
 create mode 100644 docs/designs/index.rst
 create mode 100644 docs/designs/launch/index.rst

diff --git a/docs/misc/cache-coloring.rst b/docs/designs/cache-coloring.rst
similarity index 99%
rename from docs/misc/cache-coloring.rst
rename to docs/designs/cache-coloring.rst
index e156062aa207..0c078e29463e 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/designs/cache-coloring.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: CC-BY-4.0
 
-Xen cache coloring user guide
-=============================
+Cache Coloring
+==============
 
 The cache coloring support in Xen allows to reserve Last Level Cache (LLC)
 partitions for Dom0, DomUs and Xen itself. Currently only ARM64 is supported.
diff --git a/docs/designs/index.rst b/docs/designs/index.rst
new file mode 100644
index 000000000000..54d45c2bc321
--- /dev/null
+++ b/docs/designs/index.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Design documents
+================
+
+Design documents and implementation details for the Xen hypervisor.
+
+These are intended for developers working on the Xen hypervisor,
+and for those interested in the internal workings of Xen.
+
+.. toctree::
+   :maxdepth: 2
+   :numbered: 4
+
+   launch/index
+   cache-coloring
diff --git a/docs/designs/launch/hyperlaunch.rst b/docs/designs/launch/hyperlaunch.rst
index 3bed36f97637..aa7c2798a380 100644
--- a/docs/designs/launch/hyperlaunch.rst
+++ b/docs/designs/launch/hyperlaunch.rst
@@ -2,8 +2,6 @@
 Hyperlaunch Design Document
 ###########################
 
-.. sectnum:: :depth: 4
-
 This post is a Request for Comment on the included v4 of a design document that
 describes Hyperlaunch: a new method of launching the Xen hypervisor, relating
 to dom0less and work from the Hyperlaunch project. We invite discussion of this
@@ -13,6 +11,8 @@ Xen Development mailing list.
 
 
 .. contents:: :depth: 3
+   :backlinks: entry
+   :local:
 
 
 Introduction
diff --git a/docs/designs/launch/index.rst b/docs/designs/launch/index.rst
new file mode 100644
index 000000000000..afd845296d30
--- /dev/null
+++ b/docs/designs/launch/index.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Hyperlaunch
+===========
+
+.. toctree::
+   :maxdepth: 2
+
+   hyperlaunch
+   hyperlaunch-devicetree
diff --git a/docs/hypervisor-guide/index.rst b/docs/hypervisor-guide/index.rst
index 520fe01554ab..9c8033305549 100644
--- a/docs/hypervisor-guide/index.rst
+++ b/docs/hypervisor-guide/index.rst
@@ -1,11 +1,19 @@
 .. SPDX-License-Identifier: CC-BY-4.0
 
-Hypervisor documentation
-========================
+Hypervisor Guide
+================
+
+The Hypervisor Guide provides an overview of the Xen hypervisor's
+architecture and design, covering its core components, features,
+and how it manages resources for :term:`guest` domains.
+
+It serves as a comprehensive reference for developers and users interested
+in understanding the inner workings of the Xen hypervisor.
 
 .. toctree::
    :maxdepth: 2
 
+   ../designs/index
    code-coverage
 
    x86/index
diff --git a/docs/index.rst b/docs/index.rst
index bd87d736b9c3..6b04a077cebd 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -62,8 +62,6 @@ Documents in need of some rearranging.
 .. toctree::
    :maxdepth: 2
 
-   designs/launch/hyperlaunch
-   designs/launch/hyperlaunch-devicetree
    misc/xen-makefiles/makefiles
    misra/index
    fusa/index
-- 
2.39.5


