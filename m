Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4385A606A31A
	for <xen-devel@archiver.kernel.org>; Sat, 24 Oct 2026 00:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AAy9v9gH
Received: from list by lists.xenproject.org with outflank-mailman.1459773.1671492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKPcg-0008Is-Rp; Sat, 24 Oct 2026 00:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459773.1671492; Sat, 24 Oct 2026 00:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKPcg-0008Il-Ox; Sat, 24 Oct 2026 00:28:34 +0000
Received: by outflank-mailman (input) for mailman id 1459773;
 Sat, 24 Oct 2026 00:28:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1xKPcf-0008Ht-36
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2026 00:28:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKPcd-00GciR-V9
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2026 02:28:31 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6adbfb6c-bab6-0a2a0a5309dd-0a2a450c81f2-16
 for <xen-devel@lists.xenproject.org>; Sat, 24 Oct 2026 02:28:31 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6adbfbae-f479-0a2a450c0019-aceafc1f861a-3
 for <xen-devel@lists.xenproject.org>; Sat, 24 Oct 2026 02:28:31 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8364142A11;
 Sat, 24 Oct 2026 00:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7599F1F01825;
 Sat, 24 Oct 2026 00:28:28 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792801709;
	bh=Nz+ynd+hlMgjwkODFZJ1hw/LhOrWGJnsnmI/jpEtw2Q=;
	h=Date:From:To:cc:Subject;
	b=AAy9v9gHNsUJfIFsQnknpzacppSFD+iOtOhBUO1U3amEoyaGNNynR2zQLsrZRjR71
	 nHPo2fH1sTTGdn0pUOq9EB3zWkJy6L+M5rmf2C/jJgbJ4qN9FUocoXRRmQPGVB+rR8
	 In1iE4Jy2EbFN9Fi0sexlRIsDXOimlhXQXX0D+5kizF86aYMYuawmKebyGIiUbi7VR
	 OYxOM8Q77CYQgoIVHemySxapvOTmFyO8ETJosuUVo1MrOKFqDlm3ILQnS6lkW8k69Y
	 +fVhhOqvoVFa8Erh8+L8nsaEtLRy3YnwmnaeRrL7MpQvQzxs7DVdFYcuBP2GPyZ4UO
	 FBJTgVTdhaBbw==
Date: Fri, 23 Oct 2026 17:28:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, roger@xenproject.org
Subject: [PATCH] xen/rangeset: Fix rangeset_remove_range() with e == ~0UL
Message-ID: <863a0654-7a34-976a-4c08-159cc34c26bf@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1083893399-1792801708=:4086347"
X-purgate-ID: tlsNG-d25034/1792801711-50F3BA5B-7B8D0F36/0/0
X-purgate-type: clean
X-purgate-size: 1547
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1083893399-1792801708=:4086347
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

When the removal spans several ranges, the last one is trimmed by
setting its start to e + 1, and destroyed if that leaves it empty.  For
e == ~0UL, e + 1 wraps to 0, so the range is kept as [0, end] and the
removal adds everything below it.

This is hit by pv_shim_shutdown(), whose iomem_deny_access(d, 0, ~0UL)
on resume turns the guest's grant frame permissions into [0, highest
grant frame].  arch_iommu_hwdom_init() can hit it too, for a PVH
hardware domain with an E820 entry above its 48-bit iomem_caps.

Destroy the range when it ends within [s, e] instead.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Acked-by: Roger Pau Monné <roger@xenproject.org>
---
 xen/common/rangeset.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index 0e3b9acd35..2c0c1bfc08 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -239,9 +239,10 @@ int rangeset_remove_range(
             destroy_range(r, t);
         }
 
-        x->s = e + 1;
-        if ( x->s > x->e )
+        if ( x->e <= e )
             destroy_range(r, x);
+        else
+            x->s = e + 1;
     }
 
  out:
-- 
2.43.0
--8323329-1083893399-1792801708=:4086347--

