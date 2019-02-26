From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3] x86/nmi: correctly check MSB of P6
 performance counter MSR in watchdog
Date: Tue, 26 Feb 2019 10:20:36 -0700
Message-ID: <5C757564020000780021A707@prv1-mh.provo.novell.com>
References: <1551200785-30345-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gygPJ-0005V7-Em
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 17:20:41 +0000
In-Reply-To: <1551200785-30345-1-git-send-email-igor.druzhinin@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAyLjE5IGF0IDE4OjA2LCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTMyMyw2ICszMjYsMTMgQEAgc3RhdGljIHZvaWQgc2V0dXBfcDZfd2F0Y2hkb2co
dW5zaWduZWQgY291bnRlcikKPiAgICAgIHVuc2lnbmVkIGludCBldm50c2VsOwo+ICAKPiAgICAg
IG5taV9wZXJmY3RyX21zciA9IE1TUl9QNl9QRVJGQ1RSKDApOwo+ICsgICAgaWYgKCAhbm1pX3A2
X2V2ZW50X3dpZHRoICkKPiArICAgIAlubWlfcDZfZXZlbnRfd2lkdGggPSAoY3VycmVudF9jcHVf
ZGF0YS5jcHVpZF9sZXZlbCA+PSAweGEgKSA/CgpTdHJheSBibGFuayBiZWZvcmUgY2xvc2luZyBw
YXJlbi4KCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUFTS19FWFRSKGNwdWlkX2Vh
eCgweGEpLCBQNl9FVkVOVF9XSURUSF9NQVNLKSA6Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgUDZfRVZFTlRfV0lEVEhfTUlOOwo+ICsgICAgaWYgKCBubWlfcDZfZXZlbnRfd2lkdGgg
PCBQNl9FVkVOVF9XSURUSF9NSU4gfHwKPiArICAgICAgICAgbm1pX3A2X2V2ZW50X3dpZHRoID4g
QklUU19QRVJfTE9ORyApCj4gKyAgICAgICByZXR1cm47CgpJJ20gYWxtb3N0IG9rYXkgd2l0aCB0
aGlzLCBidXQgSSdkIHJlYWxseSBsaWtlIHRoZSB6ZXJvIGZpZWxkIGNhc2UgdG8KYmUgaGFuZGxl
ZCBpZGVudGljYWwgdG8gdGhlIG1heC1sZWFmLXRvby1zbWFsbCBvbmUuIEEgaGlnaGVyCm5vbi1i
bGFuayBsZWFmIGV4aXN0aW5nIGRvZXMgbm90IG1lYW4gdGhlIGxlYWYgaGVyZSBpcyBtZWFuaW5n
ZnVsLgpPciB0YWtpbmcgaXQgdGhlIG90aGVyIHdheSBhcm91bmQsIG1heC1sZWFmLXRvby1zbWFs
bCBzaG91bGQgYmUKbm8gZGlmZmVyZW50IGZyb20gYW4gYWxsLWJsYW5rIGxlYWYuCgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
