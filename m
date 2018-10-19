From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 10/18] xen: setup hypercall page for PVH
Date: Fri, 19 Oct 2018 16:40:05 +0100
Message-ID: <20181019154005.vhwlo6eazmt7j22y__26239.7748571404$1539963540$gmane$org@mac.bytemobile.com>
References: <20181009110317.6022-1-jgross@suse.com>
 <20181009110317.6022-11-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20181009110317.6022-11-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: hans@knorrie.org, grub-devel@gnu.org, daniel.kiper@oracle.com, xen-devel@lists.xen.org, phcoder@gmail.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMDksIDIwMTggYXQgMDE6MDM6MDlQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBBZGQgdGhlIG5lZWRlZCBjb2RlIHRvIHNldHVwIHRoZSBoeXBlcmNhbGwgcGFnZSBm
b3IgY2FsbGluZyBpbnRvIHRoZQo+IFhlbiBoeXBlcnZpc29yLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAtLS0KPiAgZ3J1Yi1jb3JlL2tlcm4v
aTM4Ni94ZW4vcHZoLmMgfCA3MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2dydWItY29yZS9rZXJuL2kzODYveGVuL3B2aC5jIGIvZ3J1Yi1jb3JlL2tlcm4vaTM4Ni94
ZW4vcHZoLmMKPiBpbmRleCAxODJlZjk1ZjkuLmMxYjFjZjhkYiAxMDA2NDQKPiAtLS0gYS9ncnVi
LWNvcmUva2Vybi9pMzg2L3hlbi9wdmguYwo+ICsrKyBiL2dydWItY29yZS9rZXJuL2kzODYveGVu
L3B2aC5jCj4gQEAgLTIwLDE0ICsyMCw4NCBAQAo+ICAjaW5jbHVkZSA8Z3J1Yi9taXNjLmg+Cj4g
ICNpbmNsdWRlIDxncnViL21lbW9yeS5oPgo+ICAjaW5jbHVkZSA8Z3J1Yi9tbS5oPgo+ICsjaW5j
bHVkZSA8Z3J1Yi9pMzg2L2NwdWlkLmg+Cj4gICNpbmNsdWRlIDxncnViL3hlbi5oPgo+ICAjaW5j
bHVkZSA8Z3J1Yi9tYWNoaW5lL2tlcm5lbC5oPgo+ICAKPiAgZ3J1Yl91aW50NjRfdCBncnViX3Jz
ZHBfYWRkcjsKPiAgCj4gK3N0YXRpYyBzdHJ1Y3QgeyBjaGFyIF9lbnRyeVszMl07IH0gaHlwZXJj
YWxsX3BhZ2VbMTI4XQo+ICsgIF9fYXR0cmlidXRlX18gKChhbGlnbmVkIChHUlVCX1hFTl9QQUdF
X1NJWkUpKSk7Cj4gKwo+ICtzdGF0aWMgZ3J1Yl91aW50MzJfdCB4ZW5fY3B1aWRfYmFzZTsKPiAr
Cj4gK3N0YXRpYyB2b2lkCj4gK2dydWJfeGVuX2Vhcmx5X2hhbHQgKHZvaWQpCgpJIHdvdWxkIHJl
bmFtZSB0aGlzIHRvIGdydWJfeGVuX2Vhcmx5X2NyYXNoCgo+ICt7CgpBbmQgeW91IGNhbiB1c2Ug
dGhlIDB4ZTkgSU8gcG9ydCB0byBwcmludCBhIGNyYXNoIGRlYnVnIG1lc3NhZ2UgZXZlbgpiZWZv
cmUgaW5pdGlhbGl6aW5nIHRoZSBoeXBlcmNhbGwgcGFnZSwgSSB0aGluayB0aGlzIHdvdWxkIGJl
IGhlbHBmdWwKaGVyZS4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
