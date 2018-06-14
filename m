From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: Re: [Qemu-devel] [PATCH] compiler: add a sizeof_field()
 macro
Date: Thu, 14 Jun 2018 17:33:04 -0300
Message-ID: <c5c1f362-d51d-df1e-c1dd-f57b64c3f1a1@amsat.org>
References: <20180614164431.29305-1-stefanha@redhat.com>
 <5768e8f3-eae5-30ef-888a-5e62692c238d@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ojk3=ja=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1fTYvf-0006jB-LL
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 20:33:11 +0000
Received: by mail-qt0-x243.google.com with SMTP id h5-v6so7098197qtm.13
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jun 2018 13:33:10 -0700 (PDT)
In-Reply-To: <5768e8f3-eae5-30ef-888a-5e62692c238d@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: John Snow <jsnow@redhat.com>
Cc: xen-devel@lists.xenproject.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTQvMjAxOCAwNDoxNyBQTSwgSm9obiBTbm93IHdyb3RlOgo+IE9uIDA2LzE0LzIwMTgg
MTI6NDQgUE0sIFN0ZWZhbiBIYWpub2N6aSB3cm90ZToKPj4gRGV0ZXJtaW5pbmcgdGhlIHNpemUg
b2YgYSBmaWVsZCBpcyB1c2VmdWwgd2hlbiB5b3UgZG9uJ3QgaGF2ZSBhIHN0cnVjdAo+PiB2YXJp
YWJsZSBoYW5keS4gIE9wZW4tY29kaW5nIHRoaXMgaXMgdWdseS4KPj4KPj4gVGhpcyBwYXRjaCBh
ZGRzIHRoZSBzaXplb2ZfZmllbGQoKSBtYWNybywgd2hpY2ggaXMgc2ltaWxhciB0bwo+PiB0eXBl
b2ZfZmllbGQoKS4gIEV4aXN0aW5nIGluc3RhbmNlcyBhcmUgdXBkYXRlZCB0byB1c2UgdGhlIG1h
Y3JvLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhh
dC5jb20+Cj4gCj4gSG93J2QgeW91IGZpbmQgYWxsIHRoZSBleGlzdGluZyBpbnN0YW5jZXM/CgpU
aGlzIHdvcmtzOgoKJCBnaXQgZ3JlcCAtRSAnc2l6ZW9mLiopMCktPicKCj4gCj4gUmV2aWV3ZWQt
Ynk6IEpvaG4gU25vdyA8anNub3dAcmVkaGF0LmNvbT4KPiAKPj4gLS0tCj4+ICBpbmNsdWRlL2h3
L3hlbi9pby9yaW5nLmggICAgICB8ICAyICstCj4+ICBpbmNsdWRlL3FlbXUvY29tcGlsZXIuaCAg
ICAgICB8ICAyICsrCj4+ICBhY2NlbC90Y2cvdHJhbnNsYXRlLWFsbC5jICAgICB8ICAyICstCj4+
ICBody9kaXNwbGF5L3hlbmZiLmMgICAgICAgICAgICB8ICA0ICsrLS0KPj4gIGh3L25ldC9yb2Nr
ZXIvcm9ja2VyX29mX2RwYS5jIHwgIDIgKy0KPj4gIGh3L25ldC92aXJ0aW8tbmV0LmMgICAgICAg
ICAgIHwgIDIgKy0KPj4gIHRhcmdldC9pMzg2L2t2bS5jICAgICAgICAgICAgIHwgIDIgKy0KPj4g
IHRhcmdldC9wcGMvYXJjaF9kdW1wLmMgICAgICAgIHwgMTAgKysrKystLS0tLQo+PiAgdGFyZ2V0
L3MzOTB4L2FyY2hfZHVtcC5jICAgICAgfCAyMCArKysrKysrKysrLS0tLS0tLS0tLQo+PiAgOSBm
aWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
