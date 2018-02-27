From: Amit Shah <aams@amazon.com>
Subject: [PATCH v2 1/2] xen: fix out-of-bounds irq unbind for
	MSI message groups
Date: Tue, 27 Feb 2018 15:55:57 +0000
Message-ID: <1519746958-52077-2-git-send-email-aams__49353.969973936$1519746907$gmane$org@amazon.com>
References: <1519746958-52077-1-git-send-email-aams@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gitk=fv=amazon.de=prvs=58946e527=aams@srs-us1.protection.inumbo.net>)
 id 1eqhby-0000Nu-OH
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 15:56:14 +0000
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

V2hlbiBhbiBNU0kgZGVzY3JpcHRvciB3YXMgbm90IGF2YWlsYWJsZSwgdGhlIGVycm9yIHBhdGgg
d291bGQgdHJ5IHRvCnVuYmluZCBhbiBpcnEgdGhhdCB3YXMgbmV2ZXIgYWNxdWlyZWQgLSBwb3Rl
bnRpYWxseSB1bmJpbmRpbmcgYW4KdW5yZWxhdGVkIGlycS4KCkZpeGVzOiA0ODkyYzliNGFkYTlm
OSAoInhlbjogYWRkIHN1cHBvcnQgZm9yIE1TSSBtZXNzYWdlIGdyb3VwcyIpClJlcG9ydGVkLWJ5
OiBIb29tYW4gTWlyaGFkaSA8bWlyaGFkaWhAYW1hem9uLmNvbT4KQ0M6IDxzdGFibGVAdmdlci5r
ZXJuZWwub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkND
OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpDQzogRWR1YXJk
byBWYWxlbnRpbiA8ZWR1dmFsQGFtYXpvbi5jb20+CkNDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+CkNDOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KQ0M6ICJL
LiBZLiBTcmluaXZhc2FuIiA8a3lzQG1pY3Jvc29mdC5jb20+CkNDOiBMaXUgU2h1byA8c2h1by5h
LmxpdUBpbnRlbC5jb20+CkNDOiBBbm9vYiBTb21hbiA8YW5vb2Iuc29tYW5AY2l0cml4LmNvbT4K
U2lnbmVkLW9mZi1ieTogQW1pdCBTaGFoIDxhYW1zQGFtYXpvbi5jb20+Ci0tLQogZHJpdmVycy94
ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9ldmVudHMv
ZXZlbnRzX2Jhc2UuYyBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCmluZGV4IDFh
YjRiZDEuLmM4NmQxMGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFz
ZS5jCisrKyBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCkBAIC03NTUsOCArNzU1
LDEwIEBAIGludCB4ZW5fYmluZF9waXJxX21zaV90b19pcnEoc3RydWN0IHBjaV9kZXYgKmRldiwg
c3RydWN0IG1zaV9kZXNjICptc2lkZXNjLAogCW11dGV4X3VubG9jaygmaXJxX21hcHBpbmdfdXBk
YXRlX2xvY2spOwogCXJldHVybiBpcnE7CiBlcnJvcl9pcnE6Ci0JZm9yICg7IGkgPj0gMDsgaS0t
KQorCXdoaWxlIChpID4gMCkgeworCQlpLS07CiAJCV9fdW5iaW5kX2Zyb21faXJxKGlycSArIGkp
OworCX0KIAltdXRleF91bmxvY2soJmlycV9tYXBwaW5nX3VwZGF0ZV9sb2NrKTsKIAlyZXR1cm4g
cmV0OwogfQotLSAKMi43LjMuQU1aTgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55
IEdtYkgKQmVybGluIC0gRHJlc2RlbiAtIEFhY2hlbgptYWluIG9mZmljZTogS3JhdXNlbnN0ci4g
MzgsIDEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogRHIuIFJhbGYgSGVyYnJpY2gsIENo
cmlzdGlhbiBTY2hsYWVnZXIKVXN0LUlEOiBERTI4OTIzNzg3OQpFaW5nZXRyYWdlbiBhbSBBbXRz
Z2VyaWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
