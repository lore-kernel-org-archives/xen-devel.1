Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3AEC5518F
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 10:08:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382072.1625471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrC3p-0006nT-0Y; Tue, 04 Aug 2026 10:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382072.1625471; Tue, 04 Aug 2026 10:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrC3o-0006nM-To; Tue, 04 Aug 2026 10:07:48 +0000
Received: by outflank-mailman (input) for mailman id 1382072;
 Tue, 04 Aug 2026 10:07:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wrC3n-0006m1-BM
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 10:07:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wrC3n-004jQy-12
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 10:07:47 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wrC3m-008pHX-3C
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 10:07:47 +0000
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5b0115b9e17so4162282e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 03:07:46 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version;
	bh=7lDpe5KpYW9iI4a2Xe0Pg6NsMRjTcXcMnAiS1mu0Vls=; b=JbwKGZd17ljrw8I//uuoj7CGRE
	KdEOaH78F3fFlhf6k2ZK1BfNh8OlYw0JcGQyk+Chrhw2zEZKZxKl21d64OgNM96QefI9UtbGyhK6f
	cJnlP4PGcgQfsdi+gl1z+vY28zm/X83YMzlCjv8vGUV3FtJq3ukiAUvCtXmvwfLLyPrE=;
X-Forwarded-Encrypted: i=1; AHgh+Ro0+x7AwDURAINbyKABqtZ6Y+8yIBR+L8UBhJ+jq8/jcKUEVcyet+0yxkDbI9j4ENaE9IxIGPhXc5k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweBcrIgDyxzRZ5V6pw9buCDKIHueRAELl39n5tXTcjX029yauT
	ow1AEOamgRcsyaJzeJssi+reaV7DQfG82bdyKKo5OP09hN7+3V7U0wauGNLV9jlw1jM/rTcyjdt
	zEB/8S8hGtFALesqnbVLJ3XUKP/aLUOY=
X-Received: by 2002:a05:6512:3ba3:b0:5ae:b36d:bb1 with SMTP id
 2adb3069b0e04-5b2e4f1a62cmr3090684e87.4.1785838065938; Tue, 04 Aug 2026
 03:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAFLBxZZLYxk4ZZZ9++B9qRn_J8X6ochbHr4037mbC8sDfsRqDA@mail.gmail.com>
 <61b9c9fb-3d97-4480-8171-bce986e698a8@suse.com>
In-Reply-To: <61b9c9fb-3d97-4480-8171-bce986e698a8@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Tue, 4 Aug 2026 20:07:33 +1000
X-Gmail-Original-Message-ID: <CAFLBxZacKKXosB3D5V0ahVWCWm76pkQBE6j80_UV--YHt44M8w@mail.gmail.com>
X-Gm-Features: AUfX_mzEH8wS0lJD_7rm_YVid-q_Smc21r0QSHW0rIMTEvJCLS_nLYGxc5SGcCQ
Message-ID: <CAFLBxZacKKXosB3D5V0ahVWCWm76pkQBE6j80_UV--YHt44M8w@mail.gmail.com>
Subject: Re: Linux PV domU with >1 vCPU never resumes after xl save/restore
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000008bf724065835d353"

--0000000000008bf724065835d353
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 6:02=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:

> On 04.08.2026 08:12, George Dunlap wrote:
> > Saving and restoring a multi-vcpu PV guest appears to have been broken =
in
> > Linux for some time (observed 6.6.56 and 6.12.86).  Report below from
> > Claude Fable; I've independently verified the behavior on vanilla Linux
> > 6.6.56.  Claude seems to think it's a bug in Linux.
>
> Just to double check, as there was a crucial fix there recently: This is
> with
> a Xen including bedbc17d8407 ("x86/domctl: restore all registers in
> arch_{get,set}_info_guest()")?
>

Ah, yes, that seems to have done the trick.  Sorry for he noise.

 -George

--0000000000008bf724065835d353
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 4, =
2026 at 6:02=E2=80=AFPM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com=
">jbeulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 04.08.2026 08:12, George Dunlap wrote:<br>
&gt; Saving and restoring a multi-vcpu PV guest appears to have been broken=
 in<br>
&gt; Linux for some time (observed 6.6.56 and 6.12.86).=C2=A0 Report below =
from<br>
&gt; Claude Fable; I&#39;ve independently verified the behavior on vanilla =
Linux<br>
&gt; 6.6.56.=C2=A0 Claude seems to think it&#39;s a bug in Linux.<br>
<br>
Just to double check, as there was a crucial fix there recently: This is wi=
th<br>
a Xen including bedbc17d8407 (&quot;x86/domctl: restore all registers in<br=
>
arch_{get,set}_info_guest()&quot;)?<br></blockquote><div><br></div><div><sp=
an style=3D"background-color:transparent">Ah, yes, that seems to have done =
the trick.=C2=A0 Sorry for he noise.</span></div><div><span style=3D"backgr=
ound-color:transparent"><br></span></div><div><span style=3D"background-col=
or:transparent">=C2=A0-George=C2=A0</span></div></div></div>

--0000000000008bf724065835d353--

