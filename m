From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 14/14] xen/mm: Provide dummy M2P-related
 helpers when !CONFIG_HAVE_M2P
Date: Fri, 10 May 2019 14:29:59 +0100
Message-ID: <8e10cc12-d9be-3891-fae9-501ab9a69019@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-15-julien.grall@arm.com>
 <5CD57C6F020000780022D8BC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP5bA-0004Ax-2c
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:30:04 +0000
In-Reply-To: <5CD57C6F020000780022D8BC@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMC8wNS8yMDE5IDE0OjI4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwNy4wNS4x
OSBhdCAxNzoxNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL21tLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL21tLmgKPj4gQEAgLTY1OCw0
ICs2NTgsMTggQEAgc3RhdGljIGlubGluZSB2b2lkIHNoYXJlX3hlbl9wYWdlX3dpdGhfcHJpdmls
ZWdlZF9ndWVzdHMoCj4+ICAgICAgIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3QocGFnZSwgZG9t
X3hlbiwgZmxhZ3MpOwo+PiAgIH0KPj4gICAKPj4gKy8qCj4+ICsgKiBEdW1teSBpbXBsZW1lbnRh
dGlvbiBvZiBNMlAtcmVsYXRlZCBoZWxwZXJzIGZvciBjb21tb24gY29kZSB3aGVuCj4+ICsgKiB0
aGUgYXJjaGl0ZWN0dXJlIGRvZXNuJ3QgaGF2ZSBhbiBNMlAuCj4+ICsgKi8KPj4gKyNpZm5kZWYg
Q09ORklHX0hBU19NMlAKPj4gKwo+PiArI2RlZmluZSBJTlZBTElEX00yUF9FTlRSWSAgICAgICAg
KH4wVUwpCj4+ICsjZGVmaW5lIFNIQVJFRF9NMlBfRU5UUlkgICAgICAgICAofjBVTCAtIDFVTCkK
Pj4gKyNkZWZpbmUgU0hBUkVEX00yUChfZSkgICAgICAgICAgICgoX2UpID09IFNIQVJFRF9NMlBf
RU5UUlkpCj4+ICsKPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzZXRfcGZuX2Zyb21fbWZuKG1mbl90
IG1mbiwgdW5zaWduZWQgbG9uZyBwZm4pIHt9Cj4+ICsKPj4gKyNlbmRpZgo+IAo+IEluIG9yZGVy
IGZvciB0aGluZ3MgdG8gbm90IGJlIHNjYXR0ZXJlZCBhcm91bmQsIGNvdWxkCj4gZG9tYWluX3No
YXJlZF9pbmZvX2dmbigpIChzZWUgcGF0Y2ggOSkgbW92ZSBoZXJlPyBJdCBkb2Vzbid0Cj4gbG9v
ayBhcyBpZiB0aGlzIHdvdWxkIGNhdXNlIGEgYnVpbGQgaXNzdWUuCgpUaGUgdHdvIGFyZSBkaWZm
ZXJlbnQsIG9uZSBkZWFsIHdpdGggbWVtb3J5LCB0aGUgb3RoZXIgd2l0aCBhIGRvbWFpbi4gU28g
dGhlIApjdXJyZW50IHNwbGl0IG1ha2VzIHNlbnNlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
