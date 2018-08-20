From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 08/34] x86: enclose hvm_op and dm_op in
 CONFIG_HVM in PV hypercall table
Date: Mon, 20 Aug 2018 05:59:38 -0600
Message-ID: <5B7AAD2A02000078001E000B@prv1-mh.provo.novell.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <4385411f3be7d5ca99fe1e5e43f0b30d701afac1.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jmcq=ld=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1friqV-0002kc-DV
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 11:59:43 +0000
In-Reply-To: <4385411f3be7d5ca99fe1e5e43f0b30d701afac1.1534518694.git-series.wei.liu2@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L3B2L2h5cGVyY2FsbC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3B2
L2h5cGVyY2FsbC5jCj4gQEAgLTY4LDcgKzY4LDkgQEAgY29uc3QgaHlwZXJjYWxsX3RhYmxlX3Qg
cHZfaHlwZXJjYWxsX3RhYmxlW10gPSB7Cj4gICNlbmRpZgo+ICAgICAgSFlQRVJDQUxMKGV2ZW50
X2NoYW5uZWxfb3ApLAo+ICAgICAgQ09NUEFUX0NBTEwocGh5c2Rldl9vcCksCj4gKyNpZmRlZiBD
T05GSUdfSFZNCj4gICAgICBIWVBFUkNBTEwoaHZtX29wKSwKPiArI2VuZGlmCj4gICAgICBIWVBF
UkNBTEwoc3lzY3RsKSwKPiAgICAgIEhZUEVSQ0FMTChkb21jdGwpLAo+ICAjaWZkZWYgQ09ORklH
X0tFWEVDCj4gQEAgLTc4LDcgKzgwLDkgQEAgY29uc3QgaHlwZXJjYWxsX3RhYmxlX3QgcHZfaHlw
ZXJjYWxsX3RhYmxlW10gPSB7Cj4gICAgICBIWVBFUkNBTEwodG1lbV9vcCksCj4gICNlbmRpZgo+
ICAgICAgSFlQRVJDQUxMKHhlbnBtdV9vcCksCj4gKyNpZmRlZiBDT05GSUdfSFZNCj4gICAgICBD
T01QQVRfQ0FMTChkbV9vcCksCj4gKyNlbmRpZgo+ICAgICAgSFlQRVJDQUxMKG1jYSksCj4gICAg
ICBIWVBFUkNBTEwoYXJjaF8xKSwKPiAgfTsKCklzIHRoZXJlIGFueXRoaW5nIHNwZWFraW5nIGFn
YWluc3QgcHV0dGluZyB0aGVtIGJvdGggaW50byB0aGUgc2FtZQpzaW5nbGUgI2lmZGVmPyBBbHNv
LCB3aGF0IGFib3V0IGh5cGVyY2FsbF9hcmdzX3RhYmxlW10/CgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
