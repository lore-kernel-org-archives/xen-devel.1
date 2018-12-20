From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] drm/xen-front: Make shmem backed display
 buffer coherent
Date: Thu, 20 Dec 2018 07:37:19 -0800
Message-ID: <20181220153719.GB22997__20549.7294468389$1545320161$gmane$org@infradead.org>
References: <20181127103252.20994-1-andr2000@gmail.com>
 <17640791-5306-f7e4-8588-dd39c14e975b@tronnes.org>
 <c5fa494c-2ead-e190-6e8c-43478275f789@gmail.com>
 <20181219131452.cehks3kabcwuuk7i@sirius.home.kraxel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=onL2=O5=bombadil.srs.infradead.org=batv+4320e4c38c4ab4f6f328+5597+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1ga0O2-0001Sw-8N
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 15:37:22 +0000
Content-Disposition: inline
In-Reply-To: <20181219131452.cehks3kabcwuuk7i@sirius.home.kraxel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: jgross@suse.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMTksIDIwMTggYXQgMDI6MTQ6NTJQTSArMDEwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiAKPiA+ID4gPiArwqDCoMKgIGlmICghZG1hX21hcF9zZyhkZXYtPmRldiwgeGVuX29i
ai0+c2d0LT5zZ2wsIHhlbl9vYmotPnNndC0+bmVudHMsCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgRE1BX0JJRElSRUNUSU9OQUwpKSB7Cj4gPiA+IAo+ID4gPiAKPiA+ID4gQXJlIHlv
dSB1c2luZyB0aGUgRE1BIHN0cmVhbWluZyBBUEkgYXMgYSB3YXkgdG8gZmx1c2ggdGhlIGNhY2hl
cz8KPiA+IFllcwo+ID4gPiBEb2VzIHRoaXMgbWVhbiB0aGF0IEdGUF9VU0VSIGlzbid0IG1ha2lu
ZyB0aGUgYnVmZmVyIGNvaGVyZW50Pwo+ID4gCj4gPiBObywgaXQgZGlkbid0IGhlbHAuIEkgaGFk
IGEgcXVlc3Rpb24gWzFdIGlmIHRoZXJlIGFyZSBhbnkgb3RoZXIgYmV0dGVyIHdheQo+ID4gdG8g
YWNoaWV2ZSB0aGUgc2FtZSwgYnV0IGRpZG4ndCBoYXZlIGFueSByZXNwb25zZSB5ZXQuIFNvLCBJ
IGltcGxlbWVudGVkCj4gPiBpdCB2aWEgRE1BIEFQSSB3aGljaCBoZWxwZWQuCj4gCj4gc2V0X3Bh
Z2VzX2FycmF5XyooKSA/Cj4gCj4gU2VlIGFyY2gveDg2L2luY2x1ZGUvYXNtL3NldF9tZW1vcnku
aAoKVGhhdCBzb3VuZHMgZXZlbiBtb3JlIGJvZ3VzLCBkb24ndCBnbyB0aGVyZS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
