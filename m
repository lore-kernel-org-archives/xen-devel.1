Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAF7606A331
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PxmIvC+d
Received: from list by lists.xenproject.org with outflank-mailman.1487726.1690030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWl-0002mJ-Ro; Fri, 13 Nov 2026 15:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487726.1690030; Fri, 13 Nov 2026 15:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWl-0002kO-DC; Fri, 13 Nov 2026 15:49:23 +0000
Received: by outflank-mailman (input) for mailman id 1487726;
 Fri, 13 Nov 2026 15:49:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWj-0002Op-Ea
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWi-00Gq2H-RQ
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:20 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7317c-8faa-0a2a0a5109dd-0a2a4504de74-12
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:20 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73180-b57f-0a2a45040019-d155dd32d853-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:20 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-498f5fa5103so491968f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:20 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:19 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584960; x=1795189760; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEBERiYN6LLhbwlA+LpmBTjwG2JLfx1byEXTF0knQac=;
        b=PxmIvC+dsRIduop/iY86ny2pIgqjnqbP0pEh7l1XLRY0aN65MNIdDrMzr09fp6o7ex
         GQwp6EWa8Z5iB+rF3mqI8mSOsup3xjzxaHW2Non6UikCbvaCSIgyI992qAv+PMvmbwzr
         YLLScEYkJuCqAoUSlFlX0UH6HBlQiNExGlLQ/NhfTlR8TuYzx6NwShlON7vos1DqigiH
         4tSJ2KWIiSYoNn/36x20BB5jOvUOwwYsSXDno6dwBlUCws662CSrMZom8IVenqwKLNri
         +1BDiLWEqjSKe+vO7CXsi9fYB7UpfFkSNqbGdMMFVZj/99NTFACAOBx1osjtg0MrKmoi
         GaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584960; x=1795189760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEBERiYN6LLhbwlA+LpmBTjwG2JLfx1byEXTF0knQac=;
        b=mV0uP01nLUK4a2am0IN0s7n1AODFgM4SPjvNDRIwvUzWGJ1iRmqPr0mkea+X365WMt
         6T0jmole6vTMWBBzkPpZi/W/K4MeeHXQXsKhiLibsKkYlJ0lhcFntTD/QBBV+R/vPh4X
         Ysq4G5Fu1Gt8mmXPOx47RW4Y5ksqljI0xTVdk/IUXF88f02niUSpCkxfas9GvCOHLDfT
         KKL1LbJLq0we8lvQb284vmYaXPITO4SOlej69CjjcNkNn404y4mPa65/vcRRDtMe5yy3
         zXYWxnaMd+gGk9nKqUFzudya2NtFbSFVpqxwmaLgGl7xet9NYQd0NMuovm0K9qWx6Tu7
         voSA==
X-Gm-Message-State: APuU4Z/sTKhENc7FCEvu8Fb1hSev2v4XnSz+8DiQYed4RkmtvKdFcVul
	/KSoTQTOnrOI6YOvh1l5b1N6Ra7u7wHqcGM7YnwKGzuQFeIfDoJJEO6Sal0vEg==
X-Gm-Gg: AYBFou2/lJQ4K+sgOgEUiHmlXTFuhlZJSVH039khkwJqUoUIue3RBcMVYGmdTLtWC5A
	vo3lIxusF2OjIhiiBeRyYKxcYDzrk8K4fCJTpViflBbNRcGEScNs0oJRkWr7q9sldVr8JDUK/Bf
	6ZLwslDtMPRM+e1W7ecjY8+mMfdGQ6pApCrQnJYV1tcqsscQ1lSQKHNcbYrescS81v3TrZK9umA
	V1IDzXFX6DL3KxO+t+bcuzSuupLn049icMEgIivzNoB6AKkSYzZJCvxTq5VA/b2FF7Rm5RHtGil
	+tmk8QBmL2ltPi9apO2M+6WToizTjviqM8hS61WGv5P2Hxu4Gj1TrFAc184c+Yk5VPb/IZQf/CC
	KDfYFx4jNGOD3m+LoVeZL+ap8t9EX9JFSbkb4te+fiQ+rhNTvUfP1dUfRkSfSblRyXmRsW22Dlc
	PtIjxYd1wIlF/WPMcrcTfsGfDH4aPkE1mCSNwFXF8fETdOStDJbYYf7v1ji9mgan4MBghAiRyln
	B3ajywNOPjLNvjT3VIZDCF5L+2fLOx1u37AMC6c6rxi4+8Kqj4FBhn3bfZGAIQUcZKzLkkJDNBQ
	lfCSPJWycELE9RyYq7z2Vizhg679LbKWVD/zoYq4arb2Xy0bBCget5vSrwvcP/tyER0L
X-Received: by 2002:a5d:5f03:0:b0:491:e062:383d with SMTP id ffacd0b85a97d-49c7390fb5emr6061432f8f.57.1794584960144;
        Fri, 13 Nov 2026 07:49:20 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 12/42] xen/riscv: save and restore vsiselect on vCPU context switch
Date: Fri, 13 Nov 2026 16:48:33 +0100
Message-ID: <b333cad2f63635f3de7c4ebbc9510ee7c452f024.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1794584960-520D5B50-D9F02C26/10/78276251493
X-purgate-type: spam
X-purgate-size: 4576
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

vsiselect isn't saved/restored, yet the guest writes it directly
(VS-mode accesses to siselect go to vsiselect). After a context switch a
vCPU therefore sees the selector left by the previous vCPU on that hart:
a guest writing siselect, getting descheduled, then accessing sireg hits
a register it never selected, and it can observe another guest's
selector value.

When Smstateen is implemented, access to vsiselect and vsireg is gated by
hstateen0.CSRIND (bit 60, SMSTATEEN0_SVSLCT in Xen's headers), and
v->arch.hstateen0 holds the bits vcpu_csr_init() ended up with. A clear
bit there covers the two cases in which the CSR has to be skipped:

 - Xen didn't hand the guest access to it, so the guest can't have changed
   the CSR and there is no state to preserve;
 - M-mode denied the state altogether. Smstateen makes a bit which is zero
   in mstateen0 read-only zero in hstateen0, and a zero bit in mstateen0
   traps accesses from every privilege mode less privileged than M-mode,
   HS-mode included, so Xen couldn't even read the CSR to save it.

Without Smstateen no bit controls access to the CSR, so it is saved and
restored whenever Ssaia is available.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - Reword the commit message.
 - Add Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v3:
 - Rename from "xen/riscv: save and restore AIA state on vCPU context
   switch", as only vsiselect is switched now.
 - Save and restore only vsiselect: drop hviprio1 and hviprio2.
 - Rename vcpu_has_aia_state() to vcpu_can_access_vsiselect() and drop
   its hstateen0 bit argument.
 - Move switching vsie to uint64_t and csr_{read,write}64() to "xen/riscv:
   implement vCPU context switching".
 - Update the commit message.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/domain.c             | 28 ++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 9feeaa59b887..089d968ace27 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -329,6 +329,28 @@ int arch_domain_create(struct domain *d,
     return rc;
 }
 
+/*
+ * vsiselect is a per-hart CSR, but a guest changes it on its own: when V=1,
+ * VS-mode accesses to siselect are really accesses to vsiselect. Hence it is
+ * part of the vCPU context.
+ *
+ * When Smstateen is implemented, hstateen0.CSRIND (SMSTATEEN0_SVSLCT) gates
+ * that access, and a bit staying clear in v->arch.hstateen0 (see
+ * vcpu_csr_init()) means either that the guest was never given access to the
+ * CSR, and so can't have changed it, or that M-mode denied the state
+ * altogether, in which case the CSR can't be accessed from HS-mode either.
+ */
+static bool vcpu_can_access_vsiselect(const struct vcpu *v)
+{
+    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
+        return false;
+
+    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
+        return true;
+
+    return v->arch.hstateen0 & SMSTATEEN0_SVSLCT;
+}
+
 static void csrs_ctxt_switch_from(struct vcpu *p)
 {
     /*
@@ -347,6 +369,9 @@ static void csrs_ctxt_switch_from(struct vcpu *p)
     p->arch.vscause = csr_read(CSR_VSCAUSE);
     p->arch.vstval = csr_read(CSR_VSTVAL);
     p->arch.vsepc = csr_read(CSR_VSEPC);
+
+    if ( vcpu_can_access_vsiselect(p) )
+        p->arch.vsiselect = csr_read(CSR_VSISELECT);
 }
 
 static void csrs_ctxt_switch_to(struct vcpu *n)
@@ -368,6 +393,9 @@ static void csrs_ctxt_switch_to(struct vcpu *n)
     csr_write(CSR_VSCAUSE, n->arch.vscause);
     csr_write(CSR_VSTVAL, n->arch.vstval);
     csr_write(CSR_VSEPC, n->arch.vsepc);
+
+    if ( vcpu_can_access_vsiselect(n) )
+        csr_write(CSR_VSISELECT, n->arch.vsiselect);
 }
 
 static void ctxt_switch_from(struct vcpu *p)
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 63e34c1a11ab..c424e2428f60 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -73,6 +73,7 @@ struct arch_vcpu {
     register_t vscause;
     register_t vsepc;
     uint64_t   vsie;
+    register_t vsiselect;
     register_t vsscratch;
     register_t vsstatus;
     register_t vstval;
-- 
2.56.1


