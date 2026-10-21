Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FCD60A2625
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=gwclMz6V
Received: from list by lists.xenproject.org with outflank-mailman.1457200.1670171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWfK-0006fd-Ax; Wed, 21 Oct 2026 13:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457200.1670171; Wed, 21 Oct 2026 13:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWfK-0006eQ-1l; Wed, 21 Oct 2026 13:47:38 +0000
Received: by outflank-mailman (input) for mailman id 1457200;
 Wed, 21 Oct 2026 13:47:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xJWfJ-0006Sp-7T
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:47:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJWfI-003fNk-KO
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:47:36 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c261-8faa-0a2a0a5109dd-0a2a45099ac4-38
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:36 +0200
Received: from [209.85.128.174] (helo=mail-yw1-f174.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c277-be1a-0a2a45090019-d15580aee532-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:36 +0200
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-8ac525c1f05so6244377b3.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 06:47:36 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b13010e9afsm11079637b3.30.2026.10.21.06.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 06:47:34 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792590455; x=1793195255; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i0J3D+b7/r3u1OwRyftYjz/adUeAE/55QZV56gd3GFQ=;
        b=gwclMz6VXUz5jjTLEsnsU3gq/6bGHGymqp1kZSUZBe9/pkaUpkdWxeyql3v4at2IK7
         M9Pdf5Vxup7zkuWWpQYlec3ILhV4dLrFc5nsYcoEvdhyPHKRmPx8HqM+R2sKhg/8wWWn
         7Rj/79zpWiinN+XutztjleNKy6eOVw4eaxJrqVr6lbGNv/R9n8YCcrinoT7kz7xKSmhW
         f7hL6DEDM0jANrD3xGVqokHx0RrqVsMGm5zQG0CIAhzv9vxCtVJ5i5TBqh81zZaD0wkq
         P9TDXYcnDCh7HqRpTwPmBvKA2HaYfnVz545I3Wfigz7bfiyYiI2gOItaXZPFe8TUergc
         a3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590455; x=1793195255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0J3D+b7/r3u1OwRyftYjz/adUeAE/55QZV56gd3GFQ=;
        b=2u4E7IZQ2i/yUC4fXTJyP/U+2EPksqjoDqaCQHG1fl+MbynP/RSpBTqJOJaCFZr+Nz
         /XptU+6GvFfuiGPon6Bw+28d0mK7wzkksg4xEWofMq4PT0KeiX/q27x18lakQ+550WSe
         fpnGXDxhhqS5VGmgfdNPtvvqJmzs7nScbZHhs0IeaMS83rlcQG/KKhBMAOs0eCb9Xa9U
         Zz3HmClOh/ZxgZUthN0+83c0RGtiTgqTf1PchbuoF6MivcGpYNQmQUYkzxB5zcD+WEWQ
         P4Hoy/zJyK8V8aqiiwom1flxGJbxJQtAdEsJrJp46lUDYlsFEjvauAjJmmKyjegtOeq2
         j4DA==
X-Forwarded-Encrypted: i=1; AKwUvBzKULM63nLBCiIfGj2DJY8k5gRk1GqQrLOt0UCJi4QhX9a2yJAOlATwR5y7YMnShV41ggIwfIzNhDw=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL1pzAnEKzQdn7N+MQLzCtYiXHvfj4t9mkVj3AzQKgEf6Ngljnp
	+jY1NfT6qLu0l1O7OaNhPXrQNKUzIohwWVULudNW8ljKCD3aUNqxlhcpNZmiB5dZ580=
X-Gm-Gg: AYBFou0tXQgYYgelGN5AIwwnXjqba2kmRpCxCSnQtZXcskQoBJ5Cb1MTt8PTs/a5gLE
	UtUzDxYO3+GoxF/6wwji7oX2HaANktPnbPzKDeXVkhRHJSGnMc8U9g2z4KvD1xe55QVHvaM1e7C
	lP6PkLMIhmhX97nf68hvDplRrwnRI2g8Lp4coal6uLLou2UGr3SrbCHUHF4Hth9Bmy59ZJej87p
	l2F8A/0pG/DfOT8y5n40bsQH5Bp/lIPnFGMkSbqfAy/2T1NfReKfcjG6ggeWa1XTCR8jxW3Ui8U
	u0jmUak7fYk697PcgjoISS0sXplN7mQTRUK8GjLwtAE5Pusk0BjTk9SmL6nL/ZD2OF0UKCe2dcc
	ZDTMuSyIsKiX20SMpeH03ZReTEraxzQVXZKkOL3sgXMd0AfuBYgqFgObAowZczDj591/PJ26Krf
	Kanv7Mnd7dDF9YBVI76HtDYbZKJ6SuF4nCBUZkk1M94Hl/sb7ANKgP0uCmpywxORXu2jmxnSjRa
	bDy8UrbiOUURuf1Ta95m3rw0ZDZUh8NRob7aUlCyGivH1ZBJxf0GLQwqxPqYKM1HBBYx5Ruw7w+
	JbKi4xjpwYNfsOeHXiw=
X-Received: by 2002:a05:690c:6e84:b0:8b0:d9c9:3fc6 with SMTP id 00721157ae682-8b133cab002mr11832947b3.13.1792590455037;
        Wed, 21 Oct 2026 06:47:35 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 13:46:58 +0000
Subject: [PATCH net-next v2 14/15] net/tls: don't BUG() on leftover length
 in __skb_nsg()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-skbuff-bug-on-followups-v2-14-2aa780a03524@toxicpanda.com>
References: <20261021-b4-skbuff-bug-on-followups-v2-0-2aa780a03524@toxicpanda.com>
In-Reply-To: <20261021-b4-skbuff-bug-on-followups-v2-0-2aa780a03524@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792590424; l=1223;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=5t4cbRJHSGQYLLp/0ImHHFowlzs4pEzQ4N7rNchrePQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEgLrOmYkZSVdXm9PAivGpLFnrgKNrg9SpPHyFwsg+XmCzRKGvvpRNTQOmmSS2AzD9Qw0WBfByj
 Oucz9Cz9YYwA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-bad1c0/1792590456-39AC0034-E93962E3/0/0
X-purgate-type: clean
X-purgate-size: 1225
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

__skb_nsg() counts the scatterlist entries for a range of an skb with a
copy of the __skb_to_sgvec() walk, including its BUG_ON(len) when the
skb runs out before the range does.  tls_decrypt_sg() calls it on the
same range it then passes to skb_to_sgvec(), so a bad range would BUG()
here before it got to skb_to_sgvec()'s error return.

__skb_nsg() already returns -EMSGSIZE for a frag_list nested too deep,
and tls_decrypt_sg() fails the record on any return below 1.  Return
-EINVAL for the leftover length too, with a DEBUG_NET_WARN_ON_ONCE() for
debug kernels.

Acked-by: Mina Almasry <almasrymina@google.com>
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/tls/tls_sw.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 312e51270f29..1c578ea47a1b 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -142,7 +142,10 @@ static int __skb_nsg(struct sk_buff *skb, int offset, int len,
                         start = end;
                 }
         }
-        BUG_ON(len);
+	if (unlikely(len)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
         return elt;
 }
 

-- 
2.55.0


