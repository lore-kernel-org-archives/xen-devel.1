Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFC5606A332
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 11:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mWVdUC07
Received: from list by lists.xenproject.org with outflank-mailman.1479927.1683829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNsj-0006U0-W9; Mon, 09 Nov 2026 11:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479927.1683829; Mon, 09 Nov 2026 11:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNsj-0006Tt-TV; Mon, 09 Nov 2026 11:49:49 +0000
Received: by outflank-mailman (input) for mailman id 1479927;
 Mon, 09 Nov 2026 11:49:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewprecious388@gmail.com>) id 1xQNsh-0006TZ-UU
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 11:49:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQNsh-00B5C8-06
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:49:47 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6af1b352-2eae-0a2a0a5409dd-0a2a4502d662-36
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:49:46 +0100
Received: from [74.125.82.176] (helo=mail-dy1-f176.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6af1b359-6ca4-0a2a45020019-4a7d52b0dc4b-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:49:46 +0100
Received: by mail-dy1-f176.google.com with SMTP id
 5a478bee46e88-36e99cf7bb3so1326925eec.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 03:49:46 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1794224985; cv=none;
        d=google.com; s=arc-20260327;
        b=cVrzL1MXsMbZAmLSAgK2vYDny7UD/AsC3OEucN8udFOxixgEDK0G4fepUpaF40eIqO
         ubwioYNlcAghD2ItXJOdZNU0I/2P05uRVGju2KuAfFeN7s8ewfsYNlolGLSmDJD85mbc
         a49KyHSOVgh+lrhE6LyAhA5FHx8gbLWd3tTBASKP2mnEfL1X5igGxxaN3f/hkX8psqLR
         djvP8LjiCBTSXyuEM8EofZFpEz/Z0rgdtzDbRLIgGaJMtxgyx1WIP8t8mVgxk30qvM2W
         2j4KVNk2FVFT+5t1/T81Fta8vB1rpQMfGNvapVqVXl+3EvhNcrZ4mfWkDTz0ygibyrgF
         5cFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LtOrYHc1Ax6OJtqMC8SL51/lMQ2wukuFl3AdJzDZbd8=;
        fh=I7h234+YmwOM8yr1KnNiEZmhBiIsdOSuigyd/FjSY14=;
        b=ji5jihe3gyjqe7wFrd/tIUIr21J+Cnkl9RtvdxUC/iZz/i8u+Jstch1Mlmy3mAJGTX
         CqH/KEqprkZNwJZPzgdANQPXbT/cA0lFR9UMIvzVcLhfskUbkYhX0eq8ORZnEqZ1WRWM
         zd2Xlva31r2oFj1p/6ILYJEo6ThTdz3sHD9NNZhDkTlDogh1Jm86RddGFos2NDQZonMz
         Ho1VVqE3vG+iuS1owZD+z7seG5eG3guG72LyTx5ZAVZqgxdI281Q8jpe1RpyX/CQCfaf
         NQJRT/ndAJJGQ6g+WZytA6UnW3zGBh5gNFGMmaUFJVgcvNHVBgibc5LAXMvB0/NneFLS
         PAPg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794224985; x=1794829785; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtOrYHc1Ax6OJtqMC8SL51/lMQ2wukuFl3AdJzDZbd8=;
        b=mWVdUC07o8ZjOeea3oE0bnMNjZ/WaWMQ1DfEysa5uVtVCTK0qnqH3wOOcwW65YNlbI
         FW6kV+WgeaDrICqtTuozW57xpo5vE/yywkBclbI+mrtAQc/OmpD/GRGY/VlfAR/bEjTZ
         dAS4i/Igp2V8Kg1hE41YFrB6VqHCMRvosqMXoib5OclX6RgLSkDexPr5+eJv1nsHg3xd
         LdfpVcez3MnHzuugRusKz9Vk5Toh0nvg8mWiYZvxqbySpINCA7f2cgREmhBVCal1oKWM
         KAWbWn+2MltL5eGmk2118eFDYa/QSi6ocVHGWEhKq9rlp57fEI/UZyep/XCejcePMKjR
         2h/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794224985; x=1794829785;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LtOrYHc1Ax6OJtqMC8SL51/lMQ2wukuFl3AdJzDZbd8=;
        b=jOwIH3dcARt/i/+mLro7lpT0XPh6LRb2vfHP2AEywpofx0s6rJkFyTVGcXHWHcJEGD
         wul6wq4mQ4st54P9R4la202yN1h/VvndNxzpoTzjaZwsm6J3yY9oqGHWovHWJS/LbMBb
         XwDV7Vvn7gVy+KHpQpBBEz0pGRKYbtIqoiDAQzVFB84yomYOdSJiruGRGrmJ0kMWreul
         T4fZC4gMqVoZVo/5eRQ3+Lz6gPQEn9/Vko3BL2OLbAW6H+ue0LOPLfQHchYO9c+NZVYC
         o3wYOh/OqvsaoLnSm+xZwb6RZoWUspzUETknt6tLkPh8KRm7F5maubh7c+tLbkmvxzLK
         cekw==
X-Gm-Message-State: APuU4Z9M+6jOlLwyj/GR3Tv0b3ITsT6KxJbcyY8HNOGb9GPJDcgQV6Mx
	6GXyqoyMouIuu3L5lfV2bdiqeuycz/AmN3Sm3xtJH7sBVRlrfQpaHdTiE27wKYMpwc0EyQ3FhhS
	vlZh8cm5YT8MsxH1NHwnwnPY+QtziY6A=
X-Gm-Gg: AYBFou1sAV30BVrYGe59Jo/EjPf90/zZbjpIqGWK2+SUlWWgCtnqoD0pWsMFgx0c72V
	v1P/ZLE8aRSgiA8W3B230/n7HkVPhKoqpGCZ2S6l0JNyfvkTASAzq4ucAY5eZbzCyvQk2OXcE1F
	Wwx9+em6jhUpbJKdQmxEm/e8VqtVpzseCMDj5qOxI1vZKODatDQvcYsa2q51kJ9ASrlvrX3U0K5
	aHLzS8HYBFqA6tRlHee+CSwAJEudFb8cmxAVeq9YQhUVfKyyiOzfwMeZ4SUHAoWR6auon3R8OrE
	VXfoF687qqMNrYWndjzl0M18RMBYVlc01mm0t4qfcagnna6sR43VHAKlAHJr421A6USblNoI96N
	9cOPPfG9TXcu5iveTi0ZmAbWIjEoHyES0zIY2
X-Received: by 2002:a05:701b:4241:20b0:1b2:366a:e7d1 with SMTP id
 a92af1059eb24-1b39febf913mr6197897c88.32.1794224984388; Mon, 09 Nov 2026
 03:49:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105112627.235207-1-andrewprecious388@gmail.com> <c5cdef09-08da-426a-b005-d73112c6b9b1@amd.com>
In-Reply-To: <c5cdef09-08da-426a-b005-d73112c6b9b1@amd.com>
From: Andrew Precious <andrewprecious388@gmail.com>
Date: Mon, 9 Nov 2026 14:49:31 +0300
X-Gm-Features: AclHuK8iavIzbg8hjPkNUoJFe483J-v4YyYdAoORPDclwJrxy4g-pMmRUy2vBDY
Message-ID: <CAF14T9k4nz5gdz2jvRGZ7b7Ju2nJqzETmRHr6boAZFHHpGg1BQ@mail.gmail.com>
Subject: Re: [PATCH] xen/arch/arm: Correcting comment typos across xen/arch/arm
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Jens Wiklander <jenswi@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000d7779d065fd68ede"
X-purgate-ID: tlsNG-720697/1794224986-F1EAB2AC-182D1643/0/0
X-purgate-type: clean
X-purgate-size: 3943
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000d7779d065fd68ede
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for response

> Scanning Xen using codespell for typo matches I have found:
> 1. Xen native project sources: 3303 typos
Is this hypervisor only or entire Xen repo?

Entire Xen project repo - 3303 typos
Hypervisor code only has - 351 typos

However the scanner can be tweaked to ignore/include areas
such as code pulled from linux source trees and 3rd party stubdoms.

On Mon, Nov 9, 2026 at 10:28=E2=80=AFAM Orzel, Michal <michal.orzel@amd.com=
> wrote:

>
>
> On 05-Nov-26 12:26, Andrew Mbugua wrote:
> > No functional change.
> >
> The below text should be put after "---", given that this is not the
> information
> that should end up in a committed patch.
>
> > I have been making typo corrections across a variety of files
> >
> > Scanning Xen using codespell for typo matches I have found:
> > 1. Xen native project sources: 3303 typos
> Is this hypervisor only or entire Xen repo?
>
> > 2. Qemu Tree - 4908 typos
> >
> > Reasons for corrections:
> > 1. Keeping the codebase clean,concise for future documentation generati=
on
> > 2. Just because typos seem minor doesnt mean that corrections should be
> ignored,
> > while correcting these errors may not be pedantic I think its essential
> in
> > keeping things claan and more readable.
> I don't mind patches like this one, so thanks for the contribution:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>
> I'll do the commit msg adjustment when committing.
>
> ~Michal
>
>

--000000000000d7779d065fd68ede
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for response<br><br>&gt; Scanning Xen using codespe=
ll for typo matches I have found:<br>&gt; 1. Xen native project sources: 33=
03 typos<br>Is this hypervisor only or entire Xen repo?<br><br>Entire Xen p=
roject repo - 3303 typos<br>Hypervisor code only has - 351 typos<br><br>How=
ever the scanner can be tweaked to ignore/include areas<div><span style=3D"=
background-color:transparent">such as=C2=A0</span><span style=3D"background=
-color:transparent">code pulled from linux source trees and 3rd party stubd=
oms.</span></div></div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 9, 2026 at 10:28=E2=80=
=AFAM Orzel, Michal &lt;<a href=3D"mailto:michal.orzel@amd.com">michal.orze=
l@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
On 05-Nov-26 12:26, Andrew Mbugua wrote:<br>
&gt; No functional change.<br>
&gt; <br>
The below text should be put after &quot;---&quot;, given that this is not =
the information<br>
that should end up in a committed patch.<br>
<br>
&gt; I have been making typo corrections across a variety of files<br>
&gt; <br>
&gt; Scanning Xen using codespell for typo matches I have found:<br>
&gt; 1. Xen native project sources: 3303 typos<br>
Is this hypervisor only or entire Xen repo?<br>
<br>
&gt; 2. Qemu Tree - 4908 typos<br>
&gt; <br>
&gt; Reasons for corrections:<br>
&gt; 1. Keeping the codebase clean,concise for future documentation generat=
ion<br>
&gt; 2. Just because typos seem minor doesnt mean that corrections should b=
e ignored,<br>
&gt; while correcting these errors may not be pedantic I think its essentia=
l in<br>
&gt; keeping things claan and more readable.<br>
I don&#39;t mind patches like this one, so thanks for the contribution:<br>
Reviewed-by: Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" targe=
t=3D"_blank">michal.orzel@amd.com</a>&gt;<br>
<br>
I&#39;ll do the commit msg adjustment when committing.<br>
<br>
~Michal<br>
<br>
</blockquote></div>

--000000000000d7779d065fd68ede--

