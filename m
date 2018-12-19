From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] drm/xen-front: Make shmem backed display
 buffer coherent
Date: Wed, 19 Dec 2018 15:21:46 +0200
Message-ID: <dd166576-6771-a03f-bdee-ef798f789aed__35540.5623246499$1545225630$gmane$org@gmail.com>
References: <20181127103252.20994-1-andr2000@gmail.com>
 <17640791-5306-f7e4-8588-dd39c14e975b@tronnes.org>
 <c5fa494c-2ead-e190-6e8c-43478275f789@gmail.com>
 <20181219131452.cehks3kabcwuuk7i@sirius.home.kraxel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ipo1=O4=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gZbnL-0002Ke-6l
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 13:21:51 +0000
Received: by mail-lj1-x242.google.com with SMTP id l15-v6so17357996lja.9
 for <xen-devel@lists.xenproject.org>; Wed, 19 Dec 2018 05:21:49 -0800 (PST)
In-Reply-To: <20181219131452.cehks3kabcwuuk7i@sirius.home.kraxel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: jgross@suse.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTkvMTggMzoxNCBQTSwgR2VyZCBIb2ZmbWFubiB3cm90ZToKPiAgICBIaSwKPgo+Pj4+
ICvCoMKgwqAgbWFwcGluZyA9IHhlbl9vYmotPmJhc2UuZmlscC0+Zl9tYXBwaW5nOwo+Pj4+ICvC
oMKgwqAgbWFwcGluZ19zZXRfZ2ZwX21hc2sobWFwcGluZywgR0ZQX1VTRVIgfCBfX0dGUF9ETUEz
Mik7Cj4+PiBMZXQncyBzZWUgaWYgSSB1bmRlcnN0YW5kIHdoYXQgeW91J3JlIGRvaW5nOgo+Pj4K
Pj4+IEhlcmUgeW91IHNheSB0aGF0IHRoZSBwYWdlcyBzaG91bGQgYmUgRE1BIGFjY2Vzc2libGUg
Zm9yIGRldmljZXMgdGhhdCBjYW4KPj4+IG9ubHkgc2VlIDRHQi4KPj4gWWVzLCB5b3VyIHVuZGVy
c3RhbmRpbmcgaXMgY29ycmVjdC4gQXMgd2UgYXJlIGEgcGFyYS12aXJ0dWFsaXplZCBkZXZpY2Ug
d2UKPj4gZG8gbm90IGhhdmUgc3RyaWN0IHJlcXVpcmVtZW50cyBmb3IgMzItYml0IERNQS4gQnV0
LCB2aWEgZG1hLWJ1ZiBleHBvcnQsCj4+IHRoZSBidWZmZXIgd2UgY3JlYXRlIGNhbiBiZSB1c2Vk
IGJ5IHJlYWwgSFcsIGUuZy4gb25lIGNhbiBwYXNzLXRocm91Z2gKPj4gcmVhbCBIVyBkZXZpY2Vz
IGludG8gYSBndWVzdCBkb21haW4gYW5kIHRoZXkgY2FuIGltcG9ydCBvdXIgYnVmZmVyICh5ZXMs
Cj4+IHRoZXkgY2FuIGJlIElPTU1VIGJhY2tlZCBhbmQgb3RoZXIgY29uZGl0aW9ucyBtYXkgYXBw
bHkpLgo+PiBTbywgdGhpcyBpcyB3aHkgd2UgYXJlIGxpbWl0aW5nIHRvIERNQTMyIGhlcmUsIGp1
c3QgdG8gYWxsb3cgbW9yZSBwb3NzaWJsZQo+PiB1c2UtY2FzZXMKPiBTdXJlIHRoaXMgYWN0dWFs
bHkgaGVscHM/ICBJdCdzIGJlbG93IDRHIGluIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MKPiBzcGFj
ZSwgc28gaXQgY2FuIGJlIGJhY2tlZCBieSBwYWdlcyB3aGljaCBhcmUgYWN0dWFsbHkgYWJvdmUg
NEcgaW4gaG9zdAo+IHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UgLi4uCgpZZXMsIHlvdSBhcmUgcmln
aHQgaGVyZS4gVGhpcyBpcyB3aHkgSSB3cm90ZSBhYm91dCB0aGUgSU9NTVUKCmFuZCBvdGhlciBj
b25kaXRpb25zLiBFLmcuIHlvdSBjYW4gaGF2ZSBhIGRldmljZSB3aGljaCBvbmx5CgpleHBlY3Rz
IDMyLWJpdCwgYnV0IHRoYW5rcyB0byBJT01NVSBpdCBjYW4gYWNjZXNzIHBhZ2VzIGFib3ZlCgo0
R2lCIHNlYW1sZXNzbHkuIFNvLCB0aGlzIGlzIHdoeSBJICpob3BlKiB0aGF0IHRoaXMgY29kZSAq
bWF5KiBoZWxwCgpzdWNoIGRldmljZXMuIERvIHlvdSB0aGluayBJIGRvbid0IG5lZWQgdGhhdCBh
bmQgaGF2ZSB0byByZW1vdmU/Cgo+Pj4+ICvCoMKgwqAgaWYgKCFkbWFfbWFwX3NnKGRldi0+ZGV2
LCB4ZW5fb2JqLT5zZ3QtPnNnbCwgeGVuX29iai0+c2d0LT5uZW50cywKPj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBETUFfQklESVJFQ1RJT05BTCkpIHsKPj4+Cj4+PiBBcmUgeW91IHVzaW5n
IHRoZSBETUEgc3RyZWFtaW5nIEFQSSBhcyBhIHdheSB0byBmbHVzaCB0aGUgY2FjaGVzPwo+PiBZ
ZXMKPj4+IERvZXMgdGhpcyBtZWFuIHRoYXQgR0ZQX1VTRVIgaXNuJ3QgbWFraW5nIHRoZSBidWZm
ZXIgY29oZXJlbnQ/Cj4+IE5vLCBpdCBkaWRuJ3QgaGVscC4gSSBoYWQgYSBxdWVzdGlvbiBbMV0g
aWYgdGhlcmUgYXJlIGFueSBvdGhlciBiZXR0ZXIgd2F5Cj4+IHRvIGFjaGlldmUgdGhlIHNhbWUs
IGJ1dCBkaWRuJ3QgaGF2ZSBhbnkgcmVzcG9uc2UgeWV0LiBTbywgSSBpbXBsZW1lbnRlZAo+PiBp
dCB2aWEgRE1BIEFQSSB3aGljaCBoZWxwZWQuCj4gc2V0X3BhZ2VzX2FycmF5XyooKSA/Cj4KPiBT
ZWUgYXJjaC94ODYvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5oCldlbGwsIHg4Ni4uLiBJIGFtIG9u
IGFybSB3aGljaCBkb2Vzbid0IGRlZmluZSB0aGF0Li4uCj4gSFRILAo+ICAgIEdlcmQKPgpUaGFu
ayB5b3UsCgpPbGVrc2FuZHIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
