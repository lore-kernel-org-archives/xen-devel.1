From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 12/13] xen: specify support for EXPERT and
 DEBUG Kconfig options
Date: Wed, 13 Jun 2018 14:14:51 -0700
Message-ID: <1528924492-6579-12-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1806131409300.14695@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1806131409300.14695@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: artem_mygaiev@epam.com, lars.kurth@citrix.com, sstabellini@kernel.org, andrii_anisov@epam.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Ian.Jackson@eu.citrix.com, dfaggioli@suse.com, jbeulich@suse.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

QWRkIGEgY2xlYXIgc3RhdGVtZW50IGFib3V0IHRoZW0sIHJlZmxlY3RpbmcgdGhlIGN1cnJlbnQg
c2VjdXJpdHkKc3VwcG9ydCBzdGF0dXMgb2YgS2NvbmZpZyBvcHRpb25zIChubyBjaGFuZ2VzIHRv
IGN1cnJlbnQgcG9saWNpZXMpLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogR2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tCkND
OiBJYW4uSmFja3NvbkBldS5jaXRyaXguY29tCkNDOiBqYmV1bGljaEBzdXNlLmNvbQpDQzogYW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbQotLS0KIFNVUFBPUlQubWQgfCA3ICsrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9TVVBQT1JULm1kIGIvU1VQ
UE9SVC5tZAppbmRleCBmOTZjMzhjLi5jNWVjODQ5IDEwMDY0NAotLS0gYS9TVVBQT1JULm1kCisr
KyBiL1NVUFBPUlQubWQKQEAgLTE2LDYgKzE2LDEzIEBAIGZvciB0aGUgZGVmaW5pdGlvbnMgb2Yg
dGhlIHN1cHBvcnQgc3RhdHVzIGxldmVscyBldGMuCiAKICMgRmVhdHVyZSBTdXBwb3J0CiAKKyMj
IEtjb25maWcKKworS2NvbmZpZyBvcHRpb25zIHRoYXQgZGVwZW5kIG9uIENPTkZJR19FWFBFUlQg
b3IgQ09ORklHX0RFQlVHIGFyZSBub3QKK3NlY3VyaXR5IHN1cHBvcnRlZC4gT3RoZXIgS2NvbmZp
ZyBvcHRpb25zIHRoYXQgZG8gbm90IGRlcGVuZCBvbgorQ09ORklHX0VYUEVSVCBvciBDT05GSUdf
REVCVUcgYXJlIHN1cHBvcnRlZCwgaWYgdGhlIHJlbGF0ZWQgZmVhdHVyZXMgYXJlCittYXJrZWQg
YXMgc3VwcG9ydGVkIGluIHRoaXMgZG9jdW1lbnQuCisKICMjIEhvc3QgQXJjaGl0ZWN0dXJlCiAK
ICMjIyB4ODYtNjQKLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
