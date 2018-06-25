From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/Xen: further refine add_preferred_console()
 invocations
Date: Mon, 25 Jun 2018 04:45:49 -0600
Message-ID: <5B30C7DD02000078001CD735@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrz=jl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fXP0O-00035W-3O
 for xen-devel@lists.xenproject.org; Mon, 25 Jun 2018 10:45:56 +0000
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

QXMgdGhlIHNlcXVlbmNlIG9mIGludm9jYXRpb25zIG1hdHRlcnMsIGFkZCAidHR5IiBvbmx5IGFm
dGVyICJodmMiIHdoZW4KYSBWR0EgY29uc29sZSBpcyBhdmFpbGFibGUgKHdoaWNoIGlzIG9mdGVu
IHRoZSBjYXNlIGZvciBEb20wLCBidXQgaGFyZGx5CmV2ZXIgZm9yIERvbVUpLgoKU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KU2xpZ2h0bHkgUkZDLCBh
cyB0aGVyZSBtYXkgYmUgc2lkZSBlZmZlY3RzIHdoaWNoIEkgc2ltcGx5IGhhdmVuJ3QKb2JzZXJ2
ZWQgbXlzZWxmIHlldC4KLS0tCiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMgfCAgICA1ICsr
KystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgotLS0g
NC4xOC1yYzIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCisrKyA0LjE4LXJjMi14ODYteGVu
LWNvbnNvbGUtb3JkZXIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCkBAIC0xMzg2LDggKzEz
ODYsMTEgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCBfX2luaXQgeGVuX3N0YQogCQl4ZW5f
Ym9vdF9wYXJhbXNfaW5pdF9lZGQoKTsKIAl9CiAKLQlhZGRfcHJlZmVycmVkX2NvbnNvbGUoInR0
eSIsIDAsIE5VTEwpOworCWlmICghYm9vdF9wYXJhbXMuc2NyZWVuX2luZm8ub3JpZ192aWRlb19p
c1ZHQSkKKwkJYWRkX3ByZWZlcnJlZF9jb25zb2xlKCJ0dHkiLCAwLCBOVUxMKTsKIAlhZGRfcHJl
ZmVycmVkX2NvbnNvbGUoImh2YyIsIDAsIE5VTEwpOworCWlmIChib290X3BhcmFtcy5zY3JlZW5f
aW5mby5vcmlnX3ZpZGVvX2lzVkdBKQorCQlhZGRfcHJlZmVycmVkX2NvbnNvbGUoInR0eSIsIDAs
IE5VTEwpOwogCiAjaWZkZWYgQ09ORklHX1BDSQogCS8qIFBDSSBCSU9TIHNlcnZpY2Ugd29uJ3Qg
d29yayBmcm9tIGEgUFYgZ3Vlc3QuICovCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
