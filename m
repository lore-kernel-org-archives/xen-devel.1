Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B743C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:28:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE28E20818
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:28:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7VbTbZf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE28E20818
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEF8k-0001iJ-T8; Wed, 10 Apr 2019 15:27:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RUJG=SM=gmail.com=thierry.reding@srs-us1.protection.inumbo.net>)
 id 1hEF8j-0001iE-MV
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 15:27:53 +0000
X-Inumbo-ID: 3482eb56-5ba5-11e9-92d7-bc764e045a96
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3482eb56-5ba5-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 15:27:52 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c1so3077450wml.4
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2019 08:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=31jOlJlVuKCWrwRkYpC3DdBEVeBUMFhwHumdByT0qTY=;
 b=H7VbTbZfSAIi1eNiJsCy4EZef0pypOsnQY3VaPpVoIIuzFTRa1SUJOJI2f5+HptAa9
 F3Iyv2nWDDnvI3G39fPIjsTAfSxFis9V2A7dI0+1B/mekiBahxpnJIEWlH4jhZPL7s/g
 rekOm3QqX2lFbBOYZqCyL4sEINpp1Yr+LQj+IQgOP/tu/cQkwyw/tAqN1VsQ9/B2P3sv
 WGtFxDsJ4YoWsspuUDIx3zfSNiqwTNwf51w0WX1TFFuQJMvtRHgx+1GzOA9x0zfKzAuL
 Je4YYwut2B8mErMyJ0DG9TGidTG2/MSANqLN2heyRTZnzg9PfoPaJU4a2h0L8Fzd4fi5
 QT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=31jOlJlVuKCWrwRkYpC3DdBEVeBUMFhwHumdByT0qTY=;
 b=P7HqMCKkuMhF7sYRNYuPClyrMZHu/z9o4iFL6Mg9clF1xfEOHBGF8EFgP5vFgshFZL
 gmZoCtePdfNpymjFldxuLs5elmodccfvAcpyNbWi0Jf4W8JBvi4WVte1mSKlQpsShG+q
 3VV4N7PnTxC6nxY46+tkyir7toyMB7MCA6jggm8qY7wrBIDzks1SneUzdXzGVBNvYZER
 bjeeQkKX2oDzJjrmINnOFfrf6Bqb6ekxg+7s9bqKLwFk8XNrvDTTYHj+YvAiVa6ys/g7
 VoAA0VsHd38T1Y0ko7kACHOmnZbXlPSq8lLZlgN7NNrsEfQkBbvmAcbgjKE8ca+iR41k
 TozQ==
X-Gm-Message-State: APjAAAVb4HOfdtOul/mgQDulxUFjY7nDfuOHEUCsdYvEimyn3UuABUJ7
 JTE8KHY5lpRpizeS7wAItCU=
X-Google-Smtp-Source: APXvYqwWmkISvmpKiHpoObxM+k89ZgHhzgsgVtlNd/7Tj6x2dnGfJdV+BicUig/7sDd+ivEJO6DYzg==
X-Received: by 2002:a1c:43c2:: with SMTP id q185mr3097984wma.53.1554910071452; 
 Wed, 10 Apr 2019 08:27:51 -0700 (PDT)
Received: from localhost (pD9E51B25.dip0.t-ipconnect.de. [217.229.27.37])
 by smtp.gmail.com with ESMTPSA id z7sm31874642wrt.10.2019.04.10.08.27.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Apr 2019 08:27:50 -0700 (PDT)
Date: Wed, 10 Apr 2019 17:27:49 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20190410152749.GA1460@ulmo>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
 <20190410142408.22848-22-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
In-Reply-To: <20190410142408.22848-22-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [OSSTEST PATCH 21/62] ts-kernel-build: disable
 host1x, which doesn't build
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2958952326452758548=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2958952326452758548==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2019 at 03:23:27PM +0100, Ian Jackson wrote:
> From: Wei Liu <wei.liu2@citrix.com>
>=20
> Empirically, on stretch armhf:
>=20
>   drivers/gpu/host1x/cdma.c: In function `host1x_pushbuffer_init':
>   drivers/gpu/host1x/cdma.c:94:48: error: passing argument 3 of `dma_allo=
c_wc' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
>      pb->mapped =3D dma_alloc_wc(host1x->dev, size, &pb->phys,
> 						  ^
> etc.

This was fixed in v4.18 by this commit:

	commit 2f8a6da866eff746a9f8c7745790f3765baeb589
	Author: Emil Goode <emil.fsw@goode.io>
	Date:   Wed May 16 12:22:04 2018 +0200

	    gpu: host1x: Fix compiler errors by converting to dma_addr_t

	    The compiler is complaining with the following errors:

	    drivers/gpu/host1x/cdma.c:94:48: error:
	            passing argument 3 of =E2=80=98dma_alloc_wc=E2=80=99 from inco=
mpatible pointer type
	            [-Werror=3Dincompatible-pointer-types]

	    drivers/gpu/host1x/cdma.c:113:48: error:
	            passing argument 3 of =E2=80=98dma_alloc_wc=E2=80=99 from inco=
mpatible pointer type
	            [-Werror=3Dincompatible-pointer-types]

	    The expected pointer type of the third argument to dma_alloc_wc() is
	    dma_addr_t but phys_addr_t is passed.

	    Change the phys member of struct push_buffer to be dma_addr_t so that =
we
	    pass the correct type to dma_alloc_wc().
	    Also check pb->mapped for non-NULL in the destroy function as that is =
the
	    right way of checking if dma_alloc_wc() was successful.

	    Signed-off-by: Emil Goode <emil.fsw@goode.io>
	    Signed-off-by: Thierry Reding <treding@nvidia.com>

It should be fairly easy to backport this to older releases, though I'm
not sure exactly what made this trigger. This wasn't causing any build
errors for a very long time, since this type mismatch has existed ever
since the driver was merged all the way back in v3.10.

Thierry

> This is blocking the upgrade of the Xen Project CI to Debian stretch
> so disable it for now.
>=20
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> CC: Julien Grall <julien.grall@arm.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Thierry Reding <thierry.reding@gmail.com>
> CC: dri-devel@lists.freedesktop.org
> ---
>  ts-kernel-build | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/ts-kernel-build b/ts-kernel-build
> index 21b8f78a..0bc443de 100755
> --- a/ts-kernel-build
> +++ b/ts-kernel-build
> @@ -594,6 +594,9 @@ case ${XEN_TARGET_ARCH} in
>      *) ;;
>  esac
> =20
> +# Disable components that don't build
> +setopt CONFIG_TEGRA_HOST1X n
> +
>  exit 0
>  END
>  }
> --=20
> 2.11.0
>=20

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyuC3EACgkQ3SOs138+
s6H2nhAAvKvvc93Y8qv9WWu1Qh1Nvb6QW2EKWemZFBjwyJluiONX4pMEPYUcaDay
r3dx3+kA9gi6Rb76rBxkRxMJKynJKEZi8rog9XI2J/ZmXkMjmNvT/1KJZpOqhkDh
pCPKPiuoSAmuBEE3tCk4/1atGtYbQWEQpvanuksohMVhaBAiBHuzDnE86d5ZiZd/
rN+YP6eKHnvpBhEr0WRcDg5CLUF7cFXL7XSl9C9gZXrNBG0nuiyck2pyNUh/lIL6
yP08a68MWL7dNrIhHOg4WW6pMhlqQj8GEQXSHMlWCvgJPmGl2Z8cJ/CK3Rd7qLV6
y2eMoaD1x9AAim0V9E82sZxISDiDPimlrSWjTp6oqYKyS3v1FNvl6u3o44NOpYo3
rF+cHkdIQsVHY4p+lpPJI0yEc1OYIjcyfRVr2BkYO+jJ20wVNdjI1gPZcCjplG5l
egEzQ9AR84ba2uAMPCG4dLYj+Gb+N8KYfm6SB2MZZJUolWr65eGb7e7EUBfDDIU0
ZRz19jHACjTg633z6S9G6mKFCYkq8XbUBo0WR1g3r/PHFfXBFMQi9ObPyZG+i0cs
x5ZH0kmLZPJ5qldcDgM5qxPKaiO6Pjnt9SkL79Wyuqs8L8W+nL4I3/RmaMh/KDGt
Yrcxrm5YyPBuRL+rdpV8e41okeUKUtbr65QMecMox5yPKdxeLvI=
=NXfk
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--


--===============2958952326452758548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2958952326452758548==--

