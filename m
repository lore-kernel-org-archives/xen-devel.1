From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 3/8] tools/libvchan: init_xs_srv: Simplify error
 handling (1)
Date: Fri, 2 Nov 2018 17:01:08 +0000
Message-ID: <20181102170113.11646-4-ian.jackson@eu.citrix.com>
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
 id 1gIcpX-0004ZF-BG
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 17:01:55 +0000
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

KiBVc2UgeHNfY2xvc2UgaW5zdGVhZCBvZiB0aGUgZGVwcmVjYXRlZCB4c19kYWVtb25fY2xvc2Uu
CgoqIEluaXRpYWxpc2UgeHMgdG8gTlVMTC4gICAgVGhhdCBtZWFucyB4c19jbG9zZSBjYW4gbm93
IGJlIGNhbGxlZCBpbgogIGFsbCBjYXNlcy4gIE1vdmUgaXQgdG8gdGhlIGZhaWwgY2xhdXNlLgoK
KiBmcmVlKGRvbWlkX3N0cikgaXMgYWxyZWFkeSBzYWZlIGluIGFsbCBjYXNlcyBzaW5jZSBkb21p
ZF9zdHIgaXMKICBpbml0aWFsaXNlZCB0byBOVUxMLiAgTW92ZSBpdCB0byB0aGUgZmFpbCBjbGF1
c2UuCgpObyBvdmVyYWxsIGZ1bmN0aW9uYWwgY2hhbmdlOiB4c19jbG9zZSBpcyB0aGUgc2FtZSBh
cyB4c19kYWVtb25fY2xvc2U7CmFuZCBpdCBhbmQgZnJlZSBhcmUgbm93IHNvbWV0aW1lcyBjYWxs
ZWQgb24gTlVMTCwgYnV0IHRob3NlIGFyZSBuby1vcHMuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ2Y2hhbi9pbml0
LmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ2Y2hhbi9pbml0LmMgYi90b29scy9saWJ2Y2hh
bi9pbml0LmMKaW5kZXggMTgwODMzZGMyZi4uOWM2MWM3MjBkMSAxMDA2NDQKLS0tIGEvdG9vbHMv
bGlidmNoYW4vaW5pdC5jCisrKyBiL3Rvb2xzL2xpYnZjaGFuL2luaXQuYwpAQCAtMjQ1LDcgKzI0
NSw3IEBAIGZhaWw6CiBzdGF0aWMgaW50IGluaXRfeHNfc3J2KHN0cnVjdCBsaWJ4ZW52Y2hhbiAq
Y3RybCwgaW50IGRvbWFpbiwgY29uc3QgY2hhciogeHNfYmFzZSwgaW50IHJpbmdfcmVmKQogewog
CWludCByZXQgPSAtMTsKLQlzdHJ1Y3QgeHNfaGFuZGxlICp4czsKKwlzdHJ1Y3QgeHNfaGFuZGxl
ICp4cyA9IE5VTEw7CiAJc3RydWN0IHhzX3Blcm1pc3Npb25zIHBlcm1zWzJdOwogCWNoYXIgYnVm
WzY0XTsKIAljaGFyIHJlZlsxNl07CkBAIC0yOTIsOSArMjkyLDkgQEAgcmV0cnlfdHJhbnNhY3Rp
b246CiAJCXJldCA9IDA7CiAJfQogIGZhaWxfeHNfb3BlbjoKLQlmcmVlKGRvbWlkX3N0cik7Ci0J
eHNfZGFlbW9uX2Nsb3NlKHhzKTsKICBmYWlsOgorCWZyZWUoZG9taWRfc3RyKTsKKwl4c19jbG9z
ZSh4cyk7CiAJcmV0dXJuIHJldDsKIH0KIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
