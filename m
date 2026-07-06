Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0C3C43458
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2026 09:45:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355214.1609993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfsa-0007WT-OH; Mon, 06 Jul 2026 09:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355214.1609993; Mon, 06 Jul 2026 09:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfsa-0007WG-Jw; Mon, 06 Jul 2026 09:44:44 +0000
Received: by outflank-mailman (input) for mailman id 1355214;
 Mon, 06 Jul 2026 09:44:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wgfsZ-0007Fw-B9
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 09:44:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgfsY-002r9l-OL
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 11:44:42 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b78fd-5cb7-0a2a0a5109dd-0a2a4504c6e0-46
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:44:42 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b790a-a01d-0a2a45040019-d1558031ddd5-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:44:42 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-493c2c0b9a8so25356765e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 02:44:42 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493ccd9d620sm283605205e9.1.2026.07.06.02.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 02:44:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783331082; x=1783935882; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BraaY1qC7HOBXFTxSHCrNc1y8UspO9XuBbEgUVn16EY=;
        b=au7mGDey2UgTbbwtTESrELm69WH6rJ9Z6FrwpW983XxBBkaZA3pfrVnqjDuFMeYWMM
         y36QzmCp8y0Melegmk2t56AkH4bcXja18VGsICO9eT658dc2dmgDHOB+z3xnfz7E4rmJ
         ZOmVI6g1ruCWGH5XpyhmuLaFzB73B6HojR012mljaEBM2c2WhuuaE2hZ1EJsPlmc7Q2x
         rzTI16oK7ERQC/rbwjzPzg8s42agR20BbYplYxTkrTeN+DUW+tDMgB+lNban/4jmi9yD
         j666SzsI4RW2CI6KmFxy6Md02olVoYDAMnI2fVw+F3lEeYID9VM9BhJ0WIUo+e70Xxs7
         GuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331082; x=1783935882;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BraaY1qC7HOBXFTxSHCrNc1y8UspO9XuBbEgUVn16EY=;
        b=XBUupeSE6EF5mih5zBX+rFHUoXfV4/w/VwjeHAwdWLBH0wWKAOIiyh/lgwF9pQ+nkQ
         p9gJMFZQw9iZ7gbVcWlm6V8tajvXfWrFyUJscPgWQE88ViiQyvfpiL8jxeZgdcpxpgfk
         jWRI7tqNx/jlE5KMA2JGO/g8HB2hrSb8rQ+VcvyPQ/+mua8SD5yYrEirBrFuF20gZbXQ
         zGOF70uSI88CZR+JnJATxMad6xGSXnJQKqoTwoJo8t9XYs/fxCAE9vrVapRpbARXbFoS
         RsXv7LgPOnD5oVklnKX7va/cm/EL/IfeowlwD9sCgxR5MbY16A+Se+R5HKs93dLoB1Nm
         Ccpw==
X-Gm-Message-State: AOJu0YxA4cRH16zIuq5z9K8Y5U/ExCpa1oDt3mgs8RQ+U+QaEJyGwMCT
	QX50cP5iiVery27d0ZKMkDbzi5b7JRxBXbDM0EM7LLOoqDkefYLf6KBljoMK/ybIzMw=
X-Gm-Gg: AfdE7clg83cdL1CmcRqvygWLjkarbxoS1NfhJJO3dQ2q1SeQ3L+GQKKdLi6P2l9hyfP
	jr+zVOr6R99p0IeasJ6GfH6fJgy3WHd5qxDx740CjJa0LhnT9mgNccU+nPiwLKmKkxyZLa/8qZk
	0a0ed88NaUCS64TA2wjnRx5BqWMJbVBaweD20HL9oQKd70Y6Sct/P+npI/rbtLQPOBWNZQzX/aw
	2ltbBhp9s6cNH0ent58zVzisTywxqBzipgVQuhP+NQnOJOYJm2frsfLaM86E2iAFwGbj6QcfBau
	OWHMTBUHU5YUfS74zcPWau7dFt1lSgjahA2ZvrVo6iU8K3PD/6lzgTxnuDF6rTWz5CkkpFUueKQ
	KRojSNpwpmXHOMVjLW/kE4jnJ4g6I8xkroj54hgNVBnQj5DouADW2exleg7pYqKJVbOgIrwHGtj
	sMX67ack+LEdOQybVC9QpkRwCbYBqdAJpAt/hUipx0GfI3IlULvhMZA3LvACsiD7TacyyfcwcoC
	xvZawjwCMuV2x/9/LM=
X-Received: by 2002:a05:600c:2314:b0:490:e974:e006 with SMTP id 5b1f17b1804b1-493d11f6f7bmr76574215e9.29.1783331080929;
        Mon, 06 Jul 2026 02:44:40 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v6 3/4] x86/efi: avoid a relocation in efi_arch_post_exit_boot()
Date: Mon,  6 Jul 2026 10:44:29 +0100
Message-ID: <20260706094430.427155-4-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706094430.427155-1-frediano.ziglio@citrix.com>
References: <20260706094430.427155-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1783331082-77B231CC-B10C79E3/0/0
X-purgate-type: clean
X-purgate-size: 1924

From: Roger Pau Monné <roger.pau@citrix.com>

Instead of using the absolute __start_xen address, calculate it as an
offset from the current instruction pointer.  The relocation would be
problematic if the generated PE binary had .init.text as a standalone
section with just read and execute permissions."

Removing this relocation is necessary to make it safe to split .init.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes since v1:
- Improve commit message.

Changes since v3:
- Added Acked-by.
---
 xen/arch/x86/efi/efi-boot.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index d738b839ee..b983f054b5 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -270,7 +270,9 @@ static void __init noreturn efi_arch_post_exit_boot(void)
 
                    /* Jump to higher mappings. */
                    "mov    stack_start(%%rip), %%rsp\n\t"
-                   "movabs $__start_xen, %[rip]\n\t"
+                   "lea    __start_xen(%%rip), %[rip]\n\t"
+                   "add    %[offset], %[rip]\n\t"
+
                    "push   %[cs]\n\t"
                    "push   %[rip]\n\t"
                    "lretq"
@@ -278,7 +280,8 @@ static void __init noreturn efi_arch_post_exit_boot(void)
                      [cr4] "+&r" (cr4)
                    : [cr3] "r" (idle_pg_table),
                      [cs] "i" (__HYPERVISOR_CS),
-                     [ds] "r" (__HYPERVISOR_DS)
+                     [ds] "r" (__HYPERVISOR_DS),
+                     [offset] "r" (__XEN_VIRT_START - xen_phys_start)
                    : "memory" );
     unreachable();
 }
-- 
2.43.0


