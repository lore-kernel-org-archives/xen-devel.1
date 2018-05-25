From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/5] x86: move definition of struct
 cpuid_leaf to cpuid.h
Date: Fri, 25 May 2018 11:31:17 +0200
Message-ID: <20180525093117.ixgfd6ejsxhzfy26@MacBook-Pro-de-Roger.local>
References: <20180524160522.757-1-wei.liu2@citrix.com>
 <20180524160522.757-2-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ifz/=im=citrix.com=prvs=676f710cf=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fM94O-0004gs-EQ
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 09:31:32 +0000
Content-Disposition: inline
In-Reply-To: <20180524160522.757-2-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, sergey.dyasli@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMjQsIDIwMTggYXQgMDU6MDU6MThQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBUaGlzIGlzIGEgc3RlcCB0b3dhcmRzIGNvbnNvbGlkYXRpbmcgcmVsZXZhbnQgZGF0YSBzdHJ1
Y3R1cmVzIGFuZAo+IGRlZmluZXMgdG8gb25lIGxvY2F0aW9uLgo+IAo+IEl0IHRoZW4gcmVxdWly
ZXMgZGVmaW5pbmcgY3B1aWRfbGVhZiBpbiB1c2VyIHNwYWNlIGhhcm5lc3MgaGVhZGVycyB0bwo+
IG1ha2UgdGhlbSBjb250aW51ZSB0byBjb21waWxlLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdl
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gLS0t
Cj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBDYzogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAtLS0KPiAgdG9vbHMvdGVzdHMveDg2X2Vt
dWxhdG9yL3g4Ni1lbXVsYXRlLmggfCA2ICsrKysrKwo+ICB4ZW4vYXJjaC94ODYveDg2X2VtdWxh
dGUveDg2X2VtdWxhdGUuaCB8IDYgKy0tLS0tCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvY3B1aWQu
aCAgICAgICAgICAgIHwgNCArKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdHMveDg2X2VtdWxh
dG9yL3g4Ni1lbXVsYXRlLmggYi90b29scy90ZXN0cy94ODZfZW11bGF0b3IveDg2LWVtdWxhdGUu
aAo+IGluZGV4IGM1ZTg1ZGUzYTIuLjhhZTMxYTJmOWEgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVz
dHMveDg2X2VtdWxhdG9yL3g4Ni1lbXVsYXRlLmgKPiArKysgYi90b29scy90ZXN0cy94ODZfZW11
bGF0b3IveDg2LWVtdWxhdGUuaAo+IEBAIC03OSw2ICs3OSwxMiBAQCBXUkFQKHB1dHMpOwo+ICAK
PiAgI3VuZGVmIFdSQVAKPiAgCj4gKyNpZm5kZWYgY3B1aWRfbGVhZgo+ICtzdHJ1Y3QgY3B1aWRf
bGVhZiB7Cj4gKyAgICB1aW50MzJfdCBhLCBiLCBjLCBkOwo+ICt9Owo+ICsjZW5kaWYKCkRvIHlv
dSByZWFsbHkgbmVlZCB0aGUgaWZuZGVmPyBBRkFJQ1QgdGhpcyBoZWFkZXIgd2lsbCBhbHdheXMg
YmUKaW5jbHVkZWQgZnJvbSB0aGUgdGVzdCBoYXJuZXNzLCB3aGljaCBoYXMgbm8gZGVmaW5pdGlv
biBvZiBjcHVpZF9sZWFmLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
