From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-next 7/9] xen: Convert is_xen_heap_mfn
 to use typesafe MFN
Date: Mon, 15 Apr 2019 15:08:03 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1904151506470.29275@sstabellini-ThinkPad-X260>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-8-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ip/=SR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hG9ll-0008JP-Un
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 22:08:05 +0000
In-Reply-To: <20190218113600.9540-8-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxOCBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20tYXJtL21tLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgKPiBpbmRl
eCBiNTYwMThhYWNlLi5hOWM4MzUyYjk0IDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1h
cm0vbW0uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaAo+IEBAIC0xMzgsMTYgKzEz
OCwxNiBAQCBleHRlcm4gdmFkZHJfdCB4ZW5oZWFwX3ZpcnRfc3RhcnQ7Cj4gICNlbmRpZgo+ICAK
PiAgI2lmZGVmIENPTkZJR19BUk1fMzIKPiAtI2RlZmluZSBpc194ZW5faGVhcF9wYWdlKHBhZ2Up
IGlzX3hlbl9oZWFwX21mbihtZm5feChwYWdlX3RvX21mbihwYWdlKSkpCj4gKyNkZWZpbmUgaXNf
eGVuX2hlYXBfcGFnZShwYWdlKSBpc194ZW5faGVhcF9tZm4ocGFnZV90b19tZm4ocGFnZSkpCj4g
ICNkZWZpbmUgaXNfeGVuX2hlYXBfbWZuKG1mbikgKHsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gLSAgICB1bnNpZ25lZCBsb25nIG1mbl8gPSAobWZuKTsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICB1bnNpZ25lZCBsb25nIG1mbl8gPSBtZm5feCht
Zm4pOyAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAobWZuXyA+PSBtZm5feCh4
ZW5oZWFwX21mbl9zdGFydCkgJiYgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgbWZu
XyA8IG1mbl94KHhlbmhlYXBfbWZuX2VuZCkpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gIH0pCj4gICNlbHNlCj4gICNkZWZpbmUgaXNfeGVuX2hlYXBfcGFnZShwYWdlKSAoKHBhZ2Up
LT5jb3VudF9pbmZvICYgUEdDX3hlbl9oZWFwKQo+ICAjZGVmaW5lIGlzX3hlbl9oZWFwX21mbiht
Zm4pIFwKPiAtICAgIChtZm5fdmFsaWQoX21mbihtZm4pKSAmJiBpc194ZW5faGVhcF9wYWdlKG1m
bl90b19wYWdlKF9tZm4obWZuKSkpKQo+ICsgICAgKG1mbl92YWxpZChtZm4pICYmIGlzX3hlbl9o
ZWFwX3BhZ2UobWZuX3RvX3BhZ2UobWZuKSkpCj4gICNlbmRpZgo+ICAKPiAgI2RlZmluZSBpc194
ZW5fZml4ZWRfbWZuKG1mbikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiBA
QCAtMjQ2LDcgKzI0Niw3IEBAIHN0YXRpYyBpbmxpbmUgcGFkZHJfdCBfX3ZpcnRfdG9fbWFkZHIo
dmFkZHJfdCB2YSkKPiAgI2lmZGVmIENPTkZJR19BUk1fMzIKPiAgc3RhdGljIGlubGluZSB2b2lk
ICptYWRkcl90b192aXJ0KHBhZGRyX3QgbWEpCj4gIHsKPiAtICAgIEFTU0VSVChpc194ZW5faGVh
cF9tZm4obWEgPj4gUEFHRV9TSElGVCkpOwo+ICsgICAgQVNTRVJUKGlzX3hlbl9oZWFwX21mbiht
YWRkcl90b19tZm4obWEpKSk7Cj4gICAgICBtYSAtPSBtZm5fdG9fbWFkZHIoeGVuaGVhcF9tZm5f
c3RhcnQpOwo+ICAgICAgcmV0dXJuICh2b2lkICopKHVuc2lnbmVkIGxvbmcpIG1hICsgWEVOSEVB
UF9WSVJUX1NUQVJUOwo+ICB9CgpGb3IgdGhlIEFSTSBwYXJ0czoKCkFja2VkLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
