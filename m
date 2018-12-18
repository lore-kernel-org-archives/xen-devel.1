From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 4/6] xen/arm: zynqmp: implement
 zynqmp_eemi
Date: Tue, 18 Dec 2018 14:36:48 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812181316250.15901@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1812171407210.15901@sstabellini-ThinkPad-X260>
 <1545084630-3873-4-git-send-email-sstabellini@kernel.org>
 <e366da30-eecf-c8dc-45c9-f3349eb11b36@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <e366da30-eecf-c8dc-45c9-f3349eb11b36@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: edgar.iglesias@xilinx.com, Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, saeed.nowshadi@xilinx.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAxOCBEZWMgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDEy
LzE3LzE4IDEwOjEwIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiArICAgIC8qIFRo
ZXNlIGNhbGxzIGFyZSBzYWZlIGFuZCBhbHdheXMgYWxsb3dlZC4gICovCj4gPiArICAgIGNhc2Ug
RUVNSV9GSUQoWllOUU1QX1NJUF9TVkNfQ0FMTF9DT1VOVCk6Cj4gPiArICAgIGNhc2UgRUVNSV9G
SUQoWllOUU1QX1NJUF9TVkNfVUlEKToKPiA+ICsgICAgY2FzZSBFRU1JX0ZJRChaWU5RTVBfU0lQ
X1NWQ19WRVJTSU9OKToKPiA+ICsgICAgY2FzZSBFRU1JX0ZJRChQTV9HRVRfVFJVU1RaT05FX1ZF
UlNJT04pOgo+ID4gKyAgICBjYXNlIEVFTUlfRklEKFBNX0dFVF9BUElfVkVSU0lPTik6Cj4gCj4g
QWJvdmUgeW91IHNheSB0aGUgY2FsbCB0byBQTV9HRVRfQVBJX1ZFUlNJT04gYXJlIHNhZmUgYW5k
IGFsd2F5cyBhbGxvd2VkLiBCdXQKPiBsb29raW5nIGF0IHRoZSBBVEYgaW1wbGVtZW50YXRpb24g
dGhlIGZpcnN0IGNhbGwgdG8gUE1fR0VUX0FQSV9WRVJTSU9OIHdpbGwKPiBlbmFibGUgSVBJIElS
US4KPiAKPiBBRkFJQ1QsIERvbTAgd2lsbCBiZSB0aGUgb25seSBkb21haW4gdG8gYWNjZXNzIElQ
SS4gU28gd2hhdCBoYXBwZW4gaWYsIGluIHRoZQo+IERvbTBsZXNzIGNhc2UsIHRoZSBndWVzdCBp
cyBib290aW5nIGJlZm9yZSBhbmQgY2FsbGluZyBQTV9HRVRfQVBJX1ZFUlNJT04/Cj4gCj4gSSBo
YXZlbid0IGxvb2tlZCBpbiBkZXB0aCB0aGUgb3RoZXIgU0lQIGZ1bmN0aW9ucyB0byBzZWUgd2hl
dGhlciB0aGVyZSBhcmUKPiBvdGhlciBwb3RlbnRpYWwgaXNzdWUuCgpPbiBYaWxpbnggTVBTb0Ms
IHRoZSBwb3dlciBtYW5hZ2VtZW50IGhhbmRsZXIgcnVucyBvbiBhIHNlcGFyYXRlCnByb2Nlc3Nv
ciAoYSBNaWNyb2JsYXplIHByb2Nlc3NvcikuIFhpbGlueCBjYWxscyBpdCAiUE1VIi4gVGhlIElQ
SSBJUlEKZW5hYmxlZCBieSBBVEYgaXMgZm9yIGl0IHRvIGNvbW11bmljYXRlIHdpdGggdGhlIFBN
VSwgaXQgc2hvdWxkIG5vdCBiZQpleHBvc2VkIHRvIHZpcnR1YWwgbWFjaGluZXMuIE5vdGhpbmcg
dG8gZG8gb24gb3VyIHNpZGUgaGVyZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
