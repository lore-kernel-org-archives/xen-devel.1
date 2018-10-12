From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 10/17] x86: provide stub for switch_compat
Date: Fri, 12 Oct 2018 08:33:48 -0600
Message-ID: <5BC0B0CC02000078001F10D2@prv1-mh.provo.novell.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
 <7ef6c604e1e5e528f017e7bde6c62c2ba57b5e2e.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tlq1=my=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gAyVm-00065y-K8
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 14:33:54 +0000
In-Reply-To: <7ef6c604e1e5e528f017e7bde6c62c2ba57b5e2e.1538667753.git-series.wei.liu2@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjEwLjE4IGF0IDE3OjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2luY2x1ZGUveGVuL2NvbXBhdC5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2Nv
bXBhdC5oCj4gQEAgLTIyOCw3ICsyMjgsMTYgQEAgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbzsK
PiAgdm9pZCB4bGF0X3ZjcHVfcnVuc3RhdGVfaW5mbyhzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZv
ICopOwo+ICAKPiAgc3RydWN0IGRvbWFpbjsKPiArCj4gKyNpZmRlZiBDT05GSUdfUFYKPiAgaW50
IHN3aXRjaF9jb21wYXQoc3RydWN0IGRvbWFpbiAqKTsKPiArI2Vsc2UKPiArIyBpbmNsdWRlIDx4
ZW4vZXJybm8uaD4KPiArc3RhdGljIGlubGluZSBpbnQgc3dpdGNoX2NvbXBhdChzdHJ1Y3QgZG9t
YWluICpkKQo+ICt7Cj4gKyAgICByZXR1cm4gLUVJTlZBTDsKPiArfQo+ICsjZW5kaWYKCkkgc2Vl
IHR3byBvcHRpb25zIGhlcmU6IEVpdGhlciB3ZSBnbyB3aXRoIHRoIGFib3ZlLCBidXQgd2l0aCAt
RUFDQ0VTCmFzIHRoZSByZXR1cm4gdmFsdWUgKHRvIG1hdGNoIHRoZSBjdXJyZW50IG9uZSBmb3Ig
SFZNIGRvbWFpbnMpLCBvcgp0aGUgI2lmZGVmIGdvZXMgYXJvdW5kIHRoZSBjYXNlIGJsb2NrIGlu
IGRvbWN0bC5jLiBQZXJzb25hbGx5IEknZCBwcmVmZXIKdGhlIGxhdHRlci4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
