Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D63606A334
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtbSz+cX
Received: from list by lists.xenproject.org with outflank-mailman.1487792.1690182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXN-0001BA-Pi; Fri, 13 Nov 2026 15:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487792.1690182; Fri, 13 Nov 2026 15:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXL-00013E-Ol; Fri, 13 Nov 2026 15:49:59 +0000
Received: by outflank-mailman (input) for mailman id 1487792;
 Fri, 13 Nov 2026 15:49:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtX7-0006dN-5l
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtX6-003hR2-Ge
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:44 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73193-e002-0a2a0a5209dd-0a2a4506dcbe-14
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:44 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73198-195a-0a2a45060019-d155dd32f1bf-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:44 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-492f563d1c6so781337f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:44 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:42 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584984; x=1795189784; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5O5MkX82RVqTl+uMikrtTaDd/FmMtvBPQZUwtMFuzKk=;
        b=qtbSz+cXNpLmHraTk9QUcATBjscUbUiKpBvnMXByLr1m4eQAT9gdMkdbAkwowNW1hF
         ehOpbWhQb/Sb6mWMXh2m8BW4mG+l79D3Xu1q2C/ebM6MvY95WFbH2OQer/disaSzOELL
         F4oOdyaQtAR3UsXjKILlzB8TGxw5LwPL15kxH4kNDksZVKXsTKmUBKLRPbWw4T1BYCFs
         UT2D5G5j8aCdWSyoLRmKEKWYbXBH+i98h25gtk70cE1iDUEo9s7IOy3gRlrX//EysONS
         dUt/k+MB7iMclUOaK/KxFKjJP6fH7Lt7FkvQv/LJM2dMAO6HiNh2iWosofnN/DB0ucmC
         zq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584984; x=1795189784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5O5MkX82RVqTl+uMikrtTaDd/FmMtvBPQZUwtMFuzKk=;
        b=GaybQFxyp/pzOZrYOu8jadbUGrSQJAmdetniZCnT6h6Al5rrVbR0WcbK2uMW4ZvzpC
         divOYzLlK751oyhGlSEYYzgNQHj54I7tBRE61px2GoeeMFc905AQOJKiwi2gTQUwDrPS
         qBRac3ziF+Bxnow/kSk3y/ChIbXCJux4WQ/ldWvNDBebhbZ7fgyGu/K46xXb9h5mziyD
         OhNRke674XRIYTFlLx9BdiTAbeu9V3Arks/g+ZRTd/WDZ7y1xLIfeQ5/s/xatMiaPbKA
         U/UPX9/ynQMHEKGRrpn+GNtCDip8wOhKMmQod1ZDGGoFB3jd1n3++jqe+8ORaeYCBjeN
         eJxw==
X-Gm-Message-State: APuU4Z/JAE6CZ3yhu8nBPfbLkSjExgAFLU4tNJeyqMMh+o2PcV1Nxk8B
	Fy2sD/QKf+5+bKOGB1YoFfAx+zPVvP5RVIasce2MiLqv4+vo9IjuHg2M40i0gg==
X-Gm-Gg: AYBFou1gMaho9xxBODVU+R9s5hk2gg1Uei2JnE3GXauSnM9IczcnDBErXFimK2993PQ
	Zttf4xDGBkY+euoLDKgp6c3hBx8Fhi37Kwb8DRkMDSemtICwrREkA62Z1dr+NtQ7ZpeAu93V4St
	MyJcioUlp3oyuM2deKLt4zf3bzHMFXf5uETDAKfvbQmjEUXcVuHFJVY8RamAC2LKh0gmTNbYchI
	kSGXomrUrUlJ8D15RQUEwCa8zZKoEO8WSftMD/Q4aSLoRRO40ViVxEvIJJBB3NoZPHwPu68O0Zk
	2mx+IigKhakZgPrGLe4hJ/xsvezMnleYdw4Yb/gFBj/eANn7MnvTf0qCCWtRHeFqqU6P2HN8AsM
	DUqCZ7NZv04dwBFGmSBsPfnNKTOaz47JVsYBNML59LwJgheD7tn6VEv+uaFyOe3vnH2Qy97tIDg
	PLCYd2mlmmvWFEvhsM4KRuKiiirfjk6M4RiXN77nCaOg9+JtuXn8D5kp5GzpiZ90a/7qXkYShGh
	PeDOj2q+22DXJtPIDPL1GpUT/9wJpKkNg+oVTX8t6F9XXLZKJT3MYjjdfd6PmZxs9+Qvh7arMqz
	bie6AnEmOsOYTdZML5YY42ThVEUpfABu0pAxca+sIF+YZ6zIRzw5hUjG9C7Uds9HXcg/
X-Received: by 2002:a05:6000:46c2:b0:48f:db47:6ebf with SMTP id ffacd0b85a97d-49c729bb31fmr4551391f8f.38.1794584983394;
        Fri, 13 Nov 2026 07:49:43 -0800 (PST)
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
Subject: [PATCH v4 31/42] xen/riscv: introduce imsic_migrate_vcpu()
Date: Fri, 13 Nov 2026 16:48:52 +0100
Message-ID: <9fc0a0e78859f22b93b2ed222c684425733676fd.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1794584984-FD80D77B-420970F3/10/73395122804
X-purgate-type: spam
X-purgate-size: 4167
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Moving a vCPU's guest interrupt file to the pCPU the vCPU has been
moved to follows "Migrating a virtual hart to a different guest
interrupt file" in the AIA spec: take a new file, retarget the
interrupt producers to it, synchronize with them, move the state of the
old file into the new one and point hstatus.VGEIN at it. That is a
sizeable sequence, so it is implemented step by step, and
imsic_migrate_vcpu(), introduced here as its entry point, is
deliberately a stub for now: the move itself is left as
BUG_ON("unimplemented").

The function has to be called by the vCPU itself, right before it
enters the guest: as long as a vCPU runs on a pCPU, it can neither run
on nor be moved to any other one, so its file can't be in use elsewhere
while it is moved. An ASSERT() checks that the vCPU is the current one.

What these requirements already allow is to tell whether there is
anything to move at all: the file has to be moved only once the
scheduler has moved the vCPU, not on every entry to the guest. Return
early unless the vCPU's h/w interrupt file belongs to a pCPU other than
the one the vCPU runs on, as told by the new imsic_vsfile_needs_move().
A vCPU without a h/w file has nothing to move, as s/w guest interrupt
files aren't supported yet: such a vCPU is one which couldn't be given
a h/w file, e.g. as imsic_vsfile_attach() failed and crashed its
domain. vsfile_cpu is read without the lock: once a vCPU runs, nothing
but the vCPU itself changes it.

Nothing calls imsic_migrate_vcpu() yet.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - New patch, replacing "xen/riscv: handle the case when no vCPU
   migration is needed": the vCPU's interrupt file is now moved by the
   vCPU itself on its way back to the guest rather than from
   arch_move_irqs(), so what has to be told first is whether the file
   belongs to another pCPU, rather than whether the vCPU has run yet.
   Why the file isn't moved from arch_move_irqs() is explained in more
   detail in "xen/riscv: introduce arch_move_irqs()".
---
---
 xen/arch/riscv/imsic.c             | 37 ++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/imsic.h |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 3d947226f371..48214ab0d363 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -1070,3 +1070,40 @@ void imsic_vsfile_attach(struct vcpu *v)
      */
     imsic_vsfile_set_vgein(v, hgei);
 }
+
+/*
+ * Whether the h/w guest interrupt file of @v, the vCPU running on this pCPU,
+ * belongs to another pCPU, i.e. has to be moved here by imsic_migrate_vcpu().
+ * A vCPU without a h/w file has none to move.
+ *
+ * No lock is needed: vsfile_cpu of a running vCPU is changed only by the vCPU
+ * itself, when it acquires a file in imsic_vsfile_attach().
+ *
+ * TODO: a s/w file, once supported, has to be moved too.
+ */
+static bool imsic_vsfile_needs_move(const struct vcpu *v)
+{
+    unsigned int cpu = ACCESS_ONCE(v->arch.vimsic_state->vsfile_cpu);
+
+    ASSERT(v == current);
+
+    return cpu != CPU_NONE && cpu != smp_processor_id();
+}
+
+/*
+ * Make the h/w guest interrupt file of @v belong to the pCPU @v runs on.
+ *
+ * Has to be called by @v itself (see the ASSERT() below), right before it
+ * enters the guest: as long as @v runs on this pCPU, it can neither run on
+ * nor be moved to another one, so its file can't be in use elsewhere while
+ * it is moved.
+ */
+void imsic_migrate_vcpu(struct vcpu *v)
+{
+    ASSERT(v == current);
+
+    if ( !imsic_vsfile_needs_move(v) )
+        return;
+
+    BUG_ON("unimplemented");
+}
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 1f3ccfbccd1e..f7e537be29b4 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -133,4 +133,6 @@ int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id);
 
 void imsic_vsfile_attach(struct vcpu *v);
 
+void imsic_migrate_vcpu(struct vcpu *v);
+
 #endif /* RISCV_IMSIC_H */
-- 
2.56.1


