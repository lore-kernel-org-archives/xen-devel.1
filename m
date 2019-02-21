From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-next v2] xen: make grant table
 configurable
Date: Thu, 21 Feb 2019 12:03:56 +0000
Message-ID: <20190221120356.sy3jd4arq7aksvn2@zion.uk.xensource.com>
References: <20190118124357.19255-1-wei.liu2@citrix.com>
 <20190221120108.m5dage7ahccwjmvy@zion.uk.xensource.com>
 <bc7f880f-7e4b-5608-a01d-bbec7144a157@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y0vM=Q4=citrix.com=prvs=948a3d738=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gwn5A-0005vC-RL
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 12:04:04 +0000
Content-Disposition: inline
In-Reply-To: <bc7f880f-7e4b-5608-a01d-bbec7144a157@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMjEsIDIwMTkgYXQgMTI6MDI6MTNQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IAo+IAo+IE9uIDIxLzAyLzIwMTkgMTI6MDEsIFdlaSBMaXUgd3JvdGU6Cj4gPiBPbiBG
cmksIEphbiAxOCwgMjAxOSBhdCAxMjo0Mzo1N1BNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+ID4g
PiBJbnRyb2R1Y2UgQ09ORklHX0dSQU5UX1RBQkxFLiBQcm92aWRlIHN0dWJzIGFuZCBtYWtlIHN1
cmUgeDg2IGFuZCBhcm0KPiA+ID4gaHlwZXJ2aXNvcnMgYnVpbGQgd2l0aCBncmFudCB0YWJsZSBk
aXNhYmxlZC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+Cj4gPiAKPiA+IEkga25vdyB0aGlzIHBhdGNoIGNhbiBvbmx5IGJlIGFwcGxpZWQg
YWZ0ZXIgdGhlIHRyZWUgaXMgcmVvcGVuIGJ1dCAuLi4KPiA+IAo+ID4gPiAKPiA+ID4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS90cmFwcy5jIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPiA+ID4g
aW5kZXggMjIxYzc2MmFkYS4uMGYxYzFiNjQzMSAxMDA2NDQKPiA+ID4gLS0tIGEveGVuL2FyY2gv
YXJtL3RyYXBzLmMKPiA+ID4gKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPiA+ID4gQEAgLTEz
OTIsNyArMTM5Miw5IEBAIHN0YXRpYyBhcm1faHlwZXJjYWxsX3QgYXJtX2h5cGVyY2FsbF90YWJs
ZVtdID0gewo+ID4gPiAgICAgICBIWVBFUkNBTExfREVQUkVDQVRFRChwaHlzZGV2X29wX2NvbXBh
dCwgMSksCj4gPiA+ICAgICAgIEhZUEVSQ0FMTChzeXNjdGwsIDIpLAo+ID4gPiAgICAgICBIWVBF
UkNBTEwoaHZtX29wLCAyKSwKPiA+ID4gKyNpZmRlZiBDT05GSUdfR1JBTlRfVEFCTEUKPiA+ID4g
ICAgICAgSFlQRVJDQUxMKGdyYW50X3RhYmxlX29wLCAzKSwKPiA+ID4gKyNlbmRpZgo+ID4gPiAg
ICAgICBIWVBFUkNBTEwobXVsdGljYWxsLCAyKSwKPiA+ID4gICAgICAgSFlQRVJDQUxMKHBsYXRm
b3JtX29wLCAxKSwKPiA+ID4gICAgICAgSFlQRVJDQUxMX0FSTSh2Y3B1X29wLCAzKSwKPiA+IAo+
ID4gY2FuIEkgZ2V0IGFuIGFjayBmcm9tIG9uZSBvZiB0aGUgQXJtIG1haW50YWluZXJzIHNvIHRo
YXQgSSBjYW4gcXVldWUgaXQKPiA+IHVwPwo+IAo+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgoKVGhhbmsgeW91IQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
