From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 4/4] xen/x86: Allow stubdom access to irq
 created for msi.
Date: Thu, 17 Jan 2019 12:56:37 +0100
Message-ID: <20190117115637.mywzhrlprop6l4cq@mac>
References: <cover.f56cb3033143af6e9a0aeeaf33eb912fa5761983.1547566486.git-series.marmarek@invisiblethingslab.com>
 <8ea00e9347ae7859a37ea421e658263a44a375fb.1547566486.git-series.marmarek@invisiblethingslab.com>
 <20190116092129.jz2cts5pwd5ckh34@mac>
 <20190116105218.GM1205@mail-itl>
 <20190116122004.byvr2bttwkttofqs@mac>
 <20190116134914.GN1205@mail-itl>
 <20190117085746.rg2vbyh3ga4aru6f@mac>
 <FB0C9893020000480063616D@prv1-mh.provo.novell.com>
 <5C406C8A020000780020EA27@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XUlP=PZ=citrix.com=prvs=913f372f9=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gk6Hv-0001FJ-Sc
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 11:56:47 +0000
Content-Disposition: inline
In-Reply-To: <5C406C8A020000780020EA27@prv1-mh.provo.novell.com>
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

T24gVGh1LCBKYW4gMTcsIDIwMTkgYXQgMDQ6NTI6NDJBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE3LjAxLjE5IGF0IDA5OjU3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gV2hpbGUgbm90IGFnYWluc3QgdXNpbmcgcGh5c2Rldm9wIGlmIHdlIGFncmVlIHRo
YXQgYSBuZXcgaHlwZXJjYWxsIGlzCj4gPiB0aGUgd2F5IHRvIGdvLCBJIHdvdWxkIHByZWZlciBh
IGRvbWN0bCBiZWNhdXNlIHRoaXMgaHlwZXJjYWxsIHdvdWxkCj4gPiBvbmx5IGJlIHVzZWQgYnkg
dG9vbHN0YWNrIGNvbXBvbmVudHMsIGFuZCB0aHVzIGRvZXNuJ3QgbmVlZCB0byBiZQo+ID4gYWRk
ZWQgdG8gdGhlIHB1YmxpYyBzdGFibGUgQUJJIGF2YWlsYWJsZSB0byBhbGwgZ3Vlc3RzLCBldmVu
IGlmIHRoZQo+ID4gZnVuY3Rpb25hbGl0eSBpcyBhY3R1YWxseSBsaW1pdGVkIHRvIHN0dWJkb21h
aW5zLgo+IAo+IEJ1dCBhIG5ldyBzdWItb3AgZG9lc24ndCBuZWVkIHRvIGJlIHBhcnQgb2YgdGhl
IHN0YWJsZSBBQkkuCj4gU2VlIGhvdyBlLmcuIHZhcmlvdXMgb2YgdGhlIG1lbW9yeSBzdWItb3Bz
IGFyZSByZXN0cmljdGVkIHRvCj4gYmUgdXNlZCBieSB0aGUgdG9vbCBzdGFjaywgYW5kIGhlbmNl
IG5vdCByZXF1aXJlZCB0byByZW1haW4KPiB1bmNoYW5nZWQuCgpPaCwgdGhlbiBJJ20gYWxsIGlu
IGZvciBhIHBoeXNkZXZvcCBsaW1pdGVkIHRvIHN0dWJkb21haW4gb25seSB1c2FnZS4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
