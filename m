From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 08/12] arm: add ALL, QEMU,
 Rcar3 and MPSoC configs
Date: Mon, 30 Jul 2018 10:39:08 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1807301039020.20701@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1807061537300.13502@sstabellini-ThinkPad-X260>
 <1530918843-14318-8-git-send-email-sstabellini@kernel.org>
 <9070dccb-e699-7189-d6b3-38cb5f0773f3@epam.com>
 <alpine.DEB.2.10.1807261543150.20701@sstabellini-ThinkPad-X260>
 <5b253972-a880-0ded-dc51-db2f9f8abbdc@epam.com>
 <alpine.DEB.2.10.1807271006090.20701@sstabellini-ThinkPad-X260>
 <5fcc3513-ef81-b08b-cbab-4cbb18aebcac@epam.com>
 <alpine.DEB.2.10.1807271431010.20701@sstabellini-ThinkPad-X260>
 <CAF3u54Dov+QzhJKz9qkM3=0CTRXSzcNq=sVdL+ExuWbvfJd75w@mail.gmail.com>
 <alpine.DEB.2.10.1807271620540.20701@sstabellini-ThinkPad-X260>
 <e82165d7-09c2-4ef9-c968-d19758c5b6fe@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <e82165d7-09c2-4ef9-c968-d19758c5b6fe@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: artem_mygaiev@epam.com, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, andrew.cooper3@citrix.com, George.Dunlap@citrix.com, dfaggioli@suse.com, Julien Grall <julien.grall@gmail.com>, xen-devel@lists.xen.org, volodymyr_babchuk@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAzMCBKdWwgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMjgvMDcvMTggMDA6MzAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIEZy
aSwgMjcgSnVsIDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gSGkgU3RlZmFubywKPiA+
ID4gU29ycnkgZm9yIHRoZSB0b3AgcG9zdGluZy4KPiA+ID4gCj4gPiA+IEkgdGhpbmsgQW5kcmlp
IG1hZGUgYSBnb29kIHBvaW50LiBXaXRoIHlvdXIgbmV3IGNvZGUgTVBTT0Mgd2lsbCBnZXQgYnVp
bHQKPiA+ID4gb24gQXJtIDMyIGJpdCBhcyB3ZWxsLgo+ID4gPiAKPiA+ID4gVGhpcyB3YXMgbm90
IHRoZSBjYXNlIGJlZm9yZSB0aGlzIHBhdGNoLgo+ID4gPiAKPiA+ID4gU28gSSB3b3VsZCBsaWtl
IGF0IGxlYXN0IHRoYXQgdG8gYmUgZml4ZWQgYmVmb3JlIGFueSBjb21taXQuCj4gPiAKPiA+IE9L
LCB0aGlzIGlzIGEgcHJvYmxlbS4gSSdsbCBmaXggaXQuCj4gPiAKPiA+IExvb2tpbmcgaW50byBp
dCBJIHRoaW5rIHRoZXJlIGlzIGEgd2F5IHRvIHNvbHZlIGl0IHRoYXQgZG9lc24ndCByZXF1aXJl
Cj4gPiBkdXBsaWNhdGlvbiwgYW5kIG5vdCBldmVuIHRoZSBpbnRyb2R1Y3Rpb24gb2YgQUxMXzMy
IGFuZCBBTExfNjQ6IHdlIGp1c3QKPiA+IG5lZWQgdG8gYWRkICJpZiBBUk1fNjQiIGZvciB0aGUg
QVJNNjQgcGxhdGZvcm1zIGFuZCAiaWYgQVJNXzMyIiBmb3IgdGhlCj4gPiBBUk0zMiBwbGF0Zm9y
bXMuCj4gPiAKPiA+IFNvIHRvZGF5IHdlIHdvdWxkIGhhdmUgKHRoZSAiaWYgQVJNXzY0IiBpcyBu
ZXcgY29tcGFyZWQgdG8gdGhpcyBwYXRjaCk6Cj4gPiAKPiA+ICAgIGNvbmZpZyBBTEwKPiA+ICAg
ICAgICBib29sICJBbGwgUGxhdGZvcm1zIgo+ID4gICAgICAgIHNlbGVjdCBNUFNPQ19QTEFURk9S
TSBpZiBBUk1fNjQKPiA+IAo+ID4gSW4gdGhlIGZ1cnVyZSwgYXNzdW1pbmcgdGhhdCB3ZSBoYWQg
RVhZTk9TNSBhbmQgT01BUDUgb3B0aW9ucywgaXQgd291bGQKPiA+IGJlY29tZToKPiA+IAo+ID4g
ICAgY29uZmlnIEFMTAo+ID4gICAgICAgIGJvb2wgIkFsbCBQbGF0Zm9ybXMiCj4gPiAgICAgICAg
c2VsZWN0IE1QU09DX1BMQVRGT1JNIGlmIEFSTV82NAo+ID4gICAgICAgIHNlbGVjdCBFWFlOT1M1
IGlmIEFSTV8zMgo+ID4gICAgICAgIHNlbGVjdCBPTUFQNSBpZiBBUk1fMzIKPiA+IAo+ID4gV2hh
dCBkbyB5b3UgdGhpbms/Cj4gCj4gSSB0aGluayBJIHdvdWxkIHByZWZlciB0aGUgc3VnZ2VzdGlv
biBJIG1hZGUgb24gQW5kcmlpJ3MgYW5zd2VyOgo+IAo+IGNob2ljZQo+ICAgIGNvbmZpZyBBTExf
UExBVAo+ICAgICAgIGJvb2wgIkFsbCBQbGF0Zm9ybXMiCj4gICAgICAgIi4uLi4iCj4gZW5kY2hv
aWNlCj4gCj4gY29uZmlnIEFMTF9QTEFUXzY0Cj4gICAgIGRlZmF1bHQgKEFMTCAmJiBBUk1fNjQp
Cj4gCj4gY29uZmlnIEFMTF9QTEFUXzMyCj4gICAgIGRlZmF1bHQgKEFMTF9QTEFUICYmIEFSTV8z
MikKPiAKPiBjb25maWcgTVBTT0NfUExBVEZPUk0KPiAgICAgYm9vbAo+ICAgICBkZWZhdWx0IChB
TExfUExBVF82NCB8fCBNUFNPQykKPiAKPiBUaGlzIHdvdWxkIGF2b2lkIGEgbG9uZyBsaXN0IGlu
ICJBTExfUExBVEZPUk1TIi4KPiAKPiBBbHNvLCBJIGp1c3Qgbm90aWNlZCB0aGF0ICdBTEwnIHdp
bGwgYmVjb21lIENPTkZJR19BTEwuIFRoaXMgaXMgc2xpZ2h0bHkgdG9vCj4gdmFndWUgYXMgYSBu
YW1lLiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaW5jbHVkZSAiUExBVCIgaW4gaXQuCgpJIHZlcmlm
aWVkIHRoYXQgdGhpcyBhbHNvIHdvcmtzIGFzIGV4cGVjdGVkLiBJJ2xsIG1ha2UgdGhlIGNoYW5n
ZXMgYW5kCnJlc2VuZCB0aGUgc2VyaWVzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
