From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-4.12 v4 0/4] xen/arm: Implement Set/Way
 operations
Date: Tue, 18 Dec 2018 18:04:13 +0000
Message-ID: <20181218180417.22134-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v4z/=O3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gZJjF-0006a4-Sy
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 18:04:25 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKVGhpcyBpcyB2ZXJzaW9uIDMgb2YgdGhlIHNlcmllcyB0byBpbXBsZW1lbnQgc2V0
L3dheS4gRm9yIG1vcmUgZGV0YWlscyBzZWUKcGF0Y2ggIzMuCgpDaGVlcnMsCgpKdWxpZW4gR3Jh
bGwgKDQpOgogIHhlbi9hcm06IHZjcHJlZzogQWRkIHdyYXBwZXJzIHRvIGhhbmRsZSBjby1wcm9j
IGFjY2VzcyB0cmFwcGVkIGJ5CiAgICBIQ1JfRUwyLlRWTQogIHhlbi9hcm06IHZzeXNyZWc6IEFk
ZCB3cmFwcGVyIHRvIGhhbmRsZSBzeXNyZWcgYWNjZXNzIHRyYXBwZWQgYnkKICAgIEhDUl9FTDIu
VFZNCiAgeGVuL2FybTogSW1wbGVtZW50IFNldC9XYXkgb3BlcmF0aW9ucwogIHhlbi9hcm06IFRy
YWNrIHBhZ2UgYWNjZXNzZWQgYmV0d2VlbiBiYXRjaCBvZiBTZXQvV2F5IG9wZXJhdGlvbnMKCiB4
ZW4vYXJjaC9hcm0vYXJtNjQvdnN5c3JlZy5jIHwgIDc1ICsrKysrKysrKysrKysrKysrKysKIHhl
bi9hcmNoL2FybS9kb21haW4uYyAgICAgICAgfCAgMTQgKysrKwogeGVuL2FyY2gvYXJtL3AybS5j
ICAgICAgICAgICB8IDExOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIHhlbi9hcmNo
L2FybS90cmFwcy5jICAgICAgICAgfCAgMjUgKysrKysrLQogeGVuL2FyY2gvYXJtL3ZjcHJlZy5j
ICAgICAgICB8IDE3MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgIHwgICA0ICsKIHhlbi9jb21tb24vZG9tYWlu
LmMgICAgICAgICAgfCAgIDUgKy0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vY3ByZWdzLmggfCAgIDEg
KwogeGVuL2luY2x1ZGUvYXNtLWFybS9kb21haW4uaCB8ICAgOSArKysKIHhlbi9pbmNsdWRlL2Fz
bS1hcm0vcDJtLmggICAgfCAgMjIgKysrKysrCiB4ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmggICAg
IHwgICAyICsKIDExIGZpbGVzIGNoYW5nZWQsIDQ0MyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
