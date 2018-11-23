From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2] mm: disallow MEMF_no_refcount to be passed
 for domain-owned allocations
Date: Fri, 23 Nov 2018 02:45:53 -0700
Message-ID: <5BF7CC5102000078001FF4AE@prv1-mh.provo.novell.com>
References: <3B3E4AB50200006BB4B78B26@prv1-mh.provo.novell.com>
 <5BF4339D02000078001FE26D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gQ827-0002f1-Dy
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 09:45:55 +0000
In-Reply-To: <5BF4339D02000078001FE26D@prv1-mh.provo.novell.com>
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
c2UuY29tPgotLS0KdjI6IEFkZCBBU1NFUlRfVU5SRUFDSEFCTEUoKS4KCi0tLSBhL3hlbi9jb21t
b24vcGFnZV9hbGxvYy5jCisrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCkBAIC0yMzAzLDYg
KzIzMDMsMTEgQEAgc3RydWN0IHBhZ2VfaW5mbyAqYWxsb2NfZG9taGVhcF9wYWdlcygKIAogICAg
IGlmICggbWVtZmxhZ3MgJiBNRU1GX25vX293bmVyICkKICAgICAgICAgbWVtZmxhZ3MgfD0gTUVN
Rl9ub19yZWZjb3VudDsKKyAgICBlbHNlIGlmICggKG1lbWZsYWdzICYgTUVNRl9ub19yZWZjb3Vu
dCkgJiYgZCApCisgICAgeworICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKKyAgICAgICAg
cmV0dXJuIE5VTEw7CisgICAgfQogCiAgICAgaWYgKCBkbWFfYml0c2l6ZSAmJiAoKGRtYV96b25l
ID0gYml0c190b196b25lKGRtYV9iaXRzaXplKSkgPCB6b25lX2hpKSApCiAgICAgICAgIHBnID0g
YWxsb2NfaGVhcF9wYWdlcyhkbWFfem9uZSArIDEsIHpvbmVfaGksIG9yZGVyLCBtZW1mbGFncywg
ZCk7CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
