Return-Path: <SRS0=M2I+=XV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED558C432C2
	for <xen-devel@archiver.kernel.org>; Thu, 26 Sep 2019 11:14:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB32021A4A
	for <xen-devel@archiver.kernel.org>; Thu, 26 Sep 2019 11:14:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="DMyrHS8J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB32021A4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRiv-00073L-9F; Thu, 26 Sep 2019 11:14:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1cs6=XV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDRiu-00073G-0f
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 11:14:12 +0000
X-Inumbo-ID: c3c14a02-e04e-11e9-8628-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id c3c14a02-e04e-11e9-8628-bc764e2007e4;
 Thu, 26 Sep 2019 11:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569496451;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gZwIq1p3S1esu97Jo0mGtqlSisbhGVw2WBqVW/uhZ8c=;
 b=DMyrHS8JnrBuPnOckayIN7Pkvtyg5rs+ZhCGBY4fop9YiArlRjrPkQ8j
 P+HYerhICC8Oed95fYtjzHeJPmD/LrXdxYXA19BIPurFYkvJT0ADrdL+n
 yB5In7vJ+KUnLBaAJHXA69D/9EaHHbgEej6lKck9AJeYlfdeFy3y9Uy2o Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1Ok8ZWA4nizA5LB/+t7Txl9ZEStmqt8aN++gceKm/ZmeIMi0x2vAKkEpsdo5fWBDiXztGdYxhA
 QfgJX0hICAvFGEqwcpPzG8n4L/06aMiPxBnpHBF5OyvyaAsOliuWmrdDPwuDiWcFRbMyBQWDYV
 ceh0k0sICc+I3K6ynp53aPyROv5wEV5Q8iMsyQ8FIt8VWNU+CqzwQVQZD0ozA20jcbsTfZLCyZ
 sPmBO5YCAoWiPWBoObbOETIYnW/prp0/mkd8U0vloAqdqGiTUWJPcuUzwDdwqUDmaJrOqXPWLC
 avE=
X-SBRS: 2.7
X-MesageID: 6113671
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,551,1559534400"; 
   d="scan'208";a="6113671"
Date: Thu, 26 Sep 2019 13:14:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190926111404.co5krpzvbf5k5oq3@Air-de-Roger>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-7-roger.pau@citrix.com>
 <d82bc404-c417-591d-d436-461b8100c44d@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d82bc404-c417-591d-d436-461b8100c44d@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 06/11] ioreq: allow dispatching ioreqs to
 internal servers
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMDE6MzU6MTNQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDMuMDkuMjAxOSAxODoxNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2lv
cmVxLmMKPiA+IEBAIC0xNDkzLDkgKzE0OTMsMTggQEAgaW50IGh2bV9zZW5kX2lvcmVxKGlvc2Vy
dmlkX3QgaWQsIGlvcmVxX3QgKnByb3RvX3AsIGJvb2wgYnVmZmVyZWQpCj4gPiAgCj4gPiAgICAg
IEFTU0VSVChzKTsKPiA+ICAKPiA+ICsgICAgaWYgKCBodm1faW9yZXFfaXNfaW50ZXJuYWwoaWQp
ICYmIGJ1ZmZlcmVkICkKPiA+ICsgICAgewo+ID4gKyAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxF
KCk7Cj4gPiArICAgICAgICByZXR1cm4gWDg2RU1VTF9VTkhBTkRMRUFCTEU7Cj4gPiArICAgIH0K
PiA+ICsKPiA+ICAgICAgaWYgKCBidWZmZXJlZCApCj4gPiAgICAgICAgICByZXR1cm4gaHZtX3Nl
bmRfYnVmZmVyZWRfaW9yZXEocywgcHJvdG9fcCk7Cj4gCj4gUGVyaGFwcyBiZXR0ZXIgKHRvIGF2
b2lkIHlldCBhbm90aGVyIGNvbmRpdGlvbmFsIG9uIHRoZSBub24tCj4gYnVmZmVyZWQgcGF0aCkK
PiAKPiAgICAgaWYgKCBidWZmZXJlZCApCj4gICAgIHsKPiAgICAgICAgIGlmICggbGlrZWx5KCFo
dm1faW9yZXFfaXNfaW50ZXJuYWwoaWQpKSApCj4gICAgICAgICAgICAgcmV0dXJuIGh2bV9zZW5k
X2J1ZmZlcmVkX2lvcmVxKHMsIHByb3RvX3ApOwo+IAo+ICAgICAgICAgQVNTRVJUX1VOUkVBQ0hB
QkxFKCk7Cj4gICAgICAgICByZXR1cm4gWDg2RU1VTF9VTkhBTkRMRUFCTEU7Cj4gICAgIH0KPiAK
PiA/CgpTdXJlLgoKPiA+ICsgICAgaWYgKCBodm1faW9yZXFfaXNfaW50ZXJuYWwoaWQpICkKPiA+
ICsgICAgICAgIHJldHVybiBzLT5oYW5kbGVyKGN1cnIsIHByb3RvX3AsIHMtPmRhdGEpOwo+IAo+
IEF0IHRoaXMgcG9pbnQgSSdtIGJlY29taW5nIGN1cmlvdXMgd2hhdCB0aGUgc2lnbmlmaWNhbmNl
IG9mCj4gaW9yZXFfdCdzIHN0YXRlIGZpZWxkIGlzIGZvciBpbnRlcm5hbCBzZXJ2ZXJzLCBhcyBu
b3RoaW5nIHdhcwo+IHNhaWQgc28gZmFyIGluIHRoaXMgcmVnYXJkOiBJcyBpdCBlbnRpcmVseSB1
bnVzZWQ/IElzIGV2ZXJ5Cj4gaGFuZGxlciBzdXBwb3NlZCB0byBkcml2ZSBpdD8gSWYgc28sIHdo
YXQgYWJvdXQgcmV0dXJuIHZhbHVlCj4gaGVyZSBhbmQgcHJvdG9fcC0+c3RhdGUgbm90IHJlYWxs
eSBtYXRjaGluZyB1cD8gQW5kIGlmIG5vdCwKPiBzaG91bGRuJ3QgeW91IHVwZGF0ZSB0aGUgZmll
bGQgaGVyZSwgYXQgdGhlIHZlcnkgbGVhc3QgdG8KPiBhdm9pZCBhbnkgY2hhbmNlIG9mIGNvbmZ1
c2luZyBjYWxsZXJzPwoKVGhlIGlvcmVxIHN0YXRlIGZpZWxkIHdoZW4gdXNlZCBieSBpbnRlcm5h
bCBzZXJ2ZXJzIGlzIG1vZGlmaWVkIGhlcmUKaW4gb3JkZXIgdG8gdXNlIGl0IGFzIGFuIGluZGlj
YXRpb24gb2YgbG9uZy1ydW5uaW5nIG9wZXJhdGlvbnMsIGJ1dAp0aGF0J3MgaW50cm9kdWNlZCBp
biBwYXRjaCAxMS8xMSAoJ2lvcmVxOiBwcm92aWRlIHN1cHBvcnQgZm9yCmxvbmctcnVubmluZyBv
cGVyYXRpb25zLi4uJykuCgo+IAo+IEEgcG9zc2libGUgY29uc2VxdWVuY2Ugb2YgdGhlIGFuc3dl
cnMgdG8gdGhpcyBtaWdodCBiZSBmb3IKPiB0aGUgaG9vaydzIG1pZGRsZSBwYXJhbWV0ZXIgdG8g
YmUgY29uc3RpZmllZCAoaW4gcGF0Y2ggNCkuCgpZZXMsIEkgdGhpbmsgaXQgY2FuIGJlIGNvbnN0
aWZpZWQuCgo+IEhhdmluZyBzYWlkIHRoaXMsIGFzIGEgcmVzdWx0IG9mIGhhdmluZyBsb29rZWQg
YXQgc29tZSBvZiB0aGUKPiBpbnZvbHZlZCBjb2RlLCBhbmQgd2l0aCB0aGUgY292ZXIgbGV0dGVy
IG5vdCBjbGFyaWZ5aW5nIHRoaXMsCj4gd2hhdCdzIHRoZSByZWFzb24gZm9yIGdvaW5nIHRoaXMg
c2VlbWluZ2x5IG1vcmUgY29tcGxpY2F0ZWQKPiByb3V0ZSwgcmF0aGVyIHRoYW4gcHV0dGluZyB2
UENJIGJlaGluZCB0aGUgaHZtX2lvX2ludGVyY2VwdCgpCj4gbWFjaGluZXJ5LCBqdXN0IGxpa2Ug
aXMgdGhlIGNhc2UgZm9yIG90aGVyIGludGVybmFsIGhhbmRsaW5nPwoKSWYgdlBDSSBpcyBoYW5k
bGVkIGF0IHRoZSBodm1faW9faW50ZXJjZXB0IGxldmVsIChsaWtlIGl0cyBkb25lIEFUTSkKdGhl
biBpdCdzIG5vdCBwb3NzaWJsZSB0byBoYXZlIGJvdGggKGV4dGVybmFsKSBpb3JlcSBzZXJ2ZXJz
IGFuZCB2UENJCmhhbmRsaW5nIGFjY2Vzc2VzIHRvIGRpZmZlcmVudCBkZXZpY2VzIGluIHRoZSBQ
Q0kgY29uZmlnIHNwYWNlLCBzaW5jZQp2UENJIHdvdWxkIHRyYXAgYWxsIGFjY2Vzc2VzIHRvIHRo
ZSBQQ0kgSU8gcG9ydHMgYW5kIHRoZSBNQ0ZHIHJlZ2lvbnMKYW5kIHRob3NlIHdvdWxkIG5ldmVy
IHJlYWNoIHRoZSBpb3JlcSBwcm9jZXNzaW5nLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
