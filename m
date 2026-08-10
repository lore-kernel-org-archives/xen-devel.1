Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217B6C5AD7B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 22:10:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387915.1629149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtYCc-0003Sq-3D; Mon, 10 Aug 2026 22:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387915.1629149; Mon, 10 Aug 2026 22:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtYCb-0003Sj-WB; Mon, 10 Aug 2026 22:10:37 +0000
Received: by outflank-mailman (input) for mailman id 1387915;
 Mon, 10 Aug 2026 22:10:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wtYCZ-0003Sd-SN
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 22:10:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtYCX-00FY55-Ag
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 00:10:33 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7a4c46-8faa-0a2a0a5109dd-0a2a450cba54-30
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 00:10:33 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7a4c59-f479-0a2a450c0019-d155802ded66-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 00:10:33 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49553515a8bso37007495e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 15:10:33 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499740c1f61sm21254325e9.5.2026.08.10.15.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 15:10:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1786399833; x=1787004633; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qJ+Dl9EkivuGED/x2FDHLy1mHCFN96YYc5uGAZKzX8w=;
        b=lUkPremvwM9yA/+xQpUHTgLeo4DZKrLQc+fBtKekqLlAYxMijP+nKoSTfVpuP2HXfM
         Hkn6PWlTVgXgo6VNOYNoGH0hcXK+HdT+CYlTCSjLvm96FJV1if/5gR4aQjeJyvHbjgf6
         bJ96eBvQbk90eKF0o2QnTdaYpBgpxya54pAI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786399833; x=1787004633;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qJ+Dl9EkivuGED/x2FDHLy1mHCFN96YYc5uGAZKzX8w=;
        b=DQnzONG761Cwm/MR+Y8IU5v5n4bOLs34+LP3eAZoB8Vax7SlpNERPVJNHRXR1M2iyh
         CWuAvY2JA9iWCVrUCs/Ylp+QoKliRmevXAzmqbNwh4QbGyKXuPifchhujtjrVBV/VW57
         B+StFb2xB4XZAgDv8lCaLj5QkWqZ7Xc3LR1qvko3CwZHZj+Yfqjm5nC2Iun9PRfuxqit
         ZToSBxzhtcGtJy36xspyRYX/xadD0D51BFvNfv1sgdHDx2zCahnVYQvhNw7M48mKnHnu
         h1iuo28PzRl9q/BVS3PkH3Zw8UVOO+mKnjJH+9Y0aSy4bcxHgqbp1/fFJ3sZRw9muWya
         4B2Q==
X-Gm-Message-State: AOJu0YyLIiN3A8/psvAFPe1iMjMeLImrxGXEPduur0O4eO+97Uzjwn76
	Vt9njrFdlQ0u6Ji468N8XVFP8+6Pn2JJGRvcN3+AJ6LWg1hCTsZPzU/oDVFiUZgY5Ck+n1ZCW1A
	AU2DCuWQ=
X-Gm-Gg: AR+sD10kTZWlDqr6YiOhpq+hcVHiOTHbtmU5VWTcxjFqt5uo5gF2E9FA+AX0Ozahow0
	HxK0so9vlfl0bfREhBp6shTq51QLikdvTZZ6EHmjQ3NkrKDOHjxBil3hRu2VJeDVSL7N5Nhr/jx
	ANMYAG1JBTU59BICMld/8anNBEQqohRMF0Yn2HUAkQgAdLPJMDvVop18iIAV5/YduisD+iEGsal
	UvANT7pCNnRMSyULT01p4Pc1eJdRnlz5vpXKX6hS8OpdBDXnDjGGE0KwJxW2fqMbRkphmKwVvsO
	GTLLEXoG2qVjOCkJ5hZ2JgRfOd8IV4a0g1PYdFoEDmG56tbDxjeH5JxYzet6GeIrLMsFuo7cQs4
	pc8xAEnwCTgpkzJ71s1kLnlN3+KyohK5MotXgHyNH+db/EJEAwKeNAOpmeoLQnWFxq1mGqXBieR
	Nq5Wx25EU45MjeFyw8p/5eNcO59puUyIrIxhvZtMmq7AeOdVeaeljUKzlXwto92NUu21CQfU5i7
	mpYPDleFDNimvuDUk2gtyyOyY58ZpyWUgBK+aI=
X-Received: by 2002:a05:600c:5795:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-49960bfc7c2mr274411375e9.13.1786399832450;
        Mon, 10 Aug 2026 15:10:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/pagewalk: Read guest PTEs with ACCESS_ONCE()
Date: Mon, 10 Aug 2026 23:10:29 +0100
Message-Id: <20260810221029.1520858-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1786399833-03ED2A5B-718938D6/0/0
X-purgate-type: clean
X-purgate-size: 4719

This has been a plain C read for as far back as I can trace in history.

Research into invented-loads has flagged it as a possible vulnerability.
After careful analysis, it is believed to be a bug only, not a security
vulnerability.

The code fits the pattern for invented loads, and it is a risk.

The analysis suggests that we can read one value out of the guest, operate on
another, and that this could be an in-guest privliege escalation.  Any entity
in the guest able to modify the pagetables already has full privilege, so
while Xen can potentially malfunction, the effects don't cross a privilege
boundary.

The analysis also suggests that this is worse for shadow guests because we may
put the TOCTOU entry in the shadows, but this is inaccurate.  What we put in
the shadows is still translated under the P2M and refers to guest physical
address space.

Either way, harden the accesses.

Link: https://github.com/xoreaxeaxeax/schrodingers-toctou/blob/main/observer-effect/audits/audit-xen-ptwalk-RELEASE-4.21.1.md#86-per-candidate-finding
Fixes: 49f7c7364e0a ("Replace shadow pagetable code with shadow2.")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

I'm not really sure about the fixes tag.  That's the oldest commit which bares
any reseblence to the current code, and it was a bulk rewrite of the whole
shadow pagetable code.  Prior to that, it was all mixed up and it's not
completely obvious what's (definiely) walking the guest pagetables as opposed
to the shadows.

Bloat-o-meter shows this clearly makes a code-gen difference in all cases:

  add/remove: 0/0 grow/shrink: 1/2 up/down: 16/-19 (-3)
  Function                                     old     new   delta
  guest_walk_tables_2_levels                  1688    1704     +16
  guest_walk_tables_4_levels                  3708    3703      -5
  guest_walk_tables_3_levels                  2233    2219     -14

To start with, l?e_read() looked to be the right helper, but they don't exist
for guest pagetable types, leading to:

arch/x86/mm/guest_walk.c: In function ‘guest_walk_tables_2_levels’:
./arch/x86/include/asm/page.h:135:36: error: incompatible types when assigning to type ‘guest_l2e_t’ from type ‘l2_pgentry_t’
  135 | #define l2e_from_intpte(intpte)    ((l2_pgentry_t) { (intpte_t)(intpte) })
      |                                    ^
---
 xen/arch/x86/mm/guest_walk.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
index f48c3ef75f48..df2ccaa67475 100644
--- a/xen/arch/x86/mm/guest_walk.c
+++ b/xen/arch/x86/mm/guest_walk.c
@@ -129,7 +129,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
             guest_l4_table_offset(va) * sizeof(gw->l4e);
     if ( !hvmemul_read_cache(v, l4gpa, &gw->l4e, sizeof(gw->l4e)) )
     {
-        gw->l4e = l4p[guest_l4_table_offset(va)];
+        gw->l4e = (guest_l4e_t){ ACCESS_ONCE(l4p[guest_l4_table_offset(va)].l4) };
         hvmemul_write_cache(v, l4gpa, &gw->l4e, sizeof(gw->l4e));
     }
     gflags = guest_l4e_get_flags(gw->l4e);
@@ -164,7 +164,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
             guest_l3_table_offset(va) * sizeof(gw->l3e);
     if ( !hvmemul_read_cache(v, l3gpa, &gw->l3e, sizeof(gw->l3e)) )
     {
-        gw->l3e = l3p[guest_l3_table_offset(va)];
+        gw->l3e = (guest_l3e_t){ ACCESS_ONCE(l3p[guest_l3_table_offset(va)].l3) };
         hvmemul_write_cache(v, l3gpa, &gw->l3e, sizeof(gw->l3e));
     }
     gflags = guest_l3e_get_flags(gw->l3e);
@@ -264,7 +264,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
     l2gpa += guest_l2_table_offset(va) * sizeof(gw->l2e);
     if ( !hvmemul_read_cache(v, l2gpa, &gw->l2e, sizeof(gw->l2e)) )
     {
-        gw->l2e = l2p[guest_l2_table_offset(va)];
+        gw->l2e = (guest_l2e_t){ ACCESS_ONCE(l2p[guest_l2_table_offset(va)].l2) };
         hvmemul_write_cache(v, l2gpa, &gw->l2e, sizeof(gw->l2e));
     }
 
@@ -353,7 +353,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
             guest_l1_table_offset(va) * sizeof(gw->l1e);
     if ( !hvmemul_read_cache(v, l1gpa, &gw->l1e, sizeof(gw->l1e)) )
     {
-        gw->l1e = l1p[guest_l1_table_offset(va)];
+        gw->l1e = (guest_l1e_t){ ACCESS_ONCE(l1p[guest_l1_table_offset(va)].l1) };
         hvmemul_write_cache(v, l1gpa, &gw->l1e, sizeof(gw->l1e));
     }
 

base-commit: e888192d133eeec8a94275eaf4194117f198a7e2
-- 
2.39.5


