From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [RFC XEN PATCH v4 00/41] Add vNVDIMM support to HVM
 domains
Date: Tue, 13 Feb 2018 11:13:25 +0000
Message-ID: <20180213111324.fvftrlr6yryltwhz@MacBook-Pro-de-Roger.local>
References: <20171207101030.22364-1-haozhong.zhang@intel.com>
 <20180209123323.pm6bw4xl2slo3x7a@MacBook-Pro-de-Roger.local>
 <20180212012542.2fn4anzvuuhcmvm4@hz-desktop>
 <20180212100556.pg76xpb3vdkp257g@MacBook-Pro-de-Roger.local>
 <5A82C6B002000078001A7425@prv-mh.provo.novell.com>
 <20180213102929.ae54b66t664kdqx2@MacBook-Pro-de-Roger.local>
 <5A82D49902000078001A74B2@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <5A82D49902000078001A74B2@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: TimDeegan <tim@xen.org>, StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xen.org, Shane Wang <shane.wang@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, GangWei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMTMsIDIwMTggYXQgMDQ6MDU6NDVBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEzLjAyLjE4IGF0IDExOjI5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVHVlLCBGZWIgMTMsIDIwMTggYXQgMDM6MDY6MjRBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDEyLjAyLjE4IGF0IDExOjA1LCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gSWYgeW91IG1hcCB0aGUgTlZESU1NIGFzIE1NSU8gdG8g
RG9tMCB5b3UgZG9uJ3QgbmVlZCB0aGUgTTJQIGVudHJpZXMKPiA+PiA+IElJUkMsIGFuZCBpZiBp
dCdzIG1hcHBlZCB1c2luZyAxR0IgcGFnZXMgaXQgc2hvdWxkbid0IHVzZSB0aGF0IG11Y2gKPiA+
PiA+IG1lbW9yeSBmb3IgdGhlIHBhZ2UgdGFibGVzIChpZTogeW91IGNvdWxkIGp1c3QgdXNlIG5v
cm1hbCBSQU0gZm9yIHRoZQo+ID4+ID4gcGFnZSB0YWJsZXMgdGhhdCBtYXAgdGhlIE5WRElNTSBJ
TU8pLiBPZiBjb3Vyc2UgdGhhdCBvbmx5IGFwcGxpZXMgdG8KPiA+PiA+IFBWSC9IVk0uCj4gPj4g
Cj4gPj4gQnV0IGluIG9yZGVyIHRvIHVzZSAocGFydCBvZikgaXQgaW4gYSBSQU0tbGlrZSBtYW5u
ZXIgd2UgbmVlZCBzdHJ1Y3QKPiA+PiBwYWdlX2luZm8gZm9yIGl0Lgo+ID4gCj4gPiBJIGd1ZXNz
IHRoZSBtYWluIHVzZSBvZiB0aGlzIHdvdWxkIGJlIHRvIGdyYW50IE5WRElNTSBwYWdlcz8gQW5k
Cj4gPiB3aXRob3V0IGEgcGFnZV9pbmZvIHRoYXQncyBub3QgcG9zc2libGUuCj4gCj4gV2h5IGdy
YW50PyBTaW1wbHkgZ2l2aW5nIHN1Y2ggYSBwYWdlIGFzIFJBTSB0byBhIGd1ZXN0IHdvdWxkCj4g
YWxyZWFkeSBiZSBhIHByb2JsZW0gd2l0aG91dCBzdHJ1Y3QgcGFnZV9pbmZvIChhcyB0aGVuIHdl
IGNhbid0Cj4gdHJhY2sgdGhlIHBhZ2Ugb3duZXIsIG5vciBjYW4gd2UgcmVmY291bnQgdGhlIHBh
Z2UpLgoKTXkgcG9pbnQgd2FzIHRvIGF2b2lkIGRvaW5nIHRoYXQsIGFuZCBhbHdheXMgYXNzaWdu
IHRoZSBwYWdlcyBhcwpNTUlPLCB3aGljaCBJSVJDIGRvZXNuJ3QgcmVxdWlyZSBhIHN0cnVjdCBw
YWdlX2luZm8uCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
