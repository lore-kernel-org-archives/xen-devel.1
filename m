From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC 13/16] gic-vgic: skip irqs locking
Date: Wed, 12 Dec 2018 12:44:00 +0000
Message-ID: <cb757f8c-efa4-1a99-7da8-83c89f6a5da1@arm.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-14-git-send-email-andrii.anisov@gmail.com>
 <445b8bb4-78fb-124a-647b-8e8d253b7ba1@arm.com>
 <1a3c781d-e514-2463-5319-6b3293bf2e92@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH0D=OV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gX3rv-0003OE-KW
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 12:44:03 +0000
In-Reply-To: <1a3c781d-e514-2463-5319-6b3293bf2e92@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmlpLAoKT24gMTIvMTIvMjAxOCAxMjozNSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiAK
PiAKPiBPbiAxMi4xMi4xOCAxNDowNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBUaGlzIGNodW5r
IHJlbGllcyBvbiBwYXRjaCAjMSwgYW0gSSBjb3JyZWN0Pwo+IEZvciBzdXJlLCBpdCBpcy4KPiAK
Pj4gwqBJZiBzbywgdGhpcyBzaG91bGQgYmUgd3JpdHRlbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ug
dGhhdCB0aGlzIHdhcyBpbnRyb2R1Y2VkIAo+PiByZWNlbnRseS4KPj4gwqBUaGlzIGhlbHBzIHRv
IGZpZ3VyZSBvdXQgd2hldGhlciB0aGUgcGF0Y2ggY2FuIGJlIG1lcmdlZCBiZWZvcmUgdGhlIHJl
c3QuCj4gRG8geW91IG1lYW4gSSBjYW4gcHJlcGFyZSBpdCBmb3IgNC4xMiB0b2dldGhlciB3aXRo
ICMxPwoKQXQgdGhlIG1vbWVudCwgSSBhbSBoYXBweSB3aXRoIHRoZSBzZWNvbmQgY2h1bmsgb2Yg
dGhpcyBwYXRjaCB0byBnby4gSSBhbSBzdGlsbCAKdW5jb252aW5jZWQgIzEgaXMgdGhlIHJpZ2h0
IHRoaW5nIHRvIGdvLgoKPiAKPiBJIHBsYW4gdG8gc2VuZCBzZXBhcmF0ZWx5IHBhdGNoZXMgeW91
IGhhdmUgcmV2aWV3ZWQgZmlyc3QuIFRoZW4gZXZhbHVhdGUgdGhlIAo+IHJlc3Qgd2l0aCBUQk0u
IERvZXMgaXQgZml0IHlvdXIgdmlzaW9uPwpDYW4geW91IHNlbmQgc2VwYXJhdGVseSBwYXRjaGVz
IEkgc2FpZCBJIGFtIGhhcHB5IHdpdGggZm9yIFhlbiA0LjEyPyBXZSBjYW4gdGhlbiAKY29udGlu
dWUgdG8gZGlzY3VzcyB0aGUgb3RoZXJzIHdpdGggbnVtYmVycyBhbmQgc2VlIGlmIHdlIGNhbiBt
ZXJnZSB0aGVtIGluIHRpbWUuCgpDaGVlcnMsCgoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
