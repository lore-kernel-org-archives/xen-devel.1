Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EB9CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 17:56:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442624.1660154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEVs4-0002S5-Sf; Wed, 07 Oct 2026 17:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442624.1660154; Wed, 07 Oct 2026 17:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEVs4-0002Ry-Ph; Wed, 07 Oct 2026 17:56:04 +0000
Received: by outflank-mailman (input) for mailman id 1442624;
 Wed, 07 Oct 2026 17:56:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEVs3-0002Ro-Cr
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 17:56:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEVs2-0010dr-1l
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 19:56:02 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac687b1-2eae-0a2a0a5409dd-0a2a4502cd82-0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 19:56:01 +0200
Received: from [209.85.160.182] (helo=mail-qt1-f182.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac687b0-6ca4-0a2a45020019-d155a0b6e1ad-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 19:56:01 +0200
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-53397554beaso41838261cf.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 10:56:01 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5357211719csm25090341cf.16.2026.10.07.10.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 10:55:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791395760; x=1792000560; darn=lists.xenproject.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xmwkg4obehY78DK/gvFot3vkf85Y9oVRiaNJ/eUX4mE=;
        b=PDRgnwm1BmWnMlYaMAeH5TREiqIb3lGPIg+IEDibTY3XBVuK/e+SJE8tXxDyRz2HyW
         kJ3iswG26nj/CHRI/4rSLqhX334T2p4Nmm4aZfSnPqx9tqPT0UltBVdMGZ+b/3KGuOBH
         bJ0j6zoDA9jYoiP6OclkK6w+0JIry9PhXPoplSIkYcRfeTUq3rtddSjFc3M+YcUNOAHt
         VBJT2ui8w/lVQk1bekebIxyXpfqjlsQdN31XNVaEpG6ockVs4LEyMGt6rVZSBMdTfGG2
         rPskN/1DL/heLp8lvFt3jNA9UazHXUi/MEvaHJhpLXoRaFuVDAp2d8tlYpgp7Uuts2/W
         MW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791395760; x=1792000560;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xmwkg4obehY78DK/gvFot3vkf85Y9oVRiaNJ/eUX4mE=;
        b=a/dEVEGJfVE75oW0WrqmwG0CpKW7Z5HDF7NUyMJqKb37JmPoHLOR5W+LG6bmQYE7NM
         56aQmIisCoH/7ELSGccyLUCUmJr5Z5R8AzRdXgIDQOIdolZ9K/idn/e0QxD9vNegT44H
         Uv9TgSzINRBqK8T1HRYp3sDFS6OqSBkjh0NI3BbrjKDQqkVfU1HH8kgPwg5+efPte/eT
         hphy4bFq70cRLwhzCLrWbzKYiriBOzcWjCoaaP8gmIb793kygBLTEu8TDq7aT2IWD8sN
         PtKdLMsHs1JEIjacSXUburRTO8rgIUCW391snlP00Fd4cKrK7qR5xuMf5p8Gyhp3I7Iz
         GI4g==
X-Gm-Message-State: AFuF++lU1pASJSdOayvwrQ+ia8r0KPKFFyo/4JeCq2pzVQMJyO0QKR/T
	0unhJw4Q8DjQ4QMtM37b8QiYZT1DbdXdxSkCbSNX/sz2A6q7tTWTQwuu98aAwt374sQ=
X-Gm-Gg: AYBFou0KswvGVlPXdxzEyjhAPn41jNZFDSxEcIfROX/TnIVlSkABu31tFpeHibhwzsJ
	9zZODEwUmMLgVgNZGYdMD9P93VNgYeefo4wXcTqEvo5q+8TJaBosQd1VG296qkIJ+fJCrIN/v/y
	RAJgF3dvj97LYGGq9HvUD8rCeHScAYNcTrgu11BxGMR1lQAdRpVyW87rFW9GP/44e4goDqA4PI6
	YexVkV9cm6FgjzDDFVUvYOp/3ppbXMv4zOaQNtEQUSTN1fUNpwGxJ1JuTUGpjQZamwCA9YqQZO0
	OZqbEF+t50OSiKATZ0qE7fXTQtmZLXW36zBCrpy3RHUCR1ZwiHOx5SKy1VGN7zDX1OExK3zJ+A8
	z+tnU3S5XsdXWD6gQlUWeflceRuxZJr3I6DoI83JJueOoumIMn8vNS7rq7mZTnAZq/v7o6Qq9Zv
	jxs8vUdRhZb+oD9/le/dSsZKyWBJUhp+UhMfb+ytQE03KX25hHSfKUZjsqOco9Pcb/SvgiSsF6I
	lzlBNT8AHABtHU=
X-Received: by 2002:a05:622a:228f:b0:532:d202:3280 with SMTP id d75a77b69052e-53575587ed0mr53145321cf.17.1791395759016;
        Wed, 07 Oct 2026 10:55:59 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 17:55:40 +0000
Subject: [PATCH net] xen/netfront: drop RX packets with a short Ethernet
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-xen-netfront-short-head-v1-1-12d7113a7e4e@toxicpanda.com>
X-B4-Tracking: v=1; b=H4sIAJyHxmoC/3WNzQrCMBCEX6Xs2aVpiUF9FekhP1sTkaRkoxRK3
 92knj3Ox8w3GzDlQAy3boNMn8AhxRqGUwfW6/ggDK5mGMWoBiEUGokrRYxU5pxiQfYpF/SkHcr
 z5UrkalEpqIIl0xzWQ36HOoDpB/ltnmRL07aa0Uxoso7WN/RaeiP7A/45gn3/ApL5MHK4AAAA
X-Change-ID: 20261006-b4-xen-netfront-short-head-4589eed26166
To: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chris Wright <chrisw@sous-sol.org>, 
 Jeremy Fitzhardinge <jeremy@xensource.com>, Jeff Garzik <jeff@garzik.org>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791395753; l=2871;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=A37dHJSUMP/nvKcIqGBinBiB2RmDmS9OMtLDSfYEGv4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBma8pM3Gytl7OfKxBBYVgGtx7BbS2eOhz5s1BtEXfNAHtDhR2In+nspjxyU+mEHrN5zQE+wIHz
 sHiMpR5ErGQA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-720697/1791395761-668B42AC-A3C06F9F/0/0
X-purgate-type: clean
X-purgate-size: 2873

handle_incoming_queue() pulls pull_to bytes into the head before
calling eth_type_trans().  pull_to is the length of the first RX slot,
capped at RX_COPY_THRESHOLD, and that length comes from the backend.
Nothing checks it against ETH_HLEN.

If the first slot is shorter than ETH_HLEN and more slots follow, the
head ends up shorter than an Ethernet header while skb->len is longer,
and eth_type_trans() BUG()s in __skb_pull().  If the whole packet is
shorter than ETH_HLEN, eth_type_trans() reads the header past the end
of the data instead.

Pull at least ETH_HLEN, and drop the packet if that fails, which also
drops packets too short to hold an Ethernet header.  This also checks
the return value of the pull, which was ignored.

Fixes: 0d160211965b ("xen: add virtual network device driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
I found this reading the code while going through the callers of
__pskb_pull_tail().  To check it I ran a guest under QEMU's KVM Xen
emulation with QEMU's xen_nic backend changed to split some frames
across several RX slots.  Without this patch, a frame with an 8 byte
first slot followed by a second slot hits the BUG() at
include/linux/skbuff.h in eth_type_trans(), called from xennet_poll().
With it, frames with a 1-13 byte first slot arrive intact, frames
shorter than an Ethernet header are dropped and counted in rx_errors,
and ordinary traffic is unaffected.

There's a net-next series converting the other __pskb_pull_tail()
callers in drivers, including the one in xennet_fill_frags().  It
doesn't touch handle_incoming_queue(), so the two don't conflict.

Thanks,
Josef
---
 drivers/net/xen-netfront.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 2ed673649c48..d269457e839e 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -1234,8 +1234,16 @@ static int handle_incoming_queue(struct netfront_queue *queue,
 	while ((skb = __skb_dequeue(rxq)) != NULL) {
 		int pull_to = NETFRONT_SKB_CB(skb)->pull_to;
 
-		if (pull_to > skb_headlen(skb))
-			__pskb_pull_tail(skb, pull_to - skb_headlen(skb));
+		/* pull_to comes from the first slot's length, which the
+		 * backend controls.  Make sure the head holds at least an
+		 * Ethernet header for eth_type_trans().
+		 */
+		if (!pskb_may_pull(skb, max(pull_to, ETH_HLEN))) {
+			kfree_skb(skb);
+			packets_dropped++;
+			queue->info->netdev->stats.rx_errors++;
+			continue;
+		}
 
 		/* Ethernet work: Delayed to here as it peeks the header. */
 		skb->protocol = eth_type_trans(skb, queue->info->netdev);

---
base-commit: d5a007b9b457c915ab1a53227e8939e4018aa97a
change-id: 20261006-b4-xen-netfront-short-head-4589eed26166


