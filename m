From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC 12/16] gic-v2: Write HCR only on change
Date: Thu, 29 Nov 2018 16:36:27 +0000
Message-ID: <fede6e3c-c46a-1c84-d10e-197c0107f815@arm.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-13-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i9bh=oi=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gSPIl-00036j-Im
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 16:36:31 +0000
In-Reply-To: <1543440731-21947-13-git-send-email-andrii.anisov@gmail.com>
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Andre Przywara <andre.przywara@arm.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyOC8xMS8yMDE4IDIxOjMyLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEZyb206IEFuZHJp
aSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4gCj4gVGhpcyBzYXZlcyBvbmUgd3Jp
dGUgdG8gcGVyaXBoZXJhbCBIQ1IgcmVnaXN0ZXIgcGVyIGh5cGVydmlzb3IgZW50cnkgZm9yCj4g
bW9zdCBjYXNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5p
c292QGVwYW0uY29tPgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL2dpYy12Mi5jIHwgNyArKysrKy0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXYyLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXYy
LmMKPiBpbmRleCAxYTc0NGM1Li4yNTE0N2JkIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9n
aWMtdjIuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9naWMtdjIuYwo+IEBAIC01NzksMTQgKzU3OSwx
NyBAQCBzdGF0aWMgdm9pZCBnaWN2Ml93cml0ZV9scihpbnQgbHIsIGNvbnN0IHN0cnVjdCBnaWNf
bHIgKmxyX3JlZykKPiAgIAo+ICAgc3RhdGljIHZvaWQgZ2ljdjJfaGNyX3N0YXR1cyh1aW50MzJf
dCBmbGFnLCBib29sIHN0YXR1cykKPiAgIHsKPiAtICAgIHVpbnQzMl90IGhjciA9IHJlYWRsX2dp
Y2goR0lDSF9IQ1IpOwo+ICsgICAgdWludDMyX3QgaGNyLCBvaGNyOwo+ICsKPiArICAgIG9oY3Ig
PSBoY3IgPSByZWFkbF9naWNoKEdJQ0hfSENSKTsKPiAgIAo+ICAgICAgIGlmICggc3RhdHVzICkK
PiAgICAgICAgICAgaGNyIHw9IGZsYWc7Cj4gICAgICAgZWxzZQo+ICAgICAgICAgICBoY3IgJj0g
KH5mbGFnKTsKPiAgIAo+IC0gICAgd3JpdGVsX2dpY2goaGNyLCBHSUNIX0hDUik7Cj4gKyAgICBp
ZiAoIGhjciAhPSBvaGNyICkKPiArICAgICAgICB3cml0ZWxfZ2ljaChoY3IsIEdJQ0hfSENSKTsK
CldoaWxlIEkgdW5kZXJzdGFuZCB0aGF0IHRoZW9yZXRpY2FsbHkgdGhpcyBpcyBhbiBpc3N1ZS4g
SXMgaXQgYWN0dWFsbHkgYSByZWFsIApwZXJmb3JtYW5jZSBiZW5lZml0cz8KCkkgd291bGQgYWN0
dWFsbHkgZXhwZWN0IHRoZSByZWFkIHRvIGJlIG1vcmUgZXhwZW5zaXZlIHRoYW4gdGhlIHdyaXRl
IGJlY2F1c2Ugd2UgCmltcGxlbWVudCB3cml0ZWxfZ2ljaCB1c2luZyB3cml0ZWxfcmVsYXhlZC4g
U28gdGhlcmUgYXJlIG5vIGJhcnJpZXIgYWZ0ZXJ3YXJkcyAKdG8gImJsb2NrIiB0aGUgcHJvY2Vz
c29yIHRvIGdvIGZvcndhcmQuCgo+ICAgfQo+ICAgCj4gICBzdGF0aWMgdW5zaWduZWQgaW50IGdp
Y3YyX3JlYWRfdm1jcl9wcmlvcml0eSh2b2lkKQo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
