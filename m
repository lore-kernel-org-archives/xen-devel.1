Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8865ACA6017
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 21:03:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443815.1660992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvHE-0006Tv-MQ; Thu, 08 Oct 2026 21:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443815.1660992; Thu, 08 Oct 2026 21:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvHE-0006TQ-Hg; Thu, 08 Oct 2026 21:03:44 +0000
Received: by outflank-mailman (input) for mailman id 1443815;
 Thu, 08 Oct 2026 21:03:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEvHD-0006K9-SU
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 21:03:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEvHD-005tQx-9M
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 23:03:43 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac8052e-8faa-0a2a0a5109dd-0a2a4501aacc-2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:43 +0200
Received: from [209.85.160.182] (helo=mail-qt1-f182.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac8052e-5984-0a2a45010019-d155a0b6f186-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:43 +0200
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-53396adbc53so58804691cf.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 14:03:42 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.241])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5359b6fa262sm3360381cf.6.2026.10.08.14.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 14:03:41 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791493422; x=1792098222; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soiW+4bnwYoMWX+4s8jp0T9nXKlporFXyr3eC0IUFGM=;
        b=nlxcQrq/kIVHUnQ9fevqlpHqNUaY09idgkcEGk/uq9la8+EdQ2DJWOELa0hcByXZNt
         CclOZuTYw/dyLVUDKGx/9KUGoQqtekg7TrEbNGk51/UmoOPbTFSO9oFlwYEbWhKdNhnb
         8bfFgPusgNlG7k4a/wkNN3lI3r6jr6SsCzdHSEeXDsMb91HbnHTVO8ZbZ8P7GA7X3UM2
         JUEonScpKwfu4A5Bjv5YaJhT1n8eHr8xgR4UeDoUg3LZe5V3yrIHdWQIYEif9GYLTcfG
         wIXJkIdlm185jFkVBLwgeLCa+fzftRwCl2ycDNxAu8k4XQQrO5/lTQNE9tdlxedgyinz
         OqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493422; x=1792098222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=soiW+4bnwYoMWX+4s8jp0T9nXKlporFXyr3eC0IUFGM=;
        b=eGzfvdOJkKuADkQinObDB2S8Ly3GGe3b6dtw7oY2R9bJh+xHykcQI8vUqr+MPmn9/I
         +KV/4+DOQcLio/9qX9CH2Uqv/q1IXTE3un20wTA28ZEO+9B9ARXR3RqsQ3MuMFnIJ4B5
         GMqzPTklQDLixj32GZjICcQDNRZDqrNZVvsdca5EaeiE92xnEOc+TtsFEi4tWqOpZbrJ
         GQE9PAfCy+bYCDEGnyS6GV21LmOzeSV+yzBFXKf4C+OOatqwsec7eDPuQjs/XHNXpQes
         BzwZT/dXhCYCHCjtgSl0J6Jx+vZr9vH6O5X1GouUJKfZQGJ+LoSGx8bNh+PaeKyYIiha
         T6Ng==
X-Forwarded-Encrypted: i=1; AKwUvBz5CV/w31IiA/GBAlVsPQr9Htla11VBCveoOYhjl1G9g1ErQgrOPkCfTLHuj1KcQdq7mwCd3Rf58Ak=@lists.xenproject.org
X-Gm-Message-State: AFuF++muYXf7HHf7211UV22LYZuMQqVTVHOjdbAlRCGIdrHl10CxkH7r
	ahC93funGYX9/fU4ZCI+WipHmli3au9mcdLQ81rd30c5F+cRdr7k+M5Roe4KbBbmXsI=
X-Gm-Gg: AYBFou0ms+xfgGf6CxF1WeF1DsN2X/1GNUn+fYecoPDCdiwPv5l0pxa4Uq4Q7XHDSes
	OfvlTf+MjXQeJTXjgKl+9zte3yIEVyQp1+S4Wr19el66/bHwH8VhzJlcXYKHXjjoKAmNK9DOd+h
	ddEJPnViWbi4fT6u2baoIKrjG2mNPbuKeqSwwpRS3VRO+gQ9oeLbjG89J8rX5czXwJ8Fr4i/+zq
	G96Nbbq10qXOlJx6R0ifbEM1gytTmrVRjC+WgPa1RMRZLKVDCdQK6lFliy8crNb0kTRcytZvJzO
	AnDytI/nlLwWADmT0ptLCrvqnddZEOxnjBW4Qtbfm873ABKOOBAQRQ1leRCHXx12d9CiAZ9yOIG
	lCY948UeYE4BFV4b/+RkhzUIxHigrtD8Iw0jZ4S3XSMwuuI0nHhtr0+Mo74ZBQjETsyrhD+0ytT
	nMSqoqrNvO2je1qc7gV0WfUsGzkptONowmSz60/+GxiE1ZcxLhMoap6EL7DaQDC+sXWXGrOJrkf
	3IqRlH88qh0JM8=
X-Received: by 2002:a05:622a:4016:b0:530:f634:467f with SMTP id d75a77b69052e-53575391446mr121614331cf.15.1791493421782;
        Thu, 08 Oct 2026 14:03:41 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 08 Oct 2026 21:02:56 +0000
Subject: [PATCH net-next v2 09/10] qlcnic: use pskb_may_pull() to pull
 excess TX frags into the head
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-b4-pskb-pull-tail-drivers-v2-9-8f2bd9bee138@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791493385; l=1476;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=ySH+2yHpni3G+Qu86hbeGyzGTFoSfZJVBnTvasjUVEw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPIm2UmKVJ/FEKcAKGan3gEEsd83c98i++zBisuax140+xkclErvJSJq3lYfXk1tL7clYoB6cuo
 y7erG0zM7/wc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d62444/1791493423-1FE68757-95B04C18/0/0
X-purgate-type: clean
X-purgate-size: 1478

qlcnic_xmit_frame() pulls the frags that don't fit in a TX descriptor
into the head with __pskb_pull_tail().  It already checks the result.
Switch to pskb_may_pull(), which takes the length the head should end up
with and checks it against the skb, so this driver no longer calls
__pskb_pull_tail() directly.

__pskb_pull_tail() also releases empty frags, even when there's nothing
to pull, so if the frags being pulled are all empty it still gets the
frag count under the limit.  pskb_may_pull() returns early in that case,
so follow it with skb_drop_empty_frags().

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
index 761ef3bc8193..e7ab5586798b 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
@@ -682,7 +682,8 @@ netdev_tx_t qlcnic_xmit_frame(struct sk_buff *skb, struct net_device *netdev)
 		for (i = 0; i < (frag_count - QLCNIC_MAX_FRAGS_PER_TX); i++)
 			delta += skb_frag_size(&skb_shinfo(skb)->frags[i]);
 
-		if (!__pskb_pull_tail(skb, delta))
+		if (!pskb_may_pull(skb, skb_headlen(skb) + delta) ||
+		    skb_drop_empty_frags(skb, GFP_ATOMIC))
 			goto drop_packet;
 
 		frag_count = 1 + skb_shinfo(skb)->nr_frags;

-- 
2.55.0


