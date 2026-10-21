Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBBF60A2629
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=SwLZpr5v
Received: from list by lists.xenproject.org with outflank-mailman.1457178.1670082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWf1-0003bq-4q; Wed, 21 Oct 2026 13:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457178.1670082; Wed, 21 Oct 2026 13:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWf1-0003bf-0N; Wed, 21 Oct 2026 13:47:19 +0000
Received: by outflank-mailman (input) for mailman id 1457178;
 Wed, 21 Oct 2026 13:47:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xJWez-0003Xq-09
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:47:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJWey-00AIG5-D9
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:47:16 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c261-8faa-0a2a0a5109dd-0a2a45099ac4-8
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:16 +0200
Received: from [209.85.160.176] (helo=mail-qt1-f176.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c263-be1a-0a2a45090019-d155a0b0e526-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:15 +0200
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-536605c4d8fso4891991cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 06:47:15 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.248])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c10baeadcsm25487476d6.19.2026.10.21.06.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 06:47:13 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792590434; x=1793195234; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2aRCuku2oKEDF0Op1/pBMZnZUn6snlu290Nklz94qvM=;
        b=SwLZpr5vVunA8nTkM8vi7dsk7YhQdaMlviWrKfGeEcJexI/vGEtLkKu5f9pgYoJSfz
         HiBo/8x+Gh7NPnfoaaAgGtvcmoCOJvp+AmheI56SD1JLI0vakV7ozXhkbp6xOSkr9jyi
         05MvWh/eS69OYlBjcU1meUWX6leP1fH0V+q36awN4fYxBTU07NsCYHpQo318Ft+ltGX1
         4sxyFIBKaMHNnrH6DuoN4XM2euzkPwuXQWMHVeiAAR0X2CT4T4W0Uiwq3un2309x+/PS
         SPX6jxZLIgre4E8cJWgVi/UPI5ZN0CRpFg8hyvD8yYtTbx4GaKJs7ESsz7KnV41tR/VK
         ELDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590434; x=1793195234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2aRCuku2oKEDF0Op1/pBMZnZUn6snlu290Nklz94qvM=;
        b=mcz4rWzgRFVbnx+roo81V4+Qk3fB5KMHX9wG+dBTnFg/RrpLYrJlmX988aoEBZRsRj
         8SC4gW2qtzE6bCPGZrSxplvSWKdhB2n1PrmXebXAJJQ45jdCgrRVAW0b/r7D0mmcSzaI
         vc7+4Fwz8fDNH1bePIjDHujrqhJjIVyoS3LYza4ZJD2+d1JLnfSEI7Q8BmbXnLjlgskO
         LMTlwMTy19ZrLdVqeFLYANojy7IozsEBkd+bcbIWButu8yO5wlf3Svv3pCLfYAlh4wvA
         hZxzAPm+7bLV1RFTV8uvTVW0yYbv/NKMiWXXZ+3HjBcTBVivQKTDnrCPpPrnHf6g+/Li
         if2A==
X-Forwarded-Encrypted: i=1; AKwUvBzDJi8MxU5I4lAruD8H6gLYdoXOJiLV3otrP2ES97+omxfzzzvgNVPEIkbyQCmQo+iQwnxlJglSVno=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL8IqpFXFMpChwxrUYehG1updRkmTgiMP2JCz51p/h/6uRnxrw3
	cPp5GCBpReJMASFCVI+MlVZYkYDth0H9Ci6dlTznEgfeYgwkZtiHZddWkLftaZj4F8Q=
X-Gm-Gg: AYBFou2kZId1BxG9JSeskFJVtX3uOIm4WPPSsyrPbsb/ivUJBAcTmsGubZnJEesM5UX
	ssP7EGmI/xbcG2bZugthqgNyS9A7g5+bmcrR6ykHO8wYbHMwhrD/HapCW/XOEcGLJnyKMecvIOT
	JJHWda7GdJ05DA7ytbKAMGh/QnEVGjIDccAnzoYXjtXi4Bhiuo7F6Du+2gjXhQvwBcL2YqXz+YO
	JPiSJAGu1UB72JxC86HwmC9X2oNPpaRhGBNzZiu8xVxBvV3Jz1Qkxb3BO5GXV6aD08XfGYU9QLQ
	Yh0U0d2zYDceeqanx4qjvOtGwjf45nB3CUqhLsO4YN3m8SJVPQ2+AUKSomCAAzyhLpp8yWd0//B
	Mfr9BCMsmZ0og0Y6vvzbLM6wdG2VBo7ymyq2pD4TkOvzLieh58B686WtOvF3aAvcfJpAllJy2he
	KMUyUB/Drruc1/rzEAeMbQ9Wq4Ft0Pu8DblIAIS+qG7ZW8kWYb9nGKQAzMtNkf6eMO8u6w6dO7M
	qkN/UJDI8uNDQ4OKxFZ1S/NkjLUl5l9KTvltA4TKR63YlF6WR5WLgjfuEy9IGZz/6IJOPCv
X-Received: by 2002:a05:622a:400c:b0:535:baa:a78d with SMTP id d75a77b69052e-5369b4f46c6mr30150331cf.10.1792590434551;
        Wed, 21 Oct 2026 06:47:14 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 13:46:48 +0000
Subject: [PATCH net-next v2 04/15] net: skbuff: fail segmentation when a
 segment can't be checksummed
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-skbuff-bug-on-followups-v2-4-2aa780a03524@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792590422; l=1895;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=wii8wzXlG4ePvSd6K5rd8H498XoB8iUyEaQEAS7r5bk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFXNkJVl00uSWJUSJGE5ur3ZFVCzw0/41zwWUKiPaUfI51HMPUlDfMqmqTrCEh6QYjM2gM13Our
 wstomOnSWpgM=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-bad1c0/1792590436-3AAD8034-F8A7646E/0/0
X-purgate-type: clean
X-purgate-size: 1897
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the device can't checksum the protocol, skb_segment() computes
each segment's checksum in software with skb_checksum().  With SG on,
the segments share the original frags, and a devmem TCP skb keeps its
whole payload in unreadable frags.  The devmem MSG_ZEROCOPY path never
sets SKBFL_SHARED_FRAG, so the __skb_linearize() fallback is skipped
too.  skb_checksum() then warns and returns 0, and tcp_gso_segment()
writes a TCP checksum that doesn't cover the payload that goes out.

That's reachable with tx-checksumming off and SG on: sk_setup_caps()
still gives TCP SG and HW_CSUM, so the dmabuf send is accepted, and
harmonize_features() strips the checksum features but keeps SG.

Use skb_checksum_full() and fail the segmentation with -EFAULT when it
can't checksum a segment, as skb_segment() already does when it can't
copy one.

Found by the Sashiko AI review of an earlier fix for the same path with
SG off.

Link: https://lore.kernel.org/all/20261009-b4-skb-segment-nosg-unreadable-v1-1-7e2334a55fe8@toxicpanda.com/
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 40d2dd20d47d..88ed2dd99dc0 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -5239,9 +5239,13 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 
 			if (!nskb->remcsum_offload)
 				nskb->ip_summed = CHECKSUM_NONE;
-			SKB_GSO_CB(nskb)->csum =
-				skb_checksum(nskb, doffset,
-					     nskb->len - doffset, 0);
+			SKB_GSO_CB(nskb)->csum = 0;
+			if (skb_checksum_full(nskb, doffset,
+					      nskb->len - doffset,
+					      &SKB_GSO_CB(nskb)->csum)) {
+				err = -EFAULT;
+				goto err;
+			}
 			SKB_GSO_CB(nskb)->csum_start =
 				skb_headroom(nskb) + doffset;
 		}

-- 
2.55.0


