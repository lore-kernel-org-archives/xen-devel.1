From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/4] hvm/svm: Enable Breakpoint events
Date: Wed, 14 Feb 2018 18:22:06 +0000
Message-ID: <1f5b2521-1722-565a-d4cc-8dc67877f68c@citrix.com>
References: <1518448098-6493-1-git-send-email-aisaila@bitdefender.com>
 <1518448098-6493-3-git-send-email-aisaila@bitdefender.com>
 <5aba8de5-4cca-9a4b-0f82-ec032eb48b96@citrix.com>
 <1518624619.4963.20.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1518624619.4963.20.camel@bitdefender.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDIvMTggMTY6MTAsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+IE9uIEx1
LCAyMDE4LTAyLTEyIGF0IDE1OjU0ICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAx
Mi8wMi8xOCAxNTowOCwgQWxleGFuZHJ1IElzYWlsYSB3cm90ZToKPj4+IEBAIC0yNjE5LDE0ICsy
NjM0LDMxIEBAIHZvaWQgc3ZtX3ZtZXhpdF9oYW5kbGVyKHN0cnVjdAo+Pj4gY3B1X3VzZXJfcmVn
cyAqcmVncykKPj4+ICAgICAgICAgIGJyZWFrOwo+Pj4KPj4+ICAgICAgY2FzZSBWTUVYSVRfRVhD
RVBUSU9OX0JQOgo+Pj4gLSAgICAgICAgaWYgKCAhdi0+ZG9tYWluLT5kZWJ1Z2dlcl9hdHRhY2hl
ZCApCj4+PiAtICAgICAgICAgICAgZ290byB1bmV4cGVjdGVkX2V4aXRfdHlwZTsKPj4+IC0gICAg
ICAgIC8qIEFNRCBWb2wyLCAxNS4xMTogSU5UMywgSU5UTywgQk9VTkQgaW50ZXJjZXB0cyBkbyBu
b3QKPj4+IHVwZGF0ZSBSSVAuICovCj4+PiAtICAgICAgICBpZiAoIChpbnN0X2xlbiA9IF9fZ2V0
X2luc3RydWN0aW9uX2xlbmd0aCh2LCBJTlNUUl9JTlQzKSkKPj4+ID09IDAgKQo+Pj4gKyAgICAg
ICAgaW5zdF9sZW4gPSBfX2dldF9pbnN0cnVjdGlvbl9sZW5ndGgodiwgSU5TVFJfSU5UMyk7Cj4+
IFRoZXJlIGFyZSBtdWx0aXBsZSB3YXlzIG9mIGVuZGluZyB1cCB3aXRoIHRoaXMgdm1leGl0LCBh
bmQgSU5UMyBpcwo+PiBub3QKPj4gdGhlIG9ubHkgd2F5Lgo+Pgo+PiBUaGUgb2xkIGNvZGUgd2Fz
IHNvbWV3aGF0IGJyb2tlbiAoYnV0IG9ubHkgaW4gdGhlIGNhc2UgdGhhdCBhCj4+IGRlYnVnZ2Vy
Cj4+IHdhcyBhdHRhY2hlZCksIGJ1dCBub3cgd2l0aCAgdGhpcyBpbnRyb3NwZWN0aW9uIGhvb2sg
YWN0aXZlLAo+PiBleGVjdXRpbmcKPj4gYDB4Y2QgMHgwM2Agd2lsbCBlbmQgdXAgY3Jhc2hpbmcg
dGhlIGRvbWFpbiBiZWNhdXNlIG9mIGEgbGVuZ3RoCj4+IG1pc21hdGNoCj4+IGxvb2tpbmcgZm9y
IDB4Y2MuCj4+Cj4+IFlvdSBuZWVkIHRvIGluc3BlY3QgRVhJVElOVElORk8gdG8gd29yayBvdXQg
d2hhdCB3ZW50IG9uIGhlcmUsIGFuZAo+PiBkaXN0aW5ndWlzaCBJTlQzIGZyb20gSU5UICQzLgo+
Pgo+PiBDYW4gSSBzdWdnZXN0IHRoYXQgeW91IHJ1biB0aGlzIHVuaXQgdGVzdAo+PiBodHRwOi8v
eGVuYml0cy54ZW4ub3JnL2RvY3MveHRmL3Rlc3Qtc3dpbnQtZW11bGF0aW9uLmh0bWwgdW5kZXIg
ZGVidWcKPj4gaW50cm9zcGVjdGlvbiBhbiBjaGVjayB0aGF0IHlvdSBnZXQgYWxsIGV4cGVjdGVk
IGV2ZW50cz8gIEV2ZXJ5IHRpbWUKPj4gd2UKPj4gdG91Y2ggdGhpcyBjb2RlLCB3ZSBzZWVtIHRv
IGJyZWFrIGl0IDooCj4+Cj4+IH5BbmRyZXcKPj4KPiBJJ3ZlIHRlc3RlZCBvbiBJbnRlbCBhbmQg
QU1EIGFuZCBJIG9ubHkgZ2V0IGV2ZW50cyBvbiBpbnQzLiBGdXJ0aGVyCj4gbW9yZSwgSSBkb24n
dCB0aGluayB0aGVyZSBpcyBhbnkgd2F5IHRvIHVzZSB0aGUgdm1jYi0+ZXhpdGludGluZm8KPiBi
ZWNhdXNlIGFsbCB0aGUgZmllbGRzIGFyZSAwIG9uIHRoZSB0aW1lIG9mIFZNRVhJVF9FWENFUFRJ
T05fQlAuIERpZCBJCj4gdW5kZXJzdGFuZCB0aGUgdGVzdCBzY2VuYXJpbyBjb3JyZWN0bHk/CgpR
dWl0ZSBwb3NzaWJseSwgYnV0IG5vdyBJJ20gZXZlbiBtb3JlIGNvbmZ1c2VkLsKgIEknbGwgaGF2
ZSBhIHF1aWNrIHBsYXkuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
