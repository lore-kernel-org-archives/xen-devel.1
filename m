From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] x86: make sure module array is large
 enough in pvh-boot.c
Date: Fri, 28 Sep 2018 18:12:35 +0100
Message-ID: <1b3ecc85-f83f-fd34-a107-2106cc69beb3@citrix.com>
References: <20180928170632.1176-1-wei.liu2@citrix.com>
 <20180928170632.1176-2-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fclw=mk=citrix.com=prvs=802ed00fe=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g5wJj-00038y-07
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 17:12:39 +0000
In-Reply-To: <20180928170632.1176-2-wei.liu2@citrix.com>
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

T24gMjgvMDkvMTggMTg6MDYsIFdlaSBMaXUgd3JvdGU6Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9ndWVzdC9wdmgtYm9vdC5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L3B2aC1ib290LmMKPiBp
bmRleCAwZTllNWJmZGY2Li4zYjQ0YWVlOTBhIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9wdmgtYm9vdC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L3B2aC1ib290LmMKPiBA
QCAtNDIsNyArNDIsMTcgQEAgc3RhdGljIHZvaWQgX19pbml0IGNvbnZlcnRfcHZoX2luZm8odm9p
ZCkKPiAgICAgIG1vZHVsZV90ICptb2Q7Cj4gICAgICB1bnNpZ25lZCBpbnQgaTsKPiAgCj4gLSAg
ICBBU1NFUlQocHZoX2luZm8tPm1hZ2ljID09IFhFTl9IVk1fU1RBUlRfTUFHSUNfVkFMVUUpOwo+
ICsgICAgaWYgKCBwdmhfaW5mby0+bWFnaWMgIT0gWEVOX0hWTV9TVEFSVF9NQUdJQ19WQUxVRSAp
Cj4gKyAgICAgICAgcGFuaWMoIk1hZ2ljIHZhbHVlIGlzIHdyb25nOiAlWFxuIiwgcHZoX2luZm8t
Pm1hZ2ljKTsKCiV4ID8KCj4gKwo+ICsgICAgLyoKPiArICAgICAqIFRlbXBvcmFyeSBtb2R1bGUg
YXJyYXkgbmVlZHMgdG8gYmUgYXQgbGVhc3Qgb25lIGVsZW1lbnQgYmlnZ2VyIHRoYW4KPiArICAg
ICAqIHJlcXVpcmVkLiBUaGUgZXh0cmEgZWxlbWVudCBpcyB1c2VkIHRvIGFpZCByZWxvY2F0aW9u
LiBTZWUKPiArICAgICAqIGFyY2gveDg2L3NldHVwLmM6X19zdGFydF94ZW4oKS4KPiArICAgICAq
Lwo+ICsgICAgaWYgKCBBUlJBWV9TSVpFKHB2aF9tYmlfbW9kcykgPD0gcHZoX2luZm8tPm5yX21v
ZHVsZXMgKQo+ICsgICAgICAgIHBhbmljKCJUaGUgbW9kdWxlIGFycmF5IGlzIHRvbyBzbWFsbCwg
c2l6ZSAlbHUsIHJlcXVlc3RlZCAldS5cbiIsCgolenUgZm9yIHNpemVfdCwgYW5kIHBsZWFzZSBk
cm9wIHRoZSB1bm5lY2Vzc2FyeSB0cmFpbGluZyAuCgpPdGhlcndpc2UsIFJldmlld2VkLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKPiArICAgICAgICAgICAg
ICBBUlJBWV9TSVpFKHB2aF9tYmlfbW9kcyksIHB2aF9pbmZvLT5ucl9tb2R1bGVzKTsKPiAgCj4g
ICAgICAvKgo+ICAgICAgICogVHVybiBodm1fc3RhcnRfaW5mbyBpbnRvIG1iaS4gTHVja2lseSBh
bGwgbW9kdWxlcyBhcmUgcGxhY2VkIHVuZGVyIDRHQgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
