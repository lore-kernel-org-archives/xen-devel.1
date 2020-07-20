Return-Path: <SRS0=X+fC=A7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47818C433E1
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2020 08:39:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1491A2176B
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2020 08:39:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="VYrjWjRs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1491A2176B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxRKH-0007g7-Db; Mon, 20 Jul 2020 08:39:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TdB1=A7=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1jxRKF-0007g2-Ph
 for xen-devel@lists.xen.org; Mon, 20 Jul 2020 08:39:07 +0000
X-Inumbo-ID: 78daeed4-ca64-11ea-b7bb-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78daeed4-ca64-11ea-b7bb-bc764e2007e4;
 Mon, 20 Jul 2020 08:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595234348;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZJ2relG/T/voq29vQ/pBa6hwLPIx7xF5qelCiLq7CkA=;
 b=VYrjWjRseTwKSHutgOHKltHPs/qJ4kGWvtY3WQzIRiO/1SNMqiBEzq4a
 RyspP8+iizRhynfVJgHAHLP8W093V/7j6XD5wwFn1gp90XGWUzGx+1ekS
 8L0aRQzr504S7lya2om8uG2sP5Yfkjf336aBuSFDyleGryYAZjaOSLOfK E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: YCz2V4wlFImdGbXhZA4JfiqRPt2c6cTIQAlD3kvWFtF9ReQGom9KCXD8j41if8SK4OKG8v9s13
 SbD1QOp2y7SV2K8D0OHzS7QfdwtZAaXYnYtOIwODV1O+bDZDyWhTDR6c7zohjwCeYplLmAeXvt
 lL+SC8hx9N+TK5N2J2A4fAnnCSpAO8q/zo8CPwRBplv413oFX357zJl+xvOWHcpxk9LrzbAHAC
 9xl1/wSEDQ1mGMpiNgd3vDbw7oe0wiRuzt1OI7Raw/pJZYSr5pUMfpYaJAuJ0Ud6A1oN8iYi9t
 yFI=
X-SBRS: 2.7
X-MesageID: 22733367
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,374,1589256000"; d="scan'208";a="22733367"
From: Christian Lindig <christian.lindig@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>
Subject: Re: [PATCH 2/2] tools/ocaml: Default to useful build output
Thread-Topic: [PATCH 2/2] tools/ocaml: Default to useful build output
Thread-Index: AQHWXLQfZqk/9n2Ez0iUq9XU56BN2qkQJXHN
Date: Mon, 20 Jul 2020 08:38:40 +0000
Message-ID: <1595234320493.39632@citrix.com>
References: <20200718033242.GB88869@mattapan.m5p.com>
In-Reply-To: <20200718033242.GB88869@mattapan.m5p.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Edwin Torok <edvin.torok@citrix.com>,
 "wl@xen.org" <wl@xen.org>, "dave@recoil.org" <dave@recoil.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

=0A=
=0A=
> Time for a bit of controversy.=0A=
=0A=
OCaml outside Xen has moved to a different model of building based on dune =
which is fast, declarative and reliable. The OCaml xenstore is stagnating b=
ecause nobody with OCaml experience wants to touch it anymore. It would be =
beneficial for the health of the OCaml xenstore to split it out such that i=
t could be worked on independently. You might argue that Make is still appr=
opriate for building OCaml projects but the OCaml community has moved throu=
gh several build systems, starting from Make, and learned the hard way that=
 this is not an easy problem. After years of more-or-less successful build =
system the consensus is that dune is right one and it has resulted in combi=
nation with the Opam package manager the ecosystem to flourish. Alternative=
ly, it would be possible to move OCaml xenstore to dune within the Xen tree=
 but it would create a dependency on it.=0A=
=0A=
-- C=0A=

