Return-Path: <SRS0=XIDt=N4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8BCC433EF
	for <xen-devel@archiver.kernel.org>; Mon,  6 Sep 2021 00:06:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C632460EBA
	for <xen-devel@archiver.kernel.org>; Mon,  6 Sep 2021 00:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C632460EBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unixindia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.179233.325464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN29O-0003Ke-EI; Mon, 06 Sep 2021 00:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179233.325464; Mon, 06 Sep 2021 00:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN29O-0003KX-AQ; Mon, 06 Sep 2021 00:06:14 +0000
Received: by outflank-mailman (input) for mailman id 179233;
 Mon, 06 Sep 2021 00:06:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZwUt=N4=unixindia.com=bhasker@srs-us1.protection.inumbo.net>)
 id 1mN29M-0003KK-Av
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 00:06:12 +0000
Received: from mail-il1-x12e.google.com (unknown [2607:f8b0:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0ebf0cd-8a17-492a-baf9-6cf81701f4d9;
 Mon, 06 Sep 2021 00:06:11 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id a1so5200397ilj.6
 for <xen-devel@lists.xenproject.org>; Sun, 05 Sep 2021 17:06:11 -0700 (PDT)
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
X-Inumbo-ID: a0ebf0cd-8a17-492a-baf9-6cf81701f4d9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unixindia.com; s=mail;
        h=mime-version:from:date:message-id:subject:to;
        bh=YrSeOqW8u+/b+kn90enjWBIEuYxqEEa6/DzSOYyPeAY=;
        b=gcldrFazzFF5WFdtYu2jX31ym0BBjR1auHkSXfPsxG96O8W3kkW9MnNMGCjoS8drWX
         6jS8oPTp48QV+bW60fft6BFuU8yqSJMAmMwcCE7Qpvjf7MgjMxK5aqvMV1H8pzrH/k8r
         qA2INpgGQJb19vRncTdl1jj4zsNTSvsH85ttq5L10Nxj3csSuV9T0eRmcXmP6O4boU51
         Ri2kSZcSg0ct1b82FEWC6z4LJSxlP/2eMMIFZJp9EkAxx8iiitpo4TrLfa+t1/0ftmpM
         7uk4dldo2Am4l4e+JK/rcCKASX+gCs0drZy/EZ8o23RIneSg/zEH1O7cYEeqY25f9KJo
         tI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=YrSeOqW8u+/b+kn90enjWBIEuYxqEEa6/DzSOYyPeAY=;
        b=RpcbtifRF4JBPnP6tq+ekbY5LnkcX0DW+cQHN84ySmH1Hc4c40A8CDAoWdoAQG0o7B
         +blGfa+0Tb6MZI9cx2rLY1R1JZH1Zc+cP4AltYcP6R4BA+yHmF4bDPWVOaCqsNGNHJWG
         yCYc5299iGLLG4ZfrkypKZRAZo19dQlSdjoRbV12m8nP8MztFhWv7rlUd5KOyGze4gs2
         CNWQrjZqjh+GtUPMB+x16di7UirI2gbClzp3Ltz+vECrilM25K21JP++7mz4bZ2fj+bT
         wV67q7aZbgOIQDlbf3+Bl8XeRooqe3QWM5CEzkh4cvXjBZ86PNxcLPJIOfqM5HjutC/3
         hN3Q==
X-Gm-Message-State: AOAM530SzCuNHHAXFz8bfra7G0fLzwBEaBISKAFO+7PoIYicxqjZlPaW
	p10LnTuCL/aJ/NwhGeNRx+089gMkLsPWBxamkKl8EZZZp6w=
X-Google-Smtp-Source: ABdhPJzPn1n3lZMZ0mAzdV/rhaVBfKhWFWOE69Ok0QaASId1ikfXjRzDX3Cey8Kp8fWgoo2qabbpw4FUkkOhE1h4+U0=
X-Received: by 2002:a92:c109:: with SMTP id p9mr6578692ile.115.1630886771096;
 Sun, 05 Sep 2021 17:06:11 -0700 (PDT)
MIME-Version: 1.0
From: Bhasker C V <bhasker@unixindia.com>
Date: Mon, 6 Sep 2021 01:06:00 +0100
Message-ID: <CAPLCSGD9ZTaoMSqgo6EEdW4VYs9wrz+YvChR_Cx0Rkm8x5iq0w@mail.gmail.com>
Subject: DomU crashes when restored if it has pci passthrough
To: xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000a918c205cb486aff"

--000000000000a918c205cb486aff
Content-Type: text/plain; charset="UTF-8"

Hi,
 I have a domU and that domU has network vf attached to it.
 The save and restore leads to crash of the domU after restore.
 Am I doing anything wrong?

Regards
Bhasker C V

--000000000000a918c205cb486aff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>=C2=A0I have a domU and that domU has n=
etwork vf attached to it. <br></div><div>=C2=A0The save and restore leads t=
o crash of the domU after restore. <br></div><div>=C2=A0Am I doing anything=
 wrong?</div><div><br></div><div>Regards</div><div>Bhasker C V<br></div></d=
iv>

--000000000000a918c205cb486aff--

