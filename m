Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A6E606A328
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 08:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=j0tn5hGK
Received: from list by lists.xenproject.org with outflank-mailman.1476317.1682486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPF0n-00086R-Az; Fri, 06 Nov 2026 08:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476317.1682486; Fri, 06 Nov 2026 08:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPF0n-00086K-8I; Fri, 06 Nov 2026 08:09:25 +0000
Received: by outflank-mailman (input) for mailman id 1476317;
 Fri, 06 Nov 2026 08:09:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca@edera.dev>) id 1xPF0m-0007ux-Gg
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 08:09:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPF0l-00GWrl-TX
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 09:09:23 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca@edera.dev>)
 id 6aed8b2a-2eae-0a2a0a5409dd-0a2a450891e4-24
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 09:09:23 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luca@edera.dev>)
 id 6aed8b33-f659-0a2a45080019-d155dd35c870-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 09:09:23 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-490c3ae81d3so176779f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 00:09:23 -0800 (PST)
Received: from framework13.home ([2a01:e11:3:1ff0:831:b00b:e409:f875])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492ff85585esm1534507f8f.5.2026.11.06.00.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 00:09:22 -0800 (PST)
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
        d=edera.dev; s=google; t=1793952563; x=1794557363; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wt1ABLaNm0GH4SvP3FkeGPhSrwsLp9qxqWi2r0AAmsc=;
        b=j0tn5hGKaEwOO1LrIgd5jb6K95JyZ4Y8esW5lxTxtXxlQKhcHVE1ZRIeqTtRHrsrk5
         wEIuYGQO4L77weSWrhc+RiOVgR/27sWAKU3AvYpDRqoguGt0u7eVYSAcuIOCzYSUe5eF
         YX61Lkko65DgSEjar2WIhjsSueP1ICRyUi0/eN1QL2TAgy/zt5O8QIKqdsBYDiokJ0dY
         FsGS1xvbjGT9fhm8afLcsuZ/jGn3IB8t/Lpv8TnEqsW75uDM6Xxo1xpBCP3aIavpr4YZ
         M1NE6sdXVonhaXKO0lT7cbkfo8AG3qGgrrx6dM5vgufn6g+XrTGZagotAEGJvxQUEBMB
         e3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952563; x=1794557363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wt1ABLaNm0GH4SvP3FkeGPhSrwsLp9qxqWi2r0AAmsc=;
        b=SxSN12f5QdxeXgJwy062AzM+5fVInjMGgxIrXbu8PQLL2PqdL+Ajn8RChbgmK3zGTC
         YgYIIxblNZYvU2vctR9FqUAwL+wxJx404RVLChRT5/lVEXrUYaTnEWePPzG0PK78Bn74
         8yDfVoQoxZDV/lg5nZW6aMXix/xUfxL/XjOOZU4Coz9nUEgWn8/kOthJwDW/cE5vWDjN
         CABYPIE/XmHCxj7h2gOwkR7Y2d2HPUiTmwpiCDpDKDBCQ82vR8pwNulVY0YgN2hFaWmF
         bsqJGmGBzv1kjNcRHNKkPtIllwRQJuzhz+Xs/5H7J2U+2hpVcSoyA9ZyzC+pMWTDvpYj
         cHQA==
X-Gm-Message-State: APuU4Z93sq1uw3wtxXzqoU/uASKDIwOUm7KYcotzVWsWJfV9+SM9PtqO
	0nXYt7XerVtzM9Iv5CT6FKzBSQBHzESsDB51lVtmBf1PiqGl4Fe9s0nCfeFAw/qObVjLGB82p9Q
	1umleHrw=
X-Gm-Gg: AYBFou3kuXtUKRy9JCBaYbseEKOKBkLoTUzyH9J/JGyQeaS5xG+MIPheCO9WZuwHu4Z
	pW7eLytGKS82k/xhnDzmdAK4iLwwMuGpyMbum9UNihRDdjJOsUcOrpiXv5Ffy6D5xaqIqkwuCd5
	YHgLoxUJu9xwdLung5+u3VGc+VDPwnmPkWqnEspOW2Ma4D9lRml1gyvOjVg5zANXx/GQ3cIL4Lf
	KVVXHB0Xv2/i0n/VPIAVbS2y7YAt/vpm20h1QXuwFkuXOWvSga8Y6JH+KR07I7gbIMHSO8gdEmA
	wzEyl2MtugMHE5VCTcaMjqBY+/TVPpg0G16U+g8UyZWL+db+Ilqd1iV05Wx/Hehyd8HaWkGHhR3
	JBAC9Pq/CN/N+7+AnmviM3tJPMSr0iuoc/xF/FPOZrU1LnWD8hUI1n6E3w0+TFQjuBwRoXNa0pX
	UH3mhuPXXcy5NvFnPYna1fZNK35gYBQ70SCrtHwQKUDZF2HaLjh9Cr3qWsEYlssbemK0xvKMyTM
	vsG1VtLuk2YHcRSHtmyrgnCUwaLAs9Ij7t9QgLsW5sFeofnsBQSTi/qlpnzfaMUDeECNR88pyjn
	D8o4KK6p2lzrR6f/wRzsQi894Q==
X-Received: by 2002:a05:6000:2887:b0:48e:c0:9441 with SMTP id ffacd0b85a97d-49275372225mr3961197f8f.29.1793952563263;
        Fri, 06 Nov 2026 00:09:23 -0800 (PST)
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
Subject: [PATCH v2 4/4] x86/HVM: defer p2m TLB flushes across a grant unmap batch
Date: Fri,  6 Nov 2026 09:08:54 +0100
Message-ID: <20261106080859.2285309-5-luca@edera.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106080859.2285309-1-luca@edera.dev>
References: <20261106080859.2285309-1-luca@edera.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793952563-D5D4887B-94D9F5C0/0/0
X-purgate-type: clean
X-purgate-size: 3042
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
Changes in v2:
- None.
---
 xen/arch/x86/hvm/grant_table.c      | 6 ++++++
 xen/arch/x86/include/asm/hvm/vcpu.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/xen/arch/x86/hvm/grant_table.c b/xen/arch/x86/hvm/grant_table.c
index 5ecba6db65..7a2201d926 100644
--- a/xen/arch/x86/hvm/grant_table.c
+++ b/xen/arch/x86/hvm/grant_table.c
@@ -41,6 +41,7 @@ int replace_grant_p2m_mapping(uint64_t addr, mfn_t frame,
     p2m_type_t type;
     mfn_t old_mfn;
     struct domain *d = current->domain;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
     struct hvm_grant_unmap_batch *batch = &current->arch.hvm.grant_unmap_batch;
     int rc;
 
@@ -76,6 +77,8 @@ int replace_grant_p2m_mapping(uint64_t addr, mfn_t frame,
         batch->iommu_flags |= skipped->flags;
         batch->dfn_first = min(batch->dfn_first, dfn_x(skipped->first));
         batch->dfn_last = max(batch->dfn_last, dfn_x(skipped->last));
+        batch->tlb_flush |= p2m->need_flush;
+        p2m->need_flush = false;
     }
 
     if ( rc )
@@ -99,9 +102,12 @@ void grant_p2m_unmap_batch_begin(void)
 int grant_p2m_unmap_batch_end(void)
 {
     struct domain *d = current->domain;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
     struct hvm_grant_unmap_batch *batch = &current->arch.hvm.grant_unmap_batch;
 
     batch->open = false;
+    if ( batch->tlb_flush )
+        p2m->tlb_flush(p2m);
 
     if ( !batch->iommu_flags )
         return 0;
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm/hvm/vcpu.h
index 990411e2c7..ff6856928d 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -111,6 +111,7 @@ struct altp2mvcpu {
 /* Per vCPU, as the guest copies between the unmaps can sleep. */
 struct hvm_grant_unmap_batch {
     bool          open;
+    bool          tlb_flush;
     unsigned int  iommu_flags;
     unsigned long dfn_first, dfn_last;
 };
-- 
2.47.3


