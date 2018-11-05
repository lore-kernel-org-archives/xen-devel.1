From: Samuel Ortiz <sameo@linux.intel.com>
Subject: [PATCH v5 23/24] hw: i386: Set ACPI configuration PCI
 host pointer
Date: Mon,  5 Nov 2018 02:40:46 +0100
Message-ID: <20181105014047.26447-24-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j2jf=nq=linux.intel.com=sameo@srs-us1.protection.inumbo.net>)
 id 1gJTvb-0004qH-Ns
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 01:43:43 +0000
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

Rm9yIGJvdGggUEMgYW5kIFEzNSBtYWNoaW5lIHR5cGVzLCB3ZSBjYW4gc2V0IGl0IGF0IHRoZSBQ
Q0kgaG9zdApicmlkZ2UgY3JlYXRpb24gdGltZS4KClNpZ25lZC1vZmYtYnk6IFNhbXVlbCBPcnRp
eiA8c2FtZW9AbGludXguaW50ZWwuY29tPgotLS0KIGh3L2kzODYvcGNfcGlpeC5jIHwgMSArCiBo
dy9pMzg2L3BjX3EzNS5jICB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9ody9pMzg2L3BjX3BpaXguYyBiL2h3L2kzODYvcGNfcGlpeC5jCmluZGV4
IGY1YjEzOWEzZWIuLmYxZjBkZTM1ODUgMTAwNjQ0Ci0tLSBhL2h3L2kzODYvcGNfcGlpeC5jCisr
KyBiL2h3L2kzODYvcGNfcGlpeC5jCkBAIC0yMTYsNiArMjE2LDcgQEAgc3RhdGljIHZvaWQgcGNf
aW5pdDEoTWFjaGluZVN0YXRlICptYWNoaW5lLAogICAgICAgICBub19ocGV0ID0gMTsKICAgICB9
CiAgICAgaXNhX2J1c19pcnFzKGlzYV9idXMsIHBjbXMtPmdzaSk7CisgICAgYWNwaV9jb25mLT5w
Y2lfaG9zdCA9IHBjaV9ob3N0OwogCiAgICAgaWYgKGt2bV9waWNfaW5fa2VybmVsKCkpIHsKICAg
ICAgICAgaTgyNTkgPSBrdm1faTgyNTlfaW5pdChpc2FfYnVzKTsKZGlmZiAtLWdpdCBhL2h3L2kz
ODYvcGNfcTM1LmMgYi9ody9pMzg2L3BjX3EzNS5jCmluZGV4IGNkZGU0YTRiZWIuLmE4NzcyZTI5
YTUgMTAwNjQ0Ci0tLSBhL2h3L2kzODYvcGNfcTM1LmMKKysrIGIvaHcvaTM4Ni9wY19xMzUuYwpA
QCAtMTg4LDYgKzE4OCw3IEBAIHN0YXRpYyB2b2lkIHBjX3EzNV9pbml0KE1hY2hpbmVTdGF0ZSAq
bWFjaGluZSkKICAgICBxZGV2X2luaXRfbm9mYWlsKERFVklDRShxMzVfaG9zdCkpOwogICAgIHBo
YiA9IFBDSV9IT1NUX0JSSURHRShxMzVfaG9zdCk7CiAgICAgaG9zdF9idXMgPSBwaGItPmJ1czsK
KyAgICBhY3BpX2NvbmYtPnBjaV9ob3N0ID0gcGhiOwogICAgIC8qIGNyZWF0ZSBJU0EgYnVzICov
CiAgICAgbHBjID0gcGNpX2NyZWF0ZV9zaW1wbGVfbXVsdGlmdW5jdGlvbihob3N0X2J1cywgUENJ
X0RFVkZOKElDSDlfTFBDX0RFViwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIElDSDlfTFBDX0ZVTkMpLCB0cnVlLAotLSAKMi4xOS4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
