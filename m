Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDDB606A327
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=Oh5DlJEs
Received: from list by lists.xenproject.org with outflank-mailman.1470117.1678880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOGSC-0006Y2-5Z; Tue, 03 Nov 2026 15:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470117.1678880; Tue, 03 Nov 2026 15:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOGSC-0006Xv-2X; Tue, 03 Nov 2026 15:29:40 +0000
Received: by outflank-mailman (input) for mailman id 1470117;
 Tue, 03 Nov 2026 15:29:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOGSA-00069N-Uy
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:29:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOGSA-007igP-Bs
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 16:29:38 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae9fdde-2eae-0a2a0a5409dd-0a2a450ba9e2-14
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 16:29:38 +0100
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae9fde2-b7e8-0a2a450b0019-d155da34b95c-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 16:29:38 +0100
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c43373ae89aso645546766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 07:29:38 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b959c1sm25430467f8f.45.2026.11.03.07.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 07:29:36 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1793719778; x=1794324578; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jqcJnOexiDNGMSUvzMhvIFHRbCx2t1wbpBkIduHSZ8E=;
        b=Oh5DlJEsaOuLz7zpcFedGp9Fmd2YqTYT3Z8Nal5PgT0DzfQf1pV3WshAtH+p/Z3qaB
         6/rEDFV4P8H72gr3Avs9WLZphZEaZXkCkUkJE0bu9LnA6KBE0oWY0pNdVuuFpMlG0dV+
         t7m9MV7AyBcYw6HzoF5U+HGQFlvrz+DdVlILg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719778; x=1794324578;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqcJnOexiDNGMSUvzMhvIFHRbCx2t1wbpBkIduHSZ8E=;
        b=IjQFIzL13B889rBGo0zL9vLakCGdiMr4gfGwDwvnHwhuEheYOSygXFXknDdVgj266U
         XTkgM3HSMMNJqeew7NJSmdzhiUG12Fe+WL/FXgBlkrpld1zFWQ3VhzVx1S6XwC1kJJNR
         6uhJA0yXaQirv5j06xpxocqKEBRpp2vifrKBPr9lualO4b6xx+6GCt3Q0i2KZBaXheW7
         EYYr9OSblvs5cmVFjxyf6AbE+oVopa4QuuLq0hU9rQNHT8Ft5LXm4AK+Yo+tTxL/JwDO
         G4seUxfOKK0fFcCfhceL36p/UeHH1yu8SsOS4A+WFBVqpGA4DZbUVu3JRbendNsnjrZG
         032g==
X-Gm-Message-State: APuU4Z+EcQsWtrjn97cjb925m3z0M2hgWCWNXUgKCO/zcz3bP8DeZrFQ
	WYDsnkuLnEhERQ8StnTe9s/ga0eYtwtek7t1Y6wl3a6Z1NWAqvA1hOFoJIAbbVqN+08eUkUocqI
	Sc+k20/c=
X-Gm-Gg: AYBFou35JOGnIEHfYh4mWpweJ2fAP138IsD8ZtFRs0SP/nq87Drcktt/jEnsKWgn7Er
	YBEBRqqcZVCOGSrJClKAAyGEjV0TaIwaT2F2xXAz4S+lnETuIzoAdq0mXIaLVLDu2E1BxPpHZyQ
	f9gcrV6GZeFL2WJziaw262LaRoyflZ0YGZ/SJHiBQu6VYzS6MR118rFcVX0IHnjS4Elcvb3UsC6
	ZpxLO8B3PfaPm4J1kqc/LhBvq0OVAWRnDzuuJB9+Zr35dDXVIvTCEYBZ2yY9sISEwPuG0cERZCa
	gRK0gZqAaTrA+z6wEM9L6CEVgKoPxCoE96yIS5F5Qwao7nMy3MDCVR0JSOyW22eRAsQKIlG7WlM
	ijIm60OnsC2A7Dg+spV6oHyMWADAwbrdj40g8QJmDRPIKRb/0/xg97huJqNpmcpC6Ag2MMqchBk
	IPfMlPhVeniYA8HJq92NXXRlOiAut+8wD8CNO8EN2BB8zUOHb1VImWtr2OfHMG2tgF8GKNDE1E7
	HW77fXmyoR97eO2esno/onvFYCwfqNS+LQWyd7f6MEhCTeycFmqzzB2tDcyGrPuL+CmSldWtn4m
	XeUbCXzAIpnR1VZYKFJns8bKMR5aXbc8w5uhttZUYewp0NgkZY+gpQJX9dn1LdjkdUgg7QFvCaS
	S1Wg=
X-Received: by 2002:a17:907:dab:b0:c40:dfec:50b6 with SMTP id a640c23a62f3a-c4ca7b83f7emr1198124266b.49.1793719777384;
        Tue, 03 Nov 2026 07:29:37 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
Subject: [PATCH 3/6] xen/gnttab: Remove explicit rcu_lock_current_domain()
Date: Tue,  3 Nov 2026 15:29:25 +0000
Message-Id: <20261103152928.2142176-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
References: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1793719778-A9CC79EA-FE1F8462/10/78276251493
X-purgate-type: spam
X-purgate-size: 2798
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

rcu_lock_current_domain() is always a nop, while rcu_unlock_domain() is not.

GNTTAB ops swap_grant_ref and cache_flush are the only two paths in Xen which
explicitly RCU lock themselves.  Drop this behaviour.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/common/grant_table.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index d42bd5fb83fd..f4ec7524140a 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3498,7 +3498,7 @@ gnttab_get_version(XEN_GUEST_HANDLE_PARAM(gnttab_get_version_t) uop)
 static int16_t
 swap_grant_ref(grant_ref_t ref_a, grant_ref_t ref_b)
 {
-    struct domain *d = rcu_lock_current_domain();
+    struct domain *d = current->domain;
     struct grant_table *gt = d->grant_table;
     struct active_grant_entry *act_a = NULL;
     struct active_grant_entry *act_b = NULL;
@@ -3573,8 +3573,6 @@ swap_grant_ref(grant_ref_t ref_a, grant_ref_t ref_b)
         active_entry_release(act_a);
     grant_write_unlock(gt);
 
-    rcu_unlock_domain(d);
-
     return rc;
 }
 
@@ -3622,22 +3620,16 @@ static int _cache_flush(gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
     if ( cflush->op & GNTTAB_CACHE_SOURCE_GREF )
         return -EOPNOTSUPP;
 
-    d = rcu_lock_current_domain();
+    d = current->domain;
     mfn = maddr_to_mfn(cflush->a.dev_bus_addr);
 
     if ( !mfn_valid(mfn) )
-    {
-        rcu_unlock_domain(d);
         return -EINVAL;
-    }
 
     page = mfn_to_page(mfn);
     owner = page_get_owner_and_reference(page);
     if ( !owner )
-    {
-        rcu_unlock_domain(d);
         return -EPERM;
-    }
 
     if ( d != owner )
     {
@@ -3647,7 +3639,6 @@ static int _cache_flush(gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
         if ( IS_ERR_OR_NULL(act) )
         {
             grant_read_unlock(owner->grant_table);
-            rcu_unlock_domain(d);
             put_page(page);
             return act ? PTR_ERR(act) : 1;
         }
@@ -3691,7 +3682,6 @@ static int _cache_flush(gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
 
     unmap_domain_page(v);
     put_page(page);
-    rcu_unlock_domain(d);
 
     return ret;
 }
-- 
2.39.5


