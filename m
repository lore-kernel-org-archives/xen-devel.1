Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B58CA6007
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 18:17:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442674.1660245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWC3-0000ea-Lx; Wed, 07 Oct 2026 18:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442674.1660245; Wed, 07 Oct 2026 18:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWC3-0000eR-Hy; Wed, 07 Oct 2026 18:16:43 +0000
Received: by outflank-mailman (input) for mailman id 1442674;
 Wed, 07 Oct 2026 18:16:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEWC2-0000Uw-Tk
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 18:16:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEWC2-00A5su-Ao
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 20:16:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c88-8faa-0a2a0a5109dd-0a2a4506d70c-4
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:42 +0200
Received: from [209.85.222.169] (helo=mail-qk1-f169.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c89-195a-0a2a45060019-d155dea9d146-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:42 +0200
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-93e4c00d71aso163416385a.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 11:16:41 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.250])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93e9915a259sm272174685a.22.2026.10.07.11.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 11:16:40 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791397001; x=1792001801; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSCgQuUXGYAa0Wwwh5eq4aENwa4g4z1qSYLp4/+HlX0=;
        b=kgz+XjzJSHj62mJROPlLOd+zkISk/fKGacJO+vW/RSqeqq5G/QUhOTHrIqLvi/xT53
         THNJ91vpkvX3eiP741heH01ASqFV1p1NxyumdtXRWRD5UEE8dOiaLbWbb00H6tbFRNZq
         XAgKVQEeFX7oAeZY/UqaQazNuPsM8pRgx3zvgHbXG7rGbXXU0CNlRCM4mPnppw5Bot+F
         YeI79j10aVhJz0i8xj/QhCYrO/FVtBJkHDJoxkAuBxeLT0UO4VAX4d9oDB+xzpkPto17
         0T7zHmB8KAa6P6WB03q3zp1dq8HQxVHJBv4zy1wykBAhryKTJFWoaXwP0x6sYOHCeZv7
         dqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397001; x=1792001801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSCgQuUXGYAa0Wwwh5eq4aENwa4g4z1qSYLp4/+HlX0=;
        b=WFnjQEQp/ox2zRKhp/gzSvaMPe+z4a/mrwoUA7QxPQuBeb1YyHNFLysWi4GJWRoTxp
         BTBKFpP8U8iAndifdmlTfsmP9f34Qm7/jG0J5CBw+DrFXBvB21zEfqDwlzIxoqaOXYem
         Mb7WtInqyzDrs+qARJfTbl5o2AATNbOyQxsvIjrHuVd8+t/ASkNjBAFi0YNrAoEbEB8k
         73LUZ/q7TJpKgCfD5zA6NVYumBeRCME+868aFU0wXXpfGPyR23U8KxIofCNznwaAdYk+
         oSzVjlscHoOZhmSRaznmSI0l5cwcx/gZ4Ni4QprlE0SkXpQbJGR8aCA4MTJCC0Vjw+0n
         Sljw==
X-Forwarded-Encrypted: i=1; AKwUvBwNrnTczdXGoPcDQ+QytEn1NlTX8O538qZbBE9Vx0ZkSV2J6Qn2ntEzwAeQTfNghy0vmNGcesEa9qk=@lists.xenproject.org
X-Gm-Message-State: AFuF++li6p/UFqONAf5jJ/cVa0wCHumO5GxHkBO1NRI795k5LEt+zpDB
	xkRFoTOLYU2m3O1bfA33v1sJ+1/iRBMG7utJ9ltrKmD88TYA7aJsIXAYAVb00ROdGXbnrIiifWX
	4MWrBzLcmdg==
X-Gm-Gg: AYBFou3fJg/bhioe2BpsoXbkBtEh5vfb2GWcY66/I1bQtDNs857P9sImbSXnH+6kxWX
	lFmlnROje2EX1py2bhq08V2kV4IJL0x82zI4iLt9ql3NgqyNV+0Za7E3/KwxLHxWVenrlgKCF4t
	9iDDMCPUzLI6ZA6E7J80jKl/bI/NAknqgZk27NS+fNPSXGAE5mldtsAVaYCGeyonptkBNT/uz2B
	BOH/IkSxIDeWTx6p44qpfiBloJKfTfSmcAiGJOfxYcgAl3k1pxmp3ssMe2Bn+V/jpsVkCaccRbg
	VPJKdkX5KJcvhPXlAyfN2rWJTobkOkq8/2/2nj82M61Z++r4r57BcgIbgMKVsiCXfez/xl2ojxl
	YjSRXyPk2jdNEb0D1Go4SbgXotymyZl6WXzKq4mrvzStioak5KEztNYqf+l3UAiai5foZ0LOjG+
	QnuQn3VBUZrnpPgoyr/Gc79DulFqRXEX6UTBLPjAYugiKrO0Vo4jrzLyNFFpPuWVEvq0QFaALPg
	95J6C/KIKys1fc=
X-Received: by 2002:a05:620a:29c7:b0:936:dc4c:3bf4 with SMTP id af79cd13be357-93e9b7436bamr598926085a.28.1791397000824;
        Wed, 07 Oct 2026 11:16:40 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 18:16:17 +0000
Subject: [PATCH net-next 4/9] xen/netfront: check for failure when pulling
 in xennet_fill_frags()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-pskb-pull-tail-drivers-v1-4-9512b0fb977b@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791396985; l=2095;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=SzoPfHs/Y0Yp5wMeUYR89lBIZmoL94dSQOZucEHgjz8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QE2mPs8pQLqezwaIQAKe007VJT1pjZBj9lcqG8tW/4kuSaDQpOlcqMEPoJV+xlZe2oi4kfjBSKZ
 BVy2K6gSrcAQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-16d1c6/1791397002-F6C7777B-3A4C5F99/0/0
X-purgate-type: clean
X-purgate-size: 2097

When the skb already has MAX_SKB_FRAGS frags, xennet_fill_frags() pulls
the start of the packet into the head to try to free up a frag slot.
It ignores the return value of __pskb_pull_tail(), which works out only
because the nr_frags check right after it drops the packet if no slot
was freed.

Use pskb_may_pull() and take the error path explicitly if it fails.
pskb_may_pull() does nothing if the head already holds pull_to bytes,
so the BUG_ON() for pull_to < skb_headlen(skb), which protected the
subtraction, can go.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/xen-netfront.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 2ed673649c48..6e01a883cc64 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -1174,18 +1174,11 @@ static int xennet_fill_frags(struct netfront_queue *queue,
 
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
+		if (skb_shinfo(skb)->nr_frags == MAX_SKB_FRAGS &&
+		    unlikely(!pskb_may_pull(skb, NETFRONT_SKB_CB(skb)->pull_to)))
+			goto err;
+		if (unlikely(skb_shinfo(skb)->nr_frags >= MAX_SKB_FRAGS))
+			goto err;
 
 		skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
 				skb_frag_page(nfrag),
@@ -1198,6 +1191,11 @@ static int xennet_fill_frags(struct netfront_queue *queue,
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


