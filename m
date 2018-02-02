From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 09/25] x86emul: support XOP insns
Date: Fri, 2 Feb 2018 12:03:48 +0000
Message-ID: <746d7022-5c6e-9df4-bb4a-4235600bc956@citrix.com>
References: <5A29550C020000780019585B@prv-mh.provo.novell.com>
 <5A29589402000078001958F4@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=g0dj=e4=citrix.com=prvs=564f8cbd0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eha4U-0006JM-7s
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2018 12:03:58 +0000
In-Reply-To: <5A29589402000078001958F4@prv-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMTcgMTQ6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEBAIC04MDI3LDYgKzgwNjAs
MTMgQEAgeDg2X2VtdWxhdGUoCj4gICAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKHZleC53
LCBFWENfVUQpOwo+ICAgICAgICAgIGdvdG8gc2ltZF8wZl9pbW04X2F2eDsKPiAgCj4gKyAgICBj
YXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBmM2EsIDB4NDgpOiAvKiB2cGVybWlsMnBzICRpbW0s
e3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tLHt4LHl9bW0gKi8KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZwZXJtaWwycHMgJGltbSx7eCx5fW1tLHt4
LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLwo+ICsgICAgY2FzZSBYODZFTVVMX09QQ19WRVhf
NjYoMHgwZjNhLCAweDQ5KTogLyogdnBlcm1pbDJwZCAkaW1tLHt4LHl9bW0vbWVtLHt4LHl9bW0s
e3gseX1tbSx7eCx5fW1tICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAvKiB2cGVybWlsMnBkICRpbW0se3gseX1tbSx7eCx5fW1tL21lbSx7eCx5fW1tLHt4
LHl9bW0gKi8KPiArICAgICAgICBob3N0X2FuZF92Y3B1X211c3RfaGF2ZSh4b3ApOwo+ICsgICAg
ICAgIGdvdG8gc2ltZF8wZl9pbW04X3ltbTsKCklzIHRoaXMgY29ycmVjdD/CoCBWRVguVyBzZWxl
Y3RzIHdoaWNoIG9wZXJhbmQgbWF5IGJlIHRoZSBtZW1vcnkgb3BlcmFuZCwKYW5kIEkgZG9uJ3Qg
c2VlIGFueXRoaW5nIGluIHRoZSBkZWNvZGUgd2hpY2ggY29wZXMsIG9yIGFueXRoaW5nIGluIHRo
ZQpzdHViIHdoaWNoIGFkanVzdHMgLlcuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
