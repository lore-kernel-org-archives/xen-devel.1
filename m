From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH] PCI/passthrough: don't discard Dom0
 provided information
Date: Thu, 25 Jan 2018 04:46:33 -0700
Message-ID: <5A69D1A902000078001A255D@prv-mh.provo.novell.com>
References: <5A282694020000780019523D@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=vltw=eu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eefzM-0003CP-DG
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2018 11:46:40 +0000
In-Reply-To: <5A282694020000780019523D@prv-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjEyLjE3IGF0IDE3OjE5LCAgd3JvdGU6Cj4gSW5zdGVhZCBvZiBnaXZpbmcsIHRv
IHN1YnNlcXVlbnQgY29kZSwgdGhlIGFwcGVhcmFuY2Ugb2YgdGhlcmUgbm90Cj4gaGF2aW5nIGJl
ZW4gYW55ICJpbmZvIiBkYXRhIHByb3ZpZGVkLCBhZGp1c3QgdGhlIGNvbmRpdGlvbmFsIGd1YXJk
aW5nCj4gU1ItSU9WIGhhbmRsaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCkFueW9uZSBjYXJpbmcgdG8gdGFrZSBhIGxvb2s/IE90aGVyd2lz
ZSBJJ2xsIGNvbW1pdCB0aGlzIHdpdGhvdXQKYW55IGFjayBpbiBhIGNvdXBsZSBvZiBkYXlzLgoK
SmFuCgo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCj4gKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKPiBAQCAtNjI5LDEwICs2MjksNyBAQCBpbnQgcGNpX2Fk
ZF9kZXZpY2UodTE2IHNlZywgdTggYnVzLCB1OCBkCj4gICAgICBlbHNlIGlmICggaW5mby0+aXNf
ZXh0Zm4gKQo+ICAgICAgICAgIHBkZXZfdHlwZSA9ICJleHRlbmRlZCBmdW5jdGlvbiI7Cj4gICAg
ICBlbHNlCj4gLSAgICB7Cj4gLSAgICAgICAgaW5mbyA9IE5VTEw7Cj4gICAgICAgICAgcGRldl90
eXBlID0gImRldmljZSI7Cj4gLSAgICB9Cj4gIAo+ICAgICAgcmV0ID0geHNtX3Jlc291cmNlX3Bs
dWdfcGNpKFhTTV9QUklWLCAoc2VnIDw8IDE2KSB8IChidXMgPDwgOCkgfCBkZXZmbik7Cj4gICAg
ICBpZiAoIHJldCApCj4gQEAgLTY2MCw3ICs2NTcsOCBAQCBpbnQgcGNpX2FkZF9kZXZpY2UodTE2
IHNlZywgdTggYnVzLCB1OCBkCj4gICAgICAgICAgaWYgKCBwZGV2LT5pbmZvLmlzX3ZpcnRmbiAp
Cj4gICAgICAgICAgICAgIHBkZXYtPmluZm8uaXNfZXh0Zm4gPSBwZl9pc19leHRmbjsKPiAgICAg
IH0KPiAtICAgIGVsc2UgaWYgKCAhcGRldi0+dmZfcmxlblswXSApCj4gKwo+ICsgICAgaWYgKCAh
cGRldi0+aW5mby5pc192aXJ0Zm4gJiYgIXBkZXYtPnZmX3JsZW5bMF0gKQo+ICAgICAgewo+ICAg
ICAgICAgIHVuc2lnbmVkIGludCBwb3MgPSBwY2lfZmluZF9leHRfY2FwYWJpbGl0eShzZWcsIGJ1
cywgZGV2Zm4sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFBDSV9FWFRfQ0FQX0lEX1NSSU9WKTsKPiAKPiAKPiAKCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
