From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 07/12] hvmloader: allocate MMCONFIG area
 in the MMIO hole + minor code refactoring
Date: Thu, 22 Mar 2018 03:04:16 -0600
Message-ID: <5AB37FA002000078001B4DD5@prv-mh.provo.novell.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <62c7a3037bb9f5631542f635dc36ae3338c7bf47.1520867741.git.x1917x@gmail.com>
 <20180319155802.immvsgqttrs3yezg@MacBook-Pro-de-Roger.local>
 <20180320054922.00005669@gmail.com>
 <20180320085048.orjv67qtwhe35ntl@MacBook-Pro-de-Roger.local>
 <20180321105840.00004698@gmail.com>
 <20180321090911.qd6epofdaywc4blb@MacBook-Pro-de-Roger.local>
 <20180322002540.000032f1@gmail.com>
 <20180321152017.bv32mt4bpxaa7zfr@MacBook-Pro-de-Roger.local>
 <20180322025656.00005281@gmail.com>
 <3a237f106c9348799473fca673f7ef7c@AMSPEX02CL03.citrite.net>
 <20180322103142.0000423c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhfi=gm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eyw8z-0006Py-Sx
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 09:04:21 +0000
In-Reply-To: <20180322103142.0000423c@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey G <x1917x@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAzLjE4IGF0IDAxOjMxLCA8eDE5MTd4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24g
V2VkLCAyMSBNYXIgMjAxOCAxNzowNjoyOCArMDAwMAo+IFBhdWwgRHVycmFudCA8UGF1bC5EdXJy
YW50QGNpdHJpeC5jb20+IHdyb3RlOgo+IFsuLi5dCj4+PiBXZWxsLCB0aGlzIG1pZ2h0IHdvcmsg
YWN0dWFsbHkuIEFsdGhvdWdoIHRoZSBvdmVyYWxsIHNjZW5hcmlvIHdpbGwgYmUKPj4+IG92ZXJj
b21wbGljYXRlZCBhIGJpdCBmb3IgX1BDSV9DT05GSUcgaW9yZXFzLiBIZXJlIGlzIGhvdyBpdCB3
aWxsCj4+PiBsb29rOgo+Pj4gCj4+PiBRRU1VIHJlY2VpdmVzIFBDSUVYQkFSIHVwZGF0ZSAtPiBj
YWxscyB0aGUgbmV3IGRtb3AgdG8gdGVsbCBYZW4gbmV3Cj4+PiBNTUNPTkZJRyBhZGRyZXNzL3Np
emUgLT4gWGVuIChyZSltYXBzIE1NSU8gdHJhcHBpbmcgYXJlYSAtPiBzb21lb25lCj4+PiBpcwo+
Pj4gYWNjZXNzaW5nIHRoaXMgYXJlYSAtPiBYZW4gaW50ZXJjZXB0cyB0aGlzIE1NSU8gYWNjZXNz
Cj4+PiAKPj4+IEJ1dCBoZXJlJ3Mgd2hhdCBoYXBwZW5zIG5leHQ6Cj4+PiAKPj4+IFhlbiB0cmFu
c2xhdGVzIE1NSU8gYWNjZXNzIGludG8gUENJX0NPTkZJRyBhbmQgc2VuZHMgaXQgdG8gRE0gLT4K
Pj4+IERNIHJlY2VpdmVzIF9QQ0lfQ09ORklHIGlvcmVxIC0+IERNIHRyYW5zbGF0ZXMgQkRGL2Fk
ZHIgaW5mbyBiYWNrIHRvCj4+PiB0aGUgb2Zmc2V0IGluIGVtdWxhdGVkIE1NQ09ORklHIHJhbmdl
IC0+IERNIGNhbGxzCj4+PiBhZGRyZXNzX3NwYWNlX3JlYWQvd3JpdGUgdG8gdHJpZ2dlciBNTUlP
IGVtdWxhdGlvbgo+Pj4gICAKPj4KPj5UaGF0IHdvdWxkIG9ubHkgYmUgdHJ1ZSBvZiBhIGRtIHRo
YXQgY2Fubm90IGhhbmRsZSBQQ0kgY29uZmlnIGlvcmVxcwo+PmRpcmVjdGx5Lgo+IAo+IEl0J3Mg
anVzdCBhIGJpdCBwcm9ibGVtYXRpYyBmb3IgeGVuLWh2bS5jIChYZW4gaW9yZXEgcHJvY2Vzc29y
IGluIFFFTVUpLgo+IAo+IEl0IHJlY2VpdmVzIHRoZXNlIFBDSSBjb25mIGlvcmVxcyBvdXQgb2Yg
YW55IGNvbnRleHQuIFRvIHdvcmthcm91bmQKPiB0aGlzLCBleGlzdGluZyBjb2RlIGlzc3VlcyBJ
L08gdG8gZW11bGF0ZWQgQ0Y4aC9DRkNoIHBvcnRzIGluIG9yZGVyIHRvCj4gYWxsb3cgUUVNVSB0
byBmaW5kIHRoZWlyIHRhcmdldC4gQnV0IHdlIGNhbid0IHVzZSB0aGUgc2FtZSBtZXRob2QgZm9y
Cj4gTU1DT05GSUcgYWNjZXNzZXMgLS0gdGhpcyB3b3JrcyBmb3IgYmFzaWMgUENJIGNvbmYgc3Bh
Y2Ugb25seS4KCkkgdGhpbmsgeW91IHdhbnQgdG8gdmlldyB0aGlzIHRoZSBvdGhlciB3YXkgYXJv
dW5kOiBObyBwaHlzaWNhbApkZXZpY2Ugd291bGQgZXZlciBnZXQgdG8gc2VlIE1NQ0ZHIGFjY2Vz
c2VzIChvciBDRjgvQ0ZDIHBvcnQKb25lcykuIFRoaXMgc2FtZSBsYXllcmluZyBpcyB3aGF0IHdl
IHNob3VsZCBoYXZlIGluIHRoZQp2aXJ0dWFsaXplZCBjYXNlLgoKSmFuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
