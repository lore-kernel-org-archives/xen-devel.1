From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/3] drm/xen-front: Use Xen common shared
 buffer implementation
Date: Fri, 23 Nov 2018 09:24:59 +0100
Message-ID: <0e9bde68-3f4c-7471-1d8d-89b145e65b54__22544.1679744565$1542961423$gmane$org@suse.com>
References: <20181122100230.14976-1-andr2000@gmail.com>
 <20181122100230.14976-2-andr2000@gmail.com>
 <20181122143354.GG4266@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=h732=oc=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gQ6lq-0003RB-Ht
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 08:25:02 +0000
In-Reply-To: <20181122143354.GG4266@phenom.ffwll.local>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org, boris.ostrovsky@oracle.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMTEvMjAxOCAxNTozMywgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBUaHUsIE5vdiAy
MiwgMjAxOCBhdCAxMjowMjoyOVBNICswMjAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90
ZToKPj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hl
bmtvQGVwYW0uY29tPgo+Pgo+PiBVc2UgcGFnZSBkaXJlY3RvcnkgYmFzZWQgc2hhcmVkIGJ1ZmZl
ciBpbXBsZW1lbnRhdGlvbgo+PiBub3cgYXZhaWxhYmxlIGFzIGNvbW1vbiBjb2RlIGZvciBYZW4g
ZnJvbnRlbmQgZHJpdmVycy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+PiAtLS0KPj4gIGRyaXZl
cnMvZ3B1L2RybS94ZW4vS2NvbmZpZyAgICAgICAgICAgICAgIHwgICAxICsKPj4gIGRyaXZlcnMv
Z3B1L2RybS94ZW4vTWFrZWZpbGUgICAgICAgICAgICAgIHwgICAxIC0KPj4gIGRyaXZlcnMvZ3B1
L2RybS94ZW4veGVuX2RybV9mcm9udC5jICAgICAgIHwgIDYwICsrLS0KPj4gIGRyaXZlcnMvZ3B1
L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0uYyAgIHwgICAxIC0KPj4gIGRyaXZlcnMvZ3B1L2Ry
bS94ZW4veGVuX2RybV9mcm9udF9zaGJ1Zi5jIHwgNDE0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
Pj4gIGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9zaGJ1Zi5oIHwgIDY0IC0tLS0K
Pj4gIDYgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgNTExIGRlbGV0aW9ucygtKQo+
PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9z
aGJ1Zi5jCj4+ICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJt
X2Zyb250X3NoYnVmLmgKPiBBbnl3YXksIEknbSBhbGwgZm9yIGNvZGUgZHVwbGljYXRpb24gcmVt
b3ZhbCwgc28gaWYgdGhlIFhlbiBmb2xrcyBhcmUKPiBoYXBweSB3aXRoIHBhdGNoIDEsIHRoaXMg
b25lIGhlcmUgaGFzIG15IGFjay4gTWlnaHQgYWxzbyBiZSBiZXN0IHRvIG1lcmdlCj4gYWxsIHRo
cmVlIHRocm91Z2ggdGhlIFhlbiB0cmVlLiBGYWxsYmFjayB3b3VsZCBiZSB4ZW4gZm9sa3Mgc2Vu
ZGluZyBhCj4gdG9waWMgcHVsbCByZXF1ZXN0IHdpdGggdGhlc2UgMyBwYXRjaGVzIHRvIGRybS1t
aXNjIGFuZCB0YWthc2hpJ3Mgc291bmQKPiB0cmVlLgoKSSdtIGZpbmUgd2l0aCB0YWtpbmcgaXQg
dGhyb3VnaCB0aGUgWGVuIHRyZWUuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
