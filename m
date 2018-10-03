From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 03/12] x86/HVM: patch vINTR indirect
 calls through hvm_funcs to direct ones
Date: Wed, 3 Oct 2018 20:01:28 +0100
Message-ID: <fb08a79d-609c-f2c3-b148-d79f4fd49149@citrix.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB344C602000078001EDA0E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=twgs=mp=citrix.com=prvs=8071b990d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g7mOp-0000t8-93
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 19:01:31 +0000
In-Reply-To: <5BB344C602000078001EDA0E@prv1-mh.provo.novell.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTAvMTggMTE6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEBAIC0xNTA5LDcgKzE1MTMs
OCBAQCBzdGF0aWMgaW50IGxhcGljX2xvYWRfcmVncyhzdHJ1Y3QgZG9tYWluCj4gICAgICAgICAg
bGFwaWNfbG9hZF9maXh1cChzKTsKPiAgCj4gICAgICBpZiAoIGh2bV9mdW5jcy5wcm9jZXNzX2lz
ciApCj4gLSAgICAgICAgaHZtX2Z1bmNzLnByb2Nlc3NfaXNyKHZsYXBpY19maW5kX2hpZ2hlc3Rf
aXNyKHMpLCB2KTsKPiArICAgICAgICBhbHRlcm5hdGl2ZV92Y2FsbChodm1fZnVuY3MucHJvY2Vz
c19pc3IsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHZsYXBpY19maW5kX2hpZ2hlc3Rf
aXNyKHMpLCB2KTsKCkFsaWdubWVudC4KCk90aGVyIHRoYW4gdGhpcywgUmV2aWV3ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
