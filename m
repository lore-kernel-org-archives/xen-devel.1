From: "Sironi, Filippo" <sironi@amazon.de>
Subject: Re: [PATCH v2 2/2] KVM: x86: Implement the
 arch-specific hook to report the VM UUID
Date: Thu, 16 May 2019 15:25:00 +0000
Message-ID: <7395EFE9-0B38-4B61-81D4-E8450561AABE__2862.61864691681$1558020358$gmane$org@amazon.de>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-3-git-send-email-sironi@amazon.de>
 <f51a6a84-b21c-ab75-7e30-bfbe2ac6b98b@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XxdW=TQ=amazon.de=prvs=03221fa14=sironi@srs-us1.protection.inumbo.net>)
 id 1hRIFm-0002hj-Ud
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:25:06 +0000
In-Reply-To: <f51a6a84-b21c-ab75-7e30-bfbe2ac6b98b@amazon.com>
Content-Language: en-US
Content-ID: <322B72780715F949BC86D7AC0C1B0C37@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Graf, Alexander" <graf@amazon.com>
Cc: KVM list <kvm@vger.kernel.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "cohuck@redhat.com" <cohuck@redhat.com>, LKML <linux-kernel@vger.kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "vasu.srinivasan@oracle.com" <vasu.srinivasan@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Cj4gT24gMTYuIE1heSAyMDE5LCBhdCAxNTo1NiwgR3JhZiwgQWxleGFuZGVyIDxncmFmQGFtYXpv
bi5jb20+IHdyb3RlOgo+IAo+IE9uIDE0LjA1LjE5IDA4OjE2LCBGaWxpcHBvIFNpcm9uaSB3cm90
ZToKPj4gT24geDg2LCB3ZSByZXBvcnQgdGhlIFVVSUQgaW4gRE1JIFN5c3RlbSBJbmZvcm1hdGlv
biAoaS5lLiwgRE1JIFR5cGUgMSkKPj4gYXMgVk0gVVVJRC4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6
IEZpbGlwcG8gU2lyb25pIDxzaXJvbmlAYW1hem9uLmRlPgo+PiAtLS0KPj4gYXJjaC94ODYva2Vy
bmVsL2t2bS5jIHwgNyArKysrKysrCj4+IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykK
Pj4gCj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwva3ZtLmMgYi9hcmNoL3g4Ni9rZXJu
ZWwva3ZtLmMKPj4gaW5kZXggNWM5M2E2NWVlMWU1Li40NDFjYWIwOGEwOWQgMTAwNjQ0Cj4+IC0t
LSBhL2FyY2gveDg2L2tlcm5lbC9rdm0uYwo+PiArKysgYi9hcmNoL3g4Ni9rZXJuZWwva3ZtLmMK
Pj4gQEAgLTI1LDYgKzI1LDcgQEAKPj4gI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+PiAjaW5j
bHVkZSA8bGludXgva3ZtX3BhcmEuaD4KPj4gI2luY2x1ZGUgPGxpbnV4L2NwdS5oPgo+PiArI2lu
Y2x1ZGUgPGxpbnV4L2RtaS5oPgo+PiAjaW5jbHVkZSA8bGludXgvbW0uaD4KPj4gI2luY2x1ZGUg
PGxpbnV4L2hpZ2htZW0uaD4KPj4gI2luY2x1ZGUgPGxpbnV4L2hhcmRpcnEuaD4KPj4gQEAgLTY5
NCw2ICs2OTUsMTIgQEAgYm9vbCBrdm1fcGFyYV9hdmFpbGFibGUodm9pZCkKPj4gfQo+PiBFWFBP
UlRfU1lNQk9MX0dQTChrdm1fcGFyYV9hdmFpbGFibGUpOwo+PiAKPj4gK2NvbnN0IGNoYXIgKmt2
bV9wYXJhX2dldF91dWlkKHZvaWQpCj4+ICt7Cj4+ICsJcmV0dXJuIGRtaV9nZXRfc3lzdGVtX2lu
Zm8oRE1JX1BST0RVQ1RfVVVJRCk7Cj4gCj4gVGhpcyBhZGRzIGEgbmV3IGRlcGVuZGVuY3kgb24g
Q09ORklHX0RNSS4gUHJvYmFibHkgYmVzdCB0byBndWFyZCBpdCB3aXRoCj4gYW4gI2lmIElTX0VO
QUJMRUQoQ09ORklHX0RNSSkuCj4gCj4gVGhlIGNvbmNlcHQgc2VlbXMgc291bmQgdGhvdWdoLgo+
IAo+IEFsZXgKCmluY2x1ZGUvbGludXgvZG1pLmggY29udGFpbnMgYSBkdW1teSBpbXBsZW1lbnRh
dGlvbiBvZgpkbWlfZ2V0X3N5c3RlbV9pbmZvIHRoYXQgcmV0dXJucyBOVUxMIGlmIENPTkZJR19E
TUkgaXNuJ3QgZGVmaW5lZC4KVGhpcyBpcyBlbm91Z2ggdW5sZXNzIHdlIGRlY2lkZSB0byByZXR1
cm4gIjxkZW5pZWQ+IiBsaWtlIGluIFhlbi4KSWYgdGhlbiwgd2UgY2FuIGhhdmUgdGhlIGNoZWNr
IGluIHRoZSBnZW5lcmljIGNvZGUgdG8gdHVybiBOVUxMCmludG8gIjxkZW5pZWQ+Ii4KCkZpbGlw
cG8KCgo+PiArfQo+PiArRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3BhcmFfZ2V0X3V1aWQpOwo+PiAr
Cj4+IHVuc2lnbmVkIGludCBrdm1fYXJjaF9wYXJhX2ZlYXR1cmVzKHZvaWQpCj4+IHsKPj4gCXJl
dHVybiBjcHVpZF9lYXgoa3ZtX2NwdWlkX2Jhc2UoKSB8IEtWTV9DUFVJRF9GRUFUVVJFUyk7CgoK
CgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAox
MDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYg
SGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNo
dCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
