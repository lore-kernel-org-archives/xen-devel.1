Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1205DCCF2E3
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 13:51:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454409.1668050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInm9-0002FN-SZ; Mon, 19 Oct 2026 13:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454409.1668050; Mon, 19 Oct 2026 13:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInm9-0002F1-Jo; Mon, 19 Oct 2026 13:51:41 +0000
Received: by outflank-mailman (input) for mailman id 1454409;
 Mon, 19 Oct 2026 13:51:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xInm7-0001yV-Q5
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 13:51:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xInm7-00EenQ-6O
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:51:39 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad6205c-2eae-0a2a0a5409dd-0a2a45019992-38
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:39 +0200
Received: from [209.85.160.176] (helo=mail-qt1-f176.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad6206a-5984-0a2a45010019-d155a0b0ec31-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:39 +0200
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-5365d725440so11246871cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 06:51:38 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.241])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5363455e7d2sm89038411cf.13.2026.10.19.06.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 06:51:37 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792417898; x=1793022698; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2su03NSLDI+QURR7+Op6WIlpfTiC3EObk5mJFR1rWs=;
        b=HsfCsgzQfm/3r3/QcfhDFyzF5yj30q3oaOZWVm+pGGSI2QygIV10tqs61KJrXqUfWv
         rgJmuXKpa9kfpdDFnYg9XO0lTx+p9AxaQvBLFUqlxll6q56EgTX5Gzu45c8evfUJEfOB
         hjnop1rNQ97I8cRH7jl7sUc4HkSUyg2eckwt8JrWEuOpempCsHne71YgDhb6Z4VZkwpF
         MgKXafAdo4vbpPt7eRt3MHZi1yuLXX6eEzkousg4gU5Xgqw/uUZGHXYHXr5B4Y0lq2L9
         ZiF+b54VgFUAR5Hoqn87/hAMryWD/zAy5YDTkU1Ig4JLAPQbfiTnsCIDrvBuAIxT92cs
         7CkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417898; x=1793022698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l2su03NSLDI+QURR7+Op6WIlpfTiC3EObk5mJFR1rWs=;
        b=VjLPt6f6aqLb8lbI5SywT0mIcYX6+p5hF368Na/wdYKk9axiEhF64qxH4M6lloMPXp
         67A7zq8TgKBDJ5mdZVrqE82YIKdVi2CxIsIVq6zBrgHMhpNNtrzFIQ6c3bgU7UjCFS8L
         ttQWPOAuJ2dD8eU2ULZxC5c2x5Sh4mi4DlnQ/+E2MspZ4oY15Ba12+h/LS6sf3LFEn3l
         nx9oDKUOYGApPUYys3LrTb7+QhnAn0UCJimqjifXFa7iUyyzV5YJDBFei7PcIpx7SVrF
         G/QwFtGvlt0iWvOq3G46DvBnsSdOhCA0+OAPAsoJMLDhQe4KIxUbIpXSg3qIn4VfOSAT
         x0DQ==
X-Forwarded-Encrypted: i=1; AKwUvBx41moZ2nvS2Z5fWGbdAJMvjplnBNg0/vEhBVJzso0Uvu54HKI8HX7F23M1Mo9IjCcohplRX2ClheA=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLb1GAjlWuQRxcuTuEa/B6Ca3DqW2wQ8DbGpurm7UVrB1jdiwC5
	DSaIT757/AjpFu2C+bZH4Kcvt5IIFZNxwHfQhzMyqHs0u26xvft09JL7epnpCrkjn+I=
X-Gm-Gg: AYBFou20fuSuEU/pTxW7AeCQCVzTrt32NERR9mtuC6/SYaxEU9YAD/fOXUyubYJ2llE
	n1rb1UV46fvyaWrGiMAbnq4zJ1rf6a6YlLoTjTAP8YUaj/8DAP7lYfrw0o2sz3KGdXLVnvVZsud
	bAAOHpj+6QW/4v1M+wjLtuxRO0XuUAmW01zYMC0pKN01Ze7knI0CpYQgULfWQyYyirJhKfBY45O
	FqqqGGIQz14I++LXHenJA0l/gbbA3nLZgT1GhDCpv25uRDJs+dR/OE/yuPa1AS81LmMAmXyibMm
	WWxf7Cgo9r11hVJEgDqao/A2QHKslhZMOXV85Zn4s9+RdW4zaCxwYEFIAAf2hSmUv0E4aSS2Cum
	LFqAJKix9poBuclcZEXn/89iAgBfTrU8hBlGNyH7d0BwIZIiy/I+5hhR5UipPJb/ISMKW/led41
	fjac9Mdm9vXl3FIUPTyWG+mIjsi/oVl8iQsxcRMOPwkVki1GChhFz1Ek5oMxRr4+flrqt0flxBu
	xBDfpiLLeDcNMI=
X-Received: by 2002:a05:622a:1b87:b0:536:702c:f8ea with SMTP id d75a77b69052e-536702cfb33mr37062611cf.47.1792417897687;
        Mon, 19 Oct 2026 06:51:37 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 19 Oct 2026 13:50:47 +0000
Subject: [PATCH net-next 13/15] xen-netfront: don't BUG() when
 skb_copy_bits() fails in bounce_skb()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-skbuff-bug-on-followups-v1-13-41dbef50b9f7@toxicpanda.com>
References: <20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com>
In-Reply-To: <20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Fernando Fernandez Mancera <fmancera@suse.de>, 
 Mina Almasry <almasrymina@google.com>, 
 David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792417849; l=1219;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=9EvzAU9EO5dyvCGQMaA1nd2saqGuALWIDCXk9Xn6dMo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMKSzC4sHZmaSUvthhUD2jAMmS0Nr86UIBJrUbV6zvlVJH8olJ0s62bKQw5Ehhrzn/DanWtOPAh
 Q6nevl7Ie1gM=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d62444/1792417899-BF86F757-7C49BF39/0/0
X-purgate-type: clean
X-purgate-size: 1221

bounce_skb() is an open-coded skb_copy() for skbs whose data isn't
page-aligned, and it has the same BUG_ON(skb_copy_bits()).
skb_copy_bits() only fails when the skb's lengths don't add up.

bounce_skb() already frees the new skb and returns NULL when the
allocation comes back misaligned, and xennet_start_xmit() drops the
packet in that case.  Take the same path, with a
DEBUG_NET_WARN_ON_ONCE() for debug kernels.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/xen-netfront.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index fdcb91042f29..17811d81937c 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -695,7 +695,12 @@ static struct sk_buff *bounce_skb(const struct sk_buff *skb)
 	/* Set the tail pointer and length */
 	skb_put(n, skb->len);
 
-	BUG_ON(skb_copy_bits(skb, -headerlen, n->head, headerlen + skb->len));
+	if (unlikely(skb_copy_bits(skb, -headerlen, n->head,
+				   headerlen + skb->len))) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		kfree_skb(n);
+		return NULL;
+	}
 
 	skb_copy_header(n, skb);
 	return n;

-- 
2.55.0


