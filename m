Return-Path: <SRS0=oC9Q=C6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2213EC43463
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2020 07:01:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B61F0207BC
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2020 07:01:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYkplt7S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B61F0207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKFp8-0008Kw-0w; Mon, 21 Sep 2020 07:01:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PHp+=C6=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kKFp6-0008Kr-Od
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 07:01:16 +0000
X-Inumbo-ID: 09ef4ae4-4388-4a0f-b1ab-cbdee5926725
Received: from mail-wm1-x32e.google.com (unknown [2a00:1450:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09ef4ae4-4388-4a0f-b1ab-cbdee5926725;
 Mon, 21 Sep 2020 07:01:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id y15so11348081wmi.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2020 00:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=PRTP9pJnT/ANfkaxCdNo1JK+sAEOCK+Nch36YZGDlv0=;
 b=SYkplt7SU8paCSYVzoktvk4It7G4RdVOMLKkOYb/aEh94zuHVhkZYQz+Wa0qFWf+Ev
 SHX9f67MueHKxWIfnektyp+WZLRO97d5cVqRZNIUjIsN0XCcwxlANnHg1K7OK3Ng3KfE
 P37DPurpiTIJ5b6smshWvz8LjVmQ61DBmiN58VQuVufXPXRXcXXaglZHL6+2y/tRiLoF
 tL1R956rpbUZ+EQSuY+URWUzOBTyHkNhsLc83ER+qRI8XkZs7Mc1sLOsH+NQmDclD7zb
 xvcOw5trd1zb3kHmIavrbzqEmCDSiW5S6KZkmEfvyEUToyode9Kpo9lD2GtUkE7Nex3e
 k69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=PRTP9pJnT/ANfkaxCdNo1JK+sAEOCK+Nch36YZGDlv0=;
 b=EhiPWr6WCKJGhw0HHzFE6k+axn/z0XlGgoBYu8Fsgx/tG0K5SGKrlilEAljbSSFfme
 jL1+HpvLjJhaaj1dBs1gAoQf4ptidsnaBLLqnD19oc9Vb5Si1fufyadMH0OdipL8WtUE
 /ft/Dt2sMXe4JCLaXRFKpvSEoC+GdZKfZpbTf5ALM5ru7qoPAWzam3Hq9YsxgzWR4KhM
 yMfLHtc5xskWcNiVYf3ierjSErxYenIMoVkIkCcg4guDJSNdSAclVOoK9twiNw7XxbQz
 Ar/Ilenh4gtx/BGuqQ88ovshU7TsJUHV8rx34nk3+TsdPPXgTTGsED/q4PaD8HpUjJq4
 d4/w==
X-Gm-Message-State: AOAM532CBEhjKLZhgJhsKZSeyqOyXd1sVuPNlu02yjptDSqYb3kOkQse
 Mt8aCpmbkgN0F7daCbCX4m8=
X-Google-Smtp-Source: ABdhPJwEiTX6V1oyzmC79sSVLtad3lEFRiJekKKLM/doSUItcaZT/J2ashlSOhZx60h8d5ruZxrj5w==
X-Received: by 2002:a1c:b388:: with SMTP id
 c130mr28443795wmf.175.1600671674556; 
 Mon, 21 Sep 2020 00:01:14 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id f1sm17725791wrx.75.2020.09.21.00.01.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Sep 2020 00:01:13 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <f4bug@amsat.org>,
 "'Markus Armbruster'" <armbru@redhat.com>, <qemu-devel@nongnu.org>
Cc: "'Laurent Vivier'" <laurent@vivier.eu>,
 "'Paolo Bonzini'" <pbonzini@redhat.com>,
 "'Anthony Perard'" <anthony.perard@citrix.com>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 =?utf-8?Q?'Daniel_P._Berrang=C3=A9'?= <berrange@redhat.com>,
 "'Eduardo Habkost'" <ehabkost@redhat.com>,
 "'Marcel Apfelbaum'" <marcel.apfelbaum@gmail.com>,
 "'Michael S. Tsirkin'" <mst@redhat.com>, <xen-devel@lists.xenproject.org>
References: <20200920114416.353277-1-f4bug@amsat.org>
 <20200920114416.353277-3-f4bug@amsat.org>
In-Reply-To: <20200920114416.353277-3-f4bug@amsat.org>
Subject: RE: [PATCH 2/2] qdev: Let BusRealize() return a boolean value to
 indicate error
Date: Mon, 21 Sep 2020 08:01:15 +0100
Message-ID: <001401d68fe4$ffc9a990$ff5cfcb0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQDbvKXwPh23OQy9Fcef/bcPW+QfeAHn2BnTq1kRznA=
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
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> =
On Behalf Of Philippe Mathieu-Daud=C3=A9
> Sent: 20 September 2020 12:44
> To: Markus Armbruster <armbru@redhat.com>; qemu-devel@nongnu.org
> Cc: Laurent Vivier <laurent@vivier.eu>; Paolo Bonzini =
<pbonzini@redhat.com>; Anthony Perard
> <anthony.perard@citrix.com>; Stefano Stabellini =
<sstabellini@kernel.org>; Daniel P. Berrang=C3=A9
> <berrange@redhat.com>; Eduardo Habkost <ehabkost@redhat.com>; Paul =
Durrant <paul@xen.org>; Marcel
> Apfelbaum <marcel.apfelbaum@gmail.com>; Michael S. Tsirkin =
<mst@redhat.com>; xen-
> devel@lists.xenproject.org; Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org>
> Subject: [PATCH 2/2] qdev: Let BusRealize() return a boolean value to =
indicate error
>=20
> Commit 9940b2cfbc0 introduced qdev_realize() and qbus_realize()
> with the ability to return a boolean value if an error occured,
> thus the caller does not need to check if the Error* pointer is
> set.
> Provide the same ability to the BusRealize type.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/qdev-core.h | 14 +++++++++++++-
>  hw/hyperv/vmbus.c      |  5 +++--
>  hw/nubus/nubus-bus.c   |  5 +++--
>  hw/pci/pci.c           | 12 +++++++++---
>  hw/xen/xen-bus.c       |  5 +++--

Acked-by: Paul Durrant <paul@xen.org>


