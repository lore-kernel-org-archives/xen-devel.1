Return-Path: <SRS0=xGdN=XM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F132C4CEC9
	for <xen-devel@archiver.kernel.org>; Tue, 17 Sep 2019 17:03:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72E112067B
	for <xen-devel@archiver.kernel.org>; Tue, 17 Sep 2019 17:03:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="FcbQGZrL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72E112067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGsJ-0002Q2-Bc; Tue, 17 Sep 2019 17:02:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGsH-0002Ph-Lo
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:02:45 +0000
X-Inumbo-ID: f765378a-d96c-11e9-b299-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f765378a-d96c-11e9-b299-bc764e2007e4;
 Tue, 17 Sep 2019 17:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568739764;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=STkFS2WvIMN0mEzTOAg2yoe0I6czEzgO3sF+i37/95c=;
 b=FcbQGZrLKWahx+MGFVgv6delMS82aDAF8C4JsHxLRw4XwgMOmbY0/y66
 TuOCN6rmvHISjyxaQbGW0+HHq2SeykKH78I35TBYxVq6U5DZ57NOOSIVu
 3vyOrTv3OqymgywrqiVglsnbl/4+wmw2J9WvtwSuj81JKjbmZ2CeVRdEx w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0JuFE3MXuowWuAhrIy0YAzg1ZxBkky6yr4KIX+FRrT49PU/wUlj5T7LE57suDMNoZN8E17mHoK
 iJjFQQa8o+r2/iZpM3ys0cIfE2u4D/R49Mf7edNPFqq+x2RLgbnRhUNN9KaKkWQgeuoYZwpeq/
 6/f/8j7/d8P2L2yYalk913kD/RjJxVmggm5RMb2rKaPKi84sT827RmbmWreRCUwp472lrk9klL
 X+tvcpJQvqPf0MYumRa2XjdNO0rYq7GGvXOc1L3aO/9LS8rx0dliFSgGRbtwltc5Hncvo9Wwgs
 dj0=
X-SBRS: 2.7
X-MesageID: 5991699
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5991699"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.4528.384263.34559@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 18:02:40 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-10-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-10-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 09/35] libxl: Deprecate
 libxl__domain_{unpause, resume}
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDA5LzM1XSBsaWJ4bDogRGVwcmVjYXRlIGxp
YnhsX19kb21haW5fe3VucGF1c2UscmVzdW1lfSIpOgo+IFRoZXNlIHR3byBmdW5jdGlvbnMgYXJl
IHVzZWQgZnJvbSBtYW55IHBsYWNlcyBpbiBsaWJ4bCBhbmQgbmVlZCB0bwo+IGNoYW5nZSB0byBi
ZSBhYmxlIHRvIGFjY29tb2RhdGUgbGlieGxfX2V2X3FtcCBjYWxscyBhbmQgdGh1cyBuZWVkcyB0
bwo+IGJlIGFzeW5jaHJvbm91cy4KPiAKPiAoVGhlcmUgaXMgYWxzbyBsaWJ4bF9fZG9tYWluX3Jl
c3VtZV9kZXZpY2VfbW9kZWwgaW4gdGhlIG1peC4pCj4gCj4gQSBsYXRlciBwYXRjaCB3aWxsIGlu
dHJvZHVjZSBhIG5ldyBsaWJ4bF9fZG9tYWluX3Jlc3VtZSBhbmQKPiBsaWJ4bF9fZG9tYWluX3Vu
cGF1c2Ugd2hpY2ggd2lsbCBtYWtlIHVzZSBvZiBsaWJ4bF9fZXZfcW1wLgoKQWNrZWQtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
