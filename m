Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875F0E6E7E2
	for <xen-devel@archiver.kernel.org>; Tue,  3 Feb 2026 10:26:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1219201.1528132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnDcD-0008P0-B1; Tue, 03 Feb 2026 10:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219201.1528132; Tue, 03 Feb 2026 10:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnDcD-0008Ot-8O; Tue, 03 Feb 2026 10:26:37 +0000
Received: by outflank-mailman (input) for mailman id 1219201;
 Tue, 03 Feb 2026 10:26:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AEwO=AH=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vnDcC-0008On-V0
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 10:26:36 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0825bb5-00ea-11f1-b161-2bf370ae4941;
 Tue, 03 Feb 2026 11:26:35 +0100 (CET)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-40423dbe98bso2419635fac.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 02:26:35 -0800 (PST)
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
X-Inumbo-ID: d0825bb5-00ea-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770114394; cv=none;
        d=google.com; s=arc-20240605;
        b=OHkbBw/eaFUISXsRTIqXLZsVslErQk9BWLO5EyJM8roNzVFOfxhrtfU2cc9CSKM9lO
         m89mw0Rs9gd2R7bVOIPxkhS6GIQB+tevb1rOLdYRMKG0qjTgKxF6Fy/BKKypbFzkcjRC
         01ra7r7RKZ6QYK++l+8F73Bxe2dnS8hzWQmKsyKKUaczmSMsmVivUvbKHy/DRtjFY/yd
         QsbhUPgbfprmVMDE1Aigh01etpPIcj3RJTn4PHe4CVcvTFPR2IB1shZDL0KKu9KiYtqJ
         ENUeHWK4c6xxa3bGdl0bDA+BZ56kYXCVGZP2kFJ02turkEEbkq96i5yOs/wOy4mmAuKp
         ujxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UvmiU4BCcA/R/wYvoaFpxqROilRUOxKQKuYjsAgBDyA=;
        fh=zrlTA3UCjJGplocK3DRTA0JFdHZeEfA1ajLk+r/BzTQ=;
        b=KnS8PEA1uYwwib9uVtVITjSjD72cxRWqRmg6W1ALNFm7COpIHmRaD09IOeahk++ZJA
         a5Mk1GsZ7XjyarDgRv3NpSOiw2b85F+S1WFoQzQvb0LGYfhIQZpHVPyctSBtOZN+YuYm
         HDtjsDGCrxra0q+XhQ2zZlsh3cmwhoM2e1AiiXALl/JzM8K7wO803ViLcJwaAyppvTh4
         7ilfDKkfxImy1pDTdPlPkloQdxn34QTQZnOk6HNBW4MY8XOcUohqmIuSQTixgWLCfh4j
         qTZP5ZExub6zfL376iGe4PVKZIuuDYNnRBHQOgOzYoJocJDxjLoNzEp2JyIeCPKrSFEf
         xb/Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770114394; x=1770719194; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvmiU4BCcA/R/wYvoaFpxqROilRUOxKQKuYjsAgBDyA=;
        b=N792UbLkFih/BDHULvPmwjBAqLPW9wca5AKO1Z+nMdYBAGT0owguqKbDqpV3HpS4dU
         zdAm387tMV0Ii/i4XBFoOU0VuCqZiFsnoWGI6LN+pkfcRChmweaqZ3vb4RSsUfzJwt7P
         1YIYUpsShia6SW/FkyQEaMqOcBk4+59p1/WS8/nwWNd5Rjhqrl1EmfpGZqCvmAHwvcpU
         I3r3M39vc6ppI0E1hDmXQ+AHAzlwlai4v/uyMmhp+mzqCOrmsY9T/SWrdGV95P0Lqfpq
         g1sdudOwNzMy2hwWawrnElSnEcjLSRL2dzgl5BXfSy4f3UwNypTNmVrhF6qdiDEJFniO
         7B8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770114394; x=1770719194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UvmiU4BCcA/R/wYvoaFpxqROilRUOxKQKuYjsAgBDyA=;
        b=rbphaCXjqpg/e2RXSqcH6GD2iQRX1j2TuT/SsLjGZSLTHpeTb7UdI8nmIKmNJfzn3e
         13/goEAkjrDkSUsn2p4Cjdn8IdvIyoO+B5U0eixljiQpxPc7fOHQbF7YD7AeEIVC2xzc
         qOKsVzdWDDawKcmZ88WVKQ8GZAARisq/8aFA7dyxPJyTDjKJ491xhMxPffbvlyjwUf3Q
         aEAoZrRKcfP6r7UDEGrUKoUa9bevqGN5wLOw5jYmG+cZ8Wjtki5dYHEo9Hqi+lfdpPVd
         jFJV84WYjLfUz+0Idsf+7WzL1kIKX3e0Rh2F6qlVVye2f2V0g8IPV7nstDtCF84dykOP
         wnHw==
X-Gm-Message-State: AOJu0Yyq4p4OhLtq11mTUj35rkjIuSMv2F0147FjquEKX0Cj92oQI85s
	xbua2ibdVW7XqVc1MRmVeMiWzfCHm9r5rcezaK7F9ByETG6znI6EqmXbTV8Db8queoA7qGDjFF0
	8VdsgyJFY2kbgEIpnhRR+9z5lQSZRYaCHGw13I0w6eA==
X-Gm-Gg: AZuq6aL+ahMfzDiOYcuuEms+Tyj7X+MJ2F39of7vmyyFcWMwSuQBRe3Wfli6rffPN5G
	eiKfYEbUJi/RTOB4l+GYX0ZGkCfRmvly+KB48moDWFP666Jt2qohPpHsbQh1v9dwn3JSjCBGF1Z
	6IUhvbsmkOr22d9K7I0GeBRphec8YFI+GdItVMp88eC29ViJypVB3emdhdceIQJgyohvxBLYRjX
	rfr9eoJOWLV2LUc8MNG9mXp3oxpmYfOpk3qEaH7k8gSGNNBR4+pMtcYJ2lJWbH1ZY5DArZMejVX
	83GakFrHVBpRMfHZXTQGcBICqQ==
X-Received: by 2002:a05:6870:c206:b0:404:3805:1dde with SMTP id
 586e51a60fabf-409a6ab7cafmr8028972fac.8.1770114393851; Tue, 03 Feb 2026
 02:26:33 -0800 (PST)
MIME-Version: 1.0
References: <1f545f1fc56c8e5f898cff688434b6f38fb16ed4.1770109450.git.bertrand.marquis@arm.com>
In-Reply-To: <1f545f1fc56c8e5f898cff688434b6f38fb16ed4.1770109450.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 3 Feb 2026 11:26:21 +0100
X-Gm-Features: AZwV_QgD8LDsWiTcaHlPURipg8GuZPXU2BkZTFTPF6tnNhP8-kL-8mG4iOzOVCM
Message-ID: <CAHUa44Gaz-e_mh71nUKNvDH+QwaHNj_c_JKRapgkwkjdP-fpZQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Jens as arm TEE reviewer
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Tue, Feb 3, 2026 at 10:05=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Add Jens as arm TEE reviewers so that he is informed of changes in FF-A
> or OPTEE changes in Xen and can review them.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0ceb4bba21cd..ccc25a0e55dc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -547,6 +547,7 @@ F:  stubdom/
>  TEE MEDIATORS
>  M:     Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>  M:     Bertrand Marquis <bertrand.marquis@arm.com>
> +R:     Jens Wiklander <jens.wiklander@linaro.org>
>  S:     Supported
>  F:     xen/arch/arm/include/asm/tee/
>  F:     xen/arch/arm/tee/
> --
> 2.51.2
>

Thanks, looks good:
Acked-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

