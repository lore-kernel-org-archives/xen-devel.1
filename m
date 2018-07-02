From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen: remove global bit from
 __default_kernel_pte_mask for pv guests
Date: Mon,  2 Jul 2018 12:00:18 +0200
Message-ID: <20180702100018.26279-1-jgross__44298.0471336797$1530525540$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=37lk=js=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fZvd9-0008C9-CI
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 10:00:23 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>, stable@vger.kernel.org, mingo@redhat.com, hpa@zytor.com, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

V2hlbiByZW1vdmluZyB0aGUgZ2xvYmFsIGJpdCBmcm9tIF9fc3VwcG9ydGVkX3B0ZV9tYXNrIGRv
IHRoZSBzYW1lIGZvcgpfX2RlZmF1bHRfa2VybmVsX3B0ZV9tYXNrIGluIG9yZGVyIHRvIGF2b2lk
IHRoZSBXQVJOX09OQ0UoKSBpbgpjaGVja19wZ3Byb3QoKSB3aGVuIHNldHRpbmcgYSBrZXJuZWwg
cHRlIGJlZm9yZSBoYXZpbmcgY2FsbGVkCmluaXRfbWVtX21hcHBpbmcoKS4KCkNjOiA8c3RhYmxl
QHZnZXIua2VybmVsLm9yZz4gIyA0LjE3ClJlcG9ydGVkLWJ5OiBNaWNoYWVsIFlvdW5nIDxtLmEu
eW91bmdAZHVyaGFtLmFjLnVrPgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+Ci0tLQogYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vZW5saWdo
dGVuX3B2LmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKaW5kZXggMGY0Y2Q5ZTViZWQ0
Li5jZjdiMTNkM2U5MTEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwor
KysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKQEAgLTEyMzAsNiArMTIzMCw3IEBAIGFz
bWxpbmthZ2UgX192aXNpYmxlIHZvaWQgX19pbml0IHhlbl9zdGFydF9rZXJuZWwodm9pZCkKIAog
CS8qIFByZXZlbnQgdW53YW50ZWQgYml0cyBmcm9tIGJlaW5nIHNldCBpbiBQVEVzLiAqLwogCV9f
c3VwcG9ydGVkX3B0ZV9tYXNrICY9IH5fUEFHRV9HTE9CQUw7CisJX19kZWZhdWx0X2tlcm5lbF9w
dGVfbWFzayAmPSB+X1BBR0VfR0xPQkFMOwogCiAJLyoKIAkgKiBQcmV2ZW50IHBhZ2UgdGFibGVz
IGZyb20gYmVpbmcgYWxsb2NhdGVkIGluIGhpZ2htZW0sIGV2ZW4KLS0gCjIuMTMuNwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
