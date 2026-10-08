Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C464CA6016
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 21:03:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443817.1661001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvHI-00070V-6t; Thu, 08 Oct 2026 21:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443817.1661001; Thu, 08 Oct 2026 21:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvHI-00070F-1w; Thu, 08 Oct 2026 21:03:48 +0000
Received: by outflank-mailman (input) for mailman id 1443817;
 Thu, 08 Oct 2026 21:03:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEvHG-0006lG-3H
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 21:03:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEvHF-00H9qs-GG
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 23:03:45 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac804fa-e002-0a2a0a5209dd-0a2a45058608-36
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:45 +0200
Received: from [209.85.219.48] (helo=mail-qv1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac80530-4cb1-0a2a45050019-d155db30e447-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:45 +0200
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-9178d514951so44008966d6.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 14:03:45 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91b550d394bsm79796d6.41.2026.10.08.14.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 14:03:43 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791493424; x=1792098224; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0uSM/A3oRPIUcCVkMNaXKAYlboH4f+zE5JovH6Ln9w=;
        b=FN6pICXzk8lxXJQcB9Yn0uYlXOcbchVD7uKqbpdl0ZwmraaOm3d5oGqfDxrLn5Y57y
         Ank6ILUeuwLlF4obzmncx7IuEBymHtfwfMhr+SI+9DYcVp8WfraSEtfWLfP71luMI0Ix
         tLXWNjjinuuwIfEVz+fgUuJ79pwKq3tEHucfKrCztOeJVH5zzuguqCswr0Fy5lT3EIgw
         9fHUWuBceM2i9qus2/hCCiyooC60X6BEeg+Et+sotyIdQACNVAt8cU27Y4l0HmyPzuqq
         RhtGvZBxd3Fc+ikij110egfFGUK7Sds6MgiJzi9UJJ6KU7EpfLP9aCMjpO9tvHqCXBYh
         UKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493424; x=1792098224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0uSM/A3oRPIUcCVkMNaXKAYlboH4f+zE5JovH6Ln9w=;
        b=0rPb9XCFOB7jAsaesPp0NqqGKn2Y1x1o49lxm+kogYum6wxJu5gJlEulrNwBGDg7Mo
         9P10UwlOY5hIpBjXVCDgWKYNl956eXIQBXy9/f9rIvvx37hoP0OLey3QPyMDUJ1p7cVj
         uFku77/68NoXZfxA15jLnX/r9N4Srh11YlDoPNHXh0EIuNNIrqURSIPehH5nU/dYRd2L
         pTXAaXbAqy+7f/tKmq6Ly2nuAJND+A4EY4VEObysxH5yteXvROplQWISkz+6Rml1OFYx
         VmpyGGlI2/NNMbo8wIGgdxJjJlC99fwMyBBul3SgFxRba+fKRcJHvsDCYGQAVUHYQBfV
         jjCA==
X-Forwarded-Encrypted: i=1; AKwUvByh6anpGI5hFLFJz1ymPR0U14Kui/717xiVHMCwBsgcnm1iAlZ3vsEpUvFh1YWpfr5nr+MsaLxRsPo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLxRGQMrKRQksNK+kYsoYinLFWdTY1Mqp15Y+nUENiJ8E50mnsF
	JN9Mw7mHmCjVdMdi7cnc2/GwX74RGxZjXlazGwzPXvDsbbiKV2QKij90uP6CHkkJA3FUmXb0ESv
	RgHM4/3y/Bg==
X-Gm-Gg: AYBFou1ShSShmRyWsMhVdaf58iHoimy3ew/Kf7VxkJldGrygRmXyh63vy2oS/MvIgfz
	hmXWeTsW03EN+/myuzpm7+/g9BUzVKWTQtFZJGUTXwhynOnXUsoqNyZ6Z7dV/DecE63urzAIeR9
	asaUGQXK6Tn4nCcI8onJp0oIXLWqqpcdusIl+urNjsoYGCMDIaAWqiLc4oCt/b3+X7sssfAyac/
	yyhxT4c6Zg+rVEjk9ZBAUXq3NMqt2j0jTRx2oPfV6pqcfp9F7LTOJVe2uXmkONZ/gk+FQIF5ScH
	Wrv+jBgp//QRW2bvPkQs4mJ17jlfT3Dfqob5SYsMIcAaA+lrg7vVwJDlDXN6xh3D2ptZaQbGEMW
	gHOHxd2je0UrPrFeE4H+jl0/MFI+P/fbrxttjvtjo7QE6OpYD8Nc6sZqCvicrmkbUG2w0JDm2TS
	R5ZABFW+Roa/6EGxnvG98Su3APXfAVkHRmKOlGAzTjD6PcvH9+3BrknUgErHkA52Ca31EJ9Fywk
	AmSZiz9Z4NQwJY=
X-Received: by 2002:a05:6214:ca3:b0:919:952d:7ff9 with SMTP id 6a1803df08f44-919978f7ebamr126853616d6.57.1791493423774;
        Thu, 08 Oct 2026 14:03:43 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 08 Oct 2026 21:02:57 +0000
Subject: [PATCH net-next v2 10/10] net: skbuff: don't reset truesize in
 skb_condense() if the pull fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-b4-pskb-pull-tail-drivers-v2-10-8f2bd9bee138@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791493385; l=1285;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=G4GQSS/z86H6HrzRjtGCGkhfNcr1ZqkSUEOCEKTi8N4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QD7QXznJXVwY4tvhlA2g/ntlgNB9z4EYJ24pFBre8ehTYCPfcNpsZClmKSf0INhwTvOUpctCjRC
 vzNH0Zo1blA8=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c201ff/1791493425-F64B42A1-BD22BD31/0/0
X-purgate-type: clean
X-purgate-size: 1287

skb_condense() pulls all of the frag data into the head and then sets
truesize to cover just the head, but it ignores the return value of
__pskb_pull_tail().  If the pull failed, the frags would still be
attached and truesize would undercount them.

It can't fail today.  The caller has checked that the head has room,
that the skb isn't cloned and that the frags are readable, and pulling
all of data_len eats every frag_list skb whole, so nothing is
allocated.  Check the result anyway and leave the skb alone on
failure, so this stays correct if any of that changes.  Use
__skb_linearize(), which is what this pull is.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index f798118df112..556d37981f0f 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -7158,7 +7158,8 @@ void skb_condense(struct sk_buff *skb)
 			return;
 
 		/* Nice, we can free page frag(s) right now */
-		__pskb_pull_tail(skb, skb->data_len);
+		if (__skb_linearize(skb))
+			return;
 	}
 	/* At this point, skb->truesize might be over estimated,
 	 * because skb had a fragment, and fragments do not tell

-- 
2.55.0


