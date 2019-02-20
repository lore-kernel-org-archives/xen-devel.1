From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 00/25] chardev: Convert
 qemu_chr_write() to take a size_t argument
Date: Wed, 20 Feb 2019 11:30:16 +0000
Message-ID: <20190220113016.GD21870@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <CAMxuvazRLabuNiGdKb9HSxyqJ+9NhxJkqkv824BTFj95j5u9rA@mail.gmail.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fEqt=Q3=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1gwQ5s-0007of-8M
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 11:31:16 +0000
Content-Disposition: inline
In-Reply-To: <CAMxuvazRLabuNiGdKb9HSxyqJ+9NhxJkqkv824BTFj95j5u9rA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Zhang Chen <zhangckid@gmail.com>, qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Samuel Thibault <samuel.thibault@ens-lyon.org>, David Gibson <david@gibson.dropbear.id.au>, Prasad J Pandit <pjp@fedoraproject.org>, Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>Stef
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMTE6NTM6NDJBTSArMDEwMCwgTWFyYy1BbmRyw6kgTHVy
ZWF1IHdyb3RlOgo+IEhpCj4gCj4gT24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMjowMiBBTSBQaGls
aXBwZSBNYXRoaWV1LURhdWTDqQo+IDxwaGlsbWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4g
SGksCj4gPgo+ID4gVGhpcyBzZXJpZXMgY29udmVydCB0aGUgY2hhcmRldjo6cWVtdV9jaHJfd3Jp
dGUoKSB0byB0YWtlIHVuc2lnbmVkCj4gPiBsZW5ndGggYXJndW1lbnQuIFRvIGRvIHNvIEkgd2Vu
dCB0aHJvdWdoIGFsbCBjYWxsZXIgYW5kIGNoZWNrZWQgaWYKPiA+IHRoZXJlIGFyZSBubyBuZWdh
dGl2ZSB2YWx1ZSBwb3NzaWJsZS4KPiAKPiAKPiBDaGFuZ2luZyBzaWduZWRuZXNzIGlzIHByb2Js
ZW1hdGljIGFuZCBjYW4gZWFzaWx5IGludHJvZHVjZSBidWdzIHRoYXQKPiBhcmUgZWFzeSB0byBt
aXNzIGR1cmluZyByZXZpZXcuCj4gCj4gSSBhZ3JlZSB3aXRoIENvcm5lbGlhIGFib3V0IGlkaW9t
YXRpYyB1c2Ugb2YgaW50LiBDaGFuZ2luZyAiaW50IiBmb3IKPiAic2l6ZV90IiBpc24ndCBzeXN0
ZW1hdGljYWxseSBhIGNsZWFyIHdpbi4KPiAKPiBFdmVuIEdvb2dsZSBDKysgc3R5bGUgcmVjb21t
ZW5kcyB0byBhdm9pZCB1bnNpZ25lZCB0eXBlcyAiKGV4Y2VwdCBmb3IKPiByZXByZXNlbnRpbmcg
Yml0ZmllbGRzIG9yIG1vZHVsYXIgYXJpdGhtZXRpYykuIERvIG5vdCB1c2UgYW4gdW5zaWduZWQK
PiB0eXBlIG1lcmVseSB0byBhc3NlcnQgdGhhdCBhIHZhcmlhYmxlIGlzIG5vbi1uZWdhdGl2ZS4i
Cj4gaHR0cHM6Ly9nb29nbGUuZ2l0aHViLmlvL3N0eWxlZ3VpZGUvY3BwZ3VpZGUuaHRtbCNJbnRl
Z2VyX1R5cGVzIC0gc2VlIHJhdGlvbmFsZQo+IAo+IFNpbmNlIFBhb2xvIHlvdSBzdWdnZXN0ZWQg
dGhlIGNoYW5nZSwgY291bGQgeW91IGdpdmUgc29tZSBjb252aW5jaW5nCj4gYXJndW1lbnRzIHRo
YXQgaXQncyB3b3J0aCB0YWtpbmcgdGhlIHBsdW5nZT8KClRoZSBjaGFyZGV2IHdyaXRlL3JlYWQg
bWV0aG9kcyB3aWxsIGVuZCB1cCBjYWxsaW5nIGxpYmMgcmVhZC93cml0ZQptZXRob2RzLCB3aG9z
ZSBwYXJhbWV0ZXJzIGFyZSAic2l6ZV90IGNvdW50Ii4KClRodXMgaWYgdGhlcmUgaXMgUUVNVSBj
b2RlIHRoYXQgY291bGQgY3VycmVudGx5IChtaXN0YWtlbmx5KSBwYXNzIGEKbmVnYXRpdmUgdmFs
dWUgZm9yIGxlbmd0aCB0byBxZW11X2Nocl93cml0ZSwgdW5sZXNzIHNvbWV0aGluZyBzdG9wcwpp
dCwgdGhpcyBpcyBnb2luZyB0byBiZSBjYXN0IHRvIGEgc2l6ZV90IHdoZW4gd2UgZmluYWxseSBj
YWxsIHJlYWQvCndyaXRlIG9uIHRoZSBGRCwgbGVhZGluZyB0byBhIGxhcmdlIHBvc2l0aXZlIHZh
bHVlICYgYXJyYXkgb3V0IG9mCmJvdW5kcyByZWFkL3dyaXRlLiAKCklPVyB3ZSBhbHJlYWR5IGhh
dmUgaW5jb25zaXN0ZW50IHVzZSBvZiBzaWduZWQgdnMgdW5zaWduZWQgaW4gb3VyIGNvZGUKd2hp
Y2ggaGFzIHBvdGVudGlhbCB0byBjYXVzZSBidWdzLiBDb252ZXJ0aW5nIGNoYXJkZXYgdG8gdXNl
IHNpemVfdAp3ZSBnZXQgcmlkIGZvIHRoZSBtaXNtYXRjaCB3aXRoIHRoZSB1bmRlcmx5aW5nIGxp
YmMgQVBJcyB3ZSBjYWxsLAp3aGljaCB1bHRpbWF0ZWx5IGVsaW1pbmF0ZXMgYW4gYXJlYSBvZiBy
aXNrIGxvbmdlciB0ZXJtLiBUaGVyZSBpcyBhCmNoYW5jZSBpdCBjb3VsZCB1bmNvdmVyIHNvbWUg
cHJlLWV4aXN0aW5nIGRvcm1hbnQgYnVncywgYnV0IHByb3ZpZGVkCndlIGRvIGR1ZSBkaWxpZ2Vu
Y2UgdG8gY2hlY2sgY2FsbGVycyBJIHRoaW5rIGl0cyBhIHdpbiB0byBiZSBjb25zaXN0ZW50Cndp
dGggbGliYyBBUElzIGluIHNpemVfdCB1c2FnZSBmb3IgcmVhZC93cml0ZS4KClJlZ2FyZHMsCkRh
bmllbAotLSAKfDogaHR0cHM6Ly9iZXJyYW5nZS5jb20gICAgICAtby0gICAgaHR0cHM6Ly93d3cu
ZmxpY2tyLmNvbS9waG90b3MvZGJlcnJhbmdlIDp8Cnw6IGh0dHBzOi8vbGlidmlydC5vcmcgICAg
ICAgICAtby0gICAgICAgICAgICBodHRwczovL2ZzdG9wMTM4LmJlcnJhbmdlLmNvbSA6fAp8OiBo
dHRwczovL2VudGFuZ2xlLXBob3RvLm9yZyAgICAtby0gICAgaHR0cHM6Ly93d3cuaW5zdGFncmFt
LmNvbS9kYmVycmFuZ2UgOnwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
