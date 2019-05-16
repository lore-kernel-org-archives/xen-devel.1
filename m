From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
Date: Thu, 16 May 2019 14:48:37 +0100
Message-ID: <4912f9e5-860a-04ce-92bc-99e1abe700a1@arm.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <5CDD52F1020000780022FA14@prv1-mh.provo.novell.com>
 <80187476-c972-7d88-d6f7-09c04d96705e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <80187476-c972-7d88-d6f7-09c04d96705e@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNi8wNS8yMDE5IDE0OjMwLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEphbiwK
PiAKPiBPbiAxNi4wNS4xOSAxNTowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIzLjA0
LjE5IGF0IDEwOjEwLCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3RlOgo+Pj4gLS0tIGEv
eGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5o
Cj4+PiBAQCAtMTYzLDE1ICsxNjMsMjMgQEAgc3RydWN0IHZjcHUKPj4+IMKgwqDCoMKgwqAgdm9p
ZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKnNjaGVkX3ByaXY7wqDCoMKgIC8qIHNjaGVkdWxlci1z
cGVjaWZpYyBkYXRhICovCj4+PiDCoMKgwqDCoMKgIHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8g
cnVuc3RhdGU7Cj4+PiArCj4+PiArwqDCoMKgIHNwaW5sb2NrX3TCoMKgwqDCoMKgIG1hcHBlZF9y
dW5zdGF0ZV9sb2NrOwo+Pgo+PiBCZXNpZGVzIG90aGVyIGNvbW1lbnRzIGdpdmVuIGVsc2V3aGVy
ZSBhbHJlYWR5IC0gZG9lcyB0aGlzCj4+IHJlYWxseSBuZWVkIHRvIGJlIGEgcGVyLXZDUFUgbG9j
az8gR3Vlc3RzIGFyZW4ndCBleHBlY3RlZCB0bwo+PiBpbnZva2UgdGhlIEFQSSBmcmVxdWVudGx5
LCBzbyBxdWl0ZSBsaWtlbHkgYSBwZXItZG9tYWluIGxvY2sKPj4gd291bGQgc3VmZmljZS4gUXVp
dGUgcG9zc2libHkgZG9tYWluX3ssdW59bG9jaygpIGNvdWxkCj4+IGFjdHVhbGx5IGJlIChyZS0p
dXNlZC4KPiAKPiBJJ2Qgbm90IHVzZSBhIHBlci1kb21haW4gbG9jayBoZXJlLiBUaGlzIGxvY2sg
d2lsbCBiZSBsb2NrZWQgb24gZXZlcnkgcnVuc3RhdGUgCj4gYXJlYSB1cGRhdGUsIHdoYXQncyBo
YXBwZW5pbmcgb24gZXZlcnkgY29udGV4dCBzd2l0Y2guIEFuZCB0aGUgZXZlbnQgb2YgCj4gc2lt
dWx0YW5lb3VzIHN3aXRjaGluZyBvZiBzZXZlcmFsIHZjcHVzIGZyb20gdGhlIHNhbWUgZG9tYWlu
IGhhcyBxdWl0ZSBoaWdoIAo+IHByb2JhYmlsaXR5LgoKVGhlIGxvY2sgY2FuIGJlIGNvbXBsZXRl
bHkgcmVtb3ZlZCBhbnl3YXkuIFNlZSBteSBwcmV2aW91cyBjb21tZW50cy4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
