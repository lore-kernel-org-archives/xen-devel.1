From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH] xen-netback: fix occasional leak of grant
 ref mappings under memory pressure
Date: Thu, 28 Feb 2019 11:43:46 +0000
Message-ID: <447cd231-3ea4-e56d-29b0-6528804c9e9a__38445.545970329$1551354279$gmane$org@citrix.com>
References: <1551319382-32595-1-git-send-email-igor.druzhinin@citrix.com>
 <8424fba34a1f43908a6dae3a9308863b@AMSPEX02CL02.citrite.net>
 <20190228110136.somjads2f5ivqhju@zion.uk.xensource.com>
 <e5ef3c0291854b67841b6c532f7651b9@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ulOQ=RD=citrix.com=prvs=95559a9f8=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1gzK6Q-0001UV-80
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 11:43:50 +0000
In-Reply-To: <e5ef3c0291854b67841b6c532f7651b9@AMSPEX02CL02.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "davem@davemloft.net" <davem@davemloft.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMjAxOSAxMToyMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4gQEAgLTExNTMsNiAr
MTE1MiwxMCBAQCBzdGF0aWMgaW50IHhlbnZpZl90eF9zdWJtaXQoc3RydWN0IHhlbnZpZl9xdWV1
ZSAqcXVldWUpCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGtmcmVlX3NrYihz
a2IpOwo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgIH0KPj4+ICsKPj4+ICsgICAgICAgICAgICAgICAgICAgICAg
IC8qIENvcGllZCBhbGwgdGhlIGJpdHMgZnJvbSB0aGUgZnJhZyBsaXN0LiAqLwo+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgc2tiX2ZyYWdfbGlzdF9pbml0KHNrYik7Cj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICBrZnJlZShuc2tiKTsKPj4KPj4gSSB0aGluayB5b3Ugd2FudCBrZnJlZV9z
a2IgaGVyZT8KPiAKPiBOby4gbnNrYiBpcyB0aGUgZnJhZyBsaXN0Li4uIGl0IGlzIHVubGlua2Vk
IGZyb20gc2tiIGJ5IHRoZSBjYWxsIHRvIHNrYl9mcmFnX2xpc3RfaW5pdCgpIGFuZCB0aGVuIGl0
IGNhbiBiZSBmcmVlZCBvbiBpdHMgb3duLiBUaGUgc2tiIGlzIHdoYXQgd2UgbmVlZCB0byByZXRh
aW4sIGJlY2F1c2UgdGhhdCBub3cgY29udGFpbnMgYWxsIHRoZSBkYXRhLgo+IAoKQXJlIHlvdSBz
YXlpbmcgcHJldmlvdXMgY29kZSBpbiB4ZW52aWZfaGFuZGxlX2ZyYWdfbGlzdCgpIGluY29ycmVj
dGx5CmNhbGxlZCBrZnJlZV9za2IoKT8KCklnb3IKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
