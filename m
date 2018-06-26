From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH for-4.11 v2 3/3] VMX: check host CR0 before
 entering guest
Date: Tue, 26 Jun 2018 00:38:02 -0600
Message-ID: <5B31DF4A02000078001CDC17@prv1-mh.provo.novell.com>
References: <5B31DC2702000078001CDBEC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x7n8=jm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fXhc5-00082t-Nt
 for xen-devel@lists.xenproject.org; Tue, 26 Jun 2018 06:38:05 +0000
In-Reply-To: <5B31DC2702000078001CDBEC@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

V2hpbGUgd2UgZG9uJ3QgZXhwZWN0IENSMCB0byBjaGFuZ2UgYmVoaW5kIG91ciBiYWNrcywgY29w
ZSB3aXRoIHRoaXMKaGFwcGVuaW5nLCBidXQgb3RoZXIgdGhhbiBmb3IgQ1I0IGFsc28gbG9nIGEg
KGRlYnVnKSBtZXNzYWdlLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vdm14L3ZtY3MuYwpAQCAtMTY3Niw3ICsxNjc2LDcgQEAgdm9pZCB2bXhfdm1lbnRy
eV9mYWlsdXJlKHZvaWQpCiB2b2lkIHZteF9kb19yZXN1bWUoc3RydWN0IHZjcHUgKnYpCiB7CiAg
ICAgYm9vbF90IGRlYnVnX3N0YXRlOwotICAgIHVuc2lnbmVkIGxvbmcgaG9zdF9jcjQ7CisgICAg
dW5zaWduZWQgbG9uZyBob3N0X2NyNCwgaG9zdF9jcjAsIGNyMDsKIAogICAgIGlmICggdi0+YXJj
aC5odm1fdm14LmFjdGl2ZV9jcHUgPT0gc21wX3Byb2Nlc3Nvcl9pZCgpICkKICAgICAgICAgdm14
X3ZtY3NfcmVsb2FkKHYpOwpAQCAtMTczMiw2ICsxNzMyLDE1IEBAIHZvaWQgdm14X2RvX3Jlc3Vt
ZShzdHJ1Y3QgdmNwdSAqdikKICAgICBpZiAoIGhvc3RfY3I0ICE9IHJlYWRfY3I0KCkgKQogICAg
ICAgICBfX3Ztd3JpdGUoSE9TVF9DUjQsIHJlYWRfY3I0KCkpOwogCisgICAgLyogQ2hlY2sgaG9z
dCBDUjAgKGl0cyB2YWx1ZSBzaG91bGRuJ3QgaGF2ZSBjaGFuZ2VkKS4gKi8KKyAgICBfX3ZtcmVh
ZChIT1NUX0NSMCwgJmhvc3RfY3IwKTsKKyAgICBjcjAgPSByZWFkX2NyMCgpOworICAgIGlmICgg
aG9zdF9jcjAgIT0gY3IwICkKKyAgICB7CisgICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwgIiVw
djogQ1IwICVseCAhPSAlbHhcbiIsIHYsIGhvc3RfY3IwLCBjcjApOworICAgICAgICBfX3Ztd3Jp
dGUoSE9TVF9DUjAsIGNyMCk7CisgICAgfQorCiAgICAgcmVzZXRfc3RhY2tfYW5kX2p1bXAodm14
X2FzbV9kb192bWVudHJ5KTsKIH0KIAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
