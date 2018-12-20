From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.12 v2 1/8] xen/page_alloc: Move
 get_pg_owner()/put_pg_owner() from x86 to common code
Date: Thu, 20 Dec 2018 22:59:44 +0000
Message-ID: <d5246829-8eca-3d87-8bb4-df2d87c153af@citrix.com>
References: <20181220192338.17526-1-julien.grall@arm.com>
 <20181220192338.17526-2-julien.grall@arm.com>
 <alpine.DEB.2.10.1812201451390.15901@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AWpf=O5=citrix.com=prvs=885be00c3=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ga7IC-0005EG-Cx
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 22:59:48 +0000
In-Reply-To: <alpine.DEB.2.10.1812201451390.15901@sstabellini-ThinkPad-X260>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Benjamin Sanda <ben.sanda@dornerworks.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMTIvMjAxOCAyMjo1MywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Cj4+IGRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5j
Cj4+IGluZGV4IDJjNjUwOWUzYTAuLmVkYjkzYjhhZGEgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9jb21t
b24vcGFnZV9hbGxvYy5jCj4+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4+IEBAIC0y
NTA5LDYgKzI1MTAsNDMgQEAgc3RhdGljIF9faW5pdCBpbnQgcmVnaXN0ZXJfaGVhcF90cmlnZ2Vy
KHZvaWQpCj4+ICB9Cj4+ICBfX2luaXRjYWxsKHJlZ2lzdGVyX2hlYXBfdHJpZ2dlcik7Cj4+ICAK
Pj4gK3N0cnVjdCBkb21haW4gKmdldF9wZ19vd25lcihkb21pZF90IGRvbWlkKQo+PiArewo+PiAr
ICAgIHN0cnVjdCBkb21haW4gKnBnX293bmVyID0gTlVMTCwgKmN1cnIgPSBjdXJyZW50LT5kb21h
aW47Cj4+ICsKPj4gKyAgICBpZiAoIGxpa2VseShkb21pZCA9PSBET01JRF9TRUxGKSApCj4+ICsg
ICAgewo+PiArICAgICAgICBwZ19vd25lciA9IHJjdV9sb2NrX2N1cnJlbnRfZG9tYWluKCk7Cj4+
ICsgICAgICAgIGdvdG8gb3V0Owo+PiArICAgIH0KPj4gKwo+PiArICAgIGlmICggdW5saWtlbHko
ZG9taWQgPT0gY3Vyci0+ZG9tYWluX2lkKSApCj4+ICsgICAgewo+PiArICAgICAgICBnZHByaW50
ayhYRU5MT0dfV0FSTklORywgIkNhbm5vdCBzcGVjaWZ5IGl0c2VsZiBhcyBmb3JlaWduIGRvbWFp
blxuIik7Cj4+ICsgICAgICAgIGdvdG8gb3V0Owo+PiArICAgIH0KPj4gKwo+PiArICAgIHN3aXRj
aCAoIGRvbWlkICkKPj4gKyAgICB7Cj4+ICsgICAgY2FzZSBET01JRF9JTzoKPj4gKyAgICAgICAg
cGdfb3duZXIgPSByY3VfbG9ja19kb21haW4oZG9tX2lvKTsKPj4gKyAgICAgICAgYnJlYWs7CgpO
ZXdsaW5lLgoKPj4gKyAgICBjYXNlIERPTUlEX1hFTjoKPj4gKyAgICAgICAgcGdfb3duZXIgPSBy
Y3VfbG9ja19kb21haW4oZG9tX3hlbik7Cj4+ICsgICAgICAgIGJyZWFrOwoKTmV3bGluZS4KCj4+
ICsgICAgZGVmYXVsdDoKPj4gKyAgICAgICAgaWYgKCAocGdfb3duZXIgPSByY3VfbG9ja19kb21h
aW5fYnlfaWQoZG9taWQpKSA9PSBOVUxMICkKPj4gKyAgICAgICAgewo+PiArICAgICAgICAgICAg
Z2RwcmludGsoWEVOTE9HX1dBUk5JTkcsICJVbmtub3duIGRvbWFpbiBkJWRcbiIsIGRvbWlkKTsK
Pj4gKyAgICAgICAgICAgIGJyZWFrOwo+PiArICAgICAgICB9Cj4+ICsgICAgICAgIGJyZWFrOwoK
aWYgKCAocGdfb3duZXIgPSByY3VfbG9ja19kb21haW5fYnlfaWQoZG9taWQpKSA9PSBOVUxMICkK
wqDCoMKgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLCAiVW5rbm93biBkb21haW4gZCVkXG4iLCBk
b21pZCk7CgpicmVhazsKCkFsbCB0cml2aWFsLCBzbyBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KYW5kIHBsZWFzZSBmaXggb24gY29tbWl0LgoK
fkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
