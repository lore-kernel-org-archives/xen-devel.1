From: Juergen Gross <jgross@suse.com>
Subject: Re: Upstream Dom0 DRM problems regarding swiotlb
Date: Fri, 15 Feb 2019 06:57:27 +0100
Message-ID: <f43c8fbf-8b6a-4bfc-8600-aba5f91e12ff@suse.com>
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
 <20190214175705.GA21892@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190214175705.GA21892@infradead.org>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Michael Labriola <michael.d.labriola@gmail.com>, xen-devel@lists.xen.org, Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDIvMjAxOSAxODo1NywgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gVGh1LCBG
ZWIgMTQsIDIwMTkgYXQgMDc6MDM6MzhBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+
IFRoZSB0aGluZyB3aGljaCBpcyBkaWZmZXJlbnQgYmV0d2VlbiBYZW4gUFYgZ3Vlc3RzIGFuZCBt
b3N0IG90aGVycyAoYWxsCj4+PiBvdGhlcnMoPyksIG5vdyB0aGF0IExndWVzdCBhbmQgVU1MIGhh
dmUgYmVlbiBkcm9wcGVkKSBpcyB0aGF0IHdoYXQgTGludXgKPj4+IHRoaW5rcyBvZiBhcyBQRk4g
JE4gaXNuJ3QgbmVjZXNzYXJpbHkgYWRqYWNlbnQgdG8gUEZOICROKzEgaW4gc3lzdGVtCj4+PiBw
aHlzaWNhbCBhZGRyZXNzIHNwYWNlLgo+Pj4KPj4+IFRoZXJlZm9yZSwgY29kZSB3aGljaCBoYXMg
YSBidWZmZXIgc3Bhbm5pbmcgYSBwYWdlIGJvdW5kYXJ5IGNhbid0IGp1c3QKPj4+IGNvbnZlcnQg
YSBwb2ludGVyIHRvIHRoZSBidWZmZXIgaW50byBhIHBoeXNpY2FsIGFkZHJlc3MsIGFuZCBoYW5k
IHRoYXQKPj4+IGFkZHJlc3MgdG8gYSBkZXZpY2UuwqAgWW91IGdlbmVyYWxseSBlbmQgdXAgd2l0
aCBlaXRoZXIgbWVtb3J5IGNvcnJ1cHRpb24KPj4+IChETUEgaGl0dGluZyB0aGUgd3JvbmcgcGFn
ZSBhbGxvY2F0ZWQgdG8gdGhlIGd1ZXN0KSwgb3IgYW4gSU9NTVUgZmF1bHQKPj4+IChETUEgaGl0
dGluZyBhIHBhZ2VzIHdoaWNoIGlzbid0IGFsbG9jYXRlZCB0byB0aGUgZ3Vlc3QpLgo+IAo+IFRo
ZSBMaW51eCBETUEgQVBJIGFsbG93cyBmb3IgZG1hX21hcF9wYWdlIC8gZG1hX21hcF9zaW5nbGUg
Y2FsbHMgdG8KPiBzcGF3biA0ayBib3VuZGFyaWVzLiAgSWYgWGVuIGRvZXNuJ3Qgc3VwcG9ydCB0
aGF0IGl0IHdpbGwgaGF2ZSB0byBib3VuY2UKPiBidWZmZXIgZm9yIHRoYXQgY2FzZSAoYW5kIGdl
dCBob3JyaWJsZSBwZXJmb3JtYW5jZSkuCj4gCj4gQnV0IHRoZSBsYXR0ZXIgdGV4dCBzZWVtcyB0
byBhZ3JlZSB3aXRoIHRoYXQuICBTbyB3aGF0IGlzIHRoZSBhY3R1YWwKPiBwcm9ibGVtIHRoYXQg
c3RhcnRlZCB0aGlzIGRpc2N1c3Npb24/Cj4gCgpTZWUgaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2Fy
Y2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDIvdGhyZWFkcy5odG1sIzAwODE4CgoKSnVlcmdl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
