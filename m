From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3] tools: add option to explicitly enable
 VirtFS in QEMU build
Date: Wed, 19 Sep 2018 16:03:18 +0100
Message-ID: <20180919150318.si6nyvul4yen2pmr@zion.uk.xensource.com>
References: <20180911150108.1190-1-paul.durrant@citrix.com>
 <28570a1e78fa40b5a0f9bdc2ea7f315b@AMSPEX02CL03.citrite.net>
 <alpine.DEB.2.10.1809180946010.5603@sstabellini-ThinkPad-X260>
 <c7f8ccb890f04a7c9765ac1c42c18fd3@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wwm0=mb=citrix.com=prvs=79313d28f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2e0m-0006QU-8U
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 15:03:28 +0000
Content-Disposition: inline
In-Reply-To: <c7f8ccb890f04a7c9765ac1c42c18fd3@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTgsIDIwMTggYXQgMDU6NTc6NTdQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFN0ZWZhbm8gU3Rh
YmVsbGluaSBbbWFpbHRvOnNzdGFiZWxsaW5pQGtlcm5lbC5vcmddCj4gPiBTZW50OiAxOCBTZXB0
ZW1iZXIgMjAxOCAxNzo0Ngo+ID4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJp
eC5jb20+Cj4gPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBBbmRyZXcgQ29v
cGVyCj4gPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3Jn
ZS5EdW5sYXBAY2l0cml4LmNvbT47IElhbgo+ID4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4
LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEp1bGllbgo+ID4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCj4gPiA8a29ucmFk
LndpbGtAb3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz47IFRpbQo+ID4gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+Cj4gPiBTdWJqZWN0OiBSRTogW1BBVENIIHYzXSB0b29sczogYWRkIG9wdGlv
biB0byBleHBsaWNpdGx5IGVuYWJsZSBWaXJ0RlMgaW4KPiA+IFFFTVUgYnVpbGQKPiA+IAo+ID4g
T24gVHVlLCAxOCBTZXAgMjAxOCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+ID4gPiBQaW5nPwo+ID4g
Cj4gPiBMb29rcyBnb29kIHRvIG1lCj4gCj4gSSdsbCB0YWtlIHRoYXQgYXMgYW4gUi1iIHRoZW4g
Oi0pCgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCk5vdGUgdG8gc2Vs
ZjogcmVydW4gYXV0b2dlbi5zaCB3aGVuIGFwcGx5aW5nIHRoaXMgcGF0Y2guCgpXZWkuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
