Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5735FCCF2DE
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 13:51:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454384.1667977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInln-0007o8-6g; Mon, 19 Oct 2026 13:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454384.1667977; Mon, 19 Oct 2026 13:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInln-0007o1-40; Mon, 19 Oct 2026 13:51:19 +0000
Received: by outflank-mailman (input) for mailman id 1454384;
 Mon, 19 Oct 2026 13:51:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xInlm-0007lx-1l
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 13:51:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xInll-00A1LW-Ek
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:51:17 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad62054-bab6-0a2a0a5309dd-0a2a4504c640-6
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:17 +0200
Received: from [209.85.160.182] (helo=mail-qt1-f182.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad62054-b57f-0a2a45040019-d155a0b6a969-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:17 +0200
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-53394bffe0fso36178551cf.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 06:51:17 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.241])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91bccc721a8sm97777206d6.12.2026.10.19.06.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 06:51:14 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792417876; x=1793022676; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5hhezvrkrPsILbBbBLRGuH3wT+463IdJ8u+tbtUXF4=;
        b=JTaaRUObGkbZOT2pl26Or9PtEENCK0/INMTY03Fn/TBOv8zjyRrLSBxVofouwX0T/z
         MItaZtFk9xyT5VPO2eYtpfMGd/3XyEv49/1oeOL2+aS4+cRukHymmgeFJ5WNt4bHtxD1
         uqfBXgTgs5WiXv2kwT+cRAcoO1CBXuydiCf9SAbZDNM8wgEyGaJEEl+pZAYWAL237pxU
         OjY8FzMOO+DIe3+n7Ht+0vLgl7J8HB31JIlK1v2m3pLfyC6c9EL4LuGyGMDjhwGThKGz
         FV395XTsmVBRF9HiJ6DYbvsD5ZTqwP1QOrz4FLbViw0HnPQk6k5BSsLvNBjLAAuQYhIS
         jC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417876; x=1793022676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5hhezvrkrPsILbBbBLRGuH3wT+463IdJ8u+tbtUXF4=;
        b=fL+BmL0eOCs68fZxyrRtSUUHTgtmzNChHQtyVr0tN2s0GTZT8EeOxakrh9pZncUUBr
         y4qoKSwCBfbWGr7g/QwXXHBxu9ZXYeBv5+TSXLa0hdar+58yp/2LvQl6pl4Q6Ss7ffG0
         DmLDqEkkb9vOEreWAAiZX360G9HMW3Mbu+u6So61dNucwJs/EG2oF+7eobkmE3yIAW/t
         mEIIGUwmff1mz24Td6LiN2dY1Nk5hrHSAymbOZtFjMCIhor1xA0yPLmw4t4NaiwkPkbT
         vag+f/UcIyzd8BuUiWAovD/TjSP5FwJeLsGmokMfbE57qbo3v6VYexGQ9UoozLKsuvA8
         eCVA==
X-Forwarded-Encrypted: i=1; AKwUvBwyT1D/owRZAKgNLMeiXWKCD2TU/GETI0fzZQUxRw52K/TPnPppWo3XTdUY7WOPkA6yY90ZmegEHOE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJPlL2V2nLTD4M7ern94GSdJM8DFOFpe2+qPnV90eh/EKoKGnjN
	GAWyG7DDeNXOAVhhQx8IDi333RsFyWVRgtrrV+A34WZEPiggd1C9aBvsoHFDn1rUdNc=
X-Gm-Gg: AYBFou0eQsDBk1peO29jXVAuL+ZKXwyMYO7gI/CMAHP5AtUIN75nKTSVSHllRSeVKDU
	RC3YeILOorG7GpkD+oJL2UOy1iJ3MPaXjkuQExQB1nL5ZRGDQcp5/yFKkE6uH2JmJJJIwh89y8F
	cc6iin9JyW+/u1EixH6LCcErm2NjShAoEBsW+DVDavJ6il17FZBvH11QsU/ZsgkS26OOkWmuuUZ
	JavM6xGjhP5Wo+RWYLwhtDyzVmUvdbCKboU6OfxidD2TcCmQOozmxi5pGujNpLzMM5rSatxqGJN
	+kaqqw09cUpCb0OTZrI3wL3h/h2vt/4/cm7QHoHZzDmCc1L02z93pUitFYaHqneYgr3psiCqDUg
	0/NnJvcur59/0+F12HylBM6jT5TVBIkeNsKK0egWy2d2gbd61XN9DdtPP96n0pSRxpNdsqlXg66
	lseNR0gPpflr8yz6RnqdH0Mw3rQYr1PCxo+C7qQakkx8P4uVuJgRO2J8mpx5cnh6We7r25kJ5C1
	vt/mLWotjelW3I=
X-Received: by 2002:a05:620a:a0c6:10b0:93f:2571:c30a with SMTP id af79cd13be357-93f2571d926mr888761185a.30.1792417875823;
        Mon, 19 Oct 2026 06:51:15 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 19 Oct 2026 13:50:39 +0000
Subject: [PATCH net-next 05/15] net: skbuff: fail pskb_trim_rcsum() when it
 can't checksum the tail
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-skbuff-bug-on-followups-v1-5-41dbef50b9f7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792417848; l=1264;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=+TWKmcN/9YISrCDdUhnWQSTAcvPk81OG628CQR0a1S8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPX/xL5smxia3f6ZS9PJYHyB/T8o2gs9Ov0UWXx8FV1o98bw8LukMOYZJRi8edA9qG013xP3J8r
 M73yrz78D0wI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ebf023/1792417877-516D2B50-6B464BE5/0/0
X-purgate-type: clean
X-purgate-size: 1266

For a CHECKSUM_COMPLETE skb, pskb_trim_rcsum() subtracts the checksum
of the bytes it trims from skb->csum.  It gets that checksum from
skb_checksum(), so if the trimmed range runs into unreadable frags in a
frag_list member, or past the end of the skb, it subtracts 0 and
leaves skb->csum covering bytes that are no longer in the packet.

pskb_trim_rcsum() can already fail, and its callers drop the packet
when it does.  Use skb_checksum_full() and return its error.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 88ed2dd99dc0..de433d452939 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -2829,9 +2829,13 @@ static int pskb_trim_rcsum_complete(struct sk_buff *skb, unsigned int len)
 	int delta = skb->len - len;
 
 	if (skb_frags_readable(skb)) {
-		skb->csum = csum_block_sub(skb->csum,
-					   skb_checksum(skb, len, delta, 0),
-					   len);
+		__wsum csum = 0;
+		int err;
+
+		err = skb_checksum_full(skb, len, delta, &csum);
+		if (err)
+			return err;
+		skb->csum = csum_block_sub(skb->csum, csum, len);
 		return 0;
 	}
 

-- 
2.55.0


