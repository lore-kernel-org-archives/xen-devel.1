From: Amit Shah <aams@amazon.com>
Subject: [PATCH 2/2] xen: events: free irqs in error condition
Date: Mon, 26 Feb 2018 17:36:35 +0000
Message-ID: <1519666595-41362-3-git-send-email-aams__45533.2065387212$1519710671$gmane$org@amazon.com>
References: <1519666595-41362-1-git-send-email-aams@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yzye=fu=amazon.de=prvs=588dd4d4c=aams@srs-us1.protection.inumbo.net>)
 id 1eqMke-0000n3-UO
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 17:39:48 +0000
In-Reply-To: <1519666595-41362-1-git-send-email-aams@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Eduardo Valentin <eduval@amazon.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, David Vrabel <david.vrabel@citrix.com>, Liu Shuo <shuo.a.liu@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Amit Shah <aams@amazon.com>, Thomas Gleixner <tglx@linutronix.de>, Anoob Soman <anoob.soman@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW4gY2FzZSBvZiBlcnJvcnMgaW4gaXJxIHNldHVwIGZvciBNU0ksIGZyZWUgdXAgdGhlIGFsbG9j
YXRlZCBpcnFzLgoKRml4ZXM6IDQ4OTJjOWI0YWRhOWY5ICgieGVuOiBhZGQgc3VwcG9ydCBmb3Ig
TVNJIG1lc3NhZ2UgZ3JvdXBzIikKUmVwb3J0ZWQtYnk6IEhvb21hbiBNaXJoYWRpIDxtaXJoYWRp
aEBhbWF6b24uY29tPgpDQzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+CkNDOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IERhdmlkIFZyYWJlbCA8ZGF2aWQudnJh
YmVsQGNpdHJpeC5jb20+CkNDOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFj
bGUuY29tPgpDQzogRWR1YXJkbyBWYWxlbnRpbiA8ZWR1dmFsQGFtYXpvbi5jb20+CkNDOiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNDOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGlu
dXRyb25peC5kZT4KQ0M6ICJLLiBZLiBTcmluaXZhc2FuIiA8a3lzQG1pY3Jvc29mdC5jb20+CkND
OiBMaXUgU2h1byA8c2h1by5hLmxpdUBpbnRlbC5jb20+CkNDOiBBbm9vYiBTb21hbiA8YW5vb2Iu
c29tYW5AY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogQW1pdCBTaGFoIDxhYW1zQGFtYXpvbi5j
b20+Ci0tLQogZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMgfCAxICsKIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2V2ZW50cy9l
dmVudHNfYmFzZS5jIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKaW5kZXggYjZi
OGIyOS4uOTZhYTU3NSAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNl
LmMKKysrIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKQEAgLTc1OCw2ICs3NTgs
NyBAQCBpbnQgeGVuX2JpbmRfcGlycV9tc2lfdG9faXJxKHN0cnVjdCBwY2lfZGV2ICpkZXYsIHN0
cnVjdCBtc2lfZGVzYyAqbXNpZGVzYywKIGVycm9yX2lycToKIAlmb3IgKDsgaSA+PSAwOyBpLS0p
CiAJCV9fdW5iaW5kX2Zyb21faXJxKGlycSArIGkpOworCXhlbl9mcmVlX2lycShpcnEpOwogCW11
dGV4X3VubG9jaygmaXJxX21hcHBpbmdfdXBkYXRlX2xvY2spOwogCXJldHVybiByZXQ7CiB9Ci0t
IAoyLjcuMy5BTVpOCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApCZXJs
aW4gLSBEcmVzZGVuIC0gQWFjaGVuCm1haW4gb2ZmaWNlOiBLcmF1c2Vuc3RyLiAzOCwgMTAxMTcg
QmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBEci4gUmFsZiBIZXJicmljaCwgQ2hyaXN0aWFuIFNj
aGxhZWdlcgpVc3QtSUQ6IERFMjg5MjM3ODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENo
YXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
