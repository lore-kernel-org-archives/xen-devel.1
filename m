Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6E8E8383C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Feb 2026 22:03:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1234537.1537748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs6gA-0005Ck-7N; Mon, 16 Feb 2026 22:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234537.1537748; Mon, 16 Feb 2026 22:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs6gA-0005Cd-45; Mon, 16 Feb 2026 22:02:54 +0000
Received: by outflank-mailman (input) for mailman id 1234537;
 Mon, 16 Feb 2026 22:02:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdUN=AU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vs6g8-0005CW-Rh
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 22:02:52 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ba3a228-0b83-11f1-b164-2bf370ae4941;
 Mon, 16 Feb 2026 23:02:50 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1771279356362254.9074161418365;
 Mon, 16 Feb 2026 14:02:36 -0800 (PST)
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
X-Inumbo-ID: 3ba3a228-0b83-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1771279359; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fsJigS7W0oSYt93O6uP7xjEitmWGpEzqU1BDOq81q824QpAG27qnb/s7dWSnlBl5hcLwSzkwRF9BcPdie7JxgmCBo7rklaAypVqjOtXWegirTRquPIN7azNwegLsZySmngwtdEF47HJDvvrdcWWpu/+itI2xaOrh+3oZXrEda6g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771279359; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4VEgKRoBkaKV62x2vF6xqW5mSzNd6FYxa2E8lFTgOn4=; 
	b=PCUwAUVZ3ovEorBfTmYjnKmDh9h1mOK0qCxxwllJSb/q6hq9wyDNz0B5DfSxH/jWofiYvuEjS//X+voQMS03zSMa9zrdlDoyINU2EhOPecvarW7QmgIqNGgNvLLsungMpvxDMEDZDSxYgFd17eDWOYhWW6mXETW9FuUYPOHhuBM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771279359;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=4VEgKRoBkaKV62x2vF6xqW5mSzNd6FYxa2E8lFTgOn4=;
	b=Q2nzDv9KGwZS7v97r2FYPEy6CB9nX2CwIN8D6Wc85W9x6iQNawZp8FoJGPJwtUk4
	4ZFHOSIrgP27YtQkIFy7EnwA6aNRgagxjwrHa88WdOPubwsijtJsyNLSS+DNzBRmWii
	ZdcLzx92kthgy7j+ejFJ1mrbc2/EIBNFGUU1DKZU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Chris Rogers <rogersc@ainfosec.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [BUG] common/domctl: xsm update for get_domain_state access
Date: Mon, 16 Feb 2026 16:57:48 -0500
Message-Id: <20260216215748.20398-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

When using XSM Flask, passing DOMIND_INVALID will result in a NULL pointer
reference from the passing of NULL as the target domain to
xsm_get_domain_state(). Simply not invoking xsm_get_domain_state() when the
target domain is NULL opens the opportunity to circumvent the XSM
get_domain_state access check. This is due to the fact that the call to
xsm_domctl() for get_domain_state op is a no-op check, deferring to
xsm_get_domain_state().

Modify the helper get_domain_state() to ensure the requesting domain has
get_domain_state access for the target domain, whether the target domain is
explicitly set or implicitly determined with a domain state search. In the case
of access not being allowed for a domain found during an implicit search, the
search will continue to the next domain whose state has changed.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reported-by: Chris Rogers <rogersc@ainfosec.com>
Fixes: 3ad3df1bd0aa ("xen: add new domctl get_domain_state")
---
 xen/common/domain.c | 22 +++++++++++++++++++---
 xen/common/domctl.c |  7 ++-----
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index de6fdf59236e..4886c59c874c 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -210,7 +210,7 @@ static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
 int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
                      domid_t *domid)
 {
-    unsigned int dom;
+    unsigned int dom = 0;
     int rc = -ENOENT;
     struct domain *hdl;
 
@@ -219,6 +219,10 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
 
     if ( d )
     {
+        rc = xsm_get_domain_state(XSM_XS_PRIV, d);
+        if ( rc )
+            return rc;
+
         set_domain_state_info(info, d);
 
         return 0;
@@ -238,10 +242,10 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
 
     while ( dom_state_changed )
     {
-        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
+        dom = find_next_bit(dom_state_changed, DOMID_MASK + 1, dom);
         if ( dom >= DOMID_FIRST_RESERVED )
             break;
-        if ( test_and_clear_bit(dom, dom_state_changed) )
+        if ( test_bit(dom, dom_state_changed) )
         {
             *domid = dom;
 
@@ -249,6 +253,15 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
 
             if ( d )
             {
+                rc = xsm_get_domain_state(XSM_XS_PRIV, d);
+                if ( rc )
+                {
+                    rcu_unlock_domain(d);
+                    rc = -ENOENT;
+                    dom++;
+                    continue;
+                }
+
                 set_domain_state_info(info, d);
 
                 rcu_unlock_domain(d);
@@ -256,10 +269,13 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
             else
                 memset(info, 0, sizeof(*info));
 
+            clear_bit(dom, dom_state_changed);
             rc = 0;
 
             break;
         }
+
+        dom++;
     }
 
  out:
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 29a7726d32d0..2eedc639c72a 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -860,12 +860,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
 
     case XEN_DOMCTL_get_domain_state:
-        ret = xsm_get_domain_state(XSM_XS_PRIV, d);
-        if ( ret )
-            break;
-
-        copyback = 1;
         ret = get_domain_state(&op->u.get_domain_state, d, &op->domain);
+        if ( !ret )
+            copyback = 1;
         break;
 
     default:
-- 
2.39.5


