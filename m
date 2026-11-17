Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FEA606A323
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 13:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OhEA/7OX
Received: from list by lists.xenproject.org with outflank-mailman.1492575.1693016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTJZQ-0000db-RU; Tue, 17 Nov 2026 13:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492575.1693016; Tue, 17 Nov 2026 13:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTJZQ-0000dT-NL; Tue, 17 Nov 2026 13:50:00 +0000
Received: by outflank-mailman (input) for mailman id 1492575;
 Tue, 17 Nov 2026 13:49:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hfranco@baylibre.com>) id 1xTJZP-0000dJ-DF
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 13:49:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTJZO-004s3l-I5
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 14:49:58 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hfranco@baylibre.com>)
 id 6afc5b75-bab6-0a2a0a5309dd-0a2a4503b086-40
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 14:49:58 +0100
Received: from [74.125.82.172] (helo=mail-dy1-f172.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hfranco@baylibre.com>)
 id 6afc5b84-fae8-0a2a45030019-4a7d52acad8d-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 14:49:58 +0100
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-36f8cdd30beso7959386eec.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 05:49:57 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::a1aa])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-379559189e8sm45064982eec.11.2026.11.17.05.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 05:49:55 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=baylibre.com header.i="@baylibre.com" header.h="Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794923396; x=1795528196; darn=lists.xenproject.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=30K/gFRExOBx+wuuZ5rnYLq67VE4Z4dB1RkB6YVQ70Q=;
        b=OhEA/7OXkvciyO+eoTA3j/uvsRSUvWDQ15/y3qEv+SbzQ0k8KpS/7AbyNEPw5bBAUK
         WjTcWDAGDhmhBvIb1yotdlWmWdi/oB6Wn9XkV+q5CCn14st7tZ7KWE86xQ/+VjQxq4nk
         Z9vbrcgNBvQlXdXxRVgAEgHj4b0N0JgjPjru+kHoUmxP4GwguSCFzETOEJn/zqSIUrpk
         T72FRaJfs60bfbrFS5fBNZt0mLvh/cqiZL+cvYWYD/t3SEfAl+1SZnis9OzV2PY2bQz1
         l8EqJTc/Q5iPdE3PtdDKzQ1yCtL3WjaAOE+xsjbNM4bKOE/ObYUFlTykSc3ZwWuyhvjO
         qL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923396; x=1795528196;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=30K/gFRExOBx+wuuZ5rnYLq67VE4Z4dB1RkB6YVQ70Q=;
        b=TMAxMokmolt9qRvD4cjaJUSZiwvmfI6gkU2KvU1YKMcOqfc7HRzjFB7aJ+re0MIErz
         CUefhncPqf7uxIBdYgaBsl76bT0TzDmVfUtmkxwPKcoGDs6vy2q47rWNeVRAQptjqexJ
         CnPQ3mGYrYwDWWW6Noo/oCwroQR+A5ozgn2iR4n778DbX1HcGBWlfzkuOcKRBkavXY1c
         MkSxnJ0C04vOUXEiQb6h2yntjbUgpzRFxDVwYDMKk2TWl4cfIi/H8dcKTCDkn+bif/Xl
         V49Em4DjY8JXfSO/el6oChrR4GoqQs/oTy3W3Q9PJLyZSBXWxLZ7zpQm1iYJCS3CRrSK
         kS+w==
X-Gm-Message-State: APuU4Z8ydtpkLrVTsRLBDQlOReOsh93bbshv8BIRH+5vIbRRTTXeb8cL
	Ohgqzggfbt9guFDR6ybKuBZVKDUQpLlNieqkBLDZozlf8jJO3L+pAXayUQCC12K8UWM=
X-Gm-Gg: AZFdTZdo2XZDtUFRwI0bPFzLxOlTljraU/XeDT2DAv+IRU21ijKHa6ZUG9rRrVSDxcq
	uTDet7orE0tzU92msES19KmeLv3rCG9pqxcgqCNLUS482NakZY6Z7BNUgyc2kwvxumIFEASbA6L
	4UMShwR1RL1Hbkpa9h5iC3Z44crtz/F+R+nMoOv5mSVw4/WWS0lhOnu6nS7VuEiPDS87TyVGE2/
	lShktJdAOL3dtT5vwtg/TDSTMIMtAlGq9PHcfn+1DnNl/qrOdls5sUdXGC8VFCHwjngMAbv9jak
	788WdFjGKezVjH7rk6OZdCIvICpriJvm8+J3I0q2MvzyGgiX7y8diledyOqqgq4G1rckKuVeSml
	xv97BrLZclFXUm1Kf6BUnlhhtGnOscc9Kst/A6CSwcejsHv6nc+4MrCFeZrVeftYDs1LolFkfp7
	7rPK8+KTS/2QvltGp5AxNrT5IFFKCycNCgBR/DXxa4RH+nm2z3JOjvtBo+ePH8Y056F3fJBdZUD
	MjdSZKDdMTfc+NLszHjbh9Pg29Tt+LF+whxpO3BaDEIYKhKEqah2qV01brEZ7xswOHxhlWyEnYp
	ywWESyKjuzRfPnctodc+in2KQEAHYFQm9xbJHMKRL6AMzr4cM7fZ0VYuegerGTPUSt+W
X-Received: by 2002:a05:693c:3f02:b0:36e:1fbe:3571 with SMTP id 5a478bee46e88-3796365ee8dmr13934224eec.3.1794923396108;
        Tue, 17 Nov 2026 05:49:56 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Tue, 17 Nov 2026 10:49:03 -0300
Subject: [PATCH] xen/riscv: sbi: fix kernel-doc parameter annotations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-riscv-kernel-doc-fix-v1-1-bc0a19f24cfa@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDuQpKLoVaSLGic6KlFmWimId
 2/U5ffg/TsoCZNCne0gtLHyEhPsIwM/vGNPyF0yOOMKa22Jwuo3nEgizdgtHgP/8FlVrjCmbEP
 IIV1XoTRf2eZ1W7/tSP5ztuA4/uG6nDZ4AAAA
X-Change-ID: 20261117-riscv-kernel-doc-fix-39926007bff4
To: xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
X-Mailer: b4 0.16.0
X-purgate-ID: tlsNG-33051d/1794923398-778C54E9-81910295/0/0
X-purgate-type: clean
X-purgate-size: 2040
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sbi_remote_sfence_vma() uses @hart_mask, while sbi_remote_hfence_gvma()
and sbi_remote_hfence_gvma_vmid() uses @cpu_mask without the @param
prefix. Fix and make all three consistent.

No functional change.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 xen/arch/riscv/include/asm/sbi.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 2a245d0b42..c585845907 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -99,7 +99,7 @@ bool sbi_has_rfence(void);
  * Returns 0 if IPI was sent to all the targeted harts successfully
  * or negative value if start_addr or size is not valid.
  *
- * @hart_mask a cpu mask containing all the target harts.
+ * @param cpu_mask a cpu mask containing all the target CPUs (in Xen space).
  * @param start virtual address start
  * @param size virtual address range size
  */
@@ -118,7 +118,7 @@ int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
  *  - start_addr and size are both 0, or
  *  - size is equal to 2^XLEN-1.
  *
- * @cpu_mask a cpu mask containing all the target CPUs (in Xen space).
+ * @param cpu_mask a cpu mask containing all the target CPUs (in Xen space).
  * @param start virtual address start
  * @param size virtual address range size
  */
@@ -130,7 +130,7 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
  * instructions, covering the range of guest physical addresses
  * in [start_addr, start_addr + size) only for the given VMID.
  *
- * @cpu_mask a cpu mask containing all the target CPUs (in Xen space).
+ * @param cpu_mask a cpu mask containing all the target CPUs (in Xen space).
  * @param start virtual address start
  * @param size virtual address range size
  * @param vmid virtual machine id

---
base-commit: aa6070d2c840301bceae28763d20a32c48f0d3e4
change-id: 20261117-riscv-kernel-doc-fix-39926007bff4

Best regards,
--  
Hiago


