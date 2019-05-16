From: Alexander Graf <graf@amazon.com>
Subject: Re: [PATCH v2 2/2] KVM: x86: Implement the
 arch-specific hook to report the VM UUID
Date: Thu, 16 May 2019 08:33:49 -0700
Message-ID: <8c6a2de2-f080-aad5-16af-c4a5eafb31af__2628.64734265662$1558020888$gmane$org@amazon.com>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-3-git-send-email-sironi@amazon.de>
 <f51a6a84-b21c-ab75-7e30-bfbe2ac6b98b@amazon.com>
 <7395EFE9-0B38-4B61-81D4-E8450561AABE@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sIOE=TQ=amazon.com=prvs=03207e7a1=graf@srs-us1.protection.inumbo.net>)
 id 1hRIOL-0003kK-AB
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:33:57 +0000
In-Reply-To: <7395EFE9-0B38-4B61-81D4-E8450561AABE@amazon.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Sironi, Filippo" <sironi@amazon.de>
Cc: KVM list <kvm@vger.kernel.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "cohuck@redhat.com" <cohuck@redhat.com>, LKML <linux-kernel@vger.kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "vasu.srinivasan@oracle.com" <vasu.srinivasan@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDE2LjA1LjE5IDA4OjI1LCBTaXJvbmksIEZpbGlwcG8gd3JvdGU6Cj4+IE9uIDE2LiBNYXkg
MjAxOSwgYXQgMTU6NTYsIEdyYWYsIEFsZXhhbmRlciA8Z3JhZkBhbWF6b24uY29tPiB3cm90ZToK
Pj4KPj4gT24gMTQuMDUuMTkgMDg6MTYsIEZpbGlwcG8gU2lyb25pIHdyb3RlOgo+Pj4gT24geDg2
LCB3ZSByZXBvcnQgdGhlIFVVSUQgaW4gRE1JIFN5c3RlbSBJbmZvcm1hdGlvbiAoaS5lLiwgRE1J
IFR5cGUgMSkKPj4+IGFzIFZNIFVVSUQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRmlsaXBwbyBT
aXJvbmkgPHNpcm9uaUBhbWF6b24uZGU+Cj4+PiAtLS0KPj4+IGFyY2gveDg2L2tlcm5lbC9rdm0u
YyB8IDcgKysrKysrKwo+Pj4gMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+
IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwva3ZtLmMgYi9hcmNoL3g4Ni9rZXJuZWwva3Zt
LmMKPj4+IGluZGV4IDVjOTNhNjVlZTFlNS4uNDQxY2FiMDhhMDlkIDEwMDY0NAo+Pj4gLS0tIGEv
YXJjaC94ODYva2VybmVsL2t2bS5jCj4+PiArKysgYi9hcmNoL3g4Ni9rZXJuZWwva3ZtLmMKPj4+
IEBAIC0yNSw2ICsyNSw3IEBACj4+PiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4+PiAjaW5j
bHVkZSA8bGludXgva3ZtX3BhcmEuaD4KPj4+ICNpbmNsdWRlIDxsaW51eC9jcHUuaD4KPj4+ICsj
aW5jbHVkZSA8bGludXgvZG1pLmg+Cj4+PiAjaW5jbHVkZSA8bGludXgvbW0uaD4KPj4+ICNpbmNs
dWRlIDxsaW51eC9oaWdobWVtLmg+Cj4+PiAjaW5jbHVkZSA8bGludXgvaGFyZGlycS5oPgo+Pj4g
QEAgLTY5NCw2ICs2OTUsMTIgQEAgYm9vbCBrdm1fcGFyYV9hdmFpbGFibGUodm9pZCkKPj4+IH0K
Pj4+IEVYUE9SVF9TWU1CT0xfR1BMKGt2bV9wYXJhX2F2YWlsYWJsZSk7Cj4+Pgo+Pj4gK2NvbnN0
IGNoYXIgKmt2bV9wYXJhX2dldF91dWlkKHZvaWQpCj4+PiArewo+Pj4gKwlyZXR1cm4gZG1pX2dl
dF9zeXN0ZW1faW5mbyhETUlfUFJPRFVDVF9VVUlEKTsKPj4gVGhpcyBhZGRzIGEgbmV3IGRlcGVu
ZGVuY3kgb24gQ09ORklHX0RNSS4gUHJvYmFibHkgYmVzdCB0byBndWFyZCBpdCB3aXRoCj4+IGFu
ICNpZiBJU19FTkFCTEVEKENPTkZJR19ETUkpLgo+Pgo+PiBUaGUgY29uY2VwdCBzZWVtcyBzb3Vu
ZCB0aG91Z2guCj4+Cj4+IEFsZXgKPiBpbmNsdWRlL2xpbnV4L2RtaS5oIGNvbnRhaW5zIGEgZHVt
bXkgaW1wbGVtZW50YXRpb24gb2YKPiBkbWlfZ2V0X3N5c3RlbV9pbmZvIHRoYXQgcmV0dXJucyBO
VUxMIGlmIENPTkZJR19ETUkgaXNuJ3QgZGVmaW5lZC4KCgpPaCwgSSBtaXNzZWQgdGhhdCBiaXQu
IEF3ZXNvbWUhIExlc3Mgd29yayA6KS4KCgo+IFRoaXMgaXMgZW5vdWdoIHVubGVzcyB3ZSBkZWNp
ZGUgdG8gcmV0dXJuICI8ZGVuaWVkPiIgbGlrZSBpbiBYZW4uCj4gSWYgdGhlbiwgd2UgY2FuIGhh
dmUgdGhlIGNoZWNrIGluIHRoZSBnZW5lcmljIGNvZGUgdG8gdHVybiBOVUxMCj4gaW50byAiPGRl
bmllZD4iLgoKClllcy4gV2FpdGluZyBmb3Igc29tZW9uZSBmcm9tIFhlbiB0byBhbnN3ZXIgdGhp
cyA6KQoKCkFsZXgKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
