From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v10 5/7] memory: add
 check_get_page_from_gfn() as a wrapper...
Date: Tue, 18 Sep 2018 18:04:36 +0100
Message-ID: <41118409-7cb1-0536-f275-4f7302d81f32@arm.com>
References: <20180918165626.23927-1-paul.durrant@citrix.com>
 <20180918165626.23927-6-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=p3eu=ma=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g2JQX-0005Y3-NM
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 17:04:41 +0000
In-Reply-To: <20180918165626.23927-6-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgUGF1bCwKCk9uIDA5LzE4LzIwMTggMDU6NTYgUE0sIFBhdWwgRHVycmFudCB3cm90ZToKPiAu
Li5mb3Igc29tZSB1c2VzIG9mIGdldF9wYWdlX2Zyb21fZ2ZuKCkuCj4gCj4gVGhlcmUgYXJlIG1h
bnkgb2NjdXJyZW5jZXMgb2YgdGhlIGZvbGxvd2luZyBwYXR0ZXJuIGluIHRoZSBjb2RlOgo+IAo+
ICAgICAgcSA9IDxyZWFkb25seSBsb29rLXVwPiA/IFAyTV9BTExPQyA6IFAyTV9VTlNIQVJFOwo+
ICAgICAgcGFnZSA9IGdldF9wYWdlX2Zyb21fZ2ZuKGQsIGdmbiwgJnAybXQsIHEpOwo+IAo+ICAg
ICAgaWYgKCBwMm1faXNfcGFnaW5nKHAybXQpICkKPiAgICAgIHsKPiAgICAgICAgICBpZiAoIHBh
Z2UgKQo+ICAgICAgICAgICAgICBwdXRfcGFnZShwYWdlKTsKPiAKPiAgICAgICAgICBwMm1fbWVt
X3BhZ2luZ19wb3B1bGF0ZShkLCBnZm4pOwo+ICAgICAgICAgIHJldHVybiA8LUVBR0FJTiBvciBl
cXVpdmFsZW50PjsKPiAgICAgIH0KPiAKPiAgICAgIGlmICggKHEgJiBQMk1fVU5TSEFSRSkgJiYg
cDJtX2lzX3NoYXJlZChwMm10KSApCj4gICAgICB7Cj4gICAgICAgICAgaWYgKCBwYWdlICkKPiAg
ICAgICAgICAgICAgcHV0X3BhZ2UocGFnZSk7Cj4gCj4gICAgICAgICAgcmV0dXJuIDwtRUFHQUlO
IG9yIGVxdWl2YWxlbnQ+Owo+ICAgICAgfQo+IAo+ICAgICAgaWYgKCAhcGFnZSApCj4gICAgICAg
ICAgcmV0dXJuIDwtRUlOVkFMIG9yIGVxdWl2YWxlbnQ+Owo+IAo+IFRoZXJlIGFyZSBzb21lIHNt
YWxsIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIGV4YWN0IHdheSB0aGUgb2NjdXJyZW5jZXMKPiBh
cmUgY29kZWQgYnV0IHRoZSBkZXNpcmVkIHNlbWFudGljIGlzIHRoZSBzYW1lLgo+IAo+IFRoaXMg
cGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBjb21tb24gaW1wbGVtZW50YXRpb24gb2YgdGhpcyBjb2Rl
IGluCj4gY2hlY2tfZ2V0X3BhZ2VfZnJvbV9nZm4oKSBhbmQgdGhlbiBjb252ZXJ0cyB0aGUgdmFy
aW91cyBvcGVuLWNvZGVkIHBhdHRlcm5zCj4gaW50byBjYWxscyB0byB0aGlzIG5ldyBmdW5jdGlv
bi4KPiAKPiBOT1RFOiBUaGVyZSBhcmUgZHVwbGljYXRlIGRlY2xhcmF0aW9ucyBvZiBjaGVja19n
ZXRfcGFnZV9mcm9tX2dmbigpIGZvcgo+ICAgICAgICBBUk0gYW5kIHg4NiBiZWNhdXNlIHRoZSBm
dW5jdGlvbiB0YWtlcyBhIHAybV90eXBlX3QgYXJndW1lbnQgYW5kCj4gICAgICAgIHRoYXQgdHlw
ZSBpcyBhcmNoaXRlY3R1cmUgc3BlY2lmaWMuCgpXb3VsZG4ndCBpdCBiZSBwb3NzaWJsZSB0byBt
b3ZlICNpbmNsdWRlIHAybS1jb21tb24uaCBsYXRlciBvbiBpbiBwMm0uaD8KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
