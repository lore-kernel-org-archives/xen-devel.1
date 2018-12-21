From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.12 v2 2/8] xen/arm: p2m: Introduce
 p2m_get_page_from_gfn
Date: Fri, 21 Dec 2018 13:18:08 +0000
Message-ID: <08e0e388-d57a-6600-aab9-5ceb7a62e8b4@citrix.com>
References: <20181220192338.17526-1-julien.grall@arm.com>
 <20181220192338.17526-3-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J7vb=O6=citrix.com=prvs=88664d7ea=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gaKgz-0001vs-Po
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 13:18:17 +0000
In-Reply-To: <20181220192338.17526-3-julien.grall@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMTIvMjAxOCAxOToyMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vcDJtLmMgYi94ZW4vYXJjaC9hcm0vcDJtLmMKPiBpbmRleCAyYjVlNDNmNTBh
Li5jZDM0MTQ5ZDEzIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9wMm0uYwo+ICsrKyBiL3hl
bi9hcmNoL2FybS9wMm0uYwo+IEBAIC00MDYsNiArNDA2LDM4IEBAIG1mbl90IHAybV9sb29rdXAo
c3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCBwMm1fdHlwZV90ICp0KQo+ICAgICAgcmV0dXJu
IG1mbjsKPiAgfQo+ICAKPiArc3RydWN0IHBhZ2VfaW5mbyAqcDJtX2dldF9wYWdlX2Zyb21fZ2Zu
KHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHAybV90eXBlX3QgKnQpCj4gK3sKPiArICAgIHN0cnVjdCBwYWdlX2lu
Zm8gKnBhZ2U7Cj4gKyAgICBwMm1fdHlwZV90IHAybXQ7Cj4gKyAgICBtZm5fdCBtZm4gPSBwMm1f
bG9va3VwKGQsIGdmbiwgJnAybXQpOwo+ICsKPiArICAgIGlmICh0KQoKU3BhY2VzCgo+ICsgICAg
ICAgICp0ID0gcDJtdDsKPiArCj4gKyAgICBpZiAoICFwMm1faXNfYW55X3JhbShwMm10KSApCj4g
KyAgICAgICAgcmV0dXJuIE5VTEw7Cj4gKwo+ICsgICAgaWYgKCAhbWZuX3ZhbGlkKG1mbikgKQo+
ICsgICAgICAgIHJldHVybiBOVUxMOwoKTmV3bGluZQoKPiArICAgIHBhZ2UgPSBtZm5fdG9fcGFn
ZShtZm4pOwo+ICsKPiArICAgIC8qCj4gKyAgICAgKiBnZXRfcGFnZSB3b24ndCB3b3JrIG9uIGZv
cmVpZ24gbWFwcGluZyBiZWNhdXNlIHRoZSBwYWdlIGRvZXNuJ3QKPiArICAgICAqIGJlbG9uZyB0
byB0aGUgY3VycmVudCBkb21haW4uCj4gKyAgICAgKi8KPiArICAgIGlmICggcDJtX2lzX2ZvcmVp
Z24ocDJtdCkgKQo+ICsgICAgewo+ICsgICAgICAgIHN0cnVjdCBkb21haW4gKmZkb20gPSBwYWdl
X2dldF9vd25lcl9hbmRfcmVmZXJlbmNlKHBhZ2UpOwo+ICsgICAgICAgIEFTU0VSVChmZG9tICE9
IE5VTEwpOwo+ICsgICAgICAgIEFTU0VSVChmZG9tICE9IGQpOwo+ICsgICAgICAgIHJldHVybiBw
YWdlOwo+ICsgICAgfQo+ICsKPiArICAgIHJldHVybiAoZ2V0X3BhZ2UocGFnZSwgZCkgPyBwYWdl
OiBOVUxMKTsKCk5vIG5lZWQgZm9yIHRoZSBvdXRlciBicmFja2V0cy4KCkFsbCB0cml2aWFsIHN0
eWxlIGlzc3Vlcywgc28gY2FuIGJlIGZpeGVkIG9uIGNvbW1pdC4KCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
