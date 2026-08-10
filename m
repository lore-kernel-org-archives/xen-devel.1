Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70137C5AD7B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 16:20:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387682.1628941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtSjX-0007s6-LG; Mon, 10 Aug 2026 16:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387682.1628941; Mon, 10 Aug 2026 16:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtSjX-0007rz-IP; Mon, 10 Aug 2026 16:20:15 +0000
Received: by outflank-mailman (input) for mailman id 1387682;
 Mon, 10 Aug 2026 16:20:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wtSjV-0007rt-Vu
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 16:20:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtSjU-009EC3-Np
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 18:20:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec796ecb000e099@swg.vates.tech>)
 id 6a79fa27-bab6-0a2a0a5309dd-0a2a4509e39c-32
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:20:12 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec796ecb000e099@swg.vates.tech>)
 id 6a79fa3c-be1a-0a2a45090019-b9ff1c2389c7-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:20:12 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fec796ecb000e099.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 16:20:09 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4BA8681C91;
 Mon, 10 Aug 2026 18:20:08 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=gbPx00y3KZQyqLCbi95Q/5Iy/Nq3Js6/1jBe0l/XbHA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=iZwvScOPNDwRHidRp1D1sBZ6sAaWavesjr+nrAcchvwJoRfxfC7d42mfuAk4aVq7jQgEeQs93
 S237qv22SzkAxewfAiB5gx7j9EIoQJwYmVWYFRptRSKpJ7mhm/lN1ArrE+sgMMd3i3Ju0q3tdJn
 r+zmgPpPisrmMnJ9oXdiOnBVnTaTh8dr33EKUoMIBAumuzQqzRkkuvR41h7SC9XUMxM7NZAcYhn
 vDdzk+lO8SqNJa5egSRQwrI79efwyHAd9xmWsMVao3gxpEZH0nwiF9k2E1ZW+/XbsfIXitOpdZb
 WMge6hw5gDDEzVyVUqS/VK/tttg/uv7USUr8cP66MQjQ==
X-Zone-Loop: 821d28af57f8c5ba89765fecf76785c21a5a07a45059
x-campaign-type: default
x-transaction-id: f2e13ac5-9ad7-45dd-96ea-845289fefced
x-swg-uid: 01-717e97ef-b827-4be6-9117-ec1f3973f62b
X-Mailer: Sweego
Message-ID:
 <1786378809.8631fc262581453bbf619ec5b2062170.19fec796ecb000e099@vates.tech>
x-swg-bid: 1786378809.8631fc262581453bbf619ec5b2062170.19fec796ecb000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Subject: Re: [PATCH 1/6 TEST-ARTIFACTS] Add a QTB container to run the Xen
 riscv64 tests
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <1786378213.8631fc262581453bbf619ec5b2062170.19fec705643000e099@vates.tech>
References: <20260810155543.927954-1-baptiste.le-duc@vates.tech>
 <1786378213.8631fc262581453bbf619ec5b2062170.19fec705643000e099@vates.tech>
Date: Mon, 10 Aug 2026 18:20:02 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786378808; l=3567;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=wul/TDdovu7bl+ESViJYK6YcweHy78HHk6jvpWvPtOM=;
 b=fF48VRfAUCey5J/4cr/xdAMb6PnjkgzuejEjKbtCbEI6j7279KYJiFw3L0VAjUxQSDaLaAYSP
 hkgcjspy5j5DLWtbwU8HHYA5h6/+tBBGgvG9eUSiWEqe5ft7ptAgfvo
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.204e.d8cf671d69c5fb59.19fec796c82.bff95559d196618f=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786378808450
X-purgate-ID: tlsNG-bad1c0/1786378812-FD668034-52B069E3/10/63158204843
X-purgate-type: spam
X-purgate-size: 4084

---=Part.204e.d8cf671d69c5fb59.19fec796c82.bff95559d196618f=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi everyone,

Apologies for the broken threading, my SMTP relay rewrote the
Message-IDs=2E Cover letter is here:
https://lore=2Ekernel=2Eorg/xen-devel/1786377707=2E8631fc262581453bbf619ec=
5b2062170=2E19fec689f7e000e099@vates=2Etech/T/#u

Kind regards,

On 2026-08-10 18:09 +0200, Baptiste Le Duc wrote:
> QTB (QEMU Test Bench) is a Python framework, developed as part of AMD's =
Xen
> safety initiative, that drives a live QEMU instance over qtest and QMP=
=2E It
> gives a test full access to the machine while the emulation runs: read a=
nd
> write the consoles, inspect the registers and the memory, inject interru=
pts=2E
>=20
> For now the riscv64 CI tests only use it to read the Xen console in the
> smoke test, since DomU is not supported yet=2E Once it is, the same
> framework will read and write the DomU consoles and inject IRQs, so the
> tests can assert an interrupt reaches the expected guest and vCPU=2E
>=20
> QTB is not upstream in QEMU yet, though it is planned to be, so get the
> framework from AMD's fork gitlab=2Ecom/xen-project/people/amd/qemu and
> pip-installs qemu=2Eqtb from it=2E
>=20
> Signed-off-by: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
> ---
>  containerize                            |  1 +
>  images/debian/13-qtb-riscv64=2Edockerfile | 45 ++++++++++++++++++++++++=
+
>  2 files changed, 46 insertions(+)
>  create mode 100644 images/debian/13-qtb-riscv64=2Edockerfile
>=20
> diff --git a/containerize b/containerize
> index dad9afa=2E=2E477b670 100755
> --- a/containerize
> +++ b/containerize
> @@ -31,6 +31,7 @@ case "_${CONTAINER}" in
>      _alpine-3=2E24-arm64-base) CONTAINER=3D"${BASE}/alpine:3=2E24-arm64=
-base" ;;
>      _alpine-3=2E24-arm64-build) CONTAINER=3D"${BASE}/alpine:3=2E24-arm6=
4-build" ;;
>      _alpine-3=2E24-x86_64-base) CONTAINER=3D"${BASE}/alpine:3=2E24-x86_=
64-base" ;;
> +    _debian-13-qtb-riscv64) CONTAINER=3D"${BASE}/debian:13-qtb-riscv64"=
 ;;
>      _alpine-3=2E24-x86_64-build|_) CONTAINER=3D"${BASE}/alpine:3=2E24-x=
86_64-build" ;;
>  esac
> =20
> diff --git a/images/debian/13-qtb-riscv64=2Edockerfile b/images/debian/1=
3-qtb-riscv64=2Edockerfile
> new file mode 100644
> index 0000000=2E=2E86215d3
> --- /dev/null
> +++ b/images/debian/13-qtb-riscv64=2Edockerfile
> @@ -0,0 +1,45 @@
> +# syntax=3Ddocker/dockerfile:1
> +FROM --platform=3Dlinux/amd64 debian:trixie-slim
> +LABEL maintainer=2Ename=3D"The Xen Project"
> +LABEL maintainer=2Eemail=3D"xen-devel@lists=2Exenproject=2Eorg"
> +
> +ENV DEBIAN_FRONTEND=3Dnoninteractive
> +
> +ARG QEMU_REPO=3Dhttps://gitlab=2Ecom/xen-project/people/amd/qemu=2Egit
> +ARG QEMU_COMMIT=3D24cd7e5c0d7e4db8e651f091d0b9da2e7c58dbab
> +
> +RUN <<EOF
> +#!/bin/bash
> +    set -eu
> +
> +    useradd --create-home user
> +
> +    apt-get update
> +
> +    DEPS=3D(# Base environment
> +        ca-certificates
> +        device-tree-compiler
> +        git
> +        python3-jinja2
> +        python3-minimal
> +        python3-pip
> +        python3-yaml
> +
> +        # Qemu for test phase
> +        qemu-system-riscv64
> +    )
> +
> +    apt-get -y --no-install-recommends install "${DEPS[@]}"
> +
> +    # QTB framework
> +    git init /tmp/qemu
> +    git -C /tmp/qemu fetch --depth 1 "$QEMU_REPO" "$QEMU_COMMIT"
> +    git -C /tmp/qemu checkout FETCH_HEAD
> +    pip install --break-system-packages /tmp/qemu/python[qtb]
> +
> +    rm -rf /tmp/qemu
> +    rm -rf /var/lib/apt/lists/*
> +EOF
> +
> +USER user
> +WORKDIR /build
>=20
>=20
> --=20
> Baptiste Le Duc | Vates Hypervisor & Kernel Engineer
>=20
> XCP-ng & Xen Orchestra - Vates solutions
>=20
> web: https://vates=2Etech



-- 
Baptiste Le Duc | Vates Hypervisor & Kernel Engineer

XCP-ng & Xen Orc=
hestra - Vates solutions

web: https://vates=2Etech
---=Part.204e.d8cf671d69c5fb59.19fec796c82.bff95559d196618f=---

