From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] x86: decouple xen alignment setting
 from EFI/ELF build
Date: Tue, 19 Mar 2019 07:40:51 -0600
Message-ID: <5C90F1630200007800220496@prv1-mh.provo.novell.com>
References: <20190319130550.32570-1-wei.liu2@citrix.com>
 <20190319130550.32570-2-wei.liu2@citrix.com>
 <e05c0ae5-5931-d03c-a40d-d84c482d7b1a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a8QS=RW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h6EzE-0002l1-Rc
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 13:41:00 +0000
In-Reply-To: <e05c0ae5-5931-d03c-a40d-d84c482d7b1a@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAzLjE5IGF0IDE0OjA5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTkvMDMvMjAxOSAxMzowNSwgV2VpIExpdSB3cm90ZToKPj4gQEAgLTIwLDEzICsx
OSwyMiBAQCBFTlRSWShlZmlfc3RhcnQpCj4+ICAjZWxzZSAvKiAhRUZJICovCj4+ICAKPj4gICNk
ZWZpbmUgRk9STUFUICJlbGY2NC14ODYtNjQiCj4+IC0jZGVmaW5lIFNFQ1RJT05fQUxJR04gUEFH
RV9TSVpFCj4+ICAjZGVmaW5lIERFQ0xfU0VDVElPTih4KSB4IDogQVQoQUREUih4KSAtIF9fWEVO
X1ZJUlRfU1RBUlQpCj4+ICAKPj4gIEVOVFJZKHN0YXJ0X3BhKQo+PiAgCj4+ICAjZW5kaWYgLyog
RUZJICovCj4+ICAKPj4gKyNpZmRlZiBDT05GSUdfWEVOX0FMSUdOXzJNCj4+ICsjZGVmaW5lIFNF
Q1RJT05fQUxJR04gTUIoMikKPj4gKyNlbHNlIC8qIERlZmF1bHQgYWxpZ25tZW50ICovCj4+ICsj
aWZkZWYgRUZJCj4+ICsjZGVmaW5lIFNFQ1RJT05fQUxJR04gTUIoMikKPj4gKyNlbHNlCj4+ICsj
ZGVmaW5lIFNFQ1RJT05fQUxJR04gUEFHRV9TSVpFCj4+ICsjZW5kaWYKPj4gKyNlbmRpZgo+IAo+
IEFzIGEgdHJpdmlhbCBjaGFuZ2UsIGNhbiB0aGlzIHBsZWFzZSBiZToKPiAKPiAjaWZkZWYgQ09O
RklHX1hFTl9BTElHTl8yTQo+ICMgZGVmaW5lIFNFQ1RJT05fQUxJR04gTUIoMikKPiAjZWxzZSAv
KiBEZWZhdWx0IGFsaWdubWVudCAqLwo+ICMgaWZkZWYgRUZJCj4gIyAgZGVmaW5lIFNFQ1RJT05f
QUxJR04gTUIoMikKPiAjIGVsc2UKPiAjICBkZWZpbmUgU0VDVElPTl9BTElHTiBQQUdFX1NJWkUK
PiAjIGVuZGlmCj4gI2VuZGlmCj4gCj4gVG8gaGVscCBoaWdobGlnaHQgdGhlIG5lc3RpbmcgbGV2
ZWxzLgoKI2lmIGRlZmluZWQoQ09ORklHX1hFTl9BTElHTl8yTSkgfHwgZGVmaW5lZChFRkkpCiMg
ZGVmaW5lIFNFQ1RJT05fQUxJR04gTUIoMikKI2Vsc2UKIyBkZWZpbmUgU0VDVElPTl9BTElHTiBQ
QUdFX1NJWkUKI2VuZGlmCgo/IFRoZW4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KKGJ1dCBJIGNhbiBsaXZlIHdpdGggQW5kcmV3J3MgdmFyaWFudCB0b28sIGlm
IG5lZWQgYmUpCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
