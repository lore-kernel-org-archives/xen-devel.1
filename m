Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FB2C5DF87
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 12:31:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396420.1634259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx1vK-0000Gj-NZ; Thu, 20 Aug 2026 12:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396420.1634259; Thu, 20 Aug 2026 12:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx1vK-0000Gc-Kl; Thu, 20 Aug 2026 12:31:10 +0000
Received: by outflank-mailman (input) for mailman id 1396420;
 Thu, 20 Aug 2026 12:31:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewprecious388@gmail.com>) id 1wx1vI-0000GW-RI
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 12:31:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx1vI-008oRc-7m
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 14:31:08 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6a86f385-bab6-0a2a0a5309dd-0a2a450cade6-22
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 14:31:08 +0200
Received: from [209.85.160.44] (helo=mail-oa1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6a86f38a-f479-0a2a450c0019-d155a02cd5cd-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 14:31:07 +0200
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-455ee8f529dso626033fac.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 05:31:07 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1787229066; cv=none;
        d=google.com; s=arc-20260327;
        b=QIdj+bE476VI3x+OxJh16CHQH5BDL1e+kEQjZbeZuzzpSbWN8iUfwRnnlJ/SMHLKd4
         kZrFinutnRqKkAAMc6muaLVz5iDUt6nvfn160J6YJAxCZGyWW7Tc7pSsUp+xa7O5aoBt
         uqiOsn5P1T/+dquBRFE8ewMBcwa4K59L+O0kDjcGT1pRjFIsbu/YhV2kY+IXMZluCmjD
         THPl8JVNwYSFEg7kOq6uJUJi7WI2uU9mP8lZ7ffr3wcssyLjlKWbN5SRwBUa+aogcFVA
         Ujl7sdxKUqWnLpvGkvyqiOA+IP0kYX8OYodHlMEtRIDJfiS4gaSknQEVmmUoFjo4IduM
         NFbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DyoPHkPnAOZXaz2MqkVz3ixLJR2/aJEGGzymEm6TGRU=;
        fh=0wl/d2rnHFQXb5nvII1Ro/XhFZih03CHbsnnp7ptCWs=;
        b=hNlwSI1ofsbwXWFkVTh4RgMPhb96hSPufoZsBZyKovlTIJMDJpXqOZaLwuNB9v9TA2
         /sdVmUKS6gq8WWDgr63n4fQzmQnMgombBMyLpVcgCxqPCe5IK/XtS9lmae4/eqEPGXm4
         Tskh4YDmGdBt5/2cyQh/uVcoFq0H2S4bS4EYEuygPGGczDGMhBlm3LXKpIRuhOvUUr5l
         U2vccnDh64GBh38AL6ml/YFuU8mQx/sxokhsBP01zbknbaz+bkqxq+mw/f690hxalb5O
         rAmEo+YxdbhWX2VeQXkt/WDoW7dlgUxIM9H+JH0sdmDLq3QCkMv0KvH18jiDWwTqEfVN
         x3bg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787229066; x=1787833866; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DyoPHkPnAOZXaz2MqkVz3ixLJR2/aJEGGzymEm6TGRU=;
        b=jGfVaQTQK3tVGJ3k+fbMLEgTyTVixuU6/nUXCmeCE8et+2IycXre9UQPluKRVMbG++
         84vsudzkzu9QgK7z8hSKdksumWVJOmqZzStYfYwq6clI4DxBWCVFUfWz7KtqZay6gimN
         bNzHK63MIaJP5foe3IUPbnUtV2XrSYH0usmY4BPijPXjDq/nWZ6M80OLVk11tFAepArs
         3p29/dvHH5MuZHMefrqXdALT4yif3WhCU+nVR73xRPpjrhQy1sJDlCvvEguoEtn5u9S4
         mVlKso7ELm+nVDTQRhuj7MQNzgKQ3e5uNZrDETEFf0DV8r6vppOQ2N11WDkaydeqm7ot
         Rshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787229066; x=1787833866;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DyoPHkPnAOZXaz2MqkVz3ixLJR2/aJEGGzymEm6TGRU=;
        b=j5OJoeCO4PIlJPdO96dXLo4ANYlNjAhxZo292u+054s+sleUj0htV4NY7RVDBLdYnp
         OseYzoUY8ZAjEnrHE+7gS6wCAym0H+SVUJZl/SjMemKNvitSIiHS3EcyxEsg3t4f8FuS
         Hsm/q8yoVuyokz6fgUVhP8nma9pALQIsFZdN3DVfaYGO+XxsiMOkGkFgNxbpvdIrGAMS
         DLb6c2gUNnPywv5Y+l8mjpbiJGzEHarWgedvk5Y5iwwrulqqc2K0xX+ZukFUzpMzDKSg
         iUnNZ1dlo2rEtIXFOK7AJaoirNhvvOc4r/91m+9/Xx42wtR5tV/5yuIIw4sz0hWFGys5
         Nu7A==
X-Forwarded-Encrypted: i=1; AHgh+RoPpp1n1h2IPxCcP5ZYFLjLAWPVRuYhiRg63L3EYsuO8dHqBXZNekXrNVl8Da3VkbBy+NOrl65yUQg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZabJ/pn4C1sgg143n9jMdfhwV8fARo2iAvoskcHBcpNNzDiF7
	cKawjwa+X8XVYerHYl8n8UVCmz2WZVLX78Va7bfoE9hA1SjreSh22y+mN0g2YlERLzyhRM9wVHf
	4D7+jpc07nG32LmU0j2k+qtMg1XOk1vg=
X-Gm-Gg: AR+sD10e6V1+kLjw6cSkP6aktEty/QEehTwGFd+NfdNXNRt3CMUW82ju4Z/kH+w7U34
	ajVal9lIXDAC/GUlvzpoMR56hF5S5cHH4Av/UjOlWMNUe3+Ze4cFF7+jqAj7h3pB8cE6ceE+S4M
	PMqHNpIWYapC/NBxGmyhj3gLD1rbGqfrJRZ2uqJX+/IE+X8j2BhGG1AIl8+HuifF16KZBY7vcse
	csGD9yDxXj514MUWwjCwYejBj/4tjhLEn54+4N4oLNppFf9kVCYJZrTz8iNUc6vIWZkV9iX+LG5
	cwvICCA5+Z+is8FQAkNPHWg6Jf1PRpuWZtlfXbFMpP4q/ZsmyoMsww==
X-Received: by 2002:a05:6870:8294:b0:457:81d2:cd1e with SMTP id
 586e51a60fabf-462f6335e33mr11703489fac.4.1787229066109; Thu, 20 Aug 2026
 05:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260819180735.135911-1-andrewprecious388@gmail.com> <aee239df-0582-4973-82ae-65688a7d6b9a@suse.com>
In-Reply-To: <aee239df-0582-4973-82ae-65688a7d6b9a@suse.com>
From: Andrew Precious <andrewprecious388@gmail.com>
Date: Thu, 20 Aug 2026 15:30:53 +0300
X-Gm-Features: AcwNN1W1kK18gQ89lsoO0YDAZltV7PfM7vroGQlwetXrJklq2lkFybE-NGqfg7s
Message-ID: <CAF14T9mYViiNQfJ8TG1RU0hqf7m6yUH1-yFCzWXXJdQOhmFkgA@mail.gmail.com>
Subject: Re: [BUG] x86emul/test: avoid assertion in emul_test_read_xcr() when
 XSAVE is absent
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, teddy.astie@vates.tech, 
	anthony.perard@vates.tech, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000009e26bb065979b176"
X-purgate-ID: tlsNG-d25034/1787229068-012C8A5B-821E353B/0/0
X-purgate-type: clean
X-purgate-size: 8228

--0000000000009e26bb065979b176
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just realized that I attached the binary result without the fuzzer error.
To generate the previous assertion error I would have to rerun the fuzzer
again which took many hours(~18hrs). Though that was the only error I found
after that long.

VM machine that I performed the fuzzing on:
- A VM running Debian GNU/Linux 13 (trixie)
- x86_64,QEMU Virtual CPU version 2.5
- Hypervisor vendor: Xen

Main machine:
- x86_64, AMD Ryzen 9 7950X


Also I think I'll also wait for you to make the relevant changes & then
apply the patches locally.


Question seeking advice:
I've been trying to find low-hanging fruit issues within Xen to try and
fix, I currently have a fuzzer running for cpu-policy. It would be nice to
get some pointers on where/what to look for.


On Thu, Aug 20, 2026 at 11:45=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:

> On 19.08.2026 20:07, Andrew Mbugua wrote:
> > While running the x86_instruction_emulator fuzzer via AFL, I encountere=
d
> an assertion failure in the emul_test_read_xcr() function.
>
> Thanks for the report.
>
> > The fuzzer is able to generate a CPU state where cpu_has_xsave is false=
.
>
> I'm having trouble here: cpu_policy isn't populated from fuzzing input, a=
nd
>
> /* Intentionally checking OSXSAVE here. */
> #define cpu_has_xsave     (cpu_policy.basic.raw[1].c & (1u << 27))
>
> would mean that upon filling cpu_policy (emul_test_init() ->
> x86_cpu_policy_fill_native()) the OSXSAVE bit would be clear. Are you
> suggesting you did the fuzzing on some really old hardware?
>
> > If the fuzzer then generates & feeds an instruction containing AVX,the
> emulator
> > attempts to fetch the FPU state via x86emul_get_fpu(), which then calls
> emul_test_read_xcr() and hits the ASSERT(cpu_has_xsave). This assertion
> crashes the fuzzer.
> >
> > The crash:
> > 1. $ ./afl-harness < findings_dir/master01/...
> >    afl-harness: ../../tests/x86_emulator/x86-emulate.c:179:
> emul_test_read_xcr: Assertion `cpu_has_xsave' failed.
> >    Aborted
> >
> > 2. The stacktrace:
> > (gdb) bt
> > data_p=3Ddata_p@entry=3D0x55555604f320 <input>
> "\244\264\336\346\337\001\254%\247R\216d\204*\234\377\377\224=CE=BB\3237/=
\365=CA=BFX\266?\353\036\227/\0323\351dj\257\v\207\031V=D6=96\235{\036\225|=
:M\330\336
> \314V:&\357\306@\224\331,\301\300\372FW\262.\020\\\276\244\203\242\276\26=
2\022!\337)F&\261\2064\200\200\377I;J\376X41\2061\206\325
> \021\017F\026\267\275\340\361\357)\255\343\237n\377\374n\357#=D6=BD\226\3=
65d",
> > size=3Dsize@entry=3D580) at fuzz-emul.c:934
>
> This can't be the complete stack trace.
>
> > Possible fixes:
> > To prevent the fuzzer from getting stuck on this state,would it be
> better for emul_test_read_xcr to return X86EMUL_UNHANDLEABLE (or somethin=
g
> similar) instead of ASSERT(cpu_has_xsave) ?
>
> No, I think the assertion is legitimate there. After sending this reply,
> I'll
> post two patches taken off of the (unposted) APX series I have pending,
> which
> I think get things into better shape (and which, with the minor editing I
> had
> to do to pull them out of that series, should be fine to move ahead). On
> top
> of that we then will want to add some sanitization of input state in the
> fuzzing harness: CR4.OSXSAVE set and CPUID.XSAVE clear are clearly
> contradictory. There are other impossible combinations, and I think we ma=
y
> want to address some of them at the same time, and we already have
> sanitize_input() there. Please let us know whether you'd be willing /
> interested to make changes there, or whether we (perhaps I) should.
>
> Jan
>

--0000000000009e26bb065979b176
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I just realized that I attached the binary result without =
the fuzzer error. To generate the previous assertion error I would have to =
rerun the fuzzer again which took many hours(~18hrs). Though that was the o=
nly error I found after that long.<br><br>VM machine that I performed the f=
uzzing on:<br>- A VM running Debian GNU/Linux 13 (trixie)<br>- x86_64,QEMU =
Virtual CPU version 2.5<br>- Hypervisor vendor: Xen<br><br>Main machine:<br=
>- x86_64, AMD Ryzen 9 7950X<br><br><br>Also I think I&#39;ll also wait for=
 you to make the relevant changes &amp; then apply the patches locally.<br>=
<br><br>Question seeking advice:<br>I&#39;ve been trying to find low-hangin=
g fruit issues within Xen to try and fix, I currently have a fuzzer running=
 for cpu-policy. It would be nice to get some pointers on where/what to loo=
k for.<br><br></div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 20, 2026 at 11:45=E2=80=AFA=
M Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
19.08.2026 20:07, Andrew Mbugua wrote:<br>
&gt; While running the x86_instruction_emulator fuzzer via AFL, I encounter=
ed an assertion failure in the emul_test_read_xcr() function.<br>
<br>
Thanks for the report.<br>
<br>
&gt; The fuzzer is able to generate a CPU state where cpu_has_xsave is fals=
e.<br>
<br>
I&#39;m having trouble here: cpu_policy isn&#39;t populated from fuzzing in=
put, and<br>
<br>
/* Intentionally checking OSXSAVE here. */<br>
#define cpu_has_xsave=C2=A0 =C2=A0 =C2=A0(cpu_policy.basic.raw[1].c &amp; (=
1u &lt;&lt; 27))<br>
<br>
would mean that upon filling cpu_policy (emul_test_init() -&gt;<br>
x86_cpu_policy_fill_native()) the OSXSAVE bit would be clear. Are you<br>
suggesting you did the fuzzing on some really old hardware?<br>
<br>
&gt; If the fuzzer then generates &amp; feeds an instruction containing AVX=
,the emulator<br>
&gt; attempts to fetch the FPU state via x86emul_get_fpu(), which then call=
s emul_test_read_xcr() and hits the ASSERT(cpu_has_xsave). This assertion c=
rashes the fuzzer.<br>
&gt; <br>
&gt; The crash:<br>
&gt; 1. $ ./afl-harness &lt; findings_dir/master01/...<br>
&gt;=C2=A0 =C2=A0 afl-harness: ../../tests/x86_emulator/x86-emulate.c:179: =
emul_test_read_xcr: Assertion `cpu_has_xsave&#39; failed.<br>
&gt;=C2=A0 =C2=A0 Aborted<br>
&gt; <br>
&gt; 2. The stacktrace:<br>
&gt; (gdb) bt<br>
&gt; data_p=3Ddata_p@entry=3D0x55555604f320 &lt;input&gt; &quot;\244\264\33=
6\346\337\001\254%\247R\216d\204*\234\377\377\224=CE=BB\3237/\365=CA=BFX\26=
6?\353\036\227/\0323\351dj\257\v\207\031V=D6=96\235{\036\225|:M\330\336 \31=
4V:&amp;\357\306@\224\331,\301\300\372FW\262.\020\\\276\244\203\242\276\262=
\022!\337)F&amp;\261\2064\200\200\377I;J\376X41\2061\206\325 \021\017F\026\=
267\275\340\361\357)\255\343\237n\377\374n\357#=D6=BD\226\365d&quot;,<br>
&gt; size=3Dsize@entry=3D580) at fuzz-emul.c:934<br>
<br>
This can&#39;t be the complete stack trace.<br>
<br>
&gt; Possible fixes:<br>
&gt; To prevent the fuzzer from getting stuck on this state,would it be bet=
ter for emul_test_read_xcr to return X86EMUL_UNHANDLEABLE (or something sim=
ilar) instead of ASSERT(cpu_has_xsave) ?<br>
<br>
No, I think the assertion is legitimate there. After sending this reply, I&=
#39;ll<br>
post two patches taken off of the (unposted) APX series I have pending, whi=
ch<br>
I think get things into better shape (and which, with the minor editing I h=
ad<br>
to do to pull them out of that series, should be fine to move ahead). On to=
p<br>
of that we then will want to add some sanitization of input state in the<br=
>
fuzzing harness: CR4.OSXSAVE set and CPUID.XSAVE clear are clearly<br>
contradictory. There are other impossible combinations, and I think we may<=
br>
want to address some of them at the same time, and we already have<br>
sanitize_input() there. Please let us know whether you&#39;d be willing /<b=
r>
interested to make changes there, or whether we (perhaps I) should.<br>
<br>
Jan<br>
</blockquote></div>

--0000000000009e26bb065979b176--

