From: Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] configure: Don't add Xen's
 libs to LDFLAGS
Date: Thu, 24 Jan 2019 09:45:17 +0100
Message-ID: <87fttijvfm.fsf@dusky.pond.sub.org>
References: <20190121144841.24467-1-anthony.perard@citrix.com>
 <CAFEAcA_ytAb-K-HB3wL5baMBDkY71ksBK8hsUSFxuUeqVDFyHQ@mail.gmail.com>
 <804f8429-d3f6-dc1a-4980-fc5a44a6b3c5@msgid.tls.msk.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kxai=QA=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1gmadX-0006Su-As
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 08:45:23 +0000
In-Reply-To: <804f8429-d3f6-dc1a-4980-fc5a44a6b3c5@msgid.tls.msk.ru> (Michael
 Tokarev's message of "Tue, 22 Jan 2019 08:40:32 +0300")
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>, Paul Durrant <paul.durrant@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

TWljaGFlbCBUb2thcmV2IDxtanRAdGxzLm1zay5ydT4gd3JpdGVzOgoKPiAyMS4wMS4yMDE5IDE4
OjE3LCBQZXRlciBNYXlkZWxsIHdyb3RlOgo+PiBPbiBNb24sIDIxIEphbiAyMDE5IGF0IDE0OjQ5
LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pgo+
Pj4gV2hlbiBYZW4gaXMgZGV0ZWN0ZWQgdmlhIHBrZy1jb25maWcsIGl0IGlzbid0IG5lY2Vzc2Fy
eSB0byBtb2RpZnkKPj4+IExERkxBR1MgYXMgbW9kaWZ5aW5nIGxpYnNfc29mdG1tdSBpcyBlbm91
Z2guCj4+Pgo+Pj4gUmVwb3J0ZWQtYnk6IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGlu
YXJvLm9yZz4KPj4+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFy
ZEBjaXRyaXguY29tPgo+Pj4gLS0tCj4+PiAgIGNvbmZpZ3VyZSB8IDEgLQo+Pj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9jb25maWd1cmUgYi9j
b25maWd1cmUKPj4+IGluZGV4IDEyZmQzNGYzMGIuLjk4YjI3MDk3NGQgMTAwNzU1Cj4+PiAtLS0g
YS9jb25maWd1cmUKPj4+ICsrKyBiL2NvbmZpZ3VyZQo+Pj4gQEAgLTIzNTUsNyArMjM1NSw2IEBA
IGlmIHRlc3QgIiR4ZW4iICE9ICJubyIgOyB0aGVuCj4+PiAgICAgICBmaQo+Pj4gICAgICAgUUVN
VV9DRkxBR1M9IiRRRU1VX0NGTEFHUyAkKCRwa2dfY29uZmlnIC0tY2ZsYWdzICR4ZW5fcGMpIgo+
Pj4gICAgICAgbGlic19zb2Z0bW11PSIkKCRwa2dfY29uZmlnIC0tbGlicyAkeGVuX3BjKSAkbGli
c19zb2Z0bW11Igo+Pj4gLSAgICBMREZMQUdTPSIkKCRwa2dfY29uZmlnIC0tbGlicyAkeGVuX3Bj
KSAkTERGTEFHUyIKPj4+ICAgICBlbHNlCj4+Pgo+Pj4gICAgICAgeGVuX2xpYnM9Ii1seGVuc3Rv
cmUgLWx4ZW5jdHJsIC1seGVuZ3Vlc3QiCj4+PiAtLQo+Pj4gQW50aG9ueSBQRVJBUkQKPj4KPj4g
UmV2aWV3ZWQtYnk6IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4KPj4K
Pj4gQ2MnaW5nIE1KVCwgd2hvIGZpcnN0IHBvaW50ZWQgb3V0IHRvIG1lIHRoYXQgdGhpcyBidWcK
Pj4gd2FzIHJlc3VsdGluZyBpbiB2YXJpb3VzIGJpbmFyaWVzIGxpa2UgdGhlIGxpbnV4LXVzZXIg
b25lcwo+PiBnZXR0aW5nIGxpbmtlZCBhZ2FpbnN0IHRoZSBYZW4gbGlicyB1bm5lY2Vzc2FyaWx5
Lgo+Cj4gV2VsbCwgYXQgdGhhdCB0aW1lIEkgY29uZmlybWVkIHRoZSBwYXRjaCBmaXhlcyB0aGlz
IGlzc3VlLCBhbmQgdGhpcwo+IGlzIHRoZSBzYW1lIGNoYW5nZSBJIGNvbWUgYWNyb3NzIHRvbywg
YW5kIGl0IGlzIGFscmVhZHkgdXNlZCBvbiBEZWJpYW4uCj4gU28KPgo+IFNpZ25lZC1vZmYtYnk6
IE1pY2hhZWwgVG9rYXJldiA8bWp0QHRscy5tc2sucnU+Cj4gUmV2aWV2ZWQtYnk6IE1pY2hhZWwg
VG9rYXJldiA8bWp0QHRscy5tc2sucnU+CgpUeXBvIGluIFJldmlld2VkLWJ5LgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
