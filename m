From: Alexander Graf <graf@amazon.com>
Subject: Re: [PATCH v2 2/2] KVM: x86: Implement the
 arch-specific hook to report the VM UUID
Date: Thu, 16 May 2019 06:56:01 -0700
Message-ID: <f51a6a84-b21c-ab75-7e30-bfbe2ac6b98b__46823.3555716992$1558015024$gmane$org@amazon.com>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-3-git-send-email-sironi@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sIOE=TQ=amazon.com=prvs=03207e7a1=graf@srs-us1.protection.inumbo.net>)
 id 1hRGrk-000244-8n
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:56:12 +0000
In-Reply-To: <1557847002-23519-3-git-send-email-sironi@amazon.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Filippo Sironi <sironi@amazon.de>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, borntraeger@de.ibm.com, boris.ostrovsky@oracle.com, cohuck@redhat.com, konrad.wilk@oracle.com, xen-devel@lists.xenproject.org, vasu.srinivasan@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMTQuMDUuMTkgMDg6MTYsIEZpbGlwcG8gU2lyb25pIHdyb3RlOgo+IE9uIHg4Niwgd2UgcmVw
b3J0IHRoZSBVVUlEIGluIERNSSBTeXN0ZW0gSW5mb3JtYXRpb24gKGkuZS4sIERNSSBUeXBlIDEp
Cj4gYXMgVk0gVVVJRC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGaWxpcHBvIFNpcm9uaSA8c2lyb25p
QGFtYXpvbi5kZT4KPiAtLS0KPiAgYXJjaC94ODYva2VybmVsL2t2bS5jIHwgNyArKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC94
ODYva2VybmVsL2t2bS5jIGIvYXJjaC94ODYva2VybmVsL2t2bS5jCj4gaW5kZXggNWM5M2E2NWVl
MWU1Li40NDFjYWIwOGEwOWQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYva2VybmVsL2t2bS5jCj4g
KysrIGIvYXJjaC94ODYva2VybmVsL2t2bS5jCj4gQEAgLTI1LDYgKzI1LDcgQEAKPiAgI2luY2x1
ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICAjaW5jbHVkZSA8bGludXgva3ZtX3BhcmEuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L2NwdS5oPgo+ICsjaW5jbHVkZSA8bGludXgvZG1pLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9tbS5oPgo+ICAjaW5jbHVkZSA8bGludXgvaGlnaG1lbS5oPgo+ICAjaW5jbHVkZSA8
bGludXgvaGFyZGlycS5oPgo+IEBAIC02OTQsNiArNjk1LDEyIEBAIGJvb2wga3ZtX3BhcmFfYXZh
aWxhYmxlKHZvaWQpCj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3BhcmFfYXZhaWxhYmxl
KTsKPiAgCj4gK2NvbnN0IGNoYXIgKmt2bV9wYXJhX2dldF91dWlkKHZvaWQpCj4gK3sKPiArCXJl
dHVybiBkbWlfZ2V0X3N5c3RlbV9pbmZvKERNSV9QUk9EVUNUX1VVSUQpOwoKVGhpcyBhZGRzIGEg
bmV3IGRlcGVuZGVuY3kgb24gQ09ORklHX0RNSS4gUHJvYmFibHkgYmVzdCB0byBndWFyZCBpdCB3
aXRoCmFuICNpZiBJU19FTkFCTEVEKENPTkZJR19ETUkpLgoKVGhlIGNvbmNlcHQgc2VlbXMgc291
bmQgdGhvdWdoLgoKCkFsZXgKCj4gK30KPiArRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3BhcmFfZ2V0
X3V1aWQpOwo+ICsKPiAgdW5zaWduZWQgaW50IGt2bV9hcmNoX3BhcmFfZmVhdHVyZXModm9pZCkK
PiAgewo+ICAJcmV0dXJuIGNwdWlkX2VheChrdm1fY3B1aWRfYmFzZSgpIHwgS1ZNX0NQVUlEX0ZF
QVRVUkVTKTsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
