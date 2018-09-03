From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 17/23] x86/mm: put
 paging_update_nestedmode under CONFIG_HVM
Date: Mon, 03 Sep 2018 08:48:23 -0600
Message-ID: <5B8D49B702000078001E4AE6@prv1-mh.provo.novell.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <4f2a5de72552edce4bafe5d049ee89a18531ed1f.1535285866.git-series.wei.liu2@citrix.com>
 <5B8528ED02000078001E2870@prv1-mh.provo.novell.com>
 <20180830074226.qfcxcwllii4cyanz@citrix.com>
 <5B87AC5902000078001E36A7@prv1-mh.provo.novell.com>
 <20180903142701.77qmhjoiep6film7@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ymad=lr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fwq9U-0007o1-TY
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 14:48:28 +0000
In-Reply-To: <20180903142701.77qmhjoiep6film7@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA5LjE4IGF0IDE2OjI3LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBBdWcgMzAsIDIwMTggYXQgMDI6MzU6MzdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAzMC4wOC4xOCBhdCAwOTo0MiwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IE9uIFR1ZSwgQXVnIDI4LCAyMDE4IGF0IDA0OjUwOjIxQU0gLTA2MDAsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+PiA+PiA+Pj4gT24gMjYuMDguMTggYXQgMTQ6MTksIDx3ZWkubGl1MkBj
aXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMK
Pj4gPj4gPiArKysgYi94ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMKPj4gPj4gPiBAQCAtOTE5LDYg
KzkxOSw3IEBAIGNvbnN0IHN0cnVjdCBwYWdpbmdfbW9kZSAqcGFnaW5nX2dldF9tb2RlKHN0cnVj
dCB2Y3B1IAo+PiA+ICp2KQo+PiA+PiA+ICAgICAgcmV0dXJuIHBhZ2luZ19nZXRfbmVzdGVkbW9k
ZSh2KTsKPj4gPj4gPiAgfQo+PiA+PiA+ICAKPj4gPj4gPiArI2lmZGVmIENPTkZJR19IVk0KPj4g
Pj4gPiAgdm9pZCBwYWdpbmdfdXBkYXRlX25lc3RlZG1vZGUoc3RydWN0IHZjcHUgKnYpCj4+ID4+
ID4gIHsKPj4gPj4gPiAgICAgIEFTU0VSVChuZXN0ZWRodm1fZW5hYmxlZCh2LT5kb21haW4pKTsK
Pj4gPj4gPiBAQCAtOTMwLDYgKzkzMSw3IEBAIHZvaWQgcGFnaW5nX3VwZGF0ZV9uZXN0ZWRtb2Rl
KHN0cnVjdCB2Y3B1ICp2KQo+PiA+PiA+ICAgICAgICAgIHYtPmFyY2gucGFnaW5nLm5lc3RlZG1v
ZGUgPSBOVUxMOwo+PiA+PiA+ICAgICAgaHZtX2FzaWRfZmx1c2hfdmNwdSh2KTsKPj4gPj4gPiAg
fQo+PiA+PiA+ICsjZW5kaWYKPj4gPj4gCj4+ID4+IEp1c3QgYSBjb25zaWRlcmF0aW9uIChubyBv
YmplY3Rpb24pOiBXb3VsZCBpdCBiZSB3b3J0aHdoaWxlIHRvCj4+ID4+IGludHJvZHVjZSBDT05G
SUdfTkVTVEVEX0hWTSBhdCB0aGUgc2FtZSB0aW1lIChmb3Igbm93IGhhcmQKPj4gPj4gY29kZWQg
dG8gWSwgYW5kIG9mIGNvdXJzZSBkZXBlbmRpbmcgb24gSFZNKSB0byBhdm9pZCBoYXZpbmcgdG8K
Pj4gPj4gdG91Y2ggYWxsIHN1Y2ggcGxhY2VzIGEgc2Vjb25kIHRpbWUgbGF0ZXIgb24/Cj4+ID4g
Cj4+ID4gSWYgd2UgcGxhbiB0byBtYWtlIG5lc3RlZCBodm0gY29uZmlndXJhYmxlIGluIHRoZSBm
dXR1cmUsIHRoYXQgd291bGQgYmUKPj4gPiBhIHdvcnRod2hpbGUgdGhpbmcgdG8gZG87IG90aGVy
d2lzZSBpdCBpcyBqdXN0IGFub3RoZXIgY29uY2VwdCB0aGF0Cj4+ID4gdXNlcnMgbmVlZCB0byBj
YXJlIGFib3V0LCB3aGljaCBjcmVhdGVzIHNvbWUgbWVudGFsIGJ1cmRlbi4KPj4gCj4+IEFuZHJl
dywgZG8geW91IGhhdmUgYW55IG9waW5pb24gLyBwcmVmZXJlbmNlIGVpdGhlciB3YXk/Cj4gCj4g
SSBkaXNjdXNzZWQgdGhpcyB3aXRoIEFuZHJldyBvbiBJUkMgYW5kIGNhbWUgdG8gdGhlIGNvbmNs
dXNpb24gaXQgaXMgbm90Cj4gd29ydGggaXQgdG8gaW50cm9kdWNlIENPTkZJR19ORVNURURfSFZN
LCBiZWNhdXNlOgo+IAo+IDEuIE5lc3RlZCB2aXJ0IHdpbGwgYmVjb21lIGNvbW1vbnBsYWNlIGZv
ciBYZW4uCj4gMi4gVHJ5aW5nIHRvIHNwbGl0IG5lc3RlZCBwYXJ0cyBmcm9tIG5vbi1uZXN0ZWQg
cGFydHMgd2lsbCBiZSBtYXNzaXZlbHkKPiAgICBjb21wbGljYXRlZC4KCk9rYXkgdGhlbi4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
