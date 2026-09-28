Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9222AC9832F
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 08:08:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435739.1654524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB6Pk-0000AD-MJ; Mon, 28 Sep 2026 08:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435739.1654524; Mon, 28 Sep 2026 08:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB6Pk-0000A3-JW; Mon, 28 Sep 2026 08:08:44 +0000
Received: by outflank-mailman (input) for mailman id 1435739;
 Mon, 28 Sep 2026 08:08:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewprecious388@gmail.com>) id 1xB6Pj-00009v-3A
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 08:08:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB6Pi-00FH0o-GB
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 10:08:42 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6aba207a-8faa-0a2a0a5109dd-0a2a45098558-42
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 10:08:42 +0200
Received: from [74.125.229.170] (helo=mail-dl2-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6aba2088-be1a-0a2a45090019-4a7de5aaa2d8-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 10:08:42 +0200
Received: by mail-dl2-f42.google.com with SMTP id
 a92af1059eb24-144e32aaa1cso1472778c88.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 01:08:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1790582920; cv=none;
        d=google.com; s=arc-20260327;
        b=EtDwyrMfcyWlCKSokxvNUTuWyqkXLTR/ChE3KcgOBSNrhS/EkX2QscC4dRYyRESECz
         anQ1WFAQZwMDxHjQauqvAxTq4Krt28PpVx5jIGxNPrztLaa1XQJkuGzIGzrbvWONbhH+
         6oqC7cWw1Ye1BWCCgVQLUvs8PIcoz0AS8PmC2+RhuwhOf48yx5+TpS9Uuw5Iz213rha0
         otPT+dLX0ciU6Ts1KxG4BrUwBRvhSjQiirdNf17VjhQ2N87oA7df974QWDWZ+iXy/zAa
         tEkqu/vHoL5VBnHNBJBfhm3DbAMjGOfRyn7u97CqL4jZlFjtQS2Qu44hQU2BgXDRIXpD
         NKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CUH9DC8D35xTowIT4lolyJrNK0/lvV7rYDhSa0knUts=;
        fh=dPy7QBf/9o5W9g82yvkNJlgbMjV4luS1EvQbQLsWpBI=;
        b=Nmt6++VOpNIRjjiQ1ryObbz/m73bBD5qppN+gzbHi9a+M60Tob95S4PLjXWs48DAUY
         dy1QiiMBTl2MH4s8WmFbUJvMQxg8hmg3uFllhC3RyFGihvJjuxXAJkWatudg5/UUJjim
         VPPxr+PJGBL1RwFE85C7+HApP/msznGgsxodlmOs2IvnS1yUT6SjDDtkiJgghdntLHfD
         v9/UJ6pPd7TTGk6xRLjXTxIkI95n6Eyz7ExkGtds027vpX/KJZkFuEDqEEAhvFiTRa1q
         HpU+DELEV6T3362ZsSkINKgdy35xZ0ZoPPjAiTLjcQTLMx03vVi5brArQDUN/8hXOnx4
         jLxw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790582920; x=1791187720; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUH9DC8D35xTowIT4lolyJrNK0/lvV7rYDhSa0knUts=;
        b=CsieWwvafXKq9EfKRgFJRQzNDj2+oDlliyfu2skkRZM3wx9/Z8YnlNmPdUYJW/v3Nn
         zDIia4Zn70Ntg6NyCTLmvNnqcsLzMuEt10LL4v9FnnfnEniRbMNwHE+Ro3W6TPhGbFAQ
         1kiPZEnlFCM8MqPEQVS4MiKVET89DEXcVDErUsBX2SHEE97gPBumN00a4bC2ZMU5uLNo
         aZaa4ZQVhIcR61bjfAM5BDeuoqdHPWEsGq7aC4tRKfJRKzpQtp2Y8EwfiY3W0ukeq96b
         mY2O0fd95TUo1v7U0rLrJNhUHeej+a9Ylv70QlN6viZFYr+WTwa1/VQMF6O40RsfD3iU
         8vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582920; x=1791187720;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CUH9DC8D35xTowIT4lolyJrNK0/lvV7rYDhSa0knUts=;
        b=D2KItpy1kzdrjCFhwEBKgs80KvdfAecfpTt9JriHAoZSj7ozNqe8pDK7eBND6XxuyV
         JefJEshtuqruVfDeRiKALjvPuP9ChTQBueLdMkrrz/rMBK4Ixs+x6wrXFRCb5lRr6IYj
         MxTICZ9bnDiCJ3Z69J4UkkCJXT62AKosmkRhw8Ais3GPetuKDA31WyLW5t0+1EnCk+kp
         7WJWWJn2Up4q+gd2RARwoCOvWKo/1hzcJjsaiLm9X0dWPoq4HJsYzTDZsYZxBU30AKpV
         omncCJDNFCSxRZCuaNtpJ3f8JVrjtOBW9zG94LTz4oXMk1/zzru5QTxk7jFRYq+mM08L
         iRKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgHBD8ppNk/fGznewm+W4N0okVBX5HFOz4YZAVgWfc8SXtHCzGetfuVNWtODqPFbI4RVvdCJBmyCM=@lists.xenproject.org
X-Gm-Message-State: AFuF++l61+yrJ7eipkVbyf0aOwQp2SnV3e3CCtw8yz8LgXXMYrVhH1lZ
	GllHI3AklZnk9c7AAcakMWMCwXwA2JX7MoiCf2wndGX3JSSKSzWtUgKjeR9gE0/d1djEEvha/5X
	XPIktJplwZuf05f/f3t8XqK2/sa6b8HA=
X-Gm-Gg: AYBFou3ZXGxKgD6uvZyD0UG1W0XfKbX4/PakeRn33Egrf7PqSVpuSMvx47yWjFS+tqN
	C675yC69mReNsK/PchWBcQ+PaZx12a8QQLMOfSiJlztTUwSxM1DlbI+iXzVnTaK8PcWM850PTq4
	Q2da/Ov4terr63PamKue873WOAItN0O0Ib5Fzxty3T1RAUYl2p2MlVyrTt0ycI5zCTye6Czx231
	zlm3m2hJaaJrPxIHspk1Tg/i6xdwH2ymJWEmoCdSN5hAKMEds5HtTcVryyiCd3o6VPl+XGTkOxG
	ngOknxD0F624kAFukDIOW0Ikevi8nfgakm4nFMwKZA+pW8gBX1Kxh8fchU15b8H2+w==
X-Received: by 2002:a05:7022:282:20b0:137:e6a1:c4b3 with SMTP id
 a92af1059eb24-146cb31206dmr8213453c88.0.1790582919824; Mon, 28 Sep 2026
 01:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260924122403.214738-1-andrewprecious388@gmail.com> <8cbdcbf9-4ac4-4bb3-8b1a-c61550a92bb4@suse.com>
In-Reply-To: <8cbdcbf9-4ac4-4bb3-8b1a-c61550a92bb4@suse.com>
From: Andrew Precious <andrewprecious388@gmail.com>
Date: Mon, 28 Sep 2026 11:08:28 +0300
X-Gm-Features: AclHuK_7NxGx0uh4IxUDTJmmV9l4APtuH07OEV1hqYV1SHQdOc8X_9xA3tRturw
Message-ID: <CAF14T9nAFZMCwN7tHy7_Gtkza3Xh_sYnKMjemXOFEOMH+9vaRA@mail.gmail.com>
Subject: Re: [PATCH] xen/common: fix MISRA R7.2 violations in crc32/unlzma/bunzip2
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, michal.orzel@amd.com, 
	julien@xen.org, roger@xenproject.org, sstabellini@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000e088ac065c869224"
X-purgate-ID: tlsNG-bad1c0/1790582922-FDA6E034-878F6D71/0/0
X-purgate-type: clean
X-purgate-size: 4888

--000000000000e088ac065c869224
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Won't the lack of full misra rules compliance(even for linux code) hinder
Xens' security certification process?

Though I do understand the amount of work needed to clean imported code &
still make sure that it's as close as possible to the original


On Thu, Sep 24, 2026 at 4:32=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 24.09.2026 14:24, Andrew Mbugua wrote:
> > Adding the U suffix. No functional change.
> >
> > MISRA C Rule 7.2 demands a "u" or "U" suffix on all
> > integer constants with unsigned type. On 32-bit int targets
> > constants >=3D 0x80000000 (e.g. 0xEDB88320, 0xFFFFFFFF,
> > 0x80000000, 0x04C11DB7) must be written explicitly unsigned.
>
> 0x04C11DB7 is small enough to be okay without suffix. Adding one
> nevertheless
> is fine, but the description wants to be correct.
>
> Furthermore, rule 7.2 is clean as per tagging.ecl. As per exclude-list.js=
on
> common/bunzip2.c, common/un*.c, and common/xz/* are excluded from scannin=
g.
> The fact that the change is benign to our present scanning status imo als=
o
> wants expressing in the description.
>
> And then there is the question whether we want to fiddle with these files
> in
> the first place, when really we'd prefer them to stay as closely in sync
> with
> their originals as possible.
>
> > --- a/xen/common/bunzip2.c
> > +++ b/xen/common/bunzip2.c
> > @@ -650,7 +650,7 @@ static int __init start_bunzip(struct bunzip_data
> **bdp, void *inbuf, int len,
> >       for (i =3D 0; i < 256; i++) {
> >               c =3D i << 24;
> >               for (j =3D 8; j; j--)
> > -                     c =3D c&0x80000000 ? (c << 1)^0x04c11db7 : (c << =
1);
> > +                     c =3D c&0x80000000U ? (c << 1)^0x04c11db7U : (c <=
<
> 1);
>
> Please (if we go with fiddling with these files) can you also add the
> missing blanks around & and ^ at this occasion?
>
> Jan
>

--000000000000e088ac065c869224
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Won&#39;t the lack of full misra rules compliance(even for=
 linux code) hinder Xens&#39; security certification process?<br><br>Though=
 I do understand the amount of work needed to clean imported code &amp; sti=
ll make sure that it&#39;s as close as possible to the original<br><br></di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Sep 24, 2026 at 4:32=E2=80=AFPM Jan Beulich &lt;<=
a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On 24.09.2026 14:24, A=
ndrew Mbugua wrote:<br>
&gt; Adding the U suffix. No functional change.<br>
&gt; <br>
&gt; MISRA C Rule 7.2 demands a &quot;u&quot; or &quot;U&quot; suffix on al=
l<br>
&gt; integer constants with unsigned type. On 32-bit int targets<br>
&gt; constants &gt;=3D 0x80000000 (e.g. 0xEDB88320, 0xFFFFFFFF,<br>
&gt; 0x80000000, 0x04C11DB7) must be written explicitly unsigned.<br>
<br>
0x04C11DB7 is small enough to be okay without suffix. Adding one neverthele=
ss<br>
is fine, but the description wants to be correct.<br>
<br>
Furthermore, rule 7.2 is clean as per tagging.ecl. As per exclude-list.json=
<br>
common/bunzip2.c, common/un*.c, and common/xz/* are excluded from scanning.=
<br>
The fact that the change is benign to our present scanning status imo also<=
br>
wants expressing in the description.<br>
<br>
And then there is the question whether we want to fiddle with these files i=
n<br>
the first place, when really we&#39;d prefer them to stay as closely in syn=
c with<br>
their originals as possible.<br>
<br>
&gt; --- a/xen/common/bunzip2.c<br>
&gt; +++ b/xen/common/bunzip2.c<br>
&gt; @@ -650,7 +650,7 @@ static int __init start_bunzip(struct bunzip_data =
**bdp, void *inbuf, int len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 256; i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c =3D i &lt;&lt;=
 24;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 8; j;=
 j--)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0c =3D c&amp;0x80000000 ? (c &lt;&lt; 1)^0x04c11db7 : (c &lt;&lt; 1);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0c =3D c&amp;0x80000000U ? (c &lt;&lt; 1)^0x04c11db7U : (c &lt;&lt; 1=
);<br>
<br>
Please (if we go with fiddling with these files) can you also add the<br>
missing blanks around &amp; and ^ at this occasion?<br>
<br>
Jan<br>
</blockquote></div>

--000000000000e088ac065c869224--

