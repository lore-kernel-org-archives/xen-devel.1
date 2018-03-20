From: Maran Wilson <maran.wilson@oracle.com>
Subject: Re: [PATCH v5 1/7] xen/pvh: Split CONFIG_XEN_PVH into
 CONFIG_PVH and CONFIG_XEN_PVH
Date: Tue, 20 Mar 2018 13:55:31 -0700
Message-ID: <60e2784f-262a-3aae-3e4f-4f47cb431eee__16595.9135433242$1521579305$gmane$org@oracle.com>
References: <1521573369-17216-1-git-send-email-maran.wilson@oracle.com>
 <1521573486-17304-1-git-send-email-maran.wilson@oracle.com>
 <cb065150-0035-abf0-1d38-99011e4b4605@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xacc=gk=oracle.com=maran.wilson@srs-us1.protection.inumbo.net>)
 id 1eyOIq-0008UF-1Q
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 20:56:16 +0000
In-Reply-To: <cb065150-0035-abf0-1d38-99011e4b4605@infradead.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Randy Dunlap <rdunlap@infradead.org>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org, pbonzini@redhat.com, jgross@suse.com
Cc: thomas.lendacky@amd.com, dave.hansen@linux.intel.com, rkrcmar@redhat.com, hpa@zytor.com, mingo@redhat.com, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, boris.ostrovsky@oracle.com, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMy8yMC8yMDE4IDEyOjIzIFBNLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4gSGksCj4KPiBPbiAw
My8yMC8yMDE4IDEyOjE4IFBNLCBNYXJhbiBXaWxzb24gd3JvdGU6Cj4+IEluIG9yZGVyIHRvIHBh
dmUgdGhlIHdheSBmb3IgaHlwZXJ2aXNvcnMgb3RoZXIgdGhlbiBYZW4gdG8gdXNlIHRoZSBQVkgK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRoYW4K
Pgo+PiBlbnRyeSBwb2ludCBmb3IgVk1zLCB3ZSBuZWVkIHRvIGZhY3RvciB0aGUgUFZIIGVudHJ5
IGNvZGUgaW50byBYZW4gc3BlY2lmaWMKPj4gYW5kIGh5cGVydmlzb3IgYWdub3N0aWMgY29tcG9u
ZW50cy4gVGhlIGZpcnN0IHN0ZXAgaW4gZG9pbmcgdGhhdCwgaXMgdG8KPj4gY3JlYXRlIGEgbmV3
IGNvbmZpZyBvcHRpb24gZm9yIFBWSCBlbnRyeSB0aGF0IGNhbiBiZSBlbmFibGVkCj4+IGluZGVw
ZW5kZW50bHkgZnJvbSBDT05GSUdfWEVOLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJhbiBXaWxz
b24gPG1hcmFuLndpbHNvbkBvcmFjbGUuY29tPgo+PiAtLS0KPj4gICBhcmNoL3g4Ni9LY29uZmln
ICAgICAgICAgIHwgNyArKysrKysrCj4+ICAgYXJjaC94ODYva2VybmVsL2hlYWRfNjQuUyB8IDQg
KystLQo+PiAgIGFyY2gveDg2L3hlbi9LY29uZmlnICAgICAgfCAzICsrLQo+PiAgIDMgZmlsZXMg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL2FyY2gveDg2L0tjb25maWcgYi9hcmNoL3g4Ni9LY29uZmlnCj4+IGluZGV4IGViN2Y0M2Yy
MzUyMS4uNTg4MzEzMjBiNWQyIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3g4Ni9LY29uZmlnCj4+ICsr
KyBiL2FyY2gveDg2L0tjb25maWcKPj4gQEAgLTc5MSw2ICs3OTEsMTMgQEAgY29uZmlnIEtWTV9H
VUVTVAo+PiAgIAkgIHVuZGVybHlpbmcgZGV2aWNlIG1vZGVsLCB0aGUgaG9zdCBwcm92aWRlcyB0
aGUgZ3Vlc3Qgd2l0aAo+PiAgIAkgIHRpbWluZyBpbmZyYXN0cnVjdHVyZSBzdWNoIGFzIHRpbWUg
b2YgZGF5LCBhbmQgc3lzdGVtIHRpbWUKPj4gICAKPj4gK2NvbmZpZyBQVkgKPj4gKwlib29sICJT
dXBwb3J0IGZvciBydW5uaW5nIFBWSCBndWVzdHMiCj4+ICsJZGVmX2Jvb2wgbgo+IFlvdSBkb24n
dCBuZWVkIHR3byAoMikgImJvb2wicyBoZXJlLiBBbmQgJ24nIGlzIGFscmVhZHkgdGhlIGRlZmF1
bHQsIHNvIGp1c3QKPiBkcm9wIHRoZSBzZWNvbmQgbGluZS4KPgo+PiArCS0tLWhlbHAtLS0KPj4g
KwkgIFRoaXMgb3B0aW9uIGVuYWJsZXMgdGhlIFBWSCBlbnRyeSBwb2ludCBmb3IgZ3Vlc3Qgdmly
dHVhbCBtYWNoaW5lcwo+PiArCSAgYXMgc3BlY2lmaWVkIGluIHRoZSB4ODYvSFZNIGRpcmVjdCBi
b290IEFCSS4KPj4gKwo+PiAgIGNvbmZpZyBLVk1fREVCVUdfRlMKPj4gICAJYm9vbCAiRW5hYmxl
IGRlYnVnIGluZm9ybWF0aW9uIGZvciBLVk0gR3Vlc3RzIGluIGRlYnVnZnMiCj4+ICAgCWRlcGVu
ZHMgb24gS1ZNX0dVRVNUICYmIERFQlVHX0ZTCj4KCkhpIFJhbmR5LAoKV2lsbCBtYWtlIGJvdGgg
Y2hhbmdlcy4KClRoYW5rcywKLU1hcmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
