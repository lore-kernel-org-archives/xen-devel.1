From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] x86: report if PCID and INVPCID are
	supported
Date: Mon, 5 Mar 2018 12:43:25 +0100
Message-ID: <fdc238ab-ad02-69a0-0e3a-3c2e643a40e7@suse.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
 <20180305095032.30062-2-wei.liu2@citrix.com>
 <5A9D362002000078001AE74F@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=u36v=f3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1esoWl-0007QV-3d
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 11:43:35 +0000
In-Reply-To: <5A9D362002000078001AE74F@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMTggMTI6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA1LjAzLjE4IGF0
IDEwOjUwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9zZXR1cC5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4+IEBAIC0xNzAxLDYgKzE3
MDEsMTMgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBt
YmlfcCkKPj4gICAgICAgICAgICAgY3B1X2hhc19ueCA/IFhFTkxPR19JTkZPIDogWEVOTE9HX1dB
Uk5JTkcgIldhcm5pbmc6ICIsCj4+ICAgICAgICAgICAgIGNwdV9oYXNfbnggPyAiIiA6ICJub3Qg
Iik7Cj4+ICAKPj4gKwo+PiArICAgIHByaW50ayhYRU5MT0dfSU5GTwo+PiArICAgICAgICAgICAi
UENJRCAoUHJvY2Vzcy1Db250ZXh0IElEZW50aWZpZXIpICVzc3VwcG9ydGVkXG4iLAo+PiArICAg
ICAgICAgICBjcHVfaGFzX3BjaWQgPyAiIiA6ICJub3QgIik7Cj4+ICsKPj4gKyAgICBwcmludGso
WEVOTE9HX0lORk8gIklOVlBDSUQgJXNzdXBwb3J0ZWRcbiIsIGNwdV9oYXNfaW52cGNpZCA/ICIi
IDogIm5vdCAiKTsKPiAKPiBEbyB3ZSByZWFsbHkgbmVlZCB0aGlzPyBXZSBsb2cgYSBtZXNzYWdl
IGZvciBOWCBhcyBhbiBleGNlcHRpb24sCj4gd2UgZG9uJ3QgZG8gc28gZm9yIG90aGVyIGZlYXR1
cmVzIChhbmQgdGhpbmdzIHdvdWxkIGdldCBwcmV0dHkKPiB1bndpZWxkeSBpZiB3ZSBkaWQpLgoK
SSdkIHJhdGhlciBrZWVwIHRoaXMgbWVzc2FnZS4gQXMgd2UgYXJlIGhpZGluZyBQQ0lEIGFuZCBJ
TlBDSUQgZnJvbSBkb20wCnRoaXMgaXMgdGhlIG9ubHkgaW5kaWNhdG9yIG9mIHRob3NlIGZlYXR1
cmVzIGJlaW5nIHN1cHBvcnRlZC4gSW4gY2FzZSBvZgphbiBlcnJvciByZWxhdGVkIHRvIFRMQiBj
b25zaXN0ZW5jeSB0aGlzIGluZm9ybWF0aW9uIGlzIGltcG9ydGFudCBJTU8uCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
