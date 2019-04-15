From: Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH V3 4/5] xen/arm: Extend SCIF early prink
 code to handle other interfaces
Date: Mon, 15 Apr 2019 14:38:36 +0300
Message-ID: <2ff19660-21e6-d2a6-6752-4c8a59433f72@gmail.com>
References: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
 <1554718489-11318-5-git-send-email-olekstysh@gmail.com>
 <69c402ec-3a78-edf4-354d-1413b3c9c603@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5YYu=SR=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hFzwl-0007o6-1y
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 11:38:47 +0000
Received: by mail-lf1-x144.google.com with SMTP id v1so3492001lfg.5
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2019 04:38:44 -0700 (PDT)
In-Reply-To: <69c402ec-3a78-edf4-354d-1413b3c9c603@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

Ck9uIDE0LjA0LjE5IDIwOjQ4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSBKdWxpZW4K
Cgo+Cj4gT24gNC84LzE5IDExOjE0IEFNLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPj4g
RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
Pgo+Pgo+PiBFeHRlbmQgZWFybHkgcHJpbmsgY29kZSB0byBiZSBhYmxlIHRvIGhhbmRsZSBvdGhl
ciBTQ0lGKFgpCj4+IGNvbXBhdGlibGUgaW50ZXJmYWNlcyBhcyB3ZWxsLiBUaGVzZSBpbnRlcmZh
Y2VzIGhhdmUgbG90IGluIGNvbW1vbiwKPj4gYnV0IG1vc3RseSBkaWZmZXIgaW4gb2Zmc2V0cyBh
bmQgYml0cyBmb3Igc29tZSByZWdpc3RlcnMuCj4+Cj4+IEludHJvZHVjZSAiRUFSTFlfUFJJTlRL
X1ZFUlNJT04iIGNvbmZpZyBvcHRpb24gdG8gY2hvb3NlIHdoaWNoCj4+IGludGVyZmFjZSB2ZXJz
aW9uIHNob3VsZCBiZSB1c2VkICh0byBwcm9wZXJseSBhcHBseSByZWdpc3RlciBvZmZzZXRzKS4K
Pj4KPj4gUGxlYXNlIG5vdGUsIG5vdGhpbmcgaGFzIGJlZW4gdGVjaG5pY2FsbHkgY2hhbmdlZCBm
b3IgUmVuZXNhcyAiTGFnZXIiCj4+IGFuZCBvdGhlciBzdXBwb3J0ZWQgYm9hcmRzIChTQ0lGKS4K
Pj4KPj4gVGhlICJFQVJMWV9QUklOVEtfVkVSU0lPTiIgb3B0aW9uIGZvciB0aGF0IGJvYXJkIHNo
b3VsZCBiZSBlbXB0eToKPj4gQ09ORklHX0VBUkxZX1BSSU5USz1zY2lmLDB4ZTZlNjAwMDAKPj4K
Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hl
bmtvQGVwYW0uY29tPgo+PiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
Pj4KPj4gLS0tCj4+IMKgwqDCoMKgIENoYW5nZXMgaW4gdjM6Cj4+IMKgwqDCoMKgwqDCoMKgwqAg
LSBJdCB3YXMgZGVjaWRlZCBub3QgdG8gaW50cm9kdWNlIG5ldyBkZWJ1Zy1zY2lmYS5pbmMKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIGhhbmRsaW5nIFNDSUZBIGludGVyZmFjZSwgYnV0IHRv
IGV4dGVuZCBleGlzdGluZwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZWJ1Zy1zY2lmLmluYyBm
b3IgaGFuZGxpbmcgYm90aCBpbnRlcmZhY2VzLgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUaGlz
IHBhdGNoIGlzIGEgcmVzdWx0IG9mIHNwbGl0dGluZyBhbiBpbml0aWFsIHBhdGNoCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgICJ4ZW4vYXJtOiBBZGQgU0NJRkEgVUFSVCBzdXBwb3J0IGZvciBlYXJs
eSBwcmludGsiCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFuZCBvbmx5IHJld29ya3MgYSBjb2Rl
Cj4+IC0tLQo+PiDCoCB4ZW4vYXJjaC9hcm0vUnVsZXMubWvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDcgKysrKysrKwo+PiDCoCB4ZW4vYXJjaC9hcm0vYXJtMzIvZGVidWctc2NpZi5pbmMg
fCAxMyArKysrKysrKystLS0tCj4KPiBZb3Ugd2FudCB0byB1cGRhdGUgZG9jcy9taXNjL2FybS9l
YXJseS1wcmludGsudHh0IHdpdGggdGhlIG5ldyBvcHRpb24uCgpTdXJlLCB3aWxsIHVwZGF0ZS4K
Cgo+Cj4gT3RoZXJ3aXNlLCB0aGUgY29kZSBsb29rcyBnb29kIHRvIG1lLgo+Cj4gQ2hlZXJzLAo+
Ci0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
