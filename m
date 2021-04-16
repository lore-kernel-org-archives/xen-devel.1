Return-Path: <SRS0=C5Y3=JN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B9CC433ED
	for <xen-devel@archiver.kernel.org>; Fri, 16 Apr 2021 14:59:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A51716115B
	for <xen-devel@archiver.kernel.org>; Fri, 16 Apr 2021 14:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A51716115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.111841.213851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXPwD-0001s7-1E; Fri, 16 Apr 2021 14:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111841.213851; Fri, 16 Apr 2021 14:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXPwC-0001s0-UV; Fri, 16 Apr 2021 14:59:16 +0000
Received: by outflank-mailman (input) for mailman id 111841;
 Fri, 16 Apr 2021 14:59:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rlMZ=JN=gmail.com=charles.fg@srs-us1.protection.inumbo.net>)
 id 1lXPwC-0001rv-8o
 for xen-devel@lists.xen.org; Fri, 16 Apr 2021 14:59:16 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e2757b8-cfe9-420d-a7bf-0413cf3e5a29;
 Fri, 16 Apr 2021 14:59:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s7so26892385wru.6
 for <xen-devel@lists.xen.org>; Fri, 16 Apr 2021 07:59:15 -0700 (PDT)
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
X-Inumbo-ID: 9e2757b8-cfe9-420d-a7bf-0413cf3e5a29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=/vd7ZDiBMdvbmddFsNi+e9A5Ho6DEA4uIlue5mzgY3c=;
        b=NlT9w9ChZDAQvUgMZxxFDI+du/YTBkdrUTL9BPfaNH/CSv4mll0x5RemPbRhfIdWtg
         AqiP2q6hK8VmRFXO7IukwnWH1EYceSTFZFSaOCTZ54+qoPYcO2e+L+y3u3jPeKlhXkRR
         FldLzA5fnsGcoyGEnzSgx6y7p5uGG8lQXrzc8jkwKzMiVRRPHSwDsc31cxJdDmVRlrG8
         4RDgl/9VnvETrlXR5hPyVhOwzsqXBg06BAj0xCRKv+wPBSlOx+26GMg0oXYpyiV8Ihz4
         IbLp8H/R/7YtjCf5gcf1ZGSd6khNEvKevv3FWFfjmM+X3DSuqbZrrjw/nL1QhVmTLBuO
         /qyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/vd7ZDiBMdvbmddFsNi+e9A5Ho6DEA4uIlue5mzgY3c=;
        b=TPDWavXeze+V4sjzwB4J+S+tTSD+n8zLIL6smFbSTaJaa4lqrAsG1NqEu6GDgqg1Hw
         mOYPaJyWrRZZ/v85QvnkrxmpeH8DAMsWGGptY5XMPEhh/kgJMF8CfLtUfVvPHCH7ihs5
         lLqqx15TTc/4ZwBFnbahss4w5kK4t0oJhfjg9Vm8gOPXFxLhNVVNscRZaw84L9y/NxkZ
         T61BtAKPkqJQQJqNWn/BpAOiuGlkOCI+G1drl37HfZ29gZhVdlNBBlaBHOK4wRfQxNQY
         tjobX2y4N/6qrWow0UvmCM4+KXztMv2mUvyy5wCcjPrn8zqHQ4u0jmy53t/3yPXjR+vJ
         1HPw==
X-Gm-Message-State: AOAM5336lKfkYZBzvF0elrIbfSHO9VCDCKYu03pm0idaJyVcOLdhXNwP
	6hVVqxxvF+J7zhPoQsYbsjRWwgjSAaxARYyga4xtSFNPPcGr8Q==
X-Google-Smtp-Source: ABdhPJyGScmugxdHXBQCmO9otJlB2QmMK090t3U3RvGpCzHRvd0eZcVjo6FOGw8C3KgjI9TnVw6bhzbHEFynAW7zclc=
X-Received: by 2002:adf:ea09:: with SMTP id q9mr9886232wrm.235.1618585154210;
 Fri, 16 Apr 2021 07:59:14 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Charles_Gon=C3=A7alves?= <charles.fg@gmail.com>
Date: Fri, 16 Apr 2021 15:58:38 +0100
Message-ID: <CAAQRGoBV4noq8n=k0a-h8T0ZFnKUnAQQr-=VywCaXzbWxPsgZg@mail.gmail.com>
Subject: Memory Layout on Dom0 in PV
To: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="00000000000027d08005c01839ec"

--00000000000027d08005c01839ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Guys,

Does memory on Dom0 also mapped to gpfn or it is mapped directly to mfn?

 If mapped to gpfn, how can I access its p2m mapping?

I'm trying to use the xen-mfndump but it is not working with dom0

./xen-mfndump dump-p2m 0
xc: error: Could not map the shared info frame (MFN 0xddfe9) (3 =3D No
such process): Internal error
xc: error: Could not map domain 0 memory information: Internal error

The problem that I'm wanting to solve is:

Given a va in a process on dom0, I can get its physical representation (mfn
or gpfn depending on how this works on PV) using /proc/pid/pagemap and with
this I can access its real mfn.

This works perfectly with domU but not with dom0, why?

Atenciosamente,
*Charles Ferreira Gon=C3=A7alves *

--00000000000027d08005c01839ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p></p>
<p>Hello Guys,</p>
<p>Does memory on Dom0 also mapped to gpfn or it is mapped directly to mfn?=
=C2=A0</p><p>=C2=A0If mapped to gpfn, how can I access its=C2=A0p2m mapping=
?</p>
<p>I&#39;m trying to use the xen-mfndump but it is not working with dom0</p=
>
<pre><code class=3D"gmail-language-c">./xen-mfndump dump-p2m 0             =
                                                            =20
xc: error: Could not map the shared info frame (MFN 0xddfe9) (3 =3D No such=
 process): Internal error
xc: error: Could not map domain 0 memory information: Internal error
</code></pre>
<p>The problem that I&#39;m wanting to solve is:</p>
<p>Given a va in a process on dom0, I can get its physical representation (=
mfn or gpfn depending on how this works on PV) using <code>/proc/pid/pagema=
p</code>  and with this I can access its real mfn.</p>
<p>This works perfectly with domU but not with dom0, why?</p><div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div><br></div><div>Atenciosamente,</div><b>Charles Ferreira Go=
n=C3=A7alves </b><br><font color=3D"#666666"><br></font><font color=3D"#666=
666" size=3D"1"><br></font></div></div></div></div>

--00000000000027d08005c01839ec--

