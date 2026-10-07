Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7ECCA6002
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 18:17:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442681.1660278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWCB-0001ZQ-1h; Wed, 07 Oct 2026 18:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442681.1660278; Wed, 07 Oct 2026 18:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWCA-0001ZA-Qm; Wed, 07 Oct 2026 18:16:50 +0000
Received: by outflank-mailman (input) for mailman id 1442681;
 Wed, 07 Oct 2026 18:16:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEWCA-0001UL-5W
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 18:16:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEWC9-00A5su-Im
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 20:16:49 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c77-8faa-0a2a0a5109dd-0a2a450a939e-24
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:49 +0200
Received: from [209.85.222.173] (helo=mail-qk1-f173.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c90-f2d2-0a2a450a0019-d155deadb59b-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:49 +0200
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-93e63522076so135693385a.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 11:16:49 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.250])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91996cb6482sm26056716d6.14.2026.10.07.11.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 11:16:47 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791397008; x=1792001808; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v9LzkPOzVBtC2oeBzL2RQojlIYdLdy9WRgZ+InvbO8E=;
        b=jqSlf4FXPAAnaa7WuWk+E6lsFP0qWQ+QLV7CT48ghhn0mUgUI1JzgN/oVvJdWPBALs
         S7cWGgOxFfo79yySLhWcmECUMGDpLQMIxLWGJi7Momr5eoqwXAykJjKIatCxoOIAiw5/
         1de6mvdJVynRVcubJbNoNQRhN2luua5h2rXXuEymYw0PZr08dCggwKtloW7IWwTQarnP
         w8JThd9AzIIxXXy4HCSqjbsG6HM7HmmcncjF6C5mbINxqtUnJ8vO3BRJ0TKttFEV03QX
         BlbazhgSArOeaz2kQAKb96YxWyJq9cWu8mCrBDpTPSb6tj7dqT1J6Qpdv9JVYz4+Wd8/
         UE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397008; x=1792001808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v9LzkPOzVBtC2oeBzL2RQojlIYdLdy9WRgZ+InvbO8E=;
        b=YYYmdfud6TZfWl2YxFLooK6UQncvYkxYDUcQKJK9fzvSxK3xYTdIsSW6nvu15qyMkb
         41ERYWt/kcI1ns01+pnByFsHf11pyYFc3ES/hgFW/ga/XGjFbvTfxS/jMr7PtAyZ30lP
         NgUyemw+E2bbKJ1fjreSrp6CiGzpYG/POrRn8R/09qJxwHf5M+NMto9TydmZTD17l4TF
         mynDFdLC1a99D3i8WezePx0XukE1XkIzdmfuUhV/u3ysS13pYuz+0FZTvxTUqle7ONeu
         +yBMN2ZBFBCEG7x0arernjUWclFLkoQ+oiKUkEYj3f3xqbtuxQ/LlW/c8OciQ0El86pM
         C3eQ==
X-Forwarded-Encrypted: i=1; AKwUvBx273cTtaXZmI+yL0w0+x4xhI75OAw+32rL4rTJG9SDmhmiBlvM5vJIjsn+fC2nZwXL6ccs8brIfgk=@lists.xenproject.org
X-Gm-Message-State: AFuF++nKwVvgqwGdKOhQGhEC0kyfRLsW/2bz35qnoq0crFZbzkWwj+DT
	BUd4Df4SNL5i7kWOdnqo5GIqNU8rAC7vnogOYX5UaB6rn9C32eiHGqYj9mwqTFV7DSdixGJlwxn
	8bxcjXDoDwA==
X-Gm-Gg: AYBFou07oLZNsjYJFfjNH49Xxo3DwqWOeCChLyZ/95HwRM1uXuY3n2sgAbULkU1IG9L
	kj1qHqcNt/7h0Gr/v5r12TAsUizudpfJBnv921n9DnHHFiq2Xwj2Foj2QSitTD/AGhUidiJbJNo
	afkKWEWkpGT/jAuQXV+RsOA1fwqHPvrNtNC9qEEYr2S4XDk1WhllcN/8ZfzK1xwOV08ArMxrhHk
	28QYF6cvrGE8xRB3KK0zTH+k4Axew9Xt0gZBcL0IyQcCcDo7btQCjoYeK0Z9UaqITtmL3D6l9sT
	FwrnVHpWYM3BIG+80hKHHcRAoD8gSe1afFgb41I+3D+//WlijlgUqtkHW6kTC5yU46X4c4lq+d3
	5RNLm2LdU8Z/NmT7dbn4a3C5gZ0bCaMz0xg5Vo7qU+K2EQ8KteCFQ0yBC4B0HIQM4IK/PkLjmPH
	Ep30dfoWXl+PUzJt4Q9eCp7J5xxrBVljI6jyaOFOaLME//jFCG0tsqpgDPz6++UHIyEfTVUQQIM
	DsFgZhFRaJgwEU=
X-Received: by 2002:a05:620a:1d01:b0:92e:bc28:5479 with SMTP id af79cd13be357-93e9b0d409fmr622164685a.2.1791397008056;
        Wed, 07 Oct 2026 11:16:48 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 18:16:21 +0000
Subject: [PATCH net-next 8/9] qlcnic: use pskb_may_pull() to pull excess TX
 frags into the head
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-pskb-pull-tail-drivers-v1-8-9512b0fb977b@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791396985; l=1162;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=SB4NDDKRAhqSJIc9FavKPbItFv2yX/PiEJ0MJpAzuVo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKawHW1ued0W6S4cwaeFnOXmxDTI/W4Hxcn7RUYBu6+BybT6utdZRP6YL9LzmS5Mmr1yUPxsj4f
 B1rA2kxPagA8=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-4011c0/1791397009-508CDCFC-FB0B9D0F/0/0
X-purgate-type: clean
X-purgate-size: 1164

qlcnic_xmit_frame() pulls the frags that don't fit in a TX descriptor
into the head with __pskb_pull_tail().  It already checks the result.
Switch to pskb_may_pull(), which takes the length the head should end
up with and checks it against the skb, so this driver no longer calls
__pskb_pull_tail() directly.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
index 761ef3bc8193..4a81d499e51c 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
@@ -682,7 +682,7 @@ netdev_tx_t qlcnic_xmit_frame(struct sk_buff *skb, struct net_device *netdev)
 		for (i = 0; i < (frag_count - QLCNIC_MAX_FRAGS_PER_TX); i++)
 			delta += skb_frag_size(&skb_shinfo(skb)->frags[i]);
 
-		if (!__pskb_pull_tail(skb, delta))
+		if (!pskb_may_pull(skb, skb_headlen(skb) + delta))
 			goto drop_packet;
 
 		frag_count = 1 + skb_shinfo(skb)->nr_frags;

-- 
2.55.0


