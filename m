From: Alexander Graf <graf@amazon.com>
Subject: Re: [PATCH v2 2/2] KVM: x86: Implement the
 arch-specific hook to report the VM UUID
Date: Thu, 16 May 2019 10:49:03 -0700
Message-ID: <cb50c8a6-58e7-e123-feb9-d9dd2bc33b34__39294.2975902528$1558029011$gmane$org@amazon.com>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-3-git-send-email-sironi@amazon.de>
 <f51a6a84-b21c-ab75-7e30-bfbe2ac6b98b@amazon.com>
 <7395EFE9-0B38-4B61-81D4-E8450561AABE@amazon.de>
 <8c6a2de2-f080-aad5-16af-c4a5eafb31af@amazon.com>
 <3a9762a2-24e8-a842-862d-fadae563361d@oracle.com>
 <DD0087B6-094D-4D07-9C85-827881E3DDD0@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sIOE=TQ=amazon.com=prvs=03207e7a1=graf@srs-us1.protection.inumbo.net>)
 id 1hRKVE-0007iX-Vb
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 17:49:13 +0000
In-Reply-To: <DD0087B6-094D-4D07-9C85-827881E3DDD0@amazon.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Sironi, Filippo" <sironi@amazon.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: KVM list <kvm@vger.kernel.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "cohuck@redhat.com" <cohuck@redhat.com>, LKML <linux-kernel@vger.kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "vasu.srinivasan@oracle.com" <vasu.srinivasan@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDE2LjA1LjE5IDEwOjQxLCBTaXJvbmksIEZpbGlwcG8gd3JvdGU6Cj4+IE9uIDE2LiBNYXkg
MjAxOSwgYXQgMTg6NDAsIEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5j
b20+IHdyb3RlOgo+Pgo+PiBPbiA1LzE2LzE5IDExOjMzIEFNLCBBbGV4YW5kZXIgR3JhZiB3cm90
ZToKPj4+IE9uIDE2LjA1LjE5IDA4OjI1LCBTaXJvbmksIEZpbGlwcG8gd3JvdGU6Cj4+Pj4+IE9u
IDE2LiBNYXkgMjAxOSwgYXQgMTU6NTYsIEdyYWYsIEFsZXhhbmRlciA8Z3JhZkBhbWF6b24uY29t
PiB3cm90ZToKPj4+Pj4KPj4+Pj4gT24gMTQuMDUuMTkgMDg6MTYsIEZpbGlwcG8gU2lyb25pIHdy
b3RlOgo+Pj4+Pj4gT24geDg2LCB3ZSByZXBvcnQgdGhlIFVVSUQgaW4gRE1JIFN5c3RlbSBJbmZv
cm1hdGlvbiAoaS5lLiwgRE1JIFR5cGUgMSkKPj4+Pj4+IGFzIFZNIFVVSUQuCj4+Pj4+Pgo+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogRmlsaXBwbyBTaXJvbmkgPHNpcm9uaUBhbWF6b24uZGU+Cj4+Pj4+
PiAtLS0KPj4+Pj4+IGFyY2gveDg2L2tlcm5lbC9rdm0uYyB8IDcgKysrKysrKwo+Pj4+Pj4gMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9rZXJuZWwva3ZtLmMgYi9hcmNoL3g4Ni9rZXJuZWwva3ZtLmMKPj4+Pj4+IGluZGV4
IDVjOTNhNjVlZTFlNS4uNDQxY2FiMDhhMDlkIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvYXJjaC94ODYv
a2VybmVsL2t2bS5jCj4+Pj4+PiArKysgYi9hcmNoL3g4Ni9rZXJuZWwva3ZtLmMKPj4+Pj4+IEBA
IC0yNSw2ICsyNSw3IEBACj4+Pj4+PiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4+Pj4+PiAj
aW5jbHVkZSA8bGludXgva3ZtX3BhcmEuaD4KPj4+Pj4+ICNpbmNsdWRlIDxsaW51eC9jcHUuaD4K
Pj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvZG1pLmg+Cj4+Pj4+PiAjaW5jbHVkZSA8bGludXgvbW0u
aD4KPj4+Pj4+ICNpbmNsdWRlIDxsaW51eC9oaWdobWVtLmg+Cj4+Pj4+PiAjaW5jbHVkZSA8bGlu
dXgvaGFyZGlycS5oPgo+Pj4+Pj4gQEAgLTY5NCw2ICs2OTUsMTIgQEAgYm9vbCBrdm1fcGFyYV9h
dmFpbGFibGUodm9pZCkKPj4+Pj4+IH0KPj4+Pj4+IEVYUE9SVF9TWU1CT0xfR1BMKGt2bV9wYXJh
X2F2YWlsYWJsZSk7Cj4+Pj4+Pgo+Pj4+Pj4gK2NvbnN0IGNoYXIgKmt2bV9wYXJhX2dldF91dWlk
KHZvaWQpCj4+Pj4+PiArewo+Pj4+Pj4gKwlyZXR1cm4gZG1pX2dldF9zeXN0ZW1faW5mbyhETUlf
UFJPRFVDVF9VVUlEKTsKPj4+Pj4gVGhpcyBhZGRzIGEgbmV3IGRlcGVuZGVuY3kgb24gQ09ORklH
X0RNSS4gUHJvYmFibHkgYmVzdCB0byBndWFyZCBpdCB3aXRoCj4+Pj4+IGFuICNpZiBJU19FTkFC
TEVEKENPTkZJR19ETUkpLgo+Pj4+Pgo+Pj4+PiBUaGUgY29uY2VwdCBzZWVtcyBzb3VuZCB0aG91
Z2guCj4+Pj4+Cj4+Pj4+IEFsZXgKPj4+PiBpbmNsdWRlL2xpbnV4L2RtaS5oIGNvbnRhaW5zIGEg
ZHVtbXkgaW1wbGVtZW50YXRpb24gb2YKPj4+PiBkbWlfZ2V0X3N5c3RlbV9pbmZvIHRoYXQgcmV0
dXJucyBOVUxMIGlmIENPTkZJR19ETUkgaXNuJ3QgZGVmaW5lZC4KPj4+IE9oLCBJIG1pc3NlZCB0
aGF0IGJpdC4gQXdlc29tZSEgTGVzcyB3b3JrIDopLgo+Pj4KPj4+Cj4+Pj4gVGhpcyBpcyBlbm91
Z2ggdW5sZXNzIHdlIGRlY2lkZSB0byByZXR1cm4gIjxkZW5pZWQ+IiBsaWtlIGluIFhlbi4KPj4+
PiBJZiB0aGVuLCB3ZSBjYW4gaGF2ZSB0aGUgY2hlY2sgaW4gdGhlIGdlbmVyaWMgY29kZSB0byB0
dXJuIE5VTEwKPj4+PiBpbnRvICI8ZGVuaWVkPiIuCj4+PiBZZXMuIFdhaXRpbmcgZm9yIHNvbWVv
bmUgZnJvbSBYZW4gdG8gYW5zd2VyIHRoaXMgOikKPj4gTm90IHN1cmUgSSBhbSBhbnN3ZXJpbmcg
eW91ciBxdWVzdGlvbiBidXQgb24gWGVuIHdlIHJldHVybiBVVUlEIHZhbHVlCj4+IHplcm8gaWYg
YWNjZXNzIHBlcm1pc3Npb25zIGFyZSBub3Qgc3VmZmljaWVudC4gTm90IDxkZW5pZWQ+Lgo+Pgo+
PiBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXhlbi9j
b21tb24va2VybmVsLmM7aD02MTI1NzU0MzBmMWNlN2ZhZjViZDY2ZTdhOTlmMTc1OGM2M2ZiM2Ni
O2hiPUhFQUQjbDUwNgo+Pgo+PiAtYm9yaXMKPiBUaGVuLCBJIGJlbGlldmUgdGhhdCByZXR1cm5p
bmcgMDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAtMDAwMDAwMDAwMDAwCj4gaW5zdGVhZCBvZiBOVUxM
IGluIHRoZSB3ZWFrIGltcGxlbWVudGF0aW9uIG9mIDEvMiBhbmQgdHJhbnNsYXRpbmcKPiBOVUxM
IGludG8gMDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAtMDAwMDAwMDAwMDAwIGlzIHRoZSBiZXR0ZXIg
YXBwcm9hY2guCgoKSnVzdCBrZWVwIGl0IGF0IE5VTEwgaW4ga3ZtX3BhcmFfZ2V0X3V1aWQoKSBh
bmQgY29udmVydCB0byB0aGUgY2Fub25pY2FsCjAwMDAwMDAwLTAwMDAtMDAwMC0wMDAwLTAwMDAw
MDAwMDAwMCBpbiB1dWlkX3Nob3coKS4KCkFsZXgKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
