Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15501CA6002
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 17:58:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442633.1660163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEVtr-00036X-9n; Wed, 07 Oct 2026 17:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442633.1660163; Wed, 07 Oct 2026 17:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEVtr-00036P-6S; Wed, 07 Oct 2026 17:57:55 +0000
Received: by outflank-mailman (input) for mailman id 1442633;
 Wed, 07 Oct 2026 17:57:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEVtp-00034i-Uj
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 17:57:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEVtp-002J09-Bc
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 19:57:53 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac687e2-2eae-0a2a0a5409dd-0a2a4503edca-36
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 19:57:53 +0200
Received: from [209.85.160.179] (helo=mail-qt1-f179.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68820-fae8-0a2a45030019-d155a0b3addf-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 19:57:53 +0200
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-53512cd2f85so21065801cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 10:57:52 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.251])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93e991fe1a1sm269754085a.43.2026.10.07.10.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 10:57:51 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791395872; x=1792000672; darn=lists.xenproject.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MAJHQ2Wkik4PqvnpAIT0i+1papDfY48uBw0Kb6tIGEA=;
        b=qk/aAx7b+rnaAChXJbeGcOdBURVLhhOc1OfbrcAWjvAFQa/allMxGwNUwj5WQdq7Z1
         n2sgYpi3N+PEX5X5LjYA8QdaOpZPx2WvXwV6MyqJRGZzlIOCqkATIFjO2e/5Mk9emA8b
         +AJu+KZLOzHGhQHnCJu6h3y7YylN6glWs5aQZTydS7MFUBMSOco6AMz4VHAB3fTHII/7
         xpCDMjv9HHDnRs7wy5EFSFs8N8aDRMCbZAixaMG/igTrG+Oha9+npmIcyQqj6cSNdHxc
         QR1CXjqurW5nXDfawhZ6EgW8k7aJ3FeD3jAM0cl1lDyhPTgxgytpHol8BdTguoJPr87m
         HFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791395872; x=1792000672;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MAJHQ2Wkik4PqvnpAIT0i+1papDfY48uBw0Kb6tIGEA=;
        b=kS0girR8SRxtpoJSyg5yADcxSOF22oZbJ4azVSAbf6lnIjSN+bkZynF5UXb+XYf4Lh
         sXtbTSHzMdxNYsQrM6hxVjg7jMCrrZvE97MqT9xOxTAuB0n1YyXr7QZkfGmVDgqPO5cm
         1s7UgV/BhWi5T1USin4c8YpK/71hkvR+gySr6faqufh6wFHNvkpfQF1+01WVJjf6Q6hb
         /U2F5VR9udoZqHhezJSYczo6C+qg+ToNHCZQucGEWXh3OPQImeAGbGF2SEEjWLuYlu0t
         G/rS0BDipNXwJjiNQ4iDAb9y8hyYaT6ZLtWomLHlQrz31tRTQpWccU7g7k6zCfQSOm83
         /vyQ==
X-Gm-Message-State: AFuF++nEoR5fioJOGg324CiIpho6HFMLLpVYT2RLUGPb2LaFi6omptt5
	9yaZjVYsPXiPHI8zXY9WseGXGRLdiYkBl9wN79vRk7ejj/VL71O/iPnilmL2ojqFIfI=
X-Gm-Gg: AYBFou0dUczssVppJcsmmLvTvqQKIhStSlA67CFZQyLCoeS3xsKxd2wxKcUHvfpEtNd
	aKsTEnFhcmEmf48x87t54CyKLbfSgrDf3j3A1AmC0sGA06gjp0dnFp4MLh0DG0r7YqetP5dpWsX
	ywkSATn5Dqmdi8BhARjUO+1uKAyx8QLgpn6kSYNYUY5D8FuL1+KqKiQrGRSIEaBNI2gTqEW0yPB
	vELNqno2ATjD7Z6pqXQwXtRa6eLuSkLZJUIZZQ1C9gUYbSUz1C5jD7ALdOR07sObE0vuYt0uNU+
	lZeM1BQcxTGiQWJ784UHMXcZYaKs1qgY62GII8mwy5ebVKjl4qV9FpTTfwGLlFlskHQ5qpiOh7M
	JAcxtNdxUXCFkWssV+UFZDGVhS45YayMQzy76ZFzfiINt3PEosy32t+cZbuCJAPDYlgnpktuQgS
	Ss2rOZ8FMLfXtalZgkmpYdsSwA/m05ZM0bYrnngBxQMPAxDUsHrXCTHquovSDBgkXaNMCWA6tCO
	Z1TPR/Cdj/FdWU=
X-Received: by 2002:a05:620a:890c:b0:93e:5b69:fa8 with SMTP id af79cd13be357-93e9b80d367mr562281185a.66.1791395871851;
        Wed, 07 Oct 2026 10:57:51 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 17:57:32 +0000
Subject: [PATCH net] xen/netfront: don't leak the skb when
 xennet_fill_frags() fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-xen-netfront-fill-frags-leak-v1-1-a8a01ff9cd52@toxicpanda.com>
X-B4-Tracking: v=1; b=H4sIAAyIxmoC/32NQQ6DIBREr2L+uj+ipZD0Ko0LwI/SEjRAGxPj3
 Qt23+W8zMzbIVF0lODe7BDp45JbQgndpQEzqzARurFk6FkvOsYkao4bBQyUbVxCRuu8RxvVlNC
 TeuH1Jo2SXIwkNJSXNZJ122l4QFnB8IPprZ9kcv2uNa0SoY4qmLkiv7aatyf8Z4Pj+AJbKHhWw
 gAAAA==
X-Change-ID: 20261007-b4-xen-netfront-fill-frags-leak-357ca746de6b
To: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791395867; l=1952;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=8siqpym+SZiWtWrY6ilp/qzOSB35ebH+f54wdBWICCI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKPBUTwP/hi5b4ZMT7RDyKAACyTKaU+F86iAtqdwrk+vWoZzfHOvsW0aj2tgmsgdCJbxvHAP8g7
 hKN5N3lq1pwY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-33051d/1791395873-77CC34E9-2CC44285/0/0
X-purgate-type: clean
X-purgate-size: 1954

When a response chain has more slots than fit in the skb's frags,
xennet_fill_frags() returns an error and xennet_poll() jumps to its
error path.  That path moves what's left on tmpq to errq to be freed,
but the skb being filled was already dequeued from tmpq, so it's never
freed.  Each chain that overflows leaks the skb and the pages attached
to it as frags, and the backend decides how many slots it sends.

Put the skb back on tmpq before taking the error path, like the
xennet_set_skb_gso() failure just above it does.

Fixes: ad4f15dc2c70 ("xen/netfront: don't bug in case of too many frags")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
I found this while testing an unrelated netfront fix under QEMU's KVM
Xen emulation, with QEMU's xen_nic backend changed to spread frames
over more RX slots than netfront can fit.  kmemleak reported one
unreferenced skb from xennet_alloc_rx_buffers() for every frame that
overflowed.  With this patch the overflowing frames still take the
error path, and kmemleak no longer finds any skbs left behind by them.

Thanks,
Josef
---
 drivers/net/xen-netfront.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 2ed673649c48..e8675bdca595 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -1338,8 +1338,10 @@ static int xennet_poll(struct napi_struct *napi, int budget)
 		skb->data_len = rx->status;
 		skb->len += rx->status;
 
-		if (unlikely(xennet_fill_frags(queue, skb, &tmpq)))
+		if (unlikely(xennet_fill_frags(queue, skb, &tmpq))) {
+			__skb_queue_head(&tmpq, skb);
 			goto err;
+		}
 
 		if (rx->flags & XEN_NETRXF_csum_blank)
 			skb->ip_summed = CHECKSUM_PARTIAL;

---
base-commit: 23609bce9e1de525d1d0e73fc68c6e7971d0b49e
change-id: 20261007-b4-xen-netfront-fill-frags-leak-357ca746de6b


