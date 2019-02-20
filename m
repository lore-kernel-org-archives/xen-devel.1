From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 25/25] chardev: Let
 qemu_chr_write[_all] use size_t
Date: Wed, 20 Feb 2019 12:31:09 +0100
Message-ID: <1968dced-0f2f-bca4-333f-26a2ed130f6e@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-26-philmd@redhat.com>
 <20190220103836.GC21870@redhat.com>
 <CAMxuvayMF+3Y-cMkvBW8KqfuBy_AQCg771wyV660nnsmeG-q2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwQ5r-0007oU-2e
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 11:31:15 +0000
Received: by mail-wm1-f68.google.com with SMTP id q187so6263337wme.5
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 03:31:13 -0800 (PST)
In-Reply-To: <CAMxuvayMF+3Y-cMkvBW8KqfuBy_AQCg771wyV660nnsmeG-q2g@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Prasad J Pandit <pjp@fedoraproject.org>, Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yMC8xOSAxMTo0MiBBTSwgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOgo+IEhpCj4gCj4g
T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMTE6MzkgQU0gRGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVy
cmFuZ2VAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIFdlZCwgRmViIDIwLCAyMDE5IGF0IDAy
OjAyOjMyQU0gKzAxMDAsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+Pgo+Pj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvY2hhcmRldi9jaGFyLmggYi9pbmNsdWRlL2NoYXJkZXYvY2hhci5o
Cj4+PiBpbmRleCAwMzQxZGQxYmEyLi4yZTNiNWExNWNhIDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVk
ZS9jaGFyZGV2L2NoYXIuaAo+Pj4gKysrIGIvaW5jbHVkZS9jaGFyZGV2L2NoYXIuaAo+Pj4gQEAg
LTIyMSw3ICsyMjEsNyBAQCB2b2lkIHFlbXVfY2hyX3NldF9mZWF0dXJlKENoYXJkZXYgKmNociwK
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIENoYXJkZXZGZWF0dXJlIGZlYXR1cmUpOwo+
Pj4gIFFlbXVPcHRzICpxZW11X2Nocl9wYXJzZV9jb21wYXQoY29uc3QgY2hhciAqbGFiZWwsIGNv
bnN0IGNoYXIgKmZpbGVuYW1lLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Ym9vbCBwZXJtaXRfbXV4X21vbik7Cj4+PiAtaW50IHFlbXVfY2hyX3dyaXRlKENoYXJkZXYgKnMs
IGNvbnN0IHVpbnQ4X3QgKmJ1ZiwgaW50IGxlbiwgYm9vbCB3cml0ZV9hbGwpOwo+Pj4gK2ludCBx
ZW11X2Nocl93cml0ZShDaGFyZGV2ICpzLCBjb25zdCB1aW50OF90ICpidWYsIHNpemVfdCBsZW4s
IGJvb2wgd3JpdGVfYWxsKTsKPj4KPj4gU2VlaW5nIHRoaXMgY2xlYW51cCByZW1pbmRzIG1lIHRo
YXQgSSB0aGluayB3ZSBvdWdodCB0byBjaGFuZ2UKPj4gdGhlIGNoYXJkZXYgcmVhZCAmIHdyaXRl
IGZ1bmN0aW9ucyB0byB0YWtlICJ2b2lkICpidWYiIGluc3RlYWQuCj4+IGFzIGlzIGRvbmUgZm9y
IHJlZ3VsYXIgbGliYyAgcmVhZC93cml0ZSBmdW5jdGlvbnMuIFRoaXMgd291bGQKPj4gYXZvaWQg
Y2FzdHMgaW4gdGhlIGNhbGxlcnMgYmV0d2VlbiBjaGFyICovdWludDhfdCAqCj4+Cj4+IFNvbWV0
aGluZyB0byB0aGluayBhYm91dCBmb3IgYSBmdXR1cmUgY2xlYW51cCBqb2IuLi4uc2FtZSBhcHBs
aWVzCj4+IGZvciB0aGUgUUlPQ2hhbm5lbCBBUElzIHdoaWNoIHRha2UgYSAnY2hhciAqYnVmJywg
YW5ub3lpbmdseQo+PiBkaWZmZXJlbnQgZnJvbSB0aGUgY2hhcmRldiBBUElzIDotKCBCb3RoIG91
Z2h0IHRvIGhhdmUgdm9pZCAqYnVmCj4gCj4gSSBmdWxseSBhZ3JlZSwgYW5kIEkgc3RhcnRlZCB0
aGF0IGNvbnZlcnNpb24gc29tZSB0aW1lIGFnbywgYW5kIGxvc3QKPiBpdCBzb21ld2hlcmUuIFRo
YXQgc2hvdWxkIGJlIGVhc2llciB0aGFuIGNoYW5naW5nIHRoZSBzaWduIG9mIHJldHVybgo+IHZh
bHVlcyB0aG91Z2ghCgpJIHRob3VnaHQgYWJvdXQgaXQgdG9vIGFuZCBhbSBoYXBweSBib3RoIG9m
IHlvdSBhZ3JlZS4KClRoZSAicGFydCAjMyIgdXBkYXRlIHRoZSBwcm90b3R5cGVzIHRvIHJldHVy
biBzc2l6ZV90IGluc3RlYWQgb2YgaW50LgpJIGNhbiBkbyB0aGlzIGNoYW5nZSB0aGVyZS4KCj4+
Cj4+Cj4+IFJlZ2FyZHMsCj4+IERhbmllbAo+PiAtLQo+PiB8OiBodHRwczovL2JlcnJhbmdlLmNv
bSAgICAgIC1vLSAgICBodHRwczovL3d3dy5mbGlja3IuY29tL3Bob3Rvcy9kYmVycmFuZ2UgOnwK
Pj4gfDogaHR0cHM6Ly9saWJ2aXJ0Lm9yZyAgICAgICAgIC1vLSAgICAgICAgICAgIGh0dHBzOi8v
ZnN0b3AxMzguYmVycmFuZ2UuY29tIDp8Cj4+IHw6IGh0dHBzOi8vZW50YW5nbGUtcGhvdG8ub3Jn
ICAgIC1vLSAgICBodHRwczovL3d3dy5pbnN0YWdyYW0uY29tL2RiZXJyYW5nZSA6fAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
