From: Alexey G <x1917x@gmail.com>
Subject: Re: [RFC PATCH 07/12] hvmloader: allocate MMCONFIG area
 in the MMIO hole + minor code refactoring
Date: Thu, 22 Mar 2018 19:55:06 +1000
Message-ID: <20180322195506.00000d4a@gmail.com>
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
 <5AB37FA002000078001B4DD5@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=w0ds=gm=gmail.com=x1917x@srs-us1.protection.inumbo.net>)
 id 1eywwL-0002AL-F5
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 09:55:21 +0000
Received: by mail-lf0-x229.google.com with SMTP id t132-v6so12192464lfe.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Mar 2018 02:55:20 -0700 (PDT)
In-Reply-To: <5AB37FA002000078001B4DD5@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMiBNYXIgMjAxOCAwMzowNDoxNiAtMDYwMAoiSmFuIEJldWxpY2giIDxKQmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6Cgo+Pj4+IE9uIDIyLjAzLjE4IGF0IDAxOjMxLCA8eDE5MTd4QGdt
YWlsLmNvbT4gd3JvdGU6ICAKPj4gT24gV2VkLCAyMSBNYXIgMjAxOCAxNzowNjoyOCArMDAwMAo+
PiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPj4gWy4uLl0g
IAo+Pj4+IFdlbGwsIHRoaXMgbWlnaHQgd29yayBhY3R1YWxseS4gQWx0aG91Z2ggdGhlIG92ZXJh
bGwgc2NlbmFyaW8gd2lsbAo+Pj4+IGJlIG92ZXJjb21wbGljYXRlZCBhIGJpdCBmb3IgX1BDSV9D
T05GSUcgaW9yZXFzLiBIZXJlIGlzIGhvdyBpdAo+Pj4+IHdpbGwgbG9vazoKPj4+PiAKPj4+PiBR
RU1VIHJlY2VpdmVzIFBDSUVYQkFSIHVwZGF0ZSAtPiBjYWxscyB0aGUgbmV3IGRtb3AgdG8gdGVs
bCBYZW4gbmV3Cj4+Pj4gTU1DT05GSUcgYWRkcmVzcy9zaXplIC0+IFhlbiAocmUpbWFwcyBNTUlP
IHRyYXBwaW5nIGFyZWEgLT4gc29tZW9uZQo+Pj4+IGlzCj4+Pj4gYWNjZXNzaW5nIHRoaXMgYXJl
YSAtPiBYZW4gaW50ZXJjZXB0cyB0aGlzIE1NSU8gYWNjZXNzCj4+Pj4gCj4+Pj4gQnV0IGhlcmUn
cyB3aGF0IGhhcHBlbnMgbmV4dDoKPj4+PiAKPj4+PiBYZW4gdHJhbnNsYXRlcyBNTUlPIGFjY2Vz
cyBpbnRvIFBDSV9DT05GSUcgYW5kIHNlbmRzIGl0IHRvIERNIC0+Cj4+Pj4gRE0gcmVjZWl2ZXMg
X1BDSV9DT05GSUcgaW9yZXEgLT4gRE0gdHJhbnNsYXRlcyBCREYvYWRkciBpbmZvIGJhY2sKPj4+
PiB0byB0aGUgb2Zmc2V0IGluIGVtdWxhdGVkIE1NQ09ORklHIHJhbmdlIC0+IERNIGNhbGxzCj4+
Pj4gYWRkcmVzc19zcGFjZV9yZWFkL3dyaXRlIHRvIHRyaWdnZXIgTU1JTyBlbXVsYXRpb24KPj4+
PiAgICAgCj4+Pgo+Pj5UaGF0IHdvdWxkIG9ubHkgYmUgdHJ1ZSBvZiBhIGRtIHRoYXQgY2Fubm90
IGhhbmRsZSBQQ0kgY29uZmlnIGlvcmVxcwo+Pj5kaXJlY3RseS4gIAo+PiAKPj4gSXQncyBqdXN0
IGEgYml0IHByb2JsZW1hdGljIGZvciB4ZW4taHZtLmMgKFhlbiBpb3JlcSBwcm9jZXNzb3IgaW4K
Pj4gUUVNVSkuCj4+IAo+PiBJdCByZWNlaXZlcyB0aGVzZSBQQ0kgY29uZiBpb3JlcXMgb3V0IG9m
IGFueSBjb250ZXh0LiBUbyB3b3JrYXJvdW5kCj4+IHRoaXMsIGV4aXN0aW5nIGNvZGUgaXNzdWVz
IEkvTyB0byBlbXVsYXRlZCBDRjhoL0NGQ2ggcG9ydHMgaW4gb3JkZXIKPj4gdG8gYWxsb3cgUUVN
VSB0byBmaW5kIHRoZWlyIHRhcmdldC4gQnV0IHdlIGNhbid0IHVzZSB0aGUgc2FtZSBtZXRob2QK
Pj4gZm9yIE1NQ09ORklHIGFjY2Vzc2VzIC0tIHRoaXMgd29ya3MgZm9yIGJhc2ljIFBDSSBjb25m
IHNwYWNlIG9ubHkuICAKPgo+SSB0aGluayB5b3Ugd2FudCB0byB2aWV3IHRoaXMgdGhlIG90aGVy
IHdheSBhcm91bmQ6IE5vIHBoeXNpY2FsCj5kZXZpY2Ugd291bGQgZXZlciBnZXQgdG8gc2VlIE1N
Q0ZHIGFjY2Vzc2VzIChvciBDRjgvQ0ZDIHBvcnQKPm9uZXMpLiBUaGlzIHNhbWUgbGF5ZXJpbmcg
aXMgd2hhdCB3ZSBzaG91bGQgaGF2ZSBpbiB0aGUKPnZpcnR1YWxpemVkIGNhc2UuCgpXZSBoYXZl
IHB1cmVseSB2aXJ0dWFsIGxheW91dCBvZiB0aGUgUENJIGJ1cyBhbG9uZyB3aXRoIHZpcnR1YWws
CmVtdWxhdGVkIGFuZCBjb21wbGV0ZWx5IHVucmVsYXRlZCB0byBob3N0J3MgTU1DT05GSUcgLS0g
c28gd2hhdCdzCmV4cG9zZWQ/IFRoaXMgZW11bGF0ZWQgTU1DT05GSUcgc2ltcGx5IGEgc3VwcGxl
bWVudCB0byB2aXJ0dWFsIFBDSSBidXMKYW5kIGl0cyBsYXlvdXQgY29ycmVzcG9uZCB0byB0aGUg
dmlydHVhbCBQQ0kgYnVzIGd1ZXN0L1FFTVUgc2VlLgoKSXQncyBRRU1VIHdobyBjb250cm9scyBj
aGlwc2V0LXNwZWNpZmljIFBDSUVYQkFSIGVtdWxhdGlvbiBhbmQga25vd3MKYWJvdXQgTU1DT05G
SUcgcG9zaXRpb24gYW5kIHNpemUuIFFFTVUgaW5mb3JtcyBYZW4gYWJvdXQgd2hlcmUgaXQgaXMs
CmluIG9yZGVyIHRvIHJlY2VpdmUgZXZlbnRzIGFib3V0IFIvVyBhY2Nlc3NlcyB0byB0aGlzIGVt
dWxhdGVkIGFyZWEgLS0Kc28sIHdoeSBoZSBzaG91bGQgcmVjZWl2ZSB0aGVzZSBldmVudHMgaW4g
YSBmb3JtIG9mIFBDSSBjb25mIEJERi9yZWcgYW5kCm5vdCBzaW1wbHkgYXMgTU1DT05GSUcgb2Zm
c2V0IGRpcmVjdGx5IGlmIGl0IGlzIGJhc2ljYWxseSB0aGUgc2FtZQp0aGluZz8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
