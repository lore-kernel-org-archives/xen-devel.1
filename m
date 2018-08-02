From: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [RFC PATCH 09/17] libxl: use \x1b to separate qemu
 arguments for linux stubdomain
Date: Thu, 2 Aug 2018 10:30:03 -0400
Message-ID: <CAKf6xpvmK=nUkivVnzrEVAc09YVB-RVF2Lzc3KCdZGaD2wLC9Q@mail.gmail.com>
References: <cover.cff0dcda374a083d3fc638b205f631586751181e.1533009377.git-series.marmarek@invisiblethingslab.com>
 <0c64341a4be3462d62b0bb5bf96b866aa18f477a.1533009377.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpuL1kr6GdvvVaivxo_78e7PnTaWsk6JhuC7kfB8aZ-yxw@mail.gmail.com>
 <20180801215425.GB1371@mail-itl>
 <ed52399e-81a7-a603-e20b-a33fc165f44c@invisiblethingslab.com>
 <cf4b7770-712c-6438-3162-b62ef7824d7e@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vitr=kr=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1flEcK-0003Aa-Rk
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 14:30:16 +0000
Received: by mail-lf1-x141.google.com with SMTP id u14-v6so1731876lfu.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Aug 2018 07:30:15 -0700 (PDT)
In-Reply-To: <cf4b7770-712c-6438-3162-b62ef7824d7e@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMSwgMjAxOCBhdCA5OjU0IFBNIFNpbW9uIEdhaXNlcgo8c2ltb25AaW52aXNp
YmxldGhpbmdzbGFiLmNvbT4gd3JvdGU6Cj4KPiBTaW1vbiBHYWlzZXI6Cj4gPiBNYXJlayBNYXJj
enlrb3dza2ktR8OzcmVja2k6Cj4gPj4gT24gV2VkLCBBdWcgMDEsIDIwMTggYXQgMTA6MzY6MjZB
TSAtMDQwMCwgSmFzb24gQW5kcnl1ayB3cm90ZToKPiA+Pj4gT24gTW9uLCBKdWwgMzAsIDIwMTgg
YXQgMTE6NTYgUE0sIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraQo+ID4+PiA8bWFybWFyZWtA
aW52aXNpYmxldGhpbmdzbGFiLmNvbT4gd3JvdGU6Cj4gPj4+PiBUaGlzIGFsbG93cyB1c2luZyBh
cmd1bWVudHMgd2l0aCBzcGFjZXMsIGxpa2UgLWFwcGVuZC4KPiA+Pj4+IFN0dWJkb21haW4gc2lk
ZSBvZiB0aGlzIHJlcXVpcmUgInhlbnN0b3JlLWNsaWVudDogQWRkIG9wdGlvbiBmb3IgcmF3Cj4g
Pj4+PiBpbi0vb3V0cHV0IiBjb21taXQuCj4gPj4+Cj4gPj4+IEkgaGFkIHRvIGxvb2sgdXAgXHgx
YiAtIGl0IGlzIGFzY2lpIGVzY2FwZS4gIFNpbmNlIEkgd2FzIG9uIHRoZQo+ID4+PiB3d3cuYXNj
aWl0YWJsZS5jb20sIEkgc2F3IFx4MWUgaXMgInJlY29yZCBzZXBlcmF0b3IiIHdoaWNoIG1pZ2h0
IG1ha2UKPiA+Pj4gbW9yZSBzZW5zZS4KPiA+Pgo+ID4+IFNpbW9uLCBkbyB5b3UgcmVtZW1iZXIg
d2h5IHlvdSB1c2VkIFx4MWI/IE90aGVyd2lzZSBpbmRlZWQgY2hhbmdpbmcgdG8KPiA+PiBceDFl
IHdvdWxkIG1ha2Ugc2Vuc2UuCj4gPgo+ID4gQXMgZmFyIGFzIEkgcmVjYWxsIGl0J3MgYSBtb3N0
bHkgYXJiaXRyYXJ5IGNob2ljZS4gSSB0aGluayBJIGNob29zZSAweDFiCj4gPiBiZWNhdXNlIEkg
dGhvdWdodCB0aGF0IEFTQ0lJIGVzY2FwZSB3b3VsZCBiZSB2ZXJ5IHVubGlrZWx5IHRvIGV2ZXIK
PiA+IGFwcGVhciBpbiBhbiBjbWRsaW5lLiAweDAwIHdvdWxkIGJlIGV2ZW4gYmV0dGVyIGJ1dCB5
b3UgZG9uJ3Qgd2FudCB0bwo+ID4gaGFuZGxlIDB4MDAgaW4gYmFzaC4gSSdtIG5vdCBhd2FyZSBv
ZiBhIHByb2JsZW0gd2l0aCAweDFlLgo+Cj4gUFM6IElmIHlvdSBmb2xsb3cgdGhlIFdpa2lwZWRp
YSBkZXNjcmlwdGlvbiBbMV0gb2YgdGhlICJzZXBhcmF0b3IiCj4gY29udHJvbCBjaGFyYWN0ZXJz
IDB4MWYgd291bGQgZml0IGV2ZW4gYmV0dGVyLiBCdXQgSSBkb24ndCB0aGluayBpdAo+IHJlYWxs
eSBtYXR0ZXJzIHdoYXQgcmFyZSBjaGFyYWN0ZXIgd2UgdXNlLgoKQWdyZWVkLiBUaGUgY2hvaWNl
IHNob3VsZG4ndCBtYXR0ZXIgYXMgbG9uZyBhcyBpdCdzIGEgbm9uLXByaW50YWJsZSBhc2NpaSBj
aGFyLgoKPiBbMV06IGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0MwX2FuZF9DMV9jb250
cm9sX2NvZGVzI0ZTCgpSZWdhcmRzLApKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
