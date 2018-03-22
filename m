From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3a 14/39] ARM: new VGIC: Add GICv2 world
 switch backend
Date: Thu, 22 Mar 2018 14:06:42 +0000
Message-ID: <c26e3506-e1aa-11cb-3757-7c66b6cf69e2@arm.com>
References: <20180322115649.5283-1-andre.przywara@linaro.org>
 <20180322115649.5283-3-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rlws=gm=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ez0rh-0002nB-La
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 14:06:49 +0000
In-Reply-To: <20180322115649.5283-3-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAwMy8yMi8yMDE4IDExOjU2IEFNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToK
PiArICAgICAgICAvKiBUaGUgbG9ja2luZyBvcmRlciBmb3JjZXMgdXMgdG8gZHJvcCBhbmQgcmUt
dGFrZSB0aGUgbG9ja3MgaGVyZS4gKi8KPiArICAgICAgICBpZiAoIGlycS0+aHcgKQo+ICsgICAg
ICAgIHsKPiArICAgICAgICAgICAgc3Bpbl91bmxvY2soJmlycS0+aXJxX2xvY2spOwo+ICsKPiAr
ICAgICAgICAgICAgZGVzYyA9IGlycV90b19kZXNjKGlycS0+aHdpbnRpZCk7Cj4gKyAgICAgICAg
ICAgIHNwaW5fbG9jaygmZGVzYy0+bG9jayk7Cj4gKyAgICAgICAgICAgIHNwaW5fbG9jaygmaXJx
LT5pcnFfbG9jayk7Cj4gKwo+ICsgICAgICAgICAgICAvKiBUaGlzIGgvdyBJUlEgc2hvdWxkIHN0
aWxsIGJlIGFzc2lnbmVkIHRvIHRoZSB2aXJ0dWFsIElSUS4gKi8KPiArICAgICAgICAgICAgQVNT
RVJUKGlycS0+aHcgJiYgZGVzYy0+aXJxID09IGlycS0+aHdpbnRpZCk7Cj4gKwo+ICsgICAgICAg
ICAgICBoYXZlX2Rlc2NfbG9jayA9IHRydWU7Cj4gKyAgICAgICAgfQoKSSBhbSBhIGJpdCBjb25j
ZXJuZWQgb2YgdGhpcyBkYW5jZSBpbiBmb2xkX2xyX3N0YXRlKCkuIFRoaXMgbG9va3MgCmF3ZnVs
bHkgY29tcGxleCBidXQgSSBkb24ndCBoYXZlIGJldHRlciBzb2x1dGlvbiBoZXJlLiBJIHdpbGwg
aGF2ZSBhIAp0aGluayBkdXJpbmcgdGhlIG5pZ2h0LgoKSG93ZXZlciwgdGhpcyBpcyBub3QgZ29p
bmcgdG8gc29sdmUgdGhlIHJhY2UgY29uZGl0aW9uIEkgbWVudGlvbmVkIApiZXR3ZWVuIGNsZWFy
aW5nIF9JUlFfSU5QUk9HUkVTUyBoZXJlIGFuZCBzZXR0aW5nIF9JUlFfSU5QUk9HUkVTUyBpbiAK
ZG9fSVJRLiBUaGlzIGlzIGJlY2F1c2UgeW91IGRvbid0IGtub3cgdGhlIG9yZGVyIHRoZXkgYXJl
IGdvaW5nIHRvIGJlIApleGVjdXRlZC4KCkkgd2FudGVkIHRvIG1ha2Ugc3VyZSB5b3UgZGlkbid0
IGludGVuZCB0byBzb2x2ZSB0aGF0IG9uZS4gQW0gSSBjb3JyZWN0PwoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
