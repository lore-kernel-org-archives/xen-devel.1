From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] libxc/x86/PV: don't hand through CPUID leaf
 0x80000008 as is
Date: Tue, 22 May 2018 05:40:02 -0600
Message-ID: <5B04019202000078001C4A53@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qj7d=ij=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fL5eC-0003M0-DC
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 11:40:08 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SnVzdCBsaWtlIGZvciBIVk0gdGhlIGZlYXR1cmUgc2V0IHNob3VsZCBiZSB1c2VkIGZvciBFQlgg
b3V0cHV0LCB3aGlsZQpFQVggc2hvdWxkIGJlIHJlc3RyaWN0ZWQgdG8gdGhlIGxvdyAxNiBiaXRz
IGFuZCBFQ1gvRURYIHNob3VsZCBiZSB6ZXJvLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgotLS0KdjI6IFJlc3RyaWN0IHRoZSBjaGFuZ2UgdG8ganVzdCB3
aGF0IHRoZSB0aXRsZSBzYXlzLgoKLS0tIGEvdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMKKysr
IGIvdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMKQEAgLTU3NSw2ICs1NzUsMTIgQEAgc3RhdGlj
IHZvaWQgeGNfY3B1aWRfcHZfcG9saWN5KHhjX2ludGVyZgogICAgICAgICBicmVhazsKICAgICB9
CiAKKyAgICBjYXNlIDB4ODAwMDAwMDg6CisgICAgICAgIHJlZ3NbMF0gJj0gMHgwMDAwZmZmZnU7
CisgICAgICAgIHJlZ3NbMV0gPSBpbmZvLT5mZWF0dXJlc2V0W2ZlYXR1cmV3b3JkX29mKFg4Nl9G
RUFUVVJFX0NMWkVSTyldOworICAgICAgICByZWdzWzJdID0gcmVnc1szXSA9IDA7CisgICAgICAg
IGJyZWFrOworCiAgICAgY2FzZSAweDAwMDAwMDA1OiAvKiBNT05JVE9SL01XQUlUICovCiAgICAg
Y2FzZSAweDAwMDAwMDBiOiAvKiBFeHRlbmRlZCBUb3BvbG9neSBFbnVtZXJhdGlvbiAqLwogICAg
IGNhc2UgMHg4MDAwMDAwYTogLyogU1ZNIHJldmlzaW9uIGFuZCBmZWF0dXJlcyAqLwoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
