From: David Hildenbrand <david@redhat.com>
Subject: [PATCH RFCv2 4/6] powerpc/powernv: hold
 device_hotplug_lock when calling device_online()
Date: Tue, 21 Aug 2018 12:44:16 +0200
Message-ID: <20180821104418.12710-5-david__42415.0166953497$1534848213$gmane$org@redhat.com>
References: <20180821104418.12710-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=r+kp=le=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1fs49a-00027Z-Ry
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 10:44:50 +0000
In-Reply-To: <20180821104418.12710-1-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-mm@kvack.org
Cc: Michael Neuling <mikey@neuling.org>, linux-doc@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, xen-devel@lists.xenproject.org, devel@linuxdriverproject.org, Rashmica Gupta <rashmica.g@gmail.com>, linuxppc-dev@lists.ozlabs.org
List-Id: xen-devel@lists.xenproject.org

ZGV2aWNlX29ubGluZSgpIHNob3VsZCBiZSBjYWxsZWQgd2l0aCBkZXZpY2VfaG90cGx1Z19sb2Nr
KCkgaGVsZC4KCkNjOiBCZW5qYW1pbiBIZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFzaGlu
Zy5vcmc+CkNjOiBQYXVsIE1hY2tlcnJhcyA8cGF1bHVzQHNhbWJhLm9yZz4KQ2M6IE1pY2hhZWwg
RWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4KQ2M6IFJhc2htaWNhIEd1cHRhIDxyYXNobWlj
YS5nQGdtYWlsLmNvbT4KQ2M6IEJhbGJpciBTaW5naCA8YnNpbmdoYXJvcmFAZ21haWwuY29tPgpD
YzogTWljaGFlbCBOZXVsaW5nIDxtaWtleUBuZXVsaW5nLm9yZz4KU2lnbmVkLW9mZi1ieTogRGF2
aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Ci0tLQogYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy9wb3dlcm52L21lbXRyYWNlLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm52L21lbXRy
YWNlLmMgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvbWVtdHJhY2UuYwppbmRleCA4
ZjFjZDRmM2JmZDUuLmVmNzE4MWQ0ZmU2OCAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy9wb3dlcm52L21lbXRyYWNlLmMKKysrIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dl
cm52L21lbXRyYWNlLmMKQEAgLTIyOSw5ICsyMjksMTEgQEAgc3RhdGljIGludCBtZW10cmFjZV9v
bmxpbmUodm9pZCkKIAkJICogd2UgbmVlZCB0byBvbmxpbmUgdGhlIG1lbW9yeSBvdXJzZWx2ZXMu
CiAJCSAqLwogCQlpZiAoIW1lbWhwX2F1dG9fb25saW5lKSB7CisJCQlsb2NrX2RldmljZV9ob3Rw
bHVnKCk7CiAJCQl3YWxrX21lbW9yeV9yYW5nZShQRk5fRE9XTihlbnQtPnN0YXJ0KSwKIAkJCQkJ
ICBQRk5fVVAoZW50LT5zdGFydCArIGVudC0+c2l6ZSAtIDEpLAogCQkJCQkgIE5VTEwsIG9ubGlu
ZV9tZW1fYmxvY2spOworCQkJdW5sb2NrX2RldmljZV9ob3RwbHVnKCk7CiAJCX0KIAogCQkvKgot
LSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
