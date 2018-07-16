From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH v2] console: avoid printing no or null
 time stamps
Date: Mon, 16 Jul 2018 01:33:29 -0600
Message-ID: <5B4C4A4902000078001D4253@prv1-mh.provo.novell.com>
References: <5B3E224D02000078001D18B7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=6083=ka=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fey0p-00059I-9j
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 07:33:39 +0000
In-Reply-To: <5B3E224D02000078001D18B7@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjA3LjE4IGF0IDE1OjUxLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IER1
cmluZyBlYXJseSBib290IHRpbWVzdGFtcHMgYXJlbid0IHZlcnkgdXNlZnVsLCBhcyB0aGV5J3Jl
IGFsbCB6ZXJvCj4gKGluICJib290IiBtb2RlKSBvciBhYnNlbnQgYWx0b2dldGhlciAoaW4gImRh
dGUiIGFuZCAiZGF0ZW1zIiBtb2RlcykuCj4gTG9nICJib290IiBmb3JtYXQgdGltZXN0YW1wcyB3
aGVuIHRoZSBkYXRlIGZvcm1hdHMgYXJlbid0IGF2YWlsYWJsZSB5ZXQsCj4gYW5kIGxvZyByYXcg
dGltZXN0YW1wcyB3aGVuIGJvb3Qgb25lcyBhcmUgc3RpbGwgYWxsIHplcm8uIEFsc28gYWRkIGEK
PiAicmF3IiBtb2RlLgo+IAo+IEZvciB0aGUgQVJNIHNpZGUgZ2V0X2N5Y2xlcygpIHRvIHByb2R1
Y2UgYSBtZWFuaW5nZnVsIHZhbHVlLCBBUk0ncwo+IGN5Y2xlX3QgZ2V0cyBjaGFuZ2VkIHRvIHVp
bnQ2NF90Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCk1heSBJIGFzayBmb3IgYW4gQVJNIHNpZGUgYWNrIChvciBvdGhlcndpc2UpIGZvciB0aGlz
OgoKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL3RpbWUuaAo+ICsrKyBiL3hlbi9pbmNsdWRl
L2FzbS1hcm0vdGltZS5oCj4gQEAgLTUsMTEgKzUsMTEgQEAKPiAgICAgIERUX01BVENIX0NPTVBB
VElCTEUoImFybSxhcm12Ny10aW1lciIpLCBcCj4gICAgICBEVF9NQVRDSF9DT01QQVRJQkxFKCJh
cm0sYXJtdjgtdGltZXIiKQo+ICAKPiAtdHlwZWRlZiB1bnNpZ25lZCBsb25nIGN5Y2xlc190Owo+
ICt0eXBlZGVmIHVpbnQ2NF90IGN5Y2xlc190Owo+ICAKPiAgc3RhdGljIGlubGluZSBjeWNsZXNf
dCBnZXRfY3ljbGVzICh2b2lkKQo+ICB7Cj4gLSAgICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICAg
cmV0dXJuIFJFQURfU1lTUkVHNjQoQ05UUENUX0VMMCk7Cj4gIH0KPiAgCj4gIC8qIExpc3Qgb2Yg
dGltZXIncyBJUlEgKi8KClRoYW5rcywgSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
