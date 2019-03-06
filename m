From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-next RFC 1/4] build/m4: make
 python_devel.m4 work with both python 2 and 3
Date: Wed, 6 Mar 2019 16:33:38 +0000
Message-ID: <20190306163338.dbol5dvl5crouoae@zion.uk.xensource.com>
References: <20190305164206.6793-1-wei.liu2@citrix.com>
 <20190305164206.6793-2-wei.liu2@citrix.com>
 <20190306150716.GD2300@perard.uk.xensource.com>
 <20190306152443.maczxijl6vnozg23@zion.uk.xensource.com>
 <20190306153553.GE2300@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ECHp=RJ=citrix.com=prvs=9619a384d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h1ZUE-00032U-G6
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 16:33:42 +0000
Content-Disposition: inline
In-Reply-To: <20190306153553.GE2300@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMDYsIDIwMTkgYXQgMDM6MzU6NTNQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gV2VkLCBNYXIgMDYsIDIwMTkgYXQgMDM6MjQ6NDNQTSArMDAwMCwgV2VpIExp
dSB3cm90ZToKPiA+IE9uIFdlZCwgTWFyIDA2LCAyMDE5IGF0IDAzOjA3OjE2UE0gKzAwMDAsIEFu
dGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiA+IC1BQ19DSEVDS19MSUIocHl0aG9uJGFjX3B5dGhv
bl92ZXJzaW9uLCBQeUFyZ19QYXJzZVR1cGxlLCBbXSwKPiA+ID4gPiAtICAgIFtBQ19NU0dfRVJS
T1IoW1VuYWJsZSB0byBmaW5kIGEgc3VpdGFibGUgcHl0aG9uIGRldmVsb3BtZW50IGxpYnJhcnld
KV0sCj4gPiA+ID4gLSAgICBbJFBZVEhPTl9MSUJTXSkKPiA+ID4gPiArQUNfQ0hFQ0tfTElCKHB5
dGhvbiRhY19weXRob25fdmVyc2lvbiRhY19weXRob25fYWJpZmxhZ3MsIFB5QXJnX1BhcnNlVHVw
bGUsIFtdLAo+ID4gPiA+ICsgICAgW0FDX01TR19FUlJPUihbVW5hYmxlIHRvIGZpbmQgYSBzdWl0
YWJsZSBweXRob24gZGV2ZWxvcG1lbnQgbGlicmFyeV0pXSkKPiA+ID4gCj4gPiA+IFNvLCBBQ19D
SEVDS19MSUIgc2VlbXMgdG8gb25seSBiZSB1c2VkIHRvIGNoZWNrIGlmIFB5QXJnX1BhcnNlVHVw
bGUKPiA+ID4gZXhpc3QsIGFuZCByZXF1aXJlcyBhcyBhcmd1bWVudCB0aGUgbmFtZSBvZiB0aGUg
bGliIHdoaWNoIGlzIG5vdwo+ID4gPiBjb21wbGljYXRlZC4KPiA+ID4gCj4gPiA+IEJ1dCwgQUNf
Q0hFQ0tfTElCIGRvIHRlc3QgY29tcGlsYXRpb24gdXNpbmcgdGhlIExERkxBR1Mgd2hpY2ggYWxy
ZWFkeQo+ID4gPiBjb250YWluIHRoZSBweXRob24gbGliIHdlIHdhbnQsIHNvIGluc3RlYWQsIHdl
IGNvdWxkIG9ubHkgZG8gdGhlIHBhcnQgb2YKPiA+ID4gdGhlIGpvYnMgdGhhdCB3ZSBuZWVkOgo+
ID4gPiAKPiA+ID4gQUNfTElOS19JRkVMU0UoW0FDX0xBTkdfQ0FMTChbXSwgW1B5QXJnX1BhcnNl
VHVwbGVdKV0sIFtdLAo+ID4gPiAgICAgW0FDX01TR19FUlJPUihbVW5hYmxlIHRvIGZpbmQgYSBz
dWl0YWJsZSBweXRob24gZGV2ZWxvcG1lbnQgbGlicmFyeV0pXSkKPiA+ID4gCj4gPiA+IFRoYXQg
Z2VuZXJhdGUgYSBtYWluLmMgd2l0aCBQeUFyZ19QYXJzZVR1cGxlKCkgY2FsbCBsaWtlIEFDX0NI
RUNLX0xJQgo+ID4gPiBkbywgYW5kIGRvIGJ1aWxkL2xpbmsuIElmIHRoYXQgZmFpbHMsIHRocm93
IGFuIGVycm9yLgo+ID4gPiAKPiA+ID4gVGhhdCBhdm9pZCB0byB1c2UgdGhlIC0tYWJpZmxhZ3Ms
IHdoaWNoIHdlIGRvbid0IG5lZWQuCj4gPiA+IAo+ID4gPiBXaGF0IGRvIHlvdSB0aGluZz8KPiA+
IAo+ID4gRGVmaW5pdGVseSBsb29rcyBiZXR0ZXIuIExldCBtZSB0cnkgdGhpcy4KPiAKPiBBY3R1
YWxseSwgSSB0aGluayBJIGp1c3QgZm91bmQgYmV0dGVyLCBzYW1lIHRoaW5ncyBidXQgdXNpbmcg
YSBtYWNybwo+IHRoYXQgYWxyZWFkeSBkbyB3aGF0IHdlIHdhbnQ6Cj4gCj4gQUNfQ0hFQ0tfRlVO
QyhbUHlBcmdfUGFyc2VUdXBsZV0sIFtdLAo+ICAgICBbQUNfTVNHX0VSUk9SKFtVbmFibGUgdG8g
ZmluZCBhIHN1aXRhYmxlIHB5dGhvbiBkZXZlbG9wbWVudCBsaWJyYXJ5XSldKQo+IAoKVGhpcyB3
b3Jrcy4gVGhhbmsgeW91LgoKV2VpLgoKPiAtLSAKPiBBbnRob255IFBFUkFSRAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
