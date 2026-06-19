Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A64CD4F26
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2026 14:58:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1342451.1602629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waafw-0004Ag-CG; Fri, 19 Jun 2026 14:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342451.1602629; Fri, 19 Jun 2026 14:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waafw-0004AZ-9W; Fri, 19 Jun 2026 14:58:32 +0000
Received: by outflank-mailman (input) for mailman id 1342451;
 Fri, 19 Jun 2026 14:58:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ee063ee8a000701b@swg.vates.tech>)
 id 1waafu-0004AT-Nv
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 14:58:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waaft-00DU7g-U7
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 16:58:29 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ee063ee8a000701b@swg.vates.tech>)
 id 6a355902-2eae-0a2a0a5409dd-0a2a45069c2c-20
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 16:58:29 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ee063ee8a000701b@swg.vates.tech>)
 id 6a355915-b690-0a2a45060019-b9ff1c128879-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 16:58:29 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ee063ee8a000701b.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 19 Jun 2026 14:58:26 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3ED2780D7B;
 Fri, 19 Jun 2026 16:58:25 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=O5m4Va05OdUO+PtAurI8jaWiCM+Q9jQY9NGu/Ky7uUE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=A+Jnyh30ZyMamo834T8158SIF3jAQYmccJTjmvv7Dr7CxDlR8crx15sTGdtfT2mMsese0K+ij
 sXg79//FW2vzAF21VfdvTN4dGYfMzmgMT45asyhqRzMog/eSqRLLFDGfNDDL8rRvoTPTd6HiZyW
 uJuTrMI8KBfMIjO51/wiQ5lYwjRQdKa11EDrzRYxhXEY6HJHg1bNGBbXycQnX8e403Nvgn4p175
 FOBxt1C3ln9v4A4Z/KQVwHU73RHc2emoQC8cCcT6tuuRGT89jJaHgnvUAwl3BmIe7rwFYgFRHvB
 xOUSAYqvbAqiJUpCbOCB9m8dwiemsKIrLVzCZpyM+uxQ==
X-Zone-Loop: cb45127ec3953fcb7bb7d8258f0f610bc43105beb6eb
x-campaign-type: default
x-transaction-id: 5c5f2a3f-e02c-4089-853f-bbd036fd9578
x-swg-uid: 01-407a695a-efd0-4af3-9fef-ce20e102abdd
X-Mailer: Sweego
Message-ID:
 <1781881106.8631fc262581453bbf619ec5b2062170.19ee063ee8a000701b@vates.tech>
x-swg-bid: 1781881106.8631fc262581453bbf619ec5b2062170.19ee063ee8a000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 19 Jun 2026 16:58:24 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 13/17] libxl: Add xen-platform device for Q35 machine
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-14-thierry.escande@vates.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-14-thierry.escande@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.79f.1e778d1f960cc9b9.19ee063ebb3.a673042c6581ab64=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781881105332
X-purgate-ID: tlsNG-16d1c6/1781881109-3A9E8853-0E4836FA/0/0
X-purgate-type: clean
X-purgate-size: 1919

---=Part.79f.1e778d1f960cc9b9.19ee063ebb3.a673042c6581ab64=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 04:35:04PM +0000, Thierry Escande wrote:
> Current Xen/QEMU method to control Xen Platform device is done by
> setting the 'xen_platform_device' option value

You mean `xen_platform_pci` ?

This is still the case with the new type of machine ;-)=2E

> that modifies QEMU
> emulated machine type, namely xenfv <--> pc=2E

> In order to avoid multiplying machine types, this patch supplies
> '-device xen-platform' directly to Qemu=2E To maintain backward
> compatibility with existing Xen/QEMU setups, this is currently only
> applicable to q35 machine=2E

We can already use `-device xen-platform` with QEMU's machine `pc` /
`pc-i440fx-*` but this would break migration from previous version of
libxl, PCI devices would move around while the guest is running=2E

So instead of "currently only applicable", something like "we will only
apply this to q35" would be a bit more accurate=2E

> i440 emulation uses the old method (xenfv/pc
> machine) to control Xen Platform device=2E

To be honest, the change between `xenfv` and `pc` is bigger than just
that device, it's also a different machine version=2E

`-machine xenfv` is kind of equivalent to:
`-machine pc-i440fx-3=2E1,accel=3Dxen,suppress-vmdesc=3Don -device xen-pla=
tform`

But `xenfv` can also have `igd-passthru=3Don` added to `-machine` which
has an influence on the machine setup=2E

If you manage to rework the commit that would be nice, in anycase,
overall the patch looks fine: Reviewed-by: Anthony PERARD <anthony=2Eperar=
d@vates=2Etech>

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.79f.1e778d1f960cc9b9.19ee063ebb3.a673042c6581ab64=---

