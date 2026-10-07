Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F67CA6002
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 18:16:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442677.1660263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWC8-0001Da-Al; Wed, 07 Oct 2026 18:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442677.1660263; Wed, 07 Oct 2026 18:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWC8-0001DQ-6t; Wed, 07 Oct 2026 18:16:48 +0000
Received: by outflank-mailman (input) for mailman id 1442677;
 Wed, 07 Oct 2026 18:16:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEWC6-00014K-OP
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 18:16:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEWC6-00GBp9-4z
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 20:16:46 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c80-e002-0a2a0a5209dd-0a2a4503a5c0-36
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:46 +0200
Received: from [209.85.219.48] (helo=mail-qv1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c8d-fae8-0a2a45030019-d155db30d595-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:46 +0200
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-9179bfa9e9cso33869596d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 11:16:45 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-919aa0ff38esm986706d6.26.2026.10.07.11.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 11:16:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791397005; x=1792001805; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgpiLoGoqA0xV5yWN2rO1XVw1oOPWsG2lgMDpzrz1ts=;
        b=qzLaUiyxTlDOr0zm1/y1CkzyYF3UIYe03Y7LN/TKCquVuyzfaxEJHM7FhSYsebU+P0
         lSM0/ilZDnO78/Zh97VEzvCa1e0Mu7Zsw2pqbUcK2KOlAGQR23waJ5wtHVA0fPiTdtZb
         MCdEBaDKGfl44984Ov2GzpX/wz+4rI+8Ll7C/KRs4Hgj+UmULFhdyExb230ZghYqhXL/
         9sXbaLg6sreC03PKxvmnkEqXpr6W++2wAui85ckDeVLfdIN9zI2r2708lVfgqzXkiF8W
         9704DZXD3MI4yvgvQZTyTOmFuG4ba9aOAoEdySMg9dg9a4tc1Ua92HOEoBOmR2SRpBEF
         WZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397005; x=1792001805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgpiLoGoqA0xV5yWN2rO1XVw1oOPWsG2lgMDpzrz1ts=;
        b=2Y9UfPJMM1NsMkXL5sOjdDzoWsxc6HtgqQ67iYUFoQZsqFGfdNeLqd2MuSZzHSgzy7
         IKbAu5PrdgbGTVrZlyfUI5+G+/61OFCS5epAbWC2UorL3ZcscNCfH4iMb/9e4hAx/2iJ
         sB2QwFWpD2Y4UT/yyh4ZVYjqpWOfK2umn745e430Qj0Gag+B7KW6FbrO+2C7pGFANnPB
         VDb94G872PAz61zVD6w2Vz+2jqU3Ny8SYIjPNx22aVFrxEF1Jk5Vqfxmc2dfT1ZmSNdI
         DRu2ly3+B7IOdHv3/8yYGEo54ZdFeJ9OY5HEp15DFgxORQgx/Mmu7mYPYWyutqPdqtfw
         swNQ==
X-Forwarded-Encrypted: i=1; AKwUvByeYqcXKhcqQRZXsuUCZktHuNy9o2j3jHOZAQMiVpqV4eE/4M2HSpHg5dPo/Xc+WrYcZ73nviSz0Js=@lists.xenproject.org
X-Gm-Message-State: AFuF++n5OOglzOP4McYBdMafofZM0pnD5RnCjQCBpF5bYG31HxNcmQol
	v1PzIs7e0HFZELohA5H6PNQ3XpnSeTIuE0IfL95q3MIyB9eGCo8h82B/KZWR2bALumJ0jEiOkLu
	6YZygNwgKhw==
X-Gm-Gg: AYBFou1MMScng3sYq0dvMB2HGlFc62VtYzZi0scGR/xI/OwURPxy/QMeLcfI2sWbwvX
	QobIYR9WMHJNay5TZZR5KcOVaKajIt/A8cg7bsKprErpqXg4QAZit+CfTJmg2EwxRampVk+C2jW
	OQ2wyjNWI6+ePHecxSgMll8Mrah6k4gEEA9cCACGgcvop13pxsLL6I5nqqgOe05GlwJehnr5L5o
	mBlkZY4ZFaDgQRjYM8hQNYzyHdvzhTOPqsmZ31yDxwdRqdDggXIbNd21z28Z0tj+mKO15gKkmpc
	bO1yOFiaz7CtoK/MP6s2SC8shejfiduW1qlgKq4cUaBLAPnEOp7+qLeuiLIOZYC/Z1Wr4/2y9U6
	LMiFlcdI3AIfsrBt2/QUJolYTcTXPGZdoe8sHRqYm5redk83oUwH+nO5KnX2GLuoOzrvaPOaPZX
	Kt51+lGcQRLo0xg3b0ZH+Hcx1+zulhxMUBFmTBVnCEu39vZd8jb5nUxqqAc7tX75aJtd6RvnHGW
	1WRFLEQu/7LJ+o=
X-Received: by 2002:a05:6214:2408:b0:90f:5154:6a93 with SMTP id 6a1803df08f44-919977eb9a4mr57210916d6.11.1791397004534;
        Wed, 07 Oct 2026 11:16:44 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 18:16:19 +0000
Subject: [PATCH net-next 6/9] e1000e: use pskb_may_pull() in the 82571/2/3
 TSO workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-pskb-pull-tail-drivers-v1-6-9512b0fb977b@toxicpanda.com>
References: <20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com>
In-Reply-To: <20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com>
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>, 
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>, 
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 xen-devel@lists.xenproject.org, intel-wired-lan@lists.osuosl.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791396985; l=1188;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=2XY23bjEEEbmilzyi/OT0dLNP6D+zOB3zspYb8/aVZ4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCZC1nd2AgIaYMzIFdyfEIqZLuxEhag0euZBWHhtKoqomivMvwvOvEoJ6R+5XulLE3AuLwN94C9
 RAHLj79e6mAY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-33051d/1791397006-77AC44E9-A09DA23E/0/0
X-purgate-type: clean
X-purgate-size: 1190

e1000_xmit_frame() uses __pskb_pull_tail() to pull up to 4 bytes of
payload into the head when the head holds only the TSO headers.  It
already checks the result.  Switch to pskb_may_pull(), which takes the
length the head should end up with and checks it against the skb, so
this driver no longer calls __pskb_pull_tail() directly.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/intel/e1000e/netdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index 844f31ab37ad..e216868e15cb 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -5859,8 +5859,8 @@ static netdev_tx_t e1000_xmit_frame(struct sk_buff *skb,
 			unsigned int pull_size;
 
 			pull_size = min_t(unsigned int, 4, skb->data_len);
-			if (!__pskb_pull_tail(skb, pull_size)) {
-				e_err("__pskb_pull_tail failed.\n");
+			if (!pskb_may_pull(skb, len + pull_size)) {
+				e_err("pskb_may_pull failed.\n");
 				dev_kfree_skb_any(skb);
 				return NETDEV_TX_OK;
 			}

-- 
2.55.0


