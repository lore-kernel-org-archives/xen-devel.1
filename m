From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v7 8/9] x86/hvm: add nospec
 to hvmop param
Date: Mon, 25 Feb 2019 09:13:03 +0100
Message-ID: <b92d6b1a-7b2c-cbc9-356e-4dd9b32fa8dd@amazon.de>
References: <1550737003-25779-1-git-send-email-nmanthey@amazon.de>
 <1550737003-25779-9-git-send-email-nmanthey@amazon.de>
 <5C7009AD020000780021941F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9cCv=RA=amazon.de=prvs=952b5b9ed=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gyBOK-0003lG-84
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 08:13:36 +0000
In-Reply-To: <5C7009AD020000780021941F@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yMi8xOSAxNTozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjEuMDIuMTkgYXQg
MDk6MTYsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
aHZtL2h2bS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPj4gQEAgLTQxMDksNiAr
NDEwOSwxMyBAQCBzdGF0aWMgaW50IGh2bW9wX3NldF9wYXJhbSgKPj4gICAgICBpZiAoIGEuaW5k
ZXggPj0gSFZNX05SX1BBUkFNUyApCj4+ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+PiAgCj4+
ICsgICAgLyoKPj4gKyAgICAgKiBNYWtlIHN1cmUgdGhlIGd1ZXN0IGNvbnRyb2xsZWQgdmFsdWUg
YS5pbmRleCBpcyBib3VuZGVkIGV2ZW4gZHVyaW5nCj4+ICsgICAgICogc3BlY3VsYXRpdmUgZXhl
Y3V0aW9uLgo+PiArICAgICAqLwo+PiArICAgIGEuaW5kZXggPSBhcnJheV9pbmRleF9ub3NwZWMo
YS5pbmRleCwgSFZNX05SX1BBUkFNUyk7Cj4+ICsgICAgYmxvY2tfc3BlY3VsYXRpb24oKTsKPj4g
Kwo+PiAgICAgIGQgPSByY3VfbG9ja19kb21haW5fYnlfYW55X2lkKGEuZG9taWQpOwo+PiAgICAg
IGlmICggZCA9PSBOVUxMICkKPj4gICAgICAgICAgcmV0dXJuIC1FU1JDSDsKPj4gQEAgLTQzNzUs
NiArNDM4MiwxMyBAQCBzdGF0aWMgaW50IGh2bW9wX2dldF9wYXJhbSgKPj4gICAgICBpZiAoIGEu
aW5kZXggPj0gSFZNX05SX1BBUkFNUyApCj4+ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+PiAg
Cj4+ICsgICAgLyoKPj4gKyAgICAgKiBNYWtlIHN1cmUgdGhlIGd1ZXN0IGNvbnRyb2xsZWQgdmFs
dWUgYS5pbmRleCBpcyBib3VuZGVkIGV2ZW4gZHVyaW5nCj4+ICsgICAgICogc3BlY3VsYXRpdmUg
ZXhlY3V0aW9uLgo+PiArICAgICAqLwo+PiArICAgIGEuaW5kZXggPSBhcnJheV9pbmRleF9ub3Nw
ZWMoYS5pbmRleCwgSFZNX05SX1BBUkFNUyk7Cj4+ICsgICAgYmxvY2tfc3BlY3VsYXRpb24oKTsK
PiBQbGVhc2UgY2FuIHRoZSBjb21tZW50cyBicmllZmx5IGV4cGxhaW4gdGhlIG90aGVyd2lzZSBh
cHBhcmVudGx5Cj4gcG9pbnRsZXNzIHJlZHVuZGFuY3kgb2YgYm90aCBjb25zdHJ1Y3RzPwoKU3Vy
ZSwgSSB3aWxsIGFkZCBzb21lIHJlYXNvbmluZy4KCkJlc3QsCk5vcmJlcnQKCgoKCkFtYXpvbiBE
ZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxp
bgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApV
c3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0
ZW5idXJnIEhSQiAxNDkxNzMgQgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
