From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: PVH backports to 4.9 and 4.8
Date: Fri, 2 Mar 2018 16:26:28 +0000
Message-ID: <20180302162628.mhyja3tgwrwxo6l2@MacBook-Pro-de-Roger.local>
References: <97dc0694-d27f-2e50-afd3-a4f7fc828f1d@kliemeck.de>
 <5f747731-2182-e485-7843-b35f2db13b23@kliemeck.de>
 <CAFLBxZYA63KU=+3SP5jqAuq_qwLK2SmHi6ATsYyBfNzvhf35gw@mail.gmail.com>
 <5A996E5F02000078001ADD13@prv-mh.provo.novell.com>
 <20180302143607.qsp2ofe6xi4bvqbi@citrix.com>
 <5A997A9602000078001ADE68@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ouj3=fy=citrix.com=prvs=592900044=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ernW0-00072k-4a
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 16:26:36 +0000
Content-Disposition: inline
In-Reply-To: <5A997A9602000078001ADE68@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, George Dunlap <dunlapg@umich.edu>, Wei Liu <Wei.Liu2@citrix.com>, Hans-Joachim Kliemeck <info@kliemeck.de>, Committers <committers@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMDIsIDIwMTggYXQgMDg6MjM6NTBBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDAyLjAzLjE4IGF0IDE1OjM2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBGcmksIE1hciAwMiwgMjAxOCBhdCAwNzozMTo0M0FNIC0wNzAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMDIuMDMuMTggYXQgMTU6MjIsIDxkdW5sYXBnQHVtaWNo
LmVkdT4gd3JvdGU6Cj4gPj4gPiBJJ2QgYmUgaW4gZmF2b3Igb2YgbWVyZ2luZyB0aGUgNC44LjNw
cmUtc2hpbS1jb21ldCBhbmQKPiA+PiA+IDQuMTAuMC1zaGltLWNvbWV0IGJyYW5jaGVzIGludG8g
c3RhZ2luZy00LjggYW5kIHN0YWdpbmctNC4xMAo+ID4+ID4gcmVzcGVjdGl2ZWx5IChhc3N1bWlu
ZyB0aGF0J3Mgc3VpdGFibGUpLiAgQXJlIHRoZXJlIGFueSBvdGhlciBmaXhlcyB0bwo+ID4+ID4g
UFZIIC8gUFZzaGltIGhvc3RpbmcgdGhhdCB3ZSdkIG5lZWQgdG8gYmFja3BvcnQgYXMgd2VsbD8K
PiA+PiAKPiA+PiBUaGF0IGRlcGVuZHMgb24gaG93IHdlbGwgdGhvc2UgYnJhbmNoZXMgaGF2ZSBi
ZWVuIG1haW50YWluZWQKPiA+PiB3cnQgZml4ZXMgcG9zdGVkIC8gYXBwbGllZCBkdXJpbmcgdGhl
IGxhc3QgY291cGxlIG9mIHdlZWtzLgo+ID4+IAo+ID4gCj4gPiBJIGNhbiBjaGVycnktcGljayBy
ZWxldmFudCBmaXhlcyB0byA0LjEwLWNvbWV0IGFuZCB0aGVuIG1lcmdlIDQuMTAtY29tZXQKPiA+
IHdpdGggNC4xMCBzdGFnaW5nLgo+IAo+IEZpbmUgd2l0aCBtZS4KPiAKPiA+IElmIHRoYXQncyBh
Z3JlZWQgd2UgY2FuIGRpc2N1c3Mgb24gd2hhdCBjcml0ZXJpYSBkbyBwYXRjaGVzIGdldCBwaWNr
ZWQKPiA+IGZvciBiYWNrcG9ydGluZy4KPiAKPiBVbnRpbCB3ZSd2ZSBzaGlwcGVkIGEgc3RhYmxl
IHZlcnNpb24gZnJvbSB0aG9zZSBicmFuY2hlcyAodG8gYmUgaG9uZXN0Cj4gSSdtIG5vdCBzdXJl
IGFib3V0IGRvaW5nIHRoaXMgZm9yIDQuOCB3aGVuIHdlIGRvbiN0IG1lYW4gdG8gZG8gaXQgZm9y
Cj4gNC45KSwKCldlIGF2b2lkZWQgNC45IGF0IHRoZSB0aW1lIGR1ZSB0byB0aGUgcHJlc3N1cmUg
b2YgZ2V0dGluZyBzb21ldGhpbmcKb3V0IGZhc3QsIEknbSBub3Qgc3VyZSBpZiBpdCB3b3VsZCBi
ZSB2ZXJ5IGNvbXBsaWNhdGVkIHRvIHBpY2sgdGhlCid0eXBlPXB2aCcgNC44IGJhY2twb3J0cyBh
bmQgYXBwbHkgdGhlbSA0LjksIEknbSBmYWlybHkgc3VyZSB0aGUgY29kZQpiYXNlIGlzIG5vdCB0
aGF0IGRpZmZlcmVudCAoYW5kIGF0IG1vc3QgdGhpcyBpcyBnb2luZyB0byBpbnZvbHZlCmRyb3Bw
aW5nIHBhdGNoZXMgZnJvbSB0aGUgNC44IGJyYW5jaCkuCgpSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
