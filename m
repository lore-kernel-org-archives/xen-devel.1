Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45756CA6019
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 21:03:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443805.1660938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvH2-0004qh-S9; Thu, 08 Oct 2026 21:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443805.1660938; Thu, 08 Oct 2026 21:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvH2-0004qW-OR; Thu, 08 Oct 2026 21:03:32 +0000
Received: by outflank-mailman (input) for mailman id 1443805;
 Thu, 08 Oct 2026 21:03:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEvH0-0004oF-SU
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 21:03:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEvH0-005tQx-9P
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 23:03:30 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac80522-8faa-0a2a0a5109dd-0a2a4504d040-0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:30 +0200
Received: from [209.85.222.179] (helo=mail-qk1-f179.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac80521-b57f-0a2a45040019-d155deb3c58b-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:30 +0200
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-93e7ad9f78dso391965085a.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 14:03:29 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.246])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93eb98c818esm23024485a.36.2026.10.08.14.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 14:03:25 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791493409; x=1792098209; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9GuqCKMi/hN2ncI5Ot6sRINUqKwZdItx3f86TmeMcg=;
        b=M0KOn4ATa8ip5eiVZOgGxWLAgcvgIaOK8YsWSOBI6xhh94xDnTVxdT2cGZZnO9Saca
         qeY++wVDvjZaKG0+kjaTdWemnqhHtXPcbHyQB5yI0e4h1ZyzGcfqC8SuBdjfR5QY7uBC
         BQgbIGhDWKLDLab12tPs9ClYmSkN4CvbigUqlH14XNLaCHbQKVjM3SstXp19OiKm02Az
         TE3Uxm0sUNtcME2ZLYgzZD21mRNE++ANlz5LG0cRSXdqA+VEYActK2FAQmF5Fv8yXHz/
         R/Z73Hjdf90xuexSnMr6w1sHRvaQ3o4DgtEeIBQtLXmo1329zf+cYR8F48OOU4MS18qa
         6kAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493409; x=1792098209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9GuqCKMi/hN2ncI5Ot6sRINUqKwZdItx3f86TmeMcg=;
        b=jwIzGwe3x3lEnjvy9nzed5MDNYXH1QwN2+nxN3XXD9GKSwSweMBBmo0KfjTrHC1jVa
         /1sLpXgVCLDil852SGlh6udnkIFMY32Z9qbeZMHKVezKg5tGbj0+sjvhlbWxTmLGI58b
         xxtu5cbvWnSRDzsAR7UNzf5E2IQxV3gE08Ef0hNmIMeCKMjXVagbArAevYRUMhi3LvJY
         5zIuGLW6kIGrcbDmvNL0G5PxVyDc9/wLMUopp9WNbWH2CHUec6ih84UQG3R07tvhj6i4
         B/3gn7lw+znzvJyS/OCPo3Bujuu8vodB2CZkzDRiDkOvnuZBRAUbfkm2lU9yFr8F5KvQ
         tfDw==
X-Forwarded-Encrypted: i=1; AKwUvByCVl5sVdCgDqdH/DFQ98Yxx8LjVELQovh5L0JzF/BnefLIO/dRVSMAEgHP5W07RI0Q/Qo4juF1Q7M=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJAFfUn4cQL8tl/IeNCugCTBFpRB2PtS+nUGts3gk2q82yRDVOG
	festetdPjj0h+hhUkNMraqkKQtcGpB6jai4vyLgOODh9Vo2p0WHVDj3NwodlwMrM3AU=
X-Gm-Gg: AYBFou0hBm2z4TujwpBsbb7PAOfB3d5s5ujgEVMmp4AzbasBW34Q0d3WV7t2avw1F8c
	QzKiBJvhWr8uK2QOBkeeXnLGLUGso3ggnwTwuQhxtqACQbMdpL8+DaVs3Rbf2baciv3OXD2zTK9
	KSwFDO4qHnX+4rIEnZNwhqCiU9dr1D4dqihuHmLcNgJwhPRVfu82fDQlR94bI38PzU0pTXDv3dY
	iKhwKlFYFs751nEp/xmT7hiP+90ZUvS2t5Ek+DsI/KPGUG7MOo/vzSog2lhsr5fgchlCjGCU6x4
	yfC4Sl/HzGQux+AaTed+HADQRe45VVZ7rULUemROHnzhqQvgEumVZa5qoRTGGumWlqKKj0z33DQ
	axZ0jIkDltq+7kuUNEISRedM2KhClUKaKIFG9PmXD4a0YYOq0XI7U1wif8LfHeUclLYT0zIcVRf
	geyzLbm8XmUZVa0M5OuQNdgRY7ANFFH775H2tgyydPMswGTXohUh+UV1haoAwePYArNO8HWng7r
	SPD3sNvmNa9cbY=
X-Received: by 2002:a05:620a:29c7:b0:93a:2a59:3377 with SMTP id af79cd13be357-93e9b799671mr1358007485a.41.1791493405607;
        Thu, 08 Oct 2026 14:03:25 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 08 Oct 2026 21:02:50 +0000
Subject: [PATCH net-next v2 03/10] net/mlx5e: check for failure when
 pulling the Ethernet header after XDP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-b4-pskb-pull-tail-drivers-v2-3-8f2bd9bee138@toxicpanda.com>
References: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
In-Reply-To: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791493384; l=1491;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=zznhnNGgkEt9ZSSy2T9PlgogR6INn8I/GpUQzjq8ahE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFaj9m1MCb6yydGhkDduTFS5Q4Ekj/GXk/66W/KuEGtH8miGll+pKUls7h6lvdP0A6+k8X0JuWF
 J9s3G82EktQ0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ebf023/1791493410-51AD0B50-CB4CFD57/0/0
X-purgate-type: clean
X-purgate-size: 1493

When an XDP program leaves less than ETH_HLEN in the linear part of a
multi-buffer packet, mlx5e_skb_from_cqe_mpwrq_nonlinear() pulls the rest
of the Ethernet header in from the frags with __pskb_pull_tail() and
ignores the return value.  If that pull fails, eth_type_trans() later
finds less than ETH_HLEN in the head and BUG()s in __skb_pull().

Use pskb_may_pull() instead and drop the packet if it fails.  Pulling
min(ETH_HLEN, skb->len) keeps today's behaviour for a frame shorter
than an Ethernet header.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_rx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
index e3f915beebe1..b1e1e30a77e2 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
@@ -2060,9 +2060,12 @@ mlx5e_skb_from_cqe_mpwrq_nonlinear(struct mlx5e_rq *rq, struct mlx5e_mpw_info *w
 				pagep->frags++;
 			while (++pagep < frag_page);
 
-			if (len < ETH_HLEN)
-				__pskb_pull_tail(skb, min(ETH_HLEN - len,
-							  skb->data_len));
+			if (len < ETH_HLEN &&
+			    !pskb_may_pull(skb, min(ETH_HLEN, skb->len))) {
+				rq->stats->buff_alloc_err++;
+				dev_kfree_skb_any(skb);
+				return NULL;
+			}
 		}
 	} else {
 		if (xdp_buff_has_frags(&mxbuf->xdp)) {

-- 
2.55.0


