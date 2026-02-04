Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA00E95399
	for <xen-devel@archiver.kernel.org>; Wed,  4 Feb 2026 12:55:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1220478.1529159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vncPL-0007g1-2B; Wed, 04 Feb 2026 12:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220478.1529159; Wed, 04 Feb 2026 12:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vncPK-0007fu-Ul; Wed, 04 Feb 2026 12:54:58 +0000
Received: by outflank-mailman (input) for mailman id 1220478;
 Wed, 04 Feb 2026 12:54:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GHlk=AI=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1vncPI-0007fo-Tk
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 12:54:56 +0000
Received: from sender4-pp-g123.zoho.com (sender4-pp-g123.zoho.com
 [136.143.188.123]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2de5394-01c8-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 13:54:54 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1770209688392360.68451692466635;
 Wed, 4 Feb 2026 04:54:48 -0800 (PST)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-45efd53148eso2434338b6e.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 04:54:47 -0800 (PST)
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
X-Inumbo-ID: b2de5394-01c8-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770209691; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Rny4+wg1pUYwu2LpW65W8K2tR4xRbprWsqJmi/rT5y7mfp7OolgrdhBtZAGfjeurUoV9U42XtESbccDsJDRtls8FCWeFLfQTmlpt2R3G0EJxTTdnyE3yIX5Tz1U9zHn8hdyl1KkR0CtwSpFuB282dqNoSMYKaRQbquiqMOJ46zQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770209691; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MNUOf9vNNaeBu14G0olPGELpsi7Ci97VD9H/HBy5oro=; 
	b=SXJnrgwTfe2+/K/PWG2CkPeKKqIU7S2Ay9XNMAe3n6xaAJraALNhI6LiJpFeRed+a3j2ZvZH5b/6ZIUv0Tp59yC4IpYM5xOjZ3ADc/DUvMWT+fP955gTU6vFV0A308PR3FBfH1rt0V1EULlocxuZEAGCINW7uxohO3eCq8hluvw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770209691;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Message-Id:Reply-To;
	bh=MNUOf9vNNaeBu14G0olPGELpsi7Ci97VD9H/HBy5oro=;
	b=cN1PE3EOp0etRF+LkElXAwP5XI2cMi2+IOHGmWofkYkPqjvV2NPtcoM6DajV1NOY
	5oZJ0XrfwZtIUBDPX4DNU/RAFAUzRsymfUK0w3X6ZuWGDqggvON2dOIqSE2xYHJLdIK
	LupmjXRqgFJOIKuU0mW1uxTAPGNv3cgi6gtz71V0=
X-Forwarded-Encrypted: i=1; AJvYcCUfNZZjiHd0bZjK6yeVrXlDOMDKvehiUwitACexRObHBL2tKDbGeINPdB6QUGylNs0vwCMyNmIwX7k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0uW1kI7OAp5jraZDPamYfDhZDVbMPZHdNGUJC0k4Y4tfU4vL9
	VQ4eG6Za2lmJH58HRGgLPTN2d1rsceCYeFAQcwRCyuLgoxoA9H5oQl6uVWMuKVWY2jmAT1DgcK3
	ufpCGBMSgN4bRZJraHDI0vMqFKC0RsQs=
X-Received: by 2002:a05:6808:bd6:b0:450:275b:d942 with SMTP id
 5614622812f47-462d586fa49mr1369842b6e.10.1770209687045; Wed, 04 Feb 2026
 04:54:47 -0800 (PST)
MIME-Version: 1.0
References: <20251119193120.1011448-1-grygorii_strashko@epam.com> <90ac9206-10ce-4c46-83e3-82ac8ef0d152@suse.com>
In-Reply-To: <90ac9206-10ce-4c46-83e3-82ac8ef0d152@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 4 Feb 2026 07:54:12 -0500
X-Gmail-Original-Message-ID: <CABfawhk21yBRwGoj423PpLEe=exGzx9bBsiHMf0LbuZH+94MVQ@mail.gmail.com>
X-Gm-Features: AZwV_QhQudzW0WS1dzgSGtPjV6PsQSXMjUpapeeeWRwe2XEVU0TzgGUK2ERz5QI
Message-ID: <CABfawhk21yBRwGoj423PpLEe=exGzx9bBsiHMf0LbuZH+94MVQ@mail.gmail.com>
Subject: Re: Ping: [XEN][PATCH v4] xen: make VMTRACE support optional
To: Jan Beulich <jbeulich@suse.com>
Cc: Grygorii Strashko <grygorii_strashko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Penny Zheng <Penny.Zheng@amd.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000930e360649ff0f43"

--000000000000930e360649ff0f43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 2, 2025 at 5:57=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:

> On 19.11.2025 20:31, Grygorii Strashko wrote:
> > From: Grygorii Strashko <grygorii_strashko@epam.com>
> >
> > The VMTRACE feature is depends on Platform/Arch HW and code support and
> now
> > can be used only on x86 HVM with Intel VT-x (INTEL_VMX) enabled.
> > This makes VMTRACE support optional by introducing HVM Kconfig option:
> > - CONFIG_VMTRACE to enable/disable the feature.
> >
> > Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>


Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

--000000000000930e360649ff0f43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 2, =
2025 at 5:57=E2=80=AFAM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com=
">jbeulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 19.11.2025 20:31, Grygorii Strashko wrote:<br>
&gt; From: Grygorii Strashko &lt;<a href=3D"mailto:grygorii_strashko@epam.c=
om" target=3D"_blank">grygorii_strashko@epam.com</a>&gt;<br>
&gt; <br>
&gt; The VMTRACE feature is depends on Platform/Arch HW and code support an=
d now<br>
&gt; can be used only on x86 HVM with Intel VT-x (INTEL_VMX) enabled.<br>
&gt; This makes VMTRACE support optional by introducing HVM Kconfig option:=
<br>
&gt; - CONFIG_VMTRACE to enable/disable the feature.<br>
&gt; <br>
&gt; Signed-off-by: Grygorii Strashko &lt;<a href=3D"mailto:grygorii_strash=
ko@epam.com" target=3D"_blank">grygorii_strashko@epam.com</a>&gt;</blockquo=
te><div><br></div><div>Acked-by: Tamas K Lengyel &lt;<a href=3D"mailto:tama=
s@tklengyel.com">tamas@tklengyel.com</a>&gt;=C2=A0</div></div></div>

--000000000000930e360649ff0f43--

