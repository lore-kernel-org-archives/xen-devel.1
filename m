Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9D5606A32E
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=UDvQf9nq
Received: from list by lists.xenproject.org with outflank-mailman.1468949.1678023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gu-0001N9-3j; Tue, 03 Nov 2026 02:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468949.1678023; Tue, 03 Nov 2026 02:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gt-0001MZ-Sv; Tue, 03 Nov 2026 02:29:11 +0000
Received: by outflank-mailman (input) for mailman id 1468949;
 Tue, 03 Nov 2026 02:29:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xO4Gs-000142-Da
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:29:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4Gr-00CYCC-Qg
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:29:09 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae94690-e002-0a2a0a5209dd-0a2a450cec40-26
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:09 +0100
Received: from [209.85.160.175] (helo=mail-qt1-f175.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946f4-f479-0a2a450c0019-d155a0afe483-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:09 +0100
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-53cd0c8614eso28050841cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:29:09 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.253])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5498b49ce1dsm13814311cf.5.2026.11.02.18.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 18:29:07 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793672948; x=1794277748; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MseyG3+pKKIruXhcv710BgM8fgKq/guu+mQy13emKdo=;
        b=UDvQf9nq8EcsxThyEuq1CbS0swoqeQQgHLSzrZpNj8wjU4/l1mMSRNrgaxMQSpNasu
         oKsmMY67U8okM/ibsygnwzUUFqozXMQST9pHIvsbOnNzrPxHw9iLkw1bPOGi5Du9Lp2f
         XFjyJitMuNM3zIRLDKRk08kzBSY8IhT2f8WFTNcUwU89SX8Iw/3/CfQLYlWTVA2ZdsTh
         +UHuZE4UEJTK4UOdibkZic7r6VTCDGm86vH74p9X+UeF1ilk7zBo6N0mdihpBl12SK/n
         mHdd54s1dQoqW+QxFOllSc6sj8LTTuRt189dJS+HdzWLAbc+2dX/o6DY/xK9IPab8YIm
         e9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672948; x=1794277748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MseyG3+pKKIruXhcv710BgM8fgKq/guu+mQy13emKdo=;
        b=yQ+QFe1lya6II1UqlC7Txeseg+VBXYKXHON1swEW/FU2SBxmTJM3Rcm3Xbmgf3qNeL
         QDomOoKpbd2X2Y9/mYVPU2m5Kj3cNA2HrTlMVYpQnc6zx6AzFB4LEk/+o8gd00wxDIC5
         tvBvxc6wOeFkW4gtZYyRtsNZ/8Q/rBbV3sl1s0RX47eNl8CMzlCFOm9NeDGOnD/1q6Y0
         9Ut4Tr8BvM5fKW0I3r8Z/nMY6exrMIEFVrB1FWHd1iV3Wggni+tcPFatU6hbbHEU3g7u
         3mEwbCrq9eUdwqWNWkjf+eTyZbsDUJBE7mW6a7brohcJW4SwbF6lFQittZ5CAkCA/TGJ
         qulg==
X-Forwarded-Encrypted: i=1; AKwUvBypcZ3D5GbBNR8ONNtzzGQ4MFjqNnCD5JtX9LaLM8HAGhVbQen/LIn3yD+n0W4hfoErP5mX737q2l8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+uZsukGHq0THSwKzbR8cFDLwmGZtfwRj8X9UDvfAHNl06XVJgm
	qinsH8PB82KfatnkZ59FL47qDneSLOukJes6ffblFRAhfkIu3OZFkZLMtR0JkQxTDdI=
X-Gm-Gg: AYBFou1C1TrieimN2J0MowNdjx9Zj/dpGbH6TYpMTqUoII15HkqM8F+sMj2dK6bd5sQ
	eib3c5gntpsFQOnoI06vMXBKpko2FSnC/CUToRgIy/xlrVtvNv2hJahmfJVW6TReNPlL3Nw6ZMZ
	4kA82On0Jxgb6rsIToXS0/tokz2qhaYWNl9lF1Bs31N2nn1s9v0IT/KArCGgPWL8ND5i22Ou6D9
	JlFwi2MBbvuYpTrutAQgCsbTfTVXgCpt+fMQQnTadyp3VwV8Ajo50Rk6OF8tTc50YHry6yYPGVA
	YnDz0a9aUrj0X3/LA65wTdG+naB6ScGx/nXG38cDcRkcHG8Tj44iwGTJqwdokeT9O6hbAdGQY/k
	nojNJ8SeXqFWygt56191DP25crH5sWQRYlrJRocMZY3k2T0i7ikqr+6rK9yAB7osApc8TJCqA+1
	RxU1MGlJEgMe2sXyR8p/DApOTpbvWk0scmQd4t6pYdDISw1DCAYuitlpSS44xz1qOF1K1zw3C+C
	bHkHXg+SuHdRcyLeYcWo2scapJ+v0N3MEtNfAyGWbyADJ/9Gn7hWGKPMtxC13i6kf3Z39pq9mKG
	4u1R3FdbI3fbTWOA8oEHevGKxbkllMFI8xThqmV6tHt0AA==
X-Received: by 2002:a05:622a:250e:b0:535:a5fa:ee05 with SMTP id d75a77b69052e-542b7ff0369mr187387061cf.69.1793672948244;
        Mon, 02 Nov 2026 18:29:08 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 02:28:38 +0000
Subject: [PATCH net-next v3 12/15] net: test the skb layouts skb_segment()
 refuses
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-skbuff-bug-on-followups-v3-12-54ad0ab57614@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793672923; l=5235;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=/VgW0oW9T+Tzy+i1BGO6eU3AucNR1Ntg0slpO9Mj98E=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKMmn6TBuIrBkysKogxABEz6HQG1Via38Q+vUl7yCgJi2hIoaEjJWJRzWZW20ii4tSe3afYAeZ4
 ExrUaw3kh8Ao=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d25034/1793672949-020C1A5B-F8DA71D8/0/0
X-purgate-type: clean
X-purgate-size: 5237
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GSO KUnit test only checks layouts skb_segment() can segment.  Add
the ones it has to refuse with -EINVAL:

 - The non-uniform frag_list with SG on, which used to hit the
   BUG_ON(i >= nfrags) the existing test steps around.
 - A frag_list member that has its own frag_list.
 - An skb whose len counts bytes it doesn't hold.  The data runs out on
   a segment boundary, in the middle of a segment, after the last
   frag_list member, and with GSO_BY_FRAGS.

They warn on CONFIG_DEBUG_NET kernels, so run them with the warning
backtrace suppressed.  Also update the comment on the non-uniform case,
which still says SG would hit that BUG_ON().

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/net_test.c | 98 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 95 insertions(+), 3 deletions(-)

diff --git a/net/core/net_test.c b/net/core/net_test.c
index 2b5080c22663..298ca240104c 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -41,6 +41,12 @@ enum gso_test_nr {
 	GSO_TEST_RESEGMENT_MULTI,
 	GSO_TEST_RESEGMENT_TAIL,
 	GSO_TEST_RESEGMENT_ONE_MSS,
+	GSO_TEST_FRAG_LIST_NON_UNIFORM_SG,
+	GSO_TEST_FRAG_LIST_NESTED,
+	GSO_TEST_SHORT_LINEAR,
+	GSO_TEST_SHORT_LINEAR_STRADDLE,
+	GSO_TEST_SHORT_FRAG_LIST,
+	GSO_TEST_SHORT_GSO_BY_FRAGS,
 };
 
 struct gso_test_case {
@@ -58,11 +64,16 @@ struct gso_test_case {
 	unsigned int gso_type;
 	/* skbs from alloc_skb() instead of build_skb(), head_frag clear */
 	bool no_head_frag;
+	/* bytes that skb->len counts but the skb doesn't hold */
+	unsigned int missing_len;
 
 	/* output as expected */
 	unsigned int nr_segs;
 	const unsigned int *segs;
 	const unsigned int *gso_segs;
+
+	/* skb_segment() is expected to fail with this error */
+	int err;
 };
 
 static struct gso_test_case cases[] = {
@@ -241,6 +252,61 @@ static struct gso_test_case cases[] = {
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
+	{
+		/* the data runs out on a segment boundary */
+		.id = GSO_TEST_SHORT_LINEAR,
+		.name = "short_linear",
+		.linear_len = GSO_TEST_SIZE,
+		.missing_len = 50,
+		.err = -EINVAL,
+	},
+	{
+		/* the data runs out in the middle of a segment */
+		.id = GSO_TEST_SHORT_LINEAR_STRADDLE,
+		.name = "short_linear_straddle",
+		.linear_len = GSO_TEST_SIZE + 500,
+		.missing_len = 700,
+		.err = -EINVAL,
+	},
+	{
+		.id = GSO_TEST_SHORT_FRAG_LIST,
+		.name = "short_frag_list",
+		.linear_len = GSO_TEST_SIZE,
+		.nr_frag_skbs = 1,
+		.frag_skbs = (const unsigned int[]) { GSO_TEST_SIZE },
+		.missing_len = 50,
+		.err = -EINVAL,
+	},
+	{
+		.id = GSO_TEST_SHORT_GSO_BY_FRAGS,
+		.name = "short_gso_by_frags",
+		.nr_frag_skbs = 2,
+		.frag_skbs = (const unsigned int[]) { 100, 200 },
+		.missing_len = 50,
+		.err = -EINVAL,
+	},
 };
 
 static void gso_test_case_to_desc(struct gso_test_case *t, char *desc)
@@ -337,21 +403,47 @@ static void gso_test_func(struct kunit *test)
 		skb->data_len += total_size;
 		skb->truesize += total_true_size;
 
-		if (tcase->id == GSO_TEST_GSO_BY_FRAGS)
+		if (tcase->id == GSO_TEST_GSO_BY_FRAGS ||
+		    tcase->id == GSO_TEST_SHORT_GSO_BY_FRAGS)
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
 
+	skb->len += tcase->missing_len;
+	skb->data_len += tcase->missing_len;
+
 	features = NETIF_F_SG | NETIF_F_HW_CSUM;
 	if (tcase->id == GSO_TEST_GSO_PARTIAL)
 		features |= NETIF_F_GSO_PARTIAL;
 
-	/* TODO: this should also work with SG,
-	 * rather than hit BUG_ON(i >= nfrags)
+	/* TODO: this should also work with SG, rather than fail the
+	 * i >= nfrags check in skb_segment()
 	 */
 	if (tcase->id == GSO_TEST_FRAG_LIST_NON_UNIFORM)
 		features &= ~NETIF_F_SG;
 
 	SKB_GSO_CB(skb)->max_segs = tcase->max_segs;
+
+	if (tcase->err) {
+		/* the suppression block doesn't run if it can't be set up */
+		segs = NULL;
+		kunit_warning_suppress(test) {
+			segs = skb_segment(skb, features);
+		}
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


