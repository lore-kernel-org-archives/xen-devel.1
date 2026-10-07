Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0ACCA6002
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 18:16:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442671.1660218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWBx-0008Na-UT; Wed, 07 Oct 2026 18:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442671.1660218; Wed, 07 Oct 2026 18:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWBx-0008NT-Rj; Wed, 07 Oct 2026 18:16:37 +0000
Received: by outflank-mailman (input) for mailman id 1442671;
 Wed, 07 Oct 2026 18:16:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEWBw-0008Mw-AS
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 18:16:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEWBv-00GBp9-Ni
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 20:16:35 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c6e-e002-0a2a0a5209dd-0a2a4508a346-16
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:35 +0200
Received: from [209.85.160.180] (helo=mail-qt1-f180.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c82-f659-0a2a45080019-d155a0b4c5b8-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:35 +0200
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-5350cc60b51so35409151cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 11:16:35 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-53572163ceesm25476671cf.20.2026.10.07.11.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 11:16:33 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791396994; x=1792001794; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3FpKl0vN7petfzZgqIhlc2NP9KQ4OIDsR/ta4Cqq6o=;
        b=L6+K1GKqZS8REPfMl1v1AMZKm1L4b1reWXOetaixnleuy2ZrGbopmQolMbW3xmMkEy
         qfqej1S9GPvQaOZ9vWM1dPh7sEKHUVyl2i0JozykNWBaXXbZKovkaT28vwSG7pcBmX8w
         s04bFiqDa454EuU+WgAZmnLAVmScp5352vWI3vE7CyDKTCLoLcKxNKNpMv8j/nG/Xsah
         x2MfhqRuLS2DXytfQHz2Ub+7rrEFwMVvLtfl2FpkUUYazNoYUqdLxrQ5kSgipcRORsCJ
         FskO68cqF7awLnvIfo5A0Xq4TbDH3Z+svngpPpbMu0GVtupOtPgo+LSD2ao7PEPalqPv
         oPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396994; x=1792001794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a3FpKl0vN7petfzZgqIhlc2NP9KQ4OIDsR/ta4Cqq6o=;
        b=UsSrjGa0wMae3GNujnhtrjv1evqJyrn3C7y6gZYjme1iAmOQ/uWrRHQUnTLE0mhuis
         Fp2sovRPT9IggO2I341wKOVHO7PZu9TETHiMxCMefRY2mHqN4Zui3Udsb7MLpxglZ86g
         XcGMWr3zOhbKKUtHUXReVzM3y7edn8d963t4C2NeG4shsbDrexsy9vscyOrwoLwgDfqa
         AhpBOYJzwnYBC2jCi+cVEnNl2ha+DY+S8iIIRIEegOuljS9eK5xw3TDnLlTqS8Gqrs2A
         H1SNSwXp7GY92j6/O9LIr1qxWtE0Dd7W67bK62R5gfEBK0LkUQj9Lm3w8yv/cuKjfstn
         OHPA==
X-Forwarded-Encrypted: i=1; AKwUvByaVyJcPp2SPs6D6Jij48nMEk+7CLM88wjEab1xuRKirtfjUAu/4od14vhwUF7cOkjbhP9Vm76NZ7M=@lists.xenproject.org
X-Gm-Message-State: AFuF++mhij3/toWIv6AM8QBm0Skmk2cqF3WukQ+R8GPUdrlq+kdAE7Oj
	Se+XoUnSBuD3T1VNxMSFHGQMob5XPjGyM4mDtHm0aPBKLfOHmTMfOXTptbrjCyJ8ccjO1Tg3Kw2
	SJI9Q16XTyA==
X-Gm-Gg: AYBFou2ZVPu95on2fjVmq0YwZf9wShORn3taFXVp1QoO3OR4UZ0Gwv0qVa92CG0q3eC
	ez8BIL8pCeVwkdoA9GJF2POkeRWF/7p32rovQNQkXWRlFEMIk+kBcv7ywd7Tsoan2AWoyOChtSy
	dTBsm6m51AIWQOZiACIkaoyvwQTb/rRIs1OjYeKHYns5WtfIilh5pjxKFKSoKwuhXPsmzmkpj74
	Vmkn9RcisnWe+WX3KM9ZT7GSi1ddLe2lJxUY10PfloqIzlVcs3j63/S0od87uRWaDK+/ub+8RCF
	UQTiIcM4Qx5ZRh2H+q+TtgVexyFXmJJ6W4WjKlAaCyiX6UlimXE+qfYNbQNvvY/2KvY/BFFodCW
	M2xC+uOouNejFsMLNfw7XMWF1Z5GIB8omIOVm4ANnTjq9fqN1ZGpMS8bc9jJdpX0YC66/xuaeIy
	OQ5pNWb/jx7Dcqi5ziQB2byXTNxhGA+omqY9WbVHmhj1WZKklDM6YHsUXlC1DsbqW+b8iICDStl
	YiyqmenjB6Naz+AAt1mOTK2Cw==
X-Received: by 2002:a05:622a:e113:20b0:535:8607:d2e2 with SMTP id d75a77b69052e-5358607f4bamr14319421cf.56.1791396994064;
        Wed, 07 Oct 2026 11:16:34 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 18:16:14 +0000
Subject: [PATCH net-next 1/9] net: ftmac100: check for failure when pulling
 in the RX header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-pskb-pull-tail-drivers-v1-1-9512b0fb977b@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791396985; l=1745;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=YaVSidg1Bo1cVWoGQJzV4z/nBT+SLxbK+9NmCYkL+oY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLi6NM2cH1GaCjQ09bIeFY42DV/aexWSzx1/i1cHNG8H1PuIyQKikelvwnWe7Tmx+A2sBSVuNWU
 /fPwJUm49cAs=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c1860d/1791396995-D755C87B-191EB717/0/0
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


