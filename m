Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F432C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 09:12:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5806520675
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 09:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5806520675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGK8N-0001yM-1F; Tue, 16 Apr 2019 09:12:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jBKv=SS=citrix.com=prvs=00264d04a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hGK8L-0001yH-Rp
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 09:12:05 +0000
X-Inumbo-ID: b305994e-6027-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b305994e-6027-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 09:12:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,357,1549929600"; d="scan'208";a="88885388"
Date: Tue, 16 Apr 2019 11:10:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Pry Mar <pryorm09@gmail.com>
Message-ID: <20190416091027.bq4zybyyqgi5e2tn@Air-de-Roger.citrite.net>
References: <CAHnBbQ8u+MywkV4+qmxhkA8216knGhGZjcy1Sz6Ukv3=PJZmXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHnBbQ8u+MywkV4+qmxhkA8216knGhGZjcy1Sz6Ukv3=PJZmXQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] booting domU guest as pvh works in xen-4.11.1 but
 fails in 4.12
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416091027.4-Vx7ZmqJyzSTTG1j4-b_USWFkAr_veZ7u26CkHfpdE@z>

T24gTW9uLCBBcHIgMTUsIDIwMTkgYXQgMDQ6MTg6NTdQTSAtMDcwMCwgUHJ5IE1hciB3cm90ZToK
PiBIZWxsbywKPiAKPiBodHRwczovL3Bhc3RlLmRlYmlhbi5uZXQvMTA3NzcxOC8KPiAKPiBJIGdl
dCBhIGtlcm5lbCBwYW5pYyBhcyBzaG93biBpbiB0aGUgcGFzdGUgYWJvdmUgbm8gbWF0dGVyIGhv
dyBJCj4gbGF1bmNoIHB2aCwgd2l0aCBib290bG9hZGVyIChweWdydWIpLCBrZXJuZWwgZGlyZWN0
ICg0LjE4KyksIG9yCj4gcHZncnViMiAoaTM4Ni14ZW5fcHZoIHN1cHBvcnQpLgo+IAo+IFRoZSBk
b20wIGhlcmUgaXMgdWIxODA0LCBrZXJuZWwtNC4xOCwgYW5kIHhlbi00LjEyIHdpdGggZGViaWFu
Cj4gcGFja2FnZXMgKHNlbGYgYnVpbHQpLgo+IH4kIHN1ZG8gZHBrZyAtbCB8IGdyZXAgLVAgJ3hl
bnxxZW11JyB8IGdyZXAgJ15paScKPiBpaSAgbGlieGVuLTQuMTI6YW1kNjQgICAgICA0LjEyLjAt
MSt1YjE4dTA0LjEgICAgICAgICAgICAgICAgYW1kNjQKPiAgICBQdWJsaWMgbGlicyBmb3IgWGVu
Cj4gaWkgIGxpYnhlbnN0b3JlMy4wOmFtZDY0ICA0LjEyLjAtMSt1YjE4dTA0LjEgICAgICAgICAg
ICAgICAgYW1kNjQKPiAgIFhlbnN0b3JlIGNvbW11bmljYXRpb25zIGxpYnJhcnkgZm9yIFhlbgo+
IGlpICBsaWJ4ZW50b29sY29yZTE6YW1kNjQgIDQuMTIuMC0xK3ViMTh1MDQuMSAgICAgICAgICAg
ICAgICBhbWQ2NAo+ICAgIGhlbHBlciBmb3IgcWVtdSAmIGxpYnhlbnN0b3JlCj4gaWkgIHFlbXV1
ICAgICAzLjEuMC0xK3ViMTh1MDQuMSAgICAgICAgICAgICAgICAgYW1kNjQKPiBxZW11LXN5c3Rl
bS1pMzg2ICgzLjEuMC94ZW4tNC4xMikgd2l0aCA5cGZzIHN1cHBvcnQKPiBpaSAgeGVuLWh5cGVy
dmlzb3ItNC4xMi1hbWQ2NCAgICAgICAgICAgICA0LjEyLjAtMSt1YjE4dTA0LjEKPiAgICAgIGFt
ZDY0ICAgICAgICBYZW4gSHlwZXJ2aXNvciBvbiBBTUQ2NAo+IGlpICB4ZW4tdXRpbHMtNC4xMiAg
ICAgICAgICAgICAgICAgICAgICAgIDQuMTIuMC0xK3ViMTh1MDQuMQo+ICAgICAgYW1kNjQgICAg
ICAgIFhFTiBhZG1pbmlzdHJhdGl2ZSB0b29scwo+IGlpICB4ZW4tdXRpbHMtY29tbW9uICAgICAg
ICAgICAgICAgICAgICAgIDQuMTIuMC0xK3ViMTh1MDQuMQo+ICAgICAgYWxsICAgICAgICAgIFhl
biBhZG1pbmlzdHJhdGl2ZSB0b29scyAtIGNvbW1vbiBmaWxlcwo+IGlpICB4ZW4tdmlyYnIwICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDAuMS0yCj4gICAgICBhbGwgICAgICAgICAgU2V0dXAg
YSB2aXJicjAgYnJpZGdlIGFuZCBkbnNtYXNxIG9uIGEKPiBpaSAgeGVuc3RvcmUtdXRpbHMgICAg
ICAgICAgICAgICAgICAgICAgICA0LjEyLjAtMSt1YjE4dTA0LjEKPiAgICAgIGFtZDY0ICAgICAg
ICBYZW5zdG9yZSBjb21tYW5kIGxpbmUgdXRpbGl0aWVzIGZvciBYZW4KPiAKPiBUaGUgc2FtZSB4
bCBjb25maWcgYW5kIGdydWIgY29uZmlnIHdvcmtzIGluIHhlbi00LjExLjEuIEkndmUgc2VhcmNo
ZWQKPiBmb3IgYW55IG5ldyBvcHRpb25zIGluIHhsLmNmZyB0aGF0IGNvdWxkIGluZmx1ZW5jZSB0
aGlzLCBidXQgbm90aGluZwo+IGNhdGNoZXMgbXkgZXllLgoKRG8gc2FtZSBrZXJuZWwgYW5kIGlu
aXRyZCB3b3JrIGZpbmUgd2hlbiBib290ZWQgYXMgUFYgb3IgSFZNPwoKVGhhbmtzLCBSb2dlci4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
