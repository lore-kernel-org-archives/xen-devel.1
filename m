From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH v2 2/2] x86/AMD: limit C1E disable family
 range
Date: Mon, 27 May 2019 03:33:13 -0600
Message-ID: <5CEBAED90200007800232B97@prv1-mh.provo.novell.com>
References: <5CA75E460200007800224E23@prv1-mh.provo.novell.com>
 <5CA765B80200007800224E6D@prv1-mh.provo.novell.com>
 <5CA765B802000000001041CD@prv1-mh.provo.novell.com>
 <5CA765B80200007800232AA3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7auh=T3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVC0Q-0003HE-OR
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 09:33:22 +0000
In-Reply-To: <5CA765B80200007800232AA3@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

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
