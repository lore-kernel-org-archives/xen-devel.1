From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] xen/biomerge: Use true and false for boolean
 values
Date: Sat, 4 Aug 2018 19:50:14 -0500
Message-ID: <20180805005014.GA2299__23592.6938745708$1533430147$gmane$org@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4cix=ku=embeddedor.com=gustavo@srs-us1.protection.inumbo.net>)
 id 1fm7FQ-0008WM-Se
 for xen-devel@lists.xenproject.org; Sun, 05 Aug 2018 00:50:16 +0000
Received: from cm15.websitewelcome.com (cm15.websitewelcome.com [100.42.49.9])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id 51FC1A90D
 for <xen-devel@lists.xenproject.org>; Sat,  4 Aug 2018 19:50:15 -0500 (CDT)
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: xen-devel@lists.xenproject.org

UmV0dXJuIHN0YXRlbWVudHMgaW4gZnVuY3Rpb25zIHJldHVybmluZyBib29sIHNob3VsZCB1c2Ug
dHJ1ZSBvciBmYWxzZQppbnN0ZWFkIG9mIGFuIGludGVnZXIgdmFsdWUuCgpUaGlzIGNvZGUgd2Fz
IGRldGVjdGVkIHdpdGggdGhlIGhlbHAgb2YgQ29jY2luZWxsZS4KClNpZ25lZC1vZmYtYnk6IEd1
c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+Ci0tLQogZHJpdmVycy94
ZW4vYmlvbWVyZ2UuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2Jpb21lcmdlLmMgYi9kcml2ZXJz
L3hlbi9iaW9tZXJnZS5jCmluZGV4IDMwZDdmNTIuLjU1ZWQ4MGMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMveGVuL2Jpb21lcmdlLmMKKysrIGIvZHJpdmVycy94ZW4vYmlvbWVyZ2UuYwpAQCAtMTcsNyAr
MTcsNyBAQCBib29sIHhlbl9iaW92ZWNfcGh5c19tZXJnZWFibGUoY29uc3Qgc3RydWN0IGJpb192
ZWMgKnZlYzEsCiAJICogWFhYOiBBZGQgc3VwcG9ydCBmb3IgbWVyZ2luZyBiaW9fdmVjIHdoZW4g
dXNpbmcgZGlmZmVyZW50IHBhZ2UKIAkgKiBzaXplIGluIFhlbiBhbmQgTGludXguCiAJICovCi0J
cmV0dXJuIDA7CisJcmV0dXJuIGZhbHNlOwogI2VuZGlmCiB9CiBFWFBPUlRfU1lNQk9MKHhlbl9i
aW92ZWNfcGh5c19tZXJnZWFibGUpOwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
