Return-Path: <SRS0=s5AT=DT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569A1C433E7
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2020 13:55:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E94642074F
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2020 13:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E94642074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eik.bme.hu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.5954.15511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRyIP-0002Au-Uv; Mon, 12 Oct 2020 13:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5954.15511; Mon, 12 Oct 2020 13:55:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRyIP-0002An-RI; Mon, 12 Oct 2020 13:55:25 +0000
Received: by outflank-mailman (input) for mailman id 5954;
 Mon, 12 Oct 2020 13:55:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R8H3=DT=eik.bme.hu=balaton@srs-us1.protection.inumbo.net>)
 id 1kRyIN-0002Ai-W6
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 13:55:24 +0000
Received: from zero.eik.bme.hu (unknown [2001:738:2001:2001::2001])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d85a01d-8cc9-40dc-9dc1-d03dbe13488c;
 Mon, 12 Oct 2020 13:55:20 +0000 (UTC)
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0E74074594E;
 Mon, 12 Oct 2020 15:55:19 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E0E53745712; Mon, 12 Oct 2020 15:55:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DF31F745702;
 Mon, 12 Oct 2020 15:55:18 +0200 (CEST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=R8H3=DT=eik.bme.hu=balaton@srs-us1.protection.inumbo.net>)
	id 1kRyIN-0002Ai-W6
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 13:55:24 +0000
X-Inumbo-ID: 3d85a01d-8cc9-40dc-9dc1-d03dbe13488c
Received: from zero.eik.bme.hu (unknown [2001:738:2001:2001::2001])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3d85a01d-8cc9-40dc-9dc1-d03dbe13488c;
	Mon, 12 Oct 2020 13:55:20 +0000 (UTC)
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 0E74074594E;
	Mon, 12 Oct 2020 15:55:19 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id E0E53745712; Mon, 12 Oct 2020 15:55:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id DF31F745702;
	Mon, 12 Oct 2020 15:55:18 +0200 (CEST)
Date: Mon, 12 Oct 2020 15:55:18 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
    Paul Durrant <paul@xen.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    Huacai Chen <chenhc@lemote.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org, 
    Helge Deller <deller@gmx.de>, "Michael S. Tsirkin" <mst@redhat.com>, 
    Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
    David Gibson <david@gibson.dropbear.id.au>, 
    Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
    Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org, 
    =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
    Richard Henderson <rth@twiddle.net>, 
    =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
    qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
    Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 1/5] hw/pci-host/bonito: Make PCI_ADDR() macro more
 readable
In-Reply-To: <20201012124506.3406909-2-philmd@redhat.com>
Message-ID: <3894edd-a214-3edf-8cbe-3566842e8a4@eik.bme.hu>
References: <20201012124506.3406909-1-philmd@redhat.com> <20201012124506.3406909-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-694601815-1602510918=:97629"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-694601815-1602510918=:97629
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 12 Oct 2020, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
> The PCI_ADDR() macro use generic PCI fields shifted by 8-bit.
> Rewrite it extracting the shift operation one layer.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/pci-host/bonito.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index a99eced0657..abb3ee86769 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -196,8 +196,8 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
> #define PCI_IDSEL_VIA686B          (1 << PCI_IDSEL_VIA686B_BIT)
>
> #define PCI_ADDR(busno , devno , funno , regno)  \
> -    ((((busno) << 16) & 0xff0000) + (((devno) << 11) & 0xf800) + \
> -    (((funno) << 8) & 0x700) + (regno))
> +    ((((busno) << 8) & 0xff00) + (((devno) << 3) & 0xf8) + \
> +    (((funno) & 0x7) << 8) + (regno))

Are you missing a << 8 somewhere before + (regno) or both of these are 
equally unreadable and I've missed something? This seems to be completely 
replaced by next patch so what's the point of this change?

Regards,
BALATON Zoltan

>
> typedef struct BonitoState BonitoState;
>
>
--3866299591-694601815-1602510918=:97629--

