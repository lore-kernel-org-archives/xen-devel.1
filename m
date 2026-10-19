Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD647CCF2DE
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 13:51:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454407.1668040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInm7-0001vh-FU; Mon, 19 Oct 2026 13:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454407.1668040; Mon, 19 Oct 2026 13:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInm7-0001vW-AM; Mon, 19 Oct 2026 13:51:39 +0000
Received: by outflank-mailman (input) for mailman id 1454407;
 Mon, 19 Oct 2026 13:51:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xInm5-0001iN-SW
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 13:51:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xInm5-00BvLk-94
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:51:37 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad62067-e002-0a2a0a5209dd-0a2a4503a8e2-4
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:37 +0200
Received: from [209.85.160.175] (helo=mail-qt1-f175.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad62068-fae8-0a2a45030019-d155a0afa45b-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:37 +0200
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-53639b8903bso30467561cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 06:51:36 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5362a8e43cfsm99302081cf.5.2026.10.19.06.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 06:51:34 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792417896; x=1793022696; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cCcET6n/yfDRwSzhWgNa5UxSYwstO6x0SjXdcG6UWRc=;
        b=Ki8JxYBcjsJryn86TTCTg+NU48IOxRBs0/TCY7mYKlDaI6wTJ1uJUJGDzp4CUh8PYy
         BzmNLHiXeqcn2uyYB0LiulSrg/alaKFBGxCWsAJsOQmciSEn/ZMcj9dliJH1NPj5LGak
         u6AcYuDkHw1apJj2mPJvOFv1rTd0j6+1wBqmclKA9SITFbQ7WWGaqCzDqW7I/L7TaBkE
         mlaSLJtrnoogHvhAvgbdwW/wFIgaegxRFs2J5ThlPD8bTSueOx7ZNF4mY6EAB4jrUJcO
         ZLSvOXRFPVu4dozViuKjcr5ZLmhZEtrd3FrcT+NUilTvBXtOFvx86yYqjCgEbF+N7ah0
         WKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417896; x=1793022696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cCcET6n/yfDRwSzhWgNa5UxSYwstO6x0SjXdcG6UWRc=;
        b=FMIFR+1KT8GBQGn6nqLQO4GNbTlOuCLFqHRBYN17+Pqlb7hDtvRo63O6gdUVpf/5eu
         JOPsq13QcoE/EK3470QYwXOH2sJz5VVl/gMJYtQ/k+rfn78ReqDW6LHPGc2jqqomgLW0
         TWebR2lzOBUoKt1q2O8EY9lD0bVvg7obvs3NdwE+CXhjiVJt9gf4Hyz9rcNc4jw2vKPJ
         ZSSFdNU7D4W/1U/zAma3e2mWj2L4lVXvNSt/Z19QZsOnuEFidsRgaa7OHepVWWuZAgLI
         UO6795DK8WYng/q4ucKH3e/ks1/pqQuN2l76MTclt2l6yIfUEl3Wsw4ikTEqoTWOdISZ
         M2QQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9eIksUe2ZX7DLwk3bMC+sRPjKr++WkBYTarOn4i9FzyiH1MsgammNa1p4dElgN/HjtE3qHCFzEbw=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKmh3Hr76odmGXOx2od97Yh7AxYxzOLHWsfVzNdlpVVMm5b+syU
	S9kw6K5Lsx4DtEClJpuzFHuVsHrfmgHzx2RpfA0M8e+poY5DG+qANdafXnPWZokVx2E=
X-Gm-Gg: AYBFou1gutnFIV80HiafyhlRRgiXo6RIOo/S69iQxKLGuMYrIXgSkPk16ZkB4snROcK
	/psZr1VbEV9L+PSn8cZcABBf3OIhi/wnj6jeaAH1xRWW+FjqkWL4Hmmm+JCP1bQuqnY4D2jdXWd
	XLUTUp7Y/bDaZwTc/Oi5aUqD3NhkbTTP/FZdRrEbqPAPyB+X9CyOBveMzpmIscT/DgSQqYbeeYh
	A3KGTrg41ezWGYFg0pwuUYkUYJXO+jSzeTeVOpObl61d30l8X+VDM16b6WXdmvnY+upCsH3ENXW
	02LAkg9AEkXoxyczp5iUc8ogRlbRB7HpSb1IjDfs3QMq1DU5k5YAMRnvvOpMBgxtpCtEGOPw1Bi
	EL8zTFDqRlhdnjj/6Fgjy58Z26GspV6OAQMS1d2XtsOa1kKoLwagiiSWyOHgEd3yz7lXIJcZQUr
	UAPjBCAoxCpr9nWl0ytwkFGjfujD8aX9ewaCVGPpWsK0dOK83GzFSu/lboq1fjBjnEtwtNd21L2
	jQj6I3UDfbSWJ4=
X-Received: by 2002:a05:622a:8449:20b0:535:22e8:2fd3 with SMTP id d75a77b69052e-5362725afb9mr117803081cf.10.1792417895776;
        Mon, 19 Oct 2026 06:51:35 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 19 Oct 2026 13:50:46 +0000
Subject: [PATCH net-next 12/15] net: test the frag_list layouts
 skb_segment() refuses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-skbuff-bug-on-followups-v1-12-41dbef50b9f7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792417849; l=3190;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=54YuJC4Sa4ftFWTwcdr1JHSPiV0/4B3b8lTqh1NoeIM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMl/CfrGUamcaF3Ng1FUVBnBIHC3kZ7QHRED94+HWu2IRKE9xF6ZECYluILceDZSaJN+2T+BFcn
 /RZqmOf7s7Qg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-33051d/1792417897-6C2E04E9-2BCDB0C3/0/0
X-purgate-type: clean
X-purgate-size: 3192

The GSO KUnit test only checks layouts skb_segment() can segment.  Add
two it has to refuse with -EINVAL: the non-uniform frag_list with SG
on, which used to hit the BUG_ON(i >= nfrags) the existing test steps
around, and a frag_list member that has its own frag_list.

Both warn on CONFIG_DEBUG_NET kernels, so run them with the warning
backtrace suppressed.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/net_test.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/net/core/net_test.c b/net/core/net_test.c
index bc2ef7612e7d..12a175268a01 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -39,6 +39,8 @@ enum gso_test_nr {
 	GSO_TEST_RESEGMENT_MULTI,
 	GSO_TEST_RESEGMENT_TAIL,
 	GSO_TEST_RESEGMENT_ONE_MSS,
+	GSO_TEST_FRAG_LIST_NON_UNIFORM_SG,
+	GSO_TEST_FRAG_LIST_NESTED,
 };
 
 struct gso_test_case {
@@ -57,6 +59,9 @@ struct gso_test_case {
 	unsigned int nr_segs;
 	const unsigned int *segs;
 	const unsigned int *gso_segs;
+
+	/* skb_segment() is expected to fail with this error */
+	int err;
 };
 
 static struct gso_test_case cases[] = {
@@ -204,6 +209,28 @@ static struct gso_test_case cases[] = {
 		},
 		.gso_segs = (const unsigned int[]) { 0, 0, 0, 0 },
 	},
+	{
+		/* frag_list members that don't end on gso_size boundaries
+		 * can't be segmented with SG
+		 */
+		.id = GSO_TEST_FRAG_LIST_NON_UNIFORM_SG,
+		.name = "frag_list_non_uniform_sg",
+		.linear_len = GSO_TEST_SIZE,
+		.nr_frag_skbs = 4,
+		.frag_skbs = (const unsigned int[]) { GSO_TEST_SIZE, 1, GSO_TEST_SIZE, 2 },
+		.err = -EINVAL,
+	},
+	{
+		/* the second frag_list member hangs off the first one's
+		 * frag_list instead of off the head's
+		 */
+		.id = GSO_TEST_FRAG_LIST_NESTED,
+		.name = "frag_list_nested",
+		.linear_len = GSO_TEST_SIZE,
+		.nr_frag_skbs = 2,
+		.frag_skbs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE },
+		.err = -EINVAL,
+	},
 };
 
 static void gso_test_case_to_desc(struct gso_test_case *t, char *desc)
@@ -283,6 +310,15 @@ static void gso_test_func(struct kunit *test)
 
 		if (tcase->id == GSO_TEST_GSO_BY_FRAGS)
 			skb_shinfo(skb)->gso_size = GSO_BY_FRAGS;
+
+		if (tcase->id == GSO_TEST_FRAG_LIST_NESTED) {
+			struct sk_buff *first = skb_shinfo(skb)->frag_list;
+
+			skb_shinfo(first)->frag_list = first->next;
+			first->next = NULL;
+			first->len += tcase->frag_skbs[1];
+			first->data_len += tcase->frag_skbs[1];
+		}
 	}
 
 	features = NETIF_F_SG | NETIF_F_HW_CSUM;
@@ -296,6 +332,18 @@ static void gso_test_func(struct kunit *test)
 		features &= ~NETIF_F_SG;
 
 	SKB_GSO_CB(skb)->max_segs = tcase->max_segs;
+
+	if (tcase->err) {
+		/* the suppression block doesn't run if it can't be set up */
+		segs = NULL;
+		kunit_warning_suppress(test)
+			segs = skb_segment(skb, features);
+		KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(segs), tcase->err);
+		if (!IS_ERR_OR_NULL(segs))
+			kfree_skb_list(segs);
+		goto free_gso_skb;
+	}
+
 	segs = skb_segment(skb, features);
 	if (IS_ERR(segs)) {
 		KUNIT_FAIL(test, "segs error %pe", segs);

-- 
2.55.0


