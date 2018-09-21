From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] x86/mm: don't crash on unknown memory types in
 page_get_ram_type
Date: Fri, 21 Sep 2018 12:59:53 +0200
Message-ID: <20180921105953.3066-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gjdu=md=citrix.com=prvs=7959a86e1=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g3JB8-0007Wa-LD
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 11:00:54 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW5zdGVhZCByZXR1cm4gUkFNX1RZUEVfVU5LTk9XTi4KClJlcG9ydGVkLWJ5OiBSYXp2YW4gQ29q
b2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpDYzogUmF6dmFuIENvam9jYXJ1
IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9tbS5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYwppbmRleCA5NTVmZjBi
ZDc4Li43MzczZjQxNjdhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94ZW4v
YXJjaC94ODYvbW0uYwpAQCAtNDY1LDcgKzQ2NSw3IEBAIHVuc2lnbmVkIGludCBwYWdlX2dldF9y
YW1fdHlwZShtZm5fdCBtZm4pCiAgICAgICAgICAgICBicmVhazsKIAogICAgICAgICBkZWZhdWx0
OgotICAgICAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7CisgICAgICAgICAgICB0eXBlIHw9
IFJBTV9UWVBFX1VOS05PV047CiAgICAgICAgIH0KICAgICB9CiAKLS0gCjIuMTkuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
