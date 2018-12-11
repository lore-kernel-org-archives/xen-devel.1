From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC 05/16] gic-vgic: Drop an excessive clear_lrs
Date: Tue, 11 Dec 2018 14:33:52 +0000
Message-ID: <ef5e171c-22a6-84a4-abcb-94eb843a68eb@arm.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-6-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Pqn2=OU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gWj6i-0004QA-Hp
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 14:33:56 +0000
In-Reply-To: <1543440731-21947-6-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmlpLAoKT24gMjgvMTEvMjAxOCAyMTozMiwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBG
cm9tOiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+IAo+IFRoaXMgYWN0
aW9uIGlzIGV4Y2Vzc2l2ZSBiZWNhdXNlIGZvciBhbiBpbnZhbGlkIExSIHRoZXJlIGlzIG5vIG5l
ZWQKPiB0byB3cml0ZSBhbm90aGVyIGludmFsaWQgdmFsdWUgdG8gYSByZWdpc3Rlci4gU28gd2Ug
Y2FuIHNraXAgaXQgaGVyZSwKPiBzYXZpbmcgYSBwZXJpcGhlcmFsIHJlZ2lzdGVyIGFjY2Vzcy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29t
Pgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMgfCAxIC0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMtdmdp
Yy5jIGIveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMKPiBpbmRleCA4Njk5ODdhLi40ZTE4MTY5IDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9naWMtdmdpYy5jCj4gKysrIGIveGVuL2FyY2gvYXJt
L2dpYy12Z2ljLmMKPiBAQCAtMjI3LDcgKzIyNyw2IEBAIHN0YXRpYyB2b2lkIGdpY191cGRhdGVf
b25lX2xyKHN0cnVjdCB2Y3B1ICp2LCBpbnQgaSkKPiAgICAgICB9Cj4gICAgICAgZWxzZQo+ICAg
ICAgIHsKPiAtICAgICAgICBnaWNfaHdfb3BzLT5jbGVhcl9scihpKTsKCkkgd291bGQgYWN0dWFs
bHkgcHJlZmVyIHRvIGtlZXAgdGhpcyBjb2RlIGZvciBkZWJ1ZyBidWlsZC4gVGhpcyBtYWtlcyBl
YXNpZXIgdG8gCnJlYWQgdGhlIGR1bXBlZCBMUnMgYXMgeW91IGRvbid0IGhhdmUgdG8gd29ycnkg
YWJvdXQgaW52YWxpZCBvbmUuCgpXaXRoICNpZm5kZWYgTkRFQlVHIGFuZCB0aGUgYXBwcm9wcmlh
dGUgY29tbWVudDoKClJldmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPgoKRmVlbCBmcmVlIHRvIHJlc2VudCBpdCBhbG9uZSBzbyBpdCBjYW4gYmUgbWVyZ2VkIHRv
IFhlbiA0LjEyLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
