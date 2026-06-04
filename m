Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7073ECD6E4A
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 10:28:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1327622.1592441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV5JJ-0005EC-Hw; Thu, 04 Jun 2026 10:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327622.1592441; Thu, 04 Jun 2026 10:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV5JJ-0005E5-ER; Thu, 04 Jun 2026 10:28:25 +0000
Received: by outflank-mailman (input) for mailman id 1327622;
 Thu, 04 Jun 2026 10:28:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wV5JI-0005Dz-QA
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 10:28:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV5JH-003q1G-W2
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 12:28:24 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a215346-5cb7-0a2a0a5109dd-0a2a450ad140-4
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 12:28:23 +0200
Received: from [74.125.224.54] (helo=mail-yx1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a215346-56b3-0a2a450a0019-4a7de036e4e0-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 12:28:23 +0200
Received: by mail-yx1-f54.google.com with SMTP id
 956f58d0204a3-65eb226b1ceso585593d50.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 03:28:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1780568902; cv=none;
        d=google.com; s=arc-20240605;
        b=HFXgQ93rrQb4KmWotQTVMPr5JV0NwagbAvkOlEW4kvRVd61c1iZiAJ8+us31+XERjM
         dyPExyGTW70wVbduZwTLk4eN3cuTGwsXNXFumll96Z8FDi1z+5acR0daS7oXeJzm3d6s
         Pw/eFWMF0PKiED6yPQTWBEawsvA75BRyvoO7RfiTXRZdLeFppTzRDjOmSXWh5y8j702z
         Oc/UhslU1OJBbiIws+7Vf78BLO3BmN3VSC/a8CSU9fjhXyJG6UMya/f3+71w+3WZFIjz
         FAM2H8VLt+bDcMynE7ZY0rVfyJek6HBal/pg9y0bPVFbT2cH9ROqM/uWrmneWZsId9a+
         P7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pVMffWJhnWDz4y1GENHFYlmJvvLBHHDrwJFHR3wzWZ8=;
        fh=aTOqydVVH61A9fLIqtSJso3dR9MO//odNcGAaUB9/kQ=;
        b=dqGoiR/mHBiJS7X/B37Q2nZicdxhjNDRNjBb1h8vA+tWtzuAZ2Q4aR623XDqMD9Ulx
         6leTt6NQLOJew9syGe/WL3QkxHdO1zMsA2JcwmpkDP60cQvptH+5gxRCNFbrsRNf01Pr
         5cPjRIbr7PQpSKHDzcoTLTO6i7f0JN8YAQ1YBc7qIZ/+UDrpv69xtx7FS3UpuwPoTxpL
         KCN24s4sa94HIZwKV6rQOi6u3q5vCZ8dfQJs0y/9Hl6VuX5/mul/V6vLLHstUovib72C
         ksGUe0lwEqssSG6pU1LBGgEbb23WpE5N7aNMx1DNBRYV6trAFe5yG68MkLLGuHRu6G+f
         fL7A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780568902; x=1781173702; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVMffWJhnWDz4y1GENHFYlmJvvLBHHDrwJFHR3wzWZ8=;
        b=IbioBkqHVYmAa07sywBItlzBIFx5N4LvpcpyWqvCPBoo/r2BHAUS1V7HnLWrPc/c32
         F1s/XY5BP480n84T4mn635MWJ5bansEzs8b5k0m7Iu9egjmQ6yiIvMxUok+s/Cov8Moh
         IDFYNLxyxZPG+zc5ZWl+/77IjUYK5OjrrBg4Cx5hUjcAGvqNln0fwteNcMvYr8B8YT9R
         DlszotJKoA5VvsdAl0kDtpcLcgX+STWgGEzfKWBmeqChyKFZY9u8Q1AAMpOpMMUOlwRO
         4guXXIvNL3QwqdencnUW81f3YgzeZeaYacPIEHprhVle11g1sYgmRpLd3zZwm9v3nz+D
         ZI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780568902; x=1781173702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pVMffWJhnWDz4y1GENHFYlmJvvLBHHDrwJFHR3wzWZ8=;
        b=qcYNXTZ168ujLVXQ6FYKYS4U0xKJX+dbFKCBzt68c746zKGhJgYQbRGFIs9UR/x0oa
         ATMeFDhDWYl6ZJ0GR/udJY8LViQxd/2Wu/mMWAB1hBltm5cxySwlNzYi8YIc4pW1t1UR
         pW+0ovIxgszkP/7gjEFCNaNC66jy2v4jpuDDaKsYkFFXQzlDXndHdF9+eydKAgIVFAaM
         uLWrivSQ9FXghCZhcGgFb3Dl8fGH444duYVOxtfWXFUiOw2uVf2wwY8lgT7MVp0MhIjB
         d/2FyhN9hXbeAFUufEiWqYusVslpaLpntcKD5rw5CmVOJFhgWZga4WIlvCaG+wnh8htj
         2fzg==
X-Forwarded-Encrypted: i=1; AFNElJ+JApZ13I41S7Ls/B7kER/27aiBN2dB/XhGW9zOjobou78r/EWFLHNLCbHdR9XtEdjAkq5uCEr8b40=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvIQwoltzWNnqYlZBtM790tNaKV9cdXcS3l7LcHaZX3Mmlqpmx
	2sgF5F3qHWcoWgBRfrPexWDAgVxUPht3aZt48AhTTio4QuvhQ0UQUNEbXt6pCWt7CC2fLchKuJX
	iT+RSwReDojIPZvDqgEdO8kgbKxh1aVg=
X-Gm-Gg: Acq92OHH5UzdQXWlAHXVpb0UlCILlMbMhqfIe0R5SstPDdCjeeTNU3dS0JBfjaK5yV0
	AeoB4y5fs8IBRT29MSP7ZCZmR+i5pUYYcomMWyp36vtXRLDROy2SC9pYyCCrkyi1Ik6xSfm9bbq
	1QAfJQQNUJPvCgO3E1LpkQYcl6Z7h39k6myuEE7P7pDYTkQ/dZYKAQiR/RJ4RMvrlqCJ4d2L8Ov
	rm6LPsLb0Lrsny4lzJJC1HzxbItxhpXA80VGKQsHxut0WODMFvqgcvumeb6RIb2B1Q5pMFnQD+n
	kJh1zMnklAyGxwC/esDz60La5cp9mfPES6Df4XEWkQM636CO
X-Received: by 2002:a53:cf09:0:b0:660:34af:b504 with SMTP id
 956f58d0204a3-660dc4dda2dmr4819183d50.30.1780568902136; Thu, 04 Jun 2026
 03:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-4-frediano.ziglio@cloud.com> <35a67929-aaef-4b1f-8370-7dcdf096fbb1@suse.com>
In-Reply-To: <35a67929-aaef-4b1f-8370-7dcdf096fbb1@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 4 Jun 2026 11:28:11 +0100
X-Gm-Features: AVHnY4IJNGX13Vu7Aybzk374iJP6gVEiIfHahDACXhbp4A5RMcwVLm6ICj75Aso
Message-ID: <CAHt6W4fXPy9o2VzO-E+PkNv+VA2FcRPTzJzH6gAyqwXuV6ytmg@mail.gmail.com>
Subject: Re: [PATCH 3/6] x86/efi: discard .text.header for PE binary
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1780568903-7DB818B7-67AC8646/0/0
X-purgate-type: clean
X-purgate-size: 1688

On Tue, 2 Jun 2026 at 13:15, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 29.05.2026 17:35, Frediano Ziglio wrote:
> > From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >
> > The multiboot headers are not consumed in the PE binary, hence discard =
them
> > in the linker script when doing a PE build.
>
> Yet weren't there plans to allow making use of those headers even in xen.=
efi?
>

That method was replaced by different ways of loading. Using multiboot
for PE would require some extensions to multiboot as the protocol is
not designed to support PE format. There are already ways to use EFI
and configuration files that can be used. We (as Citrix) are going
(not me personally) to post changes to extend xen_hypervisor and
xen_module (used currently only by ARM) to x64. These changes are much
smaller, maintainable and coherent.

> > That removes some relocations that otherwise appear due to the usage of=
 the
> > start and __efi64_mb2_start symbols in the multiboot2 header.
> >
> > No functional change intended.
> >
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/xen.lds.S | 3 +++
> >  1 file changed, 3 insertions(+)
>
> This is lacking your own S-o-b.
>
> > --- a/xen/arch/x86/xen.lds.S
> > +++ b/xen/arch/x86/xen.lds.S
> > @@ -57,6 +57,9 @@ SECTIONS
> >    __image_base__ =3D .;
> >  #else
> >    . =3D __image_base__;
> > +  /DISCARD/ : {
> > +    *(.text.header)
> > +  }
> >  #endif
>
> We already have DISCARD_SECTIONS, so I think it needs clarifying why that
> can't be used / extended.
>

Yes, this can be done that way. Roger, do you agree on this ?

> Jan

Frediano

