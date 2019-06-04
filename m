From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2] xen/public: arch-arm: Restrict the
 visibility of struct vcpu_guest_core_regs
Date: Tue, 4 Jun 2019 09:46:11 +0100
Message-ID: <c254fcfc-ff24-6dd8-de3e-9b9bf59e7ff3@arm.com>
References: <20190603161108.864-1-julien.grall@arm.com>
 <5CF61A9E0200007800234E81@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0KbE=UD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hY55E-00047j-So
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 08:46:16 +0000
In-Reply-To: <5CF61A9E0200007800234E81@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, WeiLiu <wl@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gNi80LzE5IDg6MTUgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAz
LjA2LjE5IGF0IDE4OjExLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiAtLS0gYS94
ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaAo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMv
YXJjaC1hcm0uaAo+PiBAQCAtMTk3LDYgKzE5Nyw3IEBACj4+ICAgICAgIH0gd2hpbGUgKCAwICkK
Pj4gICAjZGVmaW5lIHNldF94ZW5fZ3Vlc3RfaGFuZGxlKGhuZCwgdmFsKSBzZXRfeGVuX2d1ZXN0
X2hhbmRsZV9yYXcoaG5kLCB2YWwpCj4+ICAgCj4+ICsjaWYgZGVmaW5lZChfX1hFTl9fKSB8fCBk
ZWZpbmVkKF9fWEVOX1RPT0xTX18pCj4+ICAgI2lmIGRlZmluZWQoX19HTlVDX18pICYmICFkZWZp
bmVkKF9fU1RSSUNUX0FOU0lfXykKPj4gICAvKiBBbm9ueW1vdXMgdW5pb24gaW5jbHVkZXMgYm90
aCAzMi0gYW5kIDY0LWJpdCBuYW1lcyAoZS5nLiwgcjAveDApLiAqLwo+PiAgICMgZGVmaW5lIF9f
REVDTF9SRUcobjY0LCBuMzIpIHVuaW9uIHsgICAgICAgICAgXAo+PiBAQCAtMjcyLDYgKzI3Myw4
IEBAIERFRklORV9YRU5fR1VFU1RfSEFORExFKHZjcHVfZ3Vlc3RfY29yZV9yZWdzX3QpOwo+PiAg
IAo+PiAgICN1bmRlZiBfX0RFQ0xfUkVHCj4+ICAgCj4+ICsjZW5kaWYKPj4gKwo+PiAgIHR5cGVk
ZWYgdWludDY0X3QgeGVuX3Bmbl90Owo+PiAgICNkZWZpbmUgUFJJX3hlbl9wZm4gUFJJeDY0Cj4+
ICAgI2RlZmluZSBQUkl1X3hlbl9wZm4gUFJJdTY0Cj4gCj4gSSdtIHB1enpsZWQgYnkgeW91IHN0
aWxsIGFkZGluZyBhbm90aGVyICNpZiwgcmF0aGVyIHRoYW4gbW92aW5nIHRoZQo+IGJsb2NrIGRv
d24gaW50byB0aGUgZXhpc3Rpbmcgb25lLiBZb3Ugc2FpZCB5b3UnZCB3YWl0IGZvciBTdGVmYW5v
J3MKPiBvcGluaW9uLCBhbmQgaGUgYXNrZWQgdGhhdCB5b3UgZm9sbG93IG15IHN1Z2dlc3Rpb24u
IERpZCBJIG1pc3MKPiBzb21lIGZ1cnRoZXIgcGFydCBvZiB0aGUgZGlzY3Vzc2lvbj8KCk5vIEkg
aGF2ZSBzZW50IHRoZSB3cm9uZyB2ZXJzaW9uLiBOb3Qgc3VyZSBob3cgYmVjYXVzZSB0aGUgY2hh
bmdlcyBhcmUgCmNvcnJlY3QgaW4gdGhlIGJyYW5jaCBJIGFtIHVzaW5nLgoKU29ycnkgZm9yIHRo
ZSBpbmNvbnZlbmllbmNlLCBJIHdpbGwgcmVzZW5kIHRoZSBwYXRjaC4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
