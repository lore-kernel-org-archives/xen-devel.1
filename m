Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BADCA5FCC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437556.1656558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6X-0005ON-5J; Wed, 30 Sep 2026 16:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437556.1656558; Wed, 30 Sep 2026 16:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6W-0005NQ-Rb; Wed, 30 Sep 2026 16:24:24 +0000
Received: by outflank-mailman (input) for mailman id 1437556;
 Wed, 30 Sep 2026 16:24:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6V-00059i-KW
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6V-00GhY9-1O
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:23 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b7-8faa-0a2a0a5109dd-0a2a4503edf2-0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:23 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b6-fae8-0a2a45030019-4a7de18dd322-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:22 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912e4b11so33222555e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:22 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785462; x=1791390262; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y85EkaaCMNDVlRXtbC0r51vx5KgR2UBicrOOiZxzrlI=;
        b=P2pLWGne6JHCwixS8jw79U4sTzBnenkxZUwMLhl2xgEiwMeGTZQ99sKWYsVihBHgMt
         trSlNyue5hpcqSvKr12AqiJeRFXkZuVYjr+9A91ttd+ZnMtAAShDq6wczyZ/Pc/ok2sx
         N0CecZ53+7kmAKmffYFMNDWf/a6kywIw90TJETFsNIk043fFMqB5fSz+QCsJBX7wGgS5
         l32aoM1NjtPvSy+8GvbJkTdJL0MZMXeH5YlWaUNgVOr/u36T3mllSa118Pmk7xlzTQ/w
         ywwD1RRoTqFYfgWV3bOAb/623DTLkQrzbf4rk9sb1Sjn025e1ih3r0dKBNl8oeISgoPo
         UoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785462; x=1791390262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y85EkaaCMNDVlRXtbC0r51vx5KgR2UBicrOOiZxzrlI=;
        b=RmUgjtYl8b7nkaFsCCRpPjPC8AAQhjxdajPPNhpv3BSiDRhxcSYNhCgtcQA2hOhTsr
         nw/9UNtfxr6bM1kg2mlNMnpZPzcFG7dmUylzQo4hQBkwa2n61k+WlaFWJ5SkshRkjUCO
         5HI8irs77w8D8sFZRasv+EwxRdCaI+PiQfETlSRyvR2zw4Vv1W5GYljnpSvQkJRf0kwu
         ktT8BEWlvAhUENkA8MmxfaQxvjrG0BBqwShsrGXDEkCURLnyvKC0+5/fMxv+SgoZFGhJ
         fLvs/zTPzvqEYxR+A4qfgXSHH4lqzwcuPfXt0Wf+rmYnWgyTN0ruC/C0XGtuj5ylAFuT
         U/4g==
X-Gm-Message-State: AFuF++lNr12pcrdzwGHhLwFoJ8oHgyZPD+1TWOuHMxdCf0FuTdrxJV9u
	VVeEmJjDhExx7yAqjKvf0Ds0KNL1YVrHpR3QVtAGLQvAxPI0NMOv1Gk9SinDvg==
X-Gm-Gg: AYBFou3bFfKgWMhn7IrAAfja/D6GawejLsPDngB3Jmy8iITtIke6TE4JV3aHDA+PQXK
	YR43OVVRKVntYg4Ai3xmAvpqmX2RVZV1Fp8R0pRTvEM/gsIkRsiy284RUkCLjS7A5JfjoolL6Mh
	P7OTEqdGk8t3El52hoBrO9c16ElfzK1Do+OGUq70+jMvnyAwt5eR6eu+lvnlf0oKx1UPL+p5X1N
	fLhM8XzJ6x5iwAY348zHODmMexzRJ4A0QmIAwTXaIwLqkU102AmEKQvK3LcRXSRAGDKNZMqsz+I
	D9vZ4se81YE1SjGD1xQ+HjPN6OJ97BK7YQLTkiLYUY+i5WFL8BjAqDpVL9/3BAzgugQGCmWVJAF
	NBCNX8mIfkZZzfj57BsooUX1tm9Rd4g4XUcCJsjOrkhbGEZLuJybNpAhlj6yQlkzpYQKXFNSoAP
	NcEysQDp6/fvb9fHA+GAHD9ANyVtmjn76aT2EWuztj3xlu4wE/9jFO1cyuHoV3CduyEIF8uxwtO
	dhk/A+uVZsALoRh12JjbAue4iwu+ukwz/Hge20f
X-Received: by 2002:a05:600c:6815:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-4a01ade9aa5mr36195235e9.13.1790785462292;
        Wed, 30 Sep 2026 09:24:22 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 20/39] xen/riscv: resolve the faulting guest physical address
Date: Wed, 30 Sep 2026 18:23:39 +0200
Message-ID: <f828fe51cde79f10632094067c82a7fc6f05391f.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1790785463-754844E9-0E833DDF/10/73395122804
X-purgate-type: spam
X-purgate-size: 4973

Recover the guest physical address from htval and stval. On a guest-page
fault to hypervisor, htval holds the guest physical address shifted
right by 2, so that an address wider than HSXLEN fits, and stval holds
the faulting guest virtual address. The shift is done on paddr_t rather
than on the raw register: a guest physical address is 34 bits wide on
RV32 with Sv32x4, so shifting an XLEN-wide value would drop its top two
bits.

However, there are two cases to distinguish when recovering the
faulting GPA:
- Explicit memory access: the two least significant bits of stval are
  the same as those of the guest physical address.
- Implicit memory access for VS-stage translation: the two least
  significant bits of the guest physical address (GPA[1:0]) are zero.
These two cases can be distinguished using the value provided in
register htinst.

stval needs no check against an ISA extension: a guest-page fault writes it
with the faulting guest virtual address regardless. Sstvala would not be the
right thing to test for either (it covers stval across every trap type
which writes it, a wider guarantee than what is needed here).

htval does need one. The H extension lets an implementation write it with
either the faulting address or zero, so without Shtvala a zero htval cannot
be told apart from a genuine fault on guest physical address 0-3, and the
address has to be recovered by decoding the access and walking the VS-stage
page tables in software instead. That is left as a TODO; until it is
written, such a fault crashes the domain rather than acting on an address
which may not be the one which faulted.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Update the commit message.
 - Drop panic() inside resolve_faulting_gpa() and return -EOPNOTSUPP +
   printk_once().
 - Leave the comment above resolve_faulting_gpa() alone: it already says
   what the function does since "xen/riscv: add guest page fault handling
   stub".
 - Document in docs/misc/riscv/booting.txt why Shtvala is recommended.
---
Changes in v2:
 - New patch.
---
---
 docs/misc/riscv/booting.txt | 11 +++++++++++
 xen/arch/riscv/emulate.c    | 27 ++++++++++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/docs/misc/riscv/booting.txt b/docs/misc/riscv/booting.txt
index c99ccafa7485..f90d8603ef57 100644
--- a/docs/misc/riscv/booting.txt
+++ b/docs/misc/riscv/booting.txt
@@ -38,3 +38,14 @@ Other extensions recognised by Xen are listed in riscv_isa_ext[] in
 xen/arch/riscv/cpufeature.c. Xen uses them when present, but they are not
 needed to boot. The second column of that table says whether the extension
 is also exposed to guests.
+
+Some of them are nevertheless recommended, as functionality depends on them:
+- Shtvala:
+  Guarantees that htval is written with the faulting guest physical address
+  on a guest-page fault. Without it an implementation may write zero instead,
+  which can't be told apart from a genuine fault on guest physical addresses
+  0-3. Xen needs that address to emulate a guest's MMIO accesses; recovering
+  it in software (by walking the guest's VS-stage page tables) isn't
+  implemented, so on such hardware a guest-page fault reported with a zero
+  htval crashes the domain. See resolve_faulting_gpa() in
+  xen/arch/riscv/emulate.c.
diff --git a/xen/arch/riscv/emulate.c b/xen/arch/riscv/emulate.c
index cc4b1fc54054..a579bc4b8a15 100644
--- a/xen/arch/riscv/emulate.c
+++ b/xen/arch/riscv/emulate.c
@@ -9,6 +9,7 @@
 #include <xen/sched.h>
 #include <xen/types.h>
 
+#include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/current.h>
 #include <asm/emulate.h>
@@ -58,7 +59,31 @@ static bool htinst_is_pseudo(unsigned long htinst)
  */
 static int resolve_faulting_gpa(struct guest_fault *gf)
 {
-    return -EOPNOTSUPP;
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
+    {
+        printk_once(XENLOG_WARNING
+                    "Shtvala isn't supported by h/w; s/w VS-stage walk required\n");
+        return -EOPNOTSUPP;
+    }
+
+    /*
+     * htval does not carry the two low bits of the address: for an explicit
+     * access they are those of the faulting guest virtual address in stval,
+     * and for an implicit access made for VS-stage translation they are zero.
+     */
+    gf->gpa = ((paddr_t)gf->htval << 2) |
+              (htinst_is_pseudo(gf->htinst) ? 0 : (gf->stval & 3));
+
+    return 0;
 }
 
 static int emulate_load(const struct guest_fault *gf)
-- 
2.55.0


