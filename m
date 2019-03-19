From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] x86: decouple xen alignment setting
 from EFI/ELF build
Date: Tue, 19 Mar 2019 13:09:35 +0000
Message-ID: <e05c0ae5-5931-d03c-a40d-d84c482d7b1a@citrix.com>
References: <20190319130550.32570-1-wei.liu2@citrix.com>
 <20190319130550.32570-2-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pfQQ=RW=citrix.com=prvs=974a346cd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h6EZM-00009E-DX
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 13:14:16 +0000
In-Reply-To: <20190319130550.32570-2-wei.liu2@citrix.com>
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
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDMvMjAxOSAxMzowNSwgV2VpIExpdSB3cm90ZToKPiBAQCAtMjAsMTMgKzE5LDIyIEBA
IEVOVFJZKGVmaV9zdGFydCkKPiAgI2Vsc2UgLyogIUVGSSAqLwo+ICAKPiAgI2RlZmluZSBGT1JN
QVQgImVsZjY0LXg4Ni02NCIKPiAtI2RlZmluZSBTRUNUSU9OX0FMSUdOIFBBR0VfU0laRQo+ICAj
ZGVmaW5lIERFQ0xfU0VDVElPTih4KSB4IDogQVQoQUREUih4KSAtIF9fWEVOX1ZJUlRfU1RBUlQp
Cj4gIAo+ICBFTlRSWShzdGFydF9wYSkKPiAgCj4gICNlbmRpZiAvKiBFRkkgKi8KPiAgCj4gKyNp
ZmRlZiBDT05GSUdfWEVOX0FMSUdOXzJNCj4gKyNkZWZpbmUgU0VDVElPTl9BTElHTiBNQigyKQo+
ICsjZWxzZSAvKiBEZWZhdWx0IGFsaWdubWVudCAqLwo+ICsjaWZkZWYgRUZJCj4gKyNkZWZpbmUg
U0VDVElPTl9BTElHTiBNQigyKQo+ICsjZWxzZQo+ICsjZGVmaW5lIFNFQ1RJT05fQUxJR04gUEFH
RV9TSVpFCj4gKyNlbmRpZgo+ICsjZW5kaWYKCkFzIGEgdHJpdmlhbCBjaGFuZ2UsIGNhbiB0aGlz
IHBsZWFzZSBiZToKCiNpZmRlZiBDT05GSUdfWEVOX0FMSUdOXzJNCiMgZGVmaW5lIFNFQ1RJT05f
QUxJR04gTUIoMikKI2Vsc2UgLyogRGVmYXVsdCBhbGlnbm1lbnQgKi8KIyBpZmRlZiBFRkkKI8Kg
IGRlZmluZSBTRUNUSU9OX0FMSUdOIE1CKDIpCiMgZWxzZQojwqAgZGVmaW5lIFNFQ1RJT05fQUxJ
R04gUEFHRV9TSVpFCiMgZW5kaWYKI2VuZGlmCgpUbyBoZWxwIGhpZ2hsaWdodCB0aGUgbmVzdGlu
ZyBsZXZlbHMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
