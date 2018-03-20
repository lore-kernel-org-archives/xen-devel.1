From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 42/45] ARM: new VGIC: vgic-init:
	implement vgic_init
Date: Tue, 20 Mar 2018 03:02:08 +0000
Message-ID: <10ab60bd-546a-cf54-a628-12ae5323493a@arm.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-43-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=kdcq=gk=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ey7dn-0002rB-26
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 03:08:47 +0000
In-Reply-To: <20180315203050.19791-43-andre.przywara@linaro.org>
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

SGkgQW5kcmUsCgpPbiAwMy8xNS8yMDE4IDA4OjMwIFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToK
PiArLyogSU5JVC9ERVNUUk9ZICovCj4gKwo+ICsvKioKPiArICogZG9tYWluX3ZnaWNfaW5pdDog
aW5pdGlhbGl6ZSB0aGUgZGlzdCBkYXRhIHN0cnVjdHVyZXMKPiArICogQGQ6IGRvbWFpbiBwb2lu
dGVyCj4gKyAqIEBucl9zcGlzOiBudW1iZXIgb2YgU1BJcwo+ICsgKi8KPiAraW50IGRvbWFpbl92
Z2ljX2luaXQoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IG5yX3NwaXMpCj4gK3sKPiAr
ICAgIHN0cnVjdCB2Z2ljX2Rpc3QgKmRpc3QgPSAmZC0+YXJjaC52Z2ljOwo+ICsgICAgdW5zaWdu
ZWQgaW50IGk7Cj4gKyAgICBpbnQgcmV0Owo+ICsKPiArICAgIC8qIExpbWl0IHRoZSBudW1iZXIg
b2YgdmlydHVhbCBTUElzIHN1cHBvcnRlZCB0byAoMTAyMCAtIDMyKSA9IDk4OCAgKi8KPiArICAg
IGlmICggbnJfc3BpcyA+ICgxMDIwIC0gTlJfTE9DQUxfSVJRUykgKQo+ICsgICAgICAgIHJldHVy
biAtRUlOVkFMOwo+ICsgICAgbnJfc3BpcyA9IFJPVU5EVVAobnJfc3BpcywgMzIpOwoKSSB0aGlu
ayB0aGUgcm91bmR1cCBpcyBtaXNwbGFjZWQuIEhlcmUgeW91IG1pZ2h0IGFsbG93IHRoZSBndWVz
dCB0byAKaW5qZWN0IElSUXMgMTAyMC0xMDIzLiBGcm9tIHRoZSBTcGVjLCB1c2luZyB0aG9zZSB2
YWx1ZXMgaW4gdGhlIExScyBmb3IgCnRoZSB2SU5USUQgZmllbGQgd2lsbCByZXN1bHQgdG8gdW5w
cmVkaWN0YWJsZSBiZWhhdmlvci4KClNvIHlvdSB3YW50IHRvIG1vdmUgdGhlIFJPVU5EVVAgYmVm
b3JlIHRoZSBjaGVjay4gVGhpcyB3aWxsIGxpbWl0IHRoZSAKU1BJIElOVCBJRCB0byA5OTIsIGJ1
dCB0aGlzIGlzIG5vdCBhIGJpZyBkZWFsIGZvciBub3cuCgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
