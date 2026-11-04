Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1939D606C5A6
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=fj+3rV7D
Received: from list by lists.xenproject.org with outflank-mailman.1472776.1680695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtz-0005u1-7x; Wed, 04 Nov 2026 20:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472776.1680695; Wed, 04 Nov 2026 20:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhty-0005rS-Fm; Wed, 04 Nov 2026 20:48:10 +0000
Received: by outflank-mailman (input) for mailman id 1472776;
 Wed, 04 Nov 2026 20:48:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xOhtw-0005WC-R8
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:48:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhtw-000QZ3-6r
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:48:08 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb9a01-8faa-0a2a0a5109dd-0a2a4501da4a-10
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:48:08 +0100
Received: from [209.85.222.174] (helo=mail-qk1-f174.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb9a07-5984-0a2a45010019-d155deaed51d-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:48:08 +0100
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-93e635220b4so106364985a.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:48:07 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.245])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-945d4899dc6sm292004485a.43.2026.11.04.12.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 12:48:06 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793825287; x=1794430087; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vm4X83cKQV2cViXLrBy8CdaLxj8kNgfl4SZFvLru4UA=;
        b=fj+3rV7D0DZObpoMlJckGVvFKWfGqQ2jCB/kCt8UdEYuqPeQm2pjfioUBQwavCqysO
         4gjdVkHwcqiv/SgLCR7IBY5BHjdiLu4ei32bxle5N/bMBwbmNKwpoZKTxC8mr+x+nCRB
         PYTDVcuXFa3MCRXYveVMZEl+hzRRw1nY0zI/b5f9Azuz/5lpzFoVpXwam2fo5ZgwClNZ
         cG6CkKrx3k/64ezKXtm3ePmoWhwLi16aG9+XsfCeLHrLve8yxhJlt4WeYNh4UQqFyRq1
         Szrcs2SPid1UAY+NjcyNcJExL8AVuiTdTxIY/r4PKtoSPzZgwmyB1+KkECDW1cwv4eVp
         TOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825287; x=1794430087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vm4X83cKQV2cViXLrBy8CdaLxj8kNgfl4SZFvLru4UA=;
        b=b++Wj5QkA3uaVtIK9cEYoAGsDc8gPBi6ytEtNAUPJEz5H89P9UelF5OgbQNlVk8qLx
         dif1QWrJONccpY9Tjrfya16BONlciISYQl7LT4AsNAnvawSSS4+fWR/7D2r1bNz1IuAm
         asXk5fakn4s48nua83/SwmrPQmTMLNqxaHQyg8koALm4onj6KTIkF5O66vBg5hYNqkot
         9Pp/j/5L+SvetmMrhRcryBGT6U/T6gmYKYY/HTizIODXCdZYAXKVMyrkUMsr8spohNWU
         zUcyqNNrXw5QBO+FzyT4h2cL4ur4P5zxWvgbCI8qmqnH3Z7I5/46mJThEfUETXiYDtXQ
         giBA==
X-Forwarded-Encrypted: i=1; AKwUvBymSLjRPMvFaRip90XmDJxM8NGrlXZdhfbxO4cQd15Gv317svlBxqBgvd0xtThbTGfbYiBi+4+jAOY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9u1ENBFh/oTwdwxdbxegInrq0a3AcHOVXM4hez0Xj3L6QgrGS2
	5Rs7T/X1wHnuYvFSxZ5Kr7f5JSSeYzkaqA/FnSl9nleNHku+AAOTRZ9dKYjSrtszq9M=
X-Gm-Gg: AYBFou3o0/uJ7PZqOuy5DubSrOPqNNh2NyRwQ17zXb23y0W8bzcin48wUi/FJ0jbP08
	sZ21F5TEa8sW5RJTk1AhpfRTKMZBjI2+FHDr99LyQ4KhgikOekTldUa9idbVXIWJUaM836Bi1Iy
	AMm/sjSSW54rNcrP+K6cE62pCT2mqCfmNR/g88mIVoVnrTSElEpbu9pqDdlCSXjAfQIfbwpSxA9
	PD7Va59LzuC6CUApX8okG6X6EBodTUrTPdDWQuAKQm6DOsXBL7DDF4dOEHl8x9tWqARDgaGX1Ij
	MLq2OR7ZZe/4ZcinQcoLpVjFHBr59U0z6/a1k+Sp+jNTYHyGgFKeunJxdlO8z5hVuh8MK57pe/U
	PIz3yPKRBeMWSkft0VhboCAUiTcZs7yYIGzKwolQFskfv47EPZrQFSYYZxETMFS70q/ZK2aXTp8
	U2iwaxKgDp53uAsHAjPIVsFD4fsE6wQtyEy/Jr4zUA2VENE2f6oDi/+HUeVgvjwzVs2aynPEOXS
	EyMBohcHq7TP9ZpZHdwdNvilg4inL9gZ5qDrRlW2mc3sxUxXvyPNBNGs1NUIKduml8U/QcF6qoc
	6V2JUixkYKPrtTQcmkMDuxLMg2MfseU7KB2rwYPRN4NBsqYh1JBr8yDEnfVo8FeY2yY=
X-Received: by 2002:a05:620a:4043:b0:93f:31f0:6a7f with SMTP id af79cd13be357-9442172a5c1mr3191494585a.69.1793825286622;
        Wed, 04 Nov 2026 12:48:06 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 04 Nov 2026 20:47:26 +0000
Subject: [PATCH net-next v4 14/15] net/tls: don't BUG() on leftover length
 in __skb_nsg()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-b4-skbuff-bug-on-followups-v4-14-b7ffeb364f5d@toxicpanda.com>
References: <20261104-b4-skbuff-bug-on-followups-v4-0-b7ffeb364f5d@toxicpanda.com>
In-Reply-To: <20261104-b4-skbuff-bug-on-followups-v4-0-b7ffeb364f5d@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825269; l=1573;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=jtewRftckK13p/nQalxWcrhfGpFqhqstsSARsz5AoHI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDKngciEsEX8JG2Ad0fN9Mloe1uVw1/l2WZ7sISbd/Ng5VMersZpizDOJC2J3tEMBwMooCA/YD/
 B+ZXmrDCaGAc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d62444/1793825288-1EE60757-E8A99555/0/0
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


