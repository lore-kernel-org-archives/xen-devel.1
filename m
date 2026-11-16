Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3D5606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 07:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=IRJqKkLr
Received: from list by lists.xenproject.org with outflank-mailman.1490211.1691150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSrBX-0008UM-2A; Mon, 16 Nov 2026 07:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490211.1691150; Mon, 16 Nov 2026 07:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSrBW-0008UF-Vg; Mon, 16 Nov 2026 07:31:26 +0000
Received: by outflank-mailman (input) for mailman id 1490211;
 Mon, 16 Nov 2026 07:31:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1e34487400006d3f@swg.vates.tech>)
 id 1xSrBV-0008U8-FV
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 07:31:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSrBU-009m6M-Cj
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 08:31:24 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1e34487400006d3f@swg.vates.tech>)
 id 6afab14a-8faa-0a2a0a5109dd-0a2a4506ad64-22
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 08:31:23 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1e34487400006d3f@swg.vates.tech>)
 id 6afab14b-195a-0a2a45060019-b9ff1c2296e1-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 08:31:23 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1e34487400006d3f.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 16 Nov 2026 07:31:21 +0000
Received: from [192.168.1.97] (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8FF6881B4B;
 Mon, 16 Nov 2026 08:31:20 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=Nwwt/4vBCR1lInQ0cdZE9AMRK8Aj0Ye4cseam+DoC/c=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=IRJqKkLreZnrqVs4FHeJk0ETAB+yrsf/0SSwEAuqKgB9E2YUpEVIT3Dzzhekctk8k6+otHvca
 67f+LR29YPxGWxQRoEFD+dL4q3mTzOjIs39+pehowLVHvt0dKu8qbol/L9XuOw44h3J5+nxHwIw
 xsJWbtwVYr6PrUtSjmdbe4gpceN61EKabzQL1PQMyuzjp+O8Y3gtz1Snw7Bhi/UbBgAWMFbmyhK
 d95es603/rT0zP4wNAfM6ErO+3BE98auYQtTpQHpKS+Efp+ObdfrYuzXA+FncD8DotRiwXqownA
 cEPonCsIXskmkJ99VUmogWJSjoIuF6fkUY069vm2L9ug==
X-Zone-Loop: 915c5f7d2b3fb7393b852e713e6c340600a94cb62098
x-campaign-type: default
x-transaction-id: 7e646f60-1696-4d53-830b-7ce9edd2da1b
x-swg-uid: 01-7603fd69-28a3-4761-bcb0-c650d41fd1a8
X-Mailer: Sweego
Message-ID:
 <1794814281.8631fc262581453bbf619ec5b2062170.1a1e34487400006d3f@vates.tech>
x-swg-bid: 1794814281.8631fc262581453bbf619ec5b2062170.1a1e34487400006d3f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Mon, 16 Nov 2026 08:31:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/xen: Mark legacy Xen backends as hotpluggable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: xen-devel@lists.xenproject.org, Peng Fan <peng.fan@nxp.com>
References: <20261116-qemu-xen-usb-v1-1-bff36d5b646b@nxp.com>
Content-Language: en-US
From: Julian Vetter <julian.vetter@vates.tech>
In-Reply-To: <20261116-qemu-xen-usb-v1-1-bff36d5b646b@nxp.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.179.c6946c0d6bf33d1d.1a1e3448446.59381d4b10d6f84f=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794814280778
X-purgate-ID: tlsNG-16d1c6/1794814283-1F6C877B-7D87A7B0/0/0
X-purgate-type: clean
X-purgate-size: 1856
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.179.c6946c0d6bf33d1d.1a1e3448446.59381d4b10d6f84f=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/16/26 03:56, Peng Fan (OSS) wrote:

> diff --git a/hw/xen/xen-legacy-backend=2Ec b/hw/xen/xen-legacy-backend=
=2Ec
> index 7977b527127=2E=2Ebf4396c9460 100644
> --- a/hw/xen/xen-legacy-backend=2Ec
> +++ b/hw/xen/xen-legacy-backend=2Ec
> @@ -640,6 +640,13 @@ static void xendev_class_init(ObjectClass *klass, c=
onst void *data)
>       DeviceClass *dc =3D DEVICE_CLASS(klass);
>  =20
>       set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    /*
> +     * Legacy Xen backends are created and destroyed dynamically from
> +     * xenstore at runtime, after the machine has been initialized=2E
> +     * TYPE_DYNAMIC_SYS_BUS_DEVICE marks devices as not hotpluggable,
> +     * so override that here=2E
> +     */
> +    dc->hotpluggable =3D true;
>       dc->bus_type =3D TYPE_XENSYSBUS;
>   }
>  =20

This also fixes the legacy vfb/vkbd backends with -machine xenpv=20
(qemu-system-i386 -xen-attach -machine xenpv -vga xenfb) on an arm64 Xen=
=20
4=2E21 host=2E Without this fix QEMU exits with "Device 'xen-backend' does=
=20
not support hotplugging" as soon as the backends are created from=20
xenstore=2E Tested on top of QEMU 10=2E1=2E0 with an arm64 Debian 13 guest=
=20
(xen-fbfront/xen-kbdfront)=2E

Tested-by: Julian Vetter <julian=2Evetter@vates=2Etech>

>=20
> ---
> base-commit: e9fa1f66f0d47c74b6766e1b8b87ad7c2a9394d5
> change-id: 20261116-qemu-xen-usb-1a36b002a561
>=20
> Best regards,
> --
> Peng Fan <peng=2Efan@nxp=2Ecom>
>=20
>=20



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.179.c6946c0d6bf33d1d.1a1e3448446.59381d4b10d6f84f=---

