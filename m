Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998DCC5DF7D
	for <xen-devel@archiver.kernel.org>; Fri, 21 Aug 2026 09:25:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1397253.1634601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxLUh-0003FS-L0; Fri, 21 Aug 2026 09:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1397253.1634601; Fri, 21 Aug 2026 09:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxLUh-0003FL-IG; Fri, 21 Aug 2026 09:24:59 +0000
Received: by outflank-mailman (input) for mailman id 1397253;
 Fri, 21 Aug 2026 09:24:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewprecious388@gmail.com>) id 1wxLUg-0003FF-Pm
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 09:24:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wxLUf-00BSQU-Gq
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 11:24:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6a881965-2eae-0a2a0a5409dd-0a2a450aa7aa-18
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 11:24:57 +0200
Received: from [209.85.214.181] (helo=mail-pl1-f181.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6a881967-f2d2-0a2a450a0019-d155d6b5bde7-3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 11:24:57 +0200
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2d032846c95so9371275ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 02:24:56 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1787304295; cv=none;
        d=google.com; s=arc-20260327;
        b=PUdZuYt0Gpv4mFYislA0tzERfE11BIQRgBZft4+NwLQyQh1sX5e5N437XUu2S9yvNO
         OwzwT85M6i46zRTV+HN/h6GtwnM3UL6d22rozfLePv+8iv49MCjMIdFDC6GOfcITTew8
         IsvXtCjEynYILIRjD6BZFP8UrZZn34smI6Q6D1yUBpkYH1KBFXR7e5g4rhWrl1RJz15X
         z+2xXYzXx9xasBygHvteh3yA2EMGznLoSWGWRKnCUAXq5lZh5cdSanJXq2zSdChbMFoK
         BePGbk8tKSsU0gET3/5oc9K39rT14FiReCvLQFGRIOJWybqulZGS7xV/NmALI2d8sHmB
         U2jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E4nRm5b1hbQERUTszUQ51KBYoIjLDjCPQXKWoXXPZq4=;
        fh=SygEH9Z7MBlxPm51gae5A7uhhF1jD0TC8uv8zGf6b6I=;
        b=nTw2u7HAbswSSSAQ3WrnlJ7RusPE3k24v6bfwFaeoWEmVNMW4nR04lXyyneo0Q/b8Z
         Vrc6XceKIlC81eO5aMUcP2b2u4GXZ3iN4c7YyR80US/AzCiijvRV9WssqiAMARmErtZP
         Ntu7rT+T6yLufYJw9RxpA3s8UK1mDQWI3rgY+Bf4p6FueLtPquy6gO9mScLzYORmsgMB
         3+09Eov+aGFTXIaxI0OeoopmL+mznoD+XRQOC61UKvvgajFkLH+InNbz6Kt9Pe6tWYZf
         Wev8Hu8HZ3jozrASSoymJkHbmBFs92kpGkvMRxXgQ7Q0Zu8gHZuuAO6ov3H9hOSXaw1h
         NWgA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787304295; x=1787909095; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E4nRm5b1hbQERUTszUQ51KBYoIjLDjCPQXKWoXXPZq4=;
        b=CBHKIFkXTulQ3F21EmlsOhKt9P5suMBeZMAQOkn2iCuHIetHGkslF/doiAdXda4Z5C
         rxhpeyyXHUPkK+iHwxUMtDz6B2ve1V8MCqxiqxb4R/qJQU1J6Re3Ws56GNRdA0zOLC1P
         yS4MNPHCMJEMgYd/bxOOIz+oA9Tk+6rU/cD3qIGI0OHWHSbcK9GPYCCm1ByRKWz5+y8D
         5NigW2CWc0HCa4AzU+99JHxZ+/SSre9/2o/t8JbAycVQ6lBDUSMjKWqW4YRTEauqXsb1
         BnaVmmdpXhYh8Q8bfcfjf2gCs0FV2U+GcYGEyqaLLcAYofoAvif7fmXLzrh9yfeW7WCN
         3p0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787304295; x=1787909095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E4nRm5b1hbQERUTszUQ51KBYoIjLDjCPQXKWoXXPZq4=;
        b=HXmHKtecMfn6gZ4yaobV2xkAgZnGEOXuuxpuiQ0dHCfaG1HUerBH6PgOlaJT31qH7C
         Osv9Pdbn7SLox09Qf1LB0NaOOn/LRg3c0DMNW3dLuos1FL8XjqdxRjG2IwxmxHV+zIYo
         Iixy1mnsFlb7kQCu02YOGjwHU82lCN2ciiE8u67ovGXZWnh4c10kNxo7qQhfXC4eseHK
         Dz9dueo6/b2csNlD6O1aYG0DWVUlL0m1C+jt3cvBuUSIAEXwYzrt63GzaowANJaYJsBI
         PTrOT+w9leeolRSpcePJHgy2JKsUVXVp5tLgiS3vf2LQf5U3FiGcd1hpqheU/LCpTwLa
         ba0w==
X-Forwarded-Encrypted: i=1; AHgh+Rqk+0kX4+TcsKUpJczAdB5qHnHt9WB/NL6xOnmQy/ixtir2lboM4I7KVeYF3lIAv6UByObnRsDwS0E=@lists.xenproject.org
X-Gm-Message-State: AFuF++lPk1NSl4FwKwhsTCyOrU/bY6eGqgGjISvX6D+sK+sSwu7g9znD
	aATMbnT/U5aBqMU7+F7EljDBvPs2TlitUAIK17UbdjPPnU67a1K8GXFZ4MrsXG5J2NeCECHP+2M
	vM4g7Aojx1SBChkn3ajgfHcNslF0r5xc=
X-Gm-Gg: AR+sD10x8VKuMkoCA/lulR2InJLii/T8t9BzDZcS1mLkHk54mP/dkerY/JJmNVHISdx
	2xZmVSkMtM0HL97pJaXBJm7P6OncpI6GPi4WMkGx3+abYDFJEr2egVy65xwMBy+Af/s49v1J9cR
	KDj1Jpv9ISgL+4ViL2CfmA9vpmuAVloTp0wSHGuoI/QDlejnaivIUY8RUnFbpIWefQ++aeR4QHl
	2XwlWUPhbqrPQsgmNlWIX3w8v5BXUvH9BcBPfjeDs/4AfIdBKRi7r3hu7RBPr3BBEXOnAqowJ5C
	xWGtQ5ddZYpCD/S8801NDyyOA1H5nkRGPv20iZOY62E=
X-Received: by 2002:a17:90b:5844:b0:393:1d92:db5 with SMTP id
 98e67ed59e1d1-395c35e1199mr10444070a91.10.1787304295198; Fri, 21 Aug 2026
 02:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260819180735.135911-1-andrewprecious388@gmail.com>
 <aee239df-0582-4973-82ae-65688a7d6b9a@suse.com> <CAF14T9mYViiNQfJ8TG1RU0hqf7m6yUH1-yFCzWXXJdQOhmFkgA@mail.gmail.com>
 <cc9dd2bf-bc0d-48b5-a11b-e1e22e26a3b4@suse.com>
In-Reply-To: <cc9dd2bf-bc0d-48b5-a11b-e1e22e26a3b4@suse.com>
From: Andrew Precious <andrewprecious388@gmail.com>
Date: Fri, 21 Aug 2026 12:24:44 +0300
X-Gm-Features: AcwNN1XD9Ne6SN2pN3isA7YECmb-UQH7wC6LwMf0mF6l9QOacjfOWzZfzbV14zc
Message-ID: <CAF14T9nLwfEh_cb+vrh43RWvk3e0WEDvoemL4wD4vmVrbdPVDg@mail.gmail.com>
Subject: Re: [BUG] x86emul/test: avoid assertion in emul_test_read_xcr() when
 XSAVE is absent
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, teddy.astie@vates.tech, 
	anthony.perard@vates.tech, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000009ef45706598b3597"
X-purgate-ID: tlsNG-4011c0/1787304297-52EDACFC-8BEF4390/0/0
X-purgate-type: clean
X-purgate-size: 4813

--0000000000009ef45706598b3597
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My thinking before was that the fuzzer mutated some bytes that made the
emulator think cpu_has_xsave was false.

But now I believe that this was caused by an environment issue caused by
the default QEMU virtual cpu model.

The VM has no OSXSAVE flag(but the host does), x86_cpu_policy_fill_native()
initializes with the OSXSAVE bit cleared,hits the assert(cpu_has_xsave)
which then aborts the fuzzer.

On Thu, Aug 20, 2026 at 5:13=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 20.08.2026 14:30, Andrew Precious wrote:
> > I just realized that I attached the binary result without the fuzzer
> error.
> > To generate the previous assertion error I would have to rerun the fuzz=
er
> > again which took many hours(~18hrs). Though that was the only error I
> found
> > after that long.
> >
> > VM machine that I performed the fuzzing on:
> > - A VM running Debian GNU/Linux 13 (trixie)
> > - x86_64,QEMU Virtual CPU version 2.5
>
> What does that mean CPUID-wise, seeing that ...
>
> > On Thu, Aug 20, 2026 at 11:45=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >> On 19.08.2026 20:07, Andrew Mbugua wrote:
> >>> While running the x86_instruction_emulator fuzzer via AFL, I
> encountered
> >> an assertion failure in the emul_test_read_xcr() function.
> >>
> >> Thanks for the report.
> >>
> >>> The fuzzer is able to generate a CPU state where cpu_has_xsave is
> false.
> >>
> >> I'm having trouble here: cpu_policy isn't populated from fuzzing input=
,
> and
> >>
> >> /* Intentionally checking OSXSAVE here. */
> >> #define cpu_has_xsave     (cpu_policy.basic.raw[1].c & (1u << 27))
> >>
> >> would mean that upon filling cpu_policy (emul_test_init() ->
> >> x86_cpu_policy_fill_native()) the OSXSAVE bit would be clear. Are you
> >> suggesting you did the fuzzing on some really old hardware?
>
> ... there was this aspect that I couldn't understand?
>
> Jan
>

--0000000000009ef45706598b3597
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My thinking before was that the fuzzer mutated some bytes =
that made the emulator think cpu_has_xsave was false.<br><br>But now I beli=
eve that this was caused by an environment issue caused by the default QEMU=
 virtual cpu model.<br><br>The VM has no OSXSAVE flag(but the host does), x=
86_cpu_policy_fill_native() initializes with the OSXSAVE bit cleared,hits t=
he assert(cpu_has_xsave) which then aborts the fuzzer.<br></div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Aug 20, 2026 at 5:13=E2=80=AFPM Jan Beulich &lt;<a href=3D"mai=
lto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On 20.08.2026 14:30, Andrew Preciou=
s wrote:<br>
&gt; I just realized that I attached the binary result without the fuzzer e=
rror.<br>
&gt; To generate the previous assertion error I would have to rerun the fuz=
zer<br>
&gt; again which took many hours(~18hrs). Though that was the only error I =
found<br>
&gt; after that long.<br>
&gt; <br>
&gt; VM machine that I performed the fuzzing on:<br>
&gt; - A VM running Debian GNU/Linux 13 (trixie)<br>
&gt; - x86_64,QEMU Virtual CPU version 2.5<br>
<br>
What does that mean CPUID-wise, seeing that ...<br>
<br>
&gt; On Thu, Aug 20, 2026 at 11:45=E2=80=AFAM Jan Beulich &lt;<a href=3D"ma=
ilto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<=
br>
&gt;&gt; On 19.08.2026 20:07, Andrew Mbugua wrote:<br>
&gt;&gt;&gt; While running the x86_instruction_emulator fuzzer via AFL, I e=
ncountered<br>
&gt;&gt; an assertion failure in the emul_test_read_xcr() function.<br>
&gt;&gt;<br>
&gt;&gt; Thanks for the report.<br>
&gt;&gt;<br>
&gt;&gt;&gt; The fuzzer is able to generate a CPU state where cpu_has_xsave=
 is false.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m having trouble here: cpu_policy isn&#39;t populated from f=
uzzing input, and<br>
&gt;&gt;<br>
&gt;&gt; /* Intentionally checking OSXSAVE here. */<br>
&gt;&gt; #define cpu_has_xsave=C2=A0 =C2=A0 =C2=A0(cpu_policy.basic.raw[1].=
c &amp; (1u &lt;&lt; 27))<br>
&gt;&gt;<br>
&gt;&gt; would mean that upon filling cpu_policy (emul_test_init() -&gt;<br=
>
&gt;&gt; x86_cpu_policy_fill_native()) the OSXSAVE bit would be clear. Are =
you<br>
&gt;&gt; suggesting you did the fuzzing on some really old hardware?<br>
<br>
... there was this aspect that I couldn&#39;t understand?<br>
<br>
Jan<br>
</blockquote></div>

--0000000000009ef45706598b3597--

