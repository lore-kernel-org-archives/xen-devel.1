From: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2] xen:arm: Populate arm64 image header
Date: Wed, 5 Sep 2018 14:04:20 +0100
Message-ID: <520bfefd-7260-0916-2bc3-bb57fdfdc2f3@arm.com>
References: <1536081906-27881-1-git-send-email-amittomer25@gmail.com>
 <8af6b645-b5b4-d0fb-e25a-69b2ad988445@arm.com>
 <CABHD4K8uWYXH1xodmrgS+689x=X=R4BvEDR+xKmxCaNw-H-UWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qsk/=lt=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1fxXTM-0002Np-8u
 for xen-devel@lists.xenproject.org; Wed, 05 Sep 2018 13:03:52 +0000
In-Reply-To: <CABHD4K8uWYXH1xodmrgS+689x=X=R4BvEDR+xKmxCaNw-H-UWA@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Tomer <amittomer25@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwNS8wOS8xOCAxMzo1MiwgQW1pdCBUb21lciB3cm90ZToKPiBIZWxsbywKPiAKPiBU
aGFua3MgZm9yIGhhdmluZyBhIGxvb2suCj4gCj4gT24gV2VkLCBTZXAgNSwgMjAxOCBhdCA2OjA3
IFBNIEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPiB3cm90ZToKPj4KPj4g
SGksCj4+Cj4+IEkgZG9uJ3QgdGhpbmsgaXQncyBoZWxwZnVsIHRvIGhpZGUgdGhhdCBLRVJORUxf
U0laRSBkZWZpbml0aW9uIGluCj4+IGFub3RoZXIgZmlsZS4gUGxlYXNlIGp1c3QgcHV0ICJfZW5k
IC0gc3RhcnQiIGhlcmUuCj4gCj4gWWVhaCwgIEkgdGhvdWdodCBhYm91dCBpdCBhbmQgZmVsdCB0
aGF0IGl0IHdvdWxkIGJlIGNsZWFuZXIgYW5kIG1vcmUKPiByZWFkYWJsZSBpZiB3ZSB1c2UgbWFj
cm9zIGhlcmUuCgpJIGRvbid0IHNlZSBob3cgdGhpcyBpbXByb3ZlcyByZWFkYWJpbGl0eS4KVGhl
IHBvaW50IGlzIHRoYXQgdGhpcyBsaW5lIGFzIGlzOgoKIC5xdWFkIF9fS0VSTkVMX1NJWkUgLyog
RWZmZWN0aXZlIHNpemUgb2Yga2VybmVsIGltYWdlLCBsaXR0bGUtZW5kaWFuICovCgpjb252ZXlz
IG9ubHkgbGl0dGxlIGluZm9ybWF0aW9uLCBiYXNpY2FsbHkgeW91IHNheSB0aGF0ICJrZXJuZWwg
c2l6ZSBpcwprZXJuZWwgc2l6ZSIuIEkgd291bGQgcmF0aGVyIHNlZSB0aGUgYWN0dWFsIGRlZmlu
aXRpb24gb2Yga2VybmVsIHNpemUKaGVyZSwgc2luY2UgdGhlIGNvbW1lbnQgZXhwbGFpbnMgdGhl
IG1lYW5pbmcgYWxyZWFkeS4KCj4gQWxzbywgd2FudGVkIHRvIGhhdmUgbWluaW1hbCBjaGFuZ2Vz
IGluIGhlYWQuUyBhbmQgdGhhdCBpcyB0aGUgcmVhc29uCj4gZm9yIHVzaW5nIGFzc2VtYmxlLmgu
Cgphc3NlbWJsZXIuaCB3b3VsZG4ndCBiZSB0aGUgcmlnaHQgcGxhY2UgYW55d2F5LiBBRkFJQ1Qg
aXQncyBvbmx5IHRoZXJlCnRvIG1ha2UgdGhvc2UgZmlsZXMgaW4gbGliLyBoYXBweSwgd2hpY2gg
YXJlIG1vc3RseSBjb3BpZWQgZnJvbSBMaW51eC4KCkNoZWVycywKQW5kcmUuCgo+PiBFaXRoZXIg
eW91IGNhbGwgdGhpcyBfX0hFQURfRkxBR19QQUdFX1NJWkVfNEssIG9yLCBldmVuIGJldHRlciwg
Y29weSB0aGUKPj4gTGludXggZGVmaW5pdGlvbiwgd2hpY2ggd291bGQgbWFrZSBpdCBvYnZpb3Vz
IHdoZXJlIHRoaXMgY29tZXMgZnJvbSBhbmQKPj4gd291bGQgYWxlcnQgYW55IGRldmVsb3BlciBv
ZiB0aGUgUEFHRV9TSVpFIGRlcGVuZGVuY3kuCj4+Cj4+IFBsdXMgbW92ZSB0aG9zZSBpbnRvIGhl
YWQuUywgYXMgbWVudGlvbmVkIGFib3ZlLgo+IAo+IE9rLgo+Pj4gKwo+Pj4gKyNkZWZpbmUgX19L
RVJORUxfU0laRSAgICAgICAgICAgKF9lbmQgLSBzdGFydCkKPj4+ICsKPj4+ICAjZW5kaWYgLyog
X19BU01fQVNTRU1CTEVSX0hfXyAqLwo+Pj4KPiAKPiBUaGFua3MKPiAtQW1pdAo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
