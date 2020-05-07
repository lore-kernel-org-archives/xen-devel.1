Return-Path: <SRS0=QEX0=6V=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912DFC38A2A
	for <xen-devel@archiver.kernel.org>; Thu,  7 May 2020 17:40:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59FA620735
	for <xen-devel@archiver.kernel.org>; Thu,  7 May 2020 17:40:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ag3/IzoG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59FA620735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWkVQ-0000jH-TT; Thu, 07 May 2020 17:40:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FcBF=6V=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jWkVP-0000jC-Kn
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 17:40:19 +0000
X-Inumbo-ID: d1459c00-9089-11ea-ae69-bc764e2007e4
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1459c00-9089-11ea-ae69-bc764e2007e4;
 Thu, 07 May 2020 17:40:18 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id h4so7491040wmb.4
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2020 10:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=eaPyYTkYXBrXu/xH0NnuAlo+Tq2jEVRxDirxaSw4Dm4=;
 b=Ag3/IzoGlN3au/qY+FZpa2CRlAewKiyWW+S5kVf2ol4AXBrd54gIBzulDIW0UcAgvk
 7QEOG5ezi6c5yG0dvMa3fBA4XhAv7mf8JM0wyzADxytMZtnopGSmz3wxcP5dbw6dMVH8
 waJJUudnOaFisZEtev+OiOyqhyTHMZboI+r7KuDy57mkFl+RCyRNkT0mM4YgzIqxkZoh
 QKQESboX15XGVw7SDeLMKqHpogruNBMS6gyNMZvJVQ1x950l0QK4uJ7KqCrnjOEsDVqL
 dLYC/NIF1YFk8qJVjGLif0CZtdFxYqKhDAGYM1hw3O89yo91/25cu3Dwhd08bGhU5wQk
 g8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=eaPyYTkYXBrXu/xH0NnuAlo+Tq2jEVRxDirxaSw4Dm4=;
 b=E2uYOsQy6/PoZ+o/lushgk7o0u6Y75soSrc0Mo4FvZasT6noQbygRrsTRUHBYtatIm
 B/9c6e6+1RMRow/ujhgBfXWMlgwtNTjLoTD0Wo2rOEHDlMOpJL76KfztOuOFXR5qqVnw
 Te52S1nbj3S92onFiMwDBAKm9whNRr07ahsGJccLyxsatQNfEbvy9ayyQaHLSCI17M/Z
 B51tm7jPZ/rQtI1aGBTP77CnYdA+/S/kfmVe52TDUL7Q7zE1zG9z73IEG2tW52Z8orLB
 0lfjBxI52zz+sW9Xo8O7qbxQrXNLzZHkGCFjvJ++ci2Opl0brxRgqP8nFOXgN3tQVtzh
 HRnQ==
X-Gm-Message-State: AGi0PuYsAE5oQIBt93w7TH6AQZrhckTxP91sctuCz2riWEHTp2oKyUtw
 Ip52P2kr/WEQ8FQmHXZKX9c=
X-Google-Smtp-Source: APiQypJCeKi1dsLuz1/XdQ4gHUKarUmee4ON98uMkUjEOZrkzHu3A/+yV1UEtRqanV14aWFbNTS9yQ==
X-Received: by 2002:a1c:7d4b:: with SMTP id y72mr11731981wmc.11.1588873217964; 
 Thu, 07 May 2020 10:40:17 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id i74sm9154972wri.49.2020.05.07.10.40.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 10:40:17 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20200507155813.16169-1-philmd@redhat.com>
In-Reply-To: <20200507155813.16169-1-philmd@redhat.com>
Subject: RE: [PATCH] accel: Move Xen accelerator code under accel/xen/
Date: Thu, 7 May 2020 18:40:15 +0100
Message-ID: <00d101d62496$9261b6e0$b72524a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLCd2e1MKAbxFSNuZsafCzsSnsP7KbEPi8w
Content-Language: en-gb
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Eduardo Habkost' <ehabkost@redhat.com>, 'Juan Quintela' <quintela@redhat.com>,
 "'Michael S. Tsirkin'" <mst@redhat.com>,
 "'Dr. David Alan Gilbert'" <dgilbert@redhat.com>,
 'Aleksandar Markovic' <aleksandar.qemu.devel@gmail.com>,
 'Paolo Bonzini' <pbonzini@redhat.com>,
 'Marcel Apfelbaum' <marcel.apfelbaum@gmail.com>,
 'Igor Mammedov' <imammedo@redhat.com>,
 'Anthony Perard' <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 'Aurelien Jarno' <aurelien@aurel32.net>, 'Richard Henderson' <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Sent: 07 May 2020 16:58
> To: qemu-devel@nongnu.org
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>; =
xen-devel@lists.xenproject.org; Stefano Stabellini
> <sstabellini@kernel.org>; Aleksandar Markovic =
<aleksandar.qemu.devel@gmail.com>; Aurelien Jarno
> <aurelien@aurel32.net>; Paolo Bonzini <pbonzini@redhat.com>; Igor =
Mammedov <imammedo@redhat.com>;
> Eduardo Habkost <ehabkost@redhat.com>; Richard Henderson =
<rth@twiddle.net>; Marcel Apfelbaum
> <marcel.apfelbaum@gmail.com>; Dr. David Alan Gilbert =
<dgilbert@redhat.com>; Juan Quintela
> <quintela@redhat.com>; Michael S. Tsirkin <mst@redhat.com>; Paul =
Durrant <paul@xen.org>; Anthony
> Perard <anthony.perard@citrix.com>
> Subject: [PATCH] accel: Move Xen accelerator code under accel/xen/
>=20
> This code is not related to hardware emulation.
> Move it under accel/ with the other hypervisors.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Paul Durrant <paul@xen.org>


