Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EDB606A32C
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=L97DqqtF
Received: from list by lists.xenproject.org with outflank-mailman.1468964.1678048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4H1-0002lM-Ok; Tue, 03 Nov 2026 02:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468964.1678048; Tue, 03 Nov 2026 02:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4H1-0002hq-3b; Tue, 03 Nov 2026 02:29:19 +0000
Received: by outflank-mailman (input) for mailman id 1468964;
 Tue, 03 Nov 2026 02:29:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xO4Gy-0002CX-LA
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:29:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4Gy-006j9s-0q
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:29:16 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946b4-8faa-0a2a0a5109dd-0a2a450ae7b2-28
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:16 +0100
Received: from [209.85.160.180] (helo=mail-qt1-f180.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946fb-f2d2-0a2a450a0019-d155a0b4c0b7-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:15 +0100
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-53fdd2fb171so46767341cf.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:29:15 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.255])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5498ba831ecsm13704131cf.12.2026.11.02.18.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 18:29:13 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793672954; x=1794277754; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+hFTEOFR15xhICqJoC3sInecNo3QCMXYhk+gm+DR0k=;
        b=L97DqqtFzFpd6Lw32fn5xadqBpnOVYKjEyzLesDEcxL9LAS1pvt22Ki1NzKgPp6GvO
         aXm0ex/sklNLRtDnbStVKsUlZ9sy/9580iTB8uN8HIj0xaH9Gx8rrYUiw7jBetBlwhHY
         YdOtzNb/iqsrgtkXhhQj+QUtsJ5JHaKhSCwX+JNX6jvfUUqT3pNnZyHKjjWeR57xElUE
         PvQBPdBV7FBQwda+MmvAHMbTeE3Ew66eKU3dW42TehMnzdeh67GlHo2fpe+Grb8jgniH
         rnf5quB5CHOXvC+zGrjUgT5nTu5BIPm6NA1VfvrUevHj20RLJOdeFqvh16kyquDMsBO/
         EncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672954; x=1794277754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a+hFTEOFR15xhICqJoC3sInecNo3QCMXYhk+gm+DR0k=;
        b=Vb5Bx9tCCRS7JmWnmYQZa8TVuSDtm9tOdGTv9F6Mq3rkRJ5anZuz9HFqDwDcbHIfbW
         4ZXt+zocauLhtsKZ6xKa95zrKRyC8cKDidnauldVvncNSHiaOmKQRpLE+6wN677mUKa/
         eXlLGUzBV/ae5cadne0z5tWojCG8D5JxjG40foa2r1n4lfEJlYM+D0TGNZ/3fTnE2K4O
         5DAVgKfF4b38/68NGMmCjPJC5wWGJrRYG/bLdFx82p/vi+ZgqI0Z897354ppNceJHod1
         KKijzKmoWuBq2Cb/OAH/CgLdwZLIdtG9wMmIJb/CIKoaFOkmA7LEWEU7cpmUxsYVPMyl
         DHww==
X-Forwarded-Encrypted: i=1; AKwUvBzf+DZbXXLl187ex1cfu/tjCebHfc4T5eGvkX0baKtc5a9adSml2yQeWTHD5xR91Tjp/+hQGI5EqSw=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJ0jS1rQnf9tNOvzLKvdEJRNDfxlL0D8dCVkwhlfi9a9UhO+RCm
	YJ6NcZsp3rnWmCb+GvCjBXBtmCoLV6manHtwHnu/8wbgsM7mXbr/kcb0qrttnLxTE18=
X-Gm-Gg: AYBFou0zUazy+WgsZUlHcYmTx5Xxk+KF9oAAYFfnAokGYmczhWGt2nm2YyVakLLDj6I
	H0FYgdxqaDtXvTOrd+5UJD7eWSQrWuGB5+oLjEnbGy7qy37neimkLt+uBIfrB0QoAKwDMZLLZ1C
	o07ly2YUBMPZeKTiVtIyNNEFSoTECzyjp5rP1jU4YoK4S7pXFb2ZQOIbWs2une6YBcRFA/T1h3A
	44/+DvZtsOgo3A9HCb+fQi9DCiiAPRSUHL1TI1dU8jtzW6aaowWk6umlqdLDDVmivSlsYUGZ4Zu
	2m3cILzExoBdgtSMBkvBA+qMx4Qn5lwzWJWInmyXcDS1BifS1ApdO+P7ab84oOXHHm0luVmL6Km
	FPRSy/IDT2+YaBuBdsVjoBqT55UGOxLyrCzK8nrnVvNOARa1ATS1rxaWNJmQ9cyUfqi/2hpaKMK
	iDxNuREIrf9YPfEvo9IO2JRZGy46uk969I0MQdtwv7JSQzYsuWLv7fxDpIW0FPRa7aoH3ozfBCp
	awGezNZh6eQ6cDxmfSSE40X4avtbwY++QpBt0KSO1BwBYouiaXdhz5gNJeYbuzaxpstkp0Boygl
	6udUMOcjv2s2bJXdOKYOwfHp+0NWkeoxcs6yIalMimeEXQ==
X-Received: by 2002:ac8:5a84:0:b0:53e:35dc:9bd7 with SMTP id d75a77b69052e-542b7cfff77mr195623591cf.61.1793672954512;
        Mon, 02 Nov 2026 18:29:14 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 02:28:41 +0000
Subject: [PATCH net-next v3 15/15] net: update comments that still describe
 the skb BUG_ON()s
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-skbuff-bug-on-followups-v3-15-54ad0ab57614@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793672923; l=2967;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=WCTT9uC4bs2258XiDJAzFc52TKyNHZGhkrwOY27WXg4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QE8kdpAIr4r/3KnRyoQejERf3bZuv462xd61M/4SF+RLGK/b0ul1CKeaOQhtpoJOgJfKTHf9Nhb
 J8aQzKvI8igI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-4011c0/1793672955-53CD3CFC-0538624C/0/0
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
index 298ca240104c..7bfafc826b14 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -1466,7 +1466,7 @@ static void netmem_ref_test_skb_segment(struct kunit *test)
 	/* 5. Linear head_skb (nr_frags=0) + mixed pp_recycle frag_list where
 	 * member A has linear + frag (pp_recycle=1) and tail member B has
 	 * linear len == skb_headlen(A) (pp_recycle=0): keeps SG clone path
-	 * synchronized without hitting BUG_ON(i >= nfrags).
+	 * synchronized without failing the i >= nfrags check.
 	 */
 	head = alloc_skb(64, GFP_KERNEL);
 	list = alloc_skb(64, GFP_KERNEL);
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index b2c44a58db23..bca69e8b3582 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -5639,8 +5639,9 @@ __skb_to_sgvec(struct sk_buff *skb, struct scatterlist *sg, int offset, int len,
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


