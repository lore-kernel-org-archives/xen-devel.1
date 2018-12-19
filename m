From: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/xen-front: Make shmem backed display
 buffer coherent
Date: Wed, 19 Dec 2018 14:14:52 +0100
Message-ID: <20181219131452.cehks3kabcwuuk7i__2417.23915464736$1545225213$gmane$org@sirius.home.kraxel.org>
References: <20181127103252.20994-1-andr2000@gmail.com>
 <17640791-5306-f7e4-8588-dd39c14e975b@tronnes.org>
 <c5fa494c-2ead-e190-6e8c-43478275f789@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmpo=O4=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1gZbge-0001PW-EA
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 13:14:56 +0000
Content-Disposition: inline
In-Reply-To: <c5fa494c-2ead-e190-6e8c-43478275f789@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: jgross@suse.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

ICBIaSwKCj4gPiA+ICvCoMKgwqAgbWFwcGluZyA9IHhlbl9vYmotPmJhc2UuZmlscC0+Zl9tYXBw
aW5nOwo+ID4gPiArwqDCoMKgIG1hcHBpbmdfc2V0X2dmcF9tYXNrKG1hcHBpbmcsIEdGUF9VU0VS
IHwgX19HRlBfRE1BMzIpOwoKPiA+IExldCdzIHNlZSBpZiBJIHVuZGVyc3RhbmQgd2hhdCB5b3Un
cmUgZG9pbmc6Cj4gPiAKPiA+IEhlcmUgeW91IHNheSB0aGF0IHRoZSBwYWdlcyBzaG91bGQgYmUg
RE1BIGFjY2Vzc2libGUgZm9yIGRldmljZXMgdGhhdCBjYW4KPiA+IG9ubHkgc2VlIDRHQi4KPiAK
PiBZZXMsIHlvdXIgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0LiBBcyB3ZSBhcmUgYSBwYXJhLXZp
cnR1YWxpemVkIGRldmljZSB3ZQo+IGRvIG5vdCBoYXZlIHN0cmljdCByZXF1aXJlbWVudHMgZm9y
IDMyLWJpdCBETUEuIEJ1dCwgdmlhIGRtYS1idWYgZXhwb3J0LAo+IHRoZSBidWZmZXIgd2UgY3Jl
YXRlIGNhbiBiZSB1c2VkIGJ5IHJlYWwgSFcsIGUuZy4gb25lIGNhbiBwYXNzLXRocm91Z2gKPiBy
ZWFsIEhXIGRldmljZXMgaW50byBhIGd1ZXN0IGRvbWFpbiBhbmQgdGhleSBjYW4gaW1wb3J0IG91
ciBidWZmZXIgKHllcywKPiB0aGV5IGNhbiBiZSBJT01NVSBiYWNrZWQgYW5kIG90aGVyIGNvbmRp
dGlvbnMgbWF5IGFwcGx5KS4KPiBTbywgdGhpcyBpcyB3aHkgd2UgYXJlIGxpbWl0aW5nIHRvIERN
QTMyIGhlcmUsIGp1c3QgdG8gYWxsb3cgbW9yZSBwb3NzaWJsZQo+IHVzZS1jYXNlcwoKU3VyZSB0
aGlzIGFjdHVhbGx5IGhlbHBzPyAgSXQncyBiZWxvdyA0RyBpbiBndWVzdCBwaHlzaWNhbCBhZGRy
ZXNzCnNwYWNlLCBzbyBpdCBjYW4gYmUgYmFja2VkIGJ5IHBhZ2VzIHdoaWNoIGFyZSBhY3R1YWxs
eSBhYm92ZSA0RyBpbiBob3N0CnBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UgLi4uCgo+ID4gPiArwqDC
oMKgIGlmICghZG1hX21hcF9zZyhkZXYtPmRldiwgeGVuX29iai0+c2d0LT5zZ2wsIHhlbl9vYmot
PnNndC0+bmVudHMsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERNQV9CSURJUkVDVElP
TkFMKSkgewo+ID4gCj4gPiAKPiA+IEFyZSB5b3UgdXNpbmcgdGhlIERNQSBzdHJlYW1pbmcgQVBJ
IGFzIGEgd2F5IHRvIGZsdXNoIHRoZSBjYWNoZXM/Cj4gWWVzCj4gPiBEb2VzIHRoaXMgbWVhbiB0
aGF0IEdGUF9VU0VSIGlzbid0IG1ha2luZyB0aGUgYnVmZmVyIGNvaGVyZW50Pwo+IAo+IE5vLCBp
dCBkaWRuJ3QgaGVscC4gSSBoYWQgYSBxdWVzdGlvbiBbMV0gaWYgdGhlcmUgYXJlIGFueSBvdGhl
ciBiZXR0ZXIgd2F5Cj4gdG8gYWNoaWV2ZSB0aGUgc2FtZSwgYnV0IGRpZG4ndCBoYXZlIGFueSBy
ZXNwb25zZSB5ZXQuIFNvLCBJIGltcGxlbWVudGVkCj4gaXQgdmlhIERNQSBBUEkgd2hpY2ggaGVs
cGVkLgoKc2V0X3BhZ2VzX2FycmF5XyooKSA/CgpTZWUgYXJjaC94ODYvaW5jbHVkZS9hc20vc2V0
X21lbW9yeS5oCgpIVEgsCiAgR2VyZAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
