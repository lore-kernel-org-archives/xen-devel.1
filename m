From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH v2 04/11] tools/libvchan: Initialise
 xs_transaction_t to XBT_NULL, not NULL
Date: Thu, 8 Nov 2018 17:07:58 +0000
Message-ID: <20181108170805.12774-5-ian.jackson@eu.citrix.com>
References: <20181108170805.12774-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t5pf=nt=citrix.com=prvs=843e771e9=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gKnnD-0000eE-Er
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 17:08:31 +0000
In-Reply-To: <20181108170805.12774-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBhbiBpbnRlZ2VyIHR5cGUsIG5vdCBhIHBvaW50ZXIuCgpTaWduZWQtb2ZmLWJ5OiBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQWNrZWQtYnk6IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlidmNoYW4vaW5pdC5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvdG9vbHMvbGlidmNoYW4vaW5pdC5jIGIvdG9vbHMvbGlidmNoYW4vaW5pdC5jCmluZGV4IGJh
NWE2ZWIyOWUuLjE4MDgzM2RjMmYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnZjaGFuL2luaXQuYwor
KysgYi90b29scy9saWJ2Y2hhbi9pbml0LmMKQEAgLTI1MCw3ICsyNTAsNyBAQCBzdGF0aWMgaW50
IGluaXRfeHNfc3J2KHN0cnVjdCBsaWJ4ZW52Y2hhbiAqY3RybCwgaW50IGRvbWFpbiwgY29uc3Qg
Y2hhciogeHNfYmFzZQogCWNoYXIgYnVmWzY0XTsKIAljaGFyIHJlZlsxNl07CiAJY2hhciogZG9t
aWRfc3RyID0gTlVMTDsKLQl4c190cmFuc2FjdGlvbl90IHhzX3RyYW5zID0gTlVMTDsKKwl4c190
cmFuc2FjdGlvbl90IHhzX3RyYW5zID0gWEJUX05VTEw7CiAJeHMgPSB4c19kb21haW5fb3Blbigp
OwogCWlmICgheHMpCiAJCWdvdG8gZmFpbDsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
