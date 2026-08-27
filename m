Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2C0C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400962.1636718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvl-0003s0-UI; Thu, 27 Aug 2026 15:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400962.1636718; Thu, 27 Aug 2026 15:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvl-0003pI-Bx; Thu, 27 Aug 2026 15:22:17 +0000
Received: by outflank-mailman (input) for mailman id 1400962;
 Thu, 27 Aug 2026 15:22:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvi-0003IQ-VS
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvi-009kzH-Af
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:14 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905616-2eae-0a2a0a5409dd-0a2a4501a8e6-48
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:14 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905626-5984-0a2a45010019-d1558030b0f2-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:14 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49b0dbfbf7bso9579045e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:14 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:13 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787844134; x=1788448934; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pDNxaENCE/QvrI+SlRLhTcL902ueqXFbgva0UVPXBwU=;
        b=m769sHb5B6GxcJ3rq7HDto7Tk4vtQZysLLknD2LEEskGtoW5U28L9dBuvuoi9Svt0K
         xbWw4zW8MvGD9lxwFoisyhGPfDORfgjNLe6rXZ+ypZ6ZDqasR+VSpE6t6cj/0pn0PgRC
         reEfO4Zmqh8KKlmy94mdTsfl8BVXHgANB97eeUTscM2efqjLIL9+wAWZPKh/pTaEIzyM
         TeXTkMO0IybDDFpVDE8S5jpSqLXyVHmSGq8uhkhvfiSeaq05VqpMzEXZFMtF4FTbblA0
         PjY5Sh5zuTiZdniMJMS3zR95xyjTJFgDTxUFT+qwWfOC2sNJLtVELRlXGwBZRRZBOiTF
         7vfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844134; x=1788448934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pDNxaENCE/QvrI+SlRLhTcL902ueqXFbgva0UVPXBwU=;
        b=Uu0w3n474tvMpTLsyTniJnynHGKpZ9utDWoqdRb6RSUbyRtzlHzGrWbDtbsUfhjCUd
         GUy3hAoeLXgnrj8yhUhFY53ZvkF6L4DcEsQOaOYvmXYiQuhVpSBmhjGioNdYuyTzMPCZ
         p3mmk87GzUyC2jkolUOScN+kpP45GnNoJ0bNojXNTa0TqmjNxoqvqENCHuwe+afa2Qmt
         jJDEdtk5TXKxu5hrpV+wTUoYpE27xDDjIiOItY8NywuudqjdfFm8Zh6ZVPvawS4Etk4S
         qHUw8tIXbypSSnNG87mMwKmTpoD5FG/FycnhRylw/ju7bBsL+xgWSKSXVvFSAt/q04N7
         mKGw==
X-Gm-Message-State: AFuF++mUliLrdvDEPEdUGHcdl8gBPLmgeQ2az8c3j83m0R6hkwg8168/
	L4RYq8j2Y860E7931qQFAEvvTw9b46FMst0Yv+hDCOYI/zbBODu4XgkNNUh+pg==
X-Gm-Gg: AR+sD104SVGq/LKOnTAI8g9g7yV8I5ILJCeV3IYnBgJiejecNlVLd1tu6azePoUbPNf
	OBvzQwLYU0K3keHJz6urBSmY4fhDFdHGej2TAv49c/VZ66sP3mUX/fmcj1CndqR5JyxDpdYSIeb
	447yfzzG6byHOIH2Y+hiUdeYfUu5GgjjA6QQvdyVsL1rv4KCHOgDhpS63qwByDScxodq5zJISZi
	4t3XrhwJLrWtPYrKt5y/DG8r9gDNa4eQCgquR6fBqc8H2KfQhh/S2/rRgEDvmhdtAFvHmpSziwP
	05EGEmu5lLew0yB53y4qpJ1tAJqx/AH5jKhy8aNkKdcbjd/Y243i6t9726/wCj7e4TSwsn6ZF5q
	i6tJvnP/j8EDLZGd00bjiF9gH03FhBH7XV/2vNzrbSxiEoVcKRsij+8u3mdeTczByHrjbAn3Q3m
	xLBFVzO/FQutfvg5cFAAVVSj8Mvs0WIdCdshFQ/frJCx+wGs6nakpzXBlu5vFrQZgtLLn5NwpfJ
	i3Y4kGbbYmrWEvKBckJ/gzeipuTHObbJBJLaUd1e9U=
X-Received: by 2002:a05:600c:1c0a:b0:499:a79a:694d with SMTP id 5b1f17b1804b1-499dc6f532amr150493855e9.4.1787844133498;
        Thu, 27 Aug 2026 08:22:13 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 21/39] xen/riscv: resolve the faulting guest physical address
Date: Thu, 27 Aug 2026 17:21:05 +0200
Message-ID: <c7975a131c229c721b2d4fe81c13fecd8deb4329.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1787844134-1F66C757-BC7A22B6/10/73395122804
X-purgate-type: spam
X-purgate-size: 3536

Take the guest physical address from htval and stval: on a guest-page fault
htval holds it shifted right by 2, so that an address wider than XLEN fits,
and stval holds the faulting guest virtual address, whose two least
significant bits are those of the guest physical address. The shift is done
on paddr_t rather than on the raw register: a guest physical address is 34
bits wide on RV32 with Sv32x4, so shifting an XLEN-wide value would drop its
top two bits.

Those two low bits come from stval only for a fault on an explicit access.
Where one is taken on an implicit access made for VS-stage translation htval
holds the address of the VS-stage PTE which could not be read, while stval
still holds the guest virtual address which started the walk, and the low
bits of the address written to htval are zero instead. htinst tells the two
apart, which is what the spec points at it for.

stval needs no check against an ISA extension: a guest-page fault writes it
with the faulting guest virtual address regardless. Sstvala would not be the
right thing to test for either (it covers stval across every trap type
which writes it, a wider guarantee than what is needed here).

htval does need one. The H extension lets an implementation write it with
either the faulting address or zero, so without Shtvala a zero htval cannot
be told apart from a genuine fault on guest physical address 0-3, and the
address has to be recovered by decoding the access and walking the VS-stage
page tables in software instead. That is left as a TODO, and until it is
written such hardware panics rather than acting on an address which may not
be the one which faulted.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/emulate.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/emulate.c b/xen/arch/riscv/emulate.c
index f9da0751049c..ff530ef2df74 100644
--- a/xen/arch/riscv/emulate.c
+++ b/xen/arch/riscv/emulate.c
@@ -9,6 +9,7 @@
 #include <xen/sched.h>
 #include <xen/types.h>
 
+#include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/current.h>
 #include <asm/emulate.h>
@@ -62,10 +63,28 @@ static bool htinst_is_pseudo(unsigned long htinst)
     }
 }
 
-/* Reconstruct the guest physical address of the access which faulted. */
+/* Resolves the guest physical address the access faulted on into @gf->gpa. */
 static void resolve_faulting_gpa(struct guest_fault *gf)
 {
-    BUG_ON("unimplemented");
+    /*
+     * A zero htval is either a genuine fault on guest physical address 0-3, or
+     * an implementation which does not report the address at all; only Shtvala
+     * tells the two apart.
+     *
+     * TODO: where it is absent, recover the address in software rather than
+     * giving up.
+     */
+    if ( !gf->htval &&
+         !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_shtvala) )
+        panic("Shtvala isn't supported by h/w; s/w VS-stage walk required\n");
+
+    /*
+     * htval does not carry the two low bits of the address: for an explicit
+     * access they are those of the faulting guest virtual address in stval,
+     * and for an implicit access made for VS-stage translation they are zero.
+     */
+    gf->gpa = ((paddr_t)gf->htval << 2) |
+              (htinst_is_pseudo(gf->htinst) ? 0 : (gf->stval & 3));
 }
 
 static int emulate_load(const struct guest_fault *gf)
-- 
2.55.0


