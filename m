From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] pvcalls-back: do not return error on
	inet_accept EAGAIN
Date: Fri, 2 Feb 2018 17:34:09 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802021728420.10160__10953.4153518782$1517621590$gmane$org@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vxlt=e5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ehmia-0007F9-8P
 for xen-devel@lists.xenproject.org; Sat, 03 Feb 2018 01:34:12 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: jgross@suse.com, boris.ostrovsky@oracle.com
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

V2hlbiB0aGUgY2xpZW50IHNlbmRzIGEgcmVndWxhciBibG9ja2luZyBhY2NlcHQgcmVxdWVzdCwg
dGhlIGJhY2tlbmQgaXMKZXhwZWN0ZWQgdG8gcmV0dXJuIG9ubHkgd2hlbiB0aGUgYWNjZXB0IGlz
IGNvbXBsZXRlZCwgc2ltdWxhdGluZyBhCmJsb2NraW5nIGJlaGF2aW9yLCBvciByZXR1cm4gYW4g
ZXJyb3IuCgpTcGVjaWZpY2FsbHksIG9uIEVBR0FJTiBmcm9tIGluZXRfYWNjZXB0LCB0aGUgYmFj
a2VuZCBzaG91bGRuJ3QgcmV0dXJuCiJFQUdBSU4iIHRvIHRoZSBjbGllbnQuIEluc3RlYWQsIGl0
IHNob3VsZCBzaW1wbHkgY29udGludWUgdGhlIHdhaXQuCk90aGVyd2lzZSwgdGhlIGNsaWVudCB3
aWxsIHNlbmQgYW5vdGhlciBhY2NlcHQgcmVxdWVzdCwgd2hpY2ggd2lsbCBjYXVzZQphbm90aGVy
IEVBR0FJTiB0byBiZSBzZW50IGJhY2ssIHdoaWNoIGlzIGEgd2FzdGUgb2YgcmVzb3VyY2VzIGFu
ZCBub3QKY29uZm9ybWluZyB0byB0aGUgZXhwZWN0ZWQgYmVoYXZpb3IuIENoYW5nZSB0aGUgYmVo
YXZpb3IgYnkgdHVybmluZyB0aGUKImdvdG8gZXJyb3IiIGludG8gYSByZXR1cm4uCgpTaWduZWQt
b2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9AYXBvcmV0by5jb20+CgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy94ZW4vcHZjYWxscy1iYWNrLmMgYi9kcml2ZXJzL3hlbi9wdmNhbGxzLWJh
Y2suYwppbmRleCBjNzgyMmQ4Li4xNTZlNWFlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9wdmNh
bGxzLWJhY2suYworKysgYi9kcml2ZXJzL3hlbi9wdmNhbGxzLWJhY2suYwpAQCAtNTQ4LDcgKzU0
OCw3IEBAIHN0YXRpYyB2b2lkIF9fcHZjYWxsc19iYWNrX2FjY2VwdChzdHJ1Y3Qgd29ya19zdHJ1
Y3QgKndvcmspCiAJcmV0ID0gaW5ldF9hY2NlcHQobWFwcGFzcy0+c29jaywgc29jaywgT19OT05C
TE9DSywgdHJ1ZSk7CiAJaWYgKHJldCA9PSAtRUFHQUlOKSB7CiAJCXNvY2tfcmVsZWFzZShzb2Nr
KTsKLQkJZ290byBvdXRfZXJyb3I7CisJCXJldHVybjsKIAl9CiAKIAltYXAgPSBwdmNhbGxzX25l
d19hY3RpdmVfc29ja2V0KGZlZGF0YSwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
