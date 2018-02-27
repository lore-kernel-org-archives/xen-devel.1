From: Amit Shah <aams@amazon.com>
Subject: [PATCH v2 2/2] xen: events: free irqs in error condition
Date: Tue, 27 Feb 2018 15:55:58 +0000
Message-ID: <1519746958-52077-3-git-send-email-aams__39647.98205202$1519746909$gmane$org@amazon.com>
References: <1519746958-52077-1-git-send-email-aams@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gitk=fv=amazon.de=prvs=58946e527=aams@srs-us1.protection.inumbo.net>)
 id 1eqhbv-0000Ni-Nb
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 15:56:11 +0000
In-Reply-To: <1519746958-52077-1-git-send-email-aams@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Eduardo Valentin <eduval@amazon.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Liu Shuo <shuo.a.liu@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Amit Shah <aams@amazon.com>, Thomas Gleixner <tglx@linutronix.de>, Anoob Soman <anoob.soman@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW4gY2FzZSBvZiBlcnJvcnMgaW4gaXJxIHNldHVwIGZvciBNU0ksIGZyZWUgdXAgdGhlIGFsbG9j
YXRlZCBpcnFzLgoKRml4ZXM6IDQ4OTJjOWI0YWRhOWY5ICgieGVuOiBhZGQgc3VwcG9ydCBmb3Ig
TVNJIG1lc3NhZ2UgZ3JvdXBzIikKUmVwb3J0ZWQtYnk6IEhvb21hbiBNaXJoYWRpIDxtaXJoYWRp
aEBhbWF6b24uY29tPgpDQzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+CkNDOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMu
b3N0cm92c2t5QG9yYWNsZS5jb20+CkNDOiBFZHVhcmRvIFZhbGVudGluIDxlZHV2YWxAYW1hem9u
LmNvbT4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ0M6IFRob21hcyBHbGVp
eG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDQzogIksuIFkuIFNyaW5pdmFzYW4iIDxreXNAbWlj
cm9zb2Z0LmNvbT4KQ0M6IExpdSBTaHVvIDxzaHVvLmEubGl1QGludGVsLmNvbT4KQ0M6IEFub29i
IFNvbWFuIDxhbm9vYi5zb21hbkBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBBbWl0IFNoYWgg
PGFhbXNAYW1hem9uLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYyB8
IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYyBiL2RyaXZlcnMv
eGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCmluZGV4IGM4NmQxMGUuLmEyOTk1ODYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCisrKyBiL2RyaXZlcnMveGVuL2V2
ZW50cy9ldmVudHNfYmFzZS5jCkBAIC03NTAsMTEgKzc1MCwxNCBAQCBpbnQgeGVuX2JpbmRfcGly
cV9tc2lfdG9faXJxKHN0cnVjdCBwY2lfZGV2ICpkZXYsIHN0cnVjdCBtc2lfZGVzYyAqbXNpZGVz
YywKIAogCXJldCA9IGlycV9zZXRfbXNpX2Rlc2MoaXJxLCBtc2lkZXNjKTsKIAlpZiAocmV0IDwg
MCkKLQkJZ290byBlcnJvcl9pcnE7CisJCWdvdG8gZXJyb3JfZGVzYzsKIG91dDoKIAltdXRleF91
bmxvY2soJmlycV9tYXBwaW5nX3VwZGF0ZV9sb2NrKTsKIAlyZXR1cm4gaXJxOwogZXJyb3JfaXJx
OgorCXdoaWxlICgtLW52ZWMgPj0gaSkKKwkJeGVuX2ZyZWVfaXJxKGlycSArIG52ZWMpOworZXJy
b3JfZGVzYzoKIAl3aGlsZSAoaSA+IDApIHsKIAkJaS0tOwogCQlfX3VuYmluZF9mcm9tX2lycShp
cnEgKyBpKTsKLS0gCjIuNy4zLkFNWk4KCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFu
eSBHbWJICkJlcmxpbiAtIERyZXNkZW4gLSBBYWNoZW4KbWFpbiBvZmZpY2U6IEtyYXVzZW5zdHIu
IDM4LCAxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IERyLiBSYWxmIEhlcmJyaWNoLCBD
aHJpc3RpYW4gU2NobGFlZ2VyClVzdC1JRDogREUyODkyMzc4NzkKRWluZ2V0cmFnZW4gYW0gQW10
c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
