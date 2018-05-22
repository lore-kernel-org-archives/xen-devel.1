From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] xen: Add fake_s3 command-line option for
 testing
Date: Tue, 22 May 2018 14:21:22 +0100
Message-ID: <581edc98-4069-82ab-7fc5-6e8afa2416a3@citrix.com>
References: <20180521141600.5516-1-george.dunlap@citrix.com>
 <5B03F63302000078001C4961@prv1-mh.provo.novell.com>
 <d32ad719-9b1d-55b7-cd8f-308806484e12@citrix.com>
 <5B0402A602000078001C4A70@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sjxm=ij=citrix.com=prvs=67362c789=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fL7EH-0003Jj-I3
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 13:21:29 +0000
In-Reply-To: <5B0402A602000078001C4A70@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMjIvMjAxOCAxMjo0NCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjIuMDUu
MTggYXQgMTM6MjEsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiAwNS8y
Mi8yMDE4IDExOjUxIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDIxLjA1LjE4IGF0
IDE2OjE2LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPj4+PiBNb3N0IHNlcnZl
ci1jbGFzcyBoYXJkd2FyZSBkb2Vzbid0IHN1cHBvcnQgQUNQSSBTMyBzdXNwZW5kOwo+Pj4KPj4+
IElzIHRoYXQgcmVhbGx5IHRoZSBjYXNlPyBJIHRob3VnaCBTMyB3YXMgcHJldHR5ICJub3JtYWwi
IHRoZXNlIGRheXMuCj4+Pgo+Pj4+IGJ1dCBtb3N0IGJ1Z3Mgd2UnbGwgcnVuIGFjcm9zcyB3b24n
dCBuZWVkIGFjdHVhbCBTMyB0byB0cmlnZ2VyLgo+Pj4KPj4+IE5vdCBzdXJlIGFib3V0IHRoaXMg
b25lIGVpdGhlcjogSW4gcGFydGljdWxhciB0aGUgbWljcm9jb2RlIGlzc3VlCj4+PiBhZGRyZXNz
ZWQgcmVjZW50bHkgZG9lcyByZXF1aXJlIGFjdHVhbCBTMyB0byBzdXJmYWNlLiBJJ20gbm90Cj4+
PiBtZWFuaW5nIHRvIHB1dCB1bmRlciBxdWVzdGlvbiB0aGUgdXNlZnVsbmVzcyBvZiB0aGlzIG9w
dGlvbiwKPj4+IHRob3VnaC4gSSdkIGp1c3QgbGlrZSB0aGUgZGVzY3JpcHRpb24gdG8gbm90IGxl
YWQgdG8gcGVvcGxlIGRyYXdpbmcKPj4+IHdyb25nIGNvbmNsdXNpb25zLgo+Pgo+PiBSZSBTMyBz
dXBwb3J0LCBJIHdhcyBqdXN0IHJlcGVhdGluZyB3aGF0IEknZCBoZWFyZC4gIE15IGp1ZGdlbWVu
dCBpcwo+PiBzdGlsbCB0aGF0ICJtb3N0IiBidWdzIHdlIGVuZCB1cCBlbmNvdW50ZXJpbmcgd2ls
bCBiZSBvbiB0aGUgWGVuIHNpZGU7Cj4+IGJ1dCBJJ20gaGFwcHkgdG8gcmV3b3JkIGl0IHRvIHRh
a2Ugb3V0IC8gbW9kZXJhdGUgYm90aCBpbXBsaWNhdGlvbnMuCj4gCj4gT2gsIHN1cmVseSBpc3N1
ZXMgbm9ybWFsbHkgYXJlIG9uIHRoZSBYZW4gc2lkZS4gSXQncyBqdXN0IHRoYXQgdGhlcmUncyBh
Cj4gZmFpciByYW5nZSBvZiBpc3N1ZXMgd2hpY2ggc3RpbGwgcmVxdWlyZSBhY3R1YWxseSBnb2lu
ZyB0aHJvdWdoIFMzIHRvCj4gc2hvdyB1cCAtIHRoZSB1Y29kZSBpc3N1ZXMgYWZ0ZXIgWFNBLTI1
NCBhcmUgYSBnb29kIGV4YW1wbGUgdGhlcmVvZi4KCldlbGwgRldJVyB3aXRoIGFjcGlfcG93ZXI9
czNfZmFrZSBvbiBzdGFnaW5nK3BhdGNoLCB0aGUgbWFjaGluZSBoYW5ncwp3aXRoIGRlZmF1bHQg
YnRpIC8geHB0aSBzZXR0aW5ncywgYW5kIHdvcmtzIHdpdGggYnRpIGFuZCB4cHRpIGRpc2FibGVk
LgpTbyBhdCBsZWFzdCBzb21lIHBhcnQgb2YgWFNBLTI1NCBpc3N1ZXMgY2FuIC8gd291bGQgYmUg
Y2F1Z2h0IHdpdGhvdXQKaGF2aW5nIHRvIGFjdHVhbGx5IGVudGVyIHJlYWwgUzMuCgogLUdlb3Jn
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
