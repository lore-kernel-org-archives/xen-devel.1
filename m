From: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 08/30] hw/i386: use the BYTE-based
	definitions
Date: Mon, 5 Mar 2018 13:29:15 +0100
Message-ID: <20180305132915.4dacc461__5650.63712788305$1520252932$gmane$org@redhat.com>
References: <20180215042900.16078-1-f4bug@amsat.org>
 <20180215042900.16078-9-f4bug@amsat.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=eynj=f3=redhat.com=imammedo@srs-us1.protection.inumbo.net>)
 id 1espFF-0002aO-Ht
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 12:29:33 +0000
In-Reply-To: <20180215042900.16078-9-f4bug@amsat.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Anthony Perard <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxNSBGZWIgMjAxOCAwMToyODozOCAtMDMwMApQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8ZjRidWdAYW1zYXQub3JnPiB3cm90ZToKCj4gSXQgZWFzZSBjb2RlIHJldmlldywgdW5pdCBp
cyBleHBsaWNpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8
ZjRidWdAYW1zYXQub3JnPgo+IC0tLQpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEvaHcvaTM4Ni9hY3Bp
LWJ1aWxkLmMgYi9ody9pMzg2L2FjcGktYnVpbGQuYwo+IGluZGV4IGRlYjQ0MGYyODYuLjljY2M2
MTkyYjUgMTAwNjQ0Cj4gLS0tIGEvaHcvaTM4Ni9hY3BpLWJ1aWxkLmMKPiArKysgYi9ody9pMzg2
L2FjcGktYnVpbGQuYwo+IEBAIC0yMzIwLDggKzIzMjAsOCBAQCBidWlsZF90cG0yKEdBcnJheSAq
dGFibGVfZGF0YSwgQklPU0xpbmtlciAqbGlua2VyLCBHQXJyYXkgKnRjcGFsb2cpCj4gICAgICAg
ICAgICAgICAgICAgKHZvaWQgKil0cG0yX3B0ciwgIlRQTTIiLCBzaXplb2YoKnRwbTJfcHRyKSwg
NCwgTlVMTCwgTlVMTCk7Cj4gIH0KPiAgCj4gLSNkZWZpbmUgSE9MRV82NDBLX1NUQVJUICAoNjQw
ICogMTAyNCkKPiAtI2RlZmluZSBIT0xFXzY0MEtfRU5EICAgKDEwMjQgKiAxMDI0KQo+ICsjZGVm
aW5lIEhPTEVfNjQwS19TVEFSVCAgKDY0MCAqIEtfQllURSkKPiArI2RlZmluZSBIT0xFXzY0MEtf
RU5EICAgKDEwMjQgKiBLX0JZVEUpCm5pdDoKY291bGQgYmUgMSAqIE1fQllURQoKWy4uLl0KClJl
dmlld2VkLWJ5OiBJZ29yIE1hbW1lZG92IDxpbWFtbWVkb0ByZWRoYXQuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
