From: Amit Shah <aams@amazon.com>
Subject: [PATCH 1/2] xen: fix out-of-bounds irq unbind for MSI
	message groups
Date: Mon, 26 Feb 2018 17:36:34 +0000
Message-ID: <1519666595-41362-2-git-send-email-aams__28802.7579583742$1519710670$gmane$org@amazon.com>
References: <1519666595-41362-1-git-send-email-aams@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yzye=fu=amazon.de=prvs=588dd4d4c=aams@srs-us1.protection.inumbo.net>)
 id 1eqMhx-0000JY-BU
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 17:37:01 +0000
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

V2hlbiBhbiBNU0kgZGVzY3JpcHRvciB3YXMgbm90IGF2YWlsYWJsZSwgdGhlIGVycm9yIHBhdGgg
d291bGQgdHJ5IHRvCnVuYmluZCBhbiBpcnEgdGhhdCB3YXMgbmV2ZXIgYWNxdWlyZWQgLSBwb3Rl
bnRpYWxseSB1bmJpbmRpbmcgYW4KdW5yZWxhdGVkIGlycS4KCkZpeGVzOiA0ODkyYzliNGFkYTlm
OSAoInhlbjogYWRkIHN1cHBvcnQgZm9yIE1TSSBtZXNzYWdlIGdyb3VwcyIpClJlcG9ydGVkLWJ5
OiBIb29tYW4gTWlyaGFkaSA8bWlyaGFkaWhAYW1hem9uLmNvbT4KQ0M6IDxzdGFibGVAdmdlci5r
ZXJuZWwub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkND
OiBEYXZpZCBWcmFiZWwgPGRhdmlkLnZyYWJlbEBjaXRyaXguY29tPgpDQzogQm9yaXMgT3N0cm92
c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ0M6IEVkdWFyZG8gVmFsZW50aW4gPGVk
dXZhbEBhbWF6b24uY29tPgpDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDQzog
VGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNDOiAiSy4gWS4gU3Jpbml2YXNh
biIgPGt5c0BtaWNyb3NvZnQuY29tPgpDQzogTGl1IFNodW8gPHNodW8uYS5saXVAaW50ZWwuY29t
PgpDQzogQW5vb2IgU29tYW4gPGFub29iLnNvbWFuQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6
IEFtaXQgU2hhaCA8YWFtc0BhbWF6b24uY29tPgotLS0KIGRyaXZlcnMveGVuL2V2ZW50cy9ldmVu
dHNfYmFzZS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYyBiL2RyaXZlcnMveGVuL2V2ZW50
cy9ldmVudHNfYmFzZS5jCmluZGV4IDFhYjRiZDEuLmI2YjhiMjkgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCisrKyBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVu
dHNfYmFzZS5jCkBAIC03NDksNiArNzQ5LDcgQEAgaW50IHhlbl9iaW5kX3BpcnFfbXNpX3RvX2ly
cShzdHJ1Y3QgcGNpX2RldiAqZGV2LCBzdHJ1Y3QgbXNpX2Rlc2MgKm1zaWRlc2MsCiAJfQogCiAJ
cmV0ID0gaXJxX3NldF9tc2lfZGVzYyhpcnEsIG1zaWRlc2MpOworCWktLTsKIAlpZiAocmV0IDwg
MCkKIAkJZ290byBlcnJvcl9pcnE7CiBvdXQ6Ci0tIAoyLjcuMy5BTVpOCgpBbWF6b24gRGV2ZWxv
cG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApCZXJsaW4gLSBEcmVzZGVuIC0gQWFjaGVuCm1haW4g
b2ZmaWNlOiBLcmF1c2Vuc3RyLiAzOCwgMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBE
ci4gUmFsZiBIZXJicmljaCwgQ2hyaXN0aWFuIFNjaGxhZWdlcgpVc3QtSUQ6IERFMjg5MjM3ODc5
CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
