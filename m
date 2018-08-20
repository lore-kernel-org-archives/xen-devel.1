From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 12/34] x86/pt: only call some functions for
 HVM guests
Date: Mon, 20 Aug 2018 06:48:58 -0600
Message-ID: <5B7AB8BA02000078001E00BF@prv1-mh.provo.novell.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <b576d7d5e5f5baa54a8152cafceb9181d13e02ce.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jmcq=ld=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1frjcG-0007VF-Ut
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 12:49:04 +0000
In-Reply-To: <b576d7d5e5f5baa54a8152cafceb9181d13e02ce.1534518694.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6CgpG
b3IgdGhlIHN1YmplY3QsIGRvIHlvdSBwZXJoYXBzIG1lYW4gImNhbGwgc29tZSBmdW5jdGlvbnMg
Zm9yIEhWTSBndWVzdHMKb25seSI/IE90aGVyd2lzZSwgcHV0dGluZyBlbXBoYXNpcyBvbiAic29t
ZSIsIHRoZSBzZW5zZSBnZXRzIHNvcnQgb2YKaW52ZXJ0ZWQgZnJvbSB3aGF0IEkgdGhpbmsgeW91
IG1lYW4uCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm1zaS5jCj4gKysrIGIveGVuL2FyY2gv
eDg2L2h2bS92bXNpLmMKPiBAQCAtNTYxLDcgKzU2MSw5IEBAIHZvaWQgbXNpeHRibF9pbml0KHN0
cnVjdCBkb21haW4gKmQpCj4gIHsKPiAgICAgIHN0cnVjdCBodm1faW9faGFuZGxlciAqaGFuZGxl
cjsKPiAgCj4gLSAgICBpZiAoICFpc19odm1fZG9tYWluKGQpIHx8ICFoYXNfdmxhcGljKGQpIHx8
IG1zaXh0YmxfaW5pdGlhbGlzZWQoZCkgKQo+ICsgICAgQVNTRVJUKGlzX2h2bV9kb21haW4oZCkp
Owo+ICsKPiArICAgIGlmICggIWhhc192bGFwaWMoZCkgfHwgbXNpeHRibF9pbml0aWFsaXNlZChk
KSApCj4gICAgICAgICAgcmV0dXJuOwoKQWNjb3JkaW5nIHRvIHlvdXIgZWFybGllciBwYXRjaCwg
aGFzX3ZsYXBpYygpIGltcGxpZXMgaXNfaHZtX2RvbWFpbigpLApzbyBpZiBhbnl0aGluZyBpcyB0
byBiZSBtb3ZlZCB0byB0aGUgY2FsbGVyLCB0aGVuIGhhc192bGFwaWMoKSAoYW5kCmlzX2h2bV9k
b21haW4oKSB3b3VsZCB0aGVuIHRvIGJlIGRyb3BwZWQgYWx0b2dldGhlcikuIEhvd2V2ZXIsCnRo
aXMgaXMgYWdhaW4gYSBjYXNlIHdoZXJlIEknbSBub3Qgc3VyZSB3aGV0aGVyIGFkZGluZyAvIGV4
dGVuZGluZwppZigpLXMgYXJvdW5kIGNhbGxzIGlzIGluZGVlZCBwcmVmZXJhYmxlIG92ZXIgYWRk
aW5nIHN0YXRpYyBpbmxpbmUgc3R1YnMuClBlcmhhcHMgZm9yIHRoZSBzcGVjaWZpYyBvbmUgaGVy
ZSBlaXRoZXIgdmFyaWFudCBpcyBhYm91dCBhcyBtdWNoIChvcgphcyBsaXR0bGUpIGNvZGUgY2h1
cm4sIGJ1dCBmb3IgdGhlIFBJIGhvb2tzIGZ1bmN0aW9ucyBJIHRoaW5rIHRoZSBzdHViCmFwcHJv
YWNoIG1pZ2h0IGJlIHNsaWdodGx5IGJldHRlci4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
