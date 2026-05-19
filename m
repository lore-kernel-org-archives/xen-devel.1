Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EC9CD4851
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2026 05:02:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1312391.1582489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPCaN-00075r-1C; Tue, 19 May 2026 05:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312391.1582489; Tue, 19 May 2026 05:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPCaM-00075j-SP; Tue, 19 May 2026 05:01:42 +0000
Received: by outflank-mailman (input) for mailman id 1312391;
 Tue, 19 May 2026 05:01:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wPCaL-00075K-31
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 05:01:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPCaJ-000Wv3-Vf
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 07:01:40 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0beea9-2eae-0a2a0a5409dd-0a2a45098432-30
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 07:01:39 +0200
Received: from [209.85.167.45] (helo=mail-lf1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0beeb3-2497-0a2a45090019-d155a72de11e-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 07:01:39 +0200
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5a8d1f43432so5642360e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 22:01:39 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779166899; cv=none;
        d=google.com; s=arc-20240605;
        b=IADRQcWBrBcEFTgcF+z5BddVeQ2wQSmdps/CzVG42gQY8sB6Pk7vq7ibAy0daRPbue
         juQscHlV8raWo2XAN2UuiMUTrylCKHDp9aGx9nCHF4QjP3YTxvISFBnKa4+ZTVA1DTKu
         uLTEf2t8L5mBpS5Ex/Yl+l39KJI+qrdEWo9pxPxKcgkPirQCFUZakR31IhzDVFf+GAzk
         YvI/mqFC8lmml5tzLnrG8TAR1/K+A1yr1X/xY2uW1DaDF7KRqO+vLRYn+dlGiLWNKKpW
         dWyT/dCpbv19F4eNk3VyfifKNRboIrMeFKfU7tDQzpg4kCn4dStD4GdMHSvSGs3fw1LG
         W2Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hTy/+IFaQjdkHID9o6qdzYbGMtuAqjMfzGV2qdYxS+g=;
        fh=uWsTkjyBGGFEWoM6xZO7XjUPbTD7WoYscIlYAYCsDeI=;
        b=dTcntxtGrwUWIsp0VxVYIOWVEQcv5aDVGNJREZtFQIvdiqSu7pijiNeuRk0Aw8g3pJ
         TO7BHu70cbVOMHhw717Ozt/6u/LS/YGuw0PMwqdc+AzxeHcgjpHLoQAw/p2MucmmkHQe
         lX7LzCxqnO56EwYRIzEtBqLSWXcPhgk3KQExNjcPeEZGqOtdMxHSNxwK7TBhwRZYYcsX
         m7WD6xol6sbQwH+kZisawHtpQAAaqx+wG6aWtqvP+6V5pfRdLSDFnjMm7mZdk3dqo5LH
         fXOZVN6z0iP8O25J0sFy81XqNxOKsL0pArm/nhSvAsGAacTdNXdpRwIGSO8RhV9YiEI8
         gueA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779166899; x=1779771699; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTy/+IFaQjdkHID9o6qdzYbGMtuAqjMfzGV2qdYxS+g=;
        b=pAfj2SGBRyDfnkjJW0Kjq2hdY/gc0L68Yho1OSAANwzVMJRHTuribks7rO6QLIiKNo
         39UucQsc5OO7s+YUuz8zTdvjNqu35ZQFiY/MEc59lXoSp80At9Tg6xzIrJH0euY63PRW
         MCb7Q/A98+0/NM+ekqoCb3ekJShMa5Av1a++1M8aYsDzAizVz7moIjkNOD6Sma8FtsxJ
         P/Xr0f+aFf8Kdb0Bj4a7cdaZgrqpvJzlB3SrPOeQZ8Vg+URkri18fQej16tetH96+D/v
         W1rB8BPi3ZWImKGTj2xpSIdIj3Hkrk3J/M8FnVDWQLP7cs+cQrkckAukAZOMDDA/yLdq
         bTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779166899; x=1779771699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hTy/+IFaQjdkHID9o6qdzYbGMtuAqjMfzGV2qdYxS+g=;
        b=LYCpiqhne6PKKYXuOqzCdflW218pfl5pvWPrBkB2fPUhy5sJJg+4u3zOzRqoXV2znd
         KNAHGbpXLEfvQQyac6NQj2iLGgq2UmRbDnIc1cZqFm9xQho1MuoH//DLwmhJatDVqWzp
         jw6sxGRNAtenm8smDd/3SIa6ts+oIuUiJz/OFi3c7thAMlNiMGk5lvv3LG5K3zK31Trg
         KGSzD8pz+OVDjaI2FzPiCDYlF5Xu3k2LaHmUEDHYxQ5625XC7jaJ+WirS9OUrLY/mhpc
         Y4IzS4bri83SfjWdg4mNWimxe7R2Pogkqv3EGtfEJFrXvcTvSqMXH0alOSiVG1SUyIHY
         4ghg==
X-Forwarded-Encrypted: i=1; AFNElJ8zAq45TcdsjmJyDB4BzT/V6/CcDwzs6uuB/AaanM7EvEaoanwTha1sVDy429wt4bIzle7Sm3QLViE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynM9Yv2QzAptr9gDe8L3aFLZem/D0lYa/LZILbheIH9zIHdmnx
	EjArPI16pBBG1cMHOMQMMJ0cLMYPuGKHtnGexUkXCOTBuJ0D755O71PDI6Ms7bUO09l7Vfujfaa
	E3PvRYwZIqdm33bS0xioyBUghQItUQPw=
X-Gm-Gg: Acq92OHTWjx2o5Ip+aPn3KLRb51r3e1dTaCiSc/eBZESn9mCR70gmh5bcR0OfrP+DtD
	ly09qpMLGxm8lGxmY5zI/7W6XFw+JH+QkC+pVR8j50Tgwkv6FO2JlB4rTQd7Exl8e4anrHTGhjT
	82scuj/+HpFPT37x5ZWja8jYCWJsVnsR5wy8bOeHP8wMhIuycWDQtQqRk8LUZHIH6uzvwQWikBe
	d7j/cpeB2PB1b1w82aPmB1/EBytb2Ykc+k2ht5senVM+3yLizF/BeBfhdWlyqZwMRhO6CsZmfmy
	Yp8DWbdAKKVIY+BRqghz18TPaQ==
X-Received: by 2002:a05:6512:128a:b0:5a8:65ce:e83b with SMTP id
 2adb3069b0e04-5aa0e60cfadmr5665126e87.7.1779166898676; Mon, 18 May 2026
 22:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260518224652.422864-1-edgar.iglesias@gmail.com>
 <20260518224652.422864-2-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2605181739130.4460@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2605181739130.4460@ubuntu-linux-20-04-desktop>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 19 May 2026 08:01:27 +0300
X-Gm-Features: AVHnY4LRTH3a7URg3wiw53yOPEIfh1D9K5AvWikCQZvFc3s-s-o2DeunEzVJnMc
Message-ID: <CAGeoDV-4=3WSjA5nvwwvpgY7GYg1Yx4Pwr-dtDGROm_UE55kCQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] xen/arm: gic-v3: Fix wake-up loop in gicv3_enable_redist
To: Stefano Stabellini <sstabellini@kernel.org>, Luca Fancellu <luca.fancellu@arm.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, xen-devel@lists.xenproject.org, 
	julien@xen.org, bertrand.marquis@arm.com, michal.orzel@amd.com, 
	Volodymyr_Babchuk@epam.com, edgar.iglesias@amd.com, 
	oleksii.kurochko@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1779166899-8B193A53-1F950A3F/0/0
X-purgate-type: clean
X-purgate-size: 1347

Hi all,

I think this issue is already covered by Luca's patch, currently under
review:

xen/arm: gic-v3: Fix redistributor wakeup polling

Best regards,
Mykola

On Tue, May 19, 2026 at 3:47=E2=80=AFAM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Tue, 19 May 2026, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > timeout starts as false and is only set on the timeout break, so the
> > loop always exits after one iteration and a stuck redistributor is
> > silently treated as woken. Use while ( 1 ) to match the sibling
> > gicv3_do_wait_for_rwp().
> >
> > Fixes: bc183a0235 ("xen/arm: Add support for GIC v3")
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>
>
> > ---
> >  xen/arch/arm/gic-v3.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> > index 7f365cdbe9..f03217282e 100644
> > --- a/xen/arch/arm/gic-v3.c
> > +++ b/xen/arch/arm/gic-v3.c
> > @@ -828,7 +828,7 @@ static int gicv3_enable_redist(void)
> >          }
> >          cpu_relax();
> >          udelay(1);
> > -    } while ( timeout );
> > +    } while ( 1 );
> >
> >      if ( timeout )
> >      {
> > --
> > 2.43.0
> >
>

