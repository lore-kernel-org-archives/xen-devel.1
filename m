Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C0ACA6017
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 21:03:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443803.1660929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvGx-0004YV-JJ; Thu, 08 Oct 2026 21:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443803.1660929; Thu, 08 Oct 2026 21:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvGx-0004YO-FY; Thu, 08 Oct 2026 21:03:27 +0000
Received: by outflank-mailman (input) for mailman id 1443803;
 Thu, 08 Oct 2026 21:03:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEvGw-0004XO-C7
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 21:03:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEvGv-00Dgwy-PE
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 23:03:25 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac80516-e002-0a2a0a5209dd-0a2a4507bc3a-6
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:25 +0200
Received: from [209.85.222.180] (helo=mail-qk1-f180.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac8051c-b4ea-0a2a45070019-d155deb4dddf-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:25 +0200
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-93e55db58cfso502626885a.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 14:03:25 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93eb9724fd1sm26327885a.1.2026.10.08.14.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 14:03:22 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791493404; x=1792098204; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3FpKl0vN7petfzZgqIhlc2NP9KQ4OIDsR/ta4Cqq6o=;
        b=GgFIRCIc6+RrRH9YY0LiNlQMkOOtA2Yu5fxOdAoRjE3zr4/fG79ZEgmtDEw10yafpj
         6hOFlJMMceGjvYw0IjUXhZ9m4hHPThAFQOLDVgKTn5vtd+MRu1C5F42c0yAM/Ljk31aw
         fwqmYnatn3HQIuZZn+0UYss1/3feiLJXy8hCu7im+2CcWZQkt3BQX1qaEqH73A3lHGgo
         SatTKGqNnHOf4bSYlr27ZdHex7r8oauzRvL7hw6cQZoZ1SdaZaxNR+a7AdbRc60GDH+k
         iC3xH1PIEk7PApiQqvyP28KK28YjzAGaJJ2/avhvQ/fJLNQsy8uJH8nx7F26obOSVeen
         0tRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493404; x=1792098204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a3FpKl0vN7petfzZgqIhlc2NP9KQ4OIDsR/ta4Cqq6o=;
        b=VMi8rzJf5MDUZm8ckSovrYaC+6P0ycgitFxaFoS+wb6nF0wKY6F4JsksgerccnR0Kf
         gQBZVCYgxwk1QUi0mm8nAp5kBUXnBnAUzKYy+HtPsMKide+T2n/OSLFC2koRdmgqudF8
         NQ/3MsUsEK3bfLiO4FfMGPrcQVGR4hSsuftx/zxBOV52bdzOC7nw9aDyy9FnwM4LFjyX
         9L7hjxqLclTi0EXNc78LfoWb8Wgpjcv5b/1wvpW23sVDjeyzIz3MJud/0f1Pqe3bcak9
         rbaGeet8JrXum3m85kXQyRVehNwlioI5Dv8ADg03ux6AgGustrpZBS6MOa7MHPu6QinY
         0ihw==
X-Forwarded-Encrypted: i=1; AKwUvBzpHyIAUKG/kAzgVZ/XIywA3NHm7wOfce9el7WM2VlM1t6x44S6NhZIXgrEL8NhmWLWSCkwhLcDVEQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++ndG8uu98rrDGMax+euliB+hN2butf06ZxRB15oUU+wy8dXwH7i
	biqE8ZY33++pnsoyv6n1tD5FZ5s+tvUiCTZYaxfziFXWtrSOViClGZ9GXS5aKvnuNponf6tJ0/+
	a4kqB3ZNlPw==
X-Gm-Gg: AYBFou03kS++pDKW72t04OMOeR2k0P/67Y8RXsfFjEIEHRha2zT2yuiFqxXp2wt2dfC
	QLhW8d4X1yYPD6uW5XXSWzbBHqcwMkjqY9jjint6cZGFFihl/N15K2FhDrpImLk6Erpxbx3sQif
	mv/Fnm7vquK+swurdlcOfG+nLHuLG3MPNctd6lalQOnMaHF9V0+lgV5zhqo0Ryw/+tS4uG2gFNv
	SXfPL5k+PzZT6HhVa8VeNysfbUWWC0Y1LnXNAKN+YQ0PBWbaEdcAuQWOs5AkAG3pnSYW08i6UmA
	ictEMGOeew7wjUVqXiD4IRH9eNz7u0/BtDhzQAASJdv5egsJBFwDyItl36HbeE0PcpINFfnriV6
	ZAZVOTDf244yqOd49W0XvujlkrYSkoO2yZL5VFnFC1ljedgoF85v+ODLpOpffU0q2NGwM08z5pT
	JPj4n/GWSUNVGv313EucBYjNClybRbZhTv5MJdgVljxjySVobNk3dX5f2U6FS5uYbTUJ4qQAqHJ
	JtF1u2pwWdswpAuWZgeLfgW8A==
X-Received: by 2002:a05:620a:29c7:b0:93b:beb3:5898 with SMTP id af79cd13be357-93e9b807709mr1263365385a.49.1791493403829;
        Thu, 08 Oct 2026 14:03:23 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 08 Oct 2026 21:02:49 +0000
Subject: [PATCH net-next v2 02/10] net: ftmac100: check for failure when
 pulling in the RX header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-b4-pskb-pull-tail-drivers-v2-2-8f2bd9bee138@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791493384; l=1745;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=YaVSidg1Bo1cVWoGQJzV4z/nBT+SLxbK+9NmCYkL+oY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKPRKOQSDQ67QodM++vQrU2bAaf9t1GHfgEbAcRMIyyvBlr3tTyXLKb7mAyGosVPXukX94UmJf/
 pTxPq3ZQboAQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ef75cf/1791493405-A5AC0AE4-65613C8D/0/0
X-purgate-type: clean
X-purgate-size: 1747

ftmac100_rx_packet() uses __pskb_pull_tail() to pull either the
Ethernet header or, for small frames, the whole frame into the skb
head, and ignores the return value.  If that pull ever failed,
eth_type_trans() would find less than ETH_HLEN in the head and BUG()
in __skb_pull().

It doesn't fail today because the skb is freshly allocated, isn't
shared and has room in the head, but that's only true because of how
this driver allocates.  Use pskb_may_pull() for the header and
__skb_linearize() for small frames, which is what the two pulls are
doing, and drop the frame if either fails.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/faraday/ftmac100.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftmac100.c b/drivers/net/ethernet/faraday/ftmac100.c
index 40ba001d4b3f..a1eb04ead2d8 100644
--- a/drivers/net/ethernet/faraday/ftmac100.c
+++ b/drivers/net/ethernet/faraday/ftmac100.c
@@ -469,15 +469,21 @@ static bool ftmac100_rx_packet(struct ftmac100 *priv, int *processed)
 	if (length > 128) {
 		skb->truesize += PAGE_SIZE;
 		/* We pull the minimum amount into linear part */
-		__pskb_pull_tail(skb, ETH_HLEN);
+		ret = pskb_may_pull(skb, ETH_HLEN);
 	} else {
 		/* Small frames are copied into linear part to free one page */
-		__pskb_pull_tail(skb, length);
+		ret = !__skb_linearize(skb);
 	}
 	ftmac100_alloc_rx_page(priv, rxdes, GFP_ATOMIC);
 
 	ftmac100_rx_pointer_advance(priv);
 
+	if (unlikely(!ret)) {
+		netdev->stats.rx_dropped++;
+		kfree_skb(skb);
+		return true;
+	}
+
 	skb->protocol = eth_type_trans(skb, netdev);
 
 	netdev->stats.rx_packets++;

-- 
2.55.0


