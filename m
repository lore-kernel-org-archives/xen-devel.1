From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC XEN PATCH v4 00/41] Add vNVDIMM support to HVM
 domains
Date: Tue, 13 Feb 2018 04:05:45 -0700
Message-ID: <5A82D49902000078001A74B2@prv-mh.provo.novell.com>
References: <20171207101030.22364-1-haozhong.zhang@intel.com>
 <20180209123323.pm6bw4xl2slo3x7a@MacBook-Pro-de-Roger.local>
 <20180212012542.2fn4anzvuuhcmvm4@hz-desktop>
 <20180212100556.pg76xpb3vdkp257g@MacBook-Pro-de-Roger.local>
 <5A82C6B002000078001A7425@prv-mh.provo.novell.com>
 <20180213102929.ae54b66t664kdqx2@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180213102929.ae54b66t664kdqx2@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: TimDeegan <tim@xen.org>, StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xen.org, Shane Wang <shane.wang@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, GangWei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAyLjE4IGF0IDExOjI5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgRmViIDEzLCAyMDE4IGF0IDAzOjA2OjI0QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTIuMDIuMTggYXQgMTE6MDUsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gSWYgeW91IG1hcCB0aGUgTlZESU1NIGFzIE1NSU8gdG8gRG9tMCB5b3UgZG9u
J3QgbmVlZCB0aGUgTTJQIGVudHJpZXMKPj4gPiBJSVJDLCBhbmQgaWYgaXQncyBtYXBwZWQgdXNp
bmcgMUdCIHBhZ2VzIGl0IHNob3VsZG4ndCB1c2UgdGhhdCBtdWNoCj4+ID4gbWVtb3J5IGZvciB0
aGUgcGFnZSB0YWJsZXMgKGllOiB5b3UgY291bGQganVzdCB1c2Ugbm9ybWFsIFJBTSBmb3IgdGhl
Cj4+ID4gcGFnZSB0YWJsZXMgdGhhdCBtYXAgdGhlIE5WRElNTSBJTU8pLiBPZiBjb3Vyc2UgdGhh
dCBvbmx5IGFwcGxpZXMgdG8KPj4gPiBQVkgvSFZNLgo+PiAKPj4gQnV0IGluIG9yZGVyIHRvIHVz
ZSAocGFydCBvZikgaXQgaW4gYSBSQU0tbGlrZSBtYW5uZXIgd2UgbmVlZCBzdHJ1Y3QKPj4gcGFn
ZV9pbmZvIGZvciBpdC4KPiAKPiBJIGd1ZXNzIHRoZSBtYWluIHVzZSBvZiB0aGlzIHdvdWxkIGJl
IHRvIGdyYW50IE5WRElNTSBwYWdlcz8gQW5kCj4gd2l0aG91dCBhIHBhZ2VfaW5mbyB0aGF0J3Mg
bm90IHBvc3NpYmxlLgoKV2h5IGdyYW50PyBTaW1wbHkgZ2l2aW5nIHN1Y2ggYSBwYWdlIGFzIFJB
TSB0byBhIGd1ZXN0IHdvdWxkCmFscmVhZHkgYmUgYSBwcm9ibGVtIHdpdGhvdXQgc3RydWN0IHBh
Z2VfaW5mbyAoYXMgdGhlbiB3ZSBjYW4ndAp0cmFjayB0aGUgcGFnZSBvd25lciwgbm9yIGNhbiB3
ZSByZWZjb3VudCB0aGUgcGFnZSkuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
