Return-Path: <SRS0=oX/+=76=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E988C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2020 13:30:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AB74207E8
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2020 13:30:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+G6aAFY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AB74207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlY8n-0005Sh-3p; Wed, 17 Jun 2020 13:30:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxAP=76=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jlY8l-0005Ov-9g
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 13:30:07 +0000
X-Inumbo-ID: a8325648-b09e-11ea-bb8b-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8325648-b09e-11ea-bb8b-bc764e2007e4;
 Wed, 17 Jun 2020 13:30:06 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id z206so1296255lfc.6
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2020 06:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=naV3pn/4joHIxnpAikiUebhOeeEfW7XndrRLctwWfSE=;
 b=a+G6aAFY2ZYuddGTbE64uaRh0wSUIDJP2E3Q8B/yZWMr6oQT84zjmZ27bE/ebFeYy4
 W2G34cApbUZgI3zCzZf1JAcjPsys1wyl136/rIEGjcrat1QHvuAtX0lt1ESYWHHgNWVc
 mkXpYqtBoyEcCwoy5JL9VSmrZlD0yhYVHYDdi03svRbdXFH76PWD5UhHpo81MYZkGNpR
 +NkOHdX2T1Mj0WwmCSUKupnXOMnLlXnfqoJ9h74yscH3fqz8isjzWrwSLPecEipUmdtX
 MJfMFsWuIsBfAEqjYDKdsePC5yMT+Tz4Ti2IgjQhx789j/ETL6l9Mby/ONH2uWk4g9/o
 Om1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=naV3pn/4joHIxnpAikiUebhOeeEfW7XndrRLctwWfSE=;
 b=YFaihEgG2XjTf//MIIRgHVwPC3zSxdT44h65FmlmsuKAg076sdpSozq7TEatrZZnF9
 RM5dITnA2HmjgVpjUHh6nOOuKYtOEIrNYl1OPqpXClkX9SYdSu/kGtLO0NsfpSxITOKK
 YGOtHeqZ0Y8ZUSPxyMQOgLMlMuu1T1pOKuni03WIQWGbD3JOxHq1Sd4TsAD0p5xHYzma
 4ud3CCFKwnaxP5okdLx4JRWe2f0kIvoR4yZdJjau4Gr/nfVvjpac/T3BDyU4QLhnBrz4
 IO+8pT5XDbmmmyvWdIHIgQ/Fv1ouF53AOHYQKvo3cwlajbKLvApJkHE+cv9G7Sm++lIZ
 Q9Bw==
X-Gm-Message-State: AOAM5304dEYUDq7uo5ctrDS2RSzWw5vmEiSH4wqTpW4zFqP9dIY4XmlC
 Is5PWAji4oOvRkJhzrFv3FVfX7lPDzQ6X3mlx7k=
X-Google-Smtp-Source: ABdhPJxA3ncGrXcJsse56MTtmuoV2AU6ErANEiZA6jt/WY0XTXuKKdRls+r6u6Ib8w3VOglDqxZrxnnY+E7kVsiqH/Q=
X-Received: by 2002:a19:4a4e:: with SMTP id x75mr4535830lfa.70.1592400605719; 
 Wed, 17 Jun 2020 06:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200617061349.7623-1-olaf@aepfle.de>
In-Reply-To: <20200617061349.7623-1-olaf@aepfle.de>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 17 Jun 2020 09:29:54 -0400
Message-ID: <CAKf6xpun==N06bWB8KPXfbXp3rnSz0chAeJEEmLCC7=bJn1fug@mail.gmail.com>
Subject: Re: [PATCH v1] stubdom/vtpmmgr: simplify handling of hardware_version
To: Olaf Hering <olaf@aepfle.de>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 17, 2020 at 2:16 AM Olaf Hering <olaf@aepfle.de> wrote:
>
> Remove complicated code which deals with a simple boolean, to make gcc10 =
happy.
>
> ld: /home/abuild/rpmbuild/BUILD/xen-4.14.20200616T103126.3625b04991/non-d=
bg/stubdom/vtpmmgr/vtpmmgr.a(vtpm_cmd_handler.o):(.bss+0x0): multiple defin=
ition of `tpm_version'; /home/abuild/rpmbuild/BUILD/xen-4.14.20200616T10312=
6.3625b04991/non-dbg/stubdom/vtpmmgr/vtpmmgr.a(vtpmmgr.o):(.bss+0x0): first=
 defined here
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Nice simplification.

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

