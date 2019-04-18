From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 10/21] TestSupport: Make "broken" print
 the actual job state
Date: Thu, 18 Apr 2019 17:31:47 +0100
Message-ID: <20190418163158.11408-11-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xO-00026E-42
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:14 +0000
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UgZXhjZXB0IHRvIGEgbWVzc2FnZS4KClNpZ25lZC1vZmYtYnk6
IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvVGVz
dFN1cHBvcnQucG0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIGIvT3NzdGVzdC9U
ZXN0U3VwcG9ydC5wbQppbmRleCAzOGMxN2Q2MC4uZTIxOGZmMzUgMTAwNjQ0Ci0tLSBhL09zc3Rl
c3QvVGVzdFN1cHBvcnQucG0KKysrIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQpAQCAtMjQyLDcg
KzI0Miw3IEBAIHN1YiBicm9rZW4gKCQ7JCkgewogICAgICAgICAgICAgICAgQU5EIChzdGF0dXM9
J3F1ZXVlZCcgT1Igc3RhdHVzPSdydW5uaW5nJyBPUiBzdGF0dXM9J3ByZXBhcmluZycpCiBFTkQK
ICAgICB9KTsKLSAgICBkaWUgIkJST0tFTjogJG07ICIuICgkYWZmZWN0ZWQ+MCA/ICJtYXJrZWQg
JGZsaWdodC4kam9iICRuZXdzdCIKKyAgICBkaWUgdWMoJG5ld3N0KS4iOiAkbTsgIi4gKCRhZmZl
Y3RlZD4wID8gIm1hcmtlZCAkZmxpZ2h0LiRqb2IgJG5ld3N0IgogICAgICAgICAgICAgICAgICAg
ICAgICAgIDogIigkZmxpZ2h0LiRqb2Igbm90IG1hcmtlZCAkbmV3c3QpIik7CiB9CiAKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
