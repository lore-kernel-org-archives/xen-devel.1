Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5D2606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 16:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=Xsvu5uqn
Received: from list by lists.xenproject.org with outflank-mailman.1465935.1676381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMpol-0005wb-Tq; Fri, 30 Oct 2026 16:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465935.1676381; Fri, 30 Oct 2026 16:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMpol-0005wO-P7; Fri, 30 Oct 2026 16:51:03 +0000
Received: by outflank-mailman (input) for mailman id 1465935;
 Fri, 30 Oct 2026 16:51:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca@edera.dev>) id 1xMpok-0005vX-Ud
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:51:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMpok-00HTpX-BE
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 17:51:02 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca@edera.dev>)
 id 6ae4caf6-8faa-0a2a0a5109dd-0a2a4503edca-0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 17:51:02 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luca@edera.dev>)
 id 6ae4caf6-fae8-0a2a45030019-d155802eb470-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 17:51:02 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a4dc547987so5029115e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 09:51:02 -0700 (PDT)
Received: from framework13.home ([2a01:e11:3:1ff0:831:b00b:e409:f875])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf396dfdbsm74305045e9.1.2026.10.30.09.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 09:51:00 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=edera.dev header.i="@edera.dev" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1793379062; x=1793983862; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2QipX05wfLZ45HZZPuTyjIFgLebJ/NJsvbpQdimG0AA=;
        b=Xsvu5uqnrA43Uc4hYHdLdKUwKAIyuTNBhUs2htxXEMRUQWyb++Wq1MdSVT1XuZkjCu
         6PQRgR3V0Y2Mo43XJV7OyWFoa8ZS7jvaCH1Bchqz6SahxcDZfdkoYGD29Bd6gLSrISYj
         WTJe1qzjYj3VsPpq82pJl16AUA29vizgwY8WcNPtDzs7IHp6VYGlQZQv7oX0k+ihgh/D
         i8G1CasrkcvCcyNWDIZuE5rLUatuCxCbdjICHDeAj7r9YbV0IhKmbx+JNyaToQ7NApvB
         ypi/JL0DR46DWKyEgk/WELCcMe//39x+JAIpyNHCnjnfsx0bRDer5zTp4ozRT9Qmf2oi
         Vzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379062; x=1793983862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2QipX05wfLZ45HZZPuTyjIFgLebJ/NJsvbpQdimG0AA=;
        b=yMyZc5SzxV9ADxJRSLbu7cLPEWs7juX4YzCgbBKp7JPvnNEg3AjkU2mwHbz8gqMobA
         TkWptPW/sBfZQrAZJjhoTEK17s9qfIDQ5m1yLyEtPJOcOn+0U+ea3vWuD0ZowcBv6dju
         ygPqJ0zu+zTnfUnKGpBYyfsr8UEl1ma21gqXD+RlNDyByXMq3RPRFp2tjLwUkI/uzDNw
         FRiD4wpo4XA8vq/PU4N8Pbf24xNgTytv1GwEgTGQLhKl0UZNhGu4U29jzdjM6mj7zySe
         s7PM2FsYWwPJ/rwoWFfpI5Y23TeOcBCbBmdzdP5aUb2K0RBAGlM3VNL7ugteJd5TyEU+
         wtdw==
X-Gm-Message-State: AFq9FYLddJlKSy0jMknj0M6v3/ojDuKHLA5O3HDUobkSPmH+Tqv2nvem
	0bYa60vVVDmC1p5kNmn3bc9Tkq3BEjvewqDxMckiV7i8xb8xSFoQyeorCuhqWEUyVB07zDpsEG7
	Pi7Izq5A5Ww==
X-Gm-Gg: AYBFou2wtrbM9A0Tgd7hZjZg04KInPRk4toS9Y+jyIcfvBLoY/15DMqbZWU+XRnnvjF
	XnQKCTjXO9Scqh1KTdz8kyNq/VVo6uTCbKeLhLX6aHUN+sj9H2ueKfRWQ0oIADdDa0XiCPLnr7u
	jOlQ7x2siMqNsgskuBMgxQqcYqh1uxfEGmuaO5YI3AWI4slcdvfZtmJr5UQuSElzuG1NOrl5s9m
	qsllNLQdYaqesAc2PkR+Y68T4gbEF3Q9UKZYhGvIM6B1oVpbZnpe0NmW8jpMuvYF37Mz0qYTMVV
	wIpELWB5PyolKDSkO9Jgc4PvRosvBWy+jHtcuvBGCg6AyPPe7L+TxrCRksXZ+xCJ+t9fzobM3so
	nMQr1wxbwaUtmA+7Un6s01EuzLRFxdbtaGgq1pjruSJmQaTq0t8wlrctoFif0ciiBgDQWo7BNoA
	5yHO4RfFUJGmWlKbr+3oB3KRtQYRqSCEivsK6uLA6+EZp9J6hIKDOGwW0T4l0q10ox/V9r208rq
	hZxLOqgbAW0445FmsdVofGIV9Js5Mkc/B54QMNsHGMouScyUd6hZipUaoS/tzyzcWWQ5gWEHRQN
	bcPf/hMimIjgJ1J5qmFBSyf4HQ==
X-Received: by 2002:a05:600c:6306:b0:4aa:15b1:d4fa with SMTP id 5b1f17b1804b1-4ac17b2ce91mr69321535e9.5.1793379061663;
        Fri, 30 Oct 2026 09:51:01 -0700 (PDT)
From: Luca Di Maio <luca@edera.dev>
To: xen-devel@lists.xenproject.org
Cc: Luca Di Maio <luca@edera.dev>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 3/3] x86/HVM: defer p2m TLB flushes across a grant unmap batch
Date: Fri, 30 Oct 2026 17:50:10 +0100
Message-ID: <20261030165031.2560020-4-luca@edera.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030165031.2560020-1-luca@edera.dev>
References: <20261030165031.2560020-1-luca@edera.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1793379062-6FEC24E9-59D65F3C/0/0
X-purgate-type: clean
X-purgate-size: 3009
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A grant unmap by a translated caller also flushes the guest TLBs:
p2m_remove_page() sets need_flush of the host p2m, and put_gfn()
flushes when it drops the last level of the p2m lock. Each flush sends
an IPI to every other CPU in d->dirty_cpumask and waits for all of
them, so a PVH dom0 with busy vCPUs pays a round of IPIs for every page
it unmaps.

Defer that flush to the end of the batch, still before the pages are
released. Under the gfn lock of get_gfn_query() only the removal can
set need_flush, as the query neither allocates nor unshares, so no
other change's flush is deferred. p2m_free_ptp() still flushes before
it frees a table.

The final flush reaches the CPUs in d->dirty_cpumask at that time. A
CPU that left the mask in between has flushed already, as
__context_switch() clears it from the mask only after write_ptbase()
has flushed the guest TLBs. With EPT, each change also marks every CPU
for an INVEPT before its next VM entry.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: Luca Di Maio <luca@edera.dev>

---
 xen/arch/x86/hvm/grant_table.c      | 6 ++++++
 xen/arch/x86/include/asm/hvm/vcpu.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/xen/arch/x86/hvm/grant_table.c b/xen/arch/x86/hvm/grant_table.c
index 1d7f9b19f9..e340712dd6 100644
--- a/xen/arch/x86/hvm/grant_table.c
+++ b/xen/arch/x86/hvm/grant_table.c
@@ -41,6 +41,7 @@ int replace_grant_p2m_mapping(uint64_t addr, mfn_t frame,
     p2m_type_t type;
     mfn_t old_mfn;
     struct domain *d = current->domain;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
     struct hvm_grant_unmap_batch *batch = &current->arch.hvm.grant_unmap_batch;
     int rc;
 
@@ -72,6 +73,8 @@ int replace_grant_p2m_mapping(uint64_t addr, mfn_t frame,
         batch->iommu_flags |= this_cpu(iommu_skipped_flush_flags);
         batch->gfn_lo = min(batch->gfn_lo, gfn);
         batch->gfn_hi = max(batch->gfn_hi, gfn);
+        batch->tlb_flush |= p2m->need_flush;
+        p2m->need_flush = false;
     }
 
     if ( rc )
@@ -95,10 +98,13 @@ void grant_p2m_unmap_batch_begin(void)
 int grant_p2m_unmap_batch_end(void)
 {
     struct domain *d = current->domain;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
     struct hvm_grant_unmap_batch *batch = &current->arch.hvm.grant_unmap_batch;
     unsigned int order;
 
     batch->open = false;
+    if ( batch->tlb_flush )
+        p2m->tlb_flush(p2m);
 
     if ( !batch->iommu_flags )
         return 0;
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm/hvm/vcpu.h
index 12b7e9b707..9638e50e91 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -111,6 +111,7 @@ struct altp2mvcpu {
 /* Per vCPU, as the guest copies between the unmaps can sleep. */
 struct hvm_grant_unmap_batch {
     bool          open;
+    bool          tlb_flush;
     unsigned int  iommu_flags;
     unsigned long gfn_lo, gfn_hi;
 };
-- 
2.54.0


