Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85B7606A33E
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=cQ1AD9RF
Received: from list by lists.xenproject.org with outflank-mailman.1468933.1677953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gf-0007aP-16; Tue, 03 Nov 2026 02:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468933.1677953; Tue, 03 Nov 2026 02:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Ge-0007aC-S3; Tue, 03 Nov 2026 02:28:56 +0000
Received: by outflank-mailman (input) for mailman id 1468933;
 Tue, 03 Nov 2026 02:28:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xO4Gd-0007Y3-TI
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:28:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4Gd-009OZN-9x
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:28:55 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946be-bab6-0a2a0a5309dd-0a2a4505c0c4-30
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:28:55 +0100
Received: from [209.85.160.174] (helo=mail-qt1-f174.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946e6-4cb1-0a2a45050019-d155a0aed967-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:28:55 +0100
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-533778ab0bdso53014981cf.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:28:54 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.245])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5498cb5b520sm13795611cf.26.2026.11.02.18.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 18:28:53 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793672934; x=1794277734; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLIaIMsqYL3SSjD9c7Tzup1bl56m63w7tPTiVpME7Yg=;
        b=cQ1AD9RFI5MMhd69Vs4KeN8xN0dL78XDJUlLftISHy07IYPFD9PTwwKycNYg6IDg4S
         Jpt9mwSKwo2Guv+iWkccLKQOjvAumsveKeohYXn6sssBbLtIuCMA3Asg3tR+akw2QbPV
         AmA6smt0XrV+g48fmRJxkxi/f0Z2reEsuRwAz/h2sFw9vjuneeN+inpW54Ntyq1YRECY
         qh+OXdUvYyLzYWp/rvAvmlpVuT0Hi4cuCO1ikO3bY8wzlY5AM9q88h8OITPRK1eZJnj1
         LDKs5uxQHNWyEJwr0WjAfyd6NPjZRAq+0TzhIBgB8t9wOiFmDZPlMQLTmjETK61AeNK0
         6Sbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672934; x=1794277734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLIaIMsqYL3SSjD9c7Tzup1bl56m63w7tPTiVpME7Yg=;
        b=sfzRnjJhcw5huvGQ+aWmmN1gFChQ+bzoevC/PepRHI7zVinSNFvQdRTvR1GrW7EyMZ
         fvQmi5AVmcFVTR6i5GxUkZFLFFa1lnwvOLgsSIdXbCZ60Fo0QTkHvN/DlS9y14OtogSN
         vJ3JfVlmCvLz6nBnHB8DRmOSFLDH5Tcn2bRmaCF165/SK4+VZroZan5gKQzHnJOVpJDi
         bGTuRd1z3eZ5l7jAPxp3A4vz4OjMW222c73V9EG+HbY9VjvNH7Se7AuXGYkmjw37fQjT
         czrhPaQDC9ilTUsvpsYgGcyZl8poIX5GjjwYCTwdCmCqVSs85paj1XfHmJJUMSYfIigK
         UL0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxXOdp+V1C9PsIRLyZJUL6l/Macxn07lRxhVpbL3DBJpDgL/G/ZtLQKQMBEJT2dWRuNE1THZBdMzbc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJzzFGRSyIM1Yk0dAQEUX6vnF23gx9xhscmKPNTWDIsFna6FDYF
	2hMuhd3zTmNYt3Wpz2LPhW34swpSZnfOj7LZ8eH0NR8KYrfwf4NhTjxpAvLjJICdSgU=
X-Gm-Gg: AYBFou3/iuHSAz7dkNZpxAvXMF6taEsSkJkhdRqnwR/GfV8RFx7FR1eYjcVs5NAYGLf
	elFHkhXqqqMyaVzCSba/ekk7OBF40s+zIr+1skSnd0PkMJmnQVHMNdQ0tIf3trxxV6tyvU6f1rI
	JnMZuJk8uUmthdDeCJWkEP0I9LVxIeeTAAHZXf0QblDJ7SiRdr+VebXdY7Y8Xa2shdmHKSg3Mrr
	PltwXs77g1zaY60zRy3i2ti+fHgV3M3olU1zKhMexXfZ4f9It5fnVZnatcKwENvBiiqc3wExKjB
	EhhomRJ2Kyjten73CUY7Q405KpCKF/qBdZ5dU+NmtHmdtz3pboYY7kjSBCmLa6QDDiqhMijHp8r
	Zhauf3JdRYjecZpm3E92v1i+Jg4L6yPdZG1pQWKFC2JWqnh8xhAFFPZATMIW/V4bxaor5Q+B6p2
	nBMx4eplBdLozCw3jDXefFe9iXO/W/3v8WBcGDKRa+ScjQPix3szfkojn9oQr6ndW4tj4VpHebW
	ulPrNtRM3mnZ6ik99dFoyOL3YeYGKWBgcV9AUKwJ4mDD6r7kdjhQTeuv9RHKaDPZeeXBFHNz9m3
	zFxf4yd8uhiBdwCmqQN4dOU8rTNbswCVAeG4LyNuvzypYQ==
X-Received: by 2002:a05:622a:a889:b0:537:83e9:b88a with SMTP id d75a77b69052e-542b64964b4mr199343741cf.23.1793672933851;
        Mon, 02 Nov 2026 18:28:53 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 02:28:30 +0000
Subject: [PATCH net-next v3 04/15] net: skbuff: fail segmentation when a
 segment can't be checksummed
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-skbuff-bug-on-followups-v3-4-54ad0ab57614@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793672922; l=1748;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=TlO/AKeZArxeBmRh7l805X0/4fVE3bHDKuOYPc0A/+Y=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDNO9/a3hdew67VlcDguwy5iB/P7gwRmhlzB8AVvniMlDrIfyz9W9B22je1YjbgzdeslLLgxJZL
 0BnXxMWLQxws=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c201ff/1793672935-F6CB02A1-DEA0FD69/0/0
X-purgate-type: clean
X-purgate-size: 1750
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the device can't checksum the protocol, skb_segment() checksums
each segment with skb_checksum().  If the segment has unreadable frags,
or its lengths don't add up, skb_checksum() returns 0 and the segment
goes out with a checksum that doesn't cover its payload.

Devmem TCP doesn't get that far today.  Its skbs take SKBFL_SHARED_FRAG
from the zerocopy uarg, so skb_segment() tries to linearize the segment
first, and that fails with -ENOMEM for unreadable frags.  No other path
is known to bring an unreadable segment here either.

Use skb_checksum_full() and fail the segmentation with -EFAULT, so that
the checksum doesn't depend on that flag.

Found by the Sashiko AI review of an earlier fix for the same path with
SG off.

Link: https://lore.kernel.org/all/20261009-b4-skb-segment-nosg-unreadable-v1-1-7e2334a55fe8@toxicpanda.com/
Reviewed-by: Fernando Fernandez Mancera <fmancera@suse.de>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 0d3f0f09c7d1..5f997edf3519 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -5292,9 +5292,13 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 
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


