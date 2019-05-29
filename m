Return-Path: <SRS0=GvgA=T5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32268C28CC0
	for <xen-devel@archiver.kernel.org>; Wed, 29 May 2019 17:29:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05EFA23F9A
	for <xen-devel@archiver.kernel.org>; Wed, 29 May 2019 17:29:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCZxHMeV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05EFA23F9A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW2Nf-0007mJ-TT; Wed, 29 May 2019 17:28:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yMcL=T5=gmail.com=meetcarey@srs-us1.protection.inumbo.net>)
 id 1hW2Ne-0007m9-4n
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 17:28:50 +0000
X-Inumbo-ID: 38410399-8237-11e9-8980-bc764e045a96
Received: from mail-io1-xd32.google.com (unknown [2607:f8b0:4864:20::d32])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 38410399-8237-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 17:28:49 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id g16so2542912iom.9
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2019 10:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+eWpqAznRj7aw0z6mADceUISyrzfCP3dKM1+xNwaYZs=;
 b=jCZxHMeVDv1dW6e57iMBC1GDtnG4yvN9SBXuK4uKOq91hTauGH6hZloXIJf08gysjc
 Cg0GP/Q5gMGJidy6/cCk0qKEZUS4HCIyPyV6LDFS46n2aEo+Pu3LVtogwNCxKBbFarZz
 y0kQqHLgxcFskSeBGaW3AyKnPN1x6mUZQjTcWCIyDpygOpHVwyZDv5Bol7SFnUfxZGjK
 SAePHYGkcEtvBtHHTDod/rHiip50dtEHWn4TaxeCDlxVToVni181CB9/fiBIsVxELUHI
 pXpqeaTJJItols5FRDiilnj/KyavbZ9emIbyRuq1/YT7+ecSDZ/h52rDBm6sDe8Q2qNH
 RcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+eWpqAznRj7aw0z6mADceUISyrzfCP3dKM1+xNwaYZs=;
 b=NE8Htb1Whm237JRLWDjxa9RlbZp273gLzY79iatWMi5vzbuZmeCL71rbWEvkA/cgfI
 GGZrf2yNDImweHxNjI1l7ksROYn/Uy6Dc0D+QZyBkuOViOhqnkAzyzdztuvRGf4KxA9I
 r5gp/OMri2YjdzOMMG5N7MfgOhumQKA6cZjDcAviM2qs9DV1smi0LMaBnYegl+ae1GUD
 iUcqo7XdgmO90uKGGg/keTyGYJPAjFdfWPgJHaeEWiUEV1CTbxEyiK3qhIbjVIa+dlss
 1IoqCzZZ53Si9U6byeKmS6C//Fu0AmfD0xW2+B4NykWjId3B1v82b8SCdPHPN8DIhC+a
 oAHA==
X-Gm-Message-State: APjAAAWgUdtF4ZbUdWy295czR+pope7xRLdOu2faKKGJIO1VcPKAF/I7
 KKraD6DAkMGatg0KSRncs3wehq2iuFiJB+jLXHF7klNM
X-Google-Smtp-Source: APXvYqznXCm12/lbweqQ0bZoWwMA90MgAwOoEhLmEdn2iLSdzJH0qXgl1VlRSIaDDkmMMBeoMbtKqAa8QYDZYY4Z/2A=
X-Received: by 2002:a5d:9a18:: with SMTP id s24mr37593743iol.284.1559150928237; 
 Wed, 29 May 2019 10:28:48 -0700 (PDT)
MIME-Version: 1.0
From: Hariharasubramanian C S <meetcarey@gmail.com>
Date: Wed, 29 May 2019 10:29:29 -0700
Message-ID:
 <CAD+-4A-jMLuWuqr2VHE2m_PNR1P2VXeF439OxE+XEyG7w0Mg+w@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [Xen-devel] vTPM2.0 support
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1683780643141494559=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190529172929.MhRefzNAFCkk47aMCxYJzYAKitsEpvSOSNQLk5w-_6A@z>

--===============1683780643141494559==
Content-Type: multipart/alternative; boundary="0000000000003a98b0058a0a1da3"

--0000000000003a98b0058a0a1da3
Content-Type: text/plain; charset="UTF-8"

Hi,
My understanding is that currently xen hypervisor supports vTPM, but
supports only vTPM1.2.  i.e. vTPM can work with TPM 2.0 hardware, but vTPM
as such will support only 1.2 SAPI calls in the frontend-driver. Is that
right? If yes, can you please share if there is a roadmap for supporting
2.0 in vTPM instances?

Thanks
Hari

--0000000000003a98b0058a0a1da3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;color:#0000ff"><br clear=3D"all"></div><div><div class=3D"gmail_defau=
lt" style=3D"font-family:georgia,serif;color:rgb(0,0,255)">Hi,</div><div cl=
ass=3D"gmail_default" style=3D"font-family:georgia,serif;color:rgb(0,0,255)=
"></div></div><div class=3D"gmail_default" style=3D"font-family:georgia,ser=
if;color:rgb(0,0,255)">My understanding is that currently xen hypervisor su=
pports vTPM, but supports only vTPM1.2.=C2=A0 i.e. vTPM can work with TPM 2=
.0 hardware, but vTPM as such will support only 1.2 SAPI calls in the front=
end-driver. Is that right? If yes, can you please share if there is a roadm=
ap for supporting 2.0 in vTPM instances?</div><div class=3D"gmail_default" =
style=3D"font-family:georgia,serif;color:rgb(0,0,255)"><br></div><div class=
=3D"gmail_default" style=3D"font-family:georgia,serif;color:rgb(0,0,255)">T=
hanks</div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;=
color:rgb(0,0,255)">Hari</div></div>

--0000000000003a98b0058a0a1da3--


--===============1683780643141494559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1683780643141494559==--

