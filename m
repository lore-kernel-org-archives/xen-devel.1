Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8876BCA6018
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 21:03:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443806.1660947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvH4-000558-3h; Thu, 08 Oct 2026 21:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443806.1660947; Thu, 08 Oct 2026 21:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvH4-00054s-01; Thu, 08 Oct 2026 21:03:34 +0000
Received: by outflank-mailman (input) for mailman id 1443806;
 Thu, 08 Oct 2026 21:03:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEvH2-0004qB-KW
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 21:03:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEvH2-00Dgxi-1O
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 23:03:32 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac804fb-2eae-0a2a0a5409dd-0a2a4503b842-30
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:32 +0200
Received: from [209.85.160.170] (helo=mail-qt1-f170.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac80523-fae8-0a2a45030019-d155a0aabcda-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:31 +0200
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-535179e995bso37088491cf.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 14:03:31 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93eb99074f7sm22172785a.46.2026.10.08.14.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 14:03:29 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791493410; x=1792098210; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blrnvRK83a0BrC00ZsKjSLnGbEsSK17m6K1yrBXm/SE=;
        b=SyZdNvttdFPvNh6xPf3rcjjSWeUYGF96LaiGtkNRwZuDLrcwZLqgv3AXf1lx0SxP+H
         Lng8mNLgZ8lp0EUhA9vSMv4JAfS10vE+kdYAyw5AyDSvoj8FuptLq8FIs4y8u3chiQbi
         QWiIq8rG+Ls85gu8Wn3Sx0kBMcjPU+sS/dHy3YFZeYGY2jODFcKdn64W8tdqRFfhggdc
         86fx73d6VkGMPriTV8Lv5SgwRmOz/WkUleQaWz0JbkxF/Ax6MB6Qk1T9FvxO6zL2l7Je
         fd3LOz1J2psyYaDEOFAkSM6cpRKl7Sqn0tEjtdjl0IrDNCnqpVBvRxPwrfbGuOoUnsdo
         H6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493410; x=1792098210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blrnvRK83a0BrC00ZsKjSLnGbEsSK17m6K1yrBXm/SE=;
        b=QYdAs2h1S3WOtXYwTCv01JQMOJcMu8/ci5fsD6U3jXjuEKJf1FJDasegb0Vc+4ZHQF
         lik9lQ89JtNDHh4lFcC1cK8mvPU0xBE1wVavCoOSkl5H8BZb8gwDxBXth+obnq7/Uq2P
         uBjo+TM7XD6Cl1nfbf/VVEiRWhc4G+nwByxMnqOXD46XWHA1sUI3iaFFjTvTjHbPDK+s
         dvsTY5lpFSAGhuMMDGPafDRiB+bOfsgnK3U4+Mes5VKkGKjfs8l2KMfUasyfEzMtAQmp
         3CLYC2JX/aBTLf+iC70qWY8VjVynaNNYFGOcjJy32xnboM55w5j0Hx6lEzqTBI9elBXK
         bvTw==
X-Forwarded-Encrypted: i=1; AKwUvByM7dc6tHZ2cpX7I2Kcx5h8XwHtNH2RWb3zqdQ6Pssr0tMk6CPEQC1X9zcN2UrDZb1wH2RwGeHQKzI=@lists.xenproject.org
X-Gm-Message-State: AFuF++nTR3pQjw+RyhgsLOCT3truQMyPBauITvJjvrwn04rSlyfDsAc9
	61Hg5zABZmL3BY+TTGAU0M2veo3lV/HY1b1TGze1BqSARWZMZCoeYocxfeU4S7eOCpk=
X-Gm-Gg: AYBFou3hKfZeVqKtus/AMBOi1gys630GIqhF2lJ4RC5XFY2LPcdUGVwtOvzTGPYsEeW
	CtQLvO1e7Ci1OtaP6YehP6VRfperyVHJ1qHCKv0+A00jbfGtGapncAHUGmn15at/oupmtJ5n6WK
	ps9FHAVwodPY7FYUW7osnng38faSavimz+DSxbaHfQiPLZuL1H+ch2t16sOGqAdFpm45zYwaJ58
	R6Mcy20eTdKfgm4Y4YmnfhCdBCsAsrRRz59eEl/7vP8QBS2Sx6p0EJXyMYpGkkj+06kg5dkpeNT
	q0NX5p5ZqrPV33IWeaPWGAFtou2fnU6CbZDYGmtW/fe0JiqL7Eo3qvlpddzizalT7GYxx0ickC4
	bQOPIG/d+hOnAoKvUGhFW0fvf1U3sGzX6CJpgcpFeFLRuEEIFkwGxMo15c/LVBKfFyWvNTmKhIc
	+ZNw/2L/kMb1M71CxsSNwUt2HMTx4xBQ3g6deCR3d0WL+1ID3STJ6qgKqq8l5S9aYArsPAtjCPc
	x88c1Z1cXqU1FE=
X-Received: by 2002:a05:620a:1d03:b0:93e:9809:dbff with SMTP id af79cd13be357-93e9b8ecbf4mr1178890585a.82.1791493410404;
        Thu, 08 Oct 2026 14:03:30 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 08 Oct 2026 21:02:51 +0000
Subject: [PATCH net-next v2 04/10] net: niu: check for failure when pulling
 in the RX header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-b4-pskb-pull-tail-drivers-v2-4-8f2bd9bee138@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791493385; l=1236;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=3f5WzTjnDsDOAnT0hR8gZXIWFT9KoT8c/AVMjDx6NOM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHTAZLO2IxS2OmXjiwrMC0xtj/kaDkW3OSxxKLc7dWB8wtA0dY5E/Ye18IDZRljWIONenVbHWP+
 B0r4Rpj6pmA0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-33051d/1791493412-778F24E9-429D3BF7/0/0
X-purgate-type: clean
X-purgate-size: 1238

niu_process_rx_pkt() uses __pskb_pull_tail() to pull the hardware RX
header and the Ethernet header into the skb head, and ignores the
return value.  If that pull failed, the skb_pull() of the RX header
right after it would BUG() in __skb_pull().

It doesn't fail today because the skb is freshly allocated, isn't
shared and has room in the head.  Use pskb_may_pull() anyway and drop
the packet if it fails, rather than depending on that.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/sun/niu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index c74a97fe5464..d1c0e868004d 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -3488,7 +3488,11 @@ static int niu_process_rx_pkt(struct napi_struct *napi, struct niu *np,
 
 	len += sizeof(*rh);
 	len = min_t(int, len, sizeof(*rh) + VLAN_ETH_HLEN);
-	__pskb_pull_tail(skb, len);
+	if (unlikely(!pskb_may_pull(skb, len))) {
+		rp->rx_dropped++;
+		kfree_skb(skb);
+		return num_rcr;
+	}
 
 	rh = (struct rx_pkt_hdr1 *) skb->data;
 	if (np->dev->features & NETIF_F_RXHASH)

-- 
2.55.0


