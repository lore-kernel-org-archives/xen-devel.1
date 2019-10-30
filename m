Return-Path: <SRS0=CYfj=YX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A02CA9EC5
	for <xen-devel@archiver.kernel.org>; Wed, 30 Oct 2019 10:57:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5260720717
	for <xen-devel@archiver.kernel.org>; Wed, 30 Oct 2019 10:57:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="YLeZwRfd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5260720717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPlex-0000be-Ap; Wed, 30 Oct 2019 10:57:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jdra=YX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iPlev-0000bW-9c
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 10:57:01 +0000
X-Inumbo-ID: ff642316-fb03-11e9-beca-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff642316-fb03-11e9-beca-bc764e2007e4;
 Wed, 30 Oct 2019 10:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572433021;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=H7Zuxow9Vc1TyYFc6I8UM3cvmuV0nymNIrnXi+cs3tk=;
 b=YLeZwRfdiNTElvoY9D+Y5liGkk6bgKqoRoaj94rhLSvUmR119NRy8NRg
 ujjbxMS8xbr1M0w3t9orqbxQTgqB2z4yIIVwjg9Db/QtMcsq6fyRdNt3z
 HPaOvnjckomdqPuYGVsBfx8jwj+sSejzxeuQuNAaVJIwp2KobIjR61tYf U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Lsgxptx1bF7NHl2rcqdvyH8O7+KKEaHKHUcEBYl029BhlZqZBlJKtQ8nrod+LP6uZBK/Ma50RR
 lWYRq/GljSPgONaq1RNDZaJFhNAgrZ3Jl/E0s/lL13d7lTbQKeq4SKtv+gAgnv+v6Pgd62MmmZ
 SyOq46begN1G/+drVln07aNbJjOZTSLkVO+/ERCYZSeqF58nPX61+N2oSCxnI5PkhqtM9QpO8f
 fsVEXAfTP/6SXd4e0DWNu0BGpDaJ7l9ifyQhIoq/SrbIz2/jXbpjgEKRFuL3TdNAUU7xXojlmy
 OzE=
X-SBRS: 2.7
X-MesageID: 7712999
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,247,1569297600"; 
   d="scan'208";a="7712999"
Date: Wed, 30 Oct 2019 10:56:57 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191030105657.GD2381@perard.uk.xensource.com>
References: <23992.24295.523533.643279@mariner.uk.xensource.com>
 <20191029155436.14376-4-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191029155436.14376-4-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 3/4] libxl: gentypes.py:
 Break out libxl_C_type_do_init
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMDM6NTQ6MzVQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gVGhpcyBpcyBnb2luZyB0byBiZSB0aGUgY29tbW9uIHdheSB0byBpbml0aWFsaXNlIHRo
aW5ncy4KPiBfbGlieGxfQ190eXBlX2luaXQgcmVtYWlucyB0aGUgdGhpbmcgZm9yIGdlbmVyYXRp
bmcgdGhlIGJvZHkgb2YgdGhlCj4gaW5pdCBmdW5jdGlvbiwgYW5kIGZvciBzb21lIHNwZWNpYWwg
Y2FzZXMuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2Ugd2l0aCBleGlzdGluZyB0eXBlczogQyBv
dXRwdXQgaXMgaWRlbnRpY2FsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPgoKQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
