Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80755CCF2E6
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 13:51:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454418.1668067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInmD-00033O-LL; Mon, 19 Oct 2026 13:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454418.1668067; Mon, 19 Oct 2026 13:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInmD-00033F-Fx; Mon, 19 Oct 2026 13:51:45 +0000
Received: by outflank-mailman (input) for mailman id 1454418;
 Mon, 19 Oct 2026 13:51:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xInmC-0002l6-1Z
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 13:51:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xInmB-00EenQ-E5
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:51:43 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad62062-2eae-0a2a0a5409dd-0a2a4504afc2-46
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:43 +0200
Received: from [209.85.219.43] (helo=mail-qv1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad6206e-b57f-0a2a45040019-d155db2be519-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:43 +0200
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-91791ec1b83so18181286d6.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 06:51:43 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91bcbb233d2sm98126806d6.32.2026.10.19.06.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 06:51:40 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792417902; x=1793022702; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sz34K0Iw8+vtFq1WnWsYscgmIxwM3BOh5ri5FmDCCys=;
        b=a+xlEpAW2cmF5V4uu/O6jYKhOqXEf9N5lp4qPajrb1IBF4ow27Urvrv4AuR8ABDr+F
         +Pp9X/m6DGWFSqhRjTHOE+zCfZtayXYPMKtJOBE5cxR3h0BRdLkgDZczutT3T5blZDIp
         nvkPduUvPok0caxl8yAr2q2i98pSa5n2GFM+MgANPcCg/Hmkt8X+mLdt+n+a2sX+KZNY
         9ofIvSpVC2fZeDXDyUClpqGnOCzjxu2C48grLuhXy/MBpvHJhyis6PPwvTb9wbFnjGKI
         a/7GfP2kfE3fyEmLheIEu+IsiwMVGlJh0LHbnh/wQcGwGP1E5Vy/pZZ3+DXdhttecZ9T
         iTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417902; x=1793022702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sz34K0Iw8+vtFq1WnWsYscgmIxwM3BOh5ri5FmDCCys=;
        b=GPiftnZyJwpNQdiP0j/5BusagI1vfJlLB500gXEooKSF/M44n7xF/+FxuxggQWl8tk
         wvdJG/NOfSjgBzy/vHa3F45nknDHAIudl+hTDivsy0i8I0zvuvlbkNmQNsuoW/flXs9D
         hqOxJ+/QgoV/VjRn69UZx6pOZKRw1E5s1l8sln4lTxRLBEf/0YAsN/zw0ZKYMgMt8Vsb
         WKHQdeNuVG2bqn/j7B+4YJLA7ERai6JECuNPwik+Db6L0Z67w7FbrKIl1RB1FNnRuPMD
         wB2vdhJQ3h6ukqqFWl8yU4cO5U6qdoi+ltlJq2eUkW7u8h1JpG6czlDW2V14TOtdU+5e
         r3pQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/LFE3B3r9db9k6km1HzrGCoZGayB+EotHzeMdGYWHFD8aoY0fdBR7DrfVkVMJi0aUzojwKCLpAiY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJGEkiOSbSewNsvrQ74LK2MWaqUXAAdNVQgBnefun/KgWL5n1K3
	XMtU8oLpWuin5+pM+6rrqe7dy7X2/CjXUk9TC6wmgesIVDzfwzfsVvRzZocbHd52mxk=
X-Gm-Gg: AYBFou2kv6CPk22kKMKOETXyKCmsd4xLjJkBfxzjuWsv2Nli3ajH1H8JiiJQ8ZE0qX5
	PJEUeAC7S5XkBj8BJYEUhG3gyU1Grs7pf9f47f1hoSUg29bSulzTME67i50zOzDx3/w5qZI2DAY
	oasK/AlIxlCZgcGqej4lQEGiEksLL6FMuPjeE0ZUOUSXRu0aP5cKnMYq62axJZE6Q3tSqhLdlk9
	MRQb9WaCQfEUXKaS4ugbPmBfLrMt/cRoKIkhGX6nsZ+/GcM3GEzSSYhq8aaqikTsu16VROaXSvZ
	c8f0j+hftpHlK7fPJVm9SFGLi9Fn1ELO1sowx1SwNgt2N/gBH6/Zoo6/67TN9cDAPa14m92UYLS
	Kx0DONG57x0JMIQDBYRmLTFRftXE5PqiI5dcPoTFFrmjHC7MygS0127tvHFUmuYJR3EEnCUM+kj
	80JZEIt7CIaYdXmWXDnsAdb7UDhKvV8CTTVVV8GD5Y1D4bW6W0Bj6j8QTaOTu0EmNa6ko4ICyMQ
	oeUeL3eHEe/jvY=
X-Received: by 2002:a05:6214:29e2:b0:919:aba4:22e5 with SMTP id 6a1803df08f44-91bdf0aa97dmr130453586d6.18.1792417901621;
        Mon, 19 Oct 2026 06:51:41 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 19 Oct 2026 13:50:49 +0000
Subject: [PATCH net-next 15/15] net: update comments that still describe
 the skb BUG_ON()s
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-skbuff-bug-on-followups-v1-15-41dbef50b9f7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792417849; l=2874;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=bVkQYPRV5cmZpoQgzwHTIPv/OeC1BGK6SJq4klyY24s=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGRgYXu9jiEH+o+P/X5XgMdqaIYdTCVgqXiXo+r1ZD/WK34+ps+wJnDs8hXR/0Hv/jB0pnLBW9g
 OlRZBGpF96AQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ebf023/1792417903-50EDEB50-C2196414/0/0
X-purgate-type: clean
X-purgate-size: 2876

The skbuff BUG_ON() conversions left a few comments behind:

 - bpf_skb_net_grow() says skb_segment() BUG()s on a frag_list with
   head_frag set at the downgraded MSS.  It fails the segmentation and
   the packet is dropped, which is still why the skb gets linearized.
 - The GSO KUnit test says the non-uniform frag_list case would hit
   BUG_ON(i >= nfrags) with SG.  That check now fails with -EINVAL.
 - The skb_to_sgvec() kernel-doc doesn't list the -EINVAL that
   __skb_to_sgvec() returns when @offset and @len run past the end of
   the skb.

No functional change.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/filter.c   | 6 +++---
 net/core/net_test.c | 4 ++--
 net/core/skbuff.c   | 5 +++--
 3 files changed, 8 insertions(+), 7 deletions(-)

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
diff --git a/net/core/net_test.c b/net/core/net_test.c
index 12a175268a01..d38dfeed163b 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -325,8 +325,8 @@ static void gso_test_func(struct kunit *test)
 	if (tcase->id == GSO_TEST_GSO_PARTIAL)
 		features |= NETIF_F_GSO_PARTIAL;
 
-	/* TODO: this should also work with SG,
-	 * rather than hit BUG_ON(i >= nfrags)
+	/* TODO: this should also work with SG, rather than fail the
+	 * i >= nfrags check in skb_segment()
 	 */
 	if (tcase->id == GSO_TEST_FRAG_LIST_NON_UNIFORM)
 		features &= ~NETIF_F_SG;
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index b6ada54ecc57..4822f96fc1c8 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -5554,8 +5554,9 @@ __skb_to_sgvec(struct sk_buff *skb, struct scatterlist *sg, int offset, int len,
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


