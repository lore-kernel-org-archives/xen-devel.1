From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
Date: Thu, 16 May 2019 16:30:26 +0300
Message-ID: <e6e788f4-f74e-758d-997d-a01d50a80025@gmail.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <5CDD52F1020000780022FA14@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5CDD52F1020000780022FA14@prv1-mh.provo.novell.com>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSmFuLAoKT24gMTYuMDUuMTkgMTU6MDksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDIzLjA0LjE5IGF0IDEwOjEwLCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3RlOgo+PiAt
LS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2No
ZWQuaAo+PiBAQCAtMTYzLDE1ICsxNjMsMjMgQEAgc3RydWN0IHZjcHUKPj4gICAgICAgdm9pZCAg
ICAgICAgICAgICpzY2hlZF9wcml2OyAgICAvKiBzY2hlZHVsZXItc3BlY2lmaWMgZGF0YSAqLwo+
PiAgIAo+PiAgICAgICBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZvIHJ1bnN0YXRlOwo+PiArCj4+
ICsgICAgc3BpbmxvY2tfdCAgICAgIG1hcHBlZF9ydW5zdGF0ZV9sb2NrOwo+IAo+IEJlc2lkZXMg
b3RoZXIgY29tbWVudHMgZ2l2ZW4gZWxzZXdoZXJlIGFscmVhZHkgLSBkb2VzIHRoaXMKPiByZWFs
bHkgbmVlZCB0byBiZSBhIHBlci12Q1BVIGxvY2s/IEd1ZXN0cyBhcmVuJ3QgZXhwZWN0ZWQgdG8K
PiBpbnZva2UgdGhlIEFQSSBmcmVxdWVudGx5LCBzbyBxdWl0ZSBsaWtlbHkgYSBwZXItZG9tYWlu
IGxvY2sKPiB3b3VsZCBzdWZmaWNlLiBRdWl0ZSBwb3NzaWJseSBkb21haW5feyx1bn1sb2NrKCkg
Y291bGQKPiBhY3R1YWxseSBiZSAocmUtKXVzZWQuCgpJJ2Qgbm90IHVzZSBhIHBlci1kb21haW4g
bG9jayBoZXJlLiBUaGlzIGxvY2sgd2lsbCBiZSBsb2NrZWQgb24gZXZlcnkgcnVuc3RhdGUgYXJl
YSB1cGRhdGUsIHdoYXQncyBoYXBwZW5pbmcgb24gZXZlcnkgY29udGV4dCBzd2l0Y2guIEFuZCB0
aGUgZXZlbnQgb2Ygc2ltdWx0YW5lb3VzIHN3aXRjaGluZyBvZiB2Y3B1cyBmcm9tIHRoZSBzYW1l
IGRvbWFpbiBoYXMgcXVpdGUgaGlnaCBwcm9iYWJpbGl0eS4KCi0tIApTaW5jZXJlbHksCkFuZHJp
aSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
