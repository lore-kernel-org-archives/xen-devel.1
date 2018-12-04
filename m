From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [OSSTEST PATCH 3/7] xen-install: use route with metric
 0 to retrieve local network netmask
Date: Tue,  4 Dec 2018 22:37:07 +0100
Message-ID: <77038a744f279407ace91bab2334b2df6958a003.1543959416.git-series.marmarek@invisiblethingslab.com>
References: <cover.1a6b492e19e3f9f4f75130091142be454d04d5db.1543959416.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pex+=on=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gUIOe-0006l2-C4
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 21:38:24 +0000
In-Reply-To: <cover.1a6b492e19e3f9f4f75130091142be454d04d5db.1543959416.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.1a6b492e19e3f9f4f75130091142be454d04d5db.1543959416.git-series.marmarek@invisiblethingslab.com>
References: <cover.1a6b492e19e3f9f4f75130091142be454d04d5db.1543959416.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

T3RoZXJ3aXNlIGl0IHdpbGwgbWF0Y2ggMTY5LjI1NC4wLjAvMTYgcm91dGUsIHdoaWNoIGhhcyBh
bHdheXMgLzE2Cm5ldG1hc2ssIGluc3RlYWQgb2Ygd2hhdCByZWFsbHkgaXMgdXNlZCBvbiB0aGUg
bG9jYWwgbmV0d29yay4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNr
aSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KLS0tCiB0cy14ZW4taW5zdGFsbCB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3RzLXhlbi1pbnN0YWxsIGIvdHMteGVuLWluc3RhbGwKaW5kZXggOGRlOTRhYy4u
MmYwZDI2MyAxMDA3NTUKLS0tIGEvdHMteGVuLWluc3RhbGwKKysrIGIvdHMteGVuLWluc3RhbGwK
QEAgLTM0OSw3ICszNDksNyBAQCBFTkQKIAogCW15ICRyb3V0ZXM9IHRhcmdldF9jbWRfb3V0cHV0
X3Jvb3QoJGhvLCAicm91dGUgLW4iKTsKIAotCSRyb3V0ZXMgPX4gbS9eIFswLTkuXSsgXHMrIDBc
LjBcLjBcLjAgXHMrIChbMC05Ll0rKSBccysgXFMqVVxTKiBccyAvbXhpCisJJHJvdXRlcyA9fiBt
L14gWzAtOS5dKyBccysgMFwuMFwuMFwuMCBccysgKFswLTkuXSspIFxzKyBcUypVXFMqIFxzKyAw
IFxzL214aQogCSAgICBvciBkaWUgIm5vIG93biBsb2NhbCBuZXR3b3JrIGluIHJvdXRlID8gICRy
b3V0ZXMgIjsKIAlteSAkbmV0bWFzaz0gJDE7CiAKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
