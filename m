From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 6/9] viridian: add implementation of
 synthetic interrupt MSRs
Date: Thu, 31 Jan 2019 14:46:01 +0000
Message-ID: <20190131144601.vml4w4xf7zpsk6ai@zion.uk.xensource.com>
References: <20190131104730.2085-1-paul.durrant@citrix.com>
 <20190131104730.2085-7-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UmBj=QH=citrix.com=prvs=927d2e39f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gpDbS-0002BZ-B6
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 14:46:06 +0000
Content-Disposition: inline
In-Reply-To: <20190131104730.2085-7-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgMTA6NDc6MjdBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhbiBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgU0NP
TlRST0wsIFNWRVJTSU9OLCBTSUVGUCwKPiBTSU1QLCBFT00gYW5kIFNJTlQwLTE1IFN5bklDIE1T
UnMuIE5vIG1lc3NhZ2Ugc291cmNlIGlzIGFkZGVkIGFuZCwgYXMgc3VjaCwKPiBub3RoaW5nIHdp
bGwgeWV0IGdlbmVyYXRlIGEgc3ludGhldGljIGludGVycnVwdC4gQSBzdWJzZXF1ZW50IHBhdGNo
IHdpbGwKPiBhZGQgYW4gaW1wbGVtZW50YXRpb24gb2Ygc3ludGhldGljIHRpbWVycyB3aGljaCB3
aWxsIG5lZWQgdGhlIGluZnJhc3RydWN0dXJlCj4gYWRkZWQgYnkgdGhpcyBwYXRjaCB0byBkZWxp
dmVyIGV4cGlyeSBtZXNzYWdlcyB0byB0aGUgZ3Vlc3QuCj4gCj4gTk9URTogQSAnc3luaWMnIG9w
dGlvbiBpcyBhZGRlZCB0byB0aGUgdG9vbHN0YWNrIHZpcmlkaWFuIGVubGlnaHRlbm1lbnRzCj4g
ICAgICAgZW51bWVyYXRpb24gYnV0IGlzIGRlbGliZXJhdGVseSBub3QgZG9jdW1lbnRlZCBhcyBl
bmFibGluZyB0aGVzZQo+ICAgICAgIFN5bklDIHJlZ2lzdGVycyB3aXRob3V0IGEgbWVzc2FnZSBz
b3VyY2UgaXMgb25seSB1c2VmdWwgZm9yCj4gICAgICAgZGVidWdnaW5nLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2M6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5j
b20+Cj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBDYzogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxr
b25yYWQud2lsa0BvcmFjbGUuY29tPgo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+Cj4gQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+IENjOiAiUm9n
ZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IAo+IHYzOgo+ICAtIEFkZCB0
aGUgJ1NpbnRQb2xsaW5nTW9kZUF2YWlsYWJsZScgYml0IGluIENQVUlEIGxlYWYgMwo+IC0tLQo+
ICB0b29scy9saWJ4bC9saWJ4bC5oICAgICAgICAgICAgICAgICAgICB8ICAgNiArCj4gIHRvb2xz
L2xpYnhsL2xpYnhsX2RvbS5jICAgICAgICAgICAgICAgIHwgICAzICsKPiAgdG9vbHMvbGlieGwv
bGlieGxfdHlwZXMuaWRsICAgICAgICAgICAgfCAgIDEgKwoKRm9yIHRoZSB0b29sc3RhY2sgcGFy
dDoKCkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKU29ycnkgSSBkb24n
dCBoYXZlIHRpbWUgdG8gZ28gdGhyb3VnaCB0aGUgdmlyaWRpYW4gc3BlYywgYnV0IHRoZSByZXN0
Cmxvb2tzIHNlbnNpYmxlIHRvIG1lLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
