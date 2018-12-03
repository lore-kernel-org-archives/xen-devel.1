From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V10 4/5] p2m: Always use hostp2m when
 clipping rangesets
Date: Mon, 03 Dec 2018 01:49:34 -0700
Message-ID: <5C04EE1E0200007800202129@prv1-mh.provo.novell.com>
References: <1543442182-3557-1-git-send-email-rcojocaru@bitdefender.com>
 <1543442182-3557-5-git-send-email-rcojocaru@bitdefender.com>
 <5BFFB9C0020000780020119C@prv1-mh.provo.novell.com>
 <5543e709-6dd0-4c88-ad87-5837490ea441@bitdefender.com>
 <5BFFF06B02000078002013BD@prv1-mh.provo.novell.com>
 <b1d92858-ff44-4d2f-a32f-98e5efde9cb2@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gTjvB-00040F-IA
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 08:49:41 +0000
In-Reply-To: <b1d92858-ff44-4d2f-a32f-98e5efde9cb2@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjExLjE4IGF0IDIyOjU5LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMjkvMTggMzo1OCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEFsdHAybS1z
IGRvbid0IG1hdHRlciBoZXJlIGF0IGFsbC4gTXkgcG9pbnQgaXMgdGhhdCB0aGUgcHJlc2VudCwK
Pj4gdW5wYXRjaGVkIHAybV9jaGFuZ2VfdHlwZV9yYW5nZSgpIHVwZGF0ZXMgdGhlIGxvZy1kaXJ0
eQo+PiByYW5nZXMgd2l0aCB0aGUgdW5jbGlwcGVkIFtzdGFydCxlbmQpLCBidXQgY2FsbHMKPj4g
cDJtLT5jaGFuZ2VfZW50cnlfdHlwZV9yYW5nZSgpIHdpdGggYSBwb3NzaWJseSByZWR1Y2VkCj4+
IHJhbmdlLiBBbnkgc3Vic2VxdWVudCBjYWxsZXIgb2YgcDJtX2lzX2xvZ2RpcnR5X3JhbmdlKCkg
bWF5Cj4+IHRodXMgYmUgbWlzbGVhZCBpZiB0aGUgcmFuZ2VzZXQgdXBkYXRlIG5vdyBhbHNvIHVz
ZWQgb25seSB0aGUKPj4gY2xpcHBlZCByYW5nZS4KPiAKPiBJJ3ZlIGJlZW4gcmVhZGluZyBhbmQg
cmUtcmVhZGluZyB0aGUgY29kZSBhbmQgSSdtIHN0aWxsIG5vdCBzdXJlIEkgZm9sbG93Ogo+IAo+
ICA5NzMgICAgIGlmICggdW5saWtlbHkoZW5kID4gcDJtLT5tYXhfbWFwcGVkX3BmbikgKQo+ICA5
NzQgICAgIHsKPiAgOTc1ICAgICAgICAgaWYgKCAhZ2ZuICkKPiAgOTc2ICAgICAgICAgewo+ICA5
NzcgICAgICAgICAgICAgcDJtLT5jaGFuZ2VfZW50cnlfdHlwZV9nbG9iYWwocDJtLCBvdCwgbnQp
Owo+ICA5NzggICAgICAgICAgICAgZ2ZuID0gZW5kOwo+ICA5NzkgICAgICAgICB9Cj4gIDk4MCAg
ICAgICAgIGVuZCA9IHAybS0+bWF4X21hcHBlZF9wZm4gKyAxOwo+IAo+IGVuZCBpcyBiZWluZyBj
bGlwcGVkIGhlcmUgLi4uCj4gCj4gIDk4MSAgICAgfQo+ICA5ODIgICAgIGlmICggZ2ZuIDwgZW5k
ICkKPiAgOTgzICAgICAgICAgcmMgPSBwMm0tPmNoYW5nZV9lbnRyeV90eXBlX3JhbmdlKHAybSwg
b3QsIG50LCBnZm4sIGVuZCAtIDEpOwo+IAo+IC4uLiBhbmQgdGhlIGlmKCkgYWJvdmUgaXMgbm90
IGFuIGVsc2UgaWYoKSwgc28gaWYgKCB1bmxpa2VseShlbmQgPgo+IHAybS0+bWF4X21hcHBlZF9w
Zm4pICkgd2UgYWx3YXlzIGNsaXAgZW5kLiBXaGF0IHRoaXMgbmV3IHBhdGNoIGRvZXMgaW4KPiB0
aGF0IHJlZ2FyZCBpcyBqdXN0IG1ha2luZyBzdXJlIGl0IHVzZXMgdGhlIGhvc3RwMm0ncyBtYXhf
bWFwcGVkX3Bmbgo+IGluc3RlYWQgb2YgdGhlIGFsdHAybSdzLgoKT2gsIGdvb2QgcG9pbnQuIEkg
d2FzIGZvY3Vzc2luZyB0b28gbXVjaCBvbiAic3RhcnQiLCB0aGUgY2xpcHBpbmcKb2Ygd2hpY2gg
aXMgcHJldmVudGVkIGJ5IGhhdmluZyB0aGUgImdmbiIgbG9jYWwgdmFyaWFibGUuIEFuZCBJCnRo
aW5rIGN1cnJlbnQgY29kZSBpcyB3cm9uZyB0aGVuIHRvbyAoYW5kIEkgZnVydGhlciB0aGluayB5
b3VyCmNoYW5nZSB0aGVuIGp1c3QgZXh0ZW5kcyBiYWRuZXNzIHRvIGNlcnRhaW4gY2FzZXMgb2Yg
InN0YXJ0IikuIFNvCnVubGVzcyB0aGlzIGNhbiBiZSBleHBsYWluZWQgYXMgY29ycmVjdCBiZWhh
dmlvciwgSSdkIGhvcGUgZm9yCnRoZSBzaXR1YXRpb24gdG8gYXQgbGVhc3Qgbm90IGJlIG1hZGUg
d29yc2UgdGhhbiBpdCBpcy4gSWRlYWxseSBpdAp3b3VsZCBiZSBpbXByb3ZlZCwgYnV0IEkgcmVh
bGl6ZSB0aGUgaW5jZW50aXZlIG1heSBiZSBsb3cgYXMgaXQncwpwcmVzdW1hYmx5IGp1c3QgYSB0
aGVvcmV0aWNhbCBjb25zaWRlcmF0aW9uLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
