Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4987FF886F
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2026 17:32:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1296595.1572946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHmHq-0001fg-4f; Tue, 28 Apr 2026 17:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296595.1572946; Tue, 28 Apr 2026 17:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHmHq-0001fZ-1F; Tue, 28 Apr 2026 17:31:54 +0000
Received: by outflank-mailman (input) for mailman id 1296595;
 Tue, 28 Apr 2026 17:31:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wHmHp-0001fT-JO
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 17:31:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHmHo-000wxr-Vd
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 19:31:52 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69f0eeff-5cb7-0a2a0a5109dd-0a2a45048e42-2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 19:31:52 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69f0ef07-1dec-0a2a45040019-a06583098348-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 19:31:52 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 817CC81C9E98;
 Tue, 28 Apr 2026 13:30:51 -0400 (EDT)
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
Subject: [PATCH] docs: Hypervisor-Guide: Move Hyperlaunch design docs as needed
Date: Tue, 28 Apr 2026 18:31:11 +0100
Message-Id: <3b943ee1ca93abdd70be30965146540975d91888.1777397318.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1777397512-2B7693FF-C1E6B427/0/0
X-purgate-type: clean
X-purgate-size: 3710

In the Sphinx documentation, the Hyperlaunch Design Documents were stated
as needing rearranging:

They were put into the section that needs rearranging, so rearrange
them as indicated inside the Hypervisor Guide which aims to describe
the hypervisor for developers and people interested in the hypervisor.

This also fixes the glitch where the "1 Hypervisor Design Document" was
listed in the main menu sidebar and helps to clean up the main menu.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 docs/designs/index.rst              | 15 +++++++++++++++
 docs/designs/launch/hyperlaunch.rst |  4 ++--
 docs/designs/launch/index.rst       | 10 ++++++++++
 docs/hypervisor-guide/index.rst     | 12 ++++++++++--
 docs/index.rst                      |  2 --
 5 files changed, 37 insertions(+), 6 deletions(-)
 create mode 100644 docs/designs/index.rst
 create mode 100644 docs/designs/launch/index.rst

diff --git a/docs/designs/index.rst b/docs/designs/index.rst
new file mode 100644
index 000000000000..ded12082c622
--- /dev/null
+++ b/docs/designs/index.rst
@@ -0,0 +1,15 @@
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


