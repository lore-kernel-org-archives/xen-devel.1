Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44852C531CC
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 19:38:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369538.1618184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmzF6-0004Qc-5b; Thu, 23 Jul 2026 19:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369538.1618184; Thu, 23 Jul 2026 19:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmzF6-0004QR-0Q; Thu, 23 Jul 2026 19:38:04 +0000
Received: by outflank-mailman (input) for mailman id 1369538;
 Thu, 23 Jul 2026 19:38:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brgerst@gmail.com>) id 1wmzF3-0004QL-Ua
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 19:38:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmzF3-0026Ml-BL
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 21:38:01 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brgerst@gmail.com>)
 id 6a626d77-e002-0a2a0a5209dd-0a2a4504dc08-36
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 21:38:01 +0200
Received: from [209.85.217.49] (helo=mail-vs1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brgerst@gmail.com>)
 id 6a626d98-b57f-0a2a45040019-d155d931e9f8-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 21:38:01 +0200
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-738cdd667ceso276384137.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 12:38:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1784835480; cv=none;
        d=google.com; s=arc-20260327;
        b=JK2o17UXWsvtA94km22snwH6gJSIy+vnriPiv9ZdUUz+uC/NPaic83tyRiOKsb+Ewr
         i8oKWgf4pyyb8O/Kea2cTNKOrdEnL6LqxCJCSnchZaufzGNmDIpZ6esxqasmSfz7UsM2
         z3cnTNmqXvtTHw3IGslymH+zdXIKQRSTe+4nw+Pq8cWSxB9t06flL0lB7lheSVdnXtkI
         Bd/htiUC43A5iKlbTlv3zUKIbXJwb/MbginUak1+sm7hCdOfCPeJQxFMa/pNibFkD7r7
         2McnzTBrz6aMV9SiyzCpts8afXG7ztVjT2argJYLmJWOdqMomV954yA5ghZ8y3rfyhIX
         D0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oWKbsBbm9eg9R7aduyFLAHcnNHPcWLLQDbRXMW+g5LI=;
        fh=zsexs5QKyhlFxqTRjP77L6TwkfDMn9yRs0P53mmNGEs=;
        b=JZ01/APj29x9Zwv6t13kscKArZrlVC2kC0i0PlFpcLLWHJ64D+jnnjt2MHnIdG/nA8
         GiIvs9Xhtv8C6//R4al9nga2Yk1OJ30zzZ9RWQRQRK1hTciR/Zp8XUqFl+G7yBVyJ9dB
         G9s1yKddo3UabviSXtwNtxOcV43xOXE4K7cISVl4IhU3C/5OEXrfHT90mCm42pnInBsu
         MJ5YM3hU+LWUieMoo879pft69BwuLFp7TuHSw0/IN126W63hukMEFIFrrb4QMBr9o5X7
         bbYNx/urF9FGW9N6+r4f4qGvQxPQhbb8/mmPltKLYVXBKAP9fcfEChBrVzw6E7n2QPlc
         kLbQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784835480; x=1785440280; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oWKbsBbm9eg9R7aduyFLAHcnNHPcWLLQDbRXMW+g5LI=;
        b=DNnHfnoRBT3AMSlXDOP8HJJranQ4IG7vu5MlMC5QiDa/RLKgJ1MgAYndgvdGl2GtZ9
         f1dJqjUjeo9Q/W0naYblTZ6oiO7frM7yk8Bty9gYo6GaWbOWxRYEuX3JlYBLsSHuWnlF
         +eAoWT6CrT2xzHSoGIysbjqke8Im634D5/0H3eb+3r5DjVFWVRuC/h09Z5hR+GAxrH7j
         cZwpsVFRldQbz3xlBx/tGXyKg9EHxjMEriv2aQtt6ATH22p0X5rWFKJiuvysWDrA6koX
         dDO3Fuvvmo5/OfpoKzOjGI2UFk00tOL0xPMjhMEDkuX6wPHOgVqDpfpotnCn+3D5xvUy
         aOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784835480; x=1785440280;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oWKbsBbm9eg9R7aduyFLAHcnNHPcWLLQDbRXMW+g5LI=;
        b=lP7jcmnzYS0dhsidzgzC/16DQLgQXovqQbk5LXp2hJeiGI6fmmzOCRyvZcllhijpRi
         Fac2su2qr/rSottEaqe/RVc7FZhshPfesXt6q30a3ABz7gCaEl4v+k8msRSHJzSrDSv7
         ALlZ7TS7FKR8x4MsqEKe1t/WiDLw9XRwL6qPlTIc/QhOUXwr0Qh48+eZK8xQV1vuqbfq
         E++tnLoKEryvJEQ1acOuXv9RDa9uCc32xeS1aC1ngtddsblPnYM5jPyXMY3lpjL+QxGR
         sgNRCN5+SMAjmm47fc4UZZ0xZbZn2p34LTmnyOnHgDFGe1PcD9YYfd9oEh8UObd+lglp
         5hOA==
X-Forwarded-Encrypted: i=1; AHgh+RriSqoIuRbMZAMDzCvfXbny9XMHxiD1WHfKSfMKnhdMv5x6tRw8S1QEUdmgs5r89Umd1x7ykvGraWw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPGELoeSLTKvCWimj9dZNcQahuTMtrvjIbUwYoppOfAqDYUDdU
	AjDCzd5cPtNXSJOXfWPvHEfi2AOYykWwj/twajXMGoIaAXdk57MhFLysWdYUQC1wjLZRPss2mqD
	UTm5n/ZiMP69IyvgZzFn3/gX++DTZ9g==
X-Gm-Gg: AR+sD11w1gslcRScS9tPwmmk+ON9S023kVU0yQNcZnNN+bi9+5WxRJmI7dUZ9xlkq7l
	2m0mVL0bo0cu6QYvq9FK7ZrA/zWpVlHe9e8JGL3lFpw20ze7jPyYaPsA+6cd/AsZNrWw8339XpC
	AEoZ44wjugX+aiiWkDxUX4n8E1qTcPtH/EJTE23TrACw8TVErtPxPK6k7v/qph5jusbRXzMRFA5
	k+wrm7qcGePSGv1jsdUFA0QN+GsbfhHRwuNoTIrJzAcbf6p2PyMK8STD6tmv8FEd+h+ASQfEfqD
X-Received: by 2002:a05:6102:953:b0:745:9c0f:9353 with SMTP id
 ada2fe7eead31-74d6110cc5fmr2202108137.27.1784835479735; Thu, 23 Jul 2026
 12:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
 <20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com> <20260722170334.GCamD35gwrCng30WH1@fat_crate.local>
 <0F3A1121-208F-4F71-8C88-BEAE7CB50E75@zytor.com>
In-Reply-To: <0F3A1121-208F-4F71-8C88-BEAE7CB50E75@zytor.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Thu, 23 Jul 2026 15:37:48 -0400
X-Gm-Features: AUfX_mwBzqaUZxwX7i1MT2KeOpbwLGgmkPYGJI_vQ13SYop1F_xWidxI_jhgaXk
Message-ID: <CAMzpN2hyupAUk-XGRzM2wwQojPrsN66jWtT+saVf1NWdOzFXuw@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] x86/asm: add volatile, clobbers and zero-length
 check in inline memcmp
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Borislav Petkov <bp@alien8.de>, Mauricio Faria de Oliveira <mfo@igalia.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1784835481-587C6B50-E896C5FD/0/0
X-purgate-type: clean
X-purgate-size: 2873

On Wed, Jul 22, 2026 at 2:53=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> On July 22, 2026 10:03:34 AM PDT, Borislav Petkov <bp@alien8.de> wrote:
> >hpa in To:.
> >
> >On Tue, Jul 21, 2026 at 12:56:43PM -0300, Mauricio Faria de Oliveira wro=
te:
> >> Add the volatile qualifier and clobbers parameter to prevent bugs with
> >> instruction reordering and optimization.
> >>
> >> Also check the zero-length case, as the 'repe' prefix does not run the
> >> 'cmpsb' instruction if the 'count' register is zero, which doesn't set
> >
> >Please use capital letters for insns: REPE, CMPSB and you don't need to =
put
> >words in '' - it reads fine without them.
> >
> >> the condition-code/zero flag, so the result is based on a stale flag.
> >>
> >> Those are pre-existing issues found by Sashiko.
> >>
> >> Link: https://sashiko.dev/#/patchset/20260701-pvh-kasan-inline-v6-0-ba=
99045dfa9f%40igalia.com
> >> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> >> ---
> >>  arch/x86/include/asm/shared/string.h | 8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/a=
sm/shared/string.h
> >> index 02b92927553f7b8e1c87e6122bbaa70439e57ea7..166274e44f3cb49e3dccab=
3cdac281d67aef5d44 100644
> >> --- a/arch/x86/include/asm/shared/string.h
> >> +++ b/arch/x86/include/asm/shared/string.h
> >> @@ -11,8 +11,12 @@ static __always_inline int __inline_memcmp(const vo=
id *s1, const void *s2, size_
> >>  {
> >>      bool diff;
> >>
> >> -    asm("repe cmpsb"
> >> -        : "=3D@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
> >> +    if (len =3D=3D 0)
> >> +            return 0;
> >> +
> >> +    asm volatile("repe cmpsb"
> >> +                 : "=3D@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len=
)
> >> +                 : : "cc", "memory");
> >>
> >>      return diff;
> >>  }
> >
> >So this is a fix which should probably go to stable, I think. Going back=
 into
> >git history, it points to
> >
> >  62bd0337d0c4 ("Top header file for new x86 setup code")
> >
> >from 2007. And we have carried it this way through the years and who kno=
ws
> >what hit this or not. So please make this the first patch in your set - =
you
> >can even send it separately so that I can get route it through stable.
> >
> >Then you can base the rest ontop.
> >
> >Thx.
> >
>
> Also, this is silly. Instead of adding a whole separate test, just do "te=
st %3,%3" before the repe to set ZF and let the REPE skip.

REPE does not check ZF before the first iteration.

From the Intel SDM:
"When the REPE/REPZ and REPNE/REPNZ prefixes are used, the ZF flag
does not require initialization because both
the CMPS and SCAS instructions affect the ZF flag according to the
results of the comparisons they make."

