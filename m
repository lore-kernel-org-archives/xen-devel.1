Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237CC609693A
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=cwTvmlVe
Received: from list by lists.xenproject.org with outflank-mailman.1472768.1680669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtu-00055O-SE; Wed, 04 Nov 2026 20:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472768.1680669; Wed, 04 Nov 2026 20:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtu-00053l-DU; Wed, 04 Nov 2026 20:48:06 +0000
Received: by outflank-mailman (input) for mailman id 1472768;
 Wed, 04 Nov 2026 20:48:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xOhts-0004fo-OM
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:48:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhts-00BcE3-57
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:48:04 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb9a01-e002-0a2a0a5209dd-0a2a45038e4e-6
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:48:04 +0100
Received: from [209.85.222.173] (helo=mail-qk1-f173.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb9a03-fae8-0a2a45030019-d155deadf066-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:48:03 +0100
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-93f1e5d7450so114462485a.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:48:03 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.255])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-945d4813a6fsm293565585a.21.2026.11.04.12.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 12:48:02 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793825283; x=1794430083; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21AXhK/7pbqORDSG4HxUO46u8d65H6wDFEiP5u1gVuA=;
        b=cwTvmlVeJo7m10G+m/hC028Nv+UHHlAwFIcnzpGu7Ocgxd58Q+XEMncQEi/hP41gIe
         EVst13OdDfzMyft9iU88+Wc1999LTzUj64gWNjt4jZXHO3ITGNrVn2Y0Ubx8gdxMNm8B
         2+59dmoq2+ycltNdM5v7kyZjXBu08jkNHFyHby8Jh9LGX9imsh2irBfJeNYjv2hPd4tZ
         RkJH7tdSmfVmmz91kjxjKUQeCij+dG+7Lp4GhKq9hcguvNLx2i74sqWyPfD3QyF6Jwik
         V8l+6NgEYA5fckRGLeGNlpkydyoTm2hv2bu2qsdAlZ1iWmW9lYte2kXpbeicuhgKCXk6
         NSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825283; x=1794430083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=21AXhK/7pbqORDSG4HxUO46u8d65H6wDFEiP5u1gVuA=;
        b=0vTs+UTcoG1IJ4+nPrUAf7qc37M5VKWjLLTLMCQ+gKCfkeSnXyPhIITnexnsTCdrHC
         aCxkFx4pf7nueLlOaKUK3WfW4+49eTURjc0aFDfZOARZnH9gxu7zodHsYl4MuYv4AglM
         m6u5NQ/h4gsESobMZlGKrADOXaekhS0Ic0wKrOXQxqD1yH1i2vIfDu6+tNJT4UWgCbSz
         iIxMJf0x5FEQM3X04qFMYmjqxENEGaP/ybRJbf8hi0wfAh39RMeB3NAxl+sE+l7Z7xu4
         7kcnc/5MYWO7JyubrDatAoem03LOFy8RHCXRMhG26DUAnje9QCXQK9flF8bNPn6ot/WD
         IsnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLlAHd2+kQQOpSG5dF1uk3P8SO9JFx5NVat7AqllN+B+Q7Mp8hdiRz/LRunUUhUextWaWdR+aqaw4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+jlR23cH1OPKgqdU56NoCkrEQ4i/2JOEEvOKwxxv0ly7idruHu
	KOz9QOcNHgFsoen/xvmy5bC6r2uUm1Xcfe/SFxyeTj+BBSTnvZWOWU9gF73D6CCIfpM=
X-Gm-Gg: AYBFou0gPlBgvk8b/30N3KDphVlRDgn6u7A1ycis6GOMFCydCI9yJT4IwFxpuDq5WSP
	4dWhV5A+sKNvozWUgeyaO1bQR1oah3F+tBBDuN4LiMk/nxXmEb8NNYr70DoVzlU3Df97mLzd0L6
	ZpTMUc/tlhv5DSrUQHdLyYoX4j6Pm3bpGUY04Q6jMYhCxmVAiTHJ1VioCUS9DP/5iUr9FAZqho/
	tjaOk0F3MqOC0/Zv74ux7gAg5M45ut26g88ADDL3Y4Qs74JlwLpwzSy/8wuHo8YussCV8OBCSlw
	7Ru3HcATN0JDKDbBtzKsL2dcs+GWdi4kspAziWHfP8M08Ni6TUs21LjDZHsxc0jBOfTqczf7J08
	kfUsGCw8QiQITCxho2pZy95Z0ddVgn+k9PHDcJS3gxwUFRBTec+4SteMEChD8HBi4d0dU1y/xeS
	4aFfH1fbqxh9y1uKT20EnnoBIC17PCMkcAS1kOXiBXR1zBW/4vNw1Bm9c/qtgVgI1NZ37joWQOv
	+7rQY14ulkJMjRz+DaT3G7OuqNVp65Nx7jbWr7AUKVKVlLdthUjrA3egDigtIKAjuuq/l6w0U40
	NMkzmXscZp9QmKEY3RaFYqLaLiwqKFCPlr3xSAJSmZYOFQ==
X-Received: by 2002:a05:620a:2984:b0:93f:2e7e:c818 with SMTP id af79cd13be357-94421799c57mr3047302585a.59.1793825282649;
        Wed, 04 Nov 2026 12:48:02 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 04 Nov 2026 20:47:23 +0000
Subject: [PATCH net-next v4 11/15] net: skbuff: don't run off frag_list in
 skb_segment()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-b4-skbuff-bug-on-followups-v4-11-b7ffeb364f5d@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825269; l=3248;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=6s0PzVt82/I3gWDSKQnU5ZDEZJBYWsfTYigRyKi8yTo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBVz2JFcgnUXu6h2/lcBh0xilKeArmwQIEfFWo4537wo7SLcPc1F7X+FqiGAn38PBEs5QZhYRtT
 GHOVrXmke0Qc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-33051d/1793825284-6D8D54E9-96F4567D/0/0
X-purgate-type: clean
X-purgate-size: 3250
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

skb_segment() keeps going until it has segmented head_skb->len bytes.
It takes the data from head_skb and then from each member of the
frag_list.  If head_skb->len counts data that this walk can't find, the
walk runs out of members while it still owes data and dereferences a
NULL list_skb.  There are two ways to get there:

 - head_skb->len is bigger than what head_skb and its frag_list hold.
 - A member has a frag_list of its own.  head_skb->len counts those
   bytes, but for each member the walk only looks at the linear part and
   frags[].

No path in the tree is known to build a GSO skb like either.  GRO
flushes instead of chaining an skb that already has a frag_list.  IP
reassembly does nest frag_lists, but a reassembled skb isn't GSO.

Check list_skb in the three places where the walk moves on to it, and
fail the segmentation with -EINVAL.  The KUnit cases in the next patch
hit the NULL pointer dereference without this patch, and at least one of
them hits it again with any one of the three checks taken out.

Turning SG off doesn't avoid it.  The walk reads list_skb to decide
whether to clone the next member before it looks at SG.  With the checks
in place the payload is copied by skb_copy_bits(), which checks the
length itself and recurses into a nested frag_list.  So without SG a len
that is too big fails in the copy, and a nested frag_list is segmented.

Found by the Sashiko AI review of the BUG_ON() series.

Link: https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com/
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 7ecf6701f68c..45cd77e153f1 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -5164,7 +5164,16 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 		int hsize;
 		int size;
 
+		/* list_skb runs out early if head_skb->len counts data that
+		 * this walk can't find: bytes that aren't there, or a member's
+		 * own frag_list, which the walk never looks inside.
+		 */
 		if (unlikely(gso_by_frags)) {
+			if (unlikely(!list_skb)) {
+				DEBUG_NET_WARN_ON_ONCE(1);
+				err = -EINVAL;
+				goto err;
+			}
 			len = list_skb->len;
 		} else {
 			len = head_skb->len - offset;
@@ -5174,7 +5183,8 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 
 		hsize = skb_headlen(head_skb) - offset;
 
-		if (hsize <= 0 && i >= nfrags && skb_headlen(list_skb) &&
+		if (hsize <= 0 && i >= nfrags && list_skb &&
+		    skb_headlen(list_skb) &&
 		    (skb_headlen(list_skb) == len || sg)) {
 			if (unlikely(skb_headlen(list_skb) > len)) {
 				DEBUG_NET_WARN_ON_ONCE(1);
@@ -5296,6 +5306,12 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 
 		while (pos < offset + len) {
 			if (i >= nfrags) {
+				if (unlikely(!list_skb)) {
+					DEBUG_NET_WARN_ON_ONCE(1);
+					err = -EINVAL;
+					goto err;
+				}
+
 				if (skb_shinfo(nskb)->nr_frags &&
 				    nskb->pp_recycle != list_skb->pp_recycle) {
 					nskb->data_len = pos - offset - hsize;

-- 
2.55.0


