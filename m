From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12 v2 1/8] xen/page_alloc: Move
 get_pg_owner()/put_pg_owner() from x86 to common code
Date: Fri, 21 Dec 2018 10:53:39 +0000
Message-ID: <ac7e3136-aa62-e9b4-f7ef-c5ef50a3fdc1@arm.com>
References: <20181220192338.17526-1-julien.grall@arm.com>
 <20181220192338.17526-2-julien.grall@arm.com>
 <alpine.DEB.2.10.1812201451390.15901@sstabellini-ThinkPad-X260>
 <d5246829-8eca-3d87-8bb4-df2d87c153af@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8mGA=O6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gaIR6-0004QW-F0
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 10:53:44 +0000
In-Reply-To: <d5246829-8eca-3d87-8bb4-df2d87c153af@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Benjamin Sanda <ben.sanda@dornerworks.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyMC8xMi8yMDE4IDIyOjU5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDIwLzEy
LzIwMTggMjI6NTMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4KPj4+IGRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4+PiBp
bmRleCAyYzY1MDllM2EwLi5lZGI5M2I4YWRhIDEwMDY0NAo+Pj4gLS0tIGEveGVuL2NvbW1vbi9w
YWdlX2FsbG9jLmMKPj4+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4+PiBAQCAtMjUw
OSw2ICsyNTEwLDQzIEBAIHN0YXRpYyBfX2luaXQgaW50IHJlZ2lzdGVyX2hlYXBfdHJpZ2dlcih2
b2lkKQo+Pj4gICB9Cj4+PiAgIF9faW5pdGNhbGwocmVnaXN0ZXJfaGVhcF90cmlnZ2VyKTsKPj4+
ICAgCj4+PiArc3RydWN0IGRvbWFpbiAqZ2V0X3BnX293bmVyKGRvbWlkX3QgZG9taWQpCj4+PiAr
ewo+Pj4gKyAgICBzdHJ1Y3QgZG9tYWluICpwZ19vd25lciA9IE5VTEwsICpjdXJyID0gY3VycmVu
dC0+ZG9tYWluOwo+Pj4gKwo+Pj4gKyAgICBpZiAoIGxpa2VseShkb21pZCA9PSBET01JRF9TRUxG
KSApCj4+PiArICAgIHsKPj4+ICsgICAgICAgIHBnX293bmVyID0gcmN1X2xvY2tfY3VycmVudF9k
b21haW4oKTsKPj4+ICsgICAgICAgIGdvdG8gb3V0Owo+Pj4gKyAgICB9Cj4+PiArCj4+PiArICAg
IGlmICggdW5saWtlbHkoZG9taWQgPT0gY3Vyci0+ZG9tYWluX2lkKSApCj4+PiArICAgIHsKPj4+
ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLCAiQ2Fubm90IHNwZWNpZnkgaXRzZWxm
IGFzIGZvcmVpZ24gZG9tYWluXG4iKTsKPj4+ICsgICAgICAgIGdvdG8gb3V0Owo+Pj4gKyAgICB9
Cj4+PiArCj4+PiArICAgIHN3aXRjaCAoIGRvbWlkICkKPj4+ICsgICAgewo+Pj4gKyAgICBjYXNl
IERPTUlEX0lPOgo+Pj4gKyAgICAgICAgcGdfb3duZXIgPSByY3VfbG9ja19kb21haW4oZG9tX2lv
KTsKPj4+ICsgICAgICAgIGJyZWFrOwo+IAo+IE5ld2xpbmUuCj4gCj4+PiArICAgIGNhc2UgRE9N
SURfWEVOOgo+Pj4gKyAgICAgICAgcGdfb3duZXIgPSByY3VfbG9ja19kb21haW4oZG9tX3hlbik7
Cj4+PiArICAgICAgICBicmVhazsKPiAKPiBOZXdsaW5lLgo+IAo+Pj4gKyAgICBkZWZhdWx0Ogo+
Pj4gKyAgICAgICAgaWYgKCAocGdfb3duZXIgPSByY3VfbG9ja19kb21haW5fYnlfaWQoZG9taWQp
KSA9PSBOVUxMICkKPj4+ICsgICAgICAgIHsKPj4+ICsgICAgICAgICAgICBnZHByaW50ayhYRU5M
T0dfV0FSTklORywgIlVua25vd24gZG9tYWluIGQlZFxuIiwgZG9taWQpOwo+Pj4gKyAgICAgICAg
ICAgIGJyZWFrOwo+Pj4gKyAgICAgICAgfQo+Pj4gKyAgICAgICAgYnJlYWs7Cj4gCj4gaWYgKCAo
cGdfb3duZXIgPSByY3VfbG9ja19kb21haW5fYnlfaWQoZG9taWQpKSA9PSBOVUxMICkKPiAgwqDC
oMKgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLCAiVW5rbm93biBkb21haW4gZCVkXG4iLCBkb21p
ZCk7Cj4gCj4gYnJlYWs7Cj4gCj4gQWxsIHRyaXZpYWwsIHNvIFJldmlld2VkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IGFuZCBwbGVhc2UgZml4IG9uIGNv
bW1pdC4KClRoYW5rIHlvdSEgSSBoYXZlIG5vdyBjb21taXR0ZWQgdGhpcyBwYXRjaC4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
