Return-Path: <SRS0=8NMJ=AQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2A6C433DF
	for <xen-devel@archiver.kernel.org>; Sun,  5 Jul 2020 04:26:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF674207CD
	for <xen-devel@archiver.kernel.org>; Sun,  5 Jul 2020 04:26:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjF0PMXk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF674207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrwE8-0001RF-6Y; Sun, 05 Jul 2020 04:26:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0p6Q=AP=gmail.com=pauldzim@srs-us1.protection.inumbo.net>)
 id 1jrkyq-0006Fv-7D
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 16:25:32 +0000
X-Inumbo-ID: fab41772-be12-11ea-8496-bc764e2007e4
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fab41772-be12-11ea-8496-bc764e2007e4;
 Sat, 04 Jul 2020 16:25:31 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id a12so35287479ion.13
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 09:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=siYZvVhE9VeBBvLQIX/nnAed+rLIHn4bVXcuyvDsWaw=;
 b=pjF0PMXkE9pbfyA44NA0kCnTofn8BML3M2OwLhH+Sqsxxe1sGclQdp8aRABF6oUm7p
 jl3jluIF8Iod+vAQYD9a9T9hizpvwz6WnAjoWUqHG6YxzqwkxwFtal6rAmecurpCeu63
 HodGkRhRHtWuT2Pe9TYLrfl5xbRYOk9LLYdPHTMPdK0DhgKFqlWb+OJKfZYFsG/Mgude
 iMrzKgB1Y747nHlXa24vTJmzsISKSK+ZiOvur0XiEJN8zeFh9UgKrjT9VXbPu7hZm6iB
 4IkItqkdEv9WRqjf/co0WnxmfLXBQ+uTU17T3TFxcuXcGW+OlroDBON4fZDJU7C+YvxT
 s7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=siYZvVhE9VeBBvLQIX/nnAed+rLIHn4bVXcuyvDsWaw=;
 b=dmkNKqsKoNEpHw4moA2C5JVOOyJr32Oapac2QpDDyKGH38hobx1JsaZ4dogWOCCM4P
 06C+S914WlmV9AtI8zJi/Ho6AJXmfvkh1KYQg7slvVFsXFEtKSmx0QLhvzrl9qKspre6
 4aG7x4iOwcV4AmBtzUsdEk+zYGyLfUGCISO2OHEwLSXff9cOWMb6+3bzbjGexhMYDIpB
 jTc0iz4UdxycdXrEl1pHrOogY/8be8gdglvdSWTlFhDdbMDkUkeKezDgKjHNus8oSnTB
 S74sbEwwToNcZnusvZXVDCMsSzQgd5RIicProf40wkt81n4tcHmujnaBBKFNybT9j3Qf
 5ZnQ==
X-Gm-Message-State: AOAM533NAIInM78Q4ttdThTn7kuH4uJgpU8jL+WgMoDqiicwMMvGq7Vd
 GFLYfvbCaG96eEop7B5+NxNMpklmdoLYHkzLiqY=
X-Google-Smtp-Source: ABdhPJwZwrn7vzEIJbGYJoQZG3XTTSfTQJEX4yl2ivSAb5nZSnnjPxLr+c9nvkov/DkXTccC1tmUb5GLEFGW3coDSTU=
X-Received: by 2002:a6b:8e56:: with SMTP id q83mr17709001iod.61.1593879930979; 
 Sat, 04 Jul 2020 09:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-27-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-27-f4bug@amsat.org>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Sat, 4 Jul 2020 09:25:20 -0700
Message-ID: <CADBGO7832C0Rw+RbZBRuDAGGtwhk9RV+bHVBHe+EXxLupbqfig@mail.gmail.com>
Subject: Re: [PATCH 26/26] MAINTAINERS: Cover dwc-hsotg (dwc2) USB host
 controller emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000019cac205a9a017dd"
X-Mailman-Approved-At: Sun, 05 Jul 2020 04:26:02 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <rth@twiddle.net>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--00000000000019cac205a9a017dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2020 at 7:50 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Add an section for the dwc2 host controller emulation
> introduced in commit 153ef1662c.
>
> Cc: Paul Zimmerman <pauldzim@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2566566d72..e3f895bc6e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1651,6 +1651,12 @@ M: Samuel Thibault <samuel.thibault@ens-lyon.org>
>  S: Maintained
>  F: hw/usb/dev-serial.c
>
> +USB dwc-hsotg (dwc2)
> +M: Gerd Hoffmann <kraxel@redhat.com>
> +R: Paul Zimmerman <pauldzim@gmail.com>
> +S: Maintained
> +F: hw/usb/*dwc2*
> +
>  VFIO
>  M: Alex Williamson <alex.williamson@redhat.com>
>  S: Supported


Acked-by: Paul Zimmerman <pauldzim@gmail.com>


> --
> 2.21.3
>
>

--00000000000019cac205a9a017dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Jul 4, 2020 at 7:50 AM Philippe Mathieu-Daud=C3=A9 =
&lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Add an section for the dwc2 host control=
ler emulation<br>
introduced in commit 153ef1662c.<br>
<br>
Cc: Paul Zimmerman &lt;<a href=3D"mailto:pauldzim@gmail.com" target=3D"_bla=
nk">pauldzim@gmail.com</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 2566566d72..e3f895bc6e 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -1651,6 +1651,12 @@ M: Samuel Thibault &lt;<a href=3D"mailto:samuel.thib=
ault@ens-lyon.org" target=3D"_blank">samuel.thibault@ens-lyon.org</a>&gt;<b=
r>
=C2=A0S: Maintained<br>
=C2=A0F: hw/usb/dev-serial.c<br>
<br>
+USB dwc-hsotg (dwc2)<br>
+M: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank=
">kraxel@redhat.com</a>&gt;<br>
+R: Paul Zimmerman &lt;<a href=3D"mailto:pauldzim@gmail.com" target=3D"_bla=
nk">pauldzim@gmail.com</a>&gt;<br>
+S: Maintained<br>
+F: hw/usb/*dwc2*<br>
+<br>
=C2=A0VFIO<br>
=C2=A0M: Alex Williamson &lt;<a href=3D"mailto:alex.williamson@redhat.com" =
target=3D"_blank">alex.williamson@redhat.com</a>&gt;<br>
=C2=A0S: Supported</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto=
">Acked-by: Paul Zimmerman &lt;<a href=3D"mailto:pauldzim@gmail.com">pauldz=
im@gmail.com</a>&gt;</div><div dir=3D"auto"><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><br>
-- <br>
2.21.3<br>
<br>
</blockquote></div></div>

--00000000000019cac205a9a017dd--

