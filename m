Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAA1606A32E
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=r5NeNFlV
Received: from list by lists.xenproject.org with outflank-mailman.1468951.1678033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gw-0001qk-F6; Tue, 03 Nov 2026 02:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468951.1678033; Tue, 03 Nov 2026 02:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gw-0001pv-6J; Tue, 03 Nov 2026 02:29:14 +0000
Received: by outflank-mailman (input) for mailman id 1468951;
 Tue, 03 Nov 2026 02:29:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xO4Gu-0001N8-5S
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:29:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4Gt-006j9s-I2
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:29:11 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae94693-8faa-0a2a0a5109dd-0a2a4503aa56-20
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:11 +0100
Received: from [209.85.222.172] (helo=mail-qk1-f172.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946f6-fae8-0a2a45030019-d155deaca873-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:11 +0100
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-93a40a9a01aso30472685a.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:29:11 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.255])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-94425ae63fesm971577285a.42.2026.11.02.18.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 18:29:09 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793672950; x=1794277750; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EA63ABVwcLs3h/JxipVqiXIy94JHS7osXg+Mm97gaVg=;
        b=r5NeNFlV1L7VjnbdnNqDXC+22zl16zqJGUDtHUfHgXv7SCamPlIZDejoJGrmAImOVj
         y3sODP7vLXt1HTuhaR0HQPBUYEoZQcIod/Yd3BW/ysT7h6RaVSqQCAMtw7Ql3srEe627
         rAvSe5QMaWeySkdrYSxi4hubR/OJAT0LgVWHcDRaNZa1Rc5VQC8Ug6X8hHZoPV0F7L49
         3JwnNYjIF3hXmQaI1PDeoGH9d8pTNwBGeT3bhTUzqI+kgYf+0q0piZ27ZKz/SFXUPh9T
         Ek+U6PgCSATirJ93vBL271YAzmmPoMmYfYpNxjJsIU0mwm2wQxj1SlkkGWBRt3rTc513
         UGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672950; x=1794277750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EA63ABVwcLs3h/JxipVqiXIy94JHS7osXg+Mm97gaVg=;
        b=ca2SF2BBpq4Au02yo8rLLy0MLydrqn36dGEJ1mZKPZyfVplAvPODrQqfmZ8Ta4/A0v
         WHcg7h8OstkvDMKk2D0VaoOeArw/l/BpCA28mpCUjSyMVI4EUizTCDTXP1arQUpAQIFy
         vbriwknvbdfvYujDaaCllSjQlf+2rlyd047rVFw6BQ1pLR6ha0u2bDoIMbPii/Ouo9eZ
         lG3Gh2tSY4rorTYiybNruiOGI2dljo7dDhLH9vunXySMBfyF532/2gwt64g2Pl08p3kj
         diaVqirG9s8iLQkjKDu2zOrDy+8RuKvLSRSpifkSI1pcJMynE52Ptos3RMIlIbKAMT7Y
         ZPSA==
X-Forwarded-Encrypted: i=1; AKwUvBw8cyjj6PPi9c5OX/cMBj7gzwRJRDupFyPTpzvO4JW7SPAGR4l1uy0QCN3h3n6/HKLx+B6UBEAiBuw=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK08HNARuzwB3/CawyLvzncKZQSnvuX69HnWMuHNhiLPQ7mLAyE
	EjN3VrNwJTPdjSqzVedUV8Z3R0eR6uJjUPD2Ce5dl6E+dX7wHP6CDyFX41MX0teWpeU=
X-Gm-Gg: AYBFou3+KuJIv+MD5SHE+g9KhvR2kgxa46JbHg8/fTEnUOrhFsIUO7e+VgFoo7a82Hj
	Hj6THxf0X9ZgoiGSvCH+URWcQXJkmqzyULXJQJ684rUFUtUH8bGyIELkQCfUHA2L6zLsYIWAonR
	mZI/CRPiDK50nsBhs9MqZlZxLWVfAffmI5s32W1pLwqRGAQ2WUZAQ5bEIV5doIMRYSmknKd7dGT
	wJg1OdJN72vIayfllNuVAjeT9rEetMHWeC/vsg7jei+f9TkEIXjTWzovtVfLkbIBHfHuA3vhwD6
	FS00U8QX5wlrnwszaxKEeuQRPbNjY/Ftac7a9NsIGMbal8klSJ3ssTd4w30Re7a9bnOSpKNdC04
	Gq3/nqX+5JJOZhLxJlOaLqfdqX1ckxoeidgbzKpizHepC6Ckung57yvKKynI/oR1GG4830I5be4
	JAS9zX7r6ceIYOtMMMnGUhQKzRT3id4qupitavSaj6EZbMtipQb6ImwH32KBv0O/j91zC16ZVpD
	77WO3B88vo8GMPLBa+MDbPl5NHlJ3comYq5K7rUIHGu/IHalt4NoOznVgxrAJqlCNUPpnVKwhLe
	tCMWlEBeVWxlVNOXMa5/rrgZ2f5zyNhwGrQSgQ+pb/S5dA==
X-Received: by 2002:a05:620a:17a9:b0:93e:5ff9:a8f4 with SMTP id af79cd13be357-9442135f4e4mr1720591185a.0.1793672950127;
        Mon, 02 Nov 2026 18:29:10 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 02:28:39 +0000
Subject: [PATCH net-next v3 13/15] xen-netfront: don't BUG() when
 skb_copy_bits() fails in bounce_skb()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-skbuff-bug-on-followups-v3-13-54ad0ab57614@toxicpanda.com>
References: <20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com>
In-Reply-To: <20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793672923; l=1213;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=m7OgokcwaZHLGjQXMpKbgpowrvI9FQDluMyHz8mi3Ig=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QG6bjet0JqDvVFJtGL5dr8aWS2Y1CrqqPkeXYvW304JvA/+zhQI48mUWQjXqe9iWtZ3dd/1Xbtp
 dxeEcxZi/5gk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-33051d/1793672951-6DCD34E9-DF4CE17C/0/0
X-purgate-type: clean
X-purgate-size: 1215
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

bounce_skb() is an open-coded skb_copy() into a page-aligned buffer, and
it has the same BUG_ON(skb_copy_bits()).  skb_copy_bits() fails when the
skb's lengths don't add up or its frags are unreadable.

bounce_skb() already frees the new skb and returns NULL when the
allocation comes back misaligned, and xennet_start_xmit() drops the
packet in that case.  Take the same path, with a
DEBUG_NET_WARN_ON_ONCE() for debug kernels.

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


