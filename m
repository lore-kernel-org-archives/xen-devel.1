Return-Path: <SRS0=hjEX=LK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38FDC48BE8
	for <xen-devel@archiver.kernel.org>; Wed, 16 Jun 2021 15:17:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89FCE61209
	for <xen-devel@archiver.kernel.org>; Wed, 16 Jun 2021 15:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89FCE61209
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.143396.264300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXIR-0001Ud-SG; Wed, 16 Jun 2021 15:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143396.264300; Wed, 16 Jun 2021 15:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXIR-0001UW-O2; Wed, 16 Jun 2021 15:17:39 +0000
Received: by outflank-mailman (input) for mailman id 143396;
 Wed, 16 Jun 2021 15:17:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltXIQ-0001UQ-PS
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 15:17:38 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b6824e6-4fc2-4acb-8872-109fa8468554;
 Wed, 16 Jun 2021 15:17:37 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GFHPuZF
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 17:17:25 +0200 (CEST)
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
X-Inumbo-ID: 1b6824e6-4fc2-4acb-8872-109fa8468554
ARC-Seal: i=1; a=rsa-sha256; t=1623856646; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=drJV+278tqiI6bSBzkMJO/6Q4r4m65SwApY2ONXqUs0L8escI6k+effrgLcfrXhrSW
    rDu1l6NeKzISB+1eBGVO6fXic+ifROMhu6wHZ8VmwwmjxiQ4qPx5nVr+5IPniVXHbZOx
    egQb1+BjRw81+LMrGcSRfhmRzqcEzTumR2LpBn/eCP7bbpoL3Qc7lAkAww0YPIB3FHwV
    fiuZqXDU9LUz/oiMMVoxExOLPtEneRsVCYf8kx/z0pzBz//ErpeXfEIQVI71a7uUGUez
    +M7BuZ+Njg73R1P09/NmPAD8RDirYNdnIi4BO/tqEZybZlF6Zbu8TiIRBt1tQ8ZNk7es
    nutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623856646;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=rcR3fIihUPNHsD2xDx+zqWqCaDx02jTmSvzpKhcgqHM=;
    b=hF25v1cPFC7ylRsKrpApG/7ynky1ii3FCAdefe4xYqd3Is57l3DOPeona/5Vz/i5g2
    q6cTCBjhRcfqsSSKZ9f0VaXDHnq1B4fHrugAq8VEzOwARKf1zBXk4rVd1fQuWlw4fZdc
    BMYfSSR4tbbZdx6Sn3/Oox8K86RkkLti3NDHH7HDl5D3T0mNvazYL1Jf08kChWfNwtIZ
    Mdi93nyEXacT6fIp6L6edqqYH+NOOJ8OLy1BOmLSHZhS/TTKfjvzjLAufOptA512ofLi
    KrfZIzm2DBiABs6U+/Rpr0l0oPxPthZgUMB9/G0him2OZs5usYXmgA93pSy4aUj7+SfV
    fDjg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623856646;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=rcR3fIihUPNHsD2xDx+zqWqCaDx02jTmSvzpKhcgqHM=;
    b=BFOBHfge/qZfI1AmbQ/GJ+HXO7kKgML60qrxT/kQYWIeIoWbTHZz6RZrywumeEStIE
    0Om4ylhKg3NjPh2M8pGrRbpraPRG4oMxu+UIUQC1A+IuPrGLMG7qNng4KtTTURmsJy43
    HkTCMsPuO9umU3hytF32Ipj2q5Z3r4QBoR3Hiy+dh0dTNxKKqOpIJ9QaoZcmseOvzjke
    tYwv6SKdt1xo9gGNhCQ2bi1FlWfYb7dYSUHDmS/s1priebMwJ2YrFbLuINNAZXH20PFs
    Sm0yFS0ITjBocxjKUM6xoMigdWNSIFBB4XtVg65tjtV5nlvoGjyAA951U//JTBnMNeR8
    T7JA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsVxSIbR7sf0kebs4Z3Zpqv+Sabl5o7CzRq+Ps8Q=="
X-RZG-CLASS-ID: mo00
Date: Wed, 16 Jun 2021 17:17:18 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210616 04/36] tools: create libxensaverestore
Message-ID: <20210616171718.012fbb6a.olaf@aepfle.de>
In-Reply-To: <20210616125129.26563-5-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
	<20210616125129.26563-5-olaf@aepfle.de>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xLZ=8GvyLqie6N7GGHDqxGe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xLZ=8GvyLqie6N7GGHDqxGe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 16 Jun 2021 14:50:57 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> Move all save/restore related code from libxenguest.so into a separate
> library libxensaverestore.so.

This additional change is required to cover non-x86.

--- a/tools/libs/saverestore/nomigrate.c
+++ b/tools/libs/saverestore/nomigrate.c
@@ -17,8 +17,7 @@
=20
 #include <inttypes.h>
 #include <errno.h>
-#include <xenctrl.h>
-#include <xenguest.h>
+#include <xensaverestore.h>
=20
 int xc_domain_save(xc_interface *xch, int io_fd, uint32_t dom, uint32_t fl=
ags,
                    struct save_callbacks *callbacks,

Olaf

--Sig_/xLZ=8GvyLqie6N7GGHDqxGe
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDKFf4ACgkQ86SN7mm1
DoCRtA/9E6lx9RAuzknFAfSRQe9Iz2NyEjENU+bGkir2e7FdTvp8xnDEMhf1W/kb
GfycDdiXdFpRAzdhpD4PB6RfrNQL6+gOdASgJ5XT86myHmm+L/kEm07uOocsoVg3
28m9ePezS1itDa01DoiUQAscnZq+wdGM71uX3dCtj2Fa/c8MrFUtFd7ffnI2J1m6
ThuDBZqqnXCbblNQvq3zqjvZs47BMCH31PLcktzuXAO7ImsyUA4GuFkMJR+EXZo2
/p+yhVy4nrWS/YiUPYBayELB2H+v3JDQGSt4QsY7l4BkixWTqUDDgqOwTrGuGa3C
7HKIX6t+69C9ovbedIK9USR5SfaIesOuXpDdWea8fawawKaiSwt9zfCHfwmYRdwJ
eEnRSregh5vvVxbDKMPgYrtkfgLLCIUAgCjraFR6hwGi5JhzKyYZrB9/wJznQ7ZP
9GABSCK3D1i6xEqWhfFEvMrtuu+rQr34J9+4+uTFtt6w66e1Ta4sfhcIIcxVayJD
a+x9G9/CcjlHQsG5o1oM5OsrASkrHNiDdqV9drDW2V4xPzFnO5jra7IbxYYZAQ0c
NRMK8l/ThNbs+QsNdZn4mPH+iicp08Zi+cdhjg46bB+GrNJUfine8FB5VJQ1wcpX
VRGpfdXA5K8f+x/Uo6AP4RWM7do+dMaRgXbgbZXLods28f44ukc=
=UXx6
-----END PGP SIGNATURE-----

--Sig_/xLZ=8GvyLqie6N7GGHDqxGe--

