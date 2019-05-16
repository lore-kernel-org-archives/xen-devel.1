From: "Sironi, Filippo" <sironi@amazon.de>
Subject: Re: [PATCH v2 2/2] KVM: x86: Implement the
 arch-specific hook to report the VM UUID
Date: Thu, 16 May 2019 17:41:13 +0000
Message-ID: <DD0087B6-094D-4D07-9C85-827881E3DDD0__1733.11322448484$1558028536$gmane$org@amazon.de>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-3-git-send-email-sironi@amazon.de>
 <f51a6a84-b21c-ab75-7e30-bfbe2ac6b98b@amazon.com>
 <7395EFE9-0B38-4B61-81D4-E8450561AABE@amazon.de>
 <8c6a2de2-f080-aad5-16af-c4a5eafb31af@amazon.com>
 <3a9762a2-24e8-a842-862d-fadae563361d@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XxdW=TQ=amazon.de=prvs=03221fa14=sironi@srs-us1.protection.inumbo.net>)
 id 1hRKNd-0007QB-7k
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 17:41:21 +0000
In-Reply-To: <3a9762a2-24e8-a842-862d-fadae563361d@oracle.com>
Content-Language: en-US
Content-ID: <26EC1043BA52854DA988B6F84C5E0C27@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: KVM list <kvm@vger.kernel.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "cohuck@redhat.com" <cohuck@redhat.com>, LKML <linux-kernel@vger.kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, "Graf,
 Alexander" <graf@amazon.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "vasu.srinivasan@oracle.com" <vasu.srinivasan@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Cj4gT24gMTYuIE1heSAyMDE5LCBhdCAxODo0MCwgQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ry
b3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gCj4gT24gNS8xNi8xOSAxMTozMyBBTSwgQWxleGFu
ZGVyIEdyYWYgd3JvdGU6Cj4+IE9uIDE2LjA1LjE5IDA4OjI1LCBTaXJvbmksIEZpbGlwcG8gd3Jv
dGU6Cj4+Pj4gT24gMTYuIE1heSAyMDE5LCBhdCAxNTo1NiwgR3JhZiwgQWxleGFuZGVyIDxncmFm
QGFtYXpvbi5jb20+IHdyb3RlOgo+Pj4+IAo+Pj4+IE9uIDE0LjA1LjE5IDA4OjE2LCBGaWxpcHBv
IFNpcm9uaSB3cm90ZToKPj4+Pj4gT24geDg2LCB3ZSByZXBvcnQgdGhlIFVVSUQgaW4gRE1JIFN5
c3RlbSBJbmZvcm1hdGlvbiAoaS5lLiwgRE1JIFR5cGUgMSkKPj4+Pj4gYXMgVk0gVVVJRC4KPj4+
Pj4gCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEZpbGlwcG8gU2lyb25pIDxzaXJvbmlAYW1hem9uLmRl
Pgo+Pj4+PiAtLS0KPj4+Pj4gYXJjaC94ODYva2VybmVsL2t2bS5jIHwgNyArKysrKysrCj4+Pj4+
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPj4+Pj4gCj4+Pj4+IGRpZmYgLS1naXQg
YS9hcmNoL3g4Ni9rZXJuZWwva3ZtLmMgYi9hcmNoL3g4Ni9rZXJuZWwva3ZtLmMKPj4+Pj4gaW5k
ZXggNWM5M2E2NWVlMWU1Li40NDFjYWIwOGEwOWQgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2FyY2gveDg2
L2tlcm5lbC9rdm0uYwo+Pj4+PiArKysgYi9hcmNoL3g4Ni9rZXJuZWwva3ZtLmMKPj4+Pj4gQEAg
LTI1LDYgKzI1LDcgQEAKPj4+Pj4gI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+Pj4+PiAjaW5j
bHVkZSA8bGludXgva3ZtX3BhcmEuaD4KPj4+Pj4gI2luY2x1ZGUgPGxpbnV4L2NwdS5oPgo+Pj4+
PiArI2luY2x1ZGUgPGxpbnV4L2RtaS5oPgo+Pj4+PiAjaW5jbHVkZSA8bGludXgvbW0uaD4KPj4+
Pj4gI2luY2x1ZGUgPGxpbnV4L2hpZ2htZW0uaD4KPj4+Pj4gI2luY2x1ZGUgPGxpbnV4L2hhcmRp
cnEuaD4KPj4+Pj4gQEAgLTY5NCw2ICs2OTUsMTIgQEAgYm9vbCBrdm1fcGFyYV9hdmFpbGFibGUo
dm9pZCkKPj4+Pj4gfQo+Pj4+PiBFWFBPUlRfU1lNQk9MX0dQTChrdm1fcGFyYV9hdmFpbGFibGUp
Owo+Pj4+PiAKPj4+Pj4gK2NvbnN0IGNoYXIgKmt2bV9wYXJhX2dldF91dWlkKHZvaWQpCj4+Pj4+
ICt7Cj4+Pj4+ICsJcmV0dXJuIGRtaV9nZXRfc3lzdGVtX2luZm8oRE1JX1BST0RVQ1RfVVVJRCk7
Cj4+Pj4gVGhpcyBhZGRzIGEgbmV3IGRlcGVuZGVuY3kgb24gQ09ORklHX0RNSS4gUHJvYmFibHkg
YmVzdCB0byBndWFyZCBpdCB3aXRoCj4+Pj4gYW4gI2lmIElTX0VOQUJMRUQoQ09ORklHX0RNSSku
Cj4+Pj4gCj4+Pj4gVGhlIGNvbmNlcHQgc2VlbXMgc291bmQgdGhvdWdoLgo+Pj4+IAo+Pj4+IEFs
ZXgKPj4+IGluY2x1ZGUvbGludXgvZG1pLmggY29udGFpbnMgYSBkdW1teSBpbXBsZW1lbnRhdGlv
biBvZgo+Pj4gZG1pX2dldF9zeXN0ZW1faW5mbyB0aGF0IHJldHVybnMgTlVMTCBpZiBDT05GSUdf
RE1JIGlzbid0IGRlZmluZWQuCj4+IAo+PiBPaCwgSSBtaXNzZWQgdGhhdCBiaXQuIEF3ZXNvbWUh
IExlc3Mgd29yayA6KS4KPj4gCj4+IAo+Pj4gVGhpcyBpcyBlbm91Z2ggdW5sZXNzIHdlIGRlY2lk
ZSB0byByZXR1cm4gIjxkZW5pZWQ+IiBsaWtlIGluIFhlbi4KPj4+IElmIHRoZW4sIHdlIGNhbiBo
YXZlIHRoZSBjaGVjayBpbiB0aGUgZ2VuZXJpYyBjb2RlIHRvIHR1cm4gTlVMTAo+Pj4gaW50byAi
PGRlbmllZD4iLgo+PiAKPj4gWWVzLiBXYWl0aW5nIGZvciBzb21lb25lIGZyb20gWGVuIHRvIGFu
c3dlciB0aGlzIDopCj4gCj4gTm90IHN1cmUgSSBhbSBhbnN3ZXJpbmcgeW91ciBxdWVzdGlvbiBi
dXQgb24gWGVuIHdlIHJldHVybiBVVUlEIHZhbHVlCj4gemVybyBpZiBhY2Nlc3MgcGVybWlzc2lv
bnMgYXJlIG5vdCBzdWZmaWNpZW50LiBOb3QgPGRlbmllZD4uCj4gCj4gaHR0cDovL3hlbmJpdHMu
eGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWJsb2I7Zj14ZW4vY29tbW9uL2tlcm5lbC5jO2g9
NjEyNTc1NDMwZjFjZTdmYWY1YmQ2NmU3YTk5ZjE3NThjNjNmYjNjYjtoYj1IRUFEI2w1MDYKPiAK
PiAtYm9yaXMKClRoZW4sIEkgYmVsaWV2ZSB0aGF0IHJldHVybmluZyAwMDAwMDAwMC0wMDAwLTAw
MDAtMDAwMC0wMDAwMDAwMDAwMDAKaW5zdGVhZCBvZiBOVUxMIGluIHRoZSB3ZWFrIGltcGxlbWVu
dGF0aW9uIG9mIDEvMiBhbmQgdHJhbnNsYXRpbmcKTlVMTCBpbnRvIDAwMDAwMDAwLTAwMDAtMDAw
MC0wMDAwLTAwMDAwMDAwMDAwMCBpcyB0aGUgYmV0dGVyIGFwcHJvYWNoLgoKSSdsbCByZXBvc3Qu
CgpGaWxpcHBvCgoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3Jh
dXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBDaHJpc3RpYW4gU2No
bGFlZ2VyLCBSYWxmIEhlcmJyaWNoClVzdC1JRDogREUgMjg5IDIzNyA4NzkKRWluZ2V0cmFnZW4g
YW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
