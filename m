From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/4] firmware/seabios: fix build on systems
 with non GNU toolchains
Date: Mon, 2 Jul 2018 12:23:26 +0200
Message-ID: <20180702102326.rjqm2m3veswjflbh@mac.bytemobile.com>
References: <20180702082826.90272-1-roger.pau@citrix.com>
 <20180702082826.90272-2-roger.pau@citrix.com>
 <20180702093215.mkhacckcanrct5xg@citrix.com>
 <20180702093628.uluq3lvb2jr3v5i2@mac.bytemobile.com>
 <20180702094244.5i5kpac4vrfnfdii@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n1b/=js=citrix.com=prvs=714d6e1f6=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fZvzb-0002GX-Sa
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 10:23:35 +0000
Content-Disposition: inline
In-Reply-To: <20180702094244.5i5kpac4vrfnfdii@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMDIsIDIwMTggYXQgMTA6NDI6NDRBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEp1bCAwMiwgMjAxOCBhdCAxMTozNjoyOEFNICswMjAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gTW9uLCBKdWwgMDIsIDIwMTggYXQgMTA6MzI6MTVBTSArMDEwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gT24gTW9uLCBKdWwgMDIsIDIwMTggYXQgMTA6Mjg6MjNBTSAr
MDIwMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gPiBbLi4uXQo+ID4gPiA+ICAKPiA+ID4g
PiAgc3VidHJlZS1mb3JjZS11cGRhdGU6Cj4gPiA+ID4gQEAgLTEyOCwzICsxMjgsNiBAQCBlbmRp
Zgo+ID4gPiA+ICBzdWJ0cmVlLWZvcmNlLXVwZGF0ZS1hbGw6Cj4gPiA+ID4gIAkkKE1BS0UpIHNl
YWJpb3MtZGlyLWZvcmNlLXVwZGF0ZQo+ID4gPiA+ICAJJChNQUtFKSBvdm1mLWRpci1mb3JjZS11
cGRhdGUKPiA+ID4gPiArCj4gPiA+ID4gK3N1YmRpci1hbGwtc2VhYmlvcy1kaXI6IHNlYWJpb3Mt
ZGlyCj4gPiA+ID4gKwkkKE1BS0UpIC1DICQ8IENDPSQoU0VBQklPU0NDKSBMRD0kKFNFQUJJT1NM
RCkgUFlUSE9OPSQoUFlUSE9OKSBhbGw7Cj4gPiA+IAo+ID4gPiBUaGVyZSBpcyBhIHBhdHRlcm4g
cnVsZSBpbiBSdWxlcy5taywgc28gSSB3b3VsZCB2ZXJ5IG11Y2ggYXZvaWQgaGF2aW5nCj4gPiA+
IGl0IHJlZGVmaW5lZC4KPiA+IAo+ID4gSSBrbm93LCBidXQgSSBuZWVkIHRvIHJlZGVmaW5lIGl0
IHNvIEkgY2FuIHBhc3MgdGhlIGV4dHJhIG9wdGlvbnMuIEkKPiA+IGRvbid0IHNlZSBhbnkgYmV0
dGVyIHdheSB0byBkbyB0aGlzIFRCSC4KPiAKPiBPaCwgY2FuIHlvdSB0cnkgdGhlIGZvbGxvd2lu
ZyB0byBzZWUgaWYgaXQgd29ya3M/Cj4gCj4gICBzdWJkaXItYWxsLXNlYWJpb3MtZGlyOiBDQz0k
KFNFQUJJT1NDQykgTEQ9JChTRUFCSU9TTEQpCgpUaGlzIHNhZGx5IGRvZXNuJ3Qgc2VlbSB0byB3
b3JrLiBJIGFzc3VtZSB0aGlzIGlzIHNvbWUga2luZCBvZiB3ZWlyZApiZWhhdmlvdXIgb2YgdGhl
IFhlbiBidWlsZCBzeXN0ZW0/IElzIHRoaXMgZHVlIHRvIHRoZSBwYXR0ZXIgcnVsZXMKdGhhdCB0
aGUgYnVpbGQgc3lzdGVtIHVzZXM/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
