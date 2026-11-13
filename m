Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF4E606A327
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=g+uYoFU+
Received: from list by lists.xenproject.org with outflank-mailman.1487336.1689763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRpgs-0007NI-HE; Fri, 13 Nov 2026 11:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487336.1689763; Fri, 13 Nov 2026 11:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRpgs-0007NB-E7; Fri, 13 Nov 2026 11:43:34 +0000
Received: by outflank-mailman (input) for mailman id 1487336;
 Fri, 13 Nov 2026 11:43:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRpgr-0007N5-Ka
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:43:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRpgr-0074Nj-1S
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 12:43:33 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af6f7da-e002-0a2a0a5209dd-0a2a4503c698-46
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 12:43:32 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af6f7e4-fae8-0a2a45030019-d155802fedf3-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 12:43:32 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso12203565e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 03:43:32 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e28d0b2sm118287175e9.7.2026.11.13.03.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 03:43:31 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1794570212; x=1795175012; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5QC4tu4WUnL5LaCYFm+NZG2TShIkrteVa2dR52dHDs=;
        b=g+uYoFU+qu/O7j9r/3KkrRfenH3Jf5H83GoTETSX3jWIoxzCkieYsyZEXjvhDQJ2XT
         ju15niIg4rMa/YLPSPan4K4HcDQMHCJ/mWpBJx7Ym7sL8WtZwPbi/9aazwwrcl5xql51
         AK6OUjFYlaAJCzm4dZyRwB3QOpZY08yz6lW2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570212; x=1795175012;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U5QC4tu4WUnL5LaCYFm+NZG2TShIkrteVa2dR52dHDs=;
        b=fdT4Oxx1Dn28Ea4C7q0x1SCUhboxSpBh9Kj9MtNytn2yfjWlyN+NOzmfAxfeaOlF2m
         AaU2tYmg2kAbRwPgQdLk4bnLlaqHe1Wr8uW7CkwZtU1ZD/KORjS0C6UziL4ZRGAQNl9s
         JD43qGjZ1my358Ilo+a07LVXWrXbbaCDCN9BLFCYKwW7+bgtHD1H4wDulPtqUii+1zrE
         yzdI7/Dsko30ecIlR0M03bHJDyK1dwHDX3YZC/FMI3wqLCrWmhPXhZyDiUYfIPWSUJk1
         3o2j+hub39tQj1zVh1bva1w4RdNMAPxpOmh7R5oPQqR/T43CR5z7kAJubDlc5FVVYR7A
         8jNA==
X-Gm-Message-State: APuU4Z81eZEyiRbK1SWKl5rzwGYs7/f6FgdJW5r8J79edDnv+HJGo/3j
	lfdT2fb3j9U62Q1+oH/CjAWhZ/HRD/j3OVfY1ezRXq7mpLgCQZ135zt3Dklih7L3xfpqHImvFtp
	PVhNB
X-Gm-Gg: AYBFou3wYfuA21hbFQiEQR6NSosl+eCclkHiZ3Q9y33qR2pyPXdeu8k800w4A9Gmv5P
	V86UZdp+grVTyMUYEaczWe66SZFT3W1gL0xSuHRCGvxzZ40EZ2RUESJe7iRqBPFiUDH+qLhecpn
	iwZM24x0DRaOMRzq8/Blr+KfY35jTmNHkdmmeDaIvSupg5rGv7NQSJeYo4SElp1GpN3a9eglVjo
	Wvo4rYu5fbBe1qWi0kjiP+rLsLDNGohL1QNnNET8c0vORzUMY0PeRZDpEKZvsGJ3OYGWMmhjqoH
	VCIf/2fA37CRIQTe4wl5rJTM4k5L+WcIXjoUTd2LRvQxGEF39aLt9lAP6nwk7BSBlCRBrA7cgA4
	RLpbbQQV8LJC5T8a1+0dS4naM69tZmqppoaMa4rqPS7fpsdQncyb5gKoHv0xccKku8ASihsChfs
	eqAoRWDzYia6vkChEsa8RYMTCdo+iS+ps2JzoewDvuZOmiAn+XGBD1RFxqIduAfiT2WptYghw9f
	Ye4ho0M8SiS3DIs+15zg2dJJJ/bXMyjHAiTBChMvecFGVVBSSAgBLpHHxYuq2vszklrhPQdS/Zd
	wOr9cLY/RoEYl5CGGm6UpfIgZvGNw74OZw/w0dMcOqDbuu88veYeu4ck0E5rtC4rTTvnKrOfjaG
	ptEn9X0MS5/dIemmVyT97HYXN
X-Received: by 2002:a05:600c:8189:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4bb559f72b1mr49931535e9.4.1794570211589;
        Fri, 13 Nov 2026 03:43:31 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/boot: Reduce verbosity in reloc_trampoline??()
Date: Fri, 13 Nov 2026 11:43:29 +0000
Message-Id: <20261113114329.3403782-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1794570212-7448C4E9-C9CD3304/10/78276251493
X-purgate-type: spam
X-purgate-size: 1799
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The name 'trampoline_ptr' is voluminous without merit.

Shorten it to just ptr.  No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/boot/reloc-trampoline.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/boot/reloc-trampoline.c b/xen/arch/x86/boot/reloc-trampoline.c
index e35e7c78aa86..f52b9b265b42 100644
--- a/xen/arch/x86/boot/reloc-trampoline.c
+++ b/xen/arch/x86/boot/reloc-trampoline.c
@@ -18,7 +18,7 @@ void reloc_trampoline64(void)
 #endif
 {
     uint32_t phys = trampoline_phys;
-    const int32_t *trampoline_ptr;
+    const int32_t *ptr;
 
     /*
      * Apply relocations to trampoline.
@@ -26,13 +26,9 @@ void reloc_trampoline64(void)
      * This modifies the trampoline in place within Xen, so that it will
      * operate correctly when copied into place.
      */
-    for ( trampoline_ptr = __trampoline_rel_start;
-          trampoline_ptr < __trampoline_rel_stop;
-          ++trampoline_ptr )
-        *(uint32_t *)(*trampoline_ptr + (long)trampoline_ptr) += phys;
+    for ( ptr = __trampoline_rel_start; ptr < __trampoline_rel_stop; ++ptr )
+        *(uint32_t *)(*ptr + (long)ptr) += phys;
 
-    for ( trampoline_ptr = __trampoline_seg_start;
-          trampoline_ptr < __trampoline_seg_stop;
-          ++trampoline_ptr )
-        *(uint16_t *)(*trampoline_ptr + (long)trampoline_ptr) = phys >> 4;
+    for ( ptr = __trampoline_seg_start; ptr < __trampoline_seg_stop; ++ptr )
+        *(uint16_t *)(*ptr + (long)ptr) = phys >> 4;
 }

base-commit: 97bf370375113caf92fccf04e2877fc6b5ff887f
-- 
2.39.5


