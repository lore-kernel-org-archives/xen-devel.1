From: Christoph Hellwig <hch@infradead.org>
Subject: Re: Upstream Dom0 DRM problems regarding swiotlb
Date: Thu, 14 Feb 2019 09:57:05 -0800
Message-ID: <20190214175705.GA21892@infradead.org>
References: <5C64413C0200007800216656@prv1-mh.provo.novell.com>
 <20190213165657.GD22883@char.us.oracle.com>
 <CAOQxz3wvA1B5X2NGSwtmFcoj2v655HJv-Nn4uN=EMt9yVf6uBw@mail.gmail.com>
 <CAOQxz3xUKnsoiT-rF5+ZJwkCUS4cTPQjSG5PHvaPaDrq87CqWQ@mail.gmail.com>
 <20190213191602.GC16558@char.us.oracle.com>
 <CAOQxz3xqaYq8JKWwHbS8oBDB3krtW4saozEoURcz8OtN23jqrA@mail.gmail.com>
 <54ddc7c8-8ba3-bcd2-081e-af2a0ddc4c76@citrix.com>
 <CAOQxz3x1t5F=Ey+4LyuSnCHR2XMZBMxwECbuP0HCJKqqcOkBeQ@mail.gmail.com>
 <8f05efab-4107-02ea-4bab-4759ac23d680@citrix.com>
 <a8efb219-f3a9-4f4a-cfca-2c8abb4fc179@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <a8efb219-f3a9-4f4a-cfca-2c8abb4fc179@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Michael Labriola <michael.d.labriola@gmail.com>, xen-devel@lists.xen.org, Christoph Hellwig <hch@infradead.org>, Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMTQsIDIwMTkgYXQgMDc6MDM6MzhBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiA+IFRoZSB0aGluZyB3aGljaCBpcyBkaWZmZXJlbnQgYmV0d2VlbiBYZW4gUFYgZ3Vl
c3RzIGFuZCBtb3N0IG90aGVycyAoYWxsCj4gPiBvdGhlcnMoPyksIG5vdyB0aGF0IExndWVzdCBh
bmQgVU1MIGhhdmUgYmVlbiBkcm9wcGVkKSBpcyB0aGF0IHdoYXQgTGludXgKPiA+IHRoaW5rcyBv
ZiBhcyBQRk4gJE4gaXNuJ3QgbmVjZXNzYXJpbHkgYWRqYWNlbnQgdG8gUEZOICROKzEgaW4gc3lz
dGVtCj4gPiBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlLgo+ID4gCj4gPiBUaGVyZWZvcmUsIGNvZGUg
d2hpY2ggaGFzIGEgYnVmZmVyIHNwYW5uaW5nIGEgcGFnZSBib3VuZGFyeSBjYW4ndCBqdXN0Cj4g
PiBjb252ZXJ0IGEgcG9pbnRlciB0byB0aGUgYnVmZmVyIGludG8gYSBwaHlzaWNhbCBhZGRyZXNz
LCBhbmQgaGFuZCB0aGF0Cj4gPiBhZGRyZXNzIHRvIGEgZGV2aWNlLsKgIFlvdSBnZW5lcmFsbHkg
ZW5kIHVwIHdpdGggZWl0aGVyIG1lbW9yeSBjb3JydXB0aW9uCj4gPiAoRE1BIGhpdHRpbmcgdGhl
IHdyb25nIHBhZ2UgYWxsb2NhdGVkIHRvIHRoZSBndWVzdCksIG9yIGFuIElPTU1VIGZhdWx0Cj4g
PiAoRE1BIGhpdHRpbmcgYSBwYWdlcyB3aGljaCBpc24ndCBhbGxvY2F0ZWQgdG8gdGhlIGd1ZXN0
KS4KClRoZSBMaW51eCBETUEgQVBJIGFsbG93cyBmb3IgZG1hX21hcF9wYWdlIC8gZG1hX21hcF9z
aW5nbGUgY2FsbHMgdG8Kc3Bhd24gNGsgYm91bmRhcmllcy4gIElmIFhlbiBkb2Vzbid0IHN1cHBv
cnQgdGhhdCBpdCB3aWxsIGhhdmUgdG8gYm91bmNlCmJ1ZmZlciBmb3IgdGhhdCBjYXNlIChhbmQg
Z2V0IGhvcnJpYmxlIHBlcmZvcm1hbmNlKS4KCkJ1dCB0aGUgbGF0dGVyIHRleHQgc2VlbXMgdG8g
YWdyZWUgd2l0aCB0aGF0LiAgU28gd2hhdCBpcyB0aGUgYWN0dWFsCnByb2JsZW0gdGhhdCBzdGFy
dGVkIHRoaXMgZGlzY3Vzc2lvbj8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
