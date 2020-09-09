Return-Path: <SRS0=Kfrc=CS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A6EC43461
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2020 14:56:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB33A21556
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2020 14:56:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="ZKaLYKUN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB33A21556
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG1Vt-0005TS-HJ; Wed, 09 Sep 2020 14:55:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M6/y=CS=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kG1Vr-0005TN-8A
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 14:55:55 +0000
X-Inumbo-ID: 8fc2a856-cd57-4786-be4a-b8bd0d66b4f3
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.23])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fc2a856-cd57-4786-be4a-b8bd0d66b4f3;
 Wed, 09 Sep 2020 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1599663353;
 s=strato-dkim-0002; d=aepfle.de;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=tukLdkeOGQW3DiarZKNmZ1x5LoXcksEo3hYzmdef0M4=;
 b=ZKaLYKUNd2j75RxRnYeTtIOgUSnecCKTi/4kKl/v04msKFrfGcprXcp6xNQcGooGSX
 L3yGc2Zz+04Jvao0dwQKoEyYHMTiQxZbf+D2RFrMm9gRQMz79gVUjM/I6BLWGKv8kojn
 l7Gj1ytNmCXzjXWJRWuNSzhACAmOCECQIInQ1Tu2WLln2VDov2JYq7vm2j2EPQSSdENA
 Wdl09uo2EcW+k/4ly9eurH0SeLGGbkPsICOiavtKTA6M4avWJB8U9hu7rkm6xNsbDEma
 2z25YuMub1KyxSp4MvkOfY87dVTekPC6NFkk7Ns9XhluW+GvYy++pYP01qN3dt4N8J6u
 Z4KQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS32hIjw=="
X-RZG-CLASS-ID: mo00
Received: from aepfle.de by smtp.strato.de (RZmta 46.10.7 SBL|AUTH)
 with ESMTPSA id 60ad29w89EtiMh3
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 9 Sep 2020 16:55:44 +0200 (CEST)
Date: Wed, 9 Sep 2020 16:55:41 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] tools/libs: merge xenctrl_dom.h into xenguest.h
Message-ID: <20200909145541.GA9907@aepfle.de>
References: <20200909141837.8293-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <20200909141837.8293-1-jgross@suse.com>
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


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Sep 09, Juergen Gross wrote:

> +++ b/tools/libs/guest/include/xenguest.h

> +#include <xen/libelf/libelf.h>

In case this file will be installed via make install:

Does any of the pending patches create that file?


Olaf

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl9Y7OwACgkQ86SN7mm1
DoDx3Q//cjAYUGqBeZ14Y3k/zdKFZa0vP9BSfKKOT+7bcUu9DyKb8DAl8DyIITzz
y+ROuN/+swNiWmt+8mFwhU1hzjTz/ZpGaCS+oqZVq/xA4pn67HKuKwP4mi/wmoXT
8cBRB/D7FiYYE5odg1eJ/zqAJa1wE2IcuDOFYdNK/GC6BcJvJHGUl1F1hA1wolHF
u5yvzgDxh7HhUgjofe+L+xpzUXafXRcwd437j+bhvEmmIrm4Vx8D/muXTdHVlJMl
Mc+akntVZvRUv0honCUgS7DcDkS6ViWiwcVsP4pXKJYP78NXKhpg62cYPnCLMzEO
6OyTDvQPo23BrsTOQgEQZ+BTnGOZiWrHaSvuRfWrEulTKJ1dA3zweIX0JFcDzq93
AEdH3rZUXhyq9nV8GF/rv1sG68AW/AGaN4T+G4m1f5OoZE3oGa7kHeCHl9aoB1qN
0TNm+osfZudvmM/6qMvJd2jHFisdn5HksBNu5tEBDKFA0nnWD5cIjUhPCMVTn68X
CJ3HWGytVhZ5/zr5hgshIYntUeDiP2rb7SoqtnOnprRSoVifQomn7Vq3Bl3IBLxH
UPIvrcFCHMAQWeXVuA8c30Dq7hsWpC26bVHThtwX0WdZQ6VfabeTIEf2K1KsKeoG
3ibb+a08OzXFs1Z5pE0uCr2+eeW7EV6Xcx1b0/OpmECfULX8S14=
=iTZ5
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--

