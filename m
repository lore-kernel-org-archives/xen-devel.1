Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6303C61DD3
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 12:08:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404722.1638415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1NHF-00012q-Nh; Tue, 01 Sep 2026 12:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404722.1638415; Tue, 01 Sep 2026 12:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1NHF-00012j-KK; Tue, 01 Sep 2026 12:07:45 +0000
Received: by outflank-mailman (input) for mailman id 1404722;
 Tue, 01 Sep 2026 12:07:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewprecious388@gmail.com>) id 1x1NHE-00012d-Hx
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 12:07:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1NHD-008Aqp-4g
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 14:07:43 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6a96c00b-8faa-0a2a0a5109dd-0a2a4503c66c-4
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 14:07:42 +0200
Received: from [209.85.216.47] (helo=mail-pj1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6a96c00d-fae8-0a2a45030019-d155d82faddb-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 14:07:42 +0200
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-3964dfb5a69so5539213a91.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 05:07:42 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1788264459; cv=none;
        d=google.com; s=arc-20260327;
        b=hxEGPCqgTyRvEQu6tw/Z19mtIXGCfQNzzCbYE8TXMvTzmTEGxAhZV7LL/wkVWpCuZI
         KytjxTQC6QNK58ArMd5dXlbnfr40ozVc2O/tcjJfHpIQlL/Ov/Z7u3ewH0zL3mETTCay
         NxVILfn2MfCnc2LXLyokSG7flCt4BCCouFtKIdy9xBEi3bqAXLol/2AWKex3zRODD78h
         TakgPBapweCTt3DxpNY6y4ifj6V/tms7T3/kkLpHMG0Ei33I5sPuV9Wwk68cyikGZpO7
         om9Yh3uDB6j4ay8w2eRf2wOcF3hNzsf5sbJBLa2Ate82z9gZ1/4JJo5JJ/4esAxcFZU/
         UxQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xLtE8fa0CCYs8f89x0z6yjpC0T3F/CEkk97riHXdv2o=;
        fh=otpr6U4PuVZ9BZlj6EokwtOMbvR2IUSgfzEtVbeKrWM=;
        b=ArDWPs4E1bJzXJvuc6cnklrPf/d3V8Zg0nf9vWQZmzcEwHAkuxQGq+bfgtP73ZKkXA
         8j5Z8quFiItOinpEc91UUQHHsgFzjPLRIDroFnmlsr0xgpWxhcVgAjk7Zb95TspuPZVk
         H+x3Jy7zSMtP8Tt5Wmj9NqHLEusRKAOc8UoXxFG3yUTQMuutpKi2VBy2qNpM6g1R5vCI
         iVcDwjZHj7RBFoIJSt1UBXTbAf6OZkmMCnbZu0d2NTE0SmpHPdNdkndkLjWmmas85U83
         OT2lRda8kPX+b5VNmBAMmBP+dBO64aBMF2AEy01tJi1qnowU4mNOKzQgqjv0m6N+WY0P
         dSLg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788264459; x=1788869259; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xLtE8fa0CCYs8f89x0z6yjpC0T3F/CEkk97riHXdv2o=;
        b=Kp3DqwLhnQ7uMRqMMVTIrsCxyMY+WXyLfhe8pURhPEcjBxLWXTrv7Hg58Zr0hU+gHY
         C3dcFvrH0E6HTXOV6RhmWNTrw114JfW+eRaZoexmiCXRApR1oCrR8yetLT/uo9Mg43Pq
         ZgafQGkwpc6xTM15d0dZO9PujCyLzRobhjedo6Kwpo7Ve9gwopXoCm3068gUD8LwalKt
         caj9JHZrCjbc4bXv1lzxs08/19j2O9RxbS6q8wqXz0ttIkN3a+F6mJIblNZxyZ+Tv/6q
         T6CG6GHu3bJmIdXmiDMfy0UYMn0/GcQOD7uzxoLTeh7VP2kEnZNXkpn0nAHddtpm3pr7
         e7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788264459; x=1788869259;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xLtE8fa0CCYs8f89x0z6yjpC0T3F/CEkk97riHXdv2o=;
        b=Be/zTrps2T/w71eGcD09sIyvrgwbtptAwz/xztQBGB2/yzwiO97gkhuXYPrTDglujt
         r87iLZlDg8FMn//xbG5Mgv8/sg1c5wt0THz4h0TsmmYxscKDq+uFcwvmQrSKl/cbAL7e
         7GDvfPxBY1mB9vuKg77jv4DQNvJ7l6jElHiS+q21VS+L38Af/lyc7Fa2ODvOZjEmvjth
         ZrLVnf6ZJfAKo2TSbpUA8nBpt54ciR13gnGr2cOveJ4MZw/ZPQ3+EBdRImHSVOY9LBsI
         p3waGcVOsfotxFxiCAoloTOT5IYfb4fDcvLp+n5P4EOi3HZPgtkUUe9HztAQo9ZQxJnJ
         hQIw==
X-Forwarded-Encrypted: i=1; AKwUvBwFbszFW8yEi4t19+Q9p+aVyZ4xROZhs7bnPb/PXuxd7gsqmHW84m0laJ4nfc+mi8555ELoH/DDgAA=@lists.xenproject.org
X-Gm-Message-State: AFuF++m7S6fh66/RwPAQfRYhFwIHPpHnFCYhhfGx1IAV48pv2CrQT1vV
	DX1AsYUTpRkgE2shoO1Tr6XYCdawIjfyueGd79ewkyDNj2YBcs8V5WBOcJnQjForEJLSm4w2fJW
	wijs0s7z9JtFmQDEQ0bmxFt54s+NOcHg=
X-Gm-Gg: AYBFou0hIvkMEZADL7AbKI38w+ukhNsssUTyhcS3pyZIT7g2AM128ieIOWCOIOPHb5N
	JzYuJVLCZ78KKcWO03SQmLBJbcrA671D/jUkZSnf0WDJm4Q6GTdMPZ2l0Omz1cJU2cWbfCipIE1
	KDgmbAJyfhfqHmYz3nJgNS9F/Lu1pMpaFKlIPbCB8GEEjlA5T2EM1s6FcZtIl6LStFcCtiuc7YS
	7nS56YNDj17rUHVsmCy/8OkHNPrMq91a6OiBZdNTUajajyARldptUSU3ONCA+0R/znr+UST9AK9
	5ojHNlnCJEtcDdvxOj+aLbAlcF2qXq3CS0kpuD/c2N8=
X-Received: by 2002:a17:90b:3849:b0:398:9be8:ea64 with SMTP id
 98e67ed59e1d1-39907e64255mr10696318a91.17.1788264458485; Tue, 01 Sep 2026
 05:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260825184605.79318-1-andrewprecious388@gmail.com> <22091019-92ea-4de5-b470-2eb40d819dd1@suse.com>
In-Reply-To: <22091019-92ea-4de5-b470-2eb40d819dd1@suse.com>
From: Andrew Precious <andrewprecious388@gmail.com>
Date: Tue, 1 Sep 2026 15:07:26 +0300
X-Gm-Features: AcwNN1VdrC4l3ob9NTTImsBJPzmtP5J40m9j3_bpLKuCABpc8aoDBlS-3N4StVA
Message-ID: <CAF14T9=mjBE6uREhtJq650qbdJSVqmuMB+9zuE+QZuPwEKjqRA@mail.gmail.com>
Subject: Re: [PATCH] stubdom: Fix GCC 14 -Wmemset-elt-size compiler warnings
 in PolarSSL
To: Jan Beulich <jbeulich@suse.com>
Cc: jgross@suse.com, samuel.thibault@ens-lyon.org, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000d00357065a6ac394"
X-purgate-ID: tlsNG-33051d/1788264462-6FEC24E9-62B77182/0/0
X-purgate-type: clean
X-purgate-size: 6524

--000000000000d00357065a6ac394
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was at first deliberating whether to send further patches because the
current successor of PolarSSL is MbedTLS. Polarssl is now legacy & not
maintained(polarssl was acquired by ARM).
Options:
1. Continual patching/maintaining a legacy library.
2. Upgrade to MbedTLS which will require alot of API changes.

On Wed, Aug 26, 2026 at 9:33=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 25.08.2026 20:46, Andrew Mbugua wrote:
> > When compiling Xen with GCC 14, I get a compiler warning originating
> from the /polarssl-x86_64/library about a memset element size mismatch:
> >
> > ssl_tls.c: In function =E2=80=98ssl_session_reset=E2=80=99:
> > ssl_tls.c:1778:5: warning: =E2=80=98memset=E2=80=99 used with length eq=
ual to number of
> elements without multiplication by element size [-Wmemset-elt-size]
> > 1778 |     memset( ssl->ctx_enc, 0, 128 );
> > |     ^~~~~~
> > ssl_tls.c:1779:5: warning: =E2=80=98memset=E2=80=99 used with length eq=
ual to number of
> elements without multiplication by element size [-Wmemset-elt-size]
> > 1779 |     memset( ssl->ctx_dec, 0, 128 );
> > |     ^~~~~~
> >
> > This patch introduces a build-time patch to PolarSSL that replaces the
> hardcoded 128 byte length with a dynamic sizeof(), thus allowing clean
> compilation without warnings.
>
> First a formal note: Commit messages want limiting to 75 characters per
> line (some even say 72).
>
> Then: You introduce a patch which isn't used anywhere. What use is such
> a patch? You also ...
>
> > Signed-off-by: Andrew Mbugua <andrewprecious388@gmail.com>
> > ---
> >  stubdom/patches/polarssl-gcc14-memset.patch | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >  create mode 100644 stubdom/patches/polarssl-gcc14-memset.patch
>
> ... introduce it in a new patches/ subdir, when all other patches live
> right beneath stubdom/.
>
> > --- /dev/null
> > +++ b/stubdom/patches/polarssl-gcc14-memset.patch
> > @@ -0,0 +1,13 @@
> > +--- a/library/ssl_tls.c
> > ++++ b/library/ssl_tls.c
> > +@@ -1775,8 +1775,8 @@
> > +     memset( ssl->iv_dec, 0, 16 );
> > +     memset( ssl->mac_enc, 0, 32 );
> > +     memset( ssl->mac_dec, 0, 32 );
> > +-    memset( ssl->ctx_enc, 0, 128 );
> > +-    memset( ssl->ctx_dec, 0, 128 );
> > ++    memset( ssl->ctx_enc, 0, sizeof( *ssl->ctx_enc) );
> > ++    memset( ssl->ctx_dec, 0, sizeof( *ssl->ctx_dec) );
>
> Don't you mean sizeof(ssl->ctx_enc) and sizeof(ssl->ctx_dec) respectively=
?
> Otherwise it looks like you're making a bad situation worse.
>
> Judging from surrounding style, there also looks to be a blank missing
> each,
> ahead of the new inner closing parenthesis.
>
> Jan
>

--000000000000d00357065a6ac394
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was at first deliberating whether to send further patche=
s because the current successor of PolarSSL is MbedTLS. Polarssl is now leg=
acy &amp; not maintained(polarssl was acquired by ARM).<br>Options:<br>1. C=
ontinual patching/maintaining a legacy library.<br>2. Upgrade to MbedTLS wh=
ich will require alot of API changes.<br></div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug =
26, 2026 at 9:33=E2=80=AFAM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse=
.com">jbeulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On 25.08.2026 20:46, Andrew Mbugua wrote:<br>
&gt; When compiling Xen with GCC 14, I get a compiler warning originating f=
rom the /polarssl-x86_64/library about a memset element size mismatch:<br>
&gt; <br>
&gt; ssl_tls.c: In function =E2=80=98ssl_session_reset=E2=80=99:<br>
&gt; ssl_tls.c:1778:5: warning: =E2=80=98memset=E2=80=99 used with length e=
qual to number of elements without multiplication by element size [-Wmemset=
-elt-size]<br>
&gt; 1778 |=C2=A0 =C2=A0 =C2=A0memset( ssl-&gt;ctx_enc, 0, 128 );<br>
&gt; |=C2=A0 =C2=A0 =C2=A0^~~~~~<br>
&gt; ssl_tls.c:1779:5: warning: =E2=80=98memset=E2=80=99 used with length e=
qual to number of elements without multiplication by element size [-Wmemset=
-elt-size]<br>
&gt; 1779 |=C2=A0 =C2=A0 =C2=A0memset( ssl-&gt;ctx_dec, 0, 128 );<br>
&gt; |=C2=A0 =C2=A0 =C2=A0^~~~~~<br>
&gt; <br>
&gt; This patch introduces a build-time patch to PolarSSL that replaces the=
 hardcoded 128 byte length with a dynamic sizeof(), thus allowing clean com=
pilation without warnings.<br>
<br>
First a formal note: Commit messages want limiting to 75 characters per<br>
line (some even say 72).<br>
<br>
Then: You introduce a patch which isn&#39;t used anywhere. What use is such=
<br>
a patch? You also ...<br>
<br>
&gt; Signed-off-by: Andrew Mbugua &lt;<a href=3D"mailto:andrewprecious388@g=
mail.com" target=3D"_blank">andrewprecious388@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 stubdom/patches/polarssl-gcc14-memset.patch | 13 +++++++++++++<b=
r>
&gt;=C2=A0 1 file changed, 13 insertions(+)<br>
&gt;=C2=A0 create mode 100644 stubdom/patches/polarssl-gcc14-memset.patch<b=
r>
<br>
... introduce it in a new patches/ subdir, when all other patches live<br>
right beneath stubdom/.<br>
<br>
&gt; --- /dev/null<br>
&gt; +++ b/stubdom/patches/polarssl-gcc14-memset.patch<br>
&gt; @@ -0,0 +1,13 @@<br>
&gt; +--- a/library/ssl_tls.c<br>
&gt; ++++ b/library/ssl_tls.c<br>
&gt; +@@ -1775,8 +1775,8 @@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0memset( ssl-&gt;iv_dec, 0, 16 );<br>
&gt; +=C2=A0 =C2=A0 =C2=A0memset( ssl-&gt;mac_enc, 0, 32 );<br>
&gt; +=C2=A0 =C2=A0 =C2=A0memset( ssl-&gt;mac_dec, 0, 32 );<br>
&gt; +-=C2=A0 =C2=A0 memset( ssl-&gt;ctx_enc, 0, 128 );<br>
&gt; +-=C2=A0 =C2=A0 memset( ssl-&gt;ctx_dec, 0, 128 );<br>
&gt; ++=C2=A0 =C2=A0 memset( ssl-&gt;ctx_enc, 0, sizeof( *ssl-&gt;ctx_enc) =
);<br>
&gt; ++=C2=A0 =C2=A0 memset( ssl-&gt;ctx_dec, 0, sizeof( *ssl-&gt;ctx_dec) =
);<br>
<br>
Don&#39;t you mean sizeof(ssl-&gt;ctx_enc) and sizeof(ssl-&gt;ctx_dec) resp=
ectively?<br>
Otherwise it looks like you&#39;re making a bad situation worse.<br>
<br>
Judging from surrounding style, there also looks to be a blank missing each=
,<br>
ahead of the new inner closing parenthesis.<br>
<br>
Jan<br>
</blockquote></div>

--000000000000d00357065a6ac394--

