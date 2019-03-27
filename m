From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 10/12] xen/arm: mm: Mark
 check_memory_layout_alignment_constraints as unused
Date: Wed, 27 Mar 2019 19:10:28 +0000
Message-ID: <eadcbf5c-6a94-0dd7-a9fa-744ff367276a@citrix.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-11-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kI0R=R6=citrix.com=prvs=9824fb700=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h9Dwv-0005Tf-2Q
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 19:10:57 +0000
In-Reply-To: <20190327184531.30986-11-julien.grall@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDMvMjAxOSAxODo0NSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENsYW5nIHdpbGwgdGhy
b3cgYW4gZXJyb3IgaWYgYSBmdW5jdGlvbiBpcyB1bnVzZWQgdW5sZXNzIHlvdSB0ZWxsCj4gdG8g
aWdub3JlIGl0LiBUaGlzIGNhbiBiZSBkb25lIHVzaW5nIF9fbWF5YmVfdW51c2VkLgo+Cj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAtLS0KPiAg
eGVuL2FyY2gvYXJtL21tLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94
ZW4vYXJjaC9hcm0vbW0uYwo+IGluZGV4IDAxYWUyY2NjYzAuLmQzNzkyNTA1MWEgMTAwNjQ0Cj4g
LS0tIGEveGVuL2FyY2gvYXJtL21tLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYwo+IEBAIC0x
NjAsNyArMTYwLDggQEAgdW5zaWduZWQgbG9uZyB0b3RhbF9wYWdlczsKPiAgZXh0ZXJuIGNoYXIg
X19pbml0X2JlZ2luW10sIF9faW5pdF9lbmRbXTsKPiAgCj4gIC8qIENoZWNraW5nIFZBIG1lbW9y
eSBsYXlvdXQgYWxpZ25tZW50LiAqLwo+IC1zdGF0aWMgaW5saW5lIHZvaWQgY2hlY2tfbWVtb3J5
X2xheW91dF9hbGlnbm1lbnRfY29uc3RyYWludHModm9pZCkgewo+ICtzdGF0aWMgX19tYXliZV91
bnVzZWQgdm9pZCBjaGVja19tZW1vcnlfbGF5b3V0X2FsaWdubWVudF9jb25zdHJhaW50cyh2b2lk
KQoKQXMgeW91J3JlIGFscmVhZHkgY2hhbmdpbmcgdGhpcy4uLgoKVGhlIHN0eWxlIHVzZWQgZWxz
ZXdoZXJlIGlzCgpzdGF0aWMgdm9pZCBfX2luaXQgX19tYXliZV91bnVzZWQgYnVpbGRfYXNzZXJ0
aW9ucyh2b2lkKQoKd2hpY2ggaGFzIHRoZSBhZGRlZCBhZHZhbnRhZ2UgdGhhdCBpdCBtb3JlIG9i
dmlvdXMgdG8gZnV0dXJlIGRldmVsb3BlcnMKdGhhdCB0cnlpbmcgdG8gcHV0IGNvZGUgb3RoZXIg
dGhhbiBCVUlMRF9CVUdfT04oKSBpbiBpdCBpcyBhIGJhZCBpZGVhLgoKSXQgdG9vayBtZSBhIG1v
bWVudCB0byByZWFsaXNlIHRoYXQgdGhpcyBmdW5jdGlvbiBkZWxpYmVyYXRlbHkgd2Fzbid0CmNh
bGxlZC4KCn5BbmRyZXcKCj4gK3sKPiAgICAgIC8qIDJNQiBhbGlnbmVkIHJlZ2lvbnMgKi8KPiAg
ICAgIEJVSUxEX0JVR19PTihYRU5fVklSVF9TVEFSVCAmIH5TRUNPTkRfTUFTSyk7Cj4gICAgICBC
VUlMRF9CVUdfT04oRklYTUFQX0FERFIoMCkgJiB+U0VDT05EX01BU0spOwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
