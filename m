From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/msr: further correct the emulation
 behaviour of MSR_PRED_CMD
Date: Tue, 17 Apr 2018 05:41:54 -0600
Message-ID: <5AD5DD8202000078001BC0B7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=+s2h=hg=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f8Ozg-0005wl-Lk
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 11:41:52 +0000
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Rm9sbG93aW5nIGNvbW1pdCBhNmFhNjc4ZmEzICgieDg2L21zcjogQ29ycmVjdCB0aGUgZW11bGF0
aW9uIGJlaGF2aW91cgpvZiBNU1JfUFJFRF9DTUQiKSB3ZSBtYXkgZW5kIHVwIHdyaXRpbmcgdGhl
IGxvdyBiaXQgd2l0aCB0aGUgd3JvbmcKdmFsdWUuIFdoaWxlIGl0J3MgdW5saWtlbHkgZm9yIGEg
Z3Vlc3QgdG8gd2FudCB0byB3cml0ZSB6ZXJvIHRoZXJlLCB3ZQpzaG91bGQgc3RpbGwgcGVybWl0
ICh0aGlzIHdpdGhvdXQgaW5jdXJyaW5nIHRoZSBvdmVyaGVhZCBvZiBhbiBhY3R1YWwKYmFycmll
cikuIENvcnJlY3RpbmcgdGhpcyByaWdodCBhd2F5IHdpbGwgYWxzbyBoZWxwIHdoZW5ldmVyIGZ1
cnRoZXIKYml0cyBpbiB0aGUgTVNSIG1pZ2h0IGJlY29tZSBkZWZpbmVkLgoKU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L21z
ci5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tc3IuYwpAQCAtMjQ3LDcgKzI0Nyw3IEBAIGludCBndWVz
dF93cm1zcihzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QKICAgICAgICAgICAgIGdvdG8gZ3BfZmF1
bHQ7IC8qIFJzdmQgYml0IHNldD8gKi8KIAogICAgICAgICBpZiAoIHYgPT0gY3VyciApCi0gICAg
ICAgICAgICB3cm1zcmwoTVNSX1BSRURfQ01ELCBQUkVEX0NNRF9JQlBCKTsKKyAgICAgICAgICAg
IHdybXNybChNU1JfUFJFRF9DTUQsIHZhbCk7CiAgICAgICAgIGJyZWFrOwogCiAgICAgY2FzZSBN
U1JfSU5URUxfTUlTQ19GRUFUVVJFU19FTkFCTEVTOgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
