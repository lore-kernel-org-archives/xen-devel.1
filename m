From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 0/1] drm/xen-zcopy: Add Xen zero-copy helper
 DRM driver
Date: Wed, 18 Apr 2018 11:55:26 +0100
Message-ID: <20180418105526.a4qtlhofrn3gubsl__43356.0128593401$1524048870$gmane$org@MacBook-Pro-de-Roger.local>
References: <5d8fec7f-956c-378f-be90-f45029385740@gmail.com>
 <20180416192905.GA18096@downor-Z87X-UD5H>
 <20180417075928.GT31310@phenom.ffwll.local>
 <20180417205744.GA15930@downor-Z87X-UD5H>
 <41487acb-a67a-8933-d0c3-702c19b0938e@gmail.com>
 <20180418073508.ptvntwedczpvl7bx@MacBook-Pro-de-Roger.local>
 <ebcbf6ce-1d7a-5f3e-cff8-546d1c010e59@gmail.com>
 <20180418101058.hyqk3gr3b2ibxswu@MacBook-Pro-de-Roger.local>
 <7d6710a76b9a42299139d7914358ed52@AMSPEX02CL03.citrite.net>
 <46489b33-e6fc-b874-6cd4-dbb94c002ef8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8rj1=hh=citrix.com=prvs=639a7a0fa=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f8kkR-0000hz-Lj
 for xen-devel@lists.xenproject.org; Wed, 18 Apr 2018 10:55:35 +0000
Content-Disposition: inline
In-Reply-To: <46489b33-e6fc-b874-6cd4-dbb94c002ef8@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "jgross@suse.com" <jgross@suse.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, Dongwon Kim <dongwon.kim@intel.com>, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, "airlied@linux.ie" <airlied@linux.ie>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Paul Durrant <Paul.Durrant@citrix.com>, "Potrola,
 MateuszX" <mateuszx.potrola@intel.com>, "daniel.vetter@intel.com" <daniel.vetter@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, Matt Roper <matthew.d.roper@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMTgsIDIwMTggYXQgMDE6Mzk6MzVQTSArMDMwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gT24gMDQvMTgvMjAxOCAwMToxOCBQTSwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiBGcm9tOiBYZW4tZGV2
ZWwgW21haWx0bzp4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24gQmVo
YWxmCj4gPiA+IE9mIFJvZ2VyIFBhdSBNb25uw6kKPiA+ID4gU2VudDogMTggQXByaWwgMjAxOCAx
MToxMQo+ID4gPiBUbzogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPGFuZHIyMDAwQGdtYWlsLmNv
bT4KPiA+ID4gQ2M6IGpncm9zc0BzdXNlLmNvbTsgQXJ0ZW0gTXlnYWlldiA8QXJ0ZW1fTXlnYWll
dkBlcGFtLmNvbT47Cj4gPiA+IERvbmd3b24gS2ltIDxkb25nd29uLmtpbUBpbnRlbC5jb20+OyBh
aXJsaWVkQGxpbnV4LmllOwo+ID4gPiBPbGVrc2FuZHJfQW5kcnVzaGNoZW5rb0BlcGFtLmNvbTsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgZHJpLQo+ID4gPiBkZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IFBvdHJvbGEsIE1hdGV1c3pYCj4gPiA+IDxtYXRldXN6eC5wb3Ryb2xhQGlu
dGVsLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsKPiA+ID4gZGFuaWVsLnZl
dHRlckBpbnRlbC5jb207IGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tOyBNYXR0IFJvcGVyCj4g
PiA+IDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPgo+ID4gPiBTdWJqZWN0OiBSZTogW1hlbi1k
ZXZlbF0gW1BBVENIIDAvMV0gZHJtL3hlbi16Y29weTogQWRkIFhlbiB6ZXJvLWNvcHkKPiA+ID4g
aGVscGVyIERSTSBkcml2ZXIKPiA+ID4gCj4gPiA+IE9uIFdlZCwgQXByIDE4LCAyMDE4IGF0IDEx
OjAxOjEyQU0gKzAzMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvCj4gPiA+IHdyb3RlOgo+ID4g
PiA+IE9uIDA0LzE4LzIwMTggMTA6MzUgQU0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+
IEFmdGVyIHNwZWFraW5nIHdpdGggT2xla3NhbmRyIG9uIElSQywgSSB0aGluayB0aGUgbWFpbiB1
c2FnZSBvZiB0aGUKPiA+ID4gZ250ZGV2IGV4dGVuc2lvbiBpcyB0bzoKPiA+ID4gCj4gPiA+IDEu
IENyZWF0ZSBhIGRtYS1idWYgZnJvbSBhIHNldCBvZiBncmFudCByZWZlcmVuY2VzLgo+ID4gPiAy
LiBTaGFyZSBkbWEtYnVmIGFuZCBnZXQgYSBsaXN0IG9mIGdyYW50IHJlZmVyZW5jZXMuCj4gPiA+
IAo+ID4gPiBJIHRoaW5rIHRoaXMgc2V0IG9mIG9wZXJhdGlvbnMgY291bGQgYmUgYnJva2VuIGlu
dG86Cj4gPiA+IAo+ID4gPiAxLjEgTWFwIGdyYW50IHJlZmVyZW5jZXMgaW50byB1c2VyLXNwYWNl
IHVzaW5nIHRoZSBnbnRkZXYuCj4gPiA+IDEuMiBDcmVhdGUgYSBkbWEtYnVmIG91dCBvZiBhIHNl
dCBvZiB1c2VyLXNwYWNlIHZpcnR1YWwgYWRkcmVzc2VzLgo+ID4gPiAKPiA+ID4gMi4xIE1hcCBh
IGRtYS1idWYgaW50byB1c2VyLXNwYWNlLgo+ID4gPiAyLjIgR2V0IGdyZWZzIG91dCBvZiB0aGUg
dXNlci1zcGFjZSBhZGRyZXNzZXMgd2hlcmUgdGhlIGRtYS1idWYgaXMKPiA+ID4gICAgICBtYXBw
ZWQuCj4gPiA+IAo+ID4gPiBTbyBpdCBzZWVtcyBsaWtlIHdoYXQncyBhY3R1YWxseSBtaXNzaW5n
IGlzIGEgd2F5IHRvOgo+ID4gPiAKPiA+ID4gICAtIENyZWF0ZSBhIGRtYS1idWYgZnJvbSBhIGxp
c3Qgb2YgdXNlci1zcGFjZSB2aXJ0dWFsIGFkZHJlc3Nlcy4KPiA+ID4gICAtIEFsbG93IHRvIG1h
cCBhIGRtYS1idWYgaW50byB1c2VyLXNwYWNlLCBzbyBpdCBjYW4gdGhlbiBiZSB1c2VkIHdpdGgK
PiA+ID4gICAgIHRoZSBnbnRkZXYuCj4gPiA+IAo+ID4gPiBJIHRoaW5rIHRoaXMgaXMgZ2VuZXJp
YyBlbm91Z2ggdGhhdCBpdCBjb3VsZCBiZSBpbXBsZW1lbnRlZCBieSBhCj4gPiA+IGRldmljZSBu
b3QgdGllZCB0byBYZW4uIEFGQUlDVCB0aGUgaHlwZXJfZG1hIGd1eXMgYWxzbyB3YW50ZWQKPiA+
ID4gc29tZXRoaW5nIHNpbWlsYXIgdG8gdGhpcy4KPiBPaywgc28ganVzdCB0byBzdW1tYXJpemUs
IHhlbi16Y29weS9oeXBlci1kbWFidWYgYXMgdGhleSBhcmUgbm93LAo+IGFyZSBubyBnbyBmcm9t
IHlvdXIgUE9WPwoKTXkgb3BpbmlvbiBpcyB0aGF0IHRoZXJlIHNlZW1zIHRvIGJlIGEgbW9yZSBn
ZW5lcmljIHdheSB0byBpbXBsZW1lbnQKdGhpcywgYW5kIHRodXMgSSB3b3VsZCBwcmVmZXIgdGhh
dCBvbmUuCgo+IEluc3RlYWQsIHdlIGhhdmUgdG8gbWFrZSBhbGwgdGhhdCBmYW5jeSBzdHVmZgo+
IHdpdGggVkFzIDwtPiBkZXZpY2UtWCBhbmQgaGF2ZSB0aGF0IGRldmljZS1YIGRyaXZlciBsaXZl
IG91dCBvZiBkcml2ZXJzL3hlbgo+IGFzIGl0IGlzIG5vdCBhIFhlbiBzcGVjaWZpYyBkcml2ZXI/
CgpUaGF0IHdvdWxkIGJlIG15IHByZWZlcmVuY2UgaWYgZmVhc2libGUsIHNpbXBseSBiZWNhdXNl
IGl0IGNhbiBiZQpyZXVzZWQgYnkgb3RoZXIgdXNlLWNhc2VzIHRoYXQgbmVlZCB0byBjcmVhdGUg
ZG1hLWJ1ZnMgaW4gdXNlci1zcGFjZS4KCkluIGFueSBjYXNlIEkganVzdCBrbmV3IGFib3V0IGRt
YS1idWZzIHRoaXMgbW9ybmluZywgdGhlcmUgbWlnaHQgYmUKdGhpbmdzIHRoYXQgSSdtIG1pc3Np
bmcuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
