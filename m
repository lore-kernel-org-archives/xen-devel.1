From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 12/15] xen/arm: p2m: Rename ret to mfn in
 p2m_lookup
Date: Tue, 14 Aug 2018 14:35:00 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808141434530.15066@sstabellini-ThinkPad-X260>
References: <20180716172712.20294-1-julien.grall@arm.com>
 <20180716172712.20294-13-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pgrk=k5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fpgxz-0001yk-Mw
 for xen-devel@lists.xenproject.org; Tue, 14 Aug 2018 21:35:03 +0000
In-Reply-To: <20180716172712.20294-13-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxNiBKdWwgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENvbWVzdGljIGNoYW5n
ZSB0byBtYWtlIGNsZWFyZXIgd2hhdCBpcyB0aGUgcmV0dXJuICgncmV0JyBpcyBhIGJpdAo+IHRv
byBnZW5lcmljKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBsaW5hcm8ub3JnPgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9wMm0uYyB8IDYgKysrLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9wMm0uYyBiL3hlbi9hcmNoL2FybS9wMm0uYwo+IGluZGV4IDA3
OTI1YTFiZTQuLjY2ZDU4ZmFiZDcgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3AybS5jCj4g
KysrIGIveGVuL2FyY2gvYXJtL3AybS5jCj4gQEAgLTM4MywxNCArMzgzLDE0IEBAIG91dDoKPiAg
Cj4gIG1mbl90IHAybV9sb29rdXAoc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCBwMm1fdHlw
ZV90ICp0KQo+ICB7Cj4gLSAgICBtZm5fdCByZXQ7Cj4gKyAgICBtZm5fdCBtZm47Cj4gICAgICBz
dHJ1Y3QgcDJtX2RvbWFpbiAqcDJtID0gcDJtX2dldF9ob3N0cDJtKGQpOwo+ICAKPiAgICAgIHAy
bV9yZWFkX2xvY2socDJtKTsKPiAtICAgIHJldCA9IHAybV9nZXRfZW50cnkocDJtLCBnZm4sIHQs
IE5VTEwsIE5VTEwpOwo+ICsgICAgbWZuID0gcDJtX2dldF9lbnRyeShwMm0sIGdmbiwgdCwgTlVM
TCwgTlVMTCk7Cj4gICAgICBwMm1fcmVhZF91bmxvY2socDJtKTsKPiAgCj4gLSAgICByZXR1cm4g
cmV0Owo+ICsgICAgcmV0dXJuIG1mbjsKPiAgfQo+ICAKPiAgaW50IGd1ZXN0X3BoeXNtYXBfbWFy
a19wb3B1bGF0ZV9vbl9kZW1hbmQoc3RydWN0IGRvbWFpbiAqZCwKPiAtLSAKPiAyLjExLjAKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
