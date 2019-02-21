From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-next v2] xen: make grant table
 configurable
Date: Thu, 21 Feb 2019 12:01:08 +0000
Message-ID: <20190221120108.m5dage7ahccwjmvy@zion.uk.xensource.com>
References: <20190118124357.19255-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y0vM=Q4=citrix.com=prvs=948a3d738=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gwn2t-0005eF-4k
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 12:01:43 +0000
Content-Disposition: inline
In-Reply-To: <20190118124357.19255-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTgsIDIwMTkgYXQgMTI6NDM6NTdQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBJbnRyb2R1Y2UgQ09ORklHX0dSQU5UX1RBQkxFLiBQcm92aWRlIHN0dWJzIGFuZCBtYWtlIHN1
cmUgeDg2IGFuZCBhcm0KPiBoeXBlcnZpc29ycyBidWlsZCB3aXRoIGdyYW50IHRhYmxlIGRpc2Fi
bGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpJ
IGtub3cgdGhpcyBwYXRjaCBjYW4gb25seSBiZSBhcHBsaWVkIGFmdGVyIHRoZSB0cmVlIGlzIHJl
b3BlbiBidXQgLi4uCgo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdHJhcHMuYyBiL3hl
bi9hcmNoL2FybS90cmFwcy5jCj4gaW5kZXggMjIxYzc2MmFkYS4uMGYxYzFiNjQzMSAxMDA2NDQK
PiAtLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS90cmFwcy5j
Cj4gQEAgLTEzOTIsNyArMTM5Miw5IEBAIHN0YXRpYyBhcm1faHlwZXJjYWxsX3QgYXJtX2h5cGVy
Y2FsbF90YWJsZVtdID0gewo+ICAgICAgSFlQRVJDQUxMX0RFUFJFQ0FURUQocGh5c2Rldl9vcF9j
b21wYXQsIDEpLAo+ICAgICAgSFlQRVJDQUxMKHN5c2N0bCwgMiksCj4gICAgICBIWVBFUkNBTEwo
aHZtX29wLCAyKSwKPiArI2lmZGVmIENPTkZJR19HUkFOVF9UQUJMRQo+ICAgICAgSFlQRVJDQUxM
KGdyYW50X3RhYmxlX29wLCAzKSwKPiArI2VuZGlmCj4gICAgICBIWVBFUkNBTEwobXVsdGljYWxs
LCAyKSwKPiAgICAgIEhZUEVSQ0FMTChwbGF0Zm9ybV9vcCwgMSksCj4gICAgICBIWVBFUkNBTExf
QVJNKHZjcHVfb3AsIDMpLAoKY2FuIEkgZ2V0IGFuIGFjayBmcm9tIG9uZSBvZiB0aGUgQXJtIG1h
aW50YWluZXJzIHNvIHRoYXQgSSBjYW4gcXVldWUgaXQKdXA/CgpUaGFua3MsCldlaS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
