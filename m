Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82EEC5B572
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 07:59:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390908.1631021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wumpF-0003wd-Uy; Fri, 14 Aug 2026 07:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390908.1631021; Fri, 14 Aug 2026 07:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wumpF-0003wW-S7; Fri, 14 Aug 2026 07:59:37 +0000
Received: by outflank-mailman (input) for mailman id 1390908;
 Fri, 14 Aug 2026 07:59:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewprecious388@gmail.com>) id 1wumpE-0003wQ-NX
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 07:59:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wumpD-001yFf-QU
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 09:59:35 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6a7ecadd-bab6-0a2a0a5309dd-0a2a450288ae-26
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 09:59:35 +0200
Received: from [209.85.215.175] (helo=mail-pg1-f175.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6a7ecae6-6ca4-0a2a45020019-d155d7afd5bd-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 09:59:35 +0200
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-ca7c1176317so582976a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 00:59:35 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1786694373; cv=none;
        d=google.com; s=arc-20260327;
        b=C0cdHd/swJJP1NfdKBcDZkibSwG6xPTitxCmXdx+gdXrWR8s1IwY5K2M0zS8tOKVaV
         4ArttC6DFVZgs8DH0N8AXcujV9/t6Mq9zHMBeAJ8V0xpqBbHlrmby9rvakiXW+e6UQS9
         b2AyAV1KcigZqPH3BOFDkztv6RHQkKxs98wo/DQKfFkSmxaxbPv4eCUBfwJYJUxaXKkz
         akwjpJ1GTA+XNP0gcYVZxrP4c/AVHUyzZnNgRydqOLERN55E6BOegP+KST3QOdSJJjqC
         V9uW51GLaEaoVI8cRLPcKYeOW51Kd8SxA+8Hd577wFH/ulHFxCTkNj1yqCcEHmhI8Xh3
         YcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fRktlHtqQOXAxFnJpAxi5xc9vkIb0dW+AHLsSX4rpLU=;
        fh=UpFTLnCwSi0lAZgmDcfXF/u4JodY0u9pjARRJLeoR/A=;
        b=VAk9zbbEFiTUiTZLzMVPXYeh19OVoMK9ZmsU8ttZF49ySQx0sbz1HS/rtQL/N00tzq
         lkLq2Mnn+eR+IzNZv9g9K22J9wrFtRHKzPkXkEqx1jbjoYIEn2FLsWyftphL/g0QFdOT
         ToUT6K3k/zSKVnhdjzdkZJAy+1FVcWrFzvDt0an7wwcajxW7xmAGvsVAg8/0s4niEooO
         k+W0eUXg8Z+asLUfg+BSN/fHftFB01SA1R2jzde3gMgw7ZvTF02iBeuaSAHp/KqNNCBC
         3NZPPbtpkbTvWA7UT8wCrXJa0zGv5JpwKHZTsvyi9FlMfqV1Tc8wSG+cI4YQKNcaKa/f
         wmLA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786694373; x=1787299173; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fRktlHtqQOXAxFnJpAxi5xc9vkIb0dW+AHLsSX4rpLU=;
        b=sJBoCPYpMellz1DPEQcW1deS/aLkNuo7vF4yHJ5qpTP1c7RC3VRVTq828UJfnuGHto
         9PAcPMIoW2+lihK3654rmZUqDR9WvDFOy4J7FIM8Y/cpEnW6bmzoIwXxguJsU1g8tjMJ
         2WmSqC+HBINueo9tON1TP7gTC8LtITWR9quqX6+jnDz/CmXQ4bzZBZuMMMwyYGiHFJrH
         WK/QdD2CBht4q84M7SJstKYOEEjmBoin6A9oTkqMGcvajR1656d2mukZjpGfKt95db1F
         d6hGzSaEgHRaSbdUQTe5CIBVHmfPyvyD2ua0W8Z9e3RePHFH5YZB4bb76OlwmXs+DQMu
         e1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786694373; x=1787299173;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fRktlHtqQOXAxFnJpAxi5xc9vkIb0dW+AHLsSX4rpLU=;
        b=IkX48wW8vW5PGdGrCXiIt/GEJKb/OM3x8ESoAVqBZQ1/zj9O0f5IAX0Mji/ZjFN8oD
         mepvYJCEM8W9CprN6tBixwNW//HiILBz24cD4J6I2xUpTn6e6bspRQLxlQqbYA8HQSWZ
         R+20DcF1up1xWqzuP3/PAGeT/rgshBqZF6J4TgVk0TUGZW0Z+g63OwBa9TULQ2vmZhkm
         eW0vngTZrVZr2LyXcPCtUZNfIt/a/ClKMLV1dyJB8rED1lpjJbh+clD+crGy1sz/2ldM
         i5GyTPIhwbAkiaHAKfYQWoaUbrnS0hqMKJf+4+pK11mArCVgFVC1g50AUoUXtUp7pJQz
         X3LQ==
X-Forwarded-Encrypted: i=1; AHgh+RqvWSI/QsSbjH75LxvbXmgjiJn2YDmS1VC7Ua2izuOBhvEowXPKhuvMM+aQZCwyb5vdsEhxFxPVW40=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWpcR1tZLlGrsWqzo6HFfrLTXqPqpF8rvqz3Jfvo0V4G0woNML
	W7cTG+L3aYkZS0uAC+Lg0JUWlXFn+qenOxF49GXii7o7rFPVKlD5S5p68QIRHdL0CzgTR7JurhY
	+ndlW1jtuNSo3xr9BUYTWTAllrmZnDfs=
X-Gm-Gg: AR+sD11ead/I6fbXzEVQOWSd3/U1mOr7KiQW6A7sPnekzHWNq72XI+SosY9enRBmLHA
	uo3rRHabPj0EdOKggqb+lI7TvMHhbL3PVYtp8A82dzt1GNtUZvEMIX0p73hJT9f38/xKiY6OIhR
	xe1WmrshfDKWWOl5K23GxVfWrFf1tt7tV7d7GDkcWTfj3H7cyG0/P3oLy8jGZbAMXnEuRvmaapS
	aRiL/RtRxN4WE2mWdL5Wc7jElMbsQcWBxZg09y0I0G0i003ddEPrwnFKWl9++wc+AbPT46EYGuI
	CdGkKi9xw2FYY2rFE10511vsCXC2Ww1CGymN0fB34lk=
X-Received: by 2002:a05:6a21:48d:b0:3c0:b766:74f4 with SMTP id
 adf61e73a8af0-3cc71e17eacmr4327067637.31.1786694373351; Fri, 14 Aug 2026
 00:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260813212724.2607832-1-andrewprecious388@gmail.com> <a34ad4ec-28dc-4494-8798-f2a6b0fe7bae@suse.com>
In-Reply-To: <a34ad4ec-28dc-4494-8798-f2a6b0fe7bae@suse.com>
From: Andrew Precious <andrewprecious388@gmail.com>
Date: Fri, 14 Aug 2026 10:59:22 +0300
X-Gm-Features: AUfX_mxZgyL-2QM-GISwLOcHrcGW1PoxWjy_llXOpUqwkZ7kmy_X_KQb7H2jZ34
Message-ID: <CAF14T9n3QXEKHse-=7hr_=VzMc9ca7xkoSnVmGE1aZ_vsFNM2Q@mail.gmail.com>
Subject: Re: [XEN PATCH] tools/console/daemon: fix log_dir memory leak in xenconsoled
To: Jan Beulich <jbeulich@suse.com>
Cc: anthony.perard@vates.tech, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000072232d0658fd33d2"
X-purgate-ID: tlsNG-720697/1786694375-323D42AC-4592BABA/0/0
X-purgate-type: clean
X-purgate-size: 5819

--00000000000072232d0658fd33d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Noted,it's my 1st first time contributing.

Should I generate a version 2 patch for this?

On Fri, Aug 14, 2026 at 10:52=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:

> On 13.08.2026 23:27, Andrew Mbugua wrote:
> > Valgrind reports that 21 bytes are "still reachable" from the
> (XEN_LOG_DIR "/console") allocation:
> >
> > HEAP SUMMARY:
> >     in use at exit: 21 bytes in 1 blocks
> >     total heap usage: 9 allocs, 8 frees, 4,799 bytes allocated
> >
> > Since the dynamic memory allocation for the default log directory path
> happens before the process
> > forks into the background, the parent and intermediate processes exit
> during daemonize()
> > with the memory still reachable.
> >
> > Move the strdup() allocation down below the daemonize() block. This
> ensures only the final
> > background daemon allocates the default path, matching the lifetime of
> the free(log_dir)
> > cleanup loop at the exit of main().
> >
> > With this change, Valgrind reports a clean heap summary
> >
> > HEAP SUMMARY:
> >     in use at exit: 0 bytes in 0 blocks
> >     total heap usage: 8 allocs, 8 frees, 4,778 bytes allocated
> >
> > Signed-off-by: Andrew Mbugua <andrewprecious388@gmail.com>
>
> Looks all plausible (albeit a little unnecessary, as memory is freed at
> program exit anyway), except that ...
>
> > --- a/tools/console/daemon/main.c
> > +++ b/tools/console/daemon/main.c
> > @@ -181,10 +181,6 @@ int main(int argc, char **argv)
> >               }
> >       }
> >
> > -     if (!log_dir) {
> > -             log_dir =3D strdup(XEN_LOG_DIR "/console");
> > -     }
> > -
> >       if (geteuid() !=3D 0) {
> >               fprintf(stderr, "%s requires root to run.\n", argv[0]);
> >               exit(EPERM);
> > @@ -201,6 +197,10 @@ int main(int argc, char **argv)
> >               daemonize(pidfile ? pidfile : XEN_RUN_DIR
> "/xenconsoled.pid");
> >       }
> >
> > +     if (!log_dir) {
> > +                log_dir =3D strdup(XEN_LOG_DIR "/console");
> > +        }
> ... can you please not screw up indentation? All you want is to move the
> code, without converting tabs to blanks.
>
> Jan
>

--00000000000072232d0658fd33d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Noted,it&#39;s my 1st first time contributing.<div><br></d=
iv><div>Should I generate a version 2 patch for this?</div></div><br><div c=
lass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_=
attr">On Fri, Aug 14, 2026 at 10:52=E2=80=AFAM Jan Beulich &lt;<a href=3D"m=
ailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 13.08.2026 23:27, Andrew Mbugu=
a wrote:<br>
&gt; Valgrind reports that 21 bytes are &quot;still reachable&quot; from th=
e (XEN_LOG_DIR &quot;/console&quot;) allocation:<br>
&gt; <br>
&gt; HEAP SUMMARY:<br>
&gt;=C2=A0 =C2=A0 =C2=A0in use at exit: 21 bytes in 1 blocks<br>
&gt;=C2=A0 =C2=A0 =C2=A0total heap usage: 9 allocs, 8 frees, 4,799 bytes al=
located<br>
&gt; <br>
&gt; Since the dynamic memory allocation for the default log directory path=
 happens before the process<br>
&gt; forks into the background, the parent and intermediate processes exit =
during daemonize()<br>
&gt; with the memory still reachable.<br>
&gt; <br>
&gt; Move the strdup() allocation down below the daemonize() block. This en=
sures only the final<br>
&gt; background daemon allocates the default path, matching the lifetime of=
 the free(log_dir)<br>
&gt; cleanup loop at the exit of main().<br>
&gt; <br>
&gt; With this change, Valgrind reports a clean heap summary<br>
&gt; <br>
&gt; HEAP SUMMARY:<br>
&gt;=C2=A0 =C2=A0 =C2=A0in use at exit: 0 bytes in 0 blocks<br>
&gt;=C2=A0 =C2=A0 =C2=A0total heap usage: 8 allocs, 8 frees, 4,778 bytes al=
located<br>
&gt; <br>
&gt; Signed-off-by: Andrew Mbugua &lt;<a href=3D"mailto:andrewprecious388@g=
mail.com" target=3D"_blank">andrewprecious388@gmail.com</a>&gt;<br>
<br>
Looks all plausible (albeit a little unnecessary, as memory is freed at<br>
program exit anyway), except that ...<br>
<br>
&gt; --- a/tools/console/daemon/main.c<br>
&gt; +++ b/tools/console/daemon/main.c<br>
&gt; @@ -181,10 +181,6 @@ int main(int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!log_dir) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_dir =3D strdup(XE=
N_LOG_DIR &quot;/console&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (geteuid() !=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, =
&quot;%s requires root to run.\n&quot;, argv[0]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(EPERM);<br>
&gt; @@ -201,6 +197,10 @@ int main(int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0daemonize(pidfil=
e ? pidfile : XEN_RUN_DIR &quot;/xenconsoled.pid&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!log_dir) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_dir =3D s=
trdup(XEN_LOG_DIR &quot;/console&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
... can you please not screw up indentation? All you want is to move the<br=
>
code, without converting tabs to blanks.<br>
<br>
Jan<br>
</blockquote></div>

--00000000000072232d0658fd33d2--

