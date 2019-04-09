From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 10/12] xen/arm: mm: Mark
 check_memory_layout_alignment_constraints as unused
Date: Tue, 9 Apr 2019 13:09:20 +0100
Message-ID: <f1eda839-5ab6-712d-71a6-0b259cb8057c@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-11-julien.grall@arm.com>
 <eadcbf5c-6a94-0dd7-a9fa-744ff367276a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zDjF=SL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDpZ7-0006Qk-0K
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:09:25 +0000
In-Reply-To: <eadcbf5c-6a94-0dd7-a9fa-744ff367276a@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMjcvMDMvMjAxOSAxOToxMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAyNy8wMy8yMDE5IDE4OjQ1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IENsYW5nIHdpbGwgdGhy
b3cgYW4gZXJyb3IgaWYgYSBmdW5jdGlvbiBpcyB1bnVzZWQgdW5sZXNzIHlvdSB0ZWxsCj4+IHRv
IGlnbm9yZSBpdC4gVGhpcyBjYW4gYmUgZG9uZSB1c2luZyBfX21heWJlX3VudXNlZC4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gLS0t
Cj4+ICAgeGVuL2FyY2gvYXJtL21tLmMgfCAzICsrLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKPj4gaW5kZXggMDFhZTJjY2NjMC4uZDM3OTI1MDUx
YSAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJtL21tLmMKPj4gKysrIGIveGVuL2FyY2gvYXJt
L21tLmMKPj4gQEAgLTE2MCw3ICsxNjAsOCBAQCB1bnNpZ25lZCBsb25nIHRvdGFsX3BhZ2VzOwo+
PiAgIGV4dGVybiBjaGFyIF9faW5pdF9iZWdpbltdLCBfX2luaXRfZW5kW107Cj4+ICAgCj4+ICAg
LyogQ2hlY2tpbmcgVkEgbWVtb3J5IGxheW91dCBhbGlnbm1lbnQuICovCj4+IC1zdGF0aWMgaW5s
aW5lIHZvaWQgY2hlY2tfbWVtb3J5X2xheW91dF9hbGlnbm1lbnRfY29uc3RyYWludHModm9pZCkg
ewo+PiArc3RhdGljIF9fbWF5YmVfdW51c2VkIHZvaWQgY2hlY2tfbWVtb3J5X2xheW91dF9hbGln
bm1lbnRfY29uc3RyYWludHModm9pZCkKPiAKPiBBcyB5b3UncmUgYWxyZWFkeSBjaGFuZ2luZyB0
aGlzLi4uCj4gCj4gVGhlIHN0eWxlIHVzZWQgZWxzZXdoZXJlIGlzCj4gCj4gc3RhdGljIHZvaWQg
X19pbml0IF9fbWF5YmVfdW51c2VkIGJ1aWxkX2Fzc2VydGlvbnModm9pZCkKPiAKPiB3aGljaCBo
YXMgdGhlIGFkZGVkIGFkdmFudGFnZSB0aGF0IGl0IG1vcmUgb2J2aW91cyB0byBmdXR1cmUgZGV2
ZWxvcGVycwo+IHRoYXQgdHJ5aW5nIHRvIHB1dCBjb2RlIG90aGVyIHRoYW4gQlVJTERfQlVHX09O
KCkgaW4gaXQgaXMgYSBiYWQgaWRlYS4KCkdvb2QgcG9pbnQuIEkgd2lsbCB1cGRhdGUgdGhpcyBw
YXRjaCAoYW5kIHRoZSBmb2xsb3dpbmcgb25lKSB0byByZW5hbWUgdGhlIApmdW5jdGlvbiBhcyB3
ZWxsLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
