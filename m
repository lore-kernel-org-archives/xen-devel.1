From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: add support for missing {,
 V}PMADDWD insns
Date: Wed, 15 May 2019 11:17:50 +0100
Message-ID: <ecde9471-17e5-61b8-1c61-67cac1d54fc4@citrix.com>
References: <5CDBCC89020000780022F1DE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rumq=TP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hQqz1-0005Bo-7k
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 10:17:59 +0000
In-Reply-To: <5CDBCC89020000780022F1DE@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDUvMjAxOSAwOToyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlaXIgcHJlLUFWWDUx
MiBpbmNhcm5hdGlvbnMgaGF2ZSBjbGVhcmx5IGJlZW4gb3Zlcmxvb2tlZCBkdXJpbmcgbXVjaAo+
IGVhcmxpZXIgd29yay4gVGhlaXIgbWVtb3J5IGFjY2VzcyBwYXR0ZXJuIGlzIGVudGlyZWx5IHN0
YW5kYXJkLCBzbyBubwo+IHNwZWNpZmljIHRlc3RzIGdldCBhZGRlZCB0byB0aGUgaGFybmVzcy4K
Pgo+IFJlcG9ydGVkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Cj4g
LS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKPiArKysgYi94ZW4v
YXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+IEBAIC02NjI0LDYgKzY2MjQsOCBA
QCB4ODZfZW11bGF0ZSgKPiAgICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4ZjMp
OiAvKiB2cHNsbHEgeG1tL20xMjgse3gseX1tbSx7eCx5fW1tICovCj4gICAgICBjYXNlIFg4NkVN
VUxfT1BDXzY2KDB4MGYsIDB4ZjQpOiAgICAgLyogcG11bHVkcSB4bW0vbTEyOCx4bW0gKi8KPiAg
ICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4ZjQpOiAvKiB2cG11bHVkcSB7eCx5
fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KPiArICAgIENBU0VfU0lNRF9QQUNLRURfSU5UKDB4
MGYsIDB4ZjUpOiAgICAvKiBwbWFkZHdkIHsseH1tbS9tZW0seyx4fW1tICovCj4gKyAgICBjYXNl
IFg4NkVNVUxfT1BDX1ZFWF82NigweDBmLCAweGY1KTogLyogdnBtYWRkd2Qge3gseX1tbS9tZW0s
e3gseX1tbSx7eCx5fW1tICovCgpOb3RoaW5nIG9uIHRoaXMgcGF0aCBjaGVja3MgZm9yIFNTU0Uz
LCBBRkFJQ1QuCgp+QW5kcmV3Cgo+ICAgICAgY2FzZSBYODZFTVVMX09QQ182NigweDBmLCAweGY2
KTogICAgIC8qIHBzYWRidyB4bW0vbTEyOCx4bW0gKi8KPiAgICAgIGNhc2UgWDg2RU1VTF9PUENf
VkVYXzY2KDB4MGYsIDB4ZjYpOiAvKiB2cHNhZGJ3IHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1t
bSAqLwo+ICAgICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlQoMHgwZiwgMHhmOCk6ICAgIC8qIHBzdWJi
IHsseH1tbS9tZW0seyx4fW1tICovCj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
