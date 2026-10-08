Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31469CA6016
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 21:03:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443801.1660920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvGt-0004Ih-8B; Thu, 08 Oct 2026 21:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443801.1660920; Thu, 08 Oct 2026 21:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvGt-0004Ia-3o; Thu, 08 Oct 2026 21:03:23 +0000
Received: by outflank-mailman (input) for mailman id 1443801;
 Thu, 08 Oct 2026 21:03:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEvGr-00045y-QH
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 21:03:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEvGr-00Dgxi-6y
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 23:03:21 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac804fb-2eae-0a2a0a5409dd-0a2a4503b842-18
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:21 +0200
Received: from [209.85.219.51] (helo=mail-qv1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac80518-fae8-0a2a45030019-d155db33d58a-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:21 +0200
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-9179bfa9e9cso53323316d6.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 14:03:20 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91b55120027sm41246d6.49.2026.10.08.14.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 14:03:18 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791493400; x=1792098200; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJq2iGR6XjS9tOGb5y7ebTTlkIKkVZtFa6s12jsD6jo=;
        b=qvsxqAv57v5kfrgAKA3TZjFIpFmKIbgZJihqj6tJT0/s47X51sunW4YevY7UZG0FBQ
         TCae7EekfX+vG92EguXqYgAhrbdMlVLz+Kb7iKZGp+8bKzxXXziVgPDQpctLq/AyKF8m
         j+2tVdQPqXTConGpec93+TgCZloyUwkVfWgpp7/aSnAp5U93A7jf4n63LNH8013Jz1Wt
         kRZjbtL7Bw2w81oqweveNmjAb1a9M6IBcwPNhTgLZkZaXQz/qwQRbhv5ewdgRZH6vvnK
         OrN4lHl1yyDEyp0+uI4AzBLuEvSib9laeAq/hMhjrtSgll/5VAQ4d5jlwaJuD5exVllx
         8YDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493400; x=1792098200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cJq2iGR6XjS9tOGb5y7ebTTlkIKkVZtFa6s12jsD6jo=;
        b=fNn+8rWp073SjyYGUOLAc2aqUC6XPesjKiVn/FM7slea4jFWydqVzTUoLEv5ALAnYT
         PDIrHYbKHnKQl1CrqpAThN/C9w5KrZ/PMB1AGHrYfVzjHFMRhnO5zVquUo8fCYijfRPy
         9c1EmL7Bk0u9B3d//z/N8FymGP8Pj/5qJJ3u58k2qd3HLmxufhgbeum7yg9JHF7NZDBb
         1XlGzBEasSw41y9LdzakqcY47i5c5Ek6p0GQnwhtYZssyE+5+CbYGoYCVIh2iLQkPbkO
         GmDnuCDMI8nVKZNdffxWe8vAzJUOlz0nH+HscvEveNpH+f257FzBe8lWe/0uHBOZ96X0
         WnsA==
X-Forwarded-Encrypted: i=1; AKwUvBwpMWMlEOoRGbw5Acch3RpqppHeBrGCeFW61PrvIAYys1JulH1Yrxd4/1+hH2k4L4bMzqZyXeuaXy4=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKHVpQXCbbdPYwrHtj7jQapqCda3dt3lKD4rmm/RF1qAge2hkl5
	CtDWavLUCBTlU4cdKp4SuiZyGdP4c02SBS/RN7kRUFhWkF3VP4envdwhwP9vWGORbL0=
X-Gm-Gg: AYBFou3TG5+6xGMNS4bkHwwoVm7rJHwYwkR4AkukcW5SYxe1Sj7ruFeBHe7HcnKE19T
	Ymx0vsrvwHCTH0Xf2NszNAPJVrl1g3KNl6BsZVKBkrESaM1fjt1G3SbTHf6P4oj/HM7Ixj33Lew
	Pi+w3+KXABov0qZVW1miqdiQvcTyiiMVnNINmrAqZFD+T3l+tiAm1SMW2Ilwv69yVFSR0rhZ8MF
	B1F1je8dCtWc2OUeQaiAudo/myhiJ1FF6KY8Y+8zTfr5mL1JadA0PNYdmjBaHvJcAC1ZQ9ReJBc
	0RaxU+7hBCeqVmztfHnp45SC9sXQ8NFw1StTTT8eJM2i53be1YJ9WiPUMOzu67KMoZo5asK7AGh
	gBiBQSW+oqtBqVhdp0ScT88a5/RwjbNCcEGO2Q3n3X4dhnKLyaOf2/6shnDAiTG0bQ31O+HUbcN
	Zp/cbaNElmBspf7mX3JovV7Rhq0Q/Gs2AKJ9mJvLHwNA+VQLAatO7ezWwSjbc//Rir8jeX5VVAV
	I9RiOTOh5Vte/8=
X-Received: by 2002:a05:6214:8506:10b0:91b:51ea:8f3e with SMTP id 6a1803df08f44-91b51ea9005mr10470996d6.49.1791493399667;
        Thu, 08 Oct 2026 14:03:19 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 08 Oct 2026 21:02:48 +0000
Subject: [PATCH net-next v2 01/10] net: skbuff: add skb_drop_empty_frags()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-b4-pskb-pull-tail-drivers-v2-1-8f2bd9bee138@toxicpanda.com>
References: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
In-Reply-To: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>, 
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>, 
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 xen-devel@lists.xenproject.org, intel-wired-lan@lists.osuosl.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791493384; l=3047;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=eNF9AfY31ifKJcp/wEnDWb5NxkFPFrVkSamyLYsUttM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOI8lG/wdh6wd8yc4i7FHBwvmuyCaLtAuFDjmIGDKRvpDQpmhSkJsjkYyP5E/1+czZMvAKz61ka
 mmydLfI/gLQo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-33051d/1791493401-6EACC4E9-BD386250/0/0
X-purgate-type: clean
X-purgate-size: 3049

__pskb_pull_tail() releases every zero-length page frag as it walks the
frags array, even when it's asked to pull nothing.  Some drivers depend
on that.  xen-netfront calls it with a zero count on purpose to make
room when a backend fills the frags with empty slots, see commit
d81c5054a5d1 ("xen/netfront: tolerate frags with no data").  netxen and
qlcnic get the same effect when the frags they pull to fit a TX
descriptor happen to be empty.

pskb_may_pull() returns before getting there when the head already
holds the requested length, so these drivers can't simply switch to
it.  Add skb_drop_empty_frags() to do just that part, unsharing the skb
first if it's cloned like __pskb_pull_tail() does.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/skbuff.h |  1 +
 net/core/skbuff.c      | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 27ec1e38c828..c1295f6baf6d 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -2840,6 +2840,7 @@ static inline void *skb_pull_inline(struct sk_buff *skb, unsigned int len)
 void *skb_pull_data(struct sk_buff *skb, size_t len);
 
 void *__pskb_pull_tail(struct sk_buff *skb, int delta);
+int skb_drop_empty_frags(struct sk_buff *skb, gfp_t gfp);
 
 static __always_inline enum skb_drop_reason
 pskb_may_pull_reason(struct sk_buff *skb, unsigned int len)
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 43ebe61c7fc4..f798118df112 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3004,6 +3004,46 @@ void *__pskb_pull_tail(struct sk_buff *skb, int delta)
 }
 EXPORT_SYMBOL(__pskb_pull_tail);
 
+/**
+ *	skb_drop_empty_frags - release the zero-length page frags of an skb
+ *	@skb: buffer to clean up
+ *	@gfp: allocation priority, used if @skb has to be unshared
+ *
+ *	Releases every page frag of @skb that holds no data and closes up
+ *	the frags array, so the remaining frags keep their order.  The
+ *	frag_list is left alone.  A cloned @skb is unshared first, since
+ *	the frags array is shared between clones.
+ *
+ *	Returns 0 on success, or -ENOMEM if @skb had to be unshared and
+ *	that failed, in which case @skb is unchanged.
+ */
+int skb_drop_empty_frags(struct sk_buff *skb, gfp_t gfp)
+{
+	struct skb_shared_info *shinfo = skb_shinfo(skb);
+	int i, k;
+
+	for (i = 0; i < shinfo->nr_frags; i++)
+		if (!skb_frag_size(&shinfo->frags[i]))
+			break;
+	if (i == shinfo->nr_frags)
+		return 0;
+
+	if (skb_unclone(skb, gfp))
+		return -ENOMEM;
+
+	shinfo = skb_shinfo(skb);
+	for (i = 0, k = 0; i < shinfo->nr_frags; i++) {
+		if (!skb_frag_size(&shinfo->frags[i])) {
+			skb_frag_unref(skb, i);
+			continue;
+		}
+		shinfo->frags[k++] = shinfo->frags[i];
+	}
+	shinfo->nr_frags = k;
+	return 0;
+}
+EXPORT_SYMBOL(skb_drop_empty_frags);
+
 /**
  *	skb_copy_bits - copy bits from skb to kernel buffer
  *	@skb: source skb

-- 
2.55.0


