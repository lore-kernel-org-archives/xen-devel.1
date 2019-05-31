From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen: cpu: change 'cpu_hotplug_[begin|done]'
 to inline function
Date: Fri, 31 May 2019 11:55:15 +0100
Message-ID: <33f34cf9-2b67-baa9-8b3c-98fa08e70ddd@arm.com>
References: <1559270815-19243-1-git-send-email-chenbaodong@mxnavi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWfBv-00040i-T1
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:55:19 +0000
In-Reply-To: <1559270815-19243-1-git-send-email-chenbaodong@mxnavi.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Baodong Chen <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiA1LzMxLzE5IDM6NDYgQU0sIEJhb2RvbmcgQ2hlbiB3cm90ZToKPiBTaWduZWQtb2Zm
LWJ5OiBCYW9kb25nIENoZW4gPGNoZW5iYW9kb25nQG14bmF2aS5jb20+Cj4gLS0tCj4gICB4ZW4v
Y29tbW9uL2NwdS5jICAgICAgfCAxMCAtLS0tLS0tLS0tCj4gICB4ZW4vaW5jbHVkZS94ZW4vY3B1
LmggfCAgNCArKy0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vY3B1LmMgYi94ZW4vY29tbW9u
L2NwdS5jCj4gaW5kZXggZjM4OGQ4OS4uYTUyNmI1NSAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9u
L2NwdS5jCj4gKysrIGIveGVuL2NvbW1vbi9jcHUuYwo+IEBAIC01MSwxNiArNTEsNiBAQCB2b2lk
IHB1dF9jcHVfbWFwcyh2b2lkKQo+ICAgICAgIHNwaW5fdW5sb2NrX3JlY3Vyc2l2ZSgmY3B1X2Fk
ZF9yZW1vdmVfbG9jayk7Cj4gICB9Cj4gICAKPiAtYm9vbF90IGNwdV9ob3RwbHVnX2JlZ2luKHZv
aWQpCj4gLXsKPiAtICAgIHJldHVybiBnZXRfY3B1X21hcHMoKTsKPiAtfQo+IC0KPiAtdm9pZCBj
cHVfaG90cGx1Z19kb25lKHZvaWQpCj4gLXsKPiAtICAgIHB1dF9jcHVfbWFwcygpOwo+IC19Cj4g
LQo+ICAgc3RhdGljIE5PVElGSUVSX0hFQUQoY3B1X2NoYWluKTsKPiAgIAo+ICAgdm9pZCBfX2lu
aXQgcmVnaXN0ZXJfY3B1X25vdGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIpCj4gZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9jcHUuaCBiL3hlbi9pbmNsdWRlL3hlbi9jcHUuaAo+
IGluZGV4IDQ2MzhjNTAuLjcwYTJkZjQgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2Nw
dS5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2NwdS5oCj4gQEAgLTEwLDggKzEwLDggQEAgYm9v
bF90IGdldF9jcHVfbWFwcyh2b2lkKTsKPiAgIHZvaWQgcHV0X2NwdV9tYXBzKHZvaWQpOwo+ICAg
Cj4gICAvKiBTYWZlbHkgcGVyZm9ybSBDUFUgaG90cGx1ZyBhbmQgdXBkYXRlIGNwdV9vbmxpbmVf
bWFwLCBldGMuICovCj4gLWJvb2xfdCBjcHVfaG90cGx1Z19iZWdpbih2b2lkKTsKPiAtdm9pZCBj
cHVfaG90cGx1Z19kb25lKHZvaWQpOwo+ICtzdGF0aWMgaW5saW5lIGJvb2xfdCBjcHVfaG90cGx1
Z19iZWdpbih2b2lkKSB7IHJldHVybiBnZXRfY3B1X21hcHMoKTsgfQo+ICtzdGF0aWMgaW5saW5l
IHZvaWQgY3B1X2hvdHBsdWdfZG9uZSh2b2lkKSB7IHB1dF9jcHVfbWFwcygpOyB9CgpUaGUgY29k
aW5nIHN0eWxlIHNob3VsZCBiZToKCnN0YXRpYyBpbmxpbmUuLi4uCnsKICAgICAgIC4uLgp9Cgo+
ICAgCj4gICAvKiBSZWNlaXZlIG5vdGlmaWNhdGlvbiBvZiBDUFUgaG90cGx1ZyBldmVudHMuICov
Cj4gICB2b2lkIHJlZ2lzdGVyX2NwdV9ub3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5i
KTsKPiAKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
