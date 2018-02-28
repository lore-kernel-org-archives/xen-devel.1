From: George Dunlap <george.dunlap@citrix.com>
Subject: [ATTN SVM maintainers] Re: [PATCH V6] x86/hvm: fix
 domain crash when CR3 has the noflush bit set
Date: Wed, 28 Feb 2018 17:12:09 +0000
Message-ID: <1cf3e62a-c250-b340-b72d-2f4eaceec834@citrix.com>
References: <1519814295-3211-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519814295-3211-1-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xen.org
Cc: kevin.tian@intel.com, tamas@tklengyel.com, suravee.suthikulpanit@amd.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, tim@xen.org, jbeulich@suse.com, jun.nakajima@intel.com, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjgvMjAxOCAxMDozOCBBTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IEluIGhhcmR3
YXJlLCB3aGVuIFBDSUQgc3VwcG9ydCBpcyBlbmFibGVkIGFuZCB0aGUgTk9GTFVTSCBiaXQgaXMg
c2V0Cj4gd2hlbiB3cml0aW5nIGEgQ1IzIHZhbHVlLCB0aGUgaGFyZHdhcmUgd2lsbCBjbGVhciB0
aGF0IHRoYXQgYml0IGFuZAo+IGNoYW5nZSB0aGUgQ1IzIHdpdGhvdXQgZmx1c2hpbmcgdGhlIFRM
Qi4gaHZtX3NldF9jcjMoKSwgaG93ZXZlciwgd2FzCj4gaWdub3JpbmcgdGhpcyBiaXQ7IHRoZSBy
ZXN1bHQgd2FzIHRoYXQgcG9zdC12bV9ldmVudCBjaGVja3MgZGV0ZWN0ZWQKPiBhbiBpbnZhbGlk
IENSMyB2YWx1ZSBhbmQgY3Jhc2hlZCB0aGUgZG9tYWluLgo+IAo+IEhhbmRsZSBOT0ZMVVNIIGlu
IGh2bV9zZXRfY3IzKCkgYnk6Cj4gMS4gQ2xlYXJpbmcgdGhlIGJpdAo+IDIuIFBhc3NpbmcgYSAi
bm9mbHVzaCIgZmxhZyB0byBsb3dlci1sZXZlbCBjcjMgc2V0dGluZyBmdW5jdGlvbnMgdG8KPiBp
bmRpY2F0ZSB0aGF0IGEgZmx1c2ggc2hvdWxkIG5vdCBiZSBwZXJmb3JtZWQuCj4gCj4gQWxzbyBj
bGVhciBYODZfQ1IzX05PRkxVU0ggd2hlbiByZXBvcnRpbmcgQ1IzIG1vbml0b3JlZCBDUjMgd3Jp
dGVzLgo+IAo+IFRoaXMgYWxsb3dzIGludHJvc3BlY3Rpb24gdG8gYmUgdXNlZCBvbiBWTXMgd2hv
c2Ugb3BlcmF0aW5nIHN5c3RlbSB1c2VzCj4gdGhlIE5PRkxVU0ggYml0Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPiBSZXBv
cnRlZC1ieTogQml0d2Vhc2lsIDxiaXR3ZWFzaWxAY3J5cHRvaGF6ZS5jb20+Cj4gU3VnZ2VzdGVk
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IEFja2VkLWJ5
OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8
a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4gQWNrZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5k
dW5sYXBAY2l0cml4LmNvbT4KCkJvcmlzIC8gU3V2YXJlZSwgYW55IG9waW5pb25zIG9uIHRoZSBT
Vk0gY2hhbmdlcz8KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
