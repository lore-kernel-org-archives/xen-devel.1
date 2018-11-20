From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 1/4] mm: disallow MEMF_no_refcount to be passed
 for domain-owned allocations
Date: Tue, 20 Nov 2018 09:17:33 -0700
Message-ID: <5BF4339D02000078001FE26D@prv1-mh.provo.novell.com>
References: <5BF4328902000078001FE240@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zydc=n7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gP8ih-00087r-TX
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 16:17:47 +0000
In-Reply-To: <5BF4328902000078001FE240@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBzdWNoIHBhZ2VzIGdldCBhc3NpZ25lZCB0byBkb21haW5zIChhbmQgaGVuY2UgdGhlaXIg
LT50b3RfcGFnZXMKbm90IGluY3JlbWVudGVkIGFjY29yZGluZ2x5KSB3ZSB3b3VsZCBvdGhlcndp
c2UgYWxzbyBuZWVkIHRvIHN1cHByZXNzCmRlY3JlbWVudGluZyB0aGUgY291bnQgd2hlbiBmcmVl
aW5nIHRob3NlIHBhZ2VzLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKKysrIGIveGVuL2NvbW1vbi9w
YWdlX2FsbG9jLmMKQEAgLTIzMDMsNiArMjMwMyw4IEBAIHN0cnVjdCBwYWdlX2luZm8gKmFsbG9j
X2RvbWhlYXBfcGFnZXMoCiAKICAgICBpZiAoIG1lbWZsYWdzICYgTUVNRl9ub19vd25lciApCiAg
ICAgICAgIG1lbWZsYWdzIHw9IE1FTUZfbm9fcmVmY291bnQ7CisgICAgZWxzZSBpZiAoIChtZW1m
bGFncyAmIE1FTUZfbm9fcmVmY291bnQpICYmIGQgKQorICAgICAgICByZXR1cm4gTlVMTDsKIAog
ICAgIGlmICggZG1hX2JpdHNpemUgJiYgKChkbWFfem9uZSA9IGJpdHNfdG9fem9uZShkbWFfYml0
c2l6ZSkpIDwgem9uZV9oaSkgKQogICAgICAgICBwZyA9IGFsbG9jX2hlYXBfcGFnZXMoZG1hX3pv
bmUgKyAxLCB6b25lX2hpLCBvcmRlciwgbWVtZmxhZ3MsIGQpOwoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
