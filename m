Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B429A60A3803
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=JQoM7Tco
Received: from list by lists.xenproject.org with outflank-mailman.1457193.1670154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWfG-0005w3-7a; Wed, 21 Oct 2026 13:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457193.1670154; Wed, 21 Oct 2026 13:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWfG-0005vI-1z; Wed, 21 Oct 2026 13:47:34 +0000
Received: by outflank-mailman (input) for mailman id 1457193;
 Wed, 21 Oct 2026 13:47:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xJWfE-0005kS-Sc
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:47:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJWfE-0065O0-8z
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:47:32 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c263-2eae-0a2a0a5409dd-0a2a4508872c-40
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:32 +0200
Received: from [209.85.128.172] (helo=mail-yw1-f172.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c273-f659-0a2a45080019-d15580accc14-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:31 +0200
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-8b0e21048f8so7465957b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 06:47:31 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.248])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b1347fc578sm8595177b3.36.2026.10.21.06.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 06:47:29 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792590450; x=1793195250; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k0p9amurCDLU2dmqJDge7ICpn0TqfU4pmUDL+z2zafc=;
        b=JQoM7TcoX5pi8MFZgJeaB164/VzGrWEZIQ5zc8LKXdcl8ZnB/upSyIIezTcjGLp3gD
         K9Ui7tb7yKdwfGH680dZYWs0SzMtM9hrxrlt9K11fK3yujR2V2gFV532ISe73gEBn5Q9
         O0pgf1s4Dz1vpzG3hCSVKLR5k/epn236JVS4rfVqhVYTcpQw9ZJE9SBPVOerm4nr3VS1
         QgOhl035SKnrP88wpDhf2py3fwr/9IgqsndItuKQOtlm8wnvizJ8K9/o0PaTj3PjMu4z
         5IDhNnoyfQETAq4uVvTDsvtp2eoHkgKkVMGZI+tY3Nr25WM4ARVvIbYjBtqrZrB0/TLq
         n/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590450; x=1793195250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0p9amurCDLU2dmqJDge7ICpn0TqfU4pmUDL+z2zafc=;
        b=ptRWt1elk0zdgiLtQCYIiybSM9GYhcPItS9ZZRo/LQYK+ibojtOFrELWSC+rn00qco
         gcw030sdUIH+ORPD1f3p9rDmL89+vSu0zIZtMTPik1sP4hWAjmjcMyYkW4AOHNAYrjHT
         2erDFvuI6pSKlJLU1auDMoEnpaYurkoU+sSfsPeyADyt/Yv1hK0v+VIPUr2gshu/+ecY
         cvASRJ/RE0mwoZr1CdCYhp1/0DhQ5doZvFxrg3y3Tdn/v/jaUqG8xsVLSoLDUhSPlC1C
         RU+BjnZ+KRecDkI/rvjgOApURUH1LaI2r8EqURshQAxB2sfvSSK/QOjW+ckyQFJZdJ9L
         ci8w==
X-Forwarded-Encrypted: i=1; AKwUvByy52py8e1CgETP7smRyZsEnXO7RNBp/B53sa42QHwR0a1JQsub6z2A9Vrkvzuw7Q7LvIooAxm5GzA=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLkknIdKmowOtDoHbL97eymoHYr1pewQHr7L8/iGP/dhkQA8hTQ
	hJBytM777Q6OWuXBWTWJ5YV82fa1JZoCXQXqpYMQE2rXU/CWCSyMhiw/V8rQDydQUUA=
X-Gm-Gg: AYBFou2QtcQBHFjdm1MX1OX8AC88RAHKwN8Mb9msPtf5To6VAqoM+pItMsIBIQlX8ta
	jqWKnQ5u4aTNIEOrx7FSNB67vC5HdGdZUvJOmHn0aGmXjmYoQfOM4tWpOCWq/JPtHxnXm/WsEU1
	82leisfwl/xluw+2w3iPDn4TBGvz23zIvEkoMcxgOm7LoiOTuzyQitBHt7/wj4AX7IC8TRuPjLW
	hNpwt8wSBlXf91rb9XheIgD6xyCaNO8L2Dx8oJxVWQZUjjxaA9alkCfMearbAjcyrEPjJLN5bT1
	VoezAeR1Ek6zdNf+YXqrWfWy/85fHH4BlzvI+ZQ1zkCJY+XD1jQb4nCw06GBBfVThB40V3ST5Tr
	wxXZ1LRPZGD2X9VmDp43kltZAAqEK/T81Wh93UaKUsLLS4g43IhIbP84yIj4tIeKtX4I3LnBbPh
	Ur/FMOWYEuR3ozHsga9li4dxR4+QI++nnSDXxLVtDO+o04su5OLsZz6K3egBuhevsbzV7+h/eGG
	dKcFdUOSPFPDtCMMps2lGOLUFjpLXwoZOFBtm4LS1DJEP58jOmDoowfAkXBCSBmFDpNFptwvcd4
	oZaobDTm7dhnUuk0zQ==
X-Received: by 2002:a05:690c:282:b0:8b0:8a9c:fac9 with SMTP id 00721157ae682-8b133fdfa78mr12586347b3.28.1792590450548;
        Wed, 21 Oct 2026 06:47:30 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 13:46:56 +0000
Subject: [PATCH net-next v2 12/15] net: test the frag_list layouts
 skb_segment() refuses
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-skbuff-bug-on-followups-v2-12-2aa780a03524@toxicpanda.com>
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
 xen-devel@lists.xenproject.org, Willem de Bruijn <willemb@google.com>, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792590423; l=3631;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=ciolQj524j1USUzaeLZb/LHm0dD/CBvyPNIxBZrRY0k=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJe3JwejlUG1MTBrcQrYruvC03fnpYN7R/Yfj2aVB3nUZLxD2jgW6l4Sp+Atgj8oyoEvxHlliU3
 gY7jb4nUyNgY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c1860d/1792590452-D554C87B-D34DC262/0/0
X-purgate-type: clean
X-purgate-size: 3633
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GSO KUnit test only checks layouts skb_segment() can segment.  Add
two it has to refuse with -EINVAL: the non-uniform frag_list with SG
on, which used to hit the BUG_ON(i >= nfrags) the existing test steps
around, and a frag_list member that has its own frag_list.

Both warn on CONFIG_DEBUG_NET kernels, so run them with the warning
backtrace suppressed.  Also update the comment on the non-uniform case,
which still says SG would hit that BUG_ON().

Reviewed-by: Willem de Bruijn <willemb@google.com>
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/net_test.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/net/core/net_test.c b/net/core/net_test.c
index bc2ef7612e7d..222d24793591 100644
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
@@ -283,19 +310,41 @@ static void gso_test_func(struct kunit *test)
 
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


