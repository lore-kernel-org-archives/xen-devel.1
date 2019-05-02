From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 3/9] x86/mm: honor opt_pcid also for 32-bit PV
 domains
Date: Thu, 02 May 2019 06:19:49 -0600
Message-ID: <5CCAE065020000780022B2EB@prv1-mh.provo.novell.com>
References: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMAgv-0004U7-Fq
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 12:19:57 +0000
In-Reply-To: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SSBjYW4ndCBzZWUgYW55IHRlY2huaWNhbCBvciBwZXJmb3JtYW5jZSByZWFzb24gd2h5IHdlIHNo
b3VsZCB0cmVhdAozMi1iaXQgUFYgZGlmZmVyZW50IGZyb20gNjQtYml0IFBWIGluIHRoaXMgcmVn
YXJkLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0t
IGEveGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wdi9kb21haW4u
YwpAQCAtMTgwLDcgKzE4MCwyNCBAQCBpbnQgc3dpdGNoX2NvbXBhdChzdHJ1Y3QgZG9tYWluICpk
KQogICAgIGQtPmFyY2gueDg3X2ZpcF93aWR0aCA9IDQ7CiAKICAgICBkLT5hcmNoLnB2LnhwdGkg
PSBmYWxzZTsKLSAgICBkLT5hcmNoLnB2LnBjaWQgPSBmYWxzZTsKKworICAgIGlmICggdXNlX2lu
dnBjaWQgJiYgY3B1X2hhc19wY2lkICkKKyAgICAgICAgc3dpdGNoICggQUNDRVNTX09OQ0Uob3B0
X3BjaWQpICkKKyAgICAgICAgeworICAgICAgICBjYXNlIFBDSURfT0ZGOgorICAgICAgICBjYXNl
IFBDSURfWFBUSToKKyAgICAgICAgICAgIGQtPmFyY2gucHYucGNpZCA9IGZhbHNlOworICAgICAg
ICAgICAgYnJlYWs7CisKKyAgICAgICAgY2FzZSBQQ0lEX0FMTDoKKyAgICAgICAgY2FzZSBQQ0lE
X05PWFBUSToKKyAgICAgICAgICAgIGQtPmFyY2gucHYucGNpZCA9IHRydWU7CisgICAgICAgICAg
ICBicmVhazsKKworICAgICAgICBkZWZhdWx0OgorICAgICAgICAgICAgQVNTRVJUX1VOUkVBQ0hB
QkxFKCk7CisgICAgICAgICAgICBicmVhazsKKyAgICAgICAgfQogCiAgICAgcmV0dXJuIDA7CiAK
QEAgLTMxMiw3ICszMjksNyBAQCBpbnQgcHZfZG9tYWluX2luaXRpYWxpc2Uoc3RydWN0IGRvbWFp
biAqCiAKICAgICBkLT5hcmNoLnB2LnhwdGkgPSBpc19oYXJkd2FyZV9kb21haW4oZCkgPyBvcHRf
eHB0aV9od2RvbSA6IG9wdF94cHRpX2RvbXU7CiAKLSAgICBpZiAoICFpc19wdl8zMmJpdF9kb21h
aW4oZCkgJiYgdXNlX2ludnBjaWQgJiYgY3B1X2hhc19wY2lkICkKKyAgICBpZiAoIHVzZV9pbnZw
Y2lkICYmIGNwdV9oYXNfcGNpZCApCiAgICAgICAgIHN3aXRjaCAoIEFDQ0VTU19PTkNFKG9wdF9w
Y2lkKSApCiAgICAgICAgIHsKICAgICAgICAgY2FzZSBQQ0lEX09GRjoKCgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
