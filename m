Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AC5606A32D
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=K13mRVOB
Received: from list by lists.xenproject.org with outflank-mailman.1457202.1670181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWfM-00078k-MB; Wed, 21 Oct 2026 13:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457202.1670181; Wed, 21 Oct 2026 13:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWfM-00077u-Ec; Wed, 21 Oct 2026 13:47:40 +0000
Received: by outflank-mailman (input) for mailman id 1457202;
 Wed, 21 Oct 2026 13:47:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xJWfL-0006uW-At
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:47:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJWfK-003fNk-Nq
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:47:38 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c26e-8faa-0a2a0a5109dd-0a2a4504b266-42
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:38 +0200
Received: from [209.85.128.179] (helo=mail-yw1-f179.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c279-b57f-0a2a45040019-d15580b3d81e-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:38 +0200
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-8b05bf699easo7006147b3.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 06:47:38 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.250])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b13018e0d1sm11045597b3.41.2026.10.21.06.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 06:47:36 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792590457; x=1793195257; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3Vx6nCjfDKI1O0Rv8fJf2F45AGRs7XGpGz0epefQ+g=;
        b=K13mRVOBoZI+RKB8CEOjTZw669BjWZDcjcgz8GoevtOcCMYs7N2PVmEFj5Z9oQj9LZ
         Vfq+6wG/qhRTyg0TD6Pr8zdtIMKCDiSvmprhg2qVo9CHSSO0d6oi3VGIgVUoG7H4NrI0
         MfiUriHoKN54+oy+/FBXc2sSWnyNHfAKjWoY1SW3KXW9gQ4p+AmcRI2BlUGWUggN/L/c
         RusgnaNT+QssUKMsIdoN2IdebzefN40Bkf0bPGJ1yUO3p1wn9ZMCSHDhNJbCEIOIP+DE
         xVvEJ6YrvFgl6ns+2U/7arhrPpym0JHuWlpaVSTgY5NwcHGfTPfisZ1hrcoI4DQWAVl0
         860Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590457; x=1793195257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3Vx6nCjfDKI1O0Rv8fJf2F45AGRs7XGpGz0epefQ+g=;
        b=sOSTDrCTXNVj5D6UZWS4YYVADI65aWDGnP/8BxVBskbDXV46Sb488crL63eRJQMOXt
         2C8FKbTDSxl25XJDwrT5csFrQfGvSBB0ubJOymeCVH2vQtRhju7JsGWEw4F2u8AlP7Sw
         eo+VHFEA79uBxUJ8APIUOz5hSciDkgbLV7UXmy1zlI1B0utU7XRkSAgTfBzlC02PUNm4
         npr4Kyc9uZOuCgsk1O0kSkEXMOXq9FyuhCDfO6vTy2ppsIEu5udLkF2OKzk5wgJiH445
         HCWe6xm6uBqq4aHQkSqGM7GnrIqgRoXrvcWvgRDT54d2cwLVKGsfAvjhBJh1FoYH90Ul
         XwFw==
X-Forwarded-Encrypted: i=1; AKwUvBz50tF9DhcsSVhfh9teC5Vyni0jXWnUkqceVbuU75eTOZFwptA7u+DNf/z7T67Brcf2X539X2Pt5o4=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIj0DaCoyntvNAR3t9HCKUNaX/PSmwueQ9MyAm4lXBpChGFTKlD
	JbYR3wZgnj3amaZxqIYPBhxiL0/Ga34FgeJf26rLWc/b8op+E9luWcbliMC5keyoaOc=
X-Gm-Gg: AYBFou04E/UBB1UOVv5ftd+eS25pdskoPsXX6bd2+9fRCMUZ1RohK8pMmdGjlr30idt
	iuEpb7WSa1mgBQ40KMQfjzBZTH0lrJmFfFMZnb89yeDmDH33Qh+3Qjl07qa/yHtWTFkHkG2rUfj
	LAfBsxPIhEyCXPh1OUOgMqy3TfXizcHNvfjRgzrX7h2zk18MjOWDCDnKNo5XqPl/kPdr2xVDN5K
	w3irgFtxU2gBGkMHNmFbn+DPipkWqd/wGTK9ePQtL7UXj6iYDRTanu0Tj8jAJsmnvrSN76xCl1S
	xxZtc6uVZEjUIrs8sRs3JdjUVgZuHPmGqsHDfGozN1zEpMfITv+Z0NhF2r6l5wMfUSfiRAq210C
	8G3YnCUF19n3m1RS9U6Jrnmq5xOsLl1vjUrvlZ9NOBqB7PKPhdjOu/c2evmnESdyaqe/sQtfDmw
	zKRyWYuvQJe+nH9hVeMUgRdRjkht6kMihQuEoYFHAJjDt5r+pTDH2PJYJ9l531c5MQ2dJQWzVRD
	s6XKfxiC1dQa00SP4Y6K1SvSObn8TA/9JgqbOsU8oRhAyoiEYZDdSGYm++wlqyGcV2hx7kH
X-Received: by 2002:a05:690c:4:b0:873:5c6b:a314 with SMTP id 00721157ae682-8b134389b4dmr10867637b3.66.1792590457017;
        Wed, 21 Oct 2026 06:47:37 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 13:46:59 +0000
Subject: [PATCH net-next v2 15/15] net: update comments that still describe
 the skb BUG_ON()s
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-skbuff-bug-on-followups-v2-15-2aa780a03524@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792590424; l=2172;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=MDGe2ZQJ+rI3P7PzLeUdDmFI72t2b7q58f2qUsQ4Bag=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBAD74Tlz2UL8T7L2mQyY7NisozlhPe3QQxIgCRdFLU8kx33xd6A5QYzW2kATM5/cjWZtxWiPe3
 SKnGmgkQI4gA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ebf023/1792590458-C36C2B50-ECE6C033/0/0
X-purgate-type: clean
X-purgate-size: 2174
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

No functional change.

Acked-by: Mina Almasry <almasrymina@google.com>
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/filter.c | 6 +++---
 net/core/skbuff.c | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/net/core/filter.c b/net/core/filter.c
index 3ee1a093337e..f5bce0dc43fe 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -3696,9 +3696,9 @@ static int bpf_skb_net_grow(struct sk_buff *skb, u32 off, u32 len_diff,
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
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index c5e28a52114b..e0c8f2f6bfac 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -5551,8 +5551,9 @@ __skb_to_sgvec(struct sk_buff *skb, struct scatterlist *sg, int offset, int len,
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


