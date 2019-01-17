From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 4/4] xen/x86: Allow stubdom access to irq
 created for msi.
Date: Thu, 17 Jan 2019 06:12:26 -0700
Message-ID: <5C407F3A020000780020EADF@prv1-mh.provo.novell.com>
References: <8ea00e9347ae7859a37ea421e658263a44a375fb.1547566486.git-series.marmarek@invisiblethingslab.com>
 <20190116092129.jz2cts5pwd5ckh34@mac> <20190116105218.GM1205@mail-itl>
 <20190116122004.byvr2bttwkttofqs@mac> <20190116134914.GN1205@mail-itl>
 <20190117085746.rg2vbyh3ga4aru6f@mac>
 <FB0C9893020000480063616D@prv1-mh.provo.novell.com>
 <5C406C8A020000780020EA27@prv1-mh.provo.novell.com>
 <20190117115637.mywzhrlprop6l4cq@mac>
 <5C407302020000780020EA9C@prv1-mh.provo.novell.com>
 <20190117123204.5viookl2xxoiglsy@mac>
 <21B633D80200008F0063616D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gk7T8-0000PO-2T
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 13:12:26 +0000
In-Reply-To: <21B633D80200008F0063616D@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjAxLjE5IGF0IDEzOjMyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgSmFuIDE3LCAyMDE5IGF0IDA1OjIwOjE4QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTcuMDEuMTkgYXQgMTI6NTYsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gVGh1LCBKYW4gMTcsIDIwMTkgYXQgMDQ6NTI6NDJBTSAtMDcwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+ID4+PiBPbiAxNy4wMS4xOSBhdCAwOTo1NywgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiBXaGlsZSBub3QgYWdhaW5zdCB1c2luZyBwaHlz
ZGV2b3AgaWYgd2UgYWdyZWUgdGhhdCBhIG5ldyBoeXBlcmNhbGwgaXMKPj4gPj4gPiB0aGUgd2F5
IHRvIGdvLCBJIHdvdWxkIHByZWZlciBhIGRvbWN0bCBiZWNhdXNlIHRoaXMgaHlwZXJjYWxsIHdv
dWxkCj4+ID4+ID4gb25seSBiZSB1c2VkIGJ5IHRvb2xzdGFjayBjb21wb25lbnRzLCBhbmQgdGh1
cyBkb2Vzbid0IG5lZWQgdG8gYmUKPj4gPj4gPiBhZGRlZCB0byB0aGUgcHVibGljIHN0YWJsZSBB
QkkgYXZhaWxhYmxlIHRvIGFsbCBndWVzdHMsIGV2ZW4gaWYgdGhlCj4+ID4+ID4gZnVuY3Rpb25h
bGl0eSBpcyBhY3R1YWxseSBsaW1pdGVkIHRvIHN0dWJkb21haW5zLgo+PiA+PiAKPj4gPj4gQnV0
IGEgbmV3IHN1Yi1vcCBkb2Vzbid0IG5lZWQgdG8gYmUgcGFydCBvZiB0aGUgc3RhYmxlIEFCSS4K
Pj4gPj4gU2VlIGhvdyBlLmcuIHZhcmlvdXMgb2YgdGhlIG1lbW9yeSBzdWItb3BzIGFyZSByZXN0
cmljdGVkIHRvCj4+ID4+IGJlIHVzZWQgYnkgdGhlIHRvb2wgc3RhY2ssIGFuZCBoZW5jZSBub3Qg
cmVxdWlyZWQgdG8gcmVtYWluCj4+ID4+IHVuY2hhbmdlZC4KPj4gPiAKPj4gPiBPaCwgdGhlbiBJ
J20gYWxsIGluIGZvciBhIHBoeXNkZXZvcCBsaW1pdGVkIHRvIHN0dWJkb21haW4gb25seSB1c2Fn
ZS4KPj4gCj4+IEhtbSwgc3R1YmRvbWFpbiBpcyBkaWZmZXJlbnQ6IEhvdyB3b3VsZCB5b3UgbGlt
aXQgdGhpcyBpbiB0aGUKPj4gaGVhZGVyPwo+IAo+IE9oLCBJIHdhc24ndCBtZWFuaW5nIHRvIGxp
bWl0IHRoaXMgaW4gdGhlIGhlYWRlciwgYnV0IGluIHRoZQo+IGltcGxlbWVudGF0aW9uLiBJZTog
YnkgcmV0dXJuaW5nIGFuIGVycm9yIHdoZW4gY2FsbGVkIGZyb20KPiBub24tc3R1YmRvbWFpbnMu
Cj4gCj4gSSBkb24ndCBzZWUgYSByZWFzb24gdG8gYWxsb3cgbm9uLXN0dWJkb21haW5zIHRvIG1h
a2UgdXNlIG9mIHRoaXMgbmV3Cj4gaHlwZXJjYWxsIGlmIGl0J3Mgbm90IHJlcXVpcmVkLCB0aGF0
IHdvdWxkIGp1c3QgZXhwYW5kIHRoZSBhdHRhY2sKPiBzdXJmYWNlIGZvciBubyBnb29kIHJlYXNv
biBJTU8uCgpSZXN0cmljdGluZyBpdCBpbiB0aGUgaW1wbGVtZW50YXRpb24gaXMgY2VydGFpbmx5
IGZpbmUsIGFuZCBpbmRlZWQKZGVzaXJhYmxlLiBCdXQgdGhlIEFCSSBzdGFiaWxpdHkgZ3VhcmFu
dGVlcyBhcmUgcmVmbGVjdGVkIGJ5Cl9fWEVOX1RPT0xTX18gY29uZGl0aW9uYWxzIGluIHRoZSBw
dWJsaWMgaGVhZGVycy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
