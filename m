Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4367606A32E
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 05:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icedev.pl header.i=@icedev.pl header.a=rsa-sha256 header.s=google header.b=EXoFJ0v+
Received: from list by lists.xenproject.org with outflank-mailman.1500205.1696462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVMwb-0007AB-7P; Mon, 23 Nov 2026 05:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500205.1696462; Mon, 23 Nov 2026 05:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVMwb-0007A4-32; Mon, 23 Nov 2026 05:50:25 +0000
Received: by outflank-mailman (input) for mailman id 1500205;
 Mon, 23 Nov 2026 04:08:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <michal.leszczynski@itsecrnd.com>) id 1xVLLq-00004w-Ly
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 04:08:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVLLq-0008FE-2R
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 05:08:22 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <michal.leszczynski@itsecrnd.com>)
 id 6b03bc03-e002-0a2a0a5209dd-0a2a450ab902-32
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 05:08:21 +0100
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <michal.leszczynski@itsecrnd.com>)
 id 6b03bc35-f2d2-0a2a450a0019-d155da32d5fb-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 05:08:21 +0100
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c50e26763a4so519731566b.1
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 20:08:21 -0800 (PST)
Received: from vmpc ([93.174.29.228]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513aea8063sm366345366b.45.2026.11.22.20.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 20:08:20 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=icedev.pl header.i="@icedev.pl" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=icedev.pl; s=google; t=1795406901; x=1796011701; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+y4OO1MKIZbEdYCgmvXtDmq9X7oqv4bG74DNc8SSEqY=;
        b=EXoFJ0v+8GdwdI99x+1wYkcNjkkDtyLCXRrE6rEzhfQTFB2yJnIgt1Lotdf+eu33hP
         AK6xLYFf5Uxgqd4L5FVTLsDEl7Kr4ldDGorpZhO/mB9dxTwxZSoTB8DjmAXw5U5RhhBo
         XJTPd9LnUk41xFrZj/c5hsv8r7Ebt5Go6jXbIRAV8571F1BQc6Y23BkNrc9NSa5Yfgky
         hSyKh+btgYd34JttOUOAG4i3LArKQf4cNWqAiOonws+oIJQur+e2mBx/avQEsDD/4bFS
         l1nYOPm46B60YY3z2FadAmuqIj4pXBQkWnn39D7Tsk3+SVu8Hj1Mu7IQNzqcz9SWhXM3
         Eb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795406901; x=1796011701;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+y4OO1MKIZbEdYCgmvXtDmq9X7oqv4bG74DNc8SSEqY=;
        b=0CQEZBKcF7FKXimtPq48PT9Q2ytVoQf2K1m+npP+9DFqDOwObikQ+hP3n3+HZ1ft8Q
         xwFl57ZnoO1iRtH0ANzp7U6Pj6HtiSqkNsc3LYIwp9CGlx4yDw93LjmDEfJMJUvtPw3V
         UDTf9I/5WzuhQwLp5fhY1zrmOBOsHPrd9pHu5Ihx5pchnkkJF2hQQ7q1/+V5w6zcpnSM
         181nQLMSjs+ZP39hjIZweK+K3Vxs0GifaIoCaKP6dWHcrmAEG+LupIIngIVQ5n3HWeIm
         GeGk+LQA+/3/6th88/L5WyUFiEinQ8SBRrvnz4Cca/P9r7Z5HKFxOK4xafC6G5wuBSKE
         Bnjg==
X-Gm-Message-State: APuU4Z97y5RE3kdesgeoswHRjQ6Pigg9s4YlmU+m+yVmpLuHmFkcjQHI
	cLXmwTFxeaNOIjk+4TCPD5jg4MkdIf5rA3cc1suAFFL6nJbnnGAbZWXyQi7nlvaSVEZtW6Jy1S3
	pjenPiLo=
X-Gm-Gg: AZFdTZfbKsa4QATsxYNrWwY4apUfK6mN8FvlcDlkHB9Z0EzaXFceZ5j7FgdrJ48owc9
	GDi+wWcw0PdaiU3NDfYVSjL1xI+6Qt6bbrptM6VcmQJXpj3hs5PPDqa3v4xPKwuMOZFAB8AC9Hl
	q0bBkg7fJyOAdC7I0yNEBaHU0zgkE0m1kSgOHbFhy0ah5s9DiebxsJ6c00bgKEEbSxfu0ekbHif
	Ib9iQUFim8uY5NjnIMJRCZTnL/JBF/I31/FC8t+RqHbvzY39bCRp5+y06fYL2T4iEMmK3Q8ugMg
	brym4dh/BhbrRW89cKD5On6nTzWtqUPOLSbn3TL1JqM5X6YNA4ln//pMc1K6Bu4AybvtX26B3dW
	D0ULgoVRvdJfEi4kDSrCxtDiEqSodu3dGhI65BYC6OmlczS/YQ1chp1XOL0BnGMIomukEWGvRdj
	5eNVVYVEBk6gP5xsxMiZATumS1mqDLydKSlgw7wdS4XHZFiMyBMnCk7iZsTbB+5ksV8mrN1Bw7Y
	gCu3uY6ScEes+uth18dEaMO+2cbgPwNaWgmPHO7TxbSAGxDwpWm8rd9UAvP36thtJxPmTUnWZf8
	fHo8eC0VowH1UdLoSN5aGHYyoTJn/TNNS9SPzGkVXrw06nmhVzfVbQ==
X-Received: by 2002:a17:907:84c:b0:c2e:63ba:1f90 with SMTP id a640c23a62f3a-c513acb5be4mr869989766b.48.1795406901194;
        Sun, 22 Nov 2026 20:08:21 -0800 (PST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <ml@icedev.pl>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <ml@icedev.pl>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH] x86/p2m: don't request mapcache invalidation for altp2m removals
Date: Mon, 23 Nov 2026 05:07:12 +0100
Message-ID: <20261123040805.23963-1-ml@icedev.pl>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1795406901-51CC3CFC-D40E2F30/0/0
X-purgate-type: clean
X-purgate-size: 1993
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Michał Leszczyński <ml@icedev.pl>

Since commit 588d961d15d1, p2m_remove_entry() requests a mapcache
invalidation for every removal, including altp2m entries removed via
p2m_change_altp2m_gfn(). Device models map guest memory through the
host p2m, so such removals cannot leave them with stale mappings.

When the request is issued by another domain, every vCPU of the guest
synchronously broadcasts IOREQ_TYPE_INVALIDATE on its next hypercall.
DRAKVUF triggers this whenever it removes the last breakpoint from a
page.

This was measured on Xen 4.22.0 with QEMU 9.1 and a 2-vCPU Windows 10
guest, benchmarking a dummy application which calls NtCreateFile in a loop
while DRAKVUF's filetracer plugin is tracing those calls. On every such
syscall entry, the plugin places a temporary trap on the return address,
to be able to observe syscall's return value. The trap is removed after
the observation is made. Thus, every syscall translates to altp2m entry
addition and removal under this benchmark scenario.

Without this change, each traced call took about 8.1 ms.
With patch it goes down to about 0.19 ms (~43 times faster!)

Only request the invalidation for the host p2m.

Fixes: 588d961d15d1 ("IOREQ: refine when to send mapcache invalidation request")
Backport: 4.15+
Signed-off-by: Michał Leszczyński <ml@icedev.pl>
---
 xen/arch/x86/mm/p2m.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 52cadd9b25..bb0356396c 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -574,7 +574,8 @@ p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
         }
     }
 
-    ioreq_request_mapcache_invalidate(p2m->domain);
+    if ( p2m_is_hostp2m(p2m) )
+        ioreq_request_mapcache_invalidate(p2m->domain);
 
     rc = p2m_set_entry(p2m, gfn, INVALID_MFN, page_order, p2m_invalid,
                        p2m->default_access);
-- 
2.53.0


