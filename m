Return-Path: <SRS0=FTuz=6G=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FBEC54FCB
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2020 19:47:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6439320644
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2020 19:47:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="obB0vOxK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6439320644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRLKq-0007DR-QC; Wed, 22 Apr 2020 19:47:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ldCW=6G=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jRLKp-0007DM-S0
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 19:47:03 +0000
X-Inumbo-ID: 094a1414-84d2-11ea-9e09-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 094a1414-84d2-11ea-9e09-bc764e2007e4;
 Wed, 22 Apr 2020 19:47:03 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l11so2747541lfc.5
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2020 12:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fH5ovlMQHSD35J+5fA7W367GKpKz222U1ZfjV1xIg7E=;
 b=obB0vOxKEhc05/wG2Cw6EK0B2bGPmU0rWBnrYmTQMAuNVBQdCtfSpr1laclLY4KBvZ
 1rC5C0rKhiLackNxPA08vUd4uSvpXVSnXLfGSATGQHChB9SaYc5f4zHj/YO1i1FBnXi8
 +Ur3tL5qCcduVoxgVDRKBGD8osheNux7KtdYjmD1yemS50g1w/CrfRFE/Af1JbIUITGQ
 Ncrhi0j64zibkSgjaxA9Uhsn8m7AHkEAZwdpemoamVe1nixqVxUHdC/arUwLeHK6HwRx
 E7NtWA8It4yQDLtrLn/CBm62JGoSRXy/SRpW+GfxWb13PViv6JWGZdFnydduENJeuR95
 7NRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fH5ovlMQHSD35J+5fA7W367GKpKz222U1ZfjV1xIg7E=;
 b=Fg9fqmXsfmAaFOuPwlqfl4hcFKgZlEbAXU5HSTS/4j83X1mXHFANC1sfYVIAv8MNTS
 DZ5zNo7MEnoTRDM9fEcncy21GKUqukG3GEG+oHrVG2c76ewd+otVn+KRmn/4kz7GhtDC
 EXLno5nqOlIaih2A0foiKw/wjCGB5oq9FOphX/shUTUSpT00+kn9zIViml3UUNFhnqyT
 kRjFdTRpR641MCYK5knxgxD+iYuJaMon5rgvxL3pCr0yMjQ4UVy0KIA13QiQtQH8uIih
 YkvV+0cFYezpvFy6sZN6n3k51+ZckSMFgteHWA2zzqs0ZK5g/8uL7JDi70udtPs3XpJz
 Kt+w==
X-Gm-Message-State: AGi0PuZRK7gld9Z9dfodofaRNErqNwBHiJxatH5xL2ZzuM57Rq8t1Dnv
 utR5zz6EIFrCIi0FJrCWAYxL0T+q8hlkaem4Sgk=
X-Google-Smtp-Source: APiQypKJcp00pj5t78apj5qE1RxvSfKr92SkVWprDNXkhvU0tl8gF1Pk6rj9OQy/uhVme/lwWFe7+iwYFBOujhCoDio=
X-Received: by 2002:a19:6007:: with SMTP id u7mr114957lfb.9.1587584821755;
 Wed, 22 Apr 2020 12:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586727061.git.rosbrookn@ainfosec.com>
 <e2d8d6c1293c8251be881cd471265aa8188ae2ae.1586727061.git.rosbrookn@ainfosec.com>
 <65721F76-319A-47E4-8184-116F02B2BCE3@citrix.com>
In-Reply-To: <65721F76-319A-47E4-8184-116F02B2BCE3@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Wed, 22 Apr 2020 15:46:50 -0400
Message-ID: <CAEBZRSckvUqCikFhtHECzmybwC_d8ojCfvBznvF90A7pS1A_1Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] golang/xenlight: add NameToDomid and DomidToName util
 functions
To: George Dunlap <George.Dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> libxl.h defines INVALID_DOMID =E2=80=94 do we want to define an exported =
constant with the same name and use that here?  (Although part of me wonder=
s if DOMID_INVALID would be a better option.)

Yeah, that makes sense. I'll add that.

> > +     }
> > +
> > +     return Domid(domid), nil
> > +}
> > +
> > +// DomidToName returns the name for a domain, given its domid.
> > +func (Ctx *Context) DomidToName(domid Domid) string {
> > +     cname :=3D C.libxl_domid_to_name(Ctx.ctx, C.uint32_t(domid))
> > +     defer C.free(unsafe.Pointer(cname))
> > +
> > +     return C.GoString(cname)
> > +}
>
> It looks to me like if the domid doesn=E2=80=99t exist, libxl_domid_to_na=
me() will return NULL; and then DomidToName will return =E2=80=9C=E2=80=9D.=
  Is that what we want?
>
> If so, it should probably be documented.

I considered returning an error if C.GoString(cname) =3D=3D "". But, with
these functions (as well as the others in these series), I opted to
keep the signatures aligned with their libxl counterparts since we're
keeping the package API mostly one-to-one with libxl. I can add a
second return value if you prefer, otherwise I'll just add a note in
the comment.

> One thing that might be worth pointing out is that both of these function=
s are actually racy: There=E2=80=99s no guarantee that by the time libxl_do=
mid_to_name() returns that the domain with that name has died, and another =
domain with a different name has re-used the same domid.  That=E2=80=99s pa=
rtly why Xen has the whole =E2=80=9Cdomain reaper=E2=80=9D system, like for=
 Unix processes (which so far isn=E2=80=99t implementable yet with the gola=
ng wrappers).  I think when we make our =E2=80=9Cvm=E2=80=9D library, we=E2=
=80=99re going to want to try to come up with something like an object that=
 makes it easy to avoid this sort of race.

That's good to know, thanks. I'll add that to the comments as well.

> But that=E2=80=99s a discussion for another day. :-)  Everything else loo=
ks good, thanks.

Thanks!

-NR

