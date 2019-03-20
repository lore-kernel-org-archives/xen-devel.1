From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 06/10] xen/arm: optee: add support for
 RPC SHM buffers
Date: Wed, 20 Mar 2019 16:52:55 +0000
Message-ID: <b9adde4b-acd1-23d4-74b6-8807ba060d87@arm.com>
References: <20190307210404.12346-1-volodymyr_babchuk@epam.com>
 <20190307210404.12346-7-volodymyr_babchuk@epam.com>
 <f0aee348-180f-d02e-8660-6d232c87ea8b@arm.com> <87pnql8qki.fsf@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p8/H=RX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h6eSZ-0000tL-GX
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2019 16:52:59 +0000
In-Reply-To: <87pnql8qki.fsf@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <vlad.babchuk@gmail.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyMC8wMy8yMDE5IDE2OjIxLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiAKPiBK
dWxpZW4gR3JhbGwgd3JpdGVzOgo+PiBPbiAwNy8wMy8yMDE5IDIxOjA0LCBWb2xvZHlteXIgQmFi
Y2h1ayB3cm90ZToKPj4+IEZyb206IFZvbG9keW15ciBCYWJjaHVrIDx2bGFkLmJhYmNodWtAZ21h
aWwuY29tPgo+Pj4KPj4+IE9QLVRFRSB1c3VhbGx5IHVzZXMgdGhlIHNhbWUgaWRlYSB3aXRoIGNv
bW1hbmQgYnVmZmVycyAoc2VlCj4+PiBwcmV2aW91cyBjb21taXQpIHRvIGlzc3VlIFJQQyByZXF1
ZXN0cy4gUHJvYmxlbSBpcyB0aGF0IGluaXRpYWxseQo+Pj4gaXQgaGFzIG5vIGJ1ZmZlciwgd2hl
cmUgaXQgY2FuIHdyaXRlIHJlcXVlc3QuIFNvIHRoZSBmaXJzdCBSUEMKPj4+IHJlcXVlc3QgaXQg
bWFrZXMgaXMgc3BlY2lhbDogaXQgcmVxdWVzdHMgTlcgdG8gYWxsb2NhdGUgc2hhcmVkCj4+PiBi
dWZmZXIgZm9yIG90aGVyIFJQQyByZXF1ZXN0cy4gVXN1YWxseSB0aGlzIGJ1ZmZlciBpcyBhbGxv
Y2F0ZWQKPj4+IG9ubHkgb25jZSBmb3IgZXZlcnkgT1AtVEVFIHRocmVhZCBhbmQgaXQgcmVtYWlu
cyBhbGxvY2F0ZWQgYWxsCj4+PiB0aGUgdGltZSB1bnRpbCBndWVzdCBzaHV0cyBkb3duLiBHdWVz
dCBjYW4gYXNrIE9QLVRFRSB0byBkaXNhYmxlCj4+PiBSUEMgYnVmZmVycyBjYWNoaW5nLCBpbiB0
aGlzIGNhc2UgT1AtVEVFIHdpbGwgYXNrIGd1ZXN0IHRvCj4+PiBhbGxvY2F0ZS9mcmVlIGJ1ZmZl
ciBmb3IgdGhlIGVhY2ggUlBDLgo+Pj4KPj4+IE1lZGlhdG9yIG5lZWRzIHRvIHBpbiB0aGlzIGJ1
ZmZlciB0byBtYWtlIHN1cmUgdGhhdCBkb21haW4gY2FuJ3QKPj4+IHRyYW5zZmVyIGl0IHRvIHNv
bWVvbmUgZWxzZS4KPj4KPj4gQXQgdGhlIG1vbWVudCwgWGVuIG9uIEFybSBkb2Vzbid0IHN1cHBv
cnQgdHJhbnNmZXIgb2YgYSBwYWdlIGJldHdlZW4KPj4gZG9tYWluIChzZWUgc3RlYWxfcGFnZSku
IFdoYXQgd2Ugd2FudCB0byBwcmV2ZW50IGhlcmUgaXMgdGhlIGRvbWFpbiB0bwo+PiBmcmVlIHRo
ZSBwYWdlICh2aWEgWEVOTUVNX2RlY3JlYXNlX3Jlc2VydmF0aW9uKS4gSWYgdGhlIHJlZmVyZW5j
ZSBkcm9wCj4+IHRvIDAsIHRoZSBwYWdlIHdpbGwgYmUgZnJlZWQgYW5kIGNvdWxkIHBvdGVudGlh
bGx5IGJlIGFsbG9jYXRlZCBmb3IKPj4gWGVuIHVzYWdlIG9yIGFub3RoZXIgZG9tYWluLiBUYWtp
bmcgdGhlIHJlZmVyZW5jZSBoZXJlLCB3aWxsIHByZXZlbnQKPj4gaXQgdG8gZnJlZSB1bnRpbCB0
aGUgcmVmZXJlbmNlIGlzIGRyb3BwZWQuCj4+Cj4+IFNvIEkgd291bGQgcmV3b3JkIHRoaXMgc2Vu
dGVuY2UuIFNvbWV0aGluZyBsaWtlOgo+Pgo+PiAiTWVkaWF0b3IgbmVlZHMgdG8gcGluIHRoZSBi
dWZmZXIgdG8gbWFrZSBzdXJlIHRoZSBwYWdlIHdpbGwgbm90IGJlCj4+IGZyZWVkIHdoaWxlIGl0
IGlzIHNoYXJlZCB3aXRoIE9QLVRFRSIuCj4gV2hlbiBJIHdyb3RlIHRoYXQsIEkga2VwdCBpbiBt
aW5kIGdyYW50IG1hcHBpbmdzIGFzIHdlbGwuIEJ1dCwgSQo+IHRoaW5rLCBJIHdhcyBtaXN0YWtl
biB0aGVyZSwgYmVjYXVzZSBncmFudCBtYXBwaW5ncyB3aWxsIGhhdmUgcDJtIHR5cGUKPiBwMm1f
Z3JhbnRfbWFwX3J3L3AybV9ncmFudF9tYXBfcm8uIFNvIHllYWgsIHlvdXIgdmFyaWFudCBpcyBi
ZXR0ZXIuIFRoYW5rcy4KCkkgZG9uJ3QgdW5kZXJzdGFuZCBob3cgZ3JhbnQgbWFwcGluZ3MgYXJl
IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaC4gV2hhdCBkaWQgeW91IApoYXZlIGluIG1pbmQgYWJvdXQg
dGhlbT8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
