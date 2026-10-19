Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30DFCCF2DE
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 13:51:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454405.1668031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInm5-0001Xl-48; Mon, 19 Oct 2026 13:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454405.1668031; Mon, 19 Oct 2026 13:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInm4-0001XH-Vv; Mon, 19 Oct 2026 13:51:36 +0000
Received: by outflank-mailman (input) for mailman id 1454405;
 Mon, 19 Oct 2026 13:51:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xInm3-0001UC-Pe
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 13:51:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xInm3-00BvLk-62
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:51:35 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad6204f-e002-0a2a0a5209dd-0a2a4508eb24-44
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:35 +0200
Received: from [209.85.222.172] (helo=mail-qk1-f172.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad62065-f659-0a2a45080019-d155deacec3b-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:34 +0200
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-93f30660e69so119154585a.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 06:51:34 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f1a19ce5asm982035485a.32.2026.10.19.06.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 06:51:32 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792417893; x=1793022693; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nH4MPLjNHd0ezQ30G0wFNIQg5eWAqIll/99R00Ry+f8=;
        b=HJycgKfVpopbg+81JhnS99qSjXtN/UGTeqRRH6F218Bor7xkxPEVJMAiLSDKMIGSP0
         SkpU0v/2nOtHzo9tcBrJTicOg+bhjHDFcmaoyfQaV3FarKnvbAQkVjq+84sIkI07wMew
         feEXDLS5fJky7a4Eegy25XMMLUXb+jGu9Ks5skcl5tQgpnQgsm3rwm+GwaVwAyuNxCWN
         7REm36IRThC3GA11QR8Vu/dmII/3s8FwL1OLVr5qeFF/mSI2swOE2c6DyKY+jwi6aI8N
         4SlccIc1+BBqprmthvM8EmhWGdFINgDpVv/zNniKBXXxjHZgTxTKb71yVpJFBCHZZFqj
         rxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417893; x=1793022693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nH4MPLjNHd0ezQ30G0wFNIQg5eWAqIll/99R00Ry+f8=;
        b=W4TPIfmI8P9ISQ+aaktvuYY3FDvoqN3dE3WZSOAURi3Kya3o+0O6t5GAa1d6QFEnVa
         W2YsUkVCGxWGwWUd3urCx7OmrbSuXU8BM9rRg3Mn4wycDX2AV7puCPUKUtsvAJp3Nsly
         WgaNOg39mNlrtNApRJCCTTc396caVezMUhGX8/PbkjjLNS1F6givwhJQ+CCo0k4jTXY9
         TZUoWx3CJ2sBcfjNpFJ8fD/D8yvfQeoocTSsREIWVyrgoN+HI1+XA01rnizCvl6zP37L
         iQCBHSFxxF30p3u6BEDX1ZkdmQHUYZ1scOcpzxKHLCQmFiTg2ha+cmLNdb0s6JUiiknh
         qI8w==
X-Forwarded-Encrypted: i=1; AKwUvBwSDHA/2zLWn39w2cnUH9f+c66ktYw8Z6vgjpR9fNeZfR5V5M4HAuqcSYarnggldVVZBoDcWJ7B1XY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIMacVqxJi4r9vsqYJ/Ct/9MO3hDGORSw+6lwFupYxEVEQZhvIP
	Sy9ems5MpYvao9rn5fyFs1sDawnob2aAZIaJFE763iWpJOxOmgvLjV3iLPR145GYOio=
X-Gm-Gg: AYBFou24+F1U311dQoS8GQk5s1qKMfL7MiD9Lzk6pitX4/rTV1RautOVHCnD716eYTW
	f368782dl51rZHlwZJ4tHRS4gZH3Vwr0qTCH4Giz389ciIcaAdrnpRiWiFEgeUyrQpCCGDYvdMy
	GBWgcWz0OAs8tqt0HNk+7gjFQLyMnqwP4ztcjTE1D4oKPoQJjmXIrYyvuRQFu6+TtSIP/Z4TNJn
	IlOTR4Pfv0RKfqZLmPHpxpypszTkqYvZBg/Y1G9iJMzWxxZzvbk/w5L2XjU3PS+a+U8PoLqcbrH
	CTKWxcPSNb3AkbgP0vEUG/vcWuEcm8B2IBavc7pYz4q8wy5ivyGRWOpZLRhisyWCfqDF6Fb2t3V
	d9f+fxM7IzcslcXqWsML4PU2QGFW45QPM13YCo6/AEXZk7ESNJpiKbCWHqrajQ/Q/exIUxM06i3
	b0Qz8RA6vrZrSLPpjfG/vOYXsbFrolufTnpA2jV/ziuEYdf+lp1VWpMYZ4YU/K+JIz4U8t/2nhL
	f+GpRA/8zKq3hE=
X-Received: by 2002:a05:620a:4109:b0:93f:35fc:5266 with SMTP id af79cd13be357-93f35fc586emr874742485a.44.1792417893366;
        Mon, 19 Oct 2026 06:51:33 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 19 Oct 2026 13:50:45 +0000
Subject: [PATCH net-next 11/15] net: skbuff: refuse to segment a nested
 frag_list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-skbuff-bug-on-followups-v1-11-41dbef50b9f7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792417849; l=2113;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=6Z8CiNviIyVdg98sCBaRoAUJsHn+RV3Sx5RlE56aqBo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPevlwc09v/MSkDiCKh5chGO+Z/rqVC5uo+IAjB+VXJ5WH8Ns5cSB+345mYyBpXOXcO+Ul5ANjw
 NRhLiDZ+GoA4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c1860d/1792417894-CC77387B-E55E12C1/0/0
X-purgate-type: clean
X-purgate-size: 2115

skb_segment() walks head_skb's frag_list, but for each member it only
looks at the linear part and frags[], never at the member's own
frag_list.  head_skb->len still counts those bytes, so with a nested
frag_list the walk runs out of members while it still owes data, sets
list_skb to NULL, and dereferences it on the next pass, before any of
the layout checks get a chance to catch it.

Nothing in the tree is known to build such an skb; GRO flushes instead
of chaining an skb that already has a frag_list.  Check for it up front
and fail the segmentation with -EINVAL, with a DEBUG_NET_WARN_ON_ONCE()
for debug kernels, like the other frag_list layout checks.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 56cec58bccb7..b6ada54ecc57 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4962,6 +4962,17 @@ struct sk_buff *skb_segment_list(struct sk_buff *skb,
 }
 EXPORT_SYMBOL_GPL(skb_segment_list);
 
+/* skb_segment() only walks one level of frag_list. */
+static bool skb_segment_nested_frag_list(const struct sk_buff *head_skb)
+{
+	const struct sk_buff *iter;
+
+	skb_walk_frags(head_skb, iter)
+		if (skb_has_frag_list(iter))
+			return true;
+	return false;
+}
+
 /**
  *	skb_segment - Perform protocol segmentation on skb.
  *	@head_skb: buffer to segment
@@ -5023,6 +5034,16 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 	sg = !!(features & NETIF_F_SG);
 	csum = !!can_checksum_protocol(features, proto);
 
+	/* The walk below never looks inside a member's own frag_list, but
+	 * head_skb->len counts those bytes, so it would run out of members
+	 * and dereference a NULL list_skb.
+	 */
+	if (unlikely(list_skb && skb_segment_nested_frag_list(head_skb))) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		err = -EINVAL;
+		goto err;
+	}
+
 	if (sg && csum && !gso_by_frags)  {
 		if (!max_segs && !(features & NETIF_F_GSO_PARTIAL)) {
 			struct sk_buff *iter;

-- 
2.55.0


