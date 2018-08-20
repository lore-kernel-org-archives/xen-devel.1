From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 04/34] x86/mm: don't reference hvm_funcs
 directly
Date: Mon, 20 Aug 2018 10:28:21 +0100
Message-ID: <bde0408e-40b6-63e1-86c7-df9c2bb97eb1@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <a1e3abddeb657a96e8989767ffc5c7d01ad20225.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6aav=ld=citrix.com=prvs=763c8c697=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1frgU8-0000uw-3H
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 09:28:28 +0000
In-Reply-To: <a1e3abddeb657a96e8989767ffc5c7d01ad20225.1534518694.git-series.wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDgvMjAxOCAxNjoxMiwgV2VpIExpdSB3cm90ZToKPiBkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaAo+
IGluZGV4IDRmNzIwYWQuLjE0NjcyMGMgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9odm0vaHZtLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaAo+IEBAIC00
NTQsNiArNDU0LDExIEBAIHN0YXRpYyBpbmxpbmUgaW50IGh2bV9ldmVudF9wZW5kaW5nKHN0cnVj
dCB2Y3B1ICp2KQo+ICAgICAgcmV0dXJuIGh2bV9mdW5jcy5ldmVudF9wZW5kaW5nKHYpOwo+ICB9
Cj4gIAo+ICtzdGF0aWMgaW5saW5lIHZvaWQgaHZtX2ludmxwZyhzdHJ1Y3QgdmNwdSAqdiwgdW5z
aWduZWQgbG9uZyB2YSkKClBsZWFzZSBzL3ZhL2xpbmVhci8gd2hpbGUgbWFraW5nIHRoaXMgYWRk
aXRpb24gKG9yIGRvIGEgZ2VuZXJhbCB2YSA9PgpsaW5lYXIgY2xlYW51cCBmb3IgaW52bHBnKS7C
oCBTYWRseSwgdGhlIHRlcm1pbm9sb2d5IGhhcyBiZWVuIGluY29ycmVjdApzaW5jZSB0aGUgY29k
ZXMgaW50cm9kdWN0aW9uLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
