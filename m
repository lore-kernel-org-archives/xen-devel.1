Return-Path: <SRS0=g6JP=2G=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A7AC43603
	for <xen-devel@archiver.kernel.org>; Mon, 16 Dec 2019 09:39:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAAF6206D7
	for <xen-devel@archiver.kernel.org>; Mon, 16 Dec 2019 09:39:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="K3q6qlU8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAAF6206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igmqZ-0003eU-Kd; Mon, 16 Dec 2019 09:39:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6OJ0=2G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1igmqX-0003eI-Pg
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 09:39:21 +0000
X-Inumbo-ID: eab20880-1fe7-11ea-88e7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eab20880-1fe7-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 09:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576489154;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QkaNQUEvNjVoj86NuEuMWLVK1Qk2Y/JAnX/tpWVYRIA=;
 b=K3q6qlU88f7jxXeCQ5cepyplFmD115UzVzV0yYXKq751MdEAE8ojDI6T
 1UUuXLs80obDZ1X9NjR7O7qrNLP1UB1f1YQZq162JBGDaM4bmZEwI/LAd
 oK23+okjss5BTz/oSttI7ejOA4KqckmEGXIV3naXksAgJB9tMHgnnRvaJ Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kJsyp14n5T01Spt0gsOV4V8Qsvd87+oiEYc9EJWVso7/QkfuIQ58/qoqiom+5+u1NdQscpkMTj
 4dYVDR3qUcLXqTiDi7O+1zjxSKY0kjkvgutIUWNFs/RQlnzbhN7y66+3IXd5oIcnSWMdxMbMR5
 A1aGIzgOWH95RYg0fw/oq2yUpZ1YWYlbToPaJBcSvFBiEwIFwn/Viw73cJWKq2KzVjSs+LDYi8
 pzVNLi3kTJLwKR08w6yNDQCfN7beojWboAq8MMkANxOORonbMXrzx5aBGWwa2gqxE7mhzolmez
 QEA=
X-SBRS: 2.7
X-MesageID: 9720752
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,321,1571716800"; 
   d="scan'208";a="9720752"
Date: Mon, 16 Dec 2019 10:38:59 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: SeongJae Park <sj38.park@gmail.com>
Message-ID: <20191216093859.GK11756@Air-de-Roger>
References: <20191213153546.17425-1-sjpark@amazon.de>
 <20191213153546.17425-5-sjpark@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213153546.17425-5-sjpark@amazon.de>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v9 4/4] xen/blkback: Consistently insert one
 empty line between functions
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
Cc: jgross@suse.com, axboe@kernel.dk, sjpark@amazon.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae
 Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMTMsIDIwMTkgYXQgMDM6MzU6NDZQTSArMDAwMCwgU2VvbmdKYWUgUGFyayB3
cm90ZToKPiBUaGUgbnVtYmVyIG9mIGVtcHR5IGxpbmVzIGJldHdlZW4gZnVuY3Rpb25zIGluIHRo
ZSB4ZW5idXMuYyBpcwo+IGluY29uc2lzdGVudC4gIFRoaXMgdHJpdmlhbCBzdHlsZSBjbGVhbnVw
IGNvbW1pdCBmaXhlcyB0aGUgZmlsZSB0bwo+IGNvbnNpc3RlbnRseSBwbGFjZSBvbmx5IG9uZSBl
bXB0eSBsaW5lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNlb25nSmFlIFBhcmsgPHNqcGFya0BhbWF6
b24uZGU+CgpUaGFua3MhCgpBY2tlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
