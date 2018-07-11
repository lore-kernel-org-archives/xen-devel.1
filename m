From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen/x86: fix linker script to work with lld
Date: Wed, 11 Jul 2018 11:36:40 +0200
Message-ID: <20180711093640.4dnvn7gbdsioj6bt@mac.bytemobile.com>
References: <20180710134954.twd2cs6hhdfqumkq@mac.bytemobile.com>
 <5B44BE0202000078001D2B93@prv1-mh.provo.novell.com>
 <20180710153509.p4o2ffk22iqsqkif@mac.bytemobile.com>
 <5B45AD2A02000078001D2F16@prv1-mh.provo.novell.com>
 <20180711082936.y6p2eluyspbhno4j@mac.bytemobile.com>
 <5B45BFFF0200008503CB1CCA@prv1-mh.provo.novell.com>
 <5B45C45902000078001D2FA0@prv1-mh.provo.novell.com>
 <20180711085556.GC26572@olila.local.net-space.pl>
 <20180711085920.dkoyvia6elgwldvg@mac.bytemobile.com>
 <20180711091105.GD26572@olila.local.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ebcd=j3=citrix.com=prvs=7236e92fb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fdBYk-0004qY-QX
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 09:37:18 +0000
Content-Disposition: inline
In-Reply-To: <20180711091105.GD26572@olila.local.net-space.pl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMTEsIDIwMTggYXQgMTE6MTE6MDVBTSArMDIwMCwgRGFuaWVsIEtpcGVyIHdy
b3RlOgo+IE9uIFdlZCwgSnVsIDExLCAyMDE4IGF0IDEwOjU5OjIwQU0gKzAyMDAsIFJvZ2VyIFBh
dSBNb25uw6kgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAxMSwgMjAxOCBhdCAxMDo1NTo1NkFNICsw
MjAwLCBEYW5pZWwgS2lwZXIgd3JvdGU6Cj4gPiA+IElmIHRoaXMgd29ya3MgaW4gYWxsIGNhc2Vz
IChidWlsZCB3aXRoIHRvb2xzIHdpdGggYW5kIHdpdGhvdXQgUEUgc3VwcG9ydCwKPiA+ID4geGVu
LmVmaSBhbmQgeGVuLmd6IHZpYSBNdWx0aWJvb3QyIHByb3RvIGJvb3QgY29ycmVjdGx5IG9uIEVG
SSBwbGF0Zm9ybXMsCj4gPiA+IGV0Yy4pIHRoZW4gSSBhbSBPSyB3aXRoIHRoYXQuCj4gPgo+ID4g
WWVzLCBJJ3ZlIHRlc3RlZCBpdCB3aXRoIGJvdGggbGlua2VycyAoUEUgY2FwYWJsZSBhbmQgaW5j
YXBhYmxlKSBhbmQKPiA+IGl0IHdvcmtzLgo+IAo+IEdyZWF0ISBXaGF0IGFib3V0IGJvb3Qgb24g
RUZJIHBsYXRmb3Jtcz8gUHJvYmFibHkgaXQgd29ya3MgYnV0IEkgd291bGQKPiBsaWtlIHRvIGJl
IHN1cmUuCgpJJ20gYWZyYWlkIEkgZG9uJ3QgaGF2ZSBhbnkgQVRNLiBJZiBJIHBvc3QgdGhlIGNv
bXBsZXRlIHBhdGNoLCBjb3VsZAp5b3UgZ2l2ZSBpdCBhIHRyeSBvbiBhIEVGSSBwbGF0Zm9ybT8K
ClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
