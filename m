From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 4/4] xen/x86: Allow stubdom access to irq
 created for msi.
Date: Thu, 17 Jan 2019 13:32:04 +0100
Message-ID: <20190117123204.5viookl2xxoiglsy@mac>
References: <8ea00e9347ae7859a37ea421e658263a44a375fb.1547566486.git-series.marmarek@invisiblethingslab.com>
 <20190116092129.jz2cts5pwd5ckh34@mac>
 <20190116105218.GM1205@mail-itl>
 <20190116122004.byvr2bttwkttofqs@mac>
 <20190116134914.GN1205@mail-itl>
 <20190117085746.rg2vbyh3ga4aru6f@mac>
 <FB0C9893020000480063616D@prv1-mh.provo.novell.com>
 <5C406C8A020000780020EA27@prv1-mh.provo.novell.com>
 <20190117115637.mywzhrlprop6l4cq@mac>
 <5C407302020000780020EA9C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XUlP=PZ=citrix.com=prvs=913f372f9=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gk6qF-0005i3-AW
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 12:32:15 +0000
Content-Disposition: inline
In-Reply-To: <5C407302020000780020EA9C@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMTcsIDIwMTkgYXQgMDU6MjA6MThBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE3LjAxLjE5IGF0IDEyOjU2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVGh1LCBKYW4gMTcsIDIwMTkgYXQgMDQ6NTI6NDJBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDE3LjAxLjE5IGF0IDA5OjU3LCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gV2hpbGUgbm90IGFnYWluc3QgdXNpbmcgcGh5c2Rldm9w
IGlmIHdlIGFncmVlIHRoYXQgYSBuZXcgaHlwZXJjYWxsIGlzCj4gPj4gPiB0aGUgd2F5IHRvIGdv
LCBJIHdvdWxkIHByZWZlciBhIGRvbWN0bCBiZWNhdXNlIHRoaXMgaHlwZXJjYWxsIHdvdWxkCj4g
Pj4gPiBvbmx5IGJlIHVzZWQgYnkgdG9vbHN0YWNrIGNvbXBvbmVudHMsIGFuZCB0aHVzIGRvZXNu
J3QgbmVlZCB0byBiZQo+ID4+ID4gYWRkZWQgdG8gdGhlIHB1YmxpYyBzdGFibGUgQUJJIGF2YWls
YWJsZSB0byBhbGwgZ3Vlc3RzLCBldmVuIGlmIHRoZQo+ID4+ID4gZnVuY3Rpb25hbGl0eSBpcyBh
Y3R1YWxseSBsaW1pdGVkIHRvIHN0dWJkb21haW5zLgo+ID4+IAo+ID4+IEJ1dCBhIG5ldyBzdWIt
b3AgZG9lc24ndCBuZWVkIHRvIGJlIHBhcnQgb2YgdGhlIHN0YWJsZSBBQkkuCj4gPj4gU2VlIGhv
dyBlLmcuIHZhcmlvdXMgb2YgdGhlIG1lbW9yeSBzdWItb3BzIGFyZSByZXN0cmljdGVkIHRvCj4g
Pj4gYmUgdXNlZCBieSB0aGUgdG9vbCBzdGFjaywgYW5kIGhlbmNlIG5vdCByZXF1aXJlZCB0byBy
ZW1haW4KPiA+PiB1bmNoYW5nZWQuCj4gPiAKPiA+IE9oLCB0aGVuIEknbSBhbGwgaW4gZm9yIGEg
cGh5c2Rldm9wIGxpbWl0ZWQgdG8gc3R1YmRvbWFpbiBvbmx5IHVzYWdlLgo+IAo+IEhtbSwgc3R1
YmRvbWFpbiBpcyBkaWZmZXJlbnQ6IEhvdyB3b3VsZCB5b3UgbGltaXQgdGhpcyBpbiB0aGUKPiBo
ZWFkZXI/CgpPaCwgSSB3YXNuJ3QgbWVhbmluZyB0byBsaW1pdCB0aGlzIGluIHRoZSBoZWFkZXIs
IGJ1dCBpbiB0aGUKaW1wbGVtZW50YXRpb24uIEllOiBieSByZXR1cm5pbmcgYW4gZXJyb3Igd2hl
biBjYWxsZWQgZnJvbQpub24tc3R1YmRvbWFpbnMuCgpJIGRvbid0IHNlZSBhIHJlYXNvbiB0byBh
bGxvdyBub24tc3R1YmRvbWFpbnMgdG8gbWFrZSB1c2Ugb2YgdGhpcyBuZXcKaHlwZXJjYWxsIGlm
IGl0J3Mgbm90IHJlcXVpcmVkLCB0aGF0IHdvdWxkIGp1c3QgZXhwYW5kIHRoZSBhdHRhY2sKc3Vy
ZmFjZSBmb3Igbm8gZ29vZCByZWFzb24gSU1PLgoKPiBBbHNvIHN0dWIgZG9tYWlucyBhcmUgYWxs
b3dlZCB0byByZWx5IG9uIGEgc3RhYmxlCj4gaW50ZXJmYWNlLCBzbyBJJ20gYWZyYWlkIGEgZG9t
Y3RsIGlzIG91dCBvZiBzY29wZSBoZXJlIGFueXdheS4KPiBJdCBpcyBiYWQgZW5vdWdoIHRoYXQg
dGhlcmUgYXJlIGZvdXIgZG9tY3RsLXMgdmlvbGF0aW5nIHRoaXMKPiBydWxlIChzZWUgeHNtL2R1
bW15Lmg6eHNtX2RvbWN0bCgpKS4KCk9LLCBzbyB0aGVuIHRoZSBmYWN0IHRoYXQgc3R1YmRvbWFp
bnMgKFFFTVUpIHVzZSB0aGUgbm9uLXN0YWJsZSBkb21jdGwKaXMgbm90IGludGVuZGVkLCB0aGVu
IGl0J3MgZmluZSB0byBtYWtlIGl0IGEgcGh5c2Rldm9wLgoKVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
