From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH V10 0/5] Fix VGA logdirty related display
 freezes with altp2m
Date: Wed, 28 Nov 2018 23:56:17 +0200
Message-ID: <1543442182-3557-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gQRe=OH=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gS7os-0003Gd-9s
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 21:56:30 +0000
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 973AB3016E6B
 for <xen-devel@lists.xenproject.org>; Wed, 28 Nov 2018 23:56:27 +0200 (EET)
Received: from rcojocaru.npunix.bitdefender.biz (unknown [10.17.12.174])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 88A5A3000E5B
 for <xen-devel@lists.xenproject.org>; Wed, 28 Nov 2018 23:56:27 +0200 (EET)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhpcyBzZXJpZXMgYWltcyB0byBwcmV2ZW50IHRoZSBkaXNwbGF5IGZyb20gZnJlZXppbmcgd2hl
bgplbmFibGluZyBhbHRwMm0gYW5kIHN3aXRjaGluZyB0byBhIG5ldyB2aWV3IChhbmQgYXNzb3J0
ZWQgcHJvYmxlbXMKd2hlbiByZXNpemluZyB0aGUgZGlzcGxheSkuCgpUaGUgc2VyaWVzIGFsbG9j
YXRlcyBhIG5ldyBsb2dkaXJ0eSByYW5nZXNldCBmb3IgZWFjaCBuZXcgYWx0cDJtLAphbmQgcHJv
cGFnYXRlcyAodW5kZXIgbG9jaykgY2hhbmdlcyB0byBhbGwgcDJtcy4KCltQQVRDSCBWMTAgMS81
XSB4ODYvcDJtOiBhbGxvY2F0ZSBsb2dkaXJ0eV9yYW5nZXMgZm9yIGFsdHAybQpbUEFUQ0ggVjEw
IDIvNV0geDg2L3AybTogcmVmYWN0b3IgcDJtX3Jlc2V0X2FsdHAybSgpCltQQVRDSCBWMTAgMy81
XSB4ODYvYWx0cDJtOiBmaXggZGlzcGxheSBmcm96ZW4gd2hlbiBzd2l0Y2hpbmcgdG8gYSBuZXcg
dmlldyBlYXJseQpbUEFUQ0ggVjEwIDQvNV0gcDJtOiBBbHdheXMgdXNlIGhvc3RwMm0gd2hlbiBj
bGlwcGluZyByYW5nZXNldHMKW1BBVENIIFYxMCA1LzVdIHAybTogY2hhbmdlX3R5cGVfcmFuZ2U6
IE9ubHkgaW52YWxpZGF0ZSBtYXBwZWQgZ2ZucwoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
