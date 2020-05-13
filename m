Return-Path: <SRS0=3ye+=63=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59024C2D0FC
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2020 10:38:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D121206CC
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2020 10:38:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="AtED9dlp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D121206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYomb-0006Xr-7P; Wed, 13 May 2020 10:38:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hhv+=63=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jYoma-0006Xm-3M
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 10:38:36 +0000
X-Inumbo-ID: e3796b6a-9505-11ea-9887-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3796b6a-9505-11ea-9887-bc764e2007e4;
 Wed, 13 May 2020 10:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589366316;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Px4UDWDSJ9KmQDWSbBEUARrbOqFDI2TFyAdHivPVcIs=;
 b=AtED9dlpgA65dHcAvlKWRDzXW1tWAcIPjg4w7Z3wklDH3XoP7KlRZ+Yc
 s3Adac6DR/9mRFFFnmUD80FhioOn+WZzs3mw5Wb1ribAn4cjfzFUViKra
 GvMIT5dLRt+GcwS1qesNAMhM5mMB3q20WjiSAYP0/r75EkF6qhzSojZzl o=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: GEmSY5n6YWq20P3vtg85G28MnbF68lxa2nQKduvWS5aq4bBUm/+G4nQyF8XIOMH+3mYNAcAmoK
 rWRbLNJlDQCQVqZD6H494cANNH7/bnT5fBFYl5A66eMWGtuzHGnMks/WHaZ9fIdeks8Aj8Fq1l
 UhX7IZAXZCgdTFNnAhki3DarWd7fN1CB2OX7ognZ+x4jqAul6Z2E35eW40ZOjGnVSh50bvH/fx
 lHLzUjf3d7dfxsX6lvwML9f57xs9j9ZUsFiU5SQvQnTphExy20uFYCBSmp/rPUW4XjxFsVXFzj
 SsE=
X-SBRS: 2.7
X-MesageID: 17425328
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,387,1583211600"; d="scan'208";a="17425328"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH v2 2/3] golang/xenlight: init xenlight go module
Thread-Topic: [PATCH v2 2/3] golang/xenlight: init xenlight go module
Thread-Index: AQHWKMGVg9jV6anrV0CFXVFjqUoLW6ilsi+A
Date: Wed, 13 May 2020 10:38:17 +0000
Message-ID: <52D26A49-D479-4F0B-91D0-553C737E2337@citrix.com>
References: <cover.1589330383.git.rosbrookn@ainfosec.com>
 <d3744468e8f6ce22756355a2e36b182cea7d5068.1589330383.git.rosbrookn@ainfosec.com>
In-Reply-To: <d3744468e8f6ce22756355a2e36b182cea7d5068.1589330383.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A1AECD281A7A404B8F7C787EF5A684F0@citrix.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On May 13, 2020, at 1:58 AM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> Initialize the xenlight Go module using the xenbits git-http URL,
> xenbits.xenproject.org/git-http/xen.git/tools/golang/xenlight.
>=20
> Also simplify the build Make target by using `go build` instead of `go
> install`, and do not set GOPATH here because it is now unnecessary.

Glad you caught the GOPATH thing. :-)

>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Revewied-by: George Dunlap <george.dunlap@citrix.com>


