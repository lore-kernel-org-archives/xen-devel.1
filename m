From: Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [PATCH v2 9/9] xen/gntdev: Expose gntdev's dma-buf
 API for in-kernel use
Date: Wed, 6 Jun 2018 15:05:21 -0700
Message-ID: <20180606220521.GA7054__12267.0487770394$1528322828$gmane$org@downor-Z87X-UD5H>
References: <20180601114132.22596-1-andr2000@gmail.com>
 <20180601114132.22596-10-andr2000@gmail.com>
 <86f5b340-856c-204f-4ba7-dd51f1e92639@oracle.com>
 <984bcf75-9bea-aceb-3d3a-62e3c65709c7@gmail.com>
 <398d53c9-9c47-d86a-89bd-b9941e638434@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6syo=iy=intel.com=dongwon.kim@srs-us1.protection.inumbo.net>)
 id 1fQgax-0001mD-Hx
 for xen-devel@lists.xenproject.org; Wed, 06 Jun 2018 22:07:55 +0000
Content-Disposition: inline
In-Reply-To: <398d53c9-9c47-d86a-89bd-b9941e638434@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: jgross@suse.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org, daniel.vetter@intel.com, matthew.d.roper@intel.com, linux-media@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdW4gMDYsIDIwMTggYXQgMDU6NTE6MzhQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDA2LzA2LzIwMTggMDg6NDYgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IHdyb3RlOgo+ID4gT24gMDYvMDUvMjAxOCAwMTozNiBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3Rl
Ogo+ID4+IE9uIDA2LzAxLzIwMTggMDc6NDEgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOgo+ID4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1
c2hjaGVua29AZXBhbS5jb20+Cj4gPj4+Cj4gPj4+IEFsbG93IGNyZWF0aW5nIGdyYW50IGRldmlj
ZSBjb250ZXh0IGZvciB1c2UgYnkga2VybmVsIG1vZHVsZXMgd2hpY2gKPiA+Pj4gcmVxdWlyZSBm
dW5jdGlvbmFsaXR5LCBwcm92aWRlZCBieSBnbnRkZXYuIEV4cG9ydCBzeW1ib2xzIGZvciBkbWEt
YnVmCj4gPj4+IEFQSSBwcm92aWRlZCBieSB0aGUgbW9kdWxlLgo+ID4+IENhbiB5b3UgZ2l2ZSBh
biBleGFtcGxlIG9mIHdobydkIGJlIHVzaW5nIHRoZXNlIGludGVyZmFjZXM/Cj4gPiBUaGVyZSBp
cyBubyB1c2UtY2FzZSBhdCB0aGUgbW9tZW50IEkgY2FuIHRoaW5rIG9mLCBidXQgaHlwZXIgZG1h
LWJ1Zgo+ID4gWzFdLCBbMl0KPiA+IEkgbGV0IEludGVsIGZvbGtzIChDQ2VkKSB0byBkZWZlbmQg
dGhpcyBwYXRjaCBhcyBpdCB3YXMgZG9uZSBwcmltYXJpbHkKPiA+IGZvciB0aGVtCj4gPiBhbmQg
SSBkb24ndCB1c2UgaXQgaW4gYW55IG9mIG15IHVzZS1jYXNlcy4gU28sIGZyb20gdGhpcyBQT1Yg
aXQgY2FuIGJlCj4gPiBkcm9wcGVkLAo+ID4gYXQgbGVhc3QgZnJvbSB0aGlzIHNlcmllcy4KPiAK
PiAKPiBZZXMsIGxldCdzIGRyb3AgdGhpcyB1bnRpbCBzb21lb25lIGFjdHVhbGx5IG5lZWRzIGl0
Lgo+IAo+IC1ib3JpcwoKSSBhZ3JlZS4gV2UgYXJlIHdvcmtpbmcgb24gcmUtYXJjaGl0ZWN0dXJp
bmcgaHlwZXJfZG1hYnVmLiBXZSB3b3VsZCB1c2UgemNvcHkKYXBpcyBob3dldmVyLCBub3Qgc3Vy
ZSBpZiB3ZSBhcmUgZ29pbmcgdG8gZG8gaXQgZnJvbSBrZXJuZWwgb3IgZnJvbSB1c2Vyc3BhY2Uu
ClNvIHBsZWFzZSBkbyBub3QgZXhwb3NlIHRob3NlIGZvciBub3cuCgo+IAo+IAo+ID4+Cj4gPj4g
LWJvcmlzCj4gPj4KPiA+IFsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2Vy
aWVzLzM4MjA3Lwo+ID4gWzJdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRj
aC8yMDQ0NDcvCj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiA+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IFhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
