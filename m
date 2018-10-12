From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 13/17] x86: don't create Dom0 if neither PV
 nor HVM is available
Date: Fri, 12 Oct 2018 17:02:22 +0100
Message-ID: <20181012160222.3kgr2rifqgqqcupu@zion.uk.xensource.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
 <9f342296979cad0b5dea238c30a082428f25254f.1538667753.git-series.wei.liu2@citrix.com>
 <5BC0B9EB02000078001F1145@prv1-mh.provo.novell.com>
 <d6dd5b87-b104-ec2e-d48a-533e94adfe64@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zta5=my=citrix.com=prvs=8166c57ff=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gAztS-0001I0-Vq
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 16:02:27 +0000
Content-Disposition: inline
In-Reply-To: <d6dd5b87-b104-ec2e-d48a-533e94adfe64@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMTIsIDIwMTggYXQgMDQ6Mjg6MjFQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxMi8xMC8xOCAxNjoxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+PiBPbiAw
NC4xMC4xOCBhdCAxNzo0MywgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+IFRoaXMg
d2lsbCBnaXZlIHVzIGEgWGVuIHNldHRpbmcgaW4gaWRsZSBsb29wLiBUaGlzIGRvZXNuJ3QgaGF2
ZQo+ID4+IHByYWN0aWNhbCB1c2UgZXhjZXB0IGZvciBkZWJ1Z2dpbmcgcHVycG9zZS4KPiA+IEht
bSwgdGhhdCdzIGFuIGFjY2VwdGFibGUgYWx0ZXJuYXRpdmUgdG8gdGhlIHBhbmljKCkgdmFyaWFu
dCwgYnV0Cj4gPiBJJ2Qgc3RpbGwgcHJlZmVyIHRoYXQgb25lLiBBZ2FpbiAtIGxldCdzIHNlZSBp
ZiBBbmRyZXcgaGFzIGFuIG9waW5pb24KPiA+IGVpdGhlciB3YXkuCj4gCj4gSSB0aGluayB0aGF0
LCBmb3IgdGhlIHB1cnBvc2Ugb2Yga2VlcGluZyBvdXIgaW50ZXJmYWNlcyBjbGVhbiwgYmVpbmcK
PiBhYmxlIHRvIGNvbXBpbGUgd2l0aG91dCBQViBhbmQgd2l0aG91dCBIVk0gaXMgYSB1c2VmdWwg
cHJvcGVydHkKPiAoZXNwZWNpYWxseSBhcyByYW5kY29uZmlnIHNob3VsZCBoaXQgaXQgb25lIGlu
IGV2ZXJ5IDQgY2FzZXMpLgo+IAo+IEkndmUgc3BlY2lmaWNhbGx5IG5lZWRlZCB0byBoYXZlIG5v
IGRvbTAgZm9yIGNlcnRhaW4gZGVidWdnaW5nIGluIHRoZQo+IHBhc3QuwqAgKFRoZSBIUEVUIHNl
cmllcyB0byBmaXggdGhlIGJyb2tlbiBNU0kgaGFuZGxlciwgd2hpY2ggSSByZWFsaXNlCj4gc3Rp
bGwgaGFzbid0IG1hZGUgaXRzIHdheSB1cHN0cmVhbSB5ZXQuKQo+IAo+IEknbSBsZXNzIGNlcnRh
aW4gaG93ZXZlciBpZiBpbXBsZW1lbnRpbmcgaXQgbGlrZSB0aGlzIGlzIHdpc2UuwqAgSQo+IGlt
cGxlbWVudGVkIGl0IHdpdGggYSAibm9kb20wIiBjb21tYW5kIGxpbmUgcGFyYW1ldGVyLCBhbmQg
bGVmdCB0aGUgcmVzdAo+IG9mIHRoZSBmdW5jdGlvbmFsaXR5IGludGFjdC4KPiAKPiBJbiBwYXJ0
aWN1bGFyLCBvbmUgZnV6emluZyBpZGVhIEkgaGF2ZSBpcyB0byBoYXZlIGEgdGlueSBBRkwgc3R1
YiBvbiB0aGUKPiBlbmQgb2YgdGhlIHNlcmlhbCBwb3J0LCBhdCB3aGljaCBwb2ludCwgaGF2aW5n
IG5vIGRvbTAgYnV0IFBWIGFuZCBIVk0KPiBmdWxseSBjb21waWxlZCBpbiB3b3VsZCBiZSB0aGUg
aWRlYWwgcG9zaXRpb24uCj4gCj4gSSdtIHNvcnJ5IGlmIHRoaXMgaXNuJ3QgbmVjZXNzYXJpbHkg
YSB2ZXJ5IGhlbHBmdWwgYW5zd2VyLsKgIEknZCBiZQo+IHRlbXB0ZWQgdG8gZHJvcCB0aGlzIHBh
dGNoIGZvciBub3csIGFuZCBsZXQgdGhlIGZpcnN0IHBlcnNvbiB3aXRoIGEKPiBjb25jcmV0ZSB1
c2VjYXNlIHRvIGRlY2lkZSBleGFjdGx5IGhvdyBhIG5vLWRvbTAgc3lzdGVtIHdvdWxkIGxvb2su
CgpTdXJlLiBJIGRvbid0IG1pbmQgZHJvcHBpbmcgdGhpcyBwYXRjaC4KCldlaS4KCj4gCj4gfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
