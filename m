From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 19/25] s390/ebcdic: Use size_t to iterate
 over arrays
Date: Wed, 20 Feb 2019 12:37:12 +0100
Message-ID: <6c470f3f-3678-8d79-e092-02bfe20dc84d__15470.9295531333$1550662756$gmane$org@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-20-philmd@redhat.com>
 <20190220104051.72f1aca0.cohuck@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwQCf-0008FU-D5
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 11:38:17 +0000
Received: by mail-wm1-f65.google.com with SMTP id z84so6084333wmg.4
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 03:38:16 -0800 (PST)
In-Reply-To: <20190220104051.72f1aca0.cohuck@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Cornelia Huck <cohuck@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Prasad J Pandit <pjp@fedoraproject.org>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yMC8xOSAxMDo0MCBBTSwgQ29ybmVsaWEgSHVjayB3cm90ZToKPiBPbiBXZWQsIDIwIEZl
YiAyMDE5IDAyOjAyOjI2ICswMTAwCj4gUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBy
ZWRoYXQuY29tPiB3cm90ZToKPiAKPj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1E
YXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgo+PiAtLS0KPj4gIGluY2x1ZGUvaHcvczM5MHgvZWJj
ZGljLmggfCA4ICsrKystLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9zMzkweC9lYmNkaWMu
aCBiL2luY2x1ZGUvaHcvczM5MHgvZWJjZGljLmgKPj4gaW5kZXggNjlhMDRjYWI2Mi4uZDg5MTc0
ZTExMyAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9ody9zMzkweC9lYmNkaWMuaAo+PiArKysgYi9p
bmNsdWRlL2h3L3MzOTB4L2ViY2RpYy5oCj4+IEBAIC04MywxOCArODMsMTggQEAgc3RhdGljIGNv
bnN0IHVpbnQ4X3QgYXNjaWkyZWJjZGljW10gPSB7Cj4+ICAgICAgMHg5MCwgMHgzRiwgMHgzRiwg
MHgzRiwgMHgzRiwgMHhFQSwgMHgzRiwgMHhGRgo+PiAgfTsKPj4gIAo+PiAtc3RhdGljIGlubGlu
ZSB2b2lkIGViY2RpY19wdXQodWludDhfdCAqcCwgY29uc3QgY2hhciAqYXNjaWksIGludCBsZW4p
Cj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgZWJjZGljX3B1dCh1aW50OF90ICpwLCBjb25zdCBjaGFy
ICphc2NpaSwgc2l6ZV90IGxlbikKPj4gIHsKPj4gLSAgICBpbnQgaTsKPj4gKyAgICBzaXplX3Qg
aTsKPj4gIAo+PiAgICAgIGZvciAoaSA9IDA7IGkgPCBsZW47IGkrKykgewo+PiAgICAgICAgICBw
W2ldID0gYXNjaWkyZWJjZGljWyh1aW50OF90KWFzY2lpW2ldXTsKPj4gICAgICB9Cj4+ICB9Cj4+
ICAKPj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBhc2NpaV9wdXQodWludDhfdCAqcCwgY29uc3QgY2hh
ciAqZWJjZGljLCBpbnQgbGVuKQo+PiArc3RhdGljIGlubGluZSB2b2lkIGFzY2lpX3B1dCh1aW50
OF90ICpwLCBjb25zdCBjaGFyICplYmNkaWMsIHNpemVfdCBsZW4pCj4+ICB7Cj4+IC0gICAgaW50
IGk7Cj4+ICsgICAgc2l6ZV90IGk7Cj4+ICAKPj4gICAgICBmb3IgKGkgPSAwOyBpIDwgbGVuOyBp
KyspIHsKPj4gICAgICAgICAgcFtpXSA9IGViY2RpYzJhc2NpaVsodWludDhfdCllYmNkaWNbaV1d
Owo+IAo+IE1ha2luZyB0aGUgcGFzc2VkIGxlbiBwYXJhbWV0ZXIgYSBzaXplX3QgbWFrZXMgc2Vu
c2U7IGJ1dCB1c2luZyBhCj4gc2l6ZV90IGFzIGFuIGFycmF5IGl0ZXJhdG9yIGxvb2tzIGEgYml0
IHVuaWRpb21hdGljLi4uIGl0J3Mgbm90IHdyb25nLAo+IHRob3VnaC4KClRoaXMgaXMgdG8gc2ls
ZW50IHRoZSAiLVdzaWduLWNvbnZlcnNpb24gLVdzaWduLWNvbXBhcmUiIHdhcm5pbmdzLi4uCkkg
YW0gc3RpbGwgbm90IHN1cmUgd2hhdCBpcyB0aGUgYmVzdCB0byBkby4KCj4gQWNrZWQtYnk6IENv
cm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgoKVGhhbmtzIQoKUGhpbC4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
