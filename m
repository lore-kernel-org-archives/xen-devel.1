From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v3 06/25] gdbstub: Use size_t to hold
 GDBState::last_packet_len
Date: Wed, 20 Feb 2019 11:59:16 +0100
Message-ID: <CAMxuvawqVgk6PP2wUZLbD9NyCktJDSoeLdduPQCysaEvwgDd_g@mail.gmail.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-7-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wVrY=Q3=redhat.com=mlureau@srs-us1.protection.inumbo.net>)
 id 1gwPb7-0003ic-IT
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 10:59:29 +0000
Received: by mail-qk1-f196.google.com with SMTP id i5so1657717qkd.13
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 02:59:28 -0800 (PST)
In-Reply-To: <20190220010232.18731-7-philmd@redhat.com>
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
cGhpbG1kQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gSW4gcHV0X3BhY2tldF9iaW5hcnkoKSB3ZSBo
YXZlOgo+Cj4gICAgIHVpbnQ4X3QgKnA7Cj4gICAgIGZvcig7Oykgewo+ICAgICAgICAgcCA9IHMt
Pmxhc3RfcGFja2V0Owo+ICAgICAgICAgKihwKyspID0gLi4uCj4gICAgICAgICBzLT5sYXN0X3Bh
Y2tldF9sZW4gPSBwIC0gcy0+bGFzdF9wYWNrZXQ7Cj4gICAgICAgICBwdXRfYnVmZmVyKHMsICh1
aW50OF90ICopcy0+bGFzdF9wYWNrZXQsIHMtPmxhc3RfcGFja2V0X2xlbik7Cj4KPiBUaGUgJ3An
IHBvaW50ZXIgc3RhcnQgYXQgcy0+bGFzdF9wYWNrZXQsIHRoZW4gaXMgb25seSBpbmNyZW1lbnRl
ZC4KPiBTaW5jZSB3ZSBoYXZlICJwID49IHMtPmxhc3RfcGFja2V0Iiwgd2UgYXJlIHN1cmUgdGhh
bgo+ICJwIC0gcy0+bGFzdF9wYWNrZXQgPj0gMCIsIHRodXMgInAgLSBzLT5sYXN0X3BhY2tldCIg
aXMgcG9zaXRpdmUuCj4KPiBUaGUgZmV3IG90aGVyIHBsYWNlcyB3aGVyZSBzLT5sYXN0X3BhY2tl
dF9sZW4gaXMgc2V0IGlzIHdpdGggY29uc3RhbnQKPiBwb3NpdGl2ZSB2YWx1ZXMuCj4KPiBJdCBt
YWtlcyBzZW5zZSB0byB1c2Ugc2l6ZV90IHRvIGhvbGQgbGFzdF9wYWNrZXRfbGVuIHZhbHVlcy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0
LmNvbT4KClJldmlld2VkLWJ5OiBNYXJjLUFuZHLDqSBMdXJlYXUgPG1hcmNhbmRyZS5sdXJlYXVA
cmVkaGF0LmNvbT4KCj4gLS0tCj4gIGdkYnN0dWIuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZ2Ric3R1Yi5j
IGIvZ2Ric3R1Yi5jCj4gaW5kZXggNzZlY2EzYmI3ZS4uNjkzNDBkN2NkMSAxMDA2NDQKPiAtLS0g
YS9nZGJzdHViLmMKPiArKysgYi9nZGJzdHViLmMKPiBAQCAtMzIzLDcgKzMyMyw3IEBAIHR5cGVk
ZWYgc3RydWN0IEdEQlN0YXRlIHsKPiAgICAgIGludCBsaW5lX3N1bTsgLyogcnVubmluZyBjaGVj
a3N1bSAqLwo+ICAgICAgaW50IGxpbmVfY3N1bTsgLyogY2hlY2tzdW0gYXQgdGhlIGVuZCBvZiB0
aGUgcGFja2V0ICovCj4gICAgICB1aW50OF90IGxhc3RfcGFja2V0W01BWF9QQUNLRVRfTEVOR1RI
ICsgNF07Cj4gLSAgICBpbnQgbGFzdF9wYWNrZXRfbGVuOwo+ICsgICAgc2l6ZV90IGxhc3RfcGFj
a2V0X2xlbjsKPiAgICAgIGludCBzaWduYWw7Cj4gICNpZmRlZiBDT05GSUdfVVNFUl9PTkxZCj4g
ICAgICBpbnQgZmQ7Cj4gLS0KPiAyLjIwLjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
