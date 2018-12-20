From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] drm/xen-front: Make shmem backed display
 buffer coherent
Date: Thu, 20 Dec 2018 13:19:04 +0200
Message-ID: <3e24ecc5-25e1-3d5e-2092-daa95ae36cba__10585.4856585667$1545304687$gmane$org@gmail.com>
References: <20181127103252.20994-1-andr2000@gmail.com>
 <17640791-5306-f7e4-8588-dd39c14e975b@tronnes.org>
 <c5fa494c-2ead-e190-6e8c-43478275f789@gmail.com>
 <20181219131452.cehks3kabcwuuk7i@sirius.home.kraxel.org>
 <dd166576-6771-a03f-bdee-ef798f789aed@gmail.com>
 <20181219141000.k426c7o6ncsdzrn5@sirius.home.kraxel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZDzB=O5=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gZwM9-0007lf-UR
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 11:19:09 +0000
Received: by mail-lf1-x143.google.com with SMTP id z13so1017448lfe.11
 for <xen-devel@lists.xenproject.org>; Thu, 20 Dec 2018 03:19:07 -0800 (PST)
In-Reply-To: <20181219141000.k426c7o6ncsdzrn5@sirius.home.kraxel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Gerd Hoffmann <kraxel@redhat.com>, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>
Cc: jgross@suse.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTkvMTggNDoxMCBQTSwgR2VyZCBIb2ZmbWFubiB3cm90ZToKPiAgICBIaSwKPgo+Pj4g
U3VyZSB0aGlzIGFjdHVhbGx5IGhlbHBzPyAgSXQncyBiZWxvdyA0RyBpbiBndWVzdCBwaHlzaWNh
bCBhZGRyZXNzCj4+PiBzcGFjZSwgc28gaXQgY2FuIGJlIGJhY2tlZCBieSBwYWdlcyB3aGljaCBh
cmUgYWN0dWFsbHkgYWJvdmUgNEcgaW4gaG9zdAo+Pj4gcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSAu
Li4KPj4gWWVzLCB5b3UgYXJlIHJpZ2h0IGhlcmUuIFRoaXMgaXMgd2h5IEkgd3JvdGUgYWJvdXQg
dGhlIElPTU1VCj4+IGFuZCBvdGhlciBjb25kaXRpb25zLiBFLmcuIHlvdSBjYW4gaGF2ZSBhIGRl
dmljZSB3aGljaCBvbmx5Cj4+IGV4cGVjdHMgMzItYml0LCBidXQgdGhhbmtzIHRvIElPTU1VIGl0
IGNhbiBhY2Nlc3MgcGFnZXMgYWJvdmUKPj4gNEdpQiBzZWFtbGVzc2x5LiBTbywgdGhpcyBpcyB3
aHkgSSAqaG9wZSogdGhhdCB0aGlzIGNvZGUgKm1heSogaGVscAo+PiBzdWNoIGRldmljZXMuIERv
IHlvdSB0aGluayBJIGRvbid0IG5lZWQgdGhhdCBhbmQgaGF2ZSB0byByZW1vdmU/Cj4gSSB3b3Vs
ZCB0cnkgd2l0aG91dCB0aGF0LCBhbmQgbWF5YmUgYWRkIGEgcnVudGltZSBvcHRpb24gKG1vZHVs
ZQo+IHBhcmFtZXRlcikgbGF0ZXIgaWYgaXQgdHVybnMgb3V0IHNvbWUgaGFyZHdhcmUgYWN0dWFs
bHkgbmVlZHMgdGhhdC4KPiBEZXZpY2VzIHdoaWNoIGNhbiBkbyAzMmJpdCBETUEgb25seSBiZWNv
bWUgbGVzcyBhbmQgbGVzcyBjb21tb24gdGhlc2UKPiBkYXlzLgpHb29kIHBvaW50LCB3aWxsIHJl
bW92ZSB0aGVuCj4+Pj4+PiArwqDCoMKgIGlmICghZG1hX21hcF9zZyhkZXYtPmRldiwgeGVuX29i
ai0+c2d0LT5zZ2wsIHhlbl9vYmotPnNndC0+bmVudHMsCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBETUFfQklESVJFQ1RJT05BTCkpIHsKPj4+Pj4gQXJlIHlvdSB1c2luZyB0aGUgRE1B
IHN0cmVhbWluZyBBUEkgYXMgYSB3YXkgdG8gZmx1c2ggdGhlIGNhY2hlcz8KPj4+PiBZZXMKPj4+
Pj4gRG9lcyB0aGlzIG1lYW4gdGhhdCBHRlBfVVNFUiBpc24ndCBtYWtpbmcgdGhlIGJ1ZmZlciBj
b2hlcmVudD8KPj4+PiBObywgaXQgZGlkbid0IGhlbHAuIEkgaGFkIGEgcXVlc3Rpb24gWzFdIGlm
IHRoZXJlIGFyZSBhbnkgb3RoZXIgYmV0dGVyIHdheQo+Pj4+IHRvIGFjaGlldmUgdGhlIHNhbWUs
IGJ1dCBkaWRuJ3QgaGF2ZSBhbnkgcmVzcG9uc2UgeWV0LiBTbywgSSBpbXBsZW1lbnRlZAo+Pj4+
IGl0IHZpYSBETUEgQVBJIHdoaWNoIGhlbHBlZC4KPj4+IHNldF9wYWdlc19hcnJheV8qKCkgPwo+
Pj4KPj4+IFNlZSBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9zZXRfbWVtb3J5LmgKPj4gV2VsbCwgeDg2
Li4uIEkgYW0gb24gYXJtIHdoaWNoIGRvZXNuJ3QgZGVmaW5lIHRoYXQuLi4KPiBPaCwgYXJtLiAg
TWF5YmUgYXNrIG9uIGEgYXJtIGxpc3QgdGhlbi4gIEkga25vdyBvbiBhcm0geW91IGhhdmUgdG8g
Y2FyZQo+IGFib3V0IGNhY2hpbmcgYSBsb3QgbW9yZSwgYnV0IHRoYXQgYWxzbyBpcyB3aGVyZSBt
eSBrbm93bGVkZ2UgZW5kcyAuLi4KPgo+IFVzaW5nIGRtYV9tYXBfc2cgZm9yIGNhY2hlIGZsdXNo
aW5nIGxvb2tzIGxpa2UgYSBzbGVkZ2UgaGFtbWVyIGFwcHJvYWNoCj4gdG8gbWUuCkl0IGlzLiBU
aGlzIGlzIHdoeSBJIGFtIHNvIHVuc3VyZSB0aGlzIGlzIHdheSB0byBnbwo+ICAgIEJ1dCBtYXli
ZSBpdCBpcyBuZWVkZWQgdG8gbWFrZSB4ZW4gZmx1c2ggdGhlIGNhY2hlcyAoeGVuIGd1ZXN0cwo+
IGhhdmUgdGhlaXIgb3duIGRtYSBtYXBwaW5nIGltcGxlbWVudGF0aW9uLCByaWdodD8gIE9yIGlz
IHRoaXMgZGlmZmVyZW50Cj4gb24gYXJtIHRoYW4gb24geDg2PykuCkknbGwgdHJ5IHRvIGZpZ3Vy
ZSBvdXQKPiBjaGVlcnMsCj4gICAgR2VyZAo+ClRoYW5rIHlvdSwKT2xla3NhbmRyCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
