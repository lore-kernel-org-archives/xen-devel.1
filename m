Return-Path: <SRS0=AVGS=T3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD74C07542
	for <xen-devel@archiver.kernel.org>; Mon, 27 May 2019 09:33:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 681AD2173B
	for <xen-devel@archiver.kernel.org>; Mon, 27 May 2019 09:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 681AD2173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVC0S-0003HK-0s; Mon, 27 May 2019 09:33:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7auh=T3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVC0Q-0003HE-OR
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 09:33:22 +0000
X-Inumbo-ID: 75bf1dd0-8062-11e9-a825-37c129f91942
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75bf1dd0-8062-11e9-a825-37c129f91942;
 Mon, 27 May 2019 09:33:19 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 27 May 2019 03:33:17 -0600
Message-Id: <5CEBAED90200007800232B97@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 27 May 2019 03:33:13 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Brian Woods" <brian.woods@amd.com>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CA75E460200007800224E23@prv1-mh.provo.novell.com>
 <5CA765B80200007800224E6D@prv1-mh.provo.novell.com>
 <5CA765B802000000001041CD@prv1-mh.provo.novell.com>
 <5CA765B80200007800232AA3@prv1-mh.provo.novell.com>
In-Reply-To: <5CA765B80200007800232AA3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] Ping: [PATCH v2 2/2] x86/AMD: limit C1E disable family
 range
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190527093313.eYoEgHUbf0nXK_oYkPi3V_J_S0rJtfcncGtqRUVaJ4s@z>

Pj4+IE9uIDA1LjA0LjE5IGF0IDE2OjI3LCAgd3JvdGU6Cj4gSnVzdCBsaWtlIGZvciBvdGhlciBm
YW1pbHkgdmFsdWVzIG9mIDB4MTcgKHNlZSAieDg2L0FNRDogY29ycmVjdCBjZXJ0YWluCj4gRmFt
MTcgY2hlY2tzIiksIGNvbW1pdCAzMTU3YmI0ZTEzICgiQWRkIE1TUiBzdXBwb3J0IGZvciB2YXJp
b3VzIGZlYXR1cmUKPiBBTUQgcHJvY2Vzc29yIGZhbWlsaWVzIikgbWFkZSB0aGUgb3JpZ2luYWwg
Y2hlY2sgZm9yIEZhbTExIGhlcmUgaW5jbHVkZQo+IGZhbWlsaWVzIGFsbCB0aGUgd2F5IHVwIHRv
IEZhbTE3LiBUaGUgaW52b2x2ZWQgTVNSICgweEMwMDEwMDU1KSwKPiBob3dldmVyLCBpcyBmdWxs
eSByZXNlcnZlZCBzdGFydGluZyBmcm9tIEZhbTE2LCBhbmQgdGhlIHR3byBiaXRzIG9mCj4gaW50
ZXJlc3QgYXJlIHJlc2VydmVkIGZvciBGYW0xMiBhbmQgb253YXJkcyAoYWxiZWl0IEkgYWRtaXQg
SSB3YXNuJ3QKPiBhYmxlIHRvIGZpbmQgYW55IEZhbTEzIGRvYykuIFJlc3RvcmUgdGhlIHVwcGVy
IGJvdW5kIHRvIGJlIEZhbTExLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiAtLS0KPiB2MjogTmV3Lgo+IAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9j
cHUvYW1kLmMKPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L2FtZC5jCj4gQEAgLTYyOCw3ICs2Mjgs
NyBAQCBzdGF0aWMgdm9pZCBpbml0X2FtZChzdHJ1Y3QgY3B1aW5mb194ODYKPiAgCj4gIAlzd2l0
Y2goYy0+eDg2KQo+ICAJewo+IC0JY2FzZSAweGYgLi4uIDB4MTc6Cj4gKwljYXNlIDB4ZiAuLi4g
MHgxMToKPiAgCQlkaXNhYmxlX2MxZShOVUxMKTsKPiAgCQlpZiAoYWNwaV9zbWlfY21kICYmIChh
Y3BpX2VuYWJsZV92YWx1ZSB8IGFjcGlfZGlzYWJsZV92YWx1ZSkpCj4gIAkJCWFtZF9hY3BpX2Mx
ZV9xdWlyayA9IHRydWU7Cj4gCj4gCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
