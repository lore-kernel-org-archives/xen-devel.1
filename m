From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 25/25] chardev: Let
 qemu_chr_write[_all] use size_t
Date: Wed, 20 Feb 2019 10:38:36 +0000
Message-ID: <20190220103836.GC21870__25652.469966893$1550659228$gmane$org@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-26-philmd@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fEqt=Q3=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1gwPHh-0001Lr-JA
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 10:39:25 +0000
Content-Disposition: inline
In-Reply-To: <20190220010232.18731-26-philmd@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>, Prasad J Pandit <pjp@fedoraproject.org>, Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>Stefan
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMDI6MDI6MzJBTSArMDEwMCwgUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgd3JvdGU6Cgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2NoYXJkZXYvY2hhci5oIGIv
aW5jbHVkZS9jaGFyZGV2L2NoYXIuaAo+IGluZGV4IDAzNDFkZDFiYTIuLjJlM2I1YTE1Y2EgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9jaGFyZGV2L2NoYXIuaAo+ICsrKyBiL2luY2x1ZGUvY2hhcmRl
di9jaGFyLmgKPiBAQCAtMjIxLDcgKzIyMSw3IEBAIHZvaWQgcWVtdV9jaHJfc2V0X2ZlYXR1cmUo
Q2hhcmRldiAqY2hyLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIENoYXJkZXZGZWF0dXJl
IGZlYXR1cmUpOwo+ICBRZW11T3B0cyAqcWVtdV9jaHJfcGFyc2VfY29tcGF0KGNvbnN0IGNoYXIg
KmxhYmVsLCBjb25zdCBjaGFyICpmaWxlbmFtZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBib29sIHBlcm1pdF9tdXhfbW9uKTsKPiAtaW50IHFlbXVfY2hyX3dyaXRlKENoYXJk
ZXYgKnMsIGNvbnN0IHVpbnQ4X3QgKmJ1ZiwgaW50IGxlbiwgYm9vbCB3cml0ZV9hbGwpOwo+ICtp
bnQgcWVtdV9jaHJfd3JpdGUoQ2hhcmRldiAqcywgY29uc3QgdWludDhfdCAqYnVmLCBzaXplX3Qg
bGVuLCBib29sIHdyaXRlX2FsbCk7CgpTZWVpbmcgdGhpcyBjbGVhbnVwIHJlbWluZHMgbWUgdGhh
dCBJIHRoaW5rIHdlIG91Z2h0IHRvIGNoYW5nZQp0aGUgY2hhcmRldiByZWFkICYgd3JpdGUgZnVu
Y3Rpb25zIHRvIHRha2UgInZvaWQgKmJ1ZiIgaW5zdGVhZC4KYXMgaXMgZG9uZSBmb3IgcmVndWxh
ciBsaWJjICByZWFkL3dyaXRlIGZ1bmN0aW9ucy4gVGhpcyB3b3VsZAphdm9pZCBjYXN0cyBpbiB0
aGUgY2FsbGVycyBiZXR3ZWVuIGNoYXIgKi91aW50OF90ICoKClNvbWV0aGluZyB0byB0aGluayBh
Ym91dCBmb3IgYSBmdXR1cmUgY2xlYW51cCBqb2IuLi4uc2FtZSBhcHBsaWVzCmZvciB0aGUgUUlP
Q2hhbm5lbCBBUElzIHdoaWNoIHRha2UgYSAnY2hhciAqYnVmJywgYW5ub3lpbmdseQpkaWZmZXJl
bnQgZnJvbSB0aGUgY2hhcmRldiBBUElzIDotKCBCb3RoIG91Z2h0IHRvIGhhdmUgdm9pZCAqYnVm
CgoKUmVnYXJkcywKRGFuaWVsCi0tIAp8OiBodHRwczovL2JlcnJhbmdlLmNvbSAgICAgIC1vLSAg
ICBodHRwczovL3d3dy5mbGlja3IuY29tL3Bob3Rvcy9kYmVycmFuZ2UgOnwKfDogaHR0cHM6Ly9s
aWJ2aXJ0Lm9yZyAgICAgICAgIC1vLSAgICAgICAgICAgIGh0dHBzOi8vZnN0b3AxMzguYmVycmFu
Z2UuY29tIDp8Cnw6IGh0dHBzOi8vZW50YW5nbGUtcGhvdG8ub3JnICAgIC1vLSAgICBodHRwczov
L3d3dy5pbnN0YWdyYW0uY29tL2RiZXJyYW5nZSA6fAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
