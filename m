Return-Path: <SRS0=tjH6=N3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56B7C433F5
	for <xen-devel@archiver.kernel.org>; Sun,  5 Sep 2021 18:54:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87D4660E76
	for <xen-devel@archiver.kernel.org>; Sun,  5 Sep 2021 18:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87D4660E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unixindia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.179148.325343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMxHn-0006gD-Pj; Sun, 05 Sep 2021 18:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179148.325343; Sun, 05 Sep 2021 18:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMxHn-0006g6-Mk; Sun, 05 Sep 2021 18:54:35 +0000
Received: by outflank-mailman (input) for mailman id 179148;
 Sun, 05 Sep 2021 18:54:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=af6+=N3=unixindia.com=bhasker@srs-us1.protection.inumbo.net>)
 id 1mMxHm-0006Ep-4J
 for xen-devel@lists.xenproject.org; Sun, 05 Sep 2021 18:54:34 +0000
Received: from mail-io1-xd2f.google.com (unknown [2607:f8b0:4864:20::d2f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b2adada-8c5e-499a-811c-e6b2302b1dc4;
 Sun, 05 Sep 2021 18:54:28 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id y18so5972885ioc.1
 for <xen-devel@lists.xenproject.org>; Sun, 05 Sep 2021 11:54:28 -0700 (PDT)
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
X-Inumbo-ID: 6b2adada-8c5e-499a-811c-e6b2302b1dc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unixindia.com; s=mail;
        h=mime-version:from:date:message-id:subject:to;
        bh=8EXbD+WXl5NKpRmiVXpJMhwGpvUlCOqYs4PO3k+SXdM=;
        b=QhVxTKwXCOp/+GRfDwt5AusfMdwcmKgpbXoyasGZkYjJ23jNtJVeH8rNoR5qH8gEp/
         XZag0Tc02yo1GV0hDB1CnwQxyDJCe+hoeCwTNsyMCelrbp4RTD6/7mFnay/+uGAgvmuZ
         3EbQKfoE2OASvDAOSpy6YvIdZ04pWdnB0GtCtJEfW2OREj+ZGNAU9zHvwhxN1vfbKdx9
         hvKOunJ3icZrJ7NIFBgFVuIhBQRlBAr2JlizxbKnjVQXAvEmhqXoBvzJKuCHCZVf6+yc
         OobrX8cjTJZY2LybdFV+F8GOoZS7D/TGKwtE4hLaZ9DLIrMOgI2YZUU9emVo6KwgxXj4
         x45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=8EXbD+WXl5NKpRmiVXpJMhwGpvUlCOqYs4PO3k+SXdM=;
        b=Ey4JoLUXXO50gZZpuEcb5KJpSOPgi8bbHZtzTrdBigxLR8HSGMlrxtj5exfiKv/rsL
         pVqrobjQdqY2CZMcs3WOC2k6/AP11Yw0opSCIGEQvxLuENiPh4dgCSBGuMrCf1x2CTCr
         bs/m8BwJKmc1CcgczW7Osxs1e/bYGdtu0V5I6urtiFcTFpJLt+qMx9a/WW38HVuHBnpv
         QUKuhFFLhuXbonDz/4ne34GAQhPr5eRL5BzAe2wBlzre2nPS945oE7YBAl0MC3DLvngH
         XefmIKdY5JEX4nEfwR0ipODEhja2bMWI8Q1c0A+DeW7m1GjbSFHIGkc9i8c+4rShJ2te
         mFbQ==
X-Gm-Message-State: AOAM530u5ht66i6mcauPnkcZZ2tDYiS16jZBEkuCP61CFDQVvQ+W+VFA
	mZScULtrulCgECwrqLvnLgZv77i9dbpFBUoOq2DM27mmpDTyxQ==
X-Google-Smtp-Source: ABdhPJxqI/bI7DpkdZFdjU9QxRKbM7tokg6OUGG/BLGUIkM3YYpxKmWQKyNu+HR8t3sEf72Lc1pg0f66PC3MmKV2NAo=
X-Received: by 2002:a6b:e70f:: with SMTP id b15mr6949747ioh.140.1630868067583;
 Sun, 05 Sep 2021 11:54:27 -0700 (PDT)
MIME-Version: 1.0
From: Bhasker C V <bhasker@unixindia.com>
Date: Sun, 5 Sep 2021 19:54:16 +0100
Message-ID: <CAPLCSGBP6vT4Fp2fr5RH7XVsRM=rJ2CGjuVN2aN0v8TSdAWOUg@mail.gmail.com>
Subject: USB passthrough
To: xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000d81cc505cb440f26"

--000000000000d81cc505cb440f26
Content-Type: text/plain; charset="UTF-8"

Hi all,
 Sorry if I am starting a well-discussed thread again.
 I was reading through  https://wiki.xenproject.org/wiki/Xen_USB_Passthrough
and I understand that a xen_usbfront and xen_usbback.ko is needed.

Where do i get these ? I see these provided for k 2.6.18 but that is way
old. Is there a new version for these ?

I tried this:

$ sudo xl usbctrl-attach  14  type=pv version=2 ports=8
libxl: error: libxl_device.c:1103:device_backend_callback: Domain 14:unable
to add device with path /local/domain/0/backend/vusb/14/1
libxl: error: libxl_device.c:1402:device_addrm_aocomplete: Domain 14:Unable
to add vusb with id 1
libxl_device_usbctrl_add failed.

and any attempt to usbdev-attach fails too

Please help

Thanks and regards
Bhasker C V

--000000000000d81cc505cb440f26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div>=C2=A0Sorry if I am starting a well=
-discussed thread again. <br></div><div>=C2=A0I was reading through=C2=A0 <=
a href=3D"https://wiki.xenproject.org/wiki/Xen_USB_Passthrough">https://wik=
i.xenproject.org/wiki/Xen_USB_Passthrough</a> and I understand that a xen_u=
sbfront and xen_usbback.ko is needed.</div><div><br></div><div>Where do i g=
et these ? I see these provided for k 2.6.18 but that is way old. Is there =
a new version for these ? <br></div><div><br></div><div>I tried this:</div>=
<div><span style=3D"color:rgb(61,133,198)"><br></span></div><div><span styl=
e=3D"color:rgb(61,133,198)">$ sudo xl usbctrl-attach =C2=A014 =C2=A0type=3D=
pv version=3D2 ports=3D8<br>libxl: error: libxl_device.c:1103:device_backen=
d_callback: Domain 14:unable to add device with path /local/domain/0/backen=
d/vusb/14/1<br>libxl: error: libxl_device.c:1402:device_addrm_aocomplete: D=
omain 14:Unable to add vusb with id 1<br>libxl_device_usbctrl_add failed.</=
span></div><div><br></div><div>and any attempt to usbdev-attach fails too</=
div><div><br></div><div>Please help <br></div><div><br></div><div>Thanks an=
d=C2=A0regards</div><div>Bhasker C V<br></div></div>

--000000000000d81cc505cb440f26--

