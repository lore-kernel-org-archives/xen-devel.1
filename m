From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v5 00/14] x86: emulator enhancements
Date: Thu, 15 Mar 2018 06:57:03 -0600
Message-ID: <5AAA7BAF02000078001B2242@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ovtz=gf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewSRT-0000eZ-7E
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 12:57:11 +0000
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

MDE6IHN1cHBvcnQgM0ROb3chIGluc25zCjAyOiBwbGFjZSB0ZXN0IGJsb2JzIGluIGV4ZWN1dGFi
bGUgc2VjdGlvbgowMzogYWJzdHJhY3Qgb3V0IFhDUm4gYWNjZXNzZXMKMDQ6IGFkanVzdF9ibmQo
KSBzaG91bGQgY2hlY2sgWENSMAowNTogZWxpbWluYXRlIGN1c3RvbSAjTUYvI1hNIGhhbmRsaW5n
CjA2OiB0ZWxsIGNtcHhjaGcgaG9vayB3aGV0aGVyIExPQ0sgaXMgaW4gZWZmZWN0CjA3OiBjb3Jy
ZWN0bHkgaGFuZGxlIENNUFhDSEcqIGNvbXBhcmlzb24gZmFpbHVyZXMKMDg6IGFkZCByZWFkLW1v
ZGlmeS13cml0ZSBob29rCjA5OiBhbHNvIGhhbmRsZSBzaGlmdHMgdGhyb3VnaCAtPnJtdygpCjEw
OiBIVk06IGRvIGFjdHVhbCBDTVBYQ0hHIGluIGh2bWVtdWxfY21weGNoZygpCjExOiBIVk06IG1h
a2UgdXNlIG9mIG5ldyByZWFkLW1vZGlmeS13cml0ZSBlbXVsYXRvciBob29rCjEyOiBIVk06IHVz
ZSB4ODZlbXVsX3dyaXRlX3hjcigpCjEzOiBzaGFkb3c6IGZ1bGx5IG1vdmUgdW5tYXAtZGVzdCBp
bnRvIGNvbW1vbiBjb2RlCjE0OiBzaGFkb3c6IGZvbGQgc2hfeDg2X2VtdWxhdGVfe3dyaXRlLGNt
cHhjaGd9KCkgaW50byB0aGVpciBvbmx5IGNhbGxlcnMKClNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCnY1OiBNYWlubHkgcGF0Y2hlcyAxIGFuZCAzIGNoYW5n
ZWQsIHdoaWxlIHBhdGNoZXMgOSBhbmQgMTIgYXJlIG5ldy4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
