Return-Path: <SRS0=bMr6=AR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27017C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2020 17:00:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB87F20702
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2020 17:00:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t+L89Nig"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB87F20702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsUTF-0004ok-22; Mon, 06 Jul 2020 16:59:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiqY=AR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsUTE-0004oM-JT
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 16:59:56 +0000
X-Inumbo-ID: 1e305074-bfaa-11ea-b7bb-bc764e2007e4
Received: from mail-il1-x142.google.com (unknown [2607:f8b0:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e305074-bfaa-11ea-b7bb-bc764e2007e4;
 Mon, 06 Jul 2020 16:59:56 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id s21so18359343ilk.5
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 09:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9/leO9q/0J5ZJH/Ka9OiHxF4rkOPGYi23nLotDw5+po=;
 b=t+L89NigImBrMi5A+L/vayp2Ek2Z1xRrRswlKbUWeD6I7FIa+voJRjlBIqb0sMzDec
 lqkQijLEMiyv2fVJODfnOo9v77QgO6cdGwJYO8vhoClltQxpALdDRs8ENXpnUTqPC8qf
 cTqrxHmxfkx4pm++FONued1iM/PgnDbs7eHuq38xcfAZlmcjn7mbBAeb9JBvYwXLMk1x
 fkmZUkSQLJ52R1fsCbmaL3rpzt43x9FH+XrveDmr0sQHoPrYO1DZaIY+DO5ZZzWlqj8M
 WZZMs8mMEJb1bdpZBZrqRgqogw2cqAXAXg5S3fLxb9M/1IpPh6xuhL4Lmki4tyc8gx5S
 /BcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9/leO9q/0J5ZJH/Ka9OiHxF4rkOPGYi23nLotDw5+po=;
 b=KVYMsLgSYJqWEQaASvyU6nBZAs0es6YBKMwmRphiZTdDzo4nEqoFylq66iKGNu4Qy1
 K/0j4yiJ7nypOXvs/xvfxq//kKSdeRDa3Vb2NWkCZdDt5OKigwSPdTJBLJ4Se4Ki8R5H
 RldbA/7tu1F4pwcSJ07vNmRVyVe1WdJC+ViuYX0OpDeIuq0EK5FEpttHQAhLgHVilS3T
 FntoNaG/YmQGfURi8S6nqCZs5rae06B989o38Rxb2CgTfmb5DfsEAtsmdcvXXQXtcyOw
 soPax9pzJwYAjqS+PcE0EpjZfGrxO3XHtEE5Yk9gwNQpX1YhEMpimAXsVXZBAfpcK5RM
 LlhQ==
X-Gm-Message-State: AOAM533/VFEYVM8CR5diB/oTePHBV8LkWxOEqJSO5sWdmKs0VOhp6Zyr
 3AsqGOT23AFtjRjaDpWjMIh6OAmN88VouJrTerU=
X-Google-Smtp-Source: ABdhPJw/HaHEsm0ulaS03PTv+Iez2OAy3BXjXkZdtFUms+Csyj/gKycDAQBhYI+0mtg7FDmV0+SOu7NjIzp7EDuPP3Q=
X-Received: by 2002:a92:c213:: with SMTP id j19mr31588925ilo.40.1594054795800; 
 Mon, 06 Jul 2020 09:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-3-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-3-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:50:09 -0700
Message-ID: <CAKmqyKNB3fQCBNZ29cRuj5LW14duowkP6+k+6V0fhHhZU+GtsQ@mail.gmail.com>
Subject: Re: [PATCH 02/26] hw/ppc/sam460ex: Add missing 'hw/pci/pci.h' header
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Paul Zimmerman <pauldzim@gmail.com>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Jul 4, 2020 at 7:50 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> This file uses pci_create_simple() and PCI_DEVFN() which are both
> declared in "hw/pci/pci.h". This include is indirectly included
> by an USB header. As we want to reduce the USB header inclusions
> later, include the PCI header now, to avoid later:
>
>   hw/ppc/sam460ex.c:397:5: error: implicit declaration of function =E2=80=
=98pci_create_simple=E2=80=99; did you mean =E2=80=98sysbus_create_simple=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>     397 |     pci_create_simple(pci_bus, PCI_DEVFN(6, 0), "sm501");
>         |     ^~~~~~~~~~~~~~~~~
>         |     sysbus_create_simple
>   hw/ppc/sam460ex.c:397:5: error: nested extern declaration of =E2=80=98p=
ci_create_simple=E2=80=99 [-Werror=3Dnested-externs]
>   hw/ppc/sam460ex.c:397:32: error: implicit declaration of function =E2=
=80=98PCI_DEVFN=E2=80=99 [-Werror=3Dimplicit-function-declaration]
>     397 |     pci_create_simple(pci_bus, PCI_DEVFN(6, 0), "sm501");
>         |                                ^~~~~~~~~
>   hw/ppc/sam460ex.c:397:32: error: nested extern declaration of =E2=80=98=
PCI_DEVFN=E2=80=99 [-Werror=3Dnested-externs]
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ppc/sam460ex.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 1a106a68de..fae970b142 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -38,6 +38,7 @@
>  #include "hw/usb/hcd-ehci.h"
>  #include "hw/ppc/fdt.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/pci/pci.h"
>
>  #include <libfdt.h>
>
> --
> 2.21.3
>
>

