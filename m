From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v18 05/11] x86/mm: add HYPERVISOR_memory_op
 to acquire guest resources
Date: Mon, 26 Mar 2018 06:51:12 -0600
Message-ID: <5AB908E002000078001B619E@prv1-mh.provo.novell.com>
References: <20180322115521.30936-1-paul.durrant@citrix.com>
 <20180322115521.30936-6-paul.durrant@citrix.com>
 <5AB8F88202000078001B60C0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zopv=gq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f0Ran-000627-CO
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 12:51:17 +0000
In-Reply-To: <5AB8F88202000078001B60C0@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAzLjE4IGF0IDEzOjQxLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDIyLjAzLjE4IGF0IDEyOjU1LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+
PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5LmgKPj4gKysrIGIveGVuL2luY2x1ZGUv
cHVibGljL21lbW9yeS5oCj4+IEBAIC01OTksNiArNTk5LDU5IEBAIHN0cnVjdCB4ZW5fcmVzZXJ2
ZWRfZGV2aWNlX21lbW9yeV9tYXAgewo+PiAgdHlwZWRlZiBzdHJ1Y3QgeGVuX3Jlc2VydmVkX2Rl
dmljZV9tZW1vcnlfbWFwIAo+PiB4ZW5fcmVzZXJ2ZWRfZGV2aWNlX21lbW9yeV9tYXBfdDsKPj4g
IERFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbl9yZXNlcnZlZF9kZXZpY2VfbWVtb3J5X21hcF90
KTsKPj4gIAo+PiArLyoKPj4gKyAqIEdldCB0aGUgcGFnZXMgZm9yIGEgcGFydGljdWxhciBndWVz
dCByZXNvdXJjZSwgc28gdGhhdCB0aGV5IGNhbiBiZQo+PiArICogbWFwcGVkIGRpcmVjdGx5IGJ5
IGEgdG9vbHMgZG9tYWluLgo+PiArICovCj4+ICsjZGVmaW5lIFhFTk1FTV9hY3F1aXJlX3Jlc291
cmNlIDI4Cj4+ICtzdHJ1Y3QgeGVuX21lbV9hY3F1aXJlX3Jlc291cmNlIHsKPj4gKyAgICAvKiBJ
TiAtIFRoZSBkb21haW4gd2hvc2UgcmVzb3VyY2UgaXMgdG8gYmUgbWFwcGVkICovCj4+ICsgICAg
ZG9taWRfdCBkb21pZDsKPj4gKyAgICAvKiBJTiAtIHRoZSB0eXBlIG9mIHJlc291cmNlICovCj4+
ICsgICAgdWludDE2X3QgdHlwZTsKPj4gKyAgICAvKgo+PiArICAgICAqIElOIC0gYSB0eXBlLXNw
ZWNpZmljIHJlc291cmNlIGlkZW50aWZpZXIsIHdoaWNoIG11c3QgYmUgemVybwo+PiArICAgICAq
ICAgICAgdW5sZXNzIHN0YXRlZCBvdGhlcndpc2UuCj4+ICsgICAgICovCj4+ICsgICAgdWludDMy
X3QgaWQ7Cj4+ICsgICAgLyoKPj4gKyAgICAgKiBJTi9PVVQgLSBBcyBhbiBJTiBwYXJhbWV0ZXIg
bnVtYmVyIG9mIGZyYW1lcyBvZiB0aGUgcmVzb3VyY2UKPj4gKyAgICAgKiAgICAgICAgICB0byBi
ZSBtYXBwZWQuIEhvd2V2ZXIsIGlmIHRoZSBzcGVjaWZpZWQgdmFsdWUgaXMgMCBhbmQKPj4gKyAg
ICAgKiAgICAgICAgICBmcmFtZV9saXN0IGlzIE5VTEwgdGhlbiB0aGlzIGZpZWxkIHdpbGwgYmUg
c2V0IHRvIHRoZQo+PiArICAgICAqICAgICAgICAgIG1heGltdW0gdmFsdWUgc3VwcG9ydGVkIGJ5
IHRoZSBpbXBsZW1lbnRhdGlvbiBvbiByZXR1cm4uCj4+ICsgICAgICovCj4+ICsgICAgdWludDMy
X3QgbnJfZnJhbWVzOwo+PiArICAgIC8qCj4+ICsgICAgICogT1VUIC0gTXVzdCBiZSB6ZXJvIG9u
IGVudHJ5LiBPbiByZXR1cm4gdGhpcyBtYXkgY29udGFpbiBhIGJpdHdpc2UKPj4gKyAgICAgKiAg
ICAgICBPUiBvZiB0aGUgZm9sbG93aW5nIHZhbHVlcy4KPj4gKyAgICAgKi8KPj4gKyAgICB1aW50
MzJfdCBmbGFnczsKPj4gKwo+PiArICAgIC8qIFRoZSByZXNvdXJjZSBwYWdlcyBoYXZlIGJlZW4g
YXNzaWduZWQgdG8gdGhlIHRvb2xzIGRvbWFpbiAqLwo+PiArI2RlZmluZSBfWEVOTUVNX3Jlc291
cmNlX2ZsYWdfdG9vbHNfb3duZWQgMAo+PiArI2RlZmluZSBYRU5NRU1fcmVzb3VyY2VfZmxhZ190
b29sc19vd25lZCAoMXUgPDwgCj4gX1hFTk1FTV9yZXNvdXJjZV9mbGFnX3Rvb2xzX293bmVkKQo+
IAo+IElzICJ0b29scyIgcmVhbGx5IGFuIGFwcHJvcHJpYXRlIChhbmQgImZsYWciIGEgbmVjZXNz
YXJ5KSBuYW1lCj4gY29tcG9uZW50IGhlcmU/IEhvdyBhYm91dCBlLmcuIFhFTk1FTV9yZXNfYWNx
X2NhbGxlcl9vd25lZD8KCk9yIG1heWJlIFhFTk1FTV9yc3JjX2FjcV9jYWxsZXJfb3duZWQuCgpK
YW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
