Return-Path: <SRS0=1JDs=B6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B20AC433DF
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2020 13:22:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06C4C208DB
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2020 13:22:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yyq1GktB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06C4C208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8kWE-0003L6-Bh; Thu, 20 Aug 2020 13:22:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f+yo=B6=gmail.com=jedix81@srs-us1.protection.inumbo.net>)
 id 1k8kWD-0003L1-By
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 13:22:13 +0000
X-Inumbo-ID: bd9502e4-0b43-478d-a6e8-97bcdb3e8e50
Received: from mail-pf1-x442.google.com (unknown [2607:f8b0:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd9502e4-0b43-478d-a6e8-97bcdb3e8e50;
 Thu, 20 Aug 2020 13:22:12 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id m71so1029747pfd.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2020 06:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=0InaeW3XKpig4DN0gNsCq0wX380hyFvLL5V4OupqTQU=;
 b=Yyq1GktB5arFtv5dKLHCJBhiZqt8Su1iQuSkzB4n/VlsDPpwAMWCY9qDgdJKWJr0zM
 sV2fscSFi8GoAg6Eja+qQDZ3r3KXK0rs1Yl+1BE92yamiwQkuR0yXnbvqjndS7UzrA39
 9ryAE8c6joEA35feXX1XTI4j0lAeZhYTO8y/MhhG0dSZ/Ga++dMsriHAX6U6G+uUrD5Z
 M3/1bUB4E782UmkNCjBkEv5Lv4UUKhS3Vvb7xHFzArobI70fvXn99eZDcnJPoRnm3iMv
 GfiUbSDXtuGfVm/EZH0ta2oNR8y8VoQnWnyHC6kJN0OHDTSQyfD7oeVd/49EDnhkCT0K
 TejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=0InaeW3XKpig4DN0gNsCq0wX380hyFvLL5V4OupqTQU=;
 b=ej+Mv+ScGC4AdEQGNpvV4gJqkUV5TUHad+42gvk1yuP3Le0dDYrjtmNreAkafmxiT7
 nQCzhW6azBm3+gXx35cz2RCQvGMCEy5zpMdjiE69zdRvYNczjqN3CYoD3J3wdKyXUmBo
 qfvC69QFCZU53Gg6eu3IdvcJnM0NhMYmiQgK6nCtEbnsRDPO02PbKOsjcWeHrTHiZsJ4
 z9qZWd/k/dAHzmeHUFuVpaXXXHb1w9MEEcpDQ7mfMN90vJVn4XjnK+2MrJ7OZVZEUndx
 bHneYvE4h6cWaqOwpT+7J6MXS0HFRln9mpqnYq8R/GgL8kfG2pLFdzmoQLYVkNHEGMX0
 ZRUA==
X-Gm-Message-State: AOAM531MaFH8Ltwv6kKeGv6W+I6pEWL+W3qi3wUkO8joKXpYxWXPIKbP
 KkfcSf0cjrkfuoKaBAJ3zt0=
X-Google-Smtp-Source: ABdhPJzfBp/4apklnYjSfqHoMvOc006v7Tmh+KqYtc55ngOUmOD4mtS1co4dyrAG//w2JMaG4tPRnQ==
X-Received: by 2002:aa7:9f10:: with SMTP id g16mr2223147pfr.148.1597929731788; 
 Thu, 20 Aug 2020 06:22:11 -0700 (PDT)
Received: from [240.0.0.1] ([161.117.88.154])
 by smtp.gmail.com with ESMTPSA id w82sm3035328pff.7.2020.08.20.06.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 06:22:11 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Wei Chen <jedix81@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: About VIRTIO support on Xen
Date: Thu, 20 Aug 2020 21:22:08 +0800
Message-Id: <D1AC7401-00F9-4C1E-959E-7ADA493090D8@gmail.com>
References: <CAJ=z9a0g2Ygv+ehVdiHAAJne64mQOMECOnonca502H7YfMehMA@mail.gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
In-Reply-To: <CAJ=z9a0g2Ygv+ehVdiHAAJne64mQOMECOnonca502H7YfMehMA@mail.gmail.com>
To: Julien Grall <julien.grall.oss@gmail.com>
X-Mailer: iPhone Mail (17G68)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Thank you very much! It=E2=80=99s very valuable information.

Regards,

> =E5=9C=A8 2020=E5=B9=B48=E6=9C=8820=E6=97=A5=EF=BC=8C19:02=EF=BC=8CJulien G=
rall <julien.grall.oss@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> =EF=BB=BFOn Thu, 20 Aug 2020 at 11:59, Julien Grall <julien@xen.org> wrote=
:
>>=20
>>=20
>>=20
>>> On 20/08/2020 05:45, Jedi Chen wrote:
>>> Hi xen-devel,
>>=20
>> Hi,
>>=20
>>>=20
>>> I am very interesting about the VIRTIO on Xen. And from one meeting
>>> report of AGL Virtualization Expert Group (EG-VIRT)
>>> https://wiki.automotivelinux.org/eg-virt-meetings#pm_cest_meeting4, I
>>> got the information that ARM and Linaro are
>>> upstreaming XEN work incorporating VirtIO. But I can't find any
>>> information in the mailing list. Is there any
>>> architecture overview or design doc about it?
>>=20
>> There is some discussion on xen-devel [1] to add support for Virtio MMIO
>> on Arm. This is still in early development, but you should be able to
>> get a PoC setup with the work.
>>=20
>> Best regards,
>>=20
>> [1] <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
>=20
> Sorry I should have added a direct link:
>=20
> https://lore.kernel.org/xen-devel/1596478888-23030-1-git-send-email-olekst=
ysh@gmail.com/
>=20
>>=20
>>>=20
>>> Thanks,
>>>=20
>>>=20
>>>=20
>>=20
>>=20
>>=20
>> --
>> Julien Grall

