Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4155ACCF2E3
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 13:51:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454398.1668013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInlz-0000o3-DG; Mon, 19 Oct 2026 13:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454398.1668013; Mon, 19 Oct 2026 13:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInlz-0000np-8m; Mon, 19 Oct 2026 13:51:31 +0000
Received: by outflank-mailman (input) for mailman id 1454398;
 Mon, 19 Oct 2026 13:51:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xInly-0000lk-D8
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 13:51:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xInlx-00Eeji-Q4
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:51:29 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad6205c-2eae-0a2a0a5409dd-0a2a45019992-6
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:29 +0200
Received: from [209.85.222.179] (helo=mail-qk1-f179.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad62060-5984-0a2a45010019-d155deb3f1d9-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:29 +0200
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-93f079a63b8so201007185a.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 06:51:28 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f3cb855a0sm338770685a.4.2026.10.19.06.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 06:51:26 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792417888; x=1793022688; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i59cwFpnwV4ZWelO27hAghlfIgiy6O8zXnZ0ftvy/nk=;
        b=ZNzA/lhi3PNJOevdLe0ROC/XpYzghL8wZKBpiXXKkEin3qfvL/AAVf/KcTqs2U60ra
         0j+SwOLvafgojm1ZMIH0fik6Fvmu6LtUPUTW+nNPLgZnskLo3d95LvFfMXwJTpuaedeP
         CHzkL7TyMHcdz20uEfFXz+chO6QkNwCpswe/POHWLUQ7uyN7sJNwsNyo0tLQfHlNh02s
         G+GgH8tS0LwaBXfcOSyQkeWkYmovxAt22NYGdW9/plUB7VDk49aRN4cmDCsRhT4JFHAl
         pqnKXpBxO0gPoySIpOgOA8IE7la1RA9yLCMtPn4SEBjr6AR8CJs6b5r8sCkChF9DKm4L
         eeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417888; x=1793022688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i59cwFpnwV4ZWelO27hAghlfIgiy6O8zXnZ0ftvy/nk=;
        b=U/CpioDGYttjIK1Aun/GdJCfS/5L1JRK3/A4AJQ/uvLl4QAjUvXSGEW17+hOm+cPIh
         6uLRTuwp7cN1aK8Hu8SQsb6v+KFJSNoQVKnUcBdPulY/jKpWz6JDdupK7fTpiehBbV/9
         JYXxpE7QQ5ax3bXkwRy2IrdTqITpdJSjPEWiI7ppU1JlMpUpjkvTYPLVmoq++4V94imA
         F9Sd8s16PobNRFhrrw9WrutXactXJgv+sIdYmD+eMP7nene79LsjNaQOycXwGMjWHrju
         dfI4yElI6EvL0O3KQNDS8mVhiSCGorRS1TjbCGms1h3EAdQecRFAiuQ8NHwokalYqrBr
         3DWA==
X-Forwarded-Encrypted: i=1; AKwUvBwAihHDI2PAtQdEmmWauNkeV8ZIjW4TfXyiA26J9ntDFfhXs86pqn0y52lYQvdXZPpn4Zm/G7X4C/k=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIwzJ52ddP9uVt8rula/jpa+sh36DqETvtibDAbVf8j1nOGwN+5
	UgOV52rZfeK1DRcdeA0uLqlgNzuyV7JvhPByiDUiNBsV+ExzZp5V75Mz9tV49odWb+Kh09akyv2
	NFkbO
X-Gm-Gg: AYBFou2Rg+/3NVGyhW7eTA6i+9PVisbDHMKtqLS9BL+2ugF6EJN7kVj+QBIjU3pGSYn
	PlWg3ebETeEB7X6zacMBU8Ljm0PnEV9E1cHv6IO1GreX1znWMmt/StPvFD7SPnW1dj6lMHXu6ly
	KFW9/7a883JUIeZi3fo6/EoEkf8Qlz2GHAoffjvVT2l9MyxuNSENNwrQoNT5hwD6aGZj/DwQTGm
	DRe+BGaH0e3ii4pBhPSOOlnAkTi/RmaWWwKmm0qMvLW7boWIXZipEPKf+eD0nq1gLEqU1QKH9Bq
	fXsQ2yhWjpttwzB8FVqqFt3x8Kf5LHmIP8hwpQ0pwcxMDKg1K4WQAkAtP6+LSSWS+QX9YDIUXzi
	3OVR61a5XFjEUrUv/AHsP5Q6pTogh8TRxwqJkfnaK7F+4+ZqPcDK20JbLnULLvr/6GVekFhnkkx
	IfHXgYGWJyjN7bgjE37M1inXbjdAMP5Z7vrNN7LstF5oHW6k7mdbXFvfG0y/UpkahgUAx1VHyeB
	FBB4ml8c88o2dE=
X-Received: by 2002:a05:620a:7309:10b0:93f:322b:2209 with SMTP id af79cd13be357-93f322b2321mr606237085a.28.1792417887551;
        Mon, 19 Oct 2026 06:51:27 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 19 Oct 2026 13:50:43 +0000
Subject: [PATCH net-next 09/15] net: skbuff: check csum_start against len
 in skb_copy_and_csum_dev()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-skbuff-bug-on-followups-v1-9-41dbef50b9f7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792417849; l=1647;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=sxMOxEm7hnqJ4JHjLlLYqgrWX5cOQpVgaNwl3bOsGCc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLHbIa3sdMEeDl3ey/+03pKmEjvdf6OVqCc90eTylLEjn32s0tlhlr2FYQHUU3Yl4h7USrA20K9
 UzEGPZt5vtgo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d62444/1792417889-1F66C757-BEAEB250/0/0
X-purgate-type: clean
X-purgate-size: 1649

Commit 56453199d28f ("net: skbuff: don't BUG() on a bad csum_start in
skb_copy_and_csum_dev()") checks the checksum start against both ends
of the linear area before copying up to it.  For an skb that isn't
CHECKSUM_PARTIAL, though, the checksum start is skb_headlen() itself,
so the check compares it to itself and can't fail.  If data_len is
bigger than len, skb_headlen() underflows to about 4GB, and that
becomes the length skb_copy_from_linear_data() copies into the
driver's bounce buffer.

The old BUG_ON() had the same blind spot.  Also check the checksum
start against skb->len, so such an skb takes the existing fallback,
which copies at most skb->len bytes without filling in the checksum.

Found by LLM review after the series that made the change was applied.

Fixes: 56453199d28f ("net: skbuff: don't BUG() on a bad csum_start in skb_copy_and_csum_dev()")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 5c89c463f234..782a6bacd568 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4103,7 +4103,11 @@ void skb_copy_and_csum_dev(const struct sk_buff *skb, u8 *to)
 	else
 		csstart = skb_headlen(skb);
 
+	/* skb_headlen() underflows if data_len is bigger than len, so check
+	 * csstart against len as well.
+	 */
 	if (unlikely(csstart < 0 || csstart > skb_headlen(skb) ||
+		     csstart > skb->len ||
 		     (skb->ip_summed == CHECKSUM_PARTIAL &&
 		      csstart + skb->csum_offset + sizeof(__sum16) >
 		      skb->len))) {

-- 
2.55.0


