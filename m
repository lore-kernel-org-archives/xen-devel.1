From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 08/34] x86: enclose hvm_op and dm_op in
 CONFIG_HVM in PV hypercall table
Date: Mon, 20 Aug 2018 14:09:08 +0100
Message-ID: <20180820130908.ecrkyhntmdgjo2dn@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <4385411f3be7d5ca99fe1e5e43f0b30d701afac1.1534518694.git-series.wei.liu2@citrix.com>
 <5B7AAD2A02000078001E000B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qa+b=ld=citrix.com=prvs=763aa43e8=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1frjvl-0001kS-1W
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 13:09:13 +0000
Content-Disposition: inline
In-Reply-To: <5B7AAD2A02000078001E000B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjAsIDIwMTggYXQgMDU6NTk6MzhBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvcHYvaHlwZXJjYWxsLmMKPiA+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9wdi9oeXBlcmNhbGwuYwo+ID4gQEAgLTY4LDcgKzY4LDkgQEAgY29uc3QgaHlwZXJj
YWxsX3RhYmxlX3QgcHZfaHlwZXJjYWxsX3RhYmxlW10gPSB7Cj4gPiAgI2VuZGlmCj4gPiAgICAg
IEhZUEVSQ0FMTChldmVudF9jaGFubmVsX29wKSwKPiA+ICAgICAgQ09NUEFUX0NBTEwocGh5c2Rl
dl9vcCksCj4gPiArI2lmZGVmIENPTkZJR19IVk0KPiA+ICAgICAgSFlQRVJDQUxMKGh2bV9vcCks
Cj4gPiArI2VuZGlmCj4gPiAgICAgIEhZUEVSQ0FMTChzeXNjdGwpLAo+ID4gICAgICBIWVBFUkNB
TEwoZG9tY3RsKSwKPiA+ICAjaWZkZWYgQ09ORklHX0tFWEVDCj4gPiBAQCAtNzgsNyArODAsOSBA
QCBjb25zdCBoeXBlcmNhbGxfdGFibGVfdCBwdl9oeXBlcmNhbGxfdGFibGVbXSA9IHsKPiA+ICAg
ICAgSFlQRVJDQUxMKHRtZW1fb3ApLAo+ID4gICNlbmRpZgo+ID4gICAgICBIWVBFUkNBTEwoeGVu
cG11X29wKSwKPiA+ICsjaWZkZWYgQ09ORklHX0hWTQo+ID4gICAgICBDT01QQVRfQ0FMTChkbV9v
cCksCj4gPiArI2VuZGlmCj4gPiAgICAgIEhZUEVSQ0FMTChtY2EpLAo+ID4gICAgICBIWVBFUkNB
TEwoYXJjaF8xKSwKPiA+ICB9Owo+IAo+IElzIHRoZXJlIGFueXRoaW5nIHNwZWFraW5nIGFnYWlu
c3QgcHV0dGluZyB0aGVtIGJvdGggaW50byB0aGUgc2FtZQo+IHNpbmdsZSAjaWZkZWY/CgpOby4K
Cj4gQWxzbywgd2hhdCBhYm91dCBoeXBlcmNhbGxfYXJnc190YWJsZVtdPwoKU3RyYXkgZW50cmll
cyBpbiBoeXBlcmNhbGxfYXJnc190YWJsZSBzaG91bGRuJ3QgY2F1c2UgYW55IGhhcm0sIGJ1dCBJ
CmFncmVlIHdlIHNob3VsZCBwdXQgdGhlbSB1bmRlciBpZmRlZiBhcyB3ZWxsLgoKV2VpLgoKPiAK
PiBKYW4KPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
