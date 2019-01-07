From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 1/3] spapr: Eliminate
 SPAPR_PCI_2_7_MMIO_WIN_SIZE macro
Date: Mon, 7 Jan 2019 23:35:12 +0400
Message-ID: <CAJ+F1C+wFDYWJczpmuW9c+Up0H5+zJ+J1PZfZJEUXhnNe_n0Yw@mail.gmail.com>
References: <20190107193020.21744-1-ehabkost@redhat.com>
 <20190107193020.21744-2-ehabkost@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C6Ja=PP=gmail.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1ggagI-0002TJ-73
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 19:35:26 +0000
Received: by mail-wr1-x443.google.com with SMTP id l9so1628378wrt.13
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jan 2019 11:35:25 -0800 (PST)
In-Reply-To: <20190107193020.21744-2-ehabkost@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, QEMU <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Qemu-s390x list <qemu-s390x@nongnu.org>, "open list:sPAPR pseries" <qemu-ppc@nongnu.org>, xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, David Gibson <david@gibson.dropbear.id.au>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gNywgMjAxOSBhdCAxMTozNCBQTSBFZHVhcmRvIEhhYmtvc3QgPGVoYWJrb3N0
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gVGhlIG1hY3JvIGlzIG9ubHkgdXNlZCBpbiBvbmUgcGxh
Y2UsIHdoZXJlIHRoZSBwdXJwb3NlIG9mIHRoZQo+IHZhbHVlIGlzIG9idmlvdXMuICBFbGltaW5h
dGUgdGhlIG1hY3JvIHNvIHdlIGRvbid0IG5lZWQgdG8gcmVseQo+IG9uIHN0cmluZ2lmeSgpLgo+
Cj4gU2lnbmVkLW9mZi1ieTogRWR1YXJkbyBIYWJrb3N0IDxlaGFia29zdEByZWRoYXQuY29tPgoK
UmV2aWV3ZWQtYnk6IE1hcmMtQW5kcsOpIEx1cmVhdSA8bWFyY2FuZHJlLmx1cmVhdUByZWRoYXQu
Y29tPgoKPiAtLS0KPiAgaW5jbHVkZS9ody9wY2ktaG9zdC9zcGFwci5oIHwgMSAtCj4gIGh3L3Bw
Yy9zcGFwci5jICAgICAgICAgICAgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3BjaS1o
b3N0L3NwYXByLmggYi9pbmNsdWRlL2h3L3BjaS1ob3N0L3NwYXByLmgKPiBpbmRleCA3YzY2YzM4
NzJmLi5hODVhOTk1YjZjIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvaHcvcGNpLWhvc3Qvc3BhcHIu
aAo+ICsrKyBiL2luY2x1ZGUvaHcvcGNpLWhvc3Qvc3BhcHIuaAo+IEBAIC05OSw3ICs5OSw2IEBA
IHN0cnVjdCBzUEFQUlBIQlN0YXRlIHsKPiAgI2RlZmluZSBTUEFQUl9QQ0lfQkFTRSAgICAgICAg
ICAgICAgICgxVUxMIDw8IDQ1KSAvKiAzMiBUaUIgKi8KPiAgI2RlZmluZSBTUEFQUl9QQ0lfTElN
SVQgICAgICAgICAgICAgICgxVUxMIDw8IDQ2KSAvKiA2NCBUaUIgKi8KPgo+IC0jZGVmaW5lIFNQ
QVBSX1BDSV8yXzdfTU1JT19XSU5fU0laRSAgMHhmODAwMDAwMDAKPiAgI2RlZmluZSBTUEFQUl9Q
Q0lfSU9fV0lOX1NJWkUgICAgICAgIDB4MTAwMDAKPgo+ICAjZGVmaW5lIFNQQVBSX1BDSV9NU0lf
V0lORE9XICAgICAgICAgMHg0MDAwMDAwMDAwMFVMTAo+IGRpZmYgLS1naXQgYS9ody9wcGMvc3Bh
cHIuYyBiL2h3L3BwYy9zcGFwci5jCj4gaW5kZXggNTY3MTYwOGNlYS4uYmZmNDJmMGFkYiAxMDA2
NDQKPiAtLS0gYS9ody9wcGMvc3BhcHIuYwo+ICsrKyBiL2h3L3BwYy9zcGFwci5jCj4gQEAgLTQy
MjUsNyArNDIyNSw3IEBAIHN0YXRpYyB2b2lkIHNwYXByX21hY2hpbmVfMl83X2NsYXNzX29wdGlv
bnMoTWFjaGluZUNsYXNzICptYykKPiAgICAgICAgICB7Cj4gICAgICAgICAgICAgIC5kcml2ZXIg
ICA9IFRZUEVfU1BBUFJfUENJX0hPU1RfQlJJREdFLAo+ICAgICAgICAgICAgICAucHJvcGVydHkg
PSAibWVtX3dpbl9zaXplIiwKPiAtICAgICAgICAgICAgLnZhbHVlICAgID0gc3RyaW5naWZ5KFNQ
QVBSX1BDSV8yXzdfTU1JT19XSU5fU0laRSksCj4gKyAgICAgICAgICAgIC52YWx1ZSAgICA9ICIw
eGY4MDAwMDAwMCIsCj4gICAgICAgICAgfSwKPiAgICAgICAgICB7Cj4gICAgICAgICAgICAgIC5k
cml2ZXIgICA9IFRZUEVfU1BBUFJfUENJX0hPU1RfQlJJREdFLAo+IC0tCj4gMi4xOC4wLnJjMS4x
LmczZjFmZjIxNDAKPgo+CgoKLS0gCk1hcmMtQW5kcsOpIEx1cmVhdQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
