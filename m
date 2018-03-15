From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 16/16] xen: Convert page_to_mfn and
 mfn_to_page to use typesafe MFN
Date: Thu, 15 Mar 2018 01:07:25 -0600
Message-ID: <5AAA29BD02000078001B1E4B@prv-mh.provo.novell.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-17-julien.grall@arm.com>
 <5A99850402000078001ADF1F@prv-mh.provo.novell.com>
 <a7b1dd2e-7028-1c93-e2ce-ccb3bc6349f5@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a7b1dd2e-7028-1c93-e2ce-ccb3bc6349f5@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Shane Wang <shane.wang@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Gang Wei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE4IGF0IDE4OjAyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDAzLzAyLzIwMTggMDQ6MDggUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyMS4w
Mi4xOCBhdCAxNTowMiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3AuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L3B2L2Vt
dWwtcHJpdi1vcC5jCj4+PiBAQCAtNDMsMTYgKzQzLDYgQEAKPj4+ICAgI2luY2x1ZGUgImVtdWxh
dGUuaCIKPj4+ICAgI2luY2x1ZGUgIm1tLmgiCj4+PiAgIAo+Pj4gLS8qIE92ZXJyaWRlIG1hY3Jv
cyBmcm9tIGFzbS9wYWdlLmggdG8gbWFrZSB0aGVtIHdvcmsgd2l0aCBtZm5fdCAqLwo+Pj4gLSN1
bmRlZiBtZm5fdG9fcGFnZQo+Pj4gLSNkZWZpbmUgbWZuX3RvX3BhZ2UobWZuKSBfX21mbl90b19w
YWdlKG1mbl94KG1mbikpCj4+PiAtI3VuZGVmIHBhZ2VfdG9fbWZuCj4+PiAtI2RlZmluZSBwYWdl
X3RvX21mbihwZykgX21mbihfX3BhZ2VfdG9fbWZuKHBnKSkKPj4+IC0KPj4+IC0vKioqKioqKioq
KioqKioqKioqKioqKioKPj4+IC0gKiBJL08gZW11bGF0aW9uIHN1cHBvcnQKPj4+IC0gKi8KPj4g
Cj4+IFdoeSBkb2VzIHRoaXMgY29tbWVudCBnbyBhd2F5Pwo+IAo+ICBGcm9tIGFuIGVhcmxpZXIg
cmV2aWV3LCBBbmRyZXcgc2FpZDoKPiAKPiAiSWYgeW91J3JlIG1ha2luZyB0aGlzIGNoYW5nZSwg
cGxlYXNlIHRha2Ugb3V0IHRoZSBEZXNjcmlwdG9yIFRhYmxlcwo+IGNvbW1lbnQgbGlrZSB5b3Ug
ZG8gd2l0aCBJL08gYmVsb3csIGJlY2F1c2UgdGhlIGVudGlyZSBmaWxlIGlzIGRlZGljYXRlZAo+
IHRvIGRlc2NyaXB0b3IgdGFibGUgc3VwcG9ydCBhbmQgaXQgd2lsbCBzYXZlIG1lIG9uZSBpdGVt
IG9uIGEgY2xlYW51cAo+IHBhdGNoIDopLiIKCldlbGwsIHRoZSByZWFzb25pbmcgaXNuJ3QgcmVh
bGx5IGNvcnJlY3QsIGJ1dCBJIGFncmVlIHRoZSBjb21tZW50IGlzIGF0CmxlYXN0IG1pc3BsYWNl
ZC4gSGVuY2UgSSdtIGZpbmUgd2l0aCBpdCBiZWluZyBkcm9wcGVkLCBkZXNwaXRlIGl0IGJlaW5n
CnZlcnkgdW5yZWxhdGVkIHRvIHRoZSBwdXJwb3NlIG9mIHRoZSBwYXRjaC4gSU9XIG15IGFjayBz
dGFuZHMgd2l0aAp0aGlzIG9uZSByZW1hcmsgdW4tYWRkcmVzc2VkLgoKSmFuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
