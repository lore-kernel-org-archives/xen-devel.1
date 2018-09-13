From: Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH 0/4] Add support for multi-page vm_event ring
 buffer
Date: Thu, 13 Sep 2018 18:01:56 +0300
Message-ID: <cover.1536850239.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wyui=l3=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1g0T8B-00066B-3k
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 15:02:07 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBzZXJpZXMgZW5hYmxlcyB0aGUgdm1fZXZlbnQgcmluZyB0byB1c2UgYnVmZmVycyBsYXJn
ZXIgdGhhbiA0Sy4KCgpQZXRyZSBQaXJjYWxhYnUgKDQpOgogIHg4Nl9lbXVsYXRvcjogQWRkIFBI
T05ZIHVuaW5zdGFsbCB0YXJnZXQKICB0b29scy9saWJ4YzogRGVmaW5lIFZNX0VWRU5UIHR5cGUK
ICB4ODY6IEFkZCBtYXBfZG9tYWluX3BhZ2VzX2dsb2JhbAogIHZtX2V2ZW50OiBBZGQgc3VwcG9y
dCBmb3IgbXVsdGktcGFnZSByaW5nIGJ1ZmZlcgoKIHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3Ry
bC5oICAgICAgIHwgICAyICsKIHRvb2xzL2xpYnhjL3hjX21vbml0b3IuYyAgICAgICAgICAgIHwg
ICA5ICstCiB0b29scy9saWJ4Yy94Y19wcml2YXRlLmggICAgICAgICAgICB8ICAgOSArLQogdG9v
bHMvbGlieGMveGNfdm1fZXZlbnQuYyAgICAgICAgICAgfCAxMzkgKysrKysrKysrKysrKystLS0t
LQogdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL01ha2VmaWxlICAgfCAgIDMgKwogdG9vbHMvdGVz
dHMveGVuLWFjY2Vzcy94ZW4tYWNjZXNzLmMgfCAgMzMgKysrLS0KIHhlbi9hcmNoL3g4Ni9kb21h
aW5fcGFnZS5jICAgICAgICAgIHwgIDIxICsrKwogeGVuL2FyY2gveDg2L21tLmMgICAgICAgICAg
ICAgICAgICAgfCAgMTQgKysKIHhlbi9jb21tb24vdm1fZXZlbnQuYyAgICAgICAgICAgICAgIHwg
MjU4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogeGVuL2luY2x1ZGUvcHVi
bGljL2RvbWN0bC5oICAgICAgICAgfCAgMjIgKystCiB4ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5
LmggICAgICAgICB8ICAgMSArCiB4ZW4vaW5jbHVkZS94ZW4vZG9tYWluX3BhZ2UuaCAgICAgICB8
ICAgOSArKwogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAgICAgICAgICAgfCAgIDUgKy0KIHhl
bi9pbmNsdWRlL3hlbi92bV9ldmVudC5oICAgICAgICAgIHwgICA0ICsKIDE0IGZpbGVzIGNoYW5n
ZWQsIDQxNCBpbnNlcnRpb25zKCspLCAxMTUgZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
