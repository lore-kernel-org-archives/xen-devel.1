From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 11/12] xen: specify support for EXPERT and
 DEBUG Kconfig options
Date: Fri,  6 Jul 2018 16:14:02 -0700
Message-ID: <1530918843-14318-11-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1807061537300.13502@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1807061537300.13502@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: Tim Deegan <tim@xen.org>, sstabellini@kernel.org, andrii_anisov@epam.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Ian.Jackson@eu.citrix.com, George.Dunlap@citrix.com, dfaggioli@suse.com, jbeulich@suse.com, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

QWRkIGEgY2xlYXIgc3RhdGVtZW50IGFib3V0IHRoZW0sIHJlZmxlY3RpbmcgdGhlIGN1cnJlbnQg
c2VjdXJpdHkKc3VwcG9ydCBzdGF0dXMgb2YgS2NvbmZpZyBvcHRpb25zIChubyBjaGFuZ2VzIHRv
IGN1cnJlbnQgcG9saWNpZXMpLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogR2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tCkND
OiBJYW4uSmFja3NvbkBldS5jaXRyaXguY29tCkNDOiBqYmV1bGljaEBzdXNlLmNvbQpDQzogYW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbQpDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQu
d2lsa0BvcmFjbGUuY29tPgpDQzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNDOiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KQ2hhbmdlcyBpbiB2NzoKLSB0YWxrIGFib3V0IEVY
UEVSVCBhbmQgREVCVUcgcmF0aGVyIHRoYW4gQ09ORklHX0VYUEVSVCBhbmQgQ09ORklHX0RFQlVH
Ci0tLQogU1VQUE9SVC5tZCB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvU1VQUE9SVC5tZCBiL1NVUFBPUlQubWQKaW5kZXggMjY0YjIzZi4u
ZTNlNDllMiAxMDA2NDQKLS0tIGEvU1VQUE9SVC5tZAorKysgYi9TVVBQT1JULm1kCkBAIC0xNiw2
ICsxNiwxMiBAQCBmb3IgdGhlIGRlZmluaXRpb25zIG9mIHRoZSBzdXBwb3J0IHN0YXR1cyBsZXZl
bHMgZXRjLgogCiAjIEZlYXR1cmUgU3VwcG9ydAogCisjIyBLY29uZmlnCisKK0VYUEVSVCBhbmQg
REVCVUcgS2NvbmZpZyBvcHRpb25zIGFyZSBub3Qgc2VjdXJpdHkgc3VwcG9ydGVkLiBPdGhlcgor
S2NvbmZpZyBvcHRpb25zIGFyZSBzdXBwb3J0ZWQsIGlmIHRoZSByZWxhdGVkIGZlYXR1cmVzIGFy
ZSBtYXJrZWQgYXMKK3N1cHBvcnRlZCBpbiB0aGlzIGRvY3VtZW50LgorCiAjIyBIb3N0IEFyY2hp
dGVjdHVyZQogCiAjIyMgeDg2LTY0Ci0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
