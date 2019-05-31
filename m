From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] dom_cow is needed for mem-sharing only
Date: Fri, 31 May 2019 04:03:52 -0600
Message-ID: <5CF0FC080200007800233E50@prv1-mh.provo.novell.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
 <f78f627c-753f-a162-14a1-b193908f673a@arm.com>
 <5CF0F8BE0200007800233DE3@prv1-mh.provo.novell.com>
 <f8edeb03-b223-e723-0b02-9ca565fe8055@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWeOD-00073h-6I
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:03:57 +0000
In-Reply-To: <f8edeb03-b223-e723-0b02-9ca565fe8055@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA1LjE5IGF0IDExOjUyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDUvMzEvMTkgMTA6NDkgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAzMS4wNS4x
OSBhdCAxMTo0MiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDUvMzEvMTkg
MTA6MzUgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9t
bS5oCj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL21tLmgKPj4+PiBAQCAtNjQ0LDYgKzY0NCw5
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmaWx0ZXJlZF9mbHVzaF90bGJfbWEKPj4+PiAgICAKPj4+
PiAgICAvKiBQcml2YXRlIGRvbWFpbiBzdHJ1Y3RzIGZvciBET01JRF9YRU4sIERPTUlEX0lPLCBl
dGMuICovCj4+Pj4gICAgZXh0ZXJuIHN0cnVjdCBkb21haW4gKmRvbV94ZW4sICpkb21faW8sICpk
b21fY293Owo+Pj4KPj4+IERvbid0IHlvdSB3YW50IHRvIHByb3RlY3QgZG9tX2NvdyB3aXRoICIj
aWZkZWYgQ09ORklHX0hBU19NRU1fU0hBUklORyI/Cj4+IAo+PiBUaGVyZSdzIG5vIG5lZWQgdG8g
d2l0aCAuLi4KPj4gCj4+Pj4gKyNpZm5kZWYgQ09ORklHX0hBU19NRU1fU0hBUklORwo+Pj4+ICsj
IGRlZmluZSBkb21fY293IE5VTEwKPj4+PiArI2VuZGlmCj4+IAo+PiAuLi4gdGhpcywgYW5kIHRo
aXMgd2F5IHRoZXJlJ3MgbGVzcyBjbHV0dGVyIG92ZXJhbGwuCj4gCj4gSSBhbSBhbGwgZm9yIGF2
b2lkaW5nIGNsdXR0ZXJpbmcgYnV0IG5vdCBhdCB0aGUgZXhwZW5zZSBvZiBtYWtpbmcgdGhlIAo+
IGNvZGUgbGVzcyBpbnR1aXRpdmUuIEluIHRoaXMgY2FzZSwgSSB3b3VsZCBwcmVmZXIgdGhlIGRl
Y2xlcmF0aW9uIAo+IGRvbV9jb3cgdG8gYmUgZ3VhcmRlZC4KCldoaWxlIGl0IHdvdWxkIGJlIGVh
c3kgZW5vdWdoIHRvIGRvLCBJIGZhaWwgdG8gc2VlIGhvdyB0aGUgY2hvc2VuCmNvbnN0cnVjdCBp
cyBub3QgImludHVpdGl2ZSIuIEluIGZhY3QgSSBkb24ndCB0aGluayB0aGlzIHdvdWxkIGJlIHRo
ZQpmaXJzdCBpbnN0YW5jZSBvZiBhICNkZWZpbmUgb3ZlcnJpZGluZyBhIHByaW9yIGRlY2xhcmF0
aW9uLiBEb2luZyBzbwp1dGlsaXplcyBvbmUgb2YgdGhlIHZlcnkgYmFzaWMgQyBwcmVwcm9jZXNz
b3IgcHJpbmNpcGxlcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
