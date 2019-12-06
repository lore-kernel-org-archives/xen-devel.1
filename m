Return-Path: <SRS0=WOnx=Z4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DEFC43603
	for <xen-devel@archiver.kernel.org>; Fri,  6 Dec 2019 10:48:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36E5320707
	for <xen-devel@archiver.kernel.org>; Fri,  6 Dec 2019 10:48:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="HXAjocow"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36E5320707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idB9h-0006MZ-KJ; Fri, 06 Dec 2019 10:48:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IIOW=Z4=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1idB9g-0006MU-6M
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 10:48:12 +0000
X-Inumbo-ID: e53a8a64-1815-11ea-b4e9-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e53a8a64-1815-11ea-b4e9-bc764e2007e4;
 Fri, 06 Dec 2019 10:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575629292;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x03uRUd6txP54La6vP0WL2QV4LKMU5HPFXmdnOVXdcM=;
 b=HXAjocowt9XvOujkoq98rIdFgj2H6s3ooPmFMgLATAk3SiadihbCE5++
 o9AvJUWy1A4j7PW/uUpy0+SXpxFalfasorslR8PC6QVVkj+huVHokiGlx
 O1Af+JOhF/86IXwwN6puEgm1QqoFgMHZZfquaDyP8vuiUYLaJlZQfZslh Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RwxO/0iAciOfoPrcl5/NFgYuD51vjP3qE/dXg1GawtTiGvQXhS00rZ16Hpfofiml8OQxDhni7u
 VLojQWstu5olQlBCrsFGF7MNTRkh/ITvnXZSm1UrtFA9Jy0m+rCa81zqIWzQKU1idwQnO1T1bG
 GAlCTTT783Yu01hLmrtgaVa6gZrIgd0vMIZPNXPiMj2rnvmUmFkY9z3PaPRCbhz80zfmgS6u8s
 0agsAiMiX+x0g9mS9qe8Lg0NCvBBhN6FExSCHeb9Bpnz/9ysApyHaFespB2vH9dUzqhYcFfSE/
 mTc=
X-SBRS: 2.7
X-MesageID: 9303376
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,284,1571716800"; 
   d="scan'208";a="9303376"
Date: Fri, 6 Dec 2019 10:48:08 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Lars Kurth <lars.kurth@citrix.com>
Message-ID: <20191206104808.GA2636@perard.uk.xensource.com>
References: <72E0AD89-D04B-4D6C-8291-C4518455E7A2@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <72E0AD89-D04B-4D6C-8291-C4518455E7A2@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] Community Call: Minutes for call on Thursday Dec 5,
 16:00 - 17:00 UTC
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <pdurrant@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBoYXZlIHNvbWV0aGluZyB0byBhZGQgdGhhdCBpc24ndCBjb3JyZWN0IGluIHRoZSBtaW51dGVz
OgoKQy4iT3V0c3RhbmRpbmcgaXNzdWVzIi41KQoKQWJvdXQgImxpYnhsIC8gQ0VQSCBiYWNrZW5k
IHN1cHBvcnQgd2hpY2ggaW1wYWN0cyB4bCBwYXJhbWV0ZXIgcGFzc2luZyB0byBxZW11IjoKCkkg
ZG9uJ3QgaGF2ZSBhIHBhdGNoIGZvciBpdC4gSSdtIHdvcmtpbmcgb24gaXQgYnV0IGl0J3MgYSBi
aXQKY29tcGxpY2F0ZWQuCkl0J3MgYnJva2VuIGluIFFFTVUgdjQuMCAuLiB2NC4yIChyZWxlYXNp
bmcgc29vbikuIE9yIHFlbXUteGVuIDQuMTMuCgpJIHRoaW5rIHRoaXMgcmVncmVzc2lvbiBpcyBn
b2luZyB0byBuZWVkIGEgKnJlbGVhc2Ugbm90ZSogc2F5aW5nIHRoYXQKdXNpbmcgZGlzayBpbWFn
ZXMgb3RoZXIgdGhhbiBhIGZpbGVuYW1lLCBsaWtlIHdpdGggQ0VQSCBvciBsaWtlIG5iZAp3aWxs
IG5vdCB3b3JrLiBCdXQgSSB0aGluayB1c2luZyBxZW11LXhlbiA0LjEyIG9yIFFFTVUgdjMuMSBv
ciBvbGRlcgp3b3VsZCB3b3JrIGlmIGl0IGNvbXBpbGVzIHdpdGggWGVuIDQuMTMsIHdoaWNoIEkg
aGF2ZW4ndCB0cmllZC4KClJlZ2FyZHMsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
