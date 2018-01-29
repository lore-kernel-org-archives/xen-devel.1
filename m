From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 5/5] x86: remove usage of .skip with
 non-absolute expressions
Date: Mon, 29 Jan 2018 13:05:36 +0000
Message-ID: <bcb8aa9b-9e41-01b4-b0a6-31cff3c18bb0@citrix.com>
References: <20180129122643.13008-1-roger.pau@citrix.com>
 <20180129122643.13008-6-roger.pau@citrix.com>
 <20180129124310.whaq7z37t7kvlsxg@citrix.com>
 <5A6F296002000078001A3610@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ldhx=ey=citrix.com=prvs=560163be1=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eg989-0006Lb-OI
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2018 13:05:49 +0000
In-Reply-To: <5A6F296002000078001A3610@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDEvMTggMTM6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI5LjAxLjE4IGF0
IDEzOjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIE1vbiwgSmFuIDI5LCAy
MDE4IGF0IDEyOjI2OjQzUE0gKzAwMDAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+IENsYW5n
IGFzc2VtYmxlciBkb2Vzbid0IHN1cHBvcnQgdXNpbmcgLnNraXAgd2l0aCBub24tYWJzb2x1dGUK
Pj4+IGV4cHJlc3Npb25zOgo+Pj4KPj4gQnV0IHNvIGlzIEdOVSBhcy4gRnJvbSBpdHMgbWFudWFs
IGZvciAuc2tpcDoKPj4KPj4gIlRoaXMgZGlyZWN0aXZlIGVtaXRzIHNpemUgYnl0ZXMsIGVhY2gg
b2YgdmFsdWUgZmlsbC4gQm90aCBzaXplIGFuZCBmaWxsCj4+IGFyZSBhYnNvbHV0ZSBleHByZXNz
aW9ucy4iCj4+Cj4+PiBlbnRyeS5TOjEwOToxNTogZXJyb3I6IGV4cGVjdGVkIGFic29sdXRlIGV4
cHJlc3Npb24KPj4+ICAgICAgICAgLnNraXAgLkxjcjRfYWx0X2VuZCAtIC5MY3I0X2FsdCwgMHg5
MAo+Pj4gICAgICAgICAgICAgICBeCj4+Pgo+PiBPT0kgd2hhdCBtYWtlcyAuTGNyNF9hbHRfZW5k
IC0gLkxjcjRfYWx0IG5vbi1hYnNvbHV0ZT8KPiBJIGd1ZXNzIHRoZXkgZXhwZWN0IHRvIGJlIGFi
bGUgdG8gY2FsY3VsYXRlIHRoZSB2YWx1ZSByaWdodCBhdCB0aGUKPiBwb2ludCB0aGV5IGV2YWx1
YXRlIC5za2lwJ3MgYXJndW1lbnRzLiBXaGVyZWFzIGdhcyBlaXRoZXIgcmVjb3Jkcwo+IGEgZnJh
Z21lbnQgd2l0aCB2YXJpYWJsZSBzaXplLCBvciAobGVzcyBsaWtlbHksIGFzIHRoYXQgY291bGQg
ZW5kIHVwCj4gd3JvbmcpIGV2YWx1YXRlcyB0aGUgZXhwcmVzc2lvbiByaWdodCBhd2F5IChpaXJj
IHRoZSAuc2tpcCBzaXRzIGFmdGVyCj4gdGhlIGRlZmluaXRpb24gb2YgYm90aCBzeW1ib2xzLCBh
bmQgaWlyYyBmdXJ0aGVyIGdhcyBbYXQgbGVhc3Qgc29tZQo+IHZlcnNpb25zXSBoYXMgcHJvYmxl
bXMgaWYgdGhhdCB3YXNuJ3QgdGhlIGNhc2UpLgoKT25lIHRoaW5nIEkndmUgYmVlbiBleHBlcmlt
ZW50aW5nIHdpdGgsIGFsb25nIHdpdGggdHJ5aW5nIHRvIG9yZ2FuaXNlCnRoZSBhbHRlcm5hdGl2
ZXMgaW50byBhIG1lcmdlYWJsZSBzZWN0aW9uLCBpcyB0byBmaXJzdCB3cml0ZSB0aGUKYWx0ZXJu
YXRpdmVzIGludG8gLmRpc2NhcmQgc2VjdGlvbiwgd2hpY2ggYWxsb3dzIGNhbGN1bGF0aW9ucyBs
aWtlIHRoaXMKdG8gYmUgY29tcGxldGVkIGltbWVkaWF0ZWx5LCByYXRoZXIgdGhhbiBiZWluZyBk
ZWZlcnJlZC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
