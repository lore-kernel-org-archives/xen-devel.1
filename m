From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] pci: apply workaround for Intel errata
 HSE43 and BDF2
Date: Tue, 04 Dec 2018 02:29:31 -0700
Message-ID: <5C0648FB02000078002028F2@prv1-mh.provo.novell.com>
References: <20181129171128.44473-1-roger.pau@citrix.com>
 <5C0116A9020000780020188F@prv1-mh.provo.novell.com>
 <20181203173651.chgmkmtikmz4hue3@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uzs+=on=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gU73J-0001zq-ED
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 09:31:37 +0000
In-Reply-To: <20181203173651.chgmkmtikmz4hue3@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjEyLjE4IGF0IDE4OjM2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgTm92IDMwLCAyMDE4IGF0IDAzOjUzOjI5QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjkuMTEuMTggYXQgMTg6MTEsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gQEAgLTI5OCw2ICsyOTksMzQgQEAgc3RhdGljIHZvaWQgY2hlY2tfcGRldihj
b25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldikKPj4gPiAgI3VuZGVmIFBDSV9TVEFUVVNfQ0hFQ0sK
Pj4gPiAgfQo+PiA+ICAKPj4gPiArc3RhdGljIHZvaWQgYXBwbHlfcXVpcmtzKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KQo+PiA+ICt7Cj4+ID4gKyAgICB1aW50MTZfdCB2ZW5kb3IgPSBwY2lfY29uZl9y
ZWFkMTYocGRldi0+c2VnLCBwZGV2LT5idXMsCj4+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgUENJX1NMT1QocGRldi0+ZGV2Zm4pLAo+PiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9GVU5DKHBkZXYtPmRldmZuKSwgUENJX1ZFTkRP
Ul9JRCk7Cj4+ID4gKyAgICB1aW50MTZfdCBkZXZpY2UgPSBwY2lfY29uZl9yZWFkMTYocGRldi0+
c2VnLCBwZGV2LT5idXMsCj4+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgUENJX1NMT1QocGRldi0+ZGV2Zm4pLAo+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFBDSV9GVU5DKHBkZXYtPmRldmZuKSwgUENJX0RFVklDRV9JRCk7Cj4+ID4g
Kwo+PiA+ICsgICAgaWYgKCB2ZW5kb3IgPT0gUENJX1ZFTkRPUl9JRF9JTlRFTCAmJiAoZGV2aWNl
ID09IDB4MmZjMCB8fAo+PiA+ICsgICAgICAgICBkZXZpY2UgPT0gMHg2ZjYwIHx8IGRldmljZSA9
PSAweDZmYTAgfHwgZGV2aWNlID09IDB4NmZjMCkgKQo+PiAKPj4gSW5zdGVhZCBvZiBzdWNoIGFu
IGV2ZXIgZ3Jvd2luZyBpZigpLCBjb3VsZCB3ZSBtYWtlIHRoaXMgdGFibGUgYmFzZWQ/Cj4gCj4g
U3VyZSwgSSBndWVzcyB1c2luZyBzb21ldGhpbmcgc2ltaWxhciB0byBMaW51eCdzIHdvdWxkIGJl
IGZpbmUsIHNvIGEKPiB0YWJsZSB3aXRoIHRoZSB2ZW5kb3IgSUQsIGRldmljZSBJRCBhbmQgYSBw
b2ludGVyIHRvIGEgZnVuY3Rpb24gdG8gYmUKPiBjYWxsZWQgaW4gY2FzZSBvZiBtYXRjaD8KCllv
dSBjb3VsZCBnbyB0aGlzIGZhciwgYnV0IEkgd291bGRuJ3Q6IEZvciBub3cgYSB0YWJsZSBvZiAo
dmVuZG9yLGRldmljZSkKdHVwbGVzIHdvdWxkIHN1ZmZpY2UuIE9uY2Ugd2UgbmVlZCB0byBkZWFs
IHdpdGggZnVydGhlciBxdWlya3MsIHdlIGNvdWxkCnRoZW4gZGVjaWRlIHdoZXRoZXIgd2Ugd2Fu
dCBzb21ldGhpbmcgY2FsbGJhY2stYmFzZWQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
