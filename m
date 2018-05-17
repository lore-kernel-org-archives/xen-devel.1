From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 09/10] x86/SVM: Introduce svm command
 line option
Date: Thu, 17 May 2018 08:54:00 -0600
Message-ID: <5AFD978802000078001C3AF6@prv1-mh.provo.novell.com>
References: <20180507210753.2280-1-Janakarajan.Natarajan@amd.com>
 <20180507210753.2280-10-Janakarajan.Natarajan@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180507210753.2280-10-Janakarajan.Natarajan@amd.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA1LjE4IGF0IDIzOjA3LCA8SmFuYWthcmFqYW4uTmF0YXJhamFuQGFtZC5jb20+
IHdyb3RlOgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jCj4gKysrIGIveGVuL2Fy
Y2gveDg2L2h2bS9zdm0vc3ZtLmMKPiBAQCAtNjQsNiArNjQsMTYgQEAKPiAgI2luY2x1ZGUgPGFz
bS9tb25pdG9yLmg+Cj4gICNpbmNsdWRlIDxhc20veHN0YXRlLmg+Cj4gIAo+ICtzdGF0aWMgaW50
IHBhcnNlX3N2bV9wYXJhbShjb25zdCBjaGFyICpzKTsKClRoaXMgaXMgdW5uZWNlc3NhcnkgaWYg
eW91IG1vdmUgLi4uCgo+ICsvKgo+ICsgKiBUaGUgJ3N2bScgcGFyYW1ldGVyIGVuL2Rpcy1hYmxl
cyB2YXJpb3VzIFNWTSBmZWF0dXJlcy4KPiArICogT3B0aW9uYWwgY29tbWEgc2VwYXJhdGVkIHZh
bHVlIG1heSBjb250YWluOgo+ICsgKgo+ICsgKiAgIGF2aWMgLSBFbmFibGUgU1ZNIEFkdmFuY2Vk
IFZpcnR1YWwgSW50ZXJydXB0IENvbnRyb2xsZXIgKEFWSUMpCj4gKyAqLwo+ICtjdXN0b21fcGFy
YW0oInN2bSIsIHBhcnNlX3N2bV9wYXJhbSk7CgouLi4gdGhpcyBhZnRlciB0aGUgZnVuY3Rpb24g
ZGVmaW5pdGlvbi4KCj4gQEAgLTg5LDYgKzk5LDI4IEBAIHN0YXRpYyBib29sX3QgYW1kX2VycmF0
dW0zODNfZm91bmQgX19yZWFkX21vc3RseTsKPiAgc3RhdGljIHVpbnQ2NF90IG9zdndfbGVuZ3Ro
LCBvc3Z3X3N0YXR1czsKPiAgc3RhdGljIERFRklORV9TUElOTE9DSyhvc3Z3X2xvY2spOwo+ICAK
PiArc3RhdGljIGludCBfX2luaXQgcGFyc2Vfc3ZtX3BhcmFtKGNvbnN0IGNoYXIgKnMpCj4gK3sK
PiArICAgIGNoYXIgKnNzOwo+ICsgICAgaW50IHZhbDsKPiArCj4gKyAgICBkbyB7Cj4gKyAgICAg
ICAgdmFsID0gISFzdHJuY21wKHMsICJuby0iLCAzKTsKPiArICAgICAgICBpZiAoICF2YWwgKQo+
ICsgICAgICAgICAgICBzICs9IDM7CgpQbGVhc2UgdXNlIHBhcnNlX2Jvb2xlYW4oKS4KCj4gKyAg
ICAgICAgc3MgPSBzdHJjaHIocywgJywnKTsKPiArICAgICAgICBpZiAoIHNzICkKPiArICAgICAg
ICAgICAgKnNzID0gJ1wwJzsKPiArCj4gKyAgICAgICAgaWYgKCAhc3RyY21wKHMsICJhdmljIikg
KQo+ICsgICAgICAgICAgICBzdm1fYXZpYyA9IHZhbDsKCiAgICBlbHNlCiAgICAgICAgcmV0ID0g
LUVJTlZBTDsKCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
