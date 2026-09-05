Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D569C624DB
	for <xen-devel@archiver.kernel.org>; Sat,  5 Sep 2026 07:25:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1409346.1641315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2km5-0002PP-Tk; Sat, 05 Sep 2026 07:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1409346.1641315; Sat, 05 Sep 2026 07:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2km5-0002PI-Qw; Sat, 05 Sep 2026 07:25:17 +0000
Received: by outflank-mailman (input) for mailman id 1409346;
 Sat, 05 Sep 2026 07:25:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x2km4-0002PC-Cx
 for xen-devel@lists.xenproject.org; Sat, 05 Sep 2026 07:25:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2km3-006zLp-J9
 for xen-devel@lists.xenproject.org; Sat, 05 Sep 2026 09:25:15 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9bc3c5-8faa-0a2a0a5109dd-0a2a4507932e-4
 for <xen-devel@lists.xenproject.org>; Sat, 05 Sep 2026 09:25:15 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9bc3db-b4ea-0a2a45070019-d155802bad17-3
 for <xen-devel@lists.xenproject.org>; Sat, 05 Sep 2026 09:25:15 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49b0dd3c9a0so15859365e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 05 Sep 2026 00:25:15 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee5f912esm215699955e9.4.2026.09.05.00.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2026 00:25:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788593115; x=1789197915; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtjlR+/HYPerpsAetYIT8+9GJJf3q+kJd7E3y9JB/is=;
        b=hLCm0+X3m/qgVjGvjYzUdjLsa5/6SaOQFTgf6xn9DQ6p8yLDmCO9qkMgRFbAyIm804
         pQZDSzGGvSHb4hxM2gIzwH4rlrObLMUp4fMpGjce16FJDWXVExFrgGQgJdjAfsd8SiOi
         tZtgJM6pcrQboTxbT3DlcJtx6LUqoE3aN7TrwMnaYbhmf0r9dqMd9ZIFmbJnR7DWmeBc
         mKVKCJPuZJGOJU+2sEdNcNWsYliH9I6bhG7beEwvfQGe9ri5hImq98hA20LX17ftJ4jY
         cR7J158F5FIvMMyQkaP9WHBydawbJM+uHfZZtd5e9ubi7anDeZb91lxF/bUqWYyHsCTD
         xOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788593115; x=1789197915;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtjlR+/HYPerpsAetYIT8+9GJJf3q+kJd7E3y9JB/is=;
        b=CDreJifHw6Sv42HKomUZE234v2r/csEFZtcwgd9Zs3rDPu9k+09LX9964bRh75cPtY
         uooV6HPiJG0vRRcxIA9Wf/usgzGtYqx4FX+Fs66Dt9/Y/uGj10qQt7CO/2AZl2RgPQK7
         Y6P9sUdXFXSeiwb69yri5Jf7yBAe0ijWH26OS+ctV9BgXePH2ipePBcTGWreV32ZIGeV
         0QJUxTjrPKz89UFBVc2UFMLmAFCJJNAHcf66wSfaXk3etjXtV5m8DemNu94x/XLZrArX
         vl53rHZBj4ZVgUeEwAYHYiBSZvEWaNAyzqlttr2XypvnTs2zqGcVChtQBTZL95ZsXKx1
         mBoQ==
X-Gm-Message-State: AFuF++nfKiJlMt9IhBOrrX7H9IeZBJj2Ri8GHit3f9wFIhMxs1NuvYaN
	uggcYPmdSNnHFHfrTgXjePXkeM7lJabw699FtKRjwgfXgv1k2/hWMzMvdAEu1w==
X-Gm-Gg: AYBFou13nLKJNrF0gmxr3emrJHg4zsxAYcKDPjJOKA+fkw8TPqM1HBBCn+aOFthoC6D
	CwrXbwst3/2e2houmC797KbNyGOT9ET5S+chkf360TWdN2GukB33vTmxNLKtDU86gc1rJqW+2yf
	oDOe8HciWmKv9IzRhopjwGne5XX2ngMkOlBKUl+eIDHNxezJnYCtHNnH9s+u07x80SGue+h8k4T
	h72RDZNOLOHJ9i3CGnp9vcfzNkdNubyYOV4Cg0FVmjXfDDzW0soYqV7So/ga4azIML9StQOWB+n
	XY9HmbLKpxJ96aF7scbOnh2rnllJdNWLF6r/9a994YXgWHfRHU0su8UwL6j3beOx/almnSE/ohL
	l7pE0O0Nscs2J8oim5FGhhW+ZVUh0YgVuBJBAUPG7kx0TEgz3cuHkXCB1rENMMS7Q8Jl8ZCIAJt
	cQCeEXtZzpJEuZyp5IepzFvyBZl+FHDLm2uXPfpSUQUAgj8qrjc+6tBmshC6CiAPvOWAk5sFn2i
	FHKr2t0Qr2HaJ7dHNEnlv8JXWhdxchaBjWQY1E=
X-Received: by 2002:a05:600c:a00a:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49cf81f6736mr198916385e9.6.1788593114809;
        Sat, 05 Sep 2026 00:25:14 -0700 (PDT)
Message-ID: <9267476f-c6a0-4cfb-b128-10c475d2d5a6@gmail.com>
Date: Sat, 5 Sep 2026 09:25:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/39] xen/riscv: implement vCPU context switching
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <8848874c69f00fbfcf6ad75a39e28479a4cdd08b.1787838835.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8848874c69f00fbfcf6ad75a39e28479a4cdd08b.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1788593115-A74D3AE4-0A5BEB25/10/73395122804
X-purgate-type: spam
X-purgate-size: 7997


I've updated the part of handling of VMID for p2m during context switch 
as some things were still missed. This one implementation looks more 
correct to me.

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 0ad851ee0f5f..c05d6f8abaaa 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -404,16 +404,6 @@ static void ctxt_switch_to(struct vcpu *n)
      if ( is_idle_vcpu(n) )
          return;

-    /*
-     * If this vCPU last ran on a different pCPU, invalidate its VMID so
-     * vmid_handle_vmenter() assigns a fresh one from the current 
pCPU's pool.
-     * Without this, two pCPUs could independently assign the same
-     * (generation, vmid) pair, generation counters start at the same value
-     * on all pCPUs and increment independently, causing TLB contamination.
-     */
-    if ( n->arch.last_cpu != smp_processor_id() )
-        vmid_flush_vcpu(n);
-
      vtimer_ctxt_switch_to(n);

      restore_csr_regs(n);
@@ -421,6 +411,15 @@ static void ctxt_switch_to(struct vcpu *n)
      p2m_ctxt_switch_to(n);
  }

+/*
+ * Domain whose p2m this hart's HGATP points at. ctxt_switch_to() bails out
+ * early for the idle vCPU, so HGATP survives a pass through idle and keeps
+ * pointing at the domain which ran here last. That domain, rather than the
+ * one the scheduler switched away from, is what owns this hart's G-stage
+ * translations.
+ */
+static DEFINE_PER_CPU(struct domain *, hgatp_owner);
+
  static void schedule_tail(struct vcpu *prev)
  {
      unsigned int cpu = smp_processor_id();
@@ -429,40 +428,88 @@ static void schedule_tail(struct vcpu *prev)

      ctxt_switch_from(prev);

+    write_atomic(&prev->dirty_cpu, VCPU_CPU_CLEAN);
+
      /*
-     * Mark this CPU in next domain's dirty cpumasks before calling
-     * ctxt_switch_to(). This avoids a race on things like p2m flushing,
-     * which is synchronised on that function.
+     * Switching to the idle vCPU leaves HGATP alone, so this hart 
keeps both
+     * the G-stage translations of its owner and its place in that domain's
+     * dirty_cpumask: p2m_tlb_flush() goes on reaching it, and a domain 
which
+     * idles between two runs on the same hart keeps its VMIDs.
       */
-    if ( prev->domain != current->domain )
+    if ( !is_idle_vcpu(current) )
+    {
+        struct domain *owner = this_cpu(hgatp_owner);
+
+        if ( owner != current->domain )
+        {
+            /*
+             * Once this hart drops out of the owner's dirty_cpumask it 
stops
+             * being a target of p2m_tlb_flush(), while its TLB may 
still hold
+             * G-stage translations of that domain: none of the vCPUs 
of that
+             * domain which ran here has had its VMID invalidated. Move the
+             * hart to a new VMID generation so that none of them can be
+             * reached again.
+             */
+            if ( owner )
+            {
+                vmid_flush_hart();
+
+                cpumask_clear_cpu(cpu, owner->dirty_cpumask);
+            }
+
+            /*
+             * Mark this hart in the incoming domain's dirty_cpumask before
+             * ctxt_switch_to() points HGATP at its p2m. This avoids a 
race on
+             * things like p2m flushing, which is synchronised on that
+             * function.
+             */
+            cpumask_set_cpu(cpu, current->domain->dirty_cpumask);
+
+            /*
+             * Pairs with the barrier in p2m_tlb_flush(). 
cpumask_set_cpu() is
+             * an unordered AMO on RISC-V, so without this a concurrent 
flusher
+             * could read the mask without this hart in it while this 
hart is
+             * already walking the p2m it is about to be pointed at.
+             */
+            smp_mb();
+
+            this_cpu(hgatp_owner) = current->domain;
+        }
+    }
+
+    if ( !is_idle_vcpu(current) )
      {
-        cpumask_set_cpu(cpu, current->domain->dirty_cpumask);
+        bool need_flush;
+
+        /*
+         * A VMID is meaningful only on the hart whose pool issued it:
+         * generations are per-hart counters which all start at 1 and 
advance
+         * independently, so the pair a vCPU brings from another hart 
may match
+         * this hart's generation by coincidence, leaving the vCPU 
under a VMID
+         * which is live here for someone else.
+         */
+        if ( current->arch.last_cpu != cpu )
+            vmid_flush_vcpu(current);

          /*
-         * Once this hart drops out of prev's dirty_cpumask it stops 
being a
-         * target of p2m_tlb_flush(), while its TLB may still hold G-stage
-         * translations of prev's domain: neither the vCPU which just 
ran nor
-         * any other vCPU of that domain which ran here earlier has had its
-         * VMID invalidated. Move the hart to a new VMID generation so that
-         * none of them can be reached again.
-         *
-         * Switching away from the idle vCPU needs no bump: the idle domain
-         * has no p2m of its own, and whatever G-stage entries this 
hart may
-         * still hold (or speculatively create while HGATP keeps 
pointing at
-         * the last guest's p2m) are tagged with a VMID which was 
already made
-         * stale when that guest was switched out. Skipping the bump 
here also
-         * avoids burning a generation on every pass through idle.
+         * Claim the VMID here rather than leaving it to the next guest 
entry:
+         * ctxt_switch_to() makes HGATP live below, and a stale VMID there
+         * pairs this domain's G-stage root with a tag which may 
already have
+         * been re-issued to a vCPU of another domain.
           */
-        if ( !is_idle_vcpu(prev) )
-            vmid_flush_hart();
+        need_flush = vmid_handle_vmenter(&current->arch.vmid);

-        cpumask_clear_cpu(cpu, prev->domain->dirty_cpumask);
+        /*
+         * A VMID isn't re-used until the generation it was issued in 
wraps, so
+         * a G-stage flush is needed only when vmid_handle_vmenter() 
says so.
+         */
+        if ( unlikely(need_flush) )
+            local_hfence_gvma_all();
      }
-    write_atomic(&current->dirty_cpu, cpu);

      ctxt_switch_to(current);

-    write_atomic(&prev->dirty_cpu, VCPU_CPU_CLEAN);
+    write_atomic(&current->dirty_cpu, cpu);

      current->arch.last_cpu = cpu;

diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 1f7a6907525d..98c2d6de6933 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -243,6 +243,15 @@ static void p2m_tlb_flush(struct p2m_domain *p2m)

      p2m->need_flush = false;

+    /*
+     * Order the p2m updates above against the read of dirty_cpumask below,
+     * pairing with the barrier in schedule_tail(). Either that hart is 
seen
+     * here and gets an HFENCE.GVMA, or it adds itself to the mask 
afterwards,
+     * in which case it starts walking this p2m only once the updates are
+     * visible to it.
+     */
+    smp_mb();
+
      sbi_remote_hfence_gvma(d->dirty_cpumask, 0, 0);
  }

@@ -1523,22 +1532,12 @@ void p2m_ctxt_switch_from(struct vcpu *p)
  void p2m_ctxt_switch_to(struct vcpu *n)
  {
      struct p2m_domain *p2m = p2m_get_hostp2m(n->domain);
-    bool need_flush;

      if ( is_idle_vcpu(n) )
          return;

-    need_flush = vmid_handle_vmenter(&n->arch.vmid);
-
      csr_write(CSR_HGATP, construct_hgatp(p2m, n->arch.vmid.vmid));

-    /*
-     * A VMID isn't re-used until the generation it was issued in wraps, so
-     * a G-stage flush is needed only when vmid_handle_vmenter() says so.
-     */
-    if ( unlikely(need_flush) )
-        local_hfence_gvma_all();
-
      csr_write(CSR_VSATP, n->arch.vsatp);

      /*

Any concerns about this implementation?

Thanks in advance.

~ Oleksii

