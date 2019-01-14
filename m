From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] tools/firmware: update OVMF Makefile
Date: Mon, 14 Jan 2019 18:22:48 +0000
Message-ID: <20190114182248.GC1271@perard.uk.xensource.com>
References: <20181128174333.15672-1-wei.liu2@citrix.com>
 <20190113201744.GA11328@aepfle.de>
 <20190114112857.dxmlt7noy53asro5@zion.uk.xensource.com>
 <20190114124852.3d91d25f.olaf@aepfle.de>
 <20190114171156.GB1271@perard.uk.xensource.com>
 <20190114182744.42296177.olaf@aepfle.de>
 <20190114174457.mlrzxcjtyklim5gc@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ahuc=PW=citrix.com=prvs=9106bec1f=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gj6u8-0001ki-Lf
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 18:24:08 +0000
Content-Disposition: inline
In-Reply-To: <20190114174457.mlrzxcjtyklim5gc@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMTQsIDIwMTkgYXQgMDU6NDQ6NTdQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEphbiAxNCwgMjAxOSBhdCAwNjoyNzo0NFBNICswMTAwLCBPbGFmIEhlcmluZyB3
cm90ZToKPiA+IEFtIE1vbiwgMTQgSmFuIDIwMTkgMTc6MTE6NTYgKzAwMDAKPiA+IHNjaHJpZWIg
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ogo+ID4gCj4gPiA+IEkg
dGhpbmsgaXQncyBmaW5lIHRvIGtlZXAgdGhlIGN1cnJlbnQgYHN1Ym1vZHVsZSB1cGRhdGVgIGNh
bGwgd2hlcmUgaXQKPiA+ID4gaXMuIFdlIGNvdWxkIGp1c3QgbWFrZSBpdCBjaGVjayB0aGF0IGl0
J3MgYW4gYWN0dWFsIGdpdCB3b3JrdHJlZSBieQo+ID4gPiBjaGVja2luZyBmb3IgdGhlIHByZXNl
bmNlIG9mICIuZ2l0IiAoZmlsZSBvciBkaXJlY3RvcnkpIGJlZm9yZSBleGVjdXRpbmcKPiA+ID4g
Z2l0Lgo+ID4gPiAKPiA+ID4gV291bGQgdGhhdCBiZSBnb29kIGVub3VnaD8KPiA+IAo+ID4gTWF5
YmUuIFdoYXRldmVyIHdvcmtzIHdpdGggZW52IFdHRVQvR0lUPS9iaW4vZmFsc2UgLi9jb25maWd1
cmUgJG9wdGlvbnMuCj4gPiAKPiAKPiBDYW4geW91IHRyeSB0aGlzPwo+IAo+IGRpZmYgLS1naXQg
YS90b29scy9maXJtd2FyZS9vdm1mLW1ha2VmaWxlIGIvdG9vbHMvZmlybXdhcmUvb3ZtZi1tYWtl
ZmlsZQo+IGluZGV4IDNkZTJmYzAzMDAuLjY0OTQ4MmJjYTggMTAwNjQ0Cj4gLS0tIGEvdG9vbHMv
ZmlybXdhcmUvb3ZtZi1tYWtlZmlsZQo+ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL292bWYtbWFrZWZp
bGUKPiBAQCAtMTYsNyArMTYsNyBAQCBhbGw6IGJ1aWxkCj4gCj4gIC5QSE9OWTogYnVpbGQKPiAg
IGJ1aWxkOgo+ICAgLSAgICAgICAkKEdJVCkgc3VibW9kdWxlIHVwZGF0ZSAtLWluaXQgLS1yZWN1
cnNpdmUKPiAgICsgICAgICAgWyAtZCAuZ2l0IF0gJiYgJChHSVQpIHN1Ym1vZHVsZSB1cGRhdGUg
LS1pbml0IC0tcmVjdXJzaXZlCgpQbGVhc2UsIHVzZSAtZSBvciAtciwgaXQgaXMgcGVyZmVjdGx5
IHJlYXNvbmFibGUgdG8gaGF2ZSAuZ2l0IGJlZW4gYQpmaWxlLiAoc29tZW9uZSBjb3VsZCB1c2Ug
YGdpdCB3b3JrdHJlZWAsIG9yIGV2ZW4gYSBzdWJtb2R1bGUpCgpBbHNvLCBJIHRoaW5rIHdlIHNo
b3VsZCB1c2UgYGlmYCwgQXMgbWFrZSBtdXN0IG5vdCBmYWlsIGlmIGl0IGlzbid0IGEKZ2l0IHdv
cmt0cmVlLiAob3IgInx8IHRydWUiIG9yICJ8fDoiLCBidXQgdGhhdCB3b3VsZCBoaWRlIGdpdCBm
YWlsdXJlcy4pCgo+ICAgICAgICAgICBPdm1mUGtnL2J1aWxkLnNoIC1hIFg2NCAtYiAkKFRBUkdF
VCkgLW4gNAo+IAkgICAgICAgICAgY3AgQnVpbGQvT3ZtZlg2NC8kKFRBUkdFVClfR0NDKi9GVi9P
Vk1GLmZkIG92bWYuYmluCj4gCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
