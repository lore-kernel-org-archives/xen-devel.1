From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 9/9] viridian: add implementation of the
 HvSendSyntheticClusterIpi hypercall
Date: Thu, 31 Jan 2019 14:46:07 +0000
Message-ID: <20190131144607.2aijafq3fx6ciihq@zion.uk.xensource.com>
References: <20190131104730.2085-1-paul.durrant@citrix.com>
 <20190131104730.2085-10-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UmBj=QH=citrix.com=prvs=927d2e39f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gpDbd-0002Cr-Lc
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 14:46:17 +0000
Content-Disposition: inline
In-Reply-To: <20190131104730.2085-10-paul.durrant@citrix.com>
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

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgMTA6NDc6MzBBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyBhbiBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgaHlwZXJjYWxs
IGFzIGRvY3VtZW50ZWQgaW4gdGhlCj4gc3BlY2lmaWNhdGlvbiBbMV0sIHNlY3Rpb24gMTAuNS4y
LiBUaGlzIGVubGlnaHRlbm1lbnQsIGFzIHdpdGggb3RoZXJzLCBpcwo+IGFkdmVydGlzZWQgYnkg
Q1BVSUQgbGVhZiAweDQwMDAwMDA0IGFuZCBpcyB1bmRlciBjb250cm9sIG9mIGEgbmV3Cj4gJ2hj
YWxsX2lwaScgb3B0aW9uIGluIGxpYnhsLgo+IAo+IElmIHVzZWQsIHRoaXMgZW5saWdodGVubWVu
dCBzaG91bGQgbWVhbiB0aGUgZ3Vlc3Qgb25seSB0YWtlcyBhIHNpbmdsZSBWTUVYSVQKPiB0byBp
c3N1ZSBJUElzIHRvIG11bHRpcGxlIHZDUFVzIHJhdGhlciB0aGFuIHRoZSBtdWx0aXBsZSBWTUVY
SVRzIHRoYXQgd291bGQKPiByZXN1bHQgZnJvbSB1c2luZyB0aGUgZW11bGF0ZWQgbG9jYWwgQVBJ
Qy4KPiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL01pY3Jvc29mdERvY3MvVmlydHVhbGl6YXRp
b24tRG9jdW1lbnRhdGlvbi9yYXcvbGl2ZS90bGZzL0h5cGVydmlzb3IlMjBUb3AlMjBMZXZlbCUy
MEZ1bmN0aW9uYWwlMjBTcGVjaWZpY2F0aW9uJTIwdjUuMEMucGRmCj4gCj4gU2lnbmVkLW9mZi1i
eTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiAtLS0KPiBDYzogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cj4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4K
PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJh
ZC53aWxrQG9yYWNsZS5jb20+Cj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KPiBDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+Cj4gQ2M6ICJSb2dlciBQ
YXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gLS0tCj4gIGRvY3MvbWFuL3hsLmNm
Zy41LnBvZC5pbiAgICAgICAgICAgICB8ICA2ICsrKwo+ICB0b29scy9saWJ4bC9saWJ4bC5oICAg
ICAgICAgICAgICAgICAgfCAgNiArKysKPiAgdG9vbHMvbGlieGwvbGlieGxfZG9tLmMgICAgICAg
ICAgICAgIHwgIDMgKysKPiAgdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsICAgICAgICAgIHwg
IDEgKwoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
