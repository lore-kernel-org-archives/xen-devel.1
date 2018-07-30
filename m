From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 11/11] xen: specify support for EXPERT and
 DEBUG Kconfig options
Date: Mon, 30 Jul 2018 10:48:32 -0700
Message-ID: <1532972912-12439-11-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1807301042060.20701@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1807301042060.20701@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: Tim Deegan <tim@xen.org>, sstabellini@kernel.org, andrii_anisov@epam.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Ian.Jackson@eu.citrix.com, xen-devel@lists.xen.org, jbeulich@suse.com, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWRkIGEgY2xlYXIgc3RhdGVtZW50IGFib3V0IHRoZW0sIHJlZmxlY3RpbmcgdGhlIGN1cnJlbnQg
c2VjdXJpdHkKc3VwcG9ydCBzdGF0dXMgb2YgS2NvbmZpZyBvcHRpb25zIChubyBjaGFuZ2VzIHRv
IGN1cnJlbnQgcG9saWNpZXMpLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgpDQzogR2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tCkNDOiBJYW4uSmFja3NvbkBl
dS5jaXRyaXguY29tCkNDOiBqYmV1bGljaEBzdXNlLmNvbQpDQzogYW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbQpDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
PgpDQzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRy
aXguY29tPgotLS0KQ2hhbmdlcyBpbiB2NzoKLSB0YWxrIGFib3V0IEVYUEVSVCBhbmQgREVCVUcg
cmF0aGVyIHRoYW4gQ09ORklHX0VYUEVSVCBhbmQgQ09ORklHX0RFQlVHCi0tLQogU1VQUE9SVC5t
ZCB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvU1VQUE9SVC5tZCBiL1NVUFBPUlQubWQKaW5kZXggMjY0YjIzZi4uZTNlNDllMiAxMDA2NDQK
LS0tIGEvU1VQUE9SVC5tZAorKysgYi9TVVBQT1JULm1kCkBAIC0xNiw2ICsxNiwxMiBAQCBmb3Ig
dGhlIGRlZmluaXRpb25zIG9mIHRoZSBzdXBwb3J0IHN0YXR1cyBsZXZlbHMgZXRjLgogCiAjIEZl
YXR1cmUgU3VwcG9ydAogCisjIyBLY29uZmlnCisKK0VYUEVSVCBhbmQgREVCVUcgS2NvbmZpZyBv
cHRpb25zIGFyZSBub3Qgc2VjdXJpdHkgc3VwcG9ydGVkLiBPdGhlcgorS2NvbmZpZyBvcHRpb25z
IGFyZSBzdXBwb3J0ZWQsIGlmIHRoZSByZWxhdGVkIGZlYXR1cmVzIGFyZSBtYXJrZWQgYXMKK3N1
cHBvcnRlZCBpbiB0aGlzIGRvY3VtZW50LgorCiAjIyBIb3N0IEFyY2hpdGVjdHVyZQogCiAjIyMg
eDg2LTY0Ci0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
