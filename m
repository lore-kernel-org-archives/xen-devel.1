Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35767CA6016
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 21:03:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443807.1660957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvH6-0005MG-Ck; Thu, 08 Oct 2026 21:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443807.1660957; Thu, 08 Oct 2026 21:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvH6-0005Lx-8O; Thu, 08 Oct 2026 21:03:36 +0000
Received: by outflank-mailman (input) for mailman id 1443807;
 Thu, 08 Oct 2026 21:03:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEvH5-0005KG-KM
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 21:03:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEvH5-00H9qs-1L
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 23:03:35 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac804dd-e002-0a2a0a5209dd-0a2a45029fc4-40
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:35 +0200
Received: from [209.85.160.181] (helo=mail-qt1-f181.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac80526-6ca4-0a2a45020019-d155a0b5cccd-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:34 +0200
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-533972e0cccso34166731cf.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 14:03:34 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.246])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5359b46dda0sm3472151cf.4.2026.10.08.14.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 14:03:32 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791493413; x=1792098213; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXT5xqnUz/gqqG3F9wxnjnCJ7kPBk+m9Im3cz1NP6m0=;
        b=ZzwE3k+D0kR2U26YevlujJqJFej8h+t8jGgEM+2qaBrq3pW7tEqt55dOsvhmunp/A8
         dMGgnFKy9z0sDCAd12Puli/hGqxyN3FnN3QS80c8gfqr0WjQBJWwMzYtAsIcXKQruWOD
         Lf9IFNmsqkJvSoN87wWlkNtJLgsIJq0iH5cq+H3O+WyypA8xXBJaYv4F+/oLYlUv7flK
         U2APLIO8665AWtY+tI+utA0r3NcfHnKezoG02fczdmc1QdlePku4G/felyVdBf3PMyMg
         O+ZRaYU0QmoM8Lgpy5ltXn/1DfT0tuSjVzZuB9NGCEmDEjiyKw9ERTU0sQRQ7nboMTh9
         D47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493413; x=1792098213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXT5xqnUz/gqqG3F9wxnjnCJ7kPBk+m9Im3cz1NP6m0=;
        b=KrrXwBBBxXfjPZYmuT8/SBnvaIHfTRCwk4uggvVnLvegFnjEgJl3afLcpmr++zqVK4
         jv9nAN1C1Bkw0fYH6yVqTEoSD8ny8FwGpOmoWANQ9w7Cdf0rzhCHgFmLu3CpiUwt4KWI
         SxZvv1jfKtwovOqbJ+glxq0xvguGsD8aOmCQo6w6MjyEZL8Vr5xqHdT/lABmBhvc+CmG
         D3JA2HiBAv4coEP0ZCd3GsD85szS0TQIjh5saKR/xRQUphr1CpWBC6exrbaAAS04240v
         xGYaFfHTqjSnDTq6HwL6/FDmI2DVHrvhQRBNCM/1NWmL12rXdUTPOcKzMMpBzGKj3nS2
         asnw==
X-Forwarded-Encrypted: i=1; AKwUvBz7datNDS2jSTo4qNQZg/6Sg2YxnSWb4XQ3duD3kyH/b4XrcX1Y1MGK23JHOIcUlsO+sxybvUYMrNI=@lists.xenproject.org
X-Gm-Message-State: AFuF++nKwVmyO5tJaj4EEPgepg1dC4mCxNCaoLK1ugSPpTIJaDAbG2fR
	xQXr4ZKDRlK9gwIxd+iFP1cPpJ1QC9YdghYvwkgPh/NoDUDod6i2jHfpCjX+z9URCWk=
X-Gm-Gg: AYBFou1DYdgO80THkWrsRxQPAxkDhQVt90ylD2Ekxh9QZByuL7FFbTDg152OUrGbFWu
	EvxcsfeDi/2yE3go43dre+MViuGRCjhPk2F8yI7r7V4hzwVb33jLQNXzTzh3R5Z7TkIdz61RCej
	d5kMqd8RhBHq+JHp2zQPxLZ5cRYzp1TwMnOAF4BGFA7DT6odmOM+V/rFxFZ0I+mr0SfHF/2s9Kc
	z1ao8mE1X7rfx2HBDlT9LXhp7frYM/J+IHOJgq5o3/1HNQrSGJ0XU/VwryLKq9ho0Po28tTY8II
	vFzFqE3sV56alPzDC2sx2+AQ6KyQSmOIybhXxZJHKKRDLGtl4gY/g2mSPYOFG1i8RVg8qLeja+f
	eISak6vqdRdXvkREg3MpcyiqV3u/dYR8vOt0QYZe9lSBMu8F78I+f2RCZAbXA6kSwmgc7d+ixY4
	QB+VYLZWgeipXI7rLqC1zA78KjYxyHCu8bEhSTIV6EhFg4cwmnjrLABWwPSOwFsK69EBpyGm3QM
	K6rxIuOJbytLvc=
X-Received: by 2002:a05:622a:1a91:b0:535:70c4:9a94 with SMTP id d75a77b69052e-535757c8eecmr123953171cf.74.1791493413537;
        Thu, 08 Oct 2026 14:03:33 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 08 Oct 2026 21:02:52 +0000
Subject: [PATCH net-next v2 05/10] xen/netfront: check for failure when
 pulling in xennet_fill_frags()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-b4-pskb-pull-tail-drivers-v2-5-8f2bd9bee138@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791493385; l=2516;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=eg6ZiA9VrIpAG1HGYjPkKMEWwjo8D3VwigBhj0jOQMI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAYzg3nASJLuLmRvMNvnGKJmwP15K/QJrV/X+gIw+dmiWX6S/LgMrQ8OB+kIWHKPWdMQHYgaFiD
 sh9Hj7FexRAU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-720697/1791493415-F06A72AC-94772804/0/0
X-purgate-type: clean
X-purgate-size: 2518

When the skb already has MAX_SKB_FRAGS frags, xennet_fill_frags() calls
__pskb_pull_tail() to free up a frag slot.  That frees slots in two
ways: it pulls the start of the packet into the head, and it releases
empty frags, even when there's nothing left to pull.  The second part
is what commit d81c5054a5d1 ("xen/netfront: tolerate frags with no
data") relies on.  The return value is ignored, which works out only
because the nr_frags check right after it drops the packet if no slot
was freed.

Use pskb_may_pull() followed by skb_drop_empty_frags(), and take the
error path explicitly if either fails.  pskb_may_pull() does nothing if
the head already holds pull_to bytes, so the BUG_ON() for pull_to <
skb_headlen(skb), which protected the subtraction, can go.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/xen-netfront.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 2ed673649c48..007fa3bbc9e6 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -1174,18 +1174,15 @@ static int xennet_fill_frags(struct netfront_queue *queue,
 
 		RING_COPY_RESPONSE(&queue->rx, ++cons, &rx);
 
-		if (skb_shinfo(skb)->nr_frags == MAX_SKB_FRAGS) {
-			unsigned int pull_to = NETFRONT_SKB_CB(skb)->pull_to;
-
-			BUG_ON(pull_to < skb_headlen(skb));
-			__pskb_pull_tail(skb, pull_to - skb_headlen(skb));
-		}
-		if (unlikely(skb_shinfo(skb)->nr_frags >= MAX_SKB_FRAGS)) {
-			xennet_set_rx_rsp_cons(queue,
-					       ++cons + skb_queue_len(list));
-			kfree_skb(nskb);
-			return -ENOENT;
-		}
+		/* Out of frag slots: pull the start of the packet into the
+		 * head and drop empty frags to make room.
+		 */
+		if (skb_shinfo(skb)->nr_frags == MAX_SKB_FRAGS &&
+		    unlikely(!pskb_may_pull(skb, NETFRONT_SKB_CB(skb)->pull_to) ||
+			     skb_drop_empty_frags(skb, GFP_ATOMIC)))
+			goto err;
+		if (unlikely(skb_shinfo(skb)->nr_frags >= MAX_SKB_FRAGS))
+			goto err;
 
 		skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
 				skb_frag_page(nfrag),
@@ -1198,6 +1195,11 @@ static int xennet_fill_frags(struct netfront_queue *queue,
 	xennet_set_rx_rsp_cons(queue, cons);
 
 	return 0;
+
+err:
+	xennet_set_rx_rsp_cons(queue, ++cons + skb_queue_len(list));
+	kfree_skb(nskb);
+	return -ENOENT;
 }
 
 static int checksum_setup(struct net_device *dev, struct sk_buff *skb)

-- 
2.55.0


