From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] gnttab: silence table expansion message
Date: Tue, 26 Jun 2018 05:44:58 -0600
Message-ID: <5B32273A02000078001CDFC7@prv1-mh.provo.novell.com>
References: <5B31E99902000078001CDD0D@prv1-mh.provo.novell.com>
 <f5528c9c-84c6-59a9-355e-24c7d233c5a0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x7n8=jm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fXmP9-0002fT-4T
 for xen-devel@lists.xenproject.org; Tue, 26 Jun 2018 11:45:03 +0000
In-Reply-To: <f5528c9c-84c6-59a9-355e-24c7d233c5a0@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA2LjE4IGF0IDEzOjE0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjYvMDYvMTggMDg6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUaGlzIGN1cnJl
bnRseSBzaG93cyB1cCBmb3IgYmFzaWNhbGx5IGV2ZXJ5IGRvbWFpbiwgd2hlbiBvcmlnaW5hbGx5
IGl0Cj4+IHdhcyBsb2dnZWQgb25seSB3aGVuIGdvaW5nIGJleW9uZCB0aGUgZGVmYXVsdCB0YWJs
ZSBzaXplLiBSZXN0b3JlIHRoYXQKPj4gYmVoYXZpb3IuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4KPj4gLS0tIGEveGVuL2NvbW1vbi9ncmFu
dF90YWJsZS5jCj4+ICsrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+PiBAQCAtMTc2NCw5
ICsxNzY0LDEwIEBAIGdudHRhYl9ncm93X3RhYmxlKHN0cnVjdCBkb21haW4gKmQsIHVuc2kKPj4g
ICAgICAgICAgcmVxX25yX2ZyYW1lcyA9IElOSVRJQUxfTlJfR1JBTlRfRlJBTUVTOwo+PiAgICAg
IEFTU0VSVChyZXFfbnJfZnJhbWVzIDw9IGd0LT5tYXhfZ3JhbnRfZnJhbWVzKTsKPj4gIAo+PiAt
ICAgIGdkcHJpbnRrKFhFTkxPR19JTkZPLAo+PiAtICAgICAgICAgICAgIkV4cGFuZGluZyBkJWQg
Z3JhbnQgdGFibGUgZnJvbSAldSB0byAldSBmcmFtZXNcbiIsCj4+IC0gICAgICAgICAgICBkLT5k
b21haW5faWQsIG5yX2dyYW50X2ZyYW1lcyhndCksIHJlcV9ucl9mcmFtZXMpOwo+PiArICAgIGlm
ICggcmVxX25yX2ZyYW1lcyA+IElOSVRJQUxfTlJfR1JBTlRfRlJBTUVTICkKPj4gKyAgICAgICAg
Z2RwcmludGsoWEVOTE9HX0lORk8sCj4+ICsgICAgICAgICAgICAgICAgICJFeHBhbmRpbmcgZCVk
IGdyYW50IHRhYmxlIGZyb20gJXUgdG8gJXUgZnJhbWVzXG4iLAo+PiArICAgICAgICAgICAgICAg
ICBkLT5kb21haW5faWQsIG5yX2dyYW50X2ZyYW1lcyhndCksIHJlcV9ucl9mcmFtZXMpOwo+IAo+
IFRoaXMgaGFzIGJlZW4gb24gbXkgdG9kbyBsaXN0IGZvciBhIHdoaWxlLCBidXQgSSdkIGdvIG9u
ZSBzdGFnZSBmdXJ0aGVyCj4gYW5kIGRlbGV0ZSBpdCBmdWxseS4KPiAKPiBEb21haW5zIGVpdGhl
ciBuZXZlciB0cmlnZ2VyIGl0LCBvciBleHBhbmQgdG8gbWF4LiAgSXQgZG9lc24ndCBwcm92aWRl
Cj4gYW55IHVzZWZ1bCBpbmZvcm1hdGlvbiBhdCBhbGwuCgpJIGRpc2FncmVlIC0gZG9tYWlucyBk
b24ndCBub3JtYWxseSB1c2UgYWxsIG9yIG5vdGhpbmcgb2YgZ3JhbnQgdGFibGVzLgpBbmQgdGhp
cyAoYmVpbmcgYSBkZWJ1ZyBtZXNzYWdlIG9ubHkpIG1heSBiZSBhIHVzZWZ1bCBoaW50IGlmIGEK
ZG9tYWluIG5vdCBleHBlY3RlZCB0byB1c2UgYWxsIG9mIGl0cyBncmFudCB0YWJsZSBzdWRkZW5s
eSBncm93cyBpdHMKc2l6ZSBzaWduaWZpY2FudGx5LgoKTXkgbWFpbiBnb2FsIGhlcmUgcmVhbGx5
IGlzIHRvIGdldCByaWQgb2YgdGhlIDAgLT4gMSB0cmFuc2l0aW9uIG1lc3NhZ2UKKHdoZW4gc3Rh
cnRpbmcgYSBndWVzdCkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
