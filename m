Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA7DFF885A
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2026 14:29:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1296309.1572724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjQe-0003CO-DA; Tue, 28 Apr 2026 14:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296309.1572724; Tue, 28 Apr 2026 14:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjQe-0003CH-A8; Tue, 28 Apr 2026 14:28:48 +0000
Received: by outflank-mailman (input) for mailman id 1296309;
 Tue, 28 Apr 2026 14:28:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@gmail.com>) id 1wHjQc-0003CB-I4
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:28:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHjQb-005I1m-GW
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:28:45 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@gmail.com>)
 id 69f0c412-bab6-0a2a0a5309dd-0a2a4506a69a-32
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:28:45 +0200
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <stefanha@gmail.com>)
 id 69f0c41d-7371-0a2a45060019-d155d033d411-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:28:45 +0200
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-671ab90fc1fso21611031a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 07:28:45 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1777386525; cv=none;
        d=google.com; s=arc-20240605;
        b=So42dh37OXX1hPfZmlyInT8WZyCxraMxo/ckdPQOLLhhDOR3mP2HUU6oV7oOEtl1dD
         eHfgoRCb8XXFS6hvQITS+UbOVctW9fw3E0EMxFpfp0IpfU46F9STQm+IHpMGucXByIZ8
         EQO3Y+Fzz8VZQkxAAjdaWmkbGZCGfOTWqsBdgRImgeNm0RlKoxTH97DoXJSLDyl2cuHl
         V83mjBSUYyuUqEyRzd225sJNrDg86XLvfpAaKbjE8bWQ5g5JQZmihF4J71QKk+f5jpKj
         homRkXra6k9fg+J97n6t9PQ7bHy5Ii5C2K8FrPmJSRp4nJe8EisXUcx+q0kb7MDHm9CP
         c+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RYOY/bLGnb4mWoU/OY7ZFCy2IKSSYa+HxyuO8c5Tzxw=;
        fh=McRg43hfKil8MlS2nkJpQ2jPPkdLN92uX484YqEwdEg=;
        b=b5HiEFSJaDAnM+Lp1eOlpp+gimz283Z1QMocbA2KbxYeA1ik/cyHuTKKXm7IMurJfM
         +ZrfIQ730VMUDwRksv4ku7BxR4iyWH4hfgZhCqhGO8mrIxzs5G3rJu2EcLEAgR7cdjox
         kn9ssksl50tRmX2792WsojDbs42AZeeZ4beU+N+RQ3AaxocJpqjhKGqyUe1ITCwPjgsX
         1tkMn9utxiSbsw0O7WpdU1PITxeMHWdSgfyDrVADJvypjrnqRgzBYq8HiUaxUgClNDyZ
         KaHCeDrSEu0zz1IH55Sp/XfGZxiHwlP8NWgx6Sxs9cqlgv4URaRBV5/fDhdbT7OzT8PY
         l0WA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777386525; x=1777991325; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYOY/bLGnb4mWoU/OY7ZFCy2IKSSYa+HxyuO8c5Tzxw=;
        b=JKa6f9O+CNLIDYKeFrg1kAs8O1xYpIO9Bt99JEUA7DkA5V6N5+FgfYjvwgDmCR/mrj
         EiCV3GpPMGWX2LR4fb6GW1iNMDkBRHoBydGWE80S+26t2Pb5OcHG9M8dGCGu4Gj+x1FB
         Gx2z+OAFlprgizXNNEg4z8U3rB55nf5GZiqnMcd33qpnStmESF6AruY0tr3n4VTzp8mW
         ZYtaKyz+bmjR+/P+8OX3/AeuCNN5dvdUwJIX7MOKGm0NjpXQLGFrlN7hPKbofPIWCz5d
         sAQtcMJMP8YIbzlMtnrsgd4fq/CRXeWP0TDvO9DzA00pGZiJsZFZeqF/2VNH7BCnhatg
         yeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386525; x=1777991325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RYOY/bLGnb4mWoU/OY7ZFCy2IKSSYa+HxyuO8c5Tzxw=;
        b=QOF3/H0BZY3Id3h2lBTKY7RyOY8SrcK3E9w2zjCRCIAkaPEd1hpEy1BEv/8+5d2hbm
         3fDhMVveFy+eJmK3xLcMx2wxt63KthDJ18UwPQ7zBmNZ/hODW+hYjHxisrUWW7MRSN7P
         Y7bG6+HWOkjMJiJknyD4iAaeeuJhJFGGnUD/suhJEGw39yBXlaTlKjurLLXrGwMU7e6G
         4VJBcOLsydCQTsgAr8AkpOC9tsl2p+P2pH9dJNNRthO/h21vTmhq4N0UZbqh1I2Kli8p
         NykO/p9kPEw6G4dq49McMN9Nhc132jB8lrqZOx9NZRbhy2uVY4CLMp6ItvuU01lLNRam
         ftUg==
X-Forwarded-Encrypted: i=1; AFNElJ83+fi8xb5MQCbaWwzpmupDogBHGlEYha5kJP5UsUYOMgCYDRe09ShslX6g8gPJesEFUoZUU7UAnKM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPHAVgOqsL9+/Q/84gJoDINWflK1k6jVwliaFHY1MTxTrTamHD
	JCS/RNq4XdGMOZ1c2IsxF9e5gYRAY0XLJUJMrqorCu8Yh8c+cXCyfOE0knGX8y75Amn6Xbmn7RO
	ZCCw3ad//6PvBP7WSNdJ/rX1G7oI4+U8=
X-Gm-Gg: AeBDiesdn5rc1Ssu+QWGTFHJBpyZ4B+TjKmdLOKWVcC8GpSlxVQSHDdZjMwSCVUfVlf
	8JXTdbmuGN/qCfTNanND/g2berzM05RmrZ6/vI4+/m3Lv66Jn6hAT8bZMLJZ9ia9huoUUj1mU+g
	mCx9DPx+14Pl4HUcH/4qjRFoFaAqDK+LZXt3tmZnsZ6kXzNjpxFiq8FvcA6wRuJhwLhnD5z84Bo
	+AsTD8ak/Uq+spvxKLwVGdlbl4+aKfv+U6APL+jw8XvZsBMRmivDARSEKPlQ8YeZn3utW5I0g0w
	NhxoybWc2rPyRRJWPuwihvCYuUtZeFcpeQcSFTurn2AkYsaccj+DiA5RUpU=
X-Received: by 2002:a05:6402:1ed3:b0:672:5255:af77 with SMTP id
 4fb4d7f45d1cf-679bb07ee71mr1982304a12.13.1777386524494; Tue, 28 Apr 2026
 07:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260428081303.990973-1-marcandre.lureau@redhat.com> <20260428081303.990973-9-marcandre.lureau@redhat.com>
In-Reply-To: <20260428081303.990973-9-marcandre.lureau@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 28 Apr 2026 10:28:32 -0400
X-Gm-Features: AVHnY4Jmh-XBh9OrnMlY2iCW1hoL0ExMevskFSExN-SDnKJrlB8WX0t3_BRuqoI
Message-ID: <CAJSP0QUjFupVz1uXuxgxbvTrmf_gqzV6tSg1tmuq_Lp7qGVyjw@mail.gmail.com>
Subject: Re: [PULL 08/15] ui/console: return completion status from gfx_update callback
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, 
	Jan Kiszka <jan.kiszka@web.de>, Phil Dennis-Jordan <phil@philjordan.eu>, 
	Richard Henderson <richard.henderson@linaro.org>, Helge Deller <deller@gmx.de>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Samuel Tardieu <sam@rfc1149.net>, =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Aleksandar Rikalo <arikalo@gmail.com>, Laurent Vivier <laurent@vivier.eu>, 
	Thomas Huth <th.huth+qemu@posteo.eu>, BALATON Zoltan <balaton@eik.bme.hu>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony@xenproject.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Alistair Francis <alistair@alistair23.me>, Alex Williamson <alex@shazbot.org>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
	"open list:Musicpal" <qemu-arm@nongnu.org>, "open list:sam460ex" <qemu-ppc@nongnu.org>, 
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1777386525-CE576D75-07B15094/0/0
X-purgate-type: clean
X-purgate-size: 442

Hi Marc-Andr=C3=A9,
This patch changes the .gfx_update callback prototype and fails to
compile due to the following recently-merged commit:

commit 5ef60a3787e8e0dccf30dae3704d4f5249160e7d
Author: Yucai Liu <1486344514@qq.com>
Date:   Sun Apr 12 19:02:39 2026 +0800

    hw/display: Add i.MX6UL LCDIF device model

Please rebase on qemu.git/master, fix the build, and send another
revision of this pull request. Thanks!

Stefan

