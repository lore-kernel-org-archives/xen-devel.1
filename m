From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 21/62] ts-kernel-build: disable host1x,
 which doesn't build
Date: Wed, 10 Apr 2019 15:23:27 +0100
Message-ID: <20190410142408.22848-22-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEBb-0001BQ-Iq
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:26:47 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, dri-devel@lists.freedesktop.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkVtcGlyaWNhbGx5LCBvbiBzdHJl
dGNoIGFybWhmOgoKICBkcml2ZXJzL2dwdS9ob3N0MXgvY2RtYS5jOiBJbiBmdW5jdGlvbiBgaG9z
dDF4X3B1c2hidWZmZXJfaW5pdCc6CiAgZHJpdmVycy9ncHUvaG9zdDF4L2NkbWEuYzo5NDo0ODog
ZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMyBvZiBgZG1hX2FsbG9jX3djJyBmcm9tIGluY29tcGF0
aWJsZSBwb2ludGVyIHR5cGUgWy1XZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCiAg
ICAgcGItPm1hcHBlZCA9IGRtYV9hbGxvY193Yyhob3N0MXgtPmRldiwgc2l6ZSwgJnBiLT5waHlz
LAoJCQkJCQkgIF4KZXRjLgoKVGhpcyBpcyBibG9ja2luZyB0aGUgdXBncmFkZSBvZiB0aGUgWGVu
IFByb2plY3QgQ0kgdG8gRGViaWFuIHN0cmV0Y2gKc28gZGlzYWJsZSBpdCBmb3Igbm93LgoKU2ln
bmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CkNDOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwu
Y29tPgpDQzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwotLS0KIHRzLWtlcm5lbC1i
dWlsZCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvdHMta2VybmVsLWJ1aWxkIGIvdHMta2VybmVsLWJ1aWxkCmluZGV4IDIxYjhmNzhhLi4wYmM0
NDNkZSAxMDA3NTUKLS0tIGEvdHMta2VybmVsLWJ1aWxkCisrKyBiL3RzLWtlcm5lbC1idWlsZApA
QCAtNTk0LDYgKzU5NCw5IEBAIGNhc2UgJHtYRU5fVEFSR0VUX0FSQ0h9IGluCiAgICAgKikgOzsK
IGVzYWMKIAorIyBEaXNhYmxlIGNvbXBvbmVudHMgdGhhdCBkb24ndCBidWlsZAorc2V0b3B0IENP
TkZJR19URUdSQV9IT1NUMVggbgorCiBleGl0IDAKIEVORAogfQotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
