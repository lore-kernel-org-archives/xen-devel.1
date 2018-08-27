From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 15/23] x86/mm: put HVM only code under
 CONFIG_HVM
Date: Mon, 27 Aug 2018 10:01:31 -0600
Message-ID: <5B84205B02000078001E2507@prv1-mh.provo.novell.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <1f5209e13cb12be42209f977c97290dd4343d2a8.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jola=lk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fuJxR-0001Qd-5U
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 16:01:37 +0000
In-Reply-To: <1f5209e13cb12be42209f977c97290dd4343d2a8.1535285866.git-series.wei.liu2@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA4LjE4IGF0IDE0OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L21tL01ha2VmaWxlCj4gKysrIGIveGVuL2FyY2gveDg2L21tL01h
a2VmaWxlCj4gQEAgLTEsOSArMSwxMCBAQAo+ICBzdWJkaXIteSArPSBzaGFkb3cKPiAtc3ViZGly
LXkgKz0gaGFwCj4gK3N1YmRpci0kKENPTkZJR19IVk0pICs9IGhhcAo+ICAKPiAgb2JqLXkgKz0g
cGFnaW5nLm8KPiAtb2JqLXkgKz0gcDJtLm8gcDJtLXB0Lm8gcDJtLWVwdC5vIHAybS1wb2Qubwo+
IC1vYmoteSArPSBhbHRwMm0ubwo+ICtvYmoteSArPSBwMm0ubyBwMm0tcHQubwo+ICtvYmotJChD
T05GSUdfSFZNKSArPSBwMm0tZXB0Lm8gcDJtLXBvZC5vCj4gK29iai0kKENPTkZJR19IVk0pICs9
IGFsdHAybS5vCj4gIG9iai15ICs9IGd1ZXN0X3dhbGtfMi5vCj4gIG9iai15ICs9IGd1ZXN0X3dh
bGtfMy5vCj4gIG9iai15ICs9IGd1ZXN0X3dhbGtfNC5vCgpXb3VsZCB5b3UgbWluZCBvbmNlIGFn
YWluIHNvcnRpbmcgdGhpbmdzIGF0IHRoZSBzYW1lIHRpbWU/Cgo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9tbS9wMm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+IEBAIC01MzUsNyArNTM1
LDcgQEAgc3RydWN0IHBhZ2VfaW5mbyAqcDJtX2dldF9wYWdlX2Zyb21fZ2ZuKAo+ICBpbnQgcDJt
X3NldF9lbnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCBnZm5fdCBnZm4sIG1mbl90IG1mbiwK
PiAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHBhZ2Vfb3JkZXIsIHAybV90eXBlX3Qg
cDJtdCwgcDJtX2FjY2Vzc190IHAybWEpCj4gIHsKPiAtICAgIHN0cnVjdCBkb21haW4gKmQgPSBw
Mm0tPmRvbWFpbjsKPiArICAgIHN0cnVjdCBkb21haW4gKiBfX21heWJlX3VudXNlZCBkID0gcDJt
LT5kb21haW47CgpJbnN0ZWFkIG9mIHRoaXMsIHdoeSBkb24ndCB5b3Ugc2ltcGx5IGxhdGNoIGhh
cF9lbmFibGVkKCkncyByZXR1cm4KdmFsdWUgaW50byBhIGxvY2FsIGJvb2wgdmFyaWFibGU/IChP
dGhlcndpc2UgSSB3b3VsZCBhc2sgZm9yIGNvbnN0CnRvIGJlIGFkZGVkIGhlcmUgYXMgeW91IHRv
dWNoIHRoaXMgYW55d2F5LikgQWRkaW5nCl9fbWF5YmVfdW51c2VkIHNob3VsZCByZWFsbHkgYmUg
YSBsYXN0IHJlc29ydCBvbmx5LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
