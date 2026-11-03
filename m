Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16337606A326
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=byYtmngd
Received: from list by lists.xenproject.org with outflank-mailman.1468959.1678040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gy-00028C-6F; Tue, 03 Nov 2026 02:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468959.1678040; Tue, 03 Nov 2026 02:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gx-00026f-OH; Tue, 03 Nov 2026 02:29:15 +0000
Received: by outflank-mailman (input) for mailman id 1468959;
 Tue, 03 Nov 2026 02:29:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xO4Gw-0001qW-Et
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:29:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4Gv-00143l-Rl
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:29:13 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946b5-2eae-0a2a0a5409dd-0a2a4501bef4-30
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:13 +0100
Received: from [209.85.219.43] (helo=mail-qv1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946f8-5984-0a2a45010019-d155db2bb904-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:13 +0100
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-91c79f306e9so41141136d6.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:29:13 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.255])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ca7f401f5sm106359816d6.19.2026.11.02.18.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 18:29:11 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793672952; x=1794277752; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vm4X83cKQV2cViXLrBy8CdaLxj8kNgfl4SZFvLru4UA=;
        b=byYtmngdSHP4ERa+/tfXK5vZV37Xudj+GQchWX57ogK26kh0qi7/Wu+9RHqHP6Lb0O
         PBFymtQ5BB2HJ7SFeZxaunXVvZtNDJshI62HOdCbW3WjnahAPMS5ocCDPl4nhLxWcFcC
         e1bF/9PWFB92TdqAo0zPsp0w8lg94sosXGJRTS/AdapQiwU6r1z0hBFuNb8LTi3i0Vt/
         CrEGg1BMwT0+65nbMSKR5bC6T5vOyDyHbpVd9/O4UlyWiANwhWuY3vkV2y9l1LENm6QI
         Ur+/ldYCWQKNHR847FyUeeUVuJDAX2Bnt55Bp+MyQ6+4jJGrY5mbXgIc0LIlx7A8shC0
         5wEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672952; x=1794277752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vm4X83cKQV2cViXLrBy8CdaLxj8kNgfl4SZFvLru4UA=;
        b=HIp1vatXI0tbHmLcFI41rvGNFpx7+oGSGQFNeAWFa57qBUQKJoo8/8+ideE6eWU2MK
         Np1zWL6pnsyurr4aSFSlv4thY0jJSOq3mMEeXOvXjsU7/mFo/dBu5YvSHuqB8RoBTslI
         ClwrV8oBDyY6KUwMCnqEiZhnaH9e9PiVi3HLmJTLD5xSgGtaU52SjcX/kRsC985mlWTh
         c/mGDfpaFKcJDR+ClrCntv4567cXSBAcMMnEVZgD58wwBtxBwcDlk2lL69XcGBkW32cy
         qE1VHTen9xk49eZjyLmD73vB190HKfWLx3R+6GUz+2ap599G8HZdpMLlWHQbUSuuWHtC
         HrWQ==
X-Forwarded-Encrypted: i=1; AKwUvByeqbe9VTxdnWTlPdh7qIHB4Ez2tSKiXtXFTZZ2zNUQw9jIMatMv9N6NT7kXHMm6njkCjz4K7cfKHE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9nOXTqaNGfFL+1oTAyZFkGGR7nA3YetgQdr2j9ztsnLPA6u2Jf
	zFlBqbM0Z4u1DRdXUQjGUw5Q2GdsM2CDQqCBuPHNMfCMTRJcfSDItrxN6pZzRCs0t6U=
X-Gm-Gg: AYBFou2ekOSNhJmYHXAI/Gm18cbWkGak+wFGLNr5HUApxfu5pwU1cYN6+4It5Lv+NjF
	EBQatHsMah+GEtHL1hFSp/EXH9uhe3LW4KDvHZexQkKrDXbJ6kVBTVladZf+ff0dFMZk1bSvAWE
	zGN2y4E1I5FxYGsBOjeP1j8k4EGsMQMM6Kq9ciAZZAhfFs9Vom1uEGgVecGB8xQvWGIZas3ePlt
	RYZcDkTXzlLTRB4A0ghPrj4rcuJKzuRJAK7YXqwYPppjtgovAPFISY05tW9qhbxsq9SK31bSn7J
	Nw3fcUdsqp3nJVJh7gbYwf+uiutI33SBiwwDk9hOd6WQNspiiHfFPtKcu19+ZCp5svQTfkuOv+3
	w9NgkHJC/OZsMvSlttwJjg4RideHBKZguQJTQ6V6s1nZ30wnpbqhcrUyTqQKPc+FDSFNFruXcY8
	NTLZGwKZiz+kzallBOXLk+NDWrj9JCYi1VQm9ETOv8ZntBth4ukEUrzSyzgXXjfPeYSDBldGJPr
	yi4wVDB84PLxh0ZvjSbQfr6sVh4iLcILKCie2IhaV+L18ArRxgwfjmW0BHwPVlxJ9MFXE7CE9zD
	L+5tcnL62NSjvbk5qq0Fk4ZxEh5SoHlYHI5sRkSwO7bBFw==
X-Received: by 2002:a05:6214:8588:10b0:91d:35ff:cb53 with SMTP id 6a1803df08f44-91d35ffcdc9mr8100016d6.37.1793672952196;
        Mon, 02 Nov 2026 18:29:12 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 02:28:40 +0000
Subject: [PATCH net-next v3 14/15] net/tls: don't BUG() on leftover length
 in __skb_nsg()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-skbuff-bug-on-followups-v3-14-54ad0ab57614@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793672923; l=1573;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=jtewRftckK13p/nQalxWcrhfGpFqhqstsSARsz5AoHI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKU+bYXkf9YXXl1oclL2Gvz2UVI2gtqcPepXaQA2KpnhXr1hun6qZ+lqT2IAQi6KyF0liU25rYL
 0WlL33F1eag4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d62444/1793672953-BE27A757-43DFE221/0/0
X-purgate-type: clean
X-purgate-size: 1575
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
debug kernels, and say so in the comment above skb_nsg().

Acked-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/tls/tls_sw.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 771e02bff519..748ae27f2b88 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -142,12 +142,16 @@ static int __skb_nsg(struct sk_buff *skb, int offset, int len,
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
 
 /* Return the number of scatterlist elements required to completely map the
- * skb, or -EMSGSIZE if the recursion depth is exceeded.
+ * skb, -EMSGSIZE if the recursion depth is exceeded, or -EINVAL if the skb
+ * runs out before @len does.
  */
 static int skb_nsg(struct sk_buff *skb, int offset, int len)
 {

-- 
2.55.0


