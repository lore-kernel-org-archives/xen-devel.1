Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D117CA6016
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 21:03:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443812.1660983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvHD-0006Dv-Cc; Thu, 08 Oct 2026 21:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443812.1660983; Thu, 08 Oct 2026 21:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvHD-0006De-8D; Thu, 08 Oct 2026 21:03:43 +0000
Received: by outflank-mailman (input) for mailman id 1443812;
 Thu, 08 Oct 2026 21:03:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEvHB-0005xv-Vy
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 21:03:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEvHB-005tQx-CW
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 23:03:41 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac804fa-8faa-0a2a0a5109dd-0a2a4501cd66-48
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:41 +0200
Received: from [209.85.219.49] (helo=mail-qv1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac8052c-5984-0a2a45010019-d155db31bda8-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:41 +0200
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-9178aabd30dso34366136d6.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 14:03:41 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91b550ce8a5sm77746d6.40.2026.10.08.14.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 14:03:39 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791493420; x=1792098220; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hz4PLreF7SMRfFt85q6B38gbUo5+Y+8z8sLQb0vICiM=;
        b=r0x9pXrNMk9z9SW3DuBk4j3mzM2W41MoV37Hvbn3nm/jEeI1XlWIKu5gvu6KN3CVSM
         IJOKvKmCzKfYDeZtmOi4EjwNL2bwezoAjvHyNhy2gt18nXrdZovhvXYGIE++GODgr0/a
         UHtHP1EolggBFHO7SwFsyhy+v2Ss9RMBqLiQW7m+Hh1IfBoyQlZ9mqZe6FtD3OMfw9wi
         Gta6kgI6IKPnPIQ2a1J/D6tFlk21fZ2vYnI5SPFHAx8ypV3tTfS+NlQZgSUp0RX7RpyS
         wyXybaMky9aRwyzIrX2MlahiydyKr6orO01iO8JTjSZOjvBtVkdxJ+tgb2YDFmM64tqe
         5xZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493420; x=1792098220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz4PLreF7SMRfFt85q6B38gbUo5+Y+8z8sLQb0vICiM=;
        b=IGhitPJPlZgVGwwb7u11rkjZtfbCZvFSCikY0noP+C04vZ8ssiScBEZMaaKQHOBOoN
         3YhA+ipLamX4UJ3fSnk3oR8GU7CaNTIJy/KqzOkAUdFj5GoXVzrE7wcDYyysM5tzt6gb
         TFYbXe0UlkUl09v4PB1Ha9SBYZGZWsDxJ7PEKAtg/HEXEdGKePZVbA06HgbdsVeUH0uO
         1StpuRtKnjPSqvihJlHhTLLxPKMXMsT1fOLOp6ypu35w7R2qPSu+loLdxDkpkT9agrXS
         UfkhF9yKUd3iIkxb9mnELf0hoQ0G4G9m1SlAAK4ssH0aBFcrGwryIXtm4smWsZPHDQWT
         ER+A==
X-Forwarded-Encrypted: i=1; AKwUvBwfZndDMdyurdG5l+u58FDnkBic44baZ9aOTYY/Cttqtx/2D5C3ItJODYARSVJZ3bpgvqFxSoyI3AU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKh/7KCcULuF9tg+t26uDxl0R/xwBrsquppRa9G1YaxL6shLWsi
	4Btdl1erE0VWxG9AHE1zdClH6MvIODLR+3I4QZ4DUJPJVTf4TDV368Cd6YAZvfNdMvc=
X-Gm-Gg: AYBFou20aKrFsyWFeEOgzGaN9VdQ9yVhPdmQfUKSbra5ZIlLZYCWrsnFsb8BzrB3I5B
	TDbENdugdQa+ZxWqVDqJY7YOfK//zSKVH2KltF4KwFi+2YclJpQDN7J4AofSvgHyDrjKIAPd+0k
	rRImp4NFCfhiCG0orDSdN2fdlTQLFjls9NVTxXsAVSvp1fmxb3l7Zjrj1mh1X5j9EYl3/8gW+76
	Cq5vnMaGRsGrOZZKFG61UZqXTPFTayXZHWXFhdVtPAXKBH0PviF6U2A1C8ok8YrtiFeCijGNC9q
	cPLzX3xoLfVz5kgtobqxRg2NiBOOg+Di/LPIYUvsMmB/er+P6LZcsxxfN4GxC1gUfcKka/3CNkX
	kvYoFkHNdM0Xf+DM0si0Kj6sa5gguByOIycrDhW41DuZm/6i72o5ibjG4mF29ezb5wP+oeRmH+e
	XUya1dzOQr3M91KFsBjGRk397sRE8LxkLo0AxYwdhlxKJrnsT+5ctZ0JrEqusmSMO4sBJdoW7iz
	fwnVn1sZANrr5w=
X-Received: by 2002:a05:6214:2b86:b0:919:952e:588d with SMTP id 6a1803df08f44-919978d6737mr122288916d6.56.1791493419767;
        Thu, 08 Oct 2026 14:03:39 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 08 Oct 2026 21:02:55 +0000
Subject: [PATCH net-next v2 08/10] netxen: use pskb_may_pull() to pull
 excess TX frags into the head
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-b4-pskb-pull-tail-drivers-v2-8-8f2bd9bee138@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791493385; l=1424;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=2MH/LzfAfYyw21+HKj408easdoK7+Tc42GivpUT/gq0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKxQbKwa+3oPMIR9/8wstf89TfYBkXylWZ+7HP6SNMiYKVAMjbRgDk4LveZCkr1O9fxCwKO82Xi
 ZBjyd9+CX/ww=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d62444/1791493421-BD341757-1E7CFBF0/0/0
X-purgate-type: clean
X-purgate-size: 1426

netxen_nic_xmit_frame() pulls the frags that don't fit in a TX
descriptor into the head with __pskb_pull_tail().  It already checks the
result.  Switch to pskb_may_pull(), which takes the length the head
should end up with and checks it against the skb, so this driver no
longer calls __pskb_pull_tail() directly.

__pskb_pull_tail() also releases empty frags, even when there's nothing
to pull, so if the frags being pulled are all empty it still gets the
frag count under the limit.  pskb_may_pull() returns early in that case,
so follow it with skb_drop_empty_frags().

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c b/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
index 67d9bf69f8f2..f5f89ed87d95 100644
--- a/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
+++ b/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
@@ -2045,7 +2045,8 @@ netxen_nic_xmit_frame(struct sk_buff *skb, struct net_device *netdev)
 			delta += skb_frag_size(frag);
 		}
 
-		if (!__pskb_pull_tail(skb, delta))
+		if (!pskb_may_pull(skb, skb_headlen(skb) + delta) ||
+		    skb_drop_empty_frags(skb, GFP_ATOMIC))
 			goto drop_packet;
 
 		frag_count = 1 + skb_shinfo(skb)->nr_frags;

-- 
2.55.0


