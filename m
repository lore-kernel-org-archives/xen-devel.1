From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 51/57] ARM: new VGIC: Add preliminary stub
	implementation
Date: Wed, 14 Mar 2018 13:29:41 +0000
Message-ID: <bd277e08-b8e2-4aab-f6dd-deb10934505b@arm.com>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
 <20180305160415.16760-52-andre.przywara@linaro.org>
 <7b5112a8-c729-c2e8-0850-3284d50a9f8d@arm.com>
 <b183fa8a-af9c-e718-185f-1eb520b495ea@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ty01=ge=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ew6TW-0006d7-GD
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 13:29:50 +0000
In-Reply-To: <b183fa8a-af9c-e718-185f-1eb520b495ea@linaro.org>
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

SGksCgpPbiAwMy8xMy8yMDE4IDAzOjU1IFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiBIaSwK
PiAKPiBPbiAwOS8wMy8xOCAxODoxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBBbmRyZSwK
Pj4KPj4gT24gMDUvMDMvMTggMTY6MDQsIEFuZHJlIFByenl3YXJhIHdyb3RlOgo+Pj4gVGhlIEFS
TSBhcmNoIGNvZGUgcmVxdWlyZXMgYW4gaW50ZXJydXB0IGNvbnRyb2xsZXIgZW11bGF0aW9uIHRv
IGltcGxlbWVudAo+Pj4gdmdpY19jbGVhcl9wZW5kaW5nX2lycXMoKSwgYWx0aG91Z2ggaXQgaXMg
c3VzcGVjdGVkIHRoYXQgaXQgaXMgYWN0dWFsbHkKPj4+IG5vdCBuZWNlc3NhcnkuIEdvIHdpdGgg
YSBzdHViIGZvciBub3cgdG8gbWFrZSB0aGUgbGlua2VyIGhhcHB5Lgo+Pgo+PiBUaGUgaW1wbGVt
ZW50YXRpb24gb2YgdGhhdCBmdW5jdGlvbiBpcyBmdW5kYW1lbnRhbGx5IHdyb25nIG9uIHRoZQo+
PiBjdXJyZW50IHZHSUMgZm9yIGEgZmV3IHJlYXNvbnM6Cj4+ICDCoMKgwqDCoC0gbHJfbWFzayBp
cyByZXNldCBidXQgdGhlIExScyBhcmUgbm90LiBUaGlzIG1lYW5zIHdoZW4gd2UgY29udGV4dAo+
PiBzd2l0Y2ggYmFjaywgdGhlIExSIG1pZ2h0IHN0aWxsIGJlIHdyaXR0ZW4gYW5kIGluamVjdGlu
ZyB1bmV4cGVjdGVkCj4+IGludGVycnVwdCAod2hvb3BzKS4KPj4gIMKgwqDCoMKgLSBib3RoIGxp
c3RzIChpbmZsaWdodCBhbmQgcGVuZGluZykgYXJlIGNsZWFyZWQgd2hpY2ggbWVhbnMgdGhhdCBh
Cj4+IHBoeXNpY2FsIGludGVycnVwdCBwZW5kaW5nIG9uIHRoYXQgdkNQVSBpcyBsb3N0IGZvcmV2
ZXIgKHN0YXkgYWN0aXZlIGluCj4+IHRoZSBwaHlzaWNhbCBzbyBuZXZlciBnb2luZyB0byBmaXJl
IGFnYWluKS4KPj4KPj4gRnVydGhlcm1vcmUsIEkgZG9uJ3QgdGhpbmsgdGhhdCBYZW4gYnVzaW5l
c3MgdG8gcmVzZXQgdGhlIEdJQyBvbiBjcHVfb24uCj4+IElmIGFueXRoaW5nIHNob3VsZCBiZSBk
b25lLCB0aGVuIGlzIGl0IG9uIENQVV9vZmYgdG8gbWlncmF0ZSB0aGUgY3VycmVudAo+PiBpbnRl
cnJ1cHRzIHRvIGFub3RoZXIgdkNQVS4gQnV0IElJUkMgdGhlIE9TIGlzIHJlc3BvbnNpYmxlIGZv
ciB0aGF0Lgo+Pgo+PiBTbyBJIHdvdWxkIGtpbGwgdGhhdCBmdW5jdGlvbi4gQW55IG9waW5pb25z
Pwo+IAo+IFNvIEkgZ3Vlc3MgZ2l2ZW4gdGhhdCB0aGUgcGF0Y2ggaXMgcHJldHR5IHNtYWxsLCB3
ZSBhcmUgZ29vZCB3aXRoCj4ga2VlcGluZyB0aGF0IGZvciBub3csIGFuZCBzb2x2ZSB0aGlzIHRv
Z2V0aGVyIHdpdGggdGhlIG9sZCBWR0lDIGxhdGVyLgoKSSBhbSBvayB3aXRoIHRoYXQuCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
