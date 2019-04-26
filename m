From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 6/7] xen/arm: tlbflush: Rework TLB helpers
Date: Fri, 26 Apr 2019 15:06:44 +0100
Message-ID: <0308fa00-070f-cc98-2ef4-f109d94aa8b8@arm.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-7-julien.grall@arm.com>
 <4de7931e-27e0-be57-51e0-f2807aeff7bd@gmail.com>
 <d700c117-80b6-45c7-38f8-6193f92e2a63@arm.com>
 <122d7f0f-d209-6a7a-8092-64985797b383@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pi39=S4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hK1V3-0002hJ-2U
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 14:06:49 +0000
In-Reply-To: <122d7f0f-d209-6a7a-8092-64985797b383@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>, nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyNi8wNC8yMDE5IDE0OjQ5LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IAo+IE9u
IDI1LjA0LjE5IDIzOjQyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEkgYW0gbm90IHN1cmUgd2h5
IEkgdXNlIEEuayBiZWNhdXNlIHRoaXMgaXMgYSBwcmV0dHkgb2xkIHNwZWMuCj4gSSBkaWQgbWVh
biB0aGF0IEEuay4gaXMgbm90IHB1YmxpY2x5IGF2YWlsYWJsZSwgZXZlbiBub3csIHNvIGl0IGlz
IG5vdCBxdWl0ZSAKPiByaWdodCB0byByZWZlciBzdWNoIGEgZG9jdW1lbnQsIGF0IGxlYXN0IHdp
dGhvdXQgbWVudGlvbmluZyBpdCBpcyBpbnRlcm5hbApQbGVhc2UgYXZvaWQgdG8gdGFrZSBteSB3
b3JkcyBvdXQgb2YgY29udGV4dC4uLiBBcyB5b3UgcmVhZCB0aGUgc2VudGVuY2UgYWJvdmUsIAp5
b3UgcHJvYmFibHkgbm90aWNlZCB0aGF0IEEuayB3YXMgcHVibGlzaGVkIHdpdGggZGVmZWN0cyBp
biBpdCBhbmQgcHJvYmFibHkgdGhlIApyZWFzb25zIHdoeSBpdCBjYW4ndCBiZSBmb3VuZCB0b2Rh
eS4KCkkgZG93bmxvYWQgYWxsIG15IHNwZWNzIGZyb20gcHVibGljIHdlYnNpdGUgdG8gYXZvaWQg
cG90ZW50aWFsIGRpc2Nsb3N1cmUgb2YgCmludGVybmFsIGNvbnRlbnQuIElmIHlvdSBsb29rIGF0
IEdvb2dsZSwgdGhlIHNwZWMgd2FzIGFjdHVhbGx5IHB1YmxpYyBhdCBzb21lIApwb2ludCAoc2Vl
IFsxXSBmb3IgaW5zdGFuY2UpLgoKSW4gd2hhdCB5b3UgcXVvdGUsIEkgbWVyZWx5IHBvaW50ZWQg
b3V0IHRoYXQgSSBzaG91bGQgbm90IGhhdmUgdXNlZCBpdCBiZWNhdXNlIAppdCBpcyBwcmV0dHkg
b2xkICh+MiBhbmQgaGFsZiB5ZWFycykuCgpDaGVlcnMsCgpbMV0gaHR0cHM6Ly9sa21sLm9yZy9s
a21sLzIwMTcvMy8zLzI0NwoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
