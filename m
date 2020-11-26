Return-Path: <SRS0=kjYx=FA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC411C63697
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2020 13:08:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4270521D46
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2020 13:08:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRmlIL22"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4270521D46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.38526.71255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiH0Y-0004PO-M1; Thu, 26 Nov 2020 13:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38526.71255; Thu, 26 Nov 2020 13:08:22 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiH0Y-0004PH-J0; Thu, 26 Nov 2020 13:08:22 +0000
Received: by outflank-mailman (input) for mailman id 38526;
 Thu, 26 Nov 2020 13:08:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZgDp=FA=gmail.com=ganime1961tire@srs-us1.protection.inumbo.net>)
 id 1kiH0W-0004Ok-Ky
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 13:08:20 +0000
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eeda3358-4e67-4e7f-b1ee-326ab6b43ac0;
 Thu, 26 Nov 2020 13:08:19 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 10so2098910wml.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2020 05:08:19 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ZgDp=FA=gmail.com=ganime1961tire@srs-us1.protection.inumbo.net>)
	id 1kiH0W-0004Ok-Ky
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 13:08:20 +0000
X-Inumbo-ID: eeda3358-4e67-4e7f-b1ee-326ab6b43ac0
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id eeda3358-4e67-4e7f-b1ee-326ab6b43ac0;
	Thu, 26 Nov 2020 13:08:19 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 10so2098910wml.2
        for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2020 05:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=FrmZM9zwgR9nchK0ys0/eSXi1mHT4RBrjU6HUYIHqZo=;
        b=GRmlIL22hQjM7sneI1C3hRpROU7qnHrJgSa8k2FDmbzvzZMNhwZuUfJ6v8uDpEpxr5
         4Ku0eVlcm42QFkogUPPXpOapI06ESAA3b3gPkwkEbwfZvM6bAY9zPCt5cuapYyLW5KSp
         A5Dk6aVxW28hB3tC3skYZqFR4czlBa9bEwAP+DM6Li80oOU4H1YzUBrPZhQnJ/1lg0Qs
         pUPZPHQfvEtq0V0ZbCxpqMTg06zpo0JYLWNrWoFH9XtqHdP4EO0iC/WmWY8PJNUXS4sp
         17l/35B1WtKvortaqzEh0+lQ3PxDDnVkJvwy7x0ykanOVI3yXu3kCzqRY0zUejr3JCQn
         ayNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=FrmZM9zwgR9nchK0ys0/eSXi1mHT4RBrjU6HUYIHqZo=;
        b=DmvfeksYHDLChzn6SL8r7QOuL0JXPWQcUO+GqJkX0B+aZrEijbeBXLlUBoKLrvz0zc
         0+AkwTRtDJ2JYZxXrhuE73kv66bNlfW9S6QdGJkQYP9R/q1uNJtCtsWjHeZJxBonmA4d
         wQBf+k/LFguq+E6mF+n9T4KyUvH6QbPHsq3RGUu3SonOyM6lNzMhefxvAhEP+YE/Dqt3
         aWRXQ0GUitTBt8gM8K8nU4EVVM7609Kw6OJApOwLJ4fmihsyp2d9rXFNIkgEctP6SabJ
         9GJb/ckNluuHbFq5Rv9ocvK+M8V7lABHVkymxneXIXhtTLiSqi9gzQLDntkUwIpXhQ/8
         5ZZw==
X-Gm-Message-State: AOAM5319dHzfm1kcNy/ibFU8YbJws8zcL8Ro9Pi0IMr+XTbLnsVu3vcD
	U0JzAAxEZeJQ1gTwi+ZAu+Uyy9X1ROiGK1PWnutMPk4Xr+E=
X-Google-Smtp-Source: ABdhPJxCw3GSSvGOhHdp3NZO7cbAp5huaXvbF59WpdGSfxe0gEZbT89f/AVgZDrQpcDAIznHIa34wrvvIn5hc9T7Gig=
X-Received: by 2002:a1c:a786:: with SMTP id q128mr3323091wme.115.1606396097564;
 Thu, 26 Nov 2020 05:08:17 -0800 (PST)
MIME-Version: 1.0
References: <CAF6SwtntQvKrmrhQaDSQwcysCOdNjsUxZO90qtQepvZ-0YLgCA@mail.gmail.com>
In-Reply-To: <CAF6SwtntQvKrmrhQaDSQwcysCOdNjsUxZO90qtQepvZ-0YLgCA@mail.gmail.com>
From: Ganime Yalur <ganime1961tire@gmail.com>
Date: Thu, 26 Nov 2020 14:08:05 +0100
Message-ID: <CAF6SwtnnTezMGJCt9PhKP+7HJogGKQVj1_4dqJ9Yduy22-JRkQ@mail.gmail.com>
Subject: Fwd: subscribe
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000c3baec05b5023ccc"

--000000000000c3baec05b5023ccc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
G=C3=B6nderen: Ganime Yalur <ganime1961tire@gmail.com>
Date: 26 Kas 2020 Per 12:57
Subject: subscribe
To: <xen-devel-request@lists.xenproject.org>


I Need additional help to verifiy Benchmarkresults with nginx and nee
librarys like -lwip -lpthread-embeddd
-lnewlibc .

Is this enough to set in configure Script of nginx latest release or i need
to patch something INSIDE makefile or nginx sources?

I need a method, who works outside of unikraft Kernel.

I hope someone can
help me

Thanks and

Best regards

--000000000000c3baec05b5023ccc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">---------- Forwarded message ---------<br>G=C3=B6ndere=
n: <strong class=3D"gmail_sendername" dir=3D"auto">Ganime Yalur</strong> <s=
pan dir=3D"auto">&lt;<a href=3D"mailto:ganime1961tire@gmail.com">ganime1961=
tire@gmail.com</a>&gt;</span><br>Date: 26 Kas 2020 Per 12:57<br>Subject: su=
bscribe<br>To:  &lt;<a href=3D"mailto:xen-devel-request@lists.xenproject.or=
g">xen-devel-request@lists.xenproject.org</a>&gt;<br></div><br><br><div dir=
=3D"auto">I Need additional help to verifiy Benchmarkresults with nginx and=
 nee librarys like -lwip -lpthread-embeddd=C2=A0<div dir=3D"auto">-lnewlibc=
 .</div><div dir=3D"auto"><br></div><div dir=3D"auto">Is this enough to set=
 in configure Script of nginx latest release or i need to patch something I=
NSIDE makefile or nginx sources?</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I need a method, who works outside of unikraft Kernel.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">I hope someone can=C2=A0</div><div=
 dir=3D"auto">help me</div><div dir=3D"auto"><br></div><div dir=3D"auto">Th=
anks and</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards</d=
iv></div>
</div></div></div>

--000000000000c3baec05b5023ccc--

