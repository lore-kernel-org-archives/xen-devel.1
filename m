Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E6CFD8FC0
	for <xen-devel@archiver.kernel.org>; Thu, 26 Feb 2026 14:56:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1241996.1542787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcms-000170-3y; Thu, 26 Feb 2026 14:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241996.1542787; Thu, 26 Feb 2026 14:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcms-00016t-14; Thu, 26 Feb 2026 14:56:22 +0000
Received: by outflank-mailman (input) for mailman id 1241996;
 Thu, 26 Feb 2026 14:56:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgwr=A6=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vvcmr-00016l-7L
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 14:56:21 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e208433-1323-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 15:56:18 +0100 (CET)
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id C29404290134;
 Thu, 26 Feb 2026 09:55:57 -0500 (EST)
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
X-Inumbo-ID: 4e208433-1323-11f1-b164-2bf370ae4941
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 06/10] xsm/flask: Add XEN_DOMCTL_claim_memory to flask
Date: Thu, 26 Feb 2026 14:29:20 +0000
Message-Id: <8e5680575f37ce67a81a4c712e5409ccb3f6f612.1772098423.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1772098423.git.bernhard.kaindl@citrix.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a Flask security policy for the new XEN_DOMCTL_claim_memory hypercall
introduced in the previous commit. When Flask is enabled, this permission
controls whether a domain can stake memory claims for another domain.

The permission is granted to:
- dom0_t: Dom0 needs this to claim memory for guest domains
- create_domain_common: Domain builders need this during domain creation

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/flask/policy/modules/dom0.te  | 1 +
 tools/flask/policy/modules/xen.if   | 1 +
 xen/xsm/flask/hooks.c               | 3 +++
 xen/xsm/flask/policy/access_vectors | 2 ++
 4 files changed, 7 insertions(+)

diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
index d30edf8be1fb..f5c330d01cec 100644
--- a/tools/flask/policy/modules/dom0.te
+++ b/tools/flask/policy/modules/dom0.te
@@ -103,6 +103,7 @@ allow dom0_t dom0_t:domain2 {
 	get_cpu_policy
 	dt_overlay
 	get_domain_state
+	claim_memory
 };
 allow dom0_t dom0_t:resource {
 	add
diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
index ef7d8f438c65..8e2dceb505cd 100644
--- a/tools/flask/policy/modules/xen.if
+++ b/tools/flask/policy/modules/xen.if
@@ -98,6 +98,7 @@ define(`create_domain_common', `
 		vuart_op
 		set_llc_colors
 		get_domain_state
+		claim_memory
 	};
 	allow $1 $2:security check_context;
 	allow $1 $2:shadow enable;
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index b250b2706535..0cc04ada82a9 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -820,6 +820,9 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
     case XEN_DOMCTL_set_llc_colors:
         return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__SET_LLC_COLORS);
 
+    case XEN_DOMCTL_claim_memory:
+        return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__CLAIM_MEMORY);
+
     default:
         return avc_unknown_permission("domctl", cmd);
     }
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index ce907d50a45e..2c9337f7a145 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -255,6 +255,8 @@ class domain2
     set_llc_colors
 # XEN_DOMCTL_get_domain_state
     get_domain_state
+# XEN_DOMCTL_claim_memory
+    claim_memory
 }
 
 # Similar to class domain, but primarily contains domctls related to HVM domains
-- 
2.39.5


