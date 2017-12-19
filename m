From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH V4 19/26] xen: deprecate pci_get_bus_and_slot()
Date: Tue, 19 Dec 2017 00:37:55 -0500
Message-ID: <1513661883-28662-20-git-send-email-okaya@codeaurora.org>
References: <1513661883-28662-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zdbb=dp=codeaurora.org=okaya@srs-us1.protection.inumbo.net>)
 id 1eRAck-0000Vq-4k
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 05:39:30 +0000
In-Reply-To: <1513661883-28662-1-git-send-email-okaya@codeaurora.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-pci@vger.kernel.org, timur@codeaurora.org
Cc: Juergen Gross <jgross@suse.com>, linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Sinan Kaya <okaya@codeaurora.org>, Bjorn Helgaas <bhelgaas@google.com>, "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

cGNpX2dldF9idXNfYW5kX3Nsb3QoKSBpcyByZXN0cmljdGl2ZSBzdWNoIHRoYXQgaXQgYXNzdW1l
cyBkb21haW49MCBhcwp3aGVyZSBhIFBDSSBkZXZpY2UgaXMgcHJlc2VudC4gVGhpcyByZXN0cmlj
dHMgdGhlIGRldmljZSBkcml2ZXJzIHRvIGJlCnJldXNlZCBmb3Igb3RoZXIgZG9tYWluIG51bWJl
cnMuCgpVc2UgcGNpX2dldF9kb21haW5fYnVzX2FuZF9zbG90KCkgd2l0aCBhIGRvbWFpbiBudW1i
ZXIgb2YgMCB3aGVyZSB3ZSBjYW4ndApleHRyYWN0IHRoZSBkb21haW4gbnVtYmVyLiBPdGhlciBw
bGFjZXMsIHVzZSB0aGUgYWN0dWFsIGRvbWFpbiBudW1iZXIgZnJvbQp0aGUgZGV2aWNlLgoKU2ln
bmVkLW9mZi1ieTogU2luYW4gS2F5YSA8b2theWFAY29kZWF1cm9yYS5vcmc+ClJldmlld2VkLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogZHJpdmVycy9wY2kveGVuLXBj
aWZyb250LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL3hlbi1wY2lmcm9udC5jIGIvZHJpdmVy
cy9wY2kveGVuLXBjaWZyb250LmMKaW5kZXggOGZjMmU5NS4uOTRiMjViNSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9wY2kveGVuLXBjaWZyb250LmMKKysrIGIvZHJpdmVycy9wY2kveGVuLXBjaWZyb250
LmMKQEAgLTU5NSw2ICs1OTUsNyBAQCBzdGF0aWMgcGNpX2Vyc19yZXN1bHRfdCBwY2lmcm9udF9j
b21tb25fcHJvY2VzcyhpbnQgY21kLAogCXN0cnVjdCBwY2lfZHJpdmVyICpwZHJ2OwogCWludCBi
dXMgPSBwZGV2LT5zaF9pbmZvLT5hZXJfb3AuYnVzOwogCWludCBkZXZmbiA9IHBkZXYtPnNoX2lu
Zm8tPmFlcl9vcC5kZXZmbjsKKwlpbnQgZG9tYWluID0gcGRldi0+c2hfaW5mby0+YWVyX29wLmRv
bWFpbjsKIAlzdHJ1Y3QgcGNpX2RldiAqcGNpZGV2OwogCWludCBmbGFnID0gMDsKIApAQCAtNjAz
LDcgKzYwNCw3IEBAIHN0YXRpYyBwY2lfZXJzX3Jlc3VsdF90IHBjaWZyb250X2NvbW1vbl9wcm9j
ZXNzKGludCBjbWQsCiAJCWNtZCwgYnVzLCBkZXZmbik7CiAJcmVzdWx0ID0gUENJX0VSU19SRVNV
TFRfTk9ORTsKIAotCXBjaWRldiA9IHBjaV9nZXRfYnVzX2FuZF9zbG90KGJ1cywgZGV2Zm4pOwor
CXBjaWRldiA9IHBjaV9nZXRfZG9tYWluX2J1c19hbmRfc2xvdChkb21haW4sIGJ1cywgZGV2Zm4p
OwogCWlmICghcGNpZGV2IHx8ICFwY2lkZXYtPmRyaXZlcikgewogCQlkZXZfZXJyKCZwZGV2LT54
ZGV2LT5kZXYsICJkZXZpY2Ugb3IgQUVSIGRyaXZlciBpcyBOVUxMXG4iKTsKIAkJcGNpX2Rldl9w
dXQocGNpZGV2KTsKLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
