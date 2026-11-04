Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85521609733B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=YIqhOJN7
Received: from list by lists.xenproject.org with outflank-mailman.1472780.1680707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhu1-0006Tj-SR; Wed, 04 Nov 2026 20:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472780.1680707; Wed, 04 Nov 2026 20:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhu1-0006QU-AN; Wed, 04 Nov 2026 20:48:13 +0000
Received: by outflank-mailman (input) for mailman id 1472780;
 Wed, 04 Nov 2026 20:48:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xOhtz-0005xS-2x
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:48:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhty-00DUt0-FD
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:48:10 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb9a03-2eae-0a2a0a5409dd-0a2a45069bb8-14
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:48:10 +0100
Received: from [209.85.222.177] (helo=mail-qk1-f177.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb9a09-195a-0a2a45060019-d155deb1f143-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:48:10 +0100
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-93f079a63b8so112332785a.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:48:10 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.253])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-945d483d762sm294338885a.27.2026.11.04.12.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 12:48:07 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793825288; x=1794430088; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UbSwO3gZAlShSf8y/3JGnXMddTOZvjpIdY8ib59dlm8=;
        b=YIqhOJN7ZCzDLcp9eweAn2J7TdnGMx4sCzPFuN9HZ5SZUxk50OYO6UE7CNfjcqROIS
         1hzB9bS6SdTQ8KuFb/wRVcJgUVXE5L87ktEucpDLcOAxRgKmmGIgguLyrXm3EXZWZysj
         dSnAnsuoB9bwQnUEmzQcrCHbtVdanV4mDOUo2Is+kxsfih0oHEsU1N2Euw8fwAKGZIrM
         Kqb5b9iqQJWSuvP8gd2R05GZduYtPkoiKzisHta4RK3mrHnWfBztFJzJ5MCa380zx6xi
         2g9vyEyaB93JkLzcFdHnNogWQ7hC3+B+BZYg3uCgbpspHRbweV1KBmt3FRXaa0Lgola0
         Sfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825288; x=1794430088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UbSwO3gZAlShSf8y/3JGnXMddTOZvjpIdY8ib59dlm8=;
        b=uW0TDYwG9/b29OSSV9cECXuCF9LdWCKQFJfbfCKYXLIev/v3OwE+RBvXrRVVlL+HiI
         opnqoEz143kBuuzU+Nx6sw/xtirKGWvcXi/wewnkXVNRm2Fg1xHtZMyZQ/ezg/wsrYth
         MN7NBxTCQgJVFTjHxC74WTRO1Cc3qebFDKeeWJ/qTB9IM4histfBJUdbFBxBfoIYo2KE
         ddE6a5UgVSPXqtSjAr+8mNFNcS2QSlsWIywqizyAHgwMLGy/b1It/DR5kjn+E9CL4WYP
         sDpfETfs1jf2/uYXVLLA4HEL/40sfbzASE2IdOmrTa0AUJssyz1PzqtWwOM2ZuX9oYAs
         qHMA==
X-Forwarded-Encrypted: i=1; AKwUvBxc6KJtExaxmMNkAyKbYY5tVbRPXyrEeH+alqRxRXDxC77sq71si8kziKUnlfN7E/R5dTT5wt+3oVA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9xDhj7H7FoBkkGevxSE7SzjLp8INq+GZI/ilfsqsGCw/W2tOC2
	PU5WDh7ZuamnP9ifTRyKG5qzbmv4tRtlgMLj8q0Bys230aa87udbu3QP0GuQe1zAKZA=
X-Gm-Gg: AYBFou2+agZqlT+5vKCHQAgQd7rqJlSMLMHgLU0+uNZ6fvt6Y1qOcWw4Z/IckUlievX
	wqp06zSarzX+zA3cbHQHG95rzC9RNy4RznBjJOu/QpI9DBs+GTSQkiC1EbCzhd+kwcbF3Hhbu2E
	y8Y1W7q9IWKphrd0+mKN/vikEgpLqMqQBNP3wxT8I2fHMncDq45Wl5xsp2JrNjvNt0oVRKcp2Jn
	g0t4mPSeG3mtvx5L/RPX5KJT6MrM/lMMrjQq8/L4SQYqbvt/OjnVSom5f/IeSuNUj/puopQG+Lk
	es2SG7SEQuCjmkJTZoZNgLnzuT2Lh851DsvL1p8xuzqgTlv1eU48kw1AufU7yGMo7CUwxffTr90
	Obbrc7NNpRsyL4ZIr1WiIQQQR9L1uiNQyn2QBR5evWKxZ002BHCyQ2nkgsXBBrcqecyW9JvzUuU
	eVrBA/e+x3W6338xoYJR1e+7qIzGlRHFiMLAvymiFApkyXl4s/dW/krzlECdu/q8424OEmjZUn1
	LVoGtGZOk4/uooMnQncKpSokyCKKLa7EV6ZtZO5aIrU/OvXSVpLwMLdF9Qze+HKAoJUiFRz4bsE
	l9VQluTaVGV6nTZgXHTtbPuD17YIMa9XfvKVb1C/+xCnlA==
X-Received: by 2002:a05:620a:a905:b0:945:b9c8:de5a with SMTP id af79cd13be357-945b9c8dedbmr1356158885a.20.1793825287918;
        Wed, 04 Nov 2026 12:48:07 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 04 Nov 2026 20:47:27 +0000
Subject: [PATCH net-next v4 15/15] net: update comments that still describe
 the skb BUG_ON()s
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-b4-skbuff-bug-on-followups-v4-15-b7ffeb364f5d@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825269; l=2967;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=EAJ0bQj/Oj/in9lIWu/G1LG29YPEIg8lFuBrNd3Sw5Q=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHf4WC7tdHNHClwRAYr93iv9/GKE9HPJjZnVhEDjCwlX4VLZbqFYVp2C6I1QijW+aNqGzDet3wR
 d30tDtFHCMgo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-16d1c6/1793825290-F6A7477B-32DDD58F/0/0
X-purgate-type: clean
X-purgate-size: 2969
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The skbuff BUG_ON() conversions left a few comments behind:

 - bpf_skb_net_grow() says skb_segment() BUG()s on a frag_list with
   head_frag set at the downgraded MSS.  It fails the segmentation and
   the packet is dropped, which is still why the skb gets linearized.
 - The skb_to_sgvec() kernel-doc doesn't list the -EINVAL that
   __skb_to_sgvec() returns when @offset and @len run past the end of
   the skb.
 - A comment in the netmem KUnit test names BUG_ON(i >= nfrags) in
   skb_segment(), which is a check that fails the segmentation now.

No functional change.

Acked-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/filter.c   | 6 +++---
 net/core/net_test.c | 2 +-
 net/core/skbuff.c   | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/net/core/filter.c b/net/core/filter.c
index 09c60a58c82a..9881ac89e94c 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -3723,9 +3723,9 @@ static int bpf_skb_net_grow(struct sk_buff *skb, u32 off, u32 len_diff,
 		shinfo->gso_segs = 0;
 
 		/* Due to header growth, MSS needs to be downgraded.
-		 * There is a BUG_ON() when segmenting the frag_list with
-		 * head_frag true, so linearize the skb after downgrading
-		 * the MSS.
+		 * Segmenting a frag_list with head_frag true at the new MSS
+		 * fails and the packet gets dropped, so linearize the skb
+		 * after downgrading the MSS.
 		 */
 		if (!(flags & BPF_F_ADJ_ROOM_FIXED_GSO)) {
 			skb_decrease_gso_size(shinfo, len_diff);
diff --git a/net/core/net_test.c b/net/core/net_test.c
index 03203454cd19..976d14896251 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -1524,7 +1524,7 @@ static void netmem_ref_test_skb_segment(struct kunit *test)
 	/* 5. Linear head_skb (nr_frags=0) + mixed pp_recycle frag_list where
 	 * member A has linear + frag (pp_recycle=1) and tail member B has
 	 * linear len == skb_headlen(A) (pp_recycle=0): keeps SG clone path
-	 * synchronized without hitting BUG_ON(i >= nfrags).
+	 * synchronized without failing the i >= nfrags check.
 	 */
 	head = alloc_skb(64, GFP_KERNEL);
 	list = alloc_skb(64, GFP_KERNEL);
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 45cd77e153f1..29951ce11850 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -5641,8 +5641,9 @@ __skb_to_sgvec(struct sk_buff *skb, struct scatterlist *sg, int offset, int len,
  *
  *	Fill the specified scatter-gather list with mappings/pointers into a
  *	region of the buffer space attached to a socket buffer. Returns either
- *	the number of scatterlist items used, or -EMSGSIZE if the contents
- *	could not fit.
+ *	the number of scatterlist items used, -EMSGSIZE if the contents
+ *	could not fit, or -EINVAL if @offset and @len run past the end of
+ *	the skb.
  */
 int skb_to_sgvec(struct sk_buff *skb, struct scatterlist *sg, int offset, int len)
 {

-- 
2.55.0


