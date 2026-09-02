Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8684AC624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:22:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405424.1638918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hA7-0006ZB-Lm; Wed, 02 Sep 2026 09:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405424.1638918; Wed, 02 Sep 2026 09:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hA7-0006Z4-J2; Wed, 02 Sep 2026 09:21:43 +0000
Received: by outflank-mailman (input) for mailman id 1405424;
 Wed, 02 Sep 2026 09:21:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1hA6-0006Yw-9F
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:21:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1hA5-00AwsE-Lm
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:21:41 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a97ea9f-e002-0a2a0a5209dd-0a2a450484a0-18
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:21:41 +0200
Received: from [209.85.208.169] (helo=mail-lj1-f169.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a97eaa4-b57f-0a2a45040019-d155d0a9c5d9-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:21:41 +0200
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3a20c95e412so6427411fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 02:21:41 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1788340900; cv=none;
        d=google.com; s=arc-20260327;
        b=pXjGMV1/RqlFgvmr51lBqifNyFvIoTK2vDmeXQ1Jujp7zgxxBSG5wxnxxJcyu1Lp5V
         ysUN+t9/I47D4fApqJiGpTWp06yOpnQsQu34er5XrBm5zYVqoSxFKj22NQhIVrefzmyD
         IESs7H2CxObLXsFhMJitv4EtjmGta0uQYSonQ001ymsd0KyChcE/pIlmkhZqEmAFAyFT
         Kj0CU3RURM6TYRVlTDoK7ywqJV8lP4hCmjQPcdOoQPbPiWpPSkYCaLJTAeKeQ53efObg
         Q4LdwROsZ0xkqoImSBl5y/q64npZzyqeyFTNz9hdXwqeMne3FABqsxxBg1MqLBQBJCW+
         1+JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dhvza8kPq0AnEA5RvXgsB0bdJcKfrT+lnBY2gLJYn9k=;
        fh=LhgQUaOwSOLlXE5Y0oINkZGpKai4VDvBPfv+3S/YceQ=;
        b=NcNSpU8cIBKo4kjaVLrgvNrDUslZU7K2DkVug/oJCLH9sulGx+RoxDdpkh8quGniwe
         GNeULuPc6yLaCUrjtgk/njNAgELBJsN+0DjeTYd318uuZxDmOHHylmJe5Na2a87/UjW1
         GCUX0G5N7Ter+DoxEpd2EzTNAW0ARXRoNAPQw/S/zRZ3LeYIA8VaVsarCs2iUZIV9yhj
         WBzMFOY4ZTbDNoN8gFLoUpynljgF8arOuXZU6WKrbdJEfsMaiMNMAlwFzdXBF0FHvNE9
         oEG8hI4IWyMNjfutJ4pOHrF/UM/dVna6W6Pezj9FhhtjRuuabokiohi94MkHzQuuuOwU
         Sryg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788340900; x=1788945700; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dhvza8kPq0AnEA5RvXgsB0bdJcKfrT+lnBY2gLJYn9k=;
        b=MocR1tjUSVjefrUEdAOLBs4cDPPCwW2ti/6mv9alaqqFbsMzzvdWbLCib47SsKLWLV
         qNJ3SYSFk13J3fqVCjvTq+TYwzmYyC37qxLRyppGYWNNkx/h4/Is+oDpmq1WN5/lxCvc
         DOxOgL5eOHOZxWkfBgwSjpxvuZFVfvmuiM1c3WC87G2DvUNdfLJFaAmyXTbBvVut004q
         n0gKfntCEA0RYGV/t9EzjbWWYbCGfjEIi9YRRIYs5Y/G1EtNFPj17/CaZ967o5zfF8ie
         LBCP+zY/lAZvXyceWKNrWE6x9A+Imi5Y/q1gzywQzS7pT1oPh8ono6Y1pHXUjjoq/Cw4
         PtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788340900; x=1788945700;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dhvza8kPq0AnEA5RvXgsB0bdJcKfrT+lnBY2gLJYn9k=;
        b=MyvwtLXFpAcZSnyETO3lew8EIKf4LYT1t5or6oyWLwjh0cuGAAIhMjIvp6IaDQsdr4
         nY5vYgnKNt2/e1yUeqj97FfZ5Qhi4ZmV2I2tdLgR2vI/ftmtPEYXJy2kQRUBhetijmvp
         Je4BX+1/0MjoCPbXccrJXznjL5sHCbeRQ27MUXcERz+j0zWAHqpdtBZSfPRpy1oUH/Sk
         /egJdrrdQ7A/yAXTAPwiJ5Ttnrvxl8IWtKILqrtqPwgZ1thXAs0+Kpt/5mdDmECJj0+B
         DwWVnmlpeZ0lgG5ze6GXN8i3M61Vv7k2Od3B60SySnBB82dXjVOsnizQKCVZee5pQTk2
         Y89Q==
X-Gm-Message-State: AFuF++ngvnb8j6s7uKywetXzgEwn76Cno04pesLXRJnBz2+Iyc5aH/rs
	hfF69gRlUNt7jLQch0Lxtk/FzHelriL2daqJqPnwmLP+F/cMdNtR+9/lHOQ4PgJv+ErnLoDOI7g
	/5F9RzHI6p7BJzutE55f/JtwUk34TiPc=
X-Gm-Gg: AYBFou3mqt2H8UrUb1C2lfoBKljPk17n/+MrcgA+jld6Oa0xsx17kd4QFwwQPXnRYQa
	7Z1m9BxZZi0u1ACw1JEp3yFZoqrIU6SdjOkXm30vTIyrl71upnmCLSLVLq6gTQ8wrVTX2djuTzK
	12i+clFi0CRwrOx+80A880TKWGatqKSPEyIqhlnmxanAiwfuTU9IN1wKYTLZZGat+LBIiDpjDcl
	4OoUwNhYep6wrAdkasfG2ItdkcTksDuk3ccC3455/BWDVIkizVlgTCagcr239Fy6W+CrfHER+RE
	MLN6+MrGXog4MqnvmGDb0kqJlUdhLnbTviFQITG2
X-Received: by 2002:a2e:bc0d:0:b0:3a3:5bd:8b7c with SMTP id
 38308e7fff4ca-3a350248896mr7199701fa.14.1788340900168; Wed, 02 Sep 2026
 02:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <ad1588cc-3130-4ea6-a7cc-0210b507b7a4@gmail.com>
In-Reply-To: <ad1588cc-3130-4ea6-a7cc-0210b507b7a4@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 2 Sep 2026 12:21:29 +0300
X-Gm-Features: AcwNN1WNL3qgoEtWTARb9tQH--Fm_Z63l71Fu7m4-B85oYLYh1xWdBlujApJXcI
Message-ID: <CAGeoDV-ebYq5T3Hw_zqxRwjHBj865fkRgW3JQ6ss5yT9CesNOA@mail.gmail.com>
Subject: Re: Xen 4.23 planning: items for the release
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Community Manager <community.manager@xenproject.org>, 
	"committers@xenproject.org" <committers@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1788340901-528C9B50-0430726D/10/73395122804
X-purgate-type: spam
X-purgate-size: 511

Hi Oleksii,

On Tue, Sep 1, 2026 at 7:06=E2=80=AFPM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Hi all,
>
> As we are starting to plan for Xen 4.23, what items are you planning to
> work on during this release?

Please also add the following Arm item:

Xen Suspend-to-RAM support on Arm64:
https://lore.kernel.org/xen-devel/cover.1787838455.git.mykola_kvach@epam.co=
m

The plan is to continue the work on host Suspend-to-RAM support using
PSCI SYSTEM_SUSPEND.

Thanks,
Mykola

