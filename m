Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F9BCA6007
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 18:16:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442672.1660227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWC1-0000Bl-8E; Wed, 07 Oct 2026 18:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442672.1660227; Wed, 07 Oct 2026 18:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWC1-0000Bc-4L; Wed, 07 Oct 2026 18:16:41 +0000
Received: by outflank-mailman (input) for mailman id 1442672;
 Wed, 07 Oct 2026 18:16:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEWBz-00009H-6f
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 18:16:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEWBy-002L24-Jh
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 20:16:38 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c67-bab6-0a2a0a5309dd-0a2a450be6f2-36
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:38 +0200
Received: from [209.85.219.45] (helo=mail-qv1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c85-b7e8-0a2a450b0019-d155db2ddd67-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:38 +0200
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-91951405546so48932176d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 11:16:38 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91996bac803sm26531506d6.3.2026.10.07.11.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 11:16:35 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791396997; x=1792001797; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9GuqCKMi/hN2ncI5Ot6sRINUqKwZdItx3f86TmeMcg=;
        b=eG09EqCY7izKl3xafxRc74JBSatbhYmVUr4Pl9oxF5HHPgEPG76Z9luqNPTIyyPSQX
         gSjUQ/+nU0GYkICd0wtdg3k/f5FQEqfXGQVeurRlWr0DvjSSN8ZiCofWBVyXhjV5xwsB
         YUYrXElc4T/RxShhhFCQzu7+FsVnFSAIdW0YIAUjedHqYssHL4K3tH+BWN25WoOYIQFm
         9Q+ZzVdrEdmHSizVPOyXEhw99hiesHJK2Dfu6V8HWymv32ipznJuzzedfCDSi5JTq+vq
         XiynsrCtNBpWdvkOIDdeJO8M7twbQCag72903IXCuTo2czjPFsuMyfgH5xiBt3wha+48
         jqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396997; x=1792001797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9GuqCKMi/hN2ncI5Ot6sRINUqKwZdItx3f86TmeMcg=;
        b=FAt4IqTjfDP+dN9/GxCvxyb9mED+k+CPrgPux8E8N0ArjPaztEaz6wE9j+ENXlqBpe
         W52iljSdAtZe0g2rJFTZGiY/Z3bmgbURSLKtquPpfywhbOS7WtWgB7b5V43bJPuaNpWz
         dZxPhfwvFFBTMMNriv08gVhXhNoNukwyvj5MfjPc5K+/DRhxTMw8jwM/iGVoAHVYJ6ky
         rIFa2uWYeajcIMHtIhp1VtvsmEU5Fuyf4+UFAb9tPBbO2duwbnbHT/EmqTSni9QdcLKu
         k+zGCzuTlJFgvwPNJHpGLE4VBuiEXo66PaBVT87fqyhYhqMD2zZDkZ2PDF7aOe4D7Z0V
         /LAg==
X-Forwarded-Encrypted: i=1; AKwUvBxe64LZ9GegXi+9y+DdVhg259Gp6Hhk1Hx/hZin+DaCB2FVo/nGBf/N/4TfQW2Euxem25DB9iKk3SI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJxmtPlKvB1lmxoKuyQNGd7uZG92xZbWHbooFBA3gv9iBsdZx0n
	m3k1QrkzzMOlLJMvzAImxJ2jHG46n362Xy0MtOC9+wtXkHTd2Xam8uG2zAH/oSpvrPtfJ6BiqeR
	valR0yItapw==
X-Gm-Gg: AYBFou3Z/zftzDm36NPVKSXFpldHVkm7wTu4QaFBmbQT3cSdKI7OkZY5UGaS6ByaZJU
	DTLkmwBkpoaIHEZYd9pNT7NiqSOsBLuYNfi7Erj0f4ebJxV1qhAbmTfkGwY+H5ZtDs0bQy7qkO/
	1LlqcZfEqqTUxuzlg/F66tTKZxt9n2n6xhOpUGtU7XqbY0CA7ygRsGCouJcM90/tlxKfmpsrFJ4
	9pqO+ox1PeDEJ5P9f2CrgbDdv4XujKyPXrOYEl0owSFMjN4C5u9WKzYQ2AwBsSLs3dTEvyoJ7w5
	9H25gnDLdUrNqQJ4E/Meg0vSx0qA0DbYlaB1mBCLS4nGfuv+hAVWScbnRy5SJW2ddUm7HHahJw9
	dEsBGoyaJfqebbJaeP+KRkVvLQ9xe7LDa1QVFYJxVxGo06ScvkS5bjVrn4o39OLrKsfpmSt8gAk
	tOU3cRgEVvily7aD9yP3CG0aHTnHI3HyzO55CpOS2UxhlK0oKXtZrsJSHwIvOJ9Uc0KT1INaUal
	SGer2jo50a1CdE=
X-Received: by 2002:a05:6214:29ea:b0:917:8400:5eec with SMTP id 6a1803df08f44-919976fd758mr60391986d6.5.1791396996945;
        Wed, 07 Oct 2026 11:16:36 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 18:16:15 +0000
Subject: [PATCH net-next 2/9] net/mlx5e: check for failure when pulling the
 Ethernet header after XDP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-pskb-pull-tail-drivers-v1-2-9512b0fb977b@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791396985; l=1491;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=zznhnNGgkEt9ZSSy2T9PlgogR6INn8I/GpUQzjq8ahE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QM+jiGljpi2X00qowHNyzmeos/hw24wETOq7O8HQRrlF1LPa5A0l/9HtyUoj5T4Hstal4F6tvLe
 zEFqab3/2JAY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-42698a/1791396998-1A4DB9EA-6A0B5F53/0/0
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


