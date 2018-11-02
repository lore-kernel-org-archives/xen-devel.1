From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 1/8] tools/libvchan: Initialise xs_transaction_t
 to XBT_NULL, not NULL
Date: Fri, 2 Nov 2018 17:01:06 +0000
Message-ID: <20181102170113.11646-2-ian.jackson@eu.citrix.com>
References: <23516.33005.649128.145551@mariner.uk.xensource.com>
 <20181102170113.11646-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vtjf=nn=citrix.com=prvs=837fd0aa5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gIcpW-0004ZA-G7
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 17:01:54 +0000
In-Reply-To: <20181102170113.11646-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBhbiBpbnRlZ2VyIHR5cGUsIG5vdCBhIHBvaW50ZXIuCgpTaWduZWQtb2ZmLWJ5OiBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ2Y2hh
bi9pbml0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ2Y2hhbi9pbml0LmMgYi90b29scy9saWJ2Y2hh
bi9pbml0LmMKaW5kZXggYmE1YTZlYjI5ZS4uMTgwODMzZGMyZiAxMDA2NDQKLS0tIGEvdG9vbHMv
bGlidmNoYW4vaW5pdC5jCisrKyBiL3Rvb2xzL2xpYnZjaGFuL2luaXQuYwpAQCAtMjUwLDcgKzI1
MCw3IEBAIHN0YXRpYyBpbnQgaW5pdF94c19zcnYoc3RydWN0IGxpYnhlbnZjaGFuICpjdHJsLCBp
bnQgZG9tYWluLCBjb25zdCBjaGFyKiB4c19iYXNlCiAJY2hhciBidWZbNjRdOwogCWNoYXIgcmVm
WzE2XTsKIAljaGFyKiBkb21pZF9zdHIgPSBOVUxMOwotCXhzX3RyYW5zYWN0aW9uX3QgeHNfdHJh
bnMgPSBOVUxMOworCXhzX3RyYW5zYWN0aW9uX3QgeHNfdHJhbnMgPSBYQlRfTlVMTDsKIAl4cyA9
IHhzX2RvbWFpbl9vcGVuKCk7CiAJaWYgKCF4cykKIAkJZ290byBmYWlsOwotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
