From: David Hildenbrand <david@redhat.com>
Subject: [PATCH v3 4/6] powerpc/powernv: hold
 device_hotplug_lock when calling device_online()
Date: Thu, 27 Sep 2018 11:25:52 +0200
Message-ID: <20180927092554.13567-5-david__28464.2777442516$1538040325$gmane$org@redhat.com>
References: <20180927092554.13567-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=dfte=mj=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1g5SZC-0003Ak-KX
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 09:26:38 +0000
In-Reply-To: <20180927092554.13567-1-david@redhat.com>
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
YzogTWljaGFlbCBOZXVsaW5nIDxtaWtleUBuZXVsaW5nLm9yZz4KUmV2aWV3ZWQtYnk6IFBhdmVs
IFRhdGFzaGluIDxwYXZlbC50YXRhc2hpbkBtaWNyb3NvZnQuY29tPgpSZXZpZXdlZC1ieTogUmFz
aG1pY2EgR3VwdGEgPHJhc2htaWNhLmdAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBI
aWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KLS0tCiBhcmNoL3Bvd2VycGMvcGxhdGZvcm1z
L3Bvd2VybnYvbWVtdHJhY2UuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvbWVtdHJhY2Uu
YyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi9tZW10cmFjZS5jCmluZGV4IDc3MzYy
M2Y2YmZiMS4uZmRkNDhmMWEzOWY3IDEwMDY0NAotLS0gYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1z
L3Bvd2VybnYvbWVtdHJhY2UuYworKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYv
bWVtdHJhY2UuYwpAQCAtMjQyLDkgKzI0MiwxMSBAQCBzdGF0aWMgaW50IG1lbXRyYWNlX29ubGlu
ZSh2b2lkKQogCQkgKiB3ZSBuZWVkIHRvIG9ubGluZSB0aGUgbWVtb3J5IG91cnNlbHZlcy4KIAkJ
ICovCiAJCWlmICghbWVtaHBfYXV0b19vbmxpbmUpIHsKKwkJCWxvY2tfZGV2aWNlX2hvdHBsdWco
KTsKIAkJCXdhbGtfbWVtb3J5X3JhbmdlKFBGTl9ET1dOKGVudC0+c3RhcnQpLAogCQkJCQkgIFBG
Tl9VUChlbnQtPnN0YXJ0ICsgZW50LT5zaXplIC0gMSksCiAJCQkJCSAgTlVMTCwgb25saW5lX21l
bV9ibG9jayk7CisJCQl1bmxvY2tfZGV2aWNlX2hvdHBsdWcoKTsKIAkJfQogCiAJCS8qCi0tIAoy
LjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
