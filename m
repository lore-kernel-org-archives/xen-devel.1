From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] automation/build: update stretck-i386
 dockerfile
Date: Fri, 13 Jul 2018 08:09:32 +0100
Message-ID: <20180713070932.eacowyhktweyidyx@citrix.com>
References: <20180712163127.10241-1-wei.liu2@citrix.com>
 <20180712193342.g4euey2zca3eg4ms@MacBook-Pro.localdomain>
 <20180713011406.vnd3dlmfjrhzqy6r@MacBook-Pro.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pubn=j5=citrix.com=prvs=725ad1d35=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fdsD0-00007g-Ol
 for xen-devel@lists.xenproject.org; Fri, 13 Jul 2018 07:09:42 +0000
Content-Disposition: inline
In-Reply-To: <20180713011406.vnd3dlmfjrhzqy6r@MacBook-Pro.localdomain>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdWwgMTIsIDIwMTggYXQgMDg6MTQ6MDZQTSAtMDUwMCwgRG91ZyBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gVGh1LCBKdWwgMTIsIDIwMTggYXQgMDI6MzM6NDJQTSAtMDUwMCwgRG91ZyBH
b2xkc3RlaW4gd3JvdGU6Cj4gPiBPbiBUaHUsIEp1bCAxMiwgMjAxOCBhdCAwNTozMToyN1BNICsw
MTAwLCBXZWkgTGl1IHdyb3RlOgo+ID4gPiBXZSBkb24ndCBuZWVkIHRvIHNwZWNpZnkgL2Jpbi9i
YXNoIGluIHRoZSBlbnRyeSBwb2ludCBydW5lLCBvdGhlcndpc2UKPiA+ID4gbm9uLWludGVyYWN0
aXZlIGludm9jYXRpb24gb2YgdGhlIGNvbnRhaW5lciB3b3VsZCBmYWlsIHdpdGggc29tZXRoaW5n
Cj4gPiA+IGxpa2U6Cj4gPiA+IAo+ID4gPiArIEM9ZGViaWFuOnN0cmV0Y2gtaTM4Ngo+ID4gPiAr
IGV4cG9ydCBDT05UQUlORVI9cmVnaXN0cnkuZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC94ZW4vZGVi
aWFuOnN0cmV0Y2gtaTM4Ngo+ID4gPiArIENPTlRBSU5FUj1yZWdpc3RyeS5naXRsYWIuY29tL3hl
bi1wcm9qZWN0L3hlbi9kZWJpYW46c3RyZXRjaC1pMzg2Cj4gPiA+ICsgY2QgL2xvY2FsL3dvcmsv
Q09NTUlUVEVSL3hlbi0zMi5naXQKPiA+ID4gKyBnaXQgZmV0Y2ggb3JpZ2luCj4gPiA+ICsgY29u
IGdpdCByZXNldCAtLWhhcmQgb3JpZ2luL3N0YWdpbmcKPiA+ID4gKioqIEVuc3VyaW5nIHJlZ2lz
dHJ5LmdpdGxhYi5jb20veGVuLXByb2plY3QveGVuL2RlYmlhbjpzdHJldGNoLWkzODYgaXMgdXAg
dG8gZGF0ZQo+ID4gPiAqKiogTGF1bmNoaW5nIGNvbnRhaW5lciAuLi4KPiA+ID4gL3Vzci9iaW4v
Z2l0OiAvdXNyL2Jpbi9naXQ6IGNhbm5vdCBleGVjdXRlIGJpbmFyeSBmaWxlCj4gPiA+IAo+ID4g
PiBXaGlsZSBhdCBpdCwgdXNlIHNob3J0aGFuZCAibGludXgzMiIuCj4gPiA+IAo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4gPiAtLS0KPiA+IAo+
ID4gQWNrZWQtYnk6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KPiAKPiBPaCBJ
IGZvcmdvdCB0byBub3RlIHRoYXQgdGhlcmUncyBhIHR5cG8gaW4gdGhlIHN1YmplY3QgYnV0IHRo
YXQgY2FuIGp1c3QKPiBiZSBmaXhlZCB3aGlsZSBjb21taXR0aW5nLgoKVGhhbmtzIGZvciB0aGUg
cmVtaW5kZXIuIEZpeGVkIGFuZCBhcHBsaWVkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
