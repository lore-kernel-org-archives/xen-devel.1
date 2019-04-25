From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2 v2] x86/acpi: Improve suspend and resume
 process for Zhaoxin CPU
Date: Thu, 25 Apr 2019 14:25:25 +0100
Message-ID: <89dcdf84-214d-d100-e2a1-8bd151f215bd@citrix.com>
References: <1555663857-4173-1-git-send-email-fionali-oc@zhaoxin.com>
 <5CC1B46B0200007800229134@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PBl1=S3=citrix.com=prvs=0115b8627=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJePo-0006kA-Su
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 13:27:52 +0000
In-Reply-To: <5CC1B46B0200007800229134@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, FionaLi-oc <fionali-oc@zhaoxin.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, cobechen@zhaoxin.com, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDQvMjAxOSAxNDoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTkuMDQuMTkg
YXQgMTA6NTAsIDxmaW9uYWxpLW9jQHpoYW94aW4uY29tPiB3cm90ZToKPj4gV2hlbiBleGVjdXRp
bmcgU1lTRVhJVCBvciBTWVNFTlRSWSBpbiBaaGFveGluIENQVSwgQ1BVIG5lZWRzIHRvCj4gU1lT
RU5URVIKPgo+PiAtLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKPj4gKysrIGIveGVu
L2FyY2gveDg2L3g4Nl82NC90cmFwcy5jCj4+IEBAIC0zMzQsNyArMzM0LDggQEAgdm9pZCBzdWJh
cmNoX3BlcmNwdV90cmFwc19pbml0KHZvaWQpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICh1bnNpZ25lZCBsb25nKWxzdGFyX2VudGVyKTsKPj4gICAgICBzdHViX3ZhICs9
IG9mZnNldDsKPj4gIAo+PiAtICAgIGlmICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yICYgKFg4
Nl9WRU5ET1JfSU5URUwgfCBYODZfVkVORE9SX0NFTlRBVVIpICkKPj4gKyAgICBpZiAoIGJvb3Rf
Y3B1X2RhdGEueDg2X3ZlbmRvciAmCj4+ICsgICAgICAgIChYODZfVkVORE9SX0lOVEVMIHwgWDg2
X1ZFTkRPUl9DRU5UQVVSIHwgWDg2X1ZFTkRPUl9TSEFOR0hBSSkgKQo+PiAgICAgIHsKPj4gICAg
ICAgICAgLyogU1lTRU5URVIgZW50cnkuICovCj4+ICAgICAgICAgIHdybXNybChNU1JfSUEzMl9T
WVNFTlRFUl9FU1AsIHN0YWNrX2JvdHRvbSk7Cj4gSG93IGlzIHRoaXMgaHVuayByZWxhdGVkIHRv
IHRoZSB0aXRsZSBvZiB0aGUgY2hhbmdlPyBJIHRoaW5rIHRoZQo+IHRpdGxlIHdhbnRzIHRvIGJl
IGFkanVzdGVkLgo+Cj4gRnVydGhlcm1vcmUgZm9yIGFsbCBvZiB0aGUgY2hhbmdlcyBkb25lLCB3
b3VsZG4ndCB3ZSBiZXR0ZXIKPiBzd2l0Y2ggdG8gdXNlIGNwdV9oYXNfc2VwPyBpbml0X2FtZCgp
IGFzIHdlbGwgYXMgZGVmYXVsdF9pbml0KCkKPiBhbHJlYWR5IGNsZWFyIHRoaXMgZmxhZy4gQW5k
cmV3LCB0aG91Z2h0cz8KCkkgd29uZGVyZWQgZXhhY3RseSB0aGF0IGFmdGVyIHF1ZXVpbmcgdGhp
cyBwYXRjaCwgYnV0IGRpZG4ndCBnZXQgYXJvdW5kCnRvIGV4cGVyaW1lbnRpbmcuCgpXZSBoYXZl
IHRvIGJlIGEgbGl0dGxlIGNhcmVmdWwgd2l0aCB0aGUgb3JkZXJpbmcgb2Ygb3BlcmF0aW9ucy7C
oApjcHVfaGFzX3NlcCBpcyB2aXNpYmxlIGluIENQVUlEIGJ1dCBuZWVkcyBjbG9iYmVyaW5nIGlu
IEFNRC9IeWdvbiBiZWZvcmUKY3B1X2hhc19zZXAgaXMgc2FmZSB0byB1c2UgKGFsdGhvdWdoIGZv
ciB0aGUgTVNScywgaXQgc2hvdWxkIGJlIHNhZmUpLgoKfkFuZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
