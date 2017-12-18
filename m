From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/shadow: make 1-bit-disable match
	1-bit-enable
Date: Mon, 18 Dec 2017 02:28:35 -0700
Message-ID: <5A379853020000780019805A@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wghk=do=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eQrir-00082k-6u
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2017 09:28:33 +0000
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
Cc: Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

c2hhZG93X29uZV9iaXRfZW5hYmxlKCkgc2V0cyBQR19TSF9lbmFibGUgKGlmIG5vdCBhbHJlYWR5
IHNldCBvZiBjb3Vyc2UpCmluIGFkZGl0aW9uIHRvIHRoZSBiaXQgYmVpbmcgcmVxdWVzdGVkLiBN
YWtlIHNoYWRvd19vbmVfYml0X2Rpc2FibGUoKQpiZWhhdmUgc2ltaWxhcmx5IC0gY2xlYXIgUEdf
U0hfZW5hYmxlIGlmIHRoYXQncyB0aGUgb25seSBiaXQgcmVtYWluaW5nLgoKU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L21t
L3NoYWRvdy9jb21tb24uYworKysgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jCkBA
IC0zMzgzLDcgKzMzODMsMTAgQEAgc3RhdGljIGludCBzaGFkb3dfb25lX2JpdF9kaXNhYmxlKHN0
cnVjdAogICAgIH0KIAogICAgIC8qIFVwZGF0ZSB0aGUgYml0cyAqLwotICAgIHNoX25ld19tb2Rl
KGQsIGQtPmFyY2gucGFnaW5nLm1vZGUgJiB+bW9kZSk7CisgICAgbW9kZSA9IGQtPmFyY2gucGFn
aW5nLm1vZGUgJiB+bW9kZTsKKyAgICBpZiAoIG1vZGUgPT0gUEdfU0hfZW5hYmxlICkKKyAgICAg
ICAgbW9kZSA9IDA7CisgICAgc2hfbmV3X21vZGUoZCwgbW9kZSk7CiAgICAgaWYgKCBkLT5hcmNo
LnBhZ2luZy5tb2RlID09IDAgKQogICAgIHsKICAgICAgICAgLyogR2V0IHRoaXMgZG9tYWluIG9m
ZiBzaGFkb3dzICovCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
