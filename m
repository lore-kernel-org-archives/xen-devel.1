From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] chardev: Convert IOReadHandler
 to read an unsigned number of bytes
Date: Thu, 11 Oct 2018 17:34:51 +0200
Message-ID: <8d285029-2b6f-a841-2489-c6761e62c02c__7196.00797533548$1539272059$gmane$org@redhat.com>
References: <20181011131413.22208-1-philmd@redhat.com>
 <7762db82-6044-df69-a1b7-c05100a0e938@redhat.com>
 <4b664769-9830-e186-05c4-132a8cfc423b@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zwzl=mx=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gAczg-0007QH-VU
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 15:35:21 +0000
In-Reply-To: <4b664769-9830-e186-05c4-132a8cfc423b@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Prasad J Pandit <ppandit@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>, Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, Markus Armbruster <armbru@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Antony Pavlov <antonynpavlov@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Laurent Vivier <lvivier@redhat.com>C
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMTAvMjAxOCAxNzoyNCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4+IE9u
IHRoZSBvdGhlciBoYW5kLCBmZF9jaHJfcmVhZF9wb2xsIGlzIG5vdCBhbiBJT0NhblJlYWRIYW5k
bGVyLCBhbmQgdGhpcwo+PiBwYXRjaCB0aGVyZWZvcmUgcHJvYmFibHkgZG9lc24ndCBjb21waWxl
Pwo+IEl0IGRvZXMgY29tcGlsZS4KPiAKPiBmZF9jaHJfdXBkYXRlX3JlYWRfaGFuZGxlcigpIHVz
ZXMgZmRfY2hyX3JlYWRfcG9sbCB3aXRoIGlvX2FkZF93YXRjaF9wb2xsKCk6Cj4gCj4gR1NvdXJj
ZSAqaW9fYWRkX3dhdGNoX3BvbGwoQ2hhcmRldiAqY2hyLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIFFJT0NoYW5uZWwgKmlvYywKPiAgICAgICAgICAgICAgICAgICAgICAgICBJT0NhblJlYWRI
YW5kbGVyICpmZF9jYW5fcmVhZCwKPiAgICAgICAgICAgICAgICAgICAgICAgICBRSU9DaGFubmVs
RnVuYyBmZF9yZWFkLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdwb2ludGVyIHVzZXJfZGF0
YSwKPiAgICAgICAgICAgICAgICAgICAgICAgICBHTWFpbkNvbnRleHQgKmNvbnRleHQpOwoKT2gs
IHRoYXQncyBzb21ld2hhdCB3ZWlyZC4gIEl0IGNvdWxkIGp1c3QgYXMgd2VsbCByZXR1cm4gYSBi
b29sLgoKSG93ZXZlciwgdGhpcyBtYWRlIG1lIG5vdGljZSB0aGF0IHlvdSBuZWVkIHRvIGNoYW5n
ZSBlLmcuIHMtPm1heF9zaXplJ3MKZGVjbGFyYXRpb24gKGluIGluY2x1ZGUvY2hhcmRldi9jaGFy
LWZkLmgpIGZyb20gaW50IHRvIHNpemVfdCwgYW5kCmxpa2V3aXNlIGZvcjogMSkgYWxsIHVzZXJz
IG9mIHMtPm1heF9zaXplLCBzdWNoIGFzIGxlbiBpbiBmZF9jaHJfcmVhZDsKMikgYWxsIHRoZSBz
aW1pbGFyIHZhcmlhYmxlcyBpbiBvdGhlciBjaGFyIGJhY2tlbmRzLgoKU28gaXQncyBwcm9iYWJs
eSBiZXN0IHRvIHN0cnVjdHVyZSB0aGUgc2VyaWVzIGFzIGZvbGxvd3M6CgoxKSBjaGFuZ2UgZmRf
Y2FuX3JlYWQgZnJvbSBJT0NhblJlYWRIYW5kbGVyIHRvIGEgR1NvdXJjZUZ1bmMgKHdoaWNoCnJl
dHVybnMgYSBib29sZWFuIHZhbHVlKSwgY2hhbmdpbmcgYWxsICJyZXR1cm4gcy0+Zm9vIiB0byAi
cmV0dXJuIHMtPmZvbwo+IDA7Ii4gIFRoZW4geW91IGNhbiByZW1vdmUgdGhlID4gMCBmcm9tCgog
ICAgYm9vbCBub3dfYWN0aXZlID0gaXdwLT5mZF9jYW5fcmVhZChpd3AtPm9wYXF1ZSkgPiAwOwoK
KEhhdmluZyB0aGUgPiAwIHJlcGVhdGVkIGluIGFsbCBiYWNrZW5kcyBpcyBub3cgYSBiaXQgdWds
eSwgYnV0IHRoZXJlCmFyZSBmdXR1cmUgY2xlYW51cCBvcHBvcnR1bml0aWVzIGhlcmUgdG8gbW92
ZSB0aGUgcWVtdV9jaHJfYmVfY2FuX3dyaXRlCmNhbGwgdG8gcWVtdV9jaHJfYmVfY2FuX3dyaXRl
OyB0aGlzIHdheSBtb3N0IGNoYXJkZXYgYmFja2VuZHMgY2FuIHNraXAKZGVmaW5pbmcgYSByZWFk
X3BvbGwgZnVuY3Rpb24uICBCdXQgSSBkaWdyZXNzKS4KCjIpIGFzc2VydCBpbiBxZW11X2Nocl9i
ZV9jYW5fd3JpdGUgdGhhdCB0aGUgcmV0dXJuZWQgdmFsdWUgaXMgPj0gMAoKMykgZm9yIGVhY2gg
YmFja2VuZCwgY2hhbmdlIHRoZSBhc3NpZ25lZCB2YXJpYWJsZSBmcm9tIGludCB0byBzaXplX3QK
CjQpIG5vdyB0aGUgcmVzdCBvZiB5b3VyIHBhdGNoLCB0b3VjaGluZyBhbGwgZnJvbnQtZW5kcy4g
IFRoZSBhc3NlcnRpb24KZnJvbSAoMikgbm93IGRvZXMgbm90IG1ha2Ugc2Vuc2UgYW55bW9yZSwg
c2luY2UgLT5jYW5fcmVhZCByZXR1cm5zIGFuCnVuc2lnbmVkIHZhbHVlLCBidXQgcGVyaGFwcyB5
b3UgY2FuIGtlZXAgYSAiZmFpbC1zYWZlIiBhc3NlcnRpb24gdGhhdAooc3NpemVfdClyZXR1cm5l
ZF92YWx1ZSA+PSAwIHRvIGNhdGNoIHVuZGVzaXJlZCBvdmVyZmxvd3MuCgpQYW9sbwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
