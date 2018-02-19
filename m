From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: PV guest with PCI passthrough crash on Xen 4.8.3
 inside KVM when booted through OVMF
Date: Mon, 19 Feb 2018 17:13:39 +0000
Message-ID: <20180219171339.3bmilsusrurkez4r@MacBook-Pro-de-Roger.local>
References: <20180216174835.GJ4302@mail-itl>
 <3b6ce245-626d-a6db-b9fa-77dcf26a4ad6@citrix.com>
 <20180216185122.GK4302@mail-itl>
 <b8bb621f-1558-d207-4978-4dca46e350e6@citrix.com>
 <552B21FA-E41B-48B5-8FF4-E40B1DAE90AD@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <552B21FA-E41B-48B5-8FF4-E40B1DAE90AD@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Rich Persaud <persaur@gmail.com>
Cc: Juergen Gross <JGross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMTYsIDIwMTggYXQgMDQ6MzU6MTRQTSAtMDUwMCwgUmljaCBQZXJzYXVkIHdy
b3RlOgo+IE9uIEZlYiAxNiwgMjAxOCwgYXQgMTQ6MDIsIEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gCj4gPiBJTU8sIFBDSSBQYXNzdGhyb3VnaCBp
cyBhIHRyYWlud3JlY2ssIGFuZCBpdCBpcyBhIG1pcmFjbGUgaXQgZnVuY3Rpb25zCj4gPiBhdCBh
bGwuCj4gCj4gV291bGQgdGhhdCBzdGF0ZW1lbnQgYXBwbHkgdG8gb3RoZXIgaHlwZXJ2aXNvcnMg
bGlrZSBLVk0sIFZNd2FyZSBFU1ggb3IgSHlwZXItViwgaS5lLiBhcmUgdGhlIGRlZmljaWVuY2ll
cyBpbiBQQ0kgZGV2aWNlcy9maXJtd2FyZSwgSU9NTVVzLCBwbGF0Zm9ybSBmaXJtd2FyZT8gIAo+
IAo+IElmIHRoZSBzdGF0ZW1lbnQgaXMgWGVuIHNwZWNpZmljLCBhcmUgdGhlcmUgc3BlY2lmaWMg
aXNzdWVzIG9yIGtub3duIHNlY3Rpb25zIG9mIFhlbiBjb2RlIHRoYXQgd291bGQgYmVuZWZpdCBm
cm9tIGEgcmV3cml0ZSBvciByZWRlc2lnbiBpbnNwaXJlZCBieSBvdGhlciBoeXBlcnZpc29ycz8K
CkkgcGVyc29uYWxseSBkb24ndCBmYW5jeSB0aGUgZmFjdCB0aGF0IE1TSS1YIGhhbmRsaW5nIGZv
ciBwYXNzLXRocm91Z2gKdG8gSFZNIGd1ZXN0cyBpcyBzcGxpdCBiZXR3ZWVuIFFFTVUgYW5kIHRo
ZSBoeXBlcnZpc29yIGl0c2VsZi4gSXQKbWFrZXMgdHJhY2tpbmcgZG93biBidWdzIG9yIGp1c3Qg
dHJ5aW5nIHRvIGZpZ3VyZSBvdXQgdGhlIGNvZGUgZmxvdwpxdWl0ZSBjb21wbGV4IElNTy4KCkkg
aGF2ZSBwbGFucyB0byBzd2l0Y2ggSFZNIHRvIHVzZSB0aGUgcGFzcy10aHJvdWdoIGNvZGUgYmVp
bmcgYWRkZWQKZm9yIFBWSDoKCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAxOC0wMS9tc2cwMjA0Mi5odG1sCgpCdXQgdGhhdCdzIHN0aWxsIHF1
aXRlIGZhciBhd2F5IGZyb20gYmVpbmcgdXNhYmxlIGJ5IHVucHJpdmlsZWdlZApndWVzdHMuCgpS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
