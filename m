Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C12606C5A6
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=ppjf1vB1
Received: from list by lists.xenproject.org with outflank-mailman.1472773.1680680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtw-0005UR-JU; Wed, 04 Nov 2026 20:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472773.1680680; Wed, 04 Nov 2026 20:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtw-0005Se-8b; Wed, 04 Nov 2026 20:48:08 +0000
Received: by outflank-mailman (input) for mailman id 1472773;
 Wed, 04 Nov 2026 20:48:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xOhtu-0004yP-4k
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:48:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhtt-000QZ3-Hi
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:48:05 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb99bc-8faa-0a2a0a5109dd-0a2a4509d8b0-24
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:48:05 +0100
Received: from [209.85.219.52] (helo=mail-qv1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb9a04-be1a-0a2a45090019-d155db34bd32-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:48:05 +0100
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-91c63449320so12032306d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:48:05 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.244])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91e962b4403sm2745066d6.20.2026.11.04.12.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 12:48:03 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793825284; x=1794430084; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0RXmawfasrTX5jMs9+VRHea8GI7D/GAkKgJQ1fq4BU=;
        b=ppjf1vB1A1Rbr+usYZ23bnfAuHlp50cZb8tDDi6Juuvqp5WunItAP9Uskpj0fQ4Yo9
         me+5+Fglu7FvBtmZPRP1kRvGcbUq7mR6csA053v1NAsZ2hyzdRzBgkJOn4jYlsqEBfiS
         pJmJl1PL8N+6QdRAA14cEVKXz1I7theCqtA09sbHlcgDAXugcHe4fQ4vT5rWKLtCtNHa
         HgVY3WRHy8rveAytG6uIhBAU2znn/KNMvyhIYC+XYjl41B1iEFpQG3AXcSNyxPjkB70p
         BJb+JdEPo7FM2w/i0bhx3WwUBrfT/v3+8aJAF8Cs6UP+9ISnkuGSb4Sw34PCyFTAdA7J
         QC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825284; x=1794430084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0RXmawfasrTX5jMs9+VRHea8GI7D/GAkKgJQ1fq4BU=;
        b=huPtoLPM4EkChk+nlHTQCFpcyl7Qj/zLVuGlh59hmQKQWSt5QCqwyaNY+ZBvd6IOzx
         Uz3YJfdrgy1WQwnI/7LqT7D3uhFYFAQME20uqwNjcBR80HLc6bJJTEw42REZ8TJMen7D
         ge0H95FXNWEW7lF/fX2TrySC/q9vWJiwL14gFGLLfGAdC+HwYlPsSKENCnpSa+VDXpBH
         Z9AKUf0dBbDWGQvRa+49bbB3weClLQJzrDcPTaMpF0CX5kMNHq7Qom7aT4Eh38QauOjF
         opm9/nZK1NiDnM04hHFi9m+UiSz5WmfIvpCKWt7BGuUttagS4LiYnYgMrSAEFnBurJQm
         frqA==
X-Forwarded-Encrypted: i=1; AKwUvBzQPAGaA8ipWphUfB9+uvvuVbSkujAjW9/T6WCTBuj/Wu48wtGLwnJkN8tCUzuZHjqAaAOafou8MQs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/GfD5tiec790ui+JaeOIGe3wv4QUrOJ2ZcV6x7Iqqk6tcMVSwa
	uO2Xr8ASs0Z/yxJfj7WG6wewi2N1syEQV9JxkUsiMU74MUwm4a5RV5By4e0wkIzQcfk=
X-Gm-Gg: AYBFou3J9weMItWIfcqh6kyzXyBMHP2+fmfj++exWLVMsMb8kgZfQJtK+XzESRjQM8d
	FsvZnNiq1WEAXvXHYDpQ5t5A/AhTeVFN/slqfoVQslQNAzOoIc4Lmm2AlaWj6sX7mYrygzszlqC
	FgDAFLZhV9OQg/cmwWZ7QXgTb4oL6AUdgcb/aVMsy2B4vWaDAJhudjlDCnjr7iB+SD0PgMiCNkW
	w5Iz9iRdtWhIOBW/Trb5HtEbnSf54dTVSQCW4Zo5Hivi0r395zHcLQ9gB/2GQ146zFBDRqb6t71
	reBpGnLqWWkBc+X6PFvNp/PTBZDxpZTYu4WDfEtqv3h08f7/ZiQ7/FKHX9WTGf5F6CyDn/6/xCR
	6jss5gaLIKSI0eNwkZj9v7bkOnpcAGlGrw7pff2W97fvC7i9mB22kWBk0kszWhKJzcV+jeGJgTq
	VezLFrIPOe5NXGUjmjoV7HS/kStap1IJhh8mgj/ZwvUfkw5NCkWjacq0vkbfF80MxnnYBL0SIPT
	j76GcslGc1Q4ZRkcHqTlmKVPBH4GuevjTakyDFnaj2K5VuauZIRfj0Ve+o8yf5zwwgEbTctcER6
	5CtyRYjtKaN2bVF9KnfYEUFGct99J23P+ldQT3hW4s2rIA==
X-Received: by 2002:ad4:5ae6:0:b0:91e:93df:7968 with SMTP id 6a1803df08f44-91e93df8690mr14233906d6.58.1793825283878;
        Wed, 04 Nov 2026 12:48:03 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 04 Nov 2026 20:47:24 +0000
Subject: [PATCH net-next v4 12/15] net: test the skb layouts skb_segment()
 refuses
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-b4-skbuff-bug-on-followups-v4-12-b7ffeb364f5d@toxicpanda.com>
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
 xen-devel@lists.xenproject.org, Willem de Bruijn <willemb@google.com>, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825269; l=7318;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=7eIKfmXdYFyO4gt39hdEL3I6I1+zpcaXVGaqmsE4mDU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QER7Iemt/O5h6axALU8K/KXqZQqDuQVWaPwTSf9id6brnuO7euiqtgPfKirDjVhsD76QG+PWs0G
 ladydqEnuSgU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-bad1c0/1793825285-BCCCF034-E3F1425D/0/0
X-purgate-type: clean
X-purgate-size: 7320
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GSO KUnit test only checks layouts skb_segment() can segment.  Add
the ones it has to refuse:

 - The non-uniform frag_list with SG on, which used to hit the
   BUG_ON(i >= nfrags) the existing test steps around.
 - A frag_list member that has its own frag_list.
 - An skb whose len counts bytes it doesn't hold.  The data runs out on
   a segment boundary, in the middle of a segment, after the last
   frag_list member, and with GSO_BY_FRAGS.

Run the last two groups without SG as well.  There the nested frag_list
is segmented.  A len that is too big fails with -EFAULT from
skb_copy_bits(), except with GSO_BY_FRAGS, which still gets -EINVAL.

They warn on CONFIG_DEBUG_NET kernels, so run them with the warning
backtrace suppressed.  Also update the comment on the non-uniform case,
which still says SG would hit that BUG_ON().

Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/net_test.c | 158 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 154 insertions(+), 4 deletions(-)

diff --git a/net/core/net_test.c b/net/core/net_test.c
index 2b5080c22663..03203454cd19 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -41,6 +41,17 @@ enum gso_test_nr {
 	GSO_TEST_RESEGMENT_MULTI,
 	GSO_TEST_RESEGMENT_TAIL,
 	GSO_TEST_RESEGMENT_ONE_MSS,
+	GSO_TEST_FRAG_LIST_NON_UNIFORM_SG,
+	GSO_TEST_FRAG_LIST_NESTED,
+	GSO_TEST_SHORT_LINEAR,
+	GSO_TEST_SHORT_LINEAR_STRADDLE,
+	GSO_TEST_SHORT_FRAG_LIST,
+	GSO_TEST_SHORT_GSO_BY_FRAGS,
+	GSO_TEST_FRAG_LIST_NESTED_NO_SG,
+	GSO_TEST_SHORT_LINEAR_NO_SG,
+	GSO_TEST_SHORT_LINEAR_STRADDLE_NO_SG,
+	GSO_TEST_SHORT_FRAG_LIST_NO_SG,
+	GSO_TEST_SHORT_GSO_BY_FRAGS_NO_SG,
 };
 
 struct gso_test_case {
@@ -58,11 +69,18 @@ struct gso_test_case {
 	unsigned int gso_type;
 	/* skbs from alloc_skb() instead of build_skb(), head_frag clear */
 	bool no_head_frag;
+	/* bytes that skb->len counts but the skb doesn't hold */
+	unsigned int missing_len;
+	/* segment without NETIF_F_SG */
+	bool no_sg;
 
 	/* output as expected */
 	unsigned int nr_segs;
 	const unsigned int *segs;
 	const unsigned int *gso_segs;
+
+	/* skb_segment() is expected to fail with this error */
+	int err;
 };
 
 static struct gso_test_case cases[] = {
@@ -241,6 +259,110 @@ static struct gso_test_case cases[] = {
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
+	{
+		/* without SG the nested data is copied by skb_copy_bits(),
+		 * which does look inside a member's own frag_list
+		 */
+		.id = GSO_TEST_FRAG_LIST_NESTED_NO_SG,
+		.name = "frag_list_nested_no_sg",
+		.linear_len = GSO_TEST_SIZE,
+		.nr_frag_skbs = 2,
+		.frag_skbs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE },
+		.no_sg = true,
+		.nr_segs = 3,
+		.segs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE, GSO_TEST_SIZE },
+	},
+	{
+		/* without SG it is skb_copy_bits() that runs out of data */
+		.id = GSO_TEST_SHORT_LINEAR_NO_SG,
+		.name = "short_linear_no_sg",
+		.linear_len = GSO_TEST_SIZE,
+		.missing_len = 50,
+		.no_sg = true,
+		.err = -EFAULT,
+	},
+	{
+		.id = GSO_TEST_SHORT_LINEAR_STRADDLE_NO_SG,
+		.name = "short_linear_straddle_no_sg",
+		.linear_len = GSO_TEST_SIZE + 500,
+		.missing_len = 700,
+		.no_sg = true,
+		.err = -EFAULT,
+	},
+	{
+		.id = GSO_TEST_SHORT_FRAG_LIST_NO_SG,
+		.name = "short_frag_list_no_sg",
+		.linear_len = GSO_TEST_SIZE,
+		.nr_frag_skbs = 1,
+		.frag_skbs = (const unsigned int[]) { GSO_TEST_SIZE },
+		.missing_len = 50,
+		.no_sg = true,
+		.err = -EFAULT,
+	},
+	{
+		.id = GSO_TEST_SHORT_GSO_BY_FRAGS_NO_SG,
+		.name = "short_gso_by_frags_no_sg",
+		.nr_frag_skbs = 2,
+		.frag_skbs = (const unsigned int[]) { 100, 200 },
+		.missing_len = 50,
+		.no_sg = true,
+		.err = -EINVAL,
+	},
 };
 
 static void gso_test_case_to_desc(struct gso_test_case *t, char *desc)
@@ -337,21 +459,49 @@ static void gso_test_func(struct kunit *test)
 		skb->data_len += total_size;
 		skb->truesize += total_true_size;
 
-		if (tcase->id == GSO_TEST_GSO_BY_FRAGS)
+		if (tcase->id == GSO_TEST_GSO_BY_FRAGS ||
+		    tcase->id == GSO_TEST_SHORT_GSO_BY_FRAGS ||
+		    tcase->id == GSO_TEST_SHORT_GSO_BY_FRAGS_NO_SG)
 			skb_shinfo(skb)->gso_size = GSO_BY_FRAGS;
+
+		if (tcase->id == GSO_TEST_FRAG_LIST_NESTED ||
+		    tcase->id == GSO_TEST_FRAG_LIST_NESTED_NO_SG) {
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
-	if (tcase->id == GSO_TEST_FRAG_LIST_NON_UNIFORM)
+	if (tcase->id == GSO_TEST_FRAG_LIST_NON_UNIFORM || tcase->no_sg)
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


