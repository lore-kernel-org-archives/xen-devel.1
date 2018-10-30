From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH V3 3/3] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Tue, 30 Oct 2018 16:47:56 +0000
Message-ID: <20181030164756.n5gmrrpvqtlszk2z@zion.uk.xensource.com>
References: <1540816837-8936-1-git-send-email-rcojocaru@bitdefender.com>
 <1540816837-8936-4-git-send-email-rcojocaru@bitdefender.com>
 <5BD885F002000078001F66D3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mwh5=nk=citrix.com=prvs=834ba7b9c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gHXBQ-0006yz-Ic
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 16:48:00 +0000
Content-Disposition: inline
In-Reply-To: <5BD885F002000078001F66D3@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMzAsIDIwMTggYXQgMTA6MjU6MjBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI5LjEwLjE4IGF0IDEzOjQwLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNv
bT4gd3JvdGU6Cj4gPiBAQCAtMzE2LDYgKzMzOSwyMiBAQCB2b2lkIHAybV9tZW1vcnlfdHlwZV9j
aGFuZ2VkKHN0cnVjdCBkb21haW4gKmQpCj4gPiAgICAgIH0KPiA+ICB9Cj4gPiAgCj4gPiArdm9p
ZCBwMm1fbWVtb3J5X3R5cGVfY2hhbmdlZChzdHJ1Y3QgZG9tYWluICpkKQo+ID4gK3sKPiA+ICsg
ICAgX21lbW9yeV90eXBlX2NoYW5nZWQocDJtX2dldF9ob3N0cDJtKGQpKTsKPiA+ICsKPiA+ICsj
aWZkZWYgQ09ORklHX0hWTQo+ID4gKyAgICBpZiAoIHVubGlrZWx5KGFsdHAybV9hY3RpdmUoZCkp
ICkKPiA+ICsgICAgewo+ID4gKyAgICAgICAgdW5zaWduZWQgaW50IGk7Cj4gPiArCj4gPiArICAg
ICAgICBmb3IgKCBpID0gMDsgaSA8IE1BWF9BTFRQMk07IGkrKyApCj4gPiArICAgICAgICAgICAg
aWYgKCBkLT5hcmNoLmFsdHAybV9lcHRwW2ldICE9IG1mbl94KElOVkFMSURfTUZOKSApCj4gPiAr
ICAgICAgICAgICAgICAgIF9tZW1vcnlfdHlwZV9jaGFuZ2VkKGQtPmFyY2guYWx0cDJtX3AybVtp
XSk7Cj4gPiArICAgIH0KPiA+ICsjZW5kaWYKPiA+ICt9Cj4gCj4gSG1tLCBJJ20gcHV6emxlZCBi
eSB0aGUgI2lmZGVmIHBsYWNlbWVudC4gV2VpLCBkaWRuJ3Qgd2Ugc2V0dGxlIHRoYXQKPiB0aGlz
IGNvZGUgaXMgSFZNIG9ubHkgYWx0b2dldGhlcj8KCkl0cyBjYWxsZXJzIGxpdmUgaW4gaHZtL210
cnIuYyB3aGljaCBkb24ndCBnZXQgYnVpbHQgd2hlbiBIVk0gaXMKZGlzYWJsZWQuIFdlIHJlbHkg
b24gRENFIHRvIHB1cmdlIHRoaXMgZnVuY3Rpb24gd2hlbiBsaW5raW5nLgoKV2l0aCB0aGUgaW50
cm9kdWN0aW9uIG9mIGFsdHAybSBmaWVsZHMgaW4gdGhpcyBmdW5jdGlvbiBpdCBtYXkgbm93IGJl
CmJldHRlciB0byBwdXQgdGhlIHdob2xlIGZ1bmN0aW9uIHVuZGVyIENPTkZJR19IVk0uCgpXZWku
Cgo+IAo+IEphbgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
