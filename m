From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 25/34] x86/mm/shadow: make it build with
 !CONFIG_HVM
Date: Sun, 26 Aug 2018 12:04:40 +0100
Message-ID: <20180826110440.rq4uguyedjjtglbt@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <299eb6a4020c01e57f0d7e30180ab66edc9836bf.1534518694.git-series.wei.liu2@citrix.com>
 <5B7BCCFC02000078001E04D1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gpvm=lj=citrix.com=prvs=769521655=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftsqb-0001Ca-TP
 for xen-devel@lists.xenproject.org; Sun, 26 Aug 2018 11:04:45 +0000
Content-Disposition: inline
In-Reply-To: <5B7BCCFC02000078001E04D1@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMDI6Mjc6NDBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vc2hhZG93L211bHRpLmMKPiA+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvbXVsdGkuYwo+ID4gQEAgLTI5MjYsMTggKzI5MjYsMjUg
QEAgc3RhdGljIGludCBzaF9wYWdlX2ZhdWx0KHN0cnVjdCB2Y3B1ICp2LAo+ID4gICAgICAgICAg
ICAgIH0KPiA+ICAgICAgICAgICAgICBlbHNlCj4gPiAgICAgICAgICAgICAgewo+ID4gKyNpZiBD
T05GSUdfSFZNCj4gPiAgICAgICAgICAgICAgICAgIC8qIE1hZ2ljIE1NSU8gbWFya2VyOiBleHRy
YWN0IGdmbiBmb3IgTU1JTyBhZGRyZXNzICovCj4gPiAgICAgICAgICAgICAgICAgIEFTU0VSVChz
aF9sMWVfaXNfbW1pbyhzbDFlKSk7Cj4gPiArICAgICAgICAgICAgICAgIEFTU0VSVChpc19odm1f
dmNwdSh2KSk7Cj4gPiAgICAgICAgICAgICAgICAgIGdwYSA9ICgoKHBhZGRyX3QpKGdmbl94KHNo
X2wxZV9tbWlvX2dldF9nZm4oc2wxZSkpKSkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIDw8
IFBBR0VfU0hJRlQpCj4gPiAgICAgICAgICAgICAgICAgICAgICB8ICh2YSAmIH5QQUdFX01BU0sp
Owo+ID4gKyAgICAgICAgICAgICAgICBwZXJmY19pbmNyKHNoYWRvd19mYXVsdF9mYXN0X21taW8p
Owo+ID4gKyAgICAgICAgICAgICAgICBTSEFET1dfUFJJTlRLKCJmYXN0IHBhdGggbW1pbyAlIyJQ
UklwYWRkciJcbiIsIGdwYSk7Cj4gPiArICAgICAgICAgICAgICAgIHNoX3Jlc2V0X2Vhcmx5X3Vu
c2hhZG93KHYpOwo+ID4gKyAgICAgICAgICAgICAgICB0cmFjZV9zaGFkb3dfZ2VuKFRSQ19TSEFE
T1dfRkFTVF9NTUlPLCB2YSk7Cj4gPiArICAgICAgICAgICAgICAgIHJldHVybiBoYW5kbGVfbW1p
b193aXRoX3RyYW5zbGF0aW9uKHZhLCBncGEgPj4gUEFHRV9TSElGVCwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWNjZXNzKQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgPyBFWENSRVRfZmF1bHRfZml4ZWQgOiAwOwo+ID4gKyNlbHNlCj4g
PiArICAgICAgICAgICAgICAgIC8qIFdoZW4gSFZNIGlzIG5vdCBlbmFibGVkLCB0aGVyZSBzaG91
bGRuJ3QgYmUgTU1JTyBtYXJrZXIgKi8KPiA+ICsgICAgICAgICAgICAgICAgQlVHKCk7Cj4gCj4g
QXQgdGhlIGV4YW1wbGUgb2YgdGhpcywgd2hpbGUgSSBhZ3JlZSB3ZSBzaG91bGRuJ3QgcmVhY2gg
aGVyZSBmb3IgUFYsCj4gY2FuIHRoaXMgbmV2ZXJ0aGVsZXNzIGJlIHRoZSBsZXNzIGltcGFjdGZ1
bCBkb21haW5fY3Jhc2goKSBwbGVhc2U/Cj4gCgpEbyB5b3Ugb25seSB3YW50IHRoaXMgQlVHKCkg
dG8gYmUgcmVwbGFjZWQ/CgpJIHRoaW5rIHRoZSB0d28gaW4gc2hhZG9ud18qX2VtdWxhdGlvbiBz
aG91bGQgc3RheSBiZWNhdXNlIHlvdSB3aWxsIG9ubHkKZXZlciBnZXQgTlVMTCBwb2ludGVyIGRl
cmVmIGlmIHlvdSBhbGxvdyB0aGUgY29kZSB0byBjb250aW51ZS4KCldlaS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
