From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 1/7] xen/pvh: Split CONFIG_XEN_PVH into
 CONFIG_PVH and CONFIG_XEN_PVH
Date: Tue, 20 Mar 2018 12:23:30 -0700
Message-ID: <cb065150-0035-abf0-1d38-99011e4b4605__4463.98767312548$1521573792$gmane$org@infradead.org>
References: <1521573369-17216-1-git-send-email-maran.wilson@oracle.com>
 <1521573486-17304-1-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=la7x=gk=infradead.org=rdunlap@srs-us1.protection.inumbo.net>)
 id 1eyMrm-0000fk-8L
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 19:24:14 +0000
In-Reply-To: <1521573486-17304-1-git-send-email-maran.wilson@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org, pbonzini@redhat.com, jgross@suse.com
Cc: thomas.lendacky@amd.com, dave.hansen@linux.intel.com, rkrcmar@redhat.com, hpa@zytor.com, mingo@redhat.com, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, boris.ostrovsky@oracle.com, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMy8yMC8yMDE4IDEyOjE4IFBNLCBNYXJhbiBXaWxzb24gd3JvdGU6Cj4gSW4gb3Jk
ZXIgdG8gcGF2ZSB0aGUgd2F5IGZvciBoeXBlcnZpc29ycyBvdGhlciB0aGVuIFhlbiB0byB1c2Ug
dGhlIFBWSAoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHRoYW4KCj4gZW50cnkgcG9pbnQgZm9yIFZNcywgd2UgbmVlZCB0byBmYWN0b3IgdGhlIFBWSCBl
bnRyeSBjb2RlIGludG8gWGVuIHNwZWNpZmljCj4gYW5kIGh5cGVydmlzb3IgYWdub3N0aWMgY29t
cG9uZW50cy4gVGhlIGZpcnN0IHN0ZXAgaW4gZG9pbmcgdGhhdCwgaXMgdG8KPiBjcmVhdGUgYSBu
ZXcgY29uZmlnIG9wdGlvbiBmb3IgUFZIIGVudHJ5IHRoYXQgY2FuIGJlIGVuYWJsZWQKPiBpbmRl
cGVuZGVudGx5IGZyb20gQ09ORklHX1hFTi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJhbiBXaWxz
b24gPG1hcmFuLndpbHNvbkBvcmFjbGUuY29tPgo+IC0tLQo+ICBhcmNoL3g4Ni9LY29uZmlnICAg
ICAgICAgIHwgNyArKysrKysrCj4gIGFyY2gveDg2L2tlcm5lbC9oZWFkXzY0LlMgfCA0ICsrLS0K
PiAgYXJjaC94ODYveGVuL0tjb25maWcgICAgICB8IDMgKystCj4gIDMgZmlsZXMgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC94
ODYvS2NvbmZpZyBiL2FyY2gveDg2L0tjb25maWcKPiBpbmRleCBlYjdmNDNmMjM1MjEuLjU4ODMx
MzIwYjVkMiAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9LY29uZmlnCj4gKysrIGIvYXJjaC94ODYv
S2NvbmZpZwo+IEBAIC03OTEsNiArNzkxLDEzIEBAIGNvbmZpZyBLVk1fR1VFU1QKPiAgCSAgdW5k
ZXJseWluZyBkZXZpY2UgbW9kZWwsIHRoZSBob3N0IHByb3ZpZGVzIHRoZSBndWVzdCB3aXRoCj4g
IAkgIHRpbWluZyBpbmZyYXN0cnVjdHVyZSBzdWNoIGFzIHRpbWUgb2YgZGF5LCBhbmQgc3lzdGVt
IHRpbWUKPiAgCj4gK2NvbmZpZyBQVkgKPiArCWJvb2wgIlN1cHBvcnQgZm9yIHJ1bm5pbmcgUFZI
IGd1ZXN0cyIKPiArCWRlZl9ib29sIG4KCllvdSBkb24ndCBuZWVkIHR3byAoMikgImJvb2wicyBo
ZXJlLiBBbmQgJ24nIGlzIGFscmVhZHkgdGhlIGRlZmF1bHQsIHNvIGp1c3QKZHJvcCB0aGUgc2Vj
b25kIGxpbmUuCgo+ICsJLS0taGVscC0tLQo+ICsJICBUaGlzIG9wdGlvbiBlbmFibGVzIHRoZSBQ
VkggZW50cnkgcG9pbnQgZm9yIGd1ZXN0IHZpcnR1YWwgbWFjaGluZXMKPiArCSAgYXMgc3BlY2lm
aWVkIGluIHRoZSB4ODYvSFZNIGRpcmVjdCBib290IEFCSS4KPiArCj4gIGNvbmZpZyBLVk1fREVC
VUdfRlMKPiAgCWJvb2wgIkVuYWJsZSBkZWJ1ZyBpbmZvcm1hdGlvbiBmb3IgS1ZNIEd1ZXN0cyBp
biBkZWJ1Z2ZzIgo+ICAJZGVwZW5kcyBvbiBLVk1fR1VFU1QgJiYgREVCVUdfRlMKCgotLSAKflJh
bmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
