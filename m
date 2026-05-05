Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D75CD3427
	for <xen-devel@archiver.kernel.org>; Tue,  5 May 2026 18:06:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1300955.1575365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKKAS-00069O-SI; Tue, 05 May 2026 18:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300955.1575365; Tue, 05 May 2026 18:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKKAS-00069H-PL; Tue, 05 May 2026 18:06:48 +0000
Received: by outflank-mailman (input) for mailman id 1300955;
 Tue, 05 May 2026 18:06:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wKKAQ-00068o-To
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 18:06:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKKAQ-00HQem-Ah
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 20:06:46 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fa31ad-5cb7-0a2a0a5109dd-0a2a4503b9ba-20
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 20:06:46 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fa31b5-672d-0a2a45030019-a06583098e58-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 20:06:46 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 27A5081E0C2D;
 Tue,  5 May 2026 14:05:41 -0400 (EDT)
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
Subject: [PATCH 2/3] Sphinx docs: Enable autosectionlabels and Mermaid support
Date: Tue,  5 May 2026 19:03:11 +0100
Message-Id: <1d0e98b9002dcb12765a51ae43a55d00e7cc1691.1778004073.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1778004073.git.bernhard.kaindl@citrix.com>
References: <cover.1778004073.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1778004406-A2378938-B9FDAE60/0/0
X-purgate-type: clean
X-purgate-size: 2055

Enable sphinx.ext.autosectionlabel which allows referencing sections
using their title, without needing to add explicit labels to each section
and enable support for Mermaid diagrams for design documents.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 .readthedocs.yaml |  2 +-
 docs/conf.py      | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/.readthedocs.yaml b/.readthedocs.yaml
index d3aff7662ebf..c61d5eb74107 100644
--- a/.readthedocs.yaml
+++ b/.readthedocs.yaml
@@ -12,7 +12,7 @@ build:
   jobs:
     post_install:
       # Instead of needing a separate requirements.txt
-      - python -m pip install --upgrade --no-cache-dir sphinx-rtd-theme
+      - python -m pip install --upgrade --no-cache-dir sphinx-rtd-theme sphinxcontrib-mermaid
 
 sphinx:
   configuration: docs/conf.py
diff --git a/docs/conf.py b/docs/conf.py
index 2fb8bafe6589..8aeab17a1a83 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -63,6 +63,27 @@ needs_sphinx = '1.4'
 # ones.
 extensions = []
 
+
+# autosectionlabel allows referencing sections using their title, without
+# needing to add explicit labels to each section. Used by design documents.
+extensions.append("sphinx.ext.autosectionlabel")
+# Setting autosectionlabel_prefix_document to True allows disambiguating
+# between sections with the same title in different documents by prefixing
+# the label with the document path.
+autosectionlabel_prefix_document = True
+
+
+# Mermaid diagrams are used in the design documents, so we try to
+# load the extension if it's available, but don't fail if it's not:
+try:
+    import sphinxcontrib.mermaid
+
+    extensions.append("sphinxcontrib.mermaid")
+    # For included Mermaid diagram files, init the extension explicitly.
+    mermaid_init_js = "mermaid.initialize({ startOnLoad: true });"
+except ImportError:
+    pass
+
 # Add any paths that contain templates here, relative to this directory.
 templates_path = ['_templates']
 
-- 
2.39.5


