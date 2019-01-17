From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH RFC for next] xen: make grant table
 configurable
Date: Thu, 17 Jan 2019 09:41:24 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901170939280.18561@sstabellini-ThinkPad-X260>
References: <20190117123054.809-1-wei.liu2@citrix.com>
 <alpine.DEB.2.10.1901170936190.18561@sstabellini-ThinkPad-X260>
 <20190117173807.fvmvakv2j7hqttkr@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TIIl=PZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gkBfx-0000M6-4R
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 17:41:57 +0000
In-Reply-To: <20190117173807.fvmvakv2j7hqttkr@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, ed@packet.net, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxNyBKYW4gMjAxOSwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIEphbiAxNywgMjAx
OSBhdCAwOTozNjo1N0FNIC0wODAwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBPbiBU
aHUsIDE3IEphbiAyMDE5LCBXZWkgTGl1IHdyb3RlOgo+ID4gPiBJbnRyb2R1Y2UgQ09ORklHX0dS
QU5UX1RBQkxFLiBQcm92aWRlIHN0dWJzIGFuZCBtYWtlIHN1cmUgeDg2IGFuZCBhcm0KPiA+ID4g
aHlwZXJ2aXNvcnMgYnVpbGQgd2l0aCBncmFudCB0YWJsZSBkaXNhYmxlZC4KPiA+IAo+ID4gTG9v
a3MgbGlrZSBhIGdvb2QgaWRlYS4KPiA+IAo+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiA+IC0tLQo+ID4gPiBJIGRpZCB0aGlzIHdoZW4g
SSB3b3JrZWQgb24gc3BsaXR0aW5nIFBWIGFuZCBIVk0gYW5kIHRob3VnaHQgdGhpcwo+ID4gPiBt
aWdodCBiZSB1c2VmdWwgYW5kIGl0IHdhcyBzaW1wbGUgZW5vdWdoIHRvIGdldCBkb25lLgo+ID4g
PiAKPiA+ID4gUkZDIGJlY2F1c2UgSSBjYW4gZW52aXNhZ2Ugc29tZSBjb25maWd1cmF0aW9ucyBp
biB0aGUgZGlzdGFudCBmdXR1cmUKPiA+ID4gZG8gYXdheSB3aXRoIGdyYW50IHRhYmxlIGFuZCBl
dmVudCBjaGFubmVsLiBUaGVyZSBpcyBzbWFsbCBhIGJlbmVmaXQKPiA+ID4gdG8gY29uc2lkZXIg
YWNjZXB0aW5nIHRoaXMgcGF0Y2ggbm93IHNvIHRoYXQgR2l0bGFiJ3MgcmFuZGNvbmYgYnVpbGQK
PiA+ID4gY2FuIHN0YXJ0IHRlc3Rpbmcgd2l0aCBncmFudCB0YWJsZSB0dXJuZWQgb2ZmIHJpZ2h0
IGF3YXkuCj4gPiAKPiA+IENhbiBHaXRsYWIgZG8gQXJtIGh5cGVydmlzb3IgYnVpbGRzPwo+IAo+
IFllcy4gSSBob29rZWQgdXAgYSBib3ggZnJvbSBXb3Jrc09uQXJtIGZvciBBcm02NCBidWlsZHMu
CgpWZXJ5IG5pY2UhISBZb3Ugc2hvdWxkIHdyaXRlIGEgYmxvZyBwb3N0IG9yIHNvbWV0aGluZyBh
Ym91dCBpdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
