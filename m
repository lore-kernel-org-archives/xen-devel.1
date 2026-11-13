Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCC5606A323
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zZO4ZT+0
Received: from list by lists.xenproject.org with outflank-mailman.1487733.1690065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWt-0003ym-2c; Fri, 13 Nov 2026 15:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487733.1690065; Fri, 13 Nov 2026 15:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWs-0003wA-Gx; Fri, 13 Nov 2026 15:49:30 +0000
Received: by outflank-mailman (input) for mailman id 1487733;
 Fri, 13 Nov 2026 15:49:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWp-0003WT-VA
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWp-00AqRw-BG
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:27 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73173-8faa-0a2a0a5109dd-0a2a4501b498-42
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:27 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73187-5984-0a2a45010019-d155dd32d149-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:27 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48e46e449e8so1106019f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:27 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:26 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584967; x=1795189767; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNW+8nHSjGDgI0RVei5GYOWt9QmQ3haVO5iiswwoBL0=;
        b=zZO4ZT+0jeIzMq0zpWeqAyLgcKzrcei+XOvO3o5JgXJtAr3Mp+cbQSpibGixPqIqJb
         HJvgtKzr8f8vKNkflgZ+oK5E3k94L3J/jPvrFjSDKE4d1UsTHmfpU3KqCmVz2HM15vJH
         NV+uWAdwufJJW/LaAZcJ1fcGzhSKWfXvMz9cfW8zjyL7iE7NVEd3UXw+X6qy+Exmddtg
         8H5SW5m2zvStYSNDVJ6DF7XT6VB0NhdUMU3G6GuDyQlud8Fudm/bXRVtP7UVolxHpxvL
         g6vuYMqE6SQ7x2me6eXSowiKooSQnunwOmEW1mwkrsdFJTKnN6Cx0PpO+O5hZiwsEAub
         2cWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584967; x=1795189767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNW+8nHSjGDgI0RVei5GYOWt9QmQ3haVO5iiswwoBL0=;
        b=eNOvP09yA5Ib/PVQeCVaLxCSmLpm7joEEdbnWCLHIeKXoEeWDgDY/UhEdo0Pv0P3HA
         JWok2W9vxUnLKtiL8Tt3FCvAcp31XRxgbs7WglmHBt1hF7azx+knp8C5T3Dj2HXrTj/5
         OYNPAxTulhsVZQyZyAPBct6DW8h1i2dUt4qrK3iVOoJkSVlVJJN9v/D1npywpeZlIkFJ
         lE+qycNg5YXDpW7G7iT+LtfD1FciI9cYtgWvKZq6oT6qKu6ZNTLWxvmxlsBRlyJ+F52i
         WwNN9CPei2vcZp4P0+WBg/F3PkxXDFZEjpnrHeIJZkDOF7VCM06MM9riIEs3ltod7h9m
         IODw==
X-Gm-Message-State: APuU4Z9mkpy4Nmeny0DUxXw3aN00nK338CeLVFZWiP2LoFCohggYyGC4
	GAlQW67AchqexaItVesN7sq9IhFAbBlozizjvXrjPx3HsHL2Y0s1kE34BbtMDw==
X-Gm-Gg: AYBFou2HyvCqRx9yWRkN6wXrkOP6lkS/eewKtpbCxRZ6KR1ifze2XxeJQqIynipck81
	CHkUqpi+CIuvtjHxIQOuztpy6FokMYznXJ+APZbTukGCm6GCDOM6eJ2Bo3Cmx/Gy+mTqNVG0aIG
	DGJMrBwrjDeKBhRRgmDIwaLpiRPeIMAm0N/bw0Xz6r7k1Nwl7m/rDvDLyaByp7zxDsRuJ5cEfKa
	scACeeH5R2y/45+hi7oj2x0PPK2gfYnN03ocyTEBYBDr9hwJYoyP45NTbZDdRtFPV7mt5lnLnvE
	OACRyoJOBEbabm24U9gFhWO52qQuY5H2lGEVk3amb/qvxYxELBokBn3ZwfdZmQroy/g8jdSOXho
	ghF+FyuqGr2Axm4yaNIWOR8Z/iciGVVjs3ew2U0iR987PsorbeZp93AXo0dz+ESqYZuPxRjn50U
	tXnuwVz10dPMSnqokKI30FIAEige0VFeaYTri6vJ1XISOrEvxkVrboQxABgMtd5oSW6A6xY+0zo
	DoBButY1SeOojqNtFZo8s7YRDeqLlec/ZvICv8/7uPqG3pjJ0JBohDaC8lOIIGSVCJq5gln1Kzj
	J8ZepXK5ZOl7xp96EP/nD2yHMXFI/xGYA7NccRkDEMlBMJSS1lCA/MJIFcrEywxFgeE1
X-Received: by 2002:a05:6000:24c6:b0:491:273c:9649 with SMTP id ffacd0b85a97d-49c70b051dcmr7406397f8f.15.1794584966589;
        Fri, 13 Nov 2026 07:49:26 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v4 18/42] xen/riscv: resolve the faulting guest physical address
Date: Fri, 13 Nov 2026 16:48:39 +0100
Message-ID: <9529be069aee52d73357839771ae96c7b2239389.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1794584967-C5540757-B1DEAD33/10/73395122804
X-purgate-type: spam
X-purgate-size: 5216
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Recover the guest physical address from htval and stval. On a guest-page
fault to hypervisor, htval holds the guest physical address shifted
right by 2, so that an address wider than HSXLEN fits, and stval holds
the faulting guest virtual address. Shift htval back left by 2 and take
the two low bits from stval. htval is first converted to paddr_t, then
shifted: a guest physical address is 34 bits wide on RV32 with Sv32x4,
so shifting the XLEN-wide register itself would drop the top two bits.

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
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes in v4:
 - Update the commit message.
 - Add Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>.
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
index 14212ed62f99..283aa49a3b64 100644
--- a/docs/misc/riscv/booting.txt
+++ b/docs/misc/riscv/booting.txt
@@ -35,3 +35,14 @@ Other extensions recognised by Xen are listed in riscv_isa_ext[] in
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
index de8c09fe1505..d661ef0bf204 100644
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
2.56.1


