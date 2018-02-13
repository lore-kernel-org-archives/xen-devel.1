From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 09/49] ARM: VGIC: change to level-IRQ
 compatible IRQ injection interface
Date: Tue, 13 Feb 2018 11:49:48 +0000
Message-ID: <93a20ae4-e241-9c9c-6b43-1145c39a96a8@arm.com>
References: <20180209143937.28866-1-andre.przywara@linaro.org>
 <20180209143937.28866-10-andre.przywara@linaro.org>
 <d0c7e49e-11df-7cd2-0cec-f0967cea2edc@arm.com>
 <eb49702a-391f-288c-c335-9c8a0909ad3d@linaro.org>
 <1f4025b1-eedf-2d4e-9982-8396e907f36a@arm.com>
 <8a592b18-c187-154d-5a1b-8294e04005d4@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=nkxj=fh=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1elZ5v-0004ED-1m
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 11:49:55 +0000
In-Reply-To: <8a592b18-c187-154d-5a1b-8294e04005d4@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMi8wMi8xOCAxNDoyNCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4+IFdoYXQgd291
bGQgeW91IGV4cGVjdCB0aGUgY2FsbGVyIHRvIGRvIG9uIGVycm9yPyBFeGNlcHQgcHJpbnRpbmcg
YW4KPj4gZXJyb3IgbWVzc2FnZT8KPiAKPiBJIGRvbid0IGtub3cgZWl0aGVyLiBDb21wYXJpbmcg
dGhpcyB0byBoYXJkd2FyZSwgYW4gSVJRIGlzIHVzdWFsbHkKPiBmaXJlLWFuZC1mb3JnZXQgKHNl
cGFyYXRpbmcgdGhlIGludGVycnVwdCBsaW5lIGZyb20gdGhlIGludGVycnVwdCBzdGF0ZQo+IGhl
cmUpLCBzbyBhIGRldmljZSBkb2Vzbid0IHJlYWxseSBoYW5kbGUgdGhlIGNhc2Ugd2hlbiBhbiBJ
UlEgZG9lcyBub3QKPiBtYWtlIGl0IHRocm91Z2ggKGl0IGNhbid0IGtub3cgZWFzaWx5IGFueXdh
eSkuIEhvd2V2ZXIgdGhlIHdob2xlIHN0YXRlCj4gbWFjaGluZSBtaWdodCBnZXQgYnVzdGVkIGlu
IHRoZSBwcm9jZXNzIChpZiBubyBvbmUgbG93ZXJzIHRoZSBsaW5lLCBmb3IKPiBpbnN0YW5jZSku
Cj4gU28gbG9va2luZyBhdCB0aGlzIHByaW50aW5nIGEgbWVzc2FnZSBsb29rcyBsaWtlIHRoZSBi
ZXN0IGNob2ljZS4KPiAKPiBJIGNoZWNrZWQgYWxsIHVzZXJzIG9mIHZnaWNfaW5qZWN0X2lycSgp
LCBhdCB0aGUgbW9tZW50IGFsbCBJUlEgbnVtYmVycwo+IHBhc3NlZCBpbiBsb29rIHNhZmU6IHRo
ZXkgYXJlIGVpdGhlciBoYXJkY29kZWQgKHRpbWVyLCBldnRjaG4pIG9yCj4gdmFsaWRhdGVkIGJl
Zm9yZSAoaGFyZHdhcmUgSVJRcywgd2hlbiB0aGV5IGFyZSB0aWVkIHRvIGEgdmlydHVhbCBJUlEp
Lgo+IFNvIGluZGVlZCB3ZSAqc2hvdWxkKiBuZXZlciBzZWUgYW4gaW52YWxpZCBJUlEgbnVtYmVy
LCBhdCB0aGUgbW9tZW50Lgo+IEkgbmVlZCB0byBjaGVjayBob3cgdGhpcyBjaGFuZ2VzIHdpdGgg
dGhlIElUUywgdGhvdWdoLgo+IAo+IFNvIHdlIGNvdWxkIGNoYW5nZSB0aGUgcHJvdG90eXBlIChi
YWNrKSB0byB2b2lkLCBidXQgcHJpbnQgc29tZSBlcnJvcgo+IG1lc3NhZ2UgaWYgdGhlIHZnaWNf
Z2V0X2lycSgpIGNhbGwgZmFpbHMgd2l0aGluIHZnaWNfaW5qZWN0X2lycSgpLgoKU291bmRzIGdv
b2QgdG8gbWUuIE1ha2Ugc3VyZSB0byBoYXZlIHRob3NlIG1lc3NhZ2UgdXNpbmcgdGhlIGxvZyBs
ZXZlbCAKZ3Vlc3QgZGVidWcgbWVzc2FnZS4gSSBtaWdodCBldmVuIGJlIHRlbXB0IHRvIHVzZSBk
Z3ByaW50ayguLi4pIGhlcmUgc28gCnRoZXkgZ2V0IGRyb3BwZWQgaW4gbm9uLWRlYnVnIGJ1aWxk
LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
