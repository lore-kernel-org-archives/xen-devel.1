Return-Path: <SRS0=3ye+=63=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2EB2C2D0FC
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2020 12:15:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7362F206D6
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2020 12:15:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fd1wzFqt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7362F206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYqIR-0006kS-3V; Wed, 13 May 2020 12:15:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WltO=63=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jYqIQ-0006jw-0Q
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 12:15:34 +0000
X-Inumbo-ID: 7151536e-9513-11ea-ae69-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7151536e-9513-11ea-ae69-bc764e2007e4;
 Wed, 13 May 2020 12:15:33 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id d22so7392804lfm.11
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2020 05:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L2W0uFkc6QuntFU2EHPcjPAwaJRKQKlwXVXdAgoHTP0=;
 b=fd1wzFqtuIvhYUrrKQwhIQ4+VgL0IRgAwDsUCefB8A2yZJVGSdB/gDpX0fC+Ea+uAk
 KXI+VJIyitEf6o3sxeVCTSgcx+p7ztx8Vkq7KJc4wfziu0r8tQgndRuddvR5CWfHv09k
 uJLsTxR6uR9l9YH7b9lGavpdaxr0ucccZrrNFc6QZg0JFAe2ngRbKpVuw0RkSJINQghu
 BK3LKCwJW5zb+6Xt2Ph064J5e+tXth4q7bJLgFrdlcljlV+qgdsY6HcM0BmztU9p9CRc
 dGtyfA1nSyP7yBYRBreYuD2oXLANtisiMkbd9kadEcJicXm5aLLelXDI2Kdd3rPWsc9o
 rcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L2W0uFkc6QuntFU2EHPcjPAwaJRKQKlwXVXdAgoHTP0=;
 b=j+a9G1nQ/FJNkakAieFfddfhHvhNZdHujoUR0cI3DLxaEG/Pn7Lz9rCjhbuEq48Bzt
 IdxebF4DHEQc7mvvGYgtBNQoDjNzp4ubdsZgSe93GefdPpKBBB0PSIn2YqhHy2436WEu
 pxLtWwU9H/ri5ilhWHWqGr3EdgQcUs3gn7f5k5Jwetx8cOUfqQBYGLre/auf+fji6ldd
 n2eJqQX2LWfMu18CGYdtlAvjYG3u/ii3N5PMqRK1H4kE3rk87nIRApi0ENfkJXr0hCaN
 OjVo2o6qn+EQqPLvmUQPVhAznlW7/QaEvowZh7cBEjD6s1dvzpg2kDOHmf87ohCF90WL
 qMZA==
X-Gm-Message-State: AOAM532aVpBdEsiNA5K8ondSun3zewqqmL18U7W7k7g95FJtzB5HlRmq
 ED1wfT9HwTbgvSulHjyGm6kbyi+9zpOsXba+mao=
X-Google-Smtp-Source: ABdhPJybBZnjHEZE4zXVStIICNBuWKF1Z3rZqHPHN2GJl9xNaPc9ph9fBC9UOXEcFIL/XZbvu3Mla1o/ZELtz9PdMys=
X-Received: by 2002:a19:7004:: with SMTP id h4mr16764878lfc.148.1589372132166; 
 Wed, 13 May 2020 05:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200512191116.6851-1-andrew.cooper3@citrix.com>
 <CAKf6xpt-WLVOTaca_FncB4XX0PQ2ZbP6GFWQjinAYex=6mptRA@mail.gmail.com>
 <6b7871d8-903a-20df-4e19-9a6200094aa5@citrix.com>
In-Reply-To: <6b7871d8-903a-20df-4e19-9a6200094aa5@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 13 May 2020 08:15:19 -0400
Message-ID: <CAKf6xpv-5gy-eiMN49w99ZpeGzNH5R2x3YmwOR+ZZsnCzb_5Gg@mail.gmail.com>
Subject: Re: [PATCH] x86/build: Unilaterally disable -fcf-protection
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Stefan Bader <stefan.bader@canonical.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 13, 2020 at 7:01 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 13/05/2020 03:35, Jason Andryuk wrote:
> > [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> >
> > On Tue, May 12, 2020 at 3:11 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >> +# Xen doesn't support CET-IBT yet.  At a minimum, logic is required to
> >> +# enable it for supervisor use, but the Livepatch functionality needs
> >> +# to learn not to overwrite ENDBR64 instructions.
> > Is the problem that existing functions start with ENDBR64, but the
> > livepatch overwrites with a "real" instruction?
>
> We livepatch by creating a new complete copy of the function, and
> putting `jmp new` at the head of the old one.
>
> This means we don't need to patch every callsite and track every
> function pointer to the old function, and we can fully revert by
> replacing the 5 bytes which became `jmp new`.
>
> With CET-IBT in the mix, livepatch will have to learn to spot an ENDBR64
> instruction and leave it intact, patching instead the next 5 bytes, so
> an old function pointer still lands on the ENDBR64 instruction.

Ah, okay.  Thanks for the explanation.

-Jason

