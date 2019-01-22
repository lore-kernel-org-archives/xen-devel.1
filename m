From: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH] configure: Don't add Xen's libs to LDFLAGS
Date: Tue, 22 Jan 2019 08:40:32 +0300
Message-ID: <804f8429-d3f6-dc1a-4980-fc5a44a6b3c5__48436.4506251708$1548135725$gmane$org@msgid.tls.msk.ru>
References: <20190121144841.24467-1-anthony.perard@citrix.com>
 <CAFEAcA_ytAb-K-HB3wL5baMBDkY71ksBK8hsUSFxuUeqVDFyHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7mDg=P6=tls.msk.ru=mjt@srs-us1.protection.inumbo.net>)
 id 1glone-0001yf-OT
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 05:40:38 +0000
In-Reply-To: <CAFEAcA_ytAb-K-HB3wL5baMBDkY71ksBK8hsUSFxuUeqVDFyHQ@mail.gmail.com>
Content-Language: ru-RU
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peter Maydell <peter.maydell@linaro.org>, Anthony PERARD <anthony.perard@citrix.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

MjEuMDEuMjAxOSAxODoxNywgUGV0ZXIgTWF5ZGVsbCB3cm90ZToKPiBPbiBNb24sIDIxIEphbiAy
MDE5IGF0IDE0OjQ5LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+Cj4+IFdoZW4gWGVuIGlzIGRldGVjdGVkIHZpYSBwa2ctY29uZmlnLCBpdCBpc24n
dCBuZWNlc3NhcnkgdG8gbW9kaWZ5Cj4+IExERkxBR1MgYXMgbW9kaWZ5aW5nIGxpYnNfc29mdG1t
dSBpcyBlbm91Z2guCj4+Cj4+IFJlcG9ydGVkLWJ5OiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlk
ZWxsQGxpbmFyby5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPgo+PiAtLS0KPj4gICBjb25maWd1cmUgfCAxIC0KPj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIv
Y29uZmlndXJlCj4+IGluZGV4IDEyZmQzNGYzMGIuLjk4YjI3MDk3NGQgMTAwNzU1Cj4+IC0tLSBh
L2NvbmZpZ3VyZQo+PiArKysgYi9jb25maWd1cmUKPj4gQEAgLTIzNTUsNyArMjM1NSw2IEBAIGlm
IHRlc3QgIiR4ZW4iICE9ICJubyIgOyB0aGVuCj4+ICAgICAgIGZpCj4+ICAgICAgIFFFTVVfQ0ZM
QUdTPSIkUUVNVV9DRkxBR1MgJCgkcGtnX2NvbmZpZyAtLWNmbGFncyAkeGVuX3BjKSIKPj4gICAg
ICAgbGlic19zb2Z0bW11PSIkKCRwa2dfY29uZmlnIC0tbGlicyAkeGVuX3BjKSAkbGlic19zb2Z0
bW11Igo+PiAtICAgIExERkxBR1M9IiQoJHBrZ19jb25maWcgLS1saWJzICR4ZW5fcGMpICRMREZM
QUdTIgo+PiAgICAgZWxzZQo+Pgo+PiAgICAgICB4ZW5fbGlicz0iLWx4ZW5zdG9yZSAtbHhlbmN0
cmwgLWx4ZW5ndWVzdCIKPj4gLS0KPj4gQW50aG9ueSBQRVJBUkQKPiAKPiBSZXZpZXdlZC1ieTog
UGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPgo+IAo+IENjJ2luZyBNSlQs
IHdobyBmaXJzdCBwb2ludGVkIG91dCB0byBtZSB0aGF0IHRoaXMgYnVnCj4gd2FzIHJlc3VsdGlu
ZyBpbiB2YXJpb3VzIGJpbmFyaWVzIGxpa2UgdGhlIGxpbnV4LXVzZXIgb25lcwo+IGdldHRpbmcg
bGlua2VkIGFnYWluc3QgdGhlIFhlbiBsaWJzIHVubmVjZXNzYXJpbHkuCgpXZWxsLCBhdCB0aGF0
IHRpbWUgSSBjb25maXJtZWQgdGhlIHBhdGNoIGZpeGVzIHRoaXMgaXNzdWUsIGFuZCB0aGlzCmlz
IHRoZSBzYW1lIGNoYW5nZSBJIGNvbWUgYWNyb3NzIHRvbywgYW5kIGl0IGlzIGFscmVhZHkgdXNl
ZCBvbiBEZWJpYW4uClNvCgpTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFRva2FyZXYgPG1qdEB0bHMu
bXNrLnJ1PgpSZXZpZXZlZC1ieTogTWljaGFlbCBUb2thcmV2IDxtanRAdGxzLm1zay5ydT4KClRo
YW5rcywKCi9tanQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
