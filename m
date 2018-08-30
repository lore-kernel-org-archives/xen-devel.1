From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86/HVM: drop
 hvm_fetch_from_guest_linear()
Date: Thu, 30 Aug 2018 12:24:20 +0100
Message-ID: <6f7d8807-14e8-848e-ac02-4b355d95be15@citrix.com>
References: <5B87CF6302000078001E37A6@prv1-mh.provo.novell.com>
 <5B87D04F02000078001E37B5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ohfx=ln=citrix.com=prvs=773039ca7=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fvL3n-0001IH-Fm
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 11:24:23 +0000
In-Reply-To: <5B87D04F02000078001E37B5@prv1-mh.provo.novell.com>
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
Cc: Tim Deegan <tim@xen.org>, Olaf Hering <olaf@aepfle.de>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDgvMTggMTI6MDksIEphbiBCZXVsaWNoIHdyb3RlOgo+IEBAIC0zNzU4LDggKzM3NDks
OSBAQCB2b2lkIGh2bV91ZF9pbnRlcmNlcHQoc3RydWN0IGNwdV91c2VyX3JlCj4gICAgICAgICAg
aWYgKCBodm1fdmlydHVhbF90b19saW5lYXJfYWRkcih4ODZfc2VnX2NzLCBjcywgcmVncy0+cmlw
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHNpZyks
IGh2bV9hY2Nlc3NfaW5zbl9mZXRjaCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNzLCAmYWRkcikgJiYKPiAtICAgICAgICAgICAgIChodm1fZmV0Y2hfZnJvbV9n
dWVzdF9saW5lYXIoc2lnLCBhZGRyLCBzaXplb2Yoc2lnKSwKPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgd2FsaywgTlVMTCkgPT0gSFZNVFJBTlNfb2theSkgJiYK
PiArICAgICAgICAgICAgIChodm1fY29weV9mcm9tX2d1ZXN0X2xpbmVhcihzaWcsIGFkZHIsIHNp
emVvZihzaWcpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHdh
bGsgfCBQRkVDX2luc25fZmV0Y2gsIE5VTEwsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgTlVMTCkgPT0gSFZNVFJBTlNfb2theSkgJiYKClRoaXMgd291bGQgYmUg
bW9yZSBzaW1wbGUgYnkgZm9sZGluZyBQRkVDX2luc25fZmV0Y2ggaW50byB0aGUKaW5pdGlhbGlz
YXRpb24gb2Ygd2FsaywgYXMgdGhpcyB3aG9sZSBleHByZXNzaW9uIGlzIGp1c3QgYW4gaW5zdHJ1
Y3Rpb24KZmV0Y2guCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
