From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v3 05/25] gdbstub: Use size_t for strlen()
 return value
Date: Wed, 20 Feb 2019 11:57:27 +0100
Message-ID: <CAMxuvay41f60+vi9BTv7CFU1coTViQrzAC-PTGoY7Ffmx+KPVA__5093.57103598944$1550660373$gmane$org@mail.gmail.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-6-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wVrY=Q3=redhat.com=mlureau@srs-us1.protection.inumbo.net>)
 id 1gwPaK-0003cM-Cb
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 10:58:40 +0000
Received: by mail-qt1-f193.google.com with SMTP id v10so26629567qtp.8
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 02:58:39 -0800 (PST)
In-Reply-To: <20190220010232.18731-6-philmd@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Prasad J Pandit <pjp@fedoraproject.org>, Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMjowNCBBTSBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqQo8
cGhpbG1kQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gU2luY2Ugc3RybGVuKCkgcmV0dXJucyBhbiB1
bnNpZ25lZCB2YWx1ZSwgaXQgaXMgcG9pbnRsZXNzIHRvCj4gY29udmVydCBpdCB0byBhIHNpZ25l
ZCBvbmUuIFVzZSBzaXplX3QgdG8gaG9sZCBpdHMgcmV0dXJuIHZhbHVlLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgoKUmV2aWV3
ZWQtYnk6IE1hcmMtQW5kcsOpIEx1cmVhdSA8bWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tPgoK
KGl0IGxvb2tzIGxpa2UgdGhlIHZhcmlhYmxlIGlzIGhpZGluZyBsZW4gZnJvbSBvdXRlciBzY29w
ZSBidHcpCgo+IC0tLQo+ICBnZGJzdHViLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2dkYnN0dWIuYyBiL2dk
YnN0dWIuYwo+IGluZGV4IGJjNzc0YWU5OTIuLjc2ZWNhM2JiN2UgMTAwNjQ0Cj4gLS0tIGEvZ2Ri
c3R1Yi5jCj4gKysrIGIvZ2Ric3R1Yi5jCj4gQEAgLTE2OTMsNyArMTY5Myw3IEBAIHN0YXRpYyBp
bnQgZ2RiX2hhbmRsZV9wYWNrZXQoR0RCU3RhdGUgKnMsIGNvbnN0IGNoYXIgKmxpbmVfYnVmKQo+
ICAgICAgICAgIH0KPiAgI2Vsc2UgLyogIUNPTkZJR19VU0VSX09OTFkgKi8KPiAgICAgICAgICBl
bHNlIGlmIChzdHJuY21wKHAsICJSY21kLCIsIDUpID09IDApIHsKPiAtICAgICAgICAgICAgaW50
IGxlbiA9IHN0cmxlbihwICsgNSk7Cj4gKyAgICAgICAgICAgIHNpemVfdCBsZW4gPSBzdHJsZW4o
cCArIDUpOwo+Cj4gICAgICAgICAgICAgIGlmICgobGVuICUgMikgIT0gMCkgewo+ICAgICAgICAg
ICAgICAgICAgcHV0X3BhY2tldChzLCAiRTAxIik7Cj4gLS0KPiAyLjIwLjEKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
