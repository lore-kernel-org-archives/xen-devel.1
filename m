From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH] xen/x86: fix linker script to work with lld
Date: Wed, 11 Jul 2018 11:46:56 +0200
Message-ID: <20180711094656.GE26572@olila.local.net-space.pl>
References: <5B44BE0202000078001D2B93@prv1-mh.provo.novell.com>
 <20180710153509.p4o2ffk22iqsqkif@mac.bytemobile.com>
 <5B45AD2A02000078001D2F16@prv1-mh.provo.novell.com>
 <20180711082936.y6p2eluyspbhno4j@mac.bytemobile.com>
 <5B45BFFF0200008503CB1CCA@prv1-mh.provo.novell.com>
 <5B45C45902000078001D2FA0@prv1-mh.provo.novell.com>
 <20180711085556.GC26572@olila.local.net-space.pl>
 <20180711085920.dkoyvia6elgwldvg@mac.bytemobile.com>
 <20180711091105.GD26572@olila.local.net-space.pl>
 <20180711093640.4dnvn7gbdsioj6bt@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=argw=j3=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1fdBiG-0005wc-MP
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 09:47:08 +0000
Content-Disposition: inline
In-Reply-To: <20180711093640.4dnvn7gbdsioj6bt@mac.bytemobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMTEsIDIwMTggYXQgMTE6MzY6NDBBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIEp1bCAxMSwgMjAxOCBhdCAxMToxMTowNUFNICswMjAwLCBEYW5p
ZWwgS2lwZXIgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAxMSwgMjAxOCBhdCAxMDo1OToyMEFNICsw
MjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gPiBPbiBXZWQsIEp1bCAxMSwgMjAxOCBh
dCAxMDo1NTo1NkFNICswMjAwLCBEYW5pZWwgS2lwZXIgd3JvdGU6Cj4gPiA+ID4gSWYgdGhpcyB3
b3JrcyBpbiBhbGwgY2FzZXMgKGJ1aWxkIHdpdGggdG9vbHMgd2l0aCBhbmQgd2l0aG91dCBQRSBz
dXBwb3J0LAo+ID4gPiA+IHhlbi5lZmkgYW5kIHhlbi5neiB2aWEgTXVsdGlib290MiBwcm90byBi
b290IGNvcnJlY3RseSBvbiBFRkkgcGxhdGZvcm1zLAo+ID4gPiA+IGV0Yy4pIHRoZW4gSSBhbSBP
SyB3aXRoIHRoYXQuCj4gPiA+Cj4gPiA+IFllcywgSSd2ZSB0ZXN0ZWQgaXQgd2l0aCBib3RoIGxp
bmtlcnMgKFBFIGNhcGFibGUgYW5kIGluY2FwYWJsZSkgYW5kCj4gPiA+IGl0IHdvcmtzLgo+ID4K
PiA+IEdyZWF0ISBXaGF0IGFib3V0IGJvb3Qgb24gRUZJIHBsYXRmb3Jtcz8gUHJvYmFibHkgaXQg
d29ya3MgYnV0IEkgd291bGQKPiA+IGxpa2UgdG8gYmUgc3VyZS4KPgo+IEknbSBhZnJhaWQgSSBk
b24ndCBoYXZlIGFueSBBVE0uIElmIEkgcG9zdCB0aGUgY29tcGxldGUgcGF0Y2gsIGNvdWxkCj4g
eW91IGdpdmUgaXQgYSB0cnkgb24gYSBFRkkgcGxhdGZvcm0/CgpObyBwcm9ibGVtLCB3aWxsIGRv
LgoKRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
