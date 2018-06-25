From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH RESEND] xen/mcelog: eliminate redundant setting
 of interface version
Date: Mon, 25 Jun 2018 04:19:48 -0600
Message-ID: <5B30C1C402000078001CD6A2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrz=jl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fXObC-0000dY-CC
 for xen-devel@lists.xenproject.org; Mon, 25 Jun 2018 10:19:54 +0000
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBhbHJlYWR5IGdldHMgZG9uZSBpbiBIWVBFUlZJU09SX21jYSgpLgoKU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KIGRyaXZlcnMveGVuL21jZWxv
Zy5jIHwgICAgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgotLS0gNC4xOC1y
YzIvZHJpdmVycy94ZW4vbWNlbG9nLmMKKysrIDQuMTgtcmMyLXhlbi1tY2Vsb2ctaW50ZXJmYWNl
LXZlcnNpb24vZHJpdmVycy94ZW4vbWNlbG9nLmMKQEAgLTI4OCw3ICsyODgsNiBAQCBzdGF0aWMg
aW50IG1jX3F1ZXVlX2hhbmRsZSh1aW50MzJfdCBmbGFnCiAJaW50IHJldCA9IDA7CiAKIAltY19v
cC5jbWQgPSBYRU5fTUNfZmV0Y2g7Ci0JbWNfb3AuaW50ZXJmYWNlX3ZlcnNpb24gPSBYRU5fTUNB
X0lOVEVSRkFDRV9WRVJTSU9OOwogCXNldF94ZW5fZ3Vlc3RfaGFuZGxlKG1jX29wLnUubWNfZmV0
Y2guZGF0YSwgJmdfbWkpOwogCWRvIHsKIAkJbWNfb3AudS5tY19mZXRjaC5mbGFncyA9IGZsYWdz
OwpAQCAtMzU4LDcgKzM1Nyw2IEBAIHN0YXRpYyBpbnQgYmluZF92aXJxX2Zvcl9tY2Uodm9pZCkK
IAogCS8qIEZldGNoIHBoeXNpY2FsIENQVSBOdW1iZXJzICovCiAJbWNfb3AuY21kID0gWEVOX01D
X3BoeXNjcHVpbmZvOwotCW1jX29wLmludGVyZmFjZV92ZXJzaW9uID0gWEVOX01DQV9JTlRFUkZB
Q0VfVkVSU0lPTjsKIAlzZXRfeGVuX2d1ZXN0X2hhbmRsZShtY19vcC51Lm1jX3BoeXNjcHVpbmZv
LmluZm8sIGdfcGh5c2luZm8pOwogCXJldCA9IEhZUEVSVklTT1JfbWNhKCZtY19vcCk7CiAJaWYg
KHJldCkgewoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
