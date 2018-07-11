From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 12/16] x86: patch ctxt_switch_masking() indirect
 call to direct one
Date: Wed, 11 Jul 2018 07:44:17 -0600
Message-ID: <5B4609B102000078001D32B6@prv1-mh.provo.novell.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=t1xz=j3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fdFPp-00021J-Bd
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 13:44:21 +0000
In-Reply-To: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVu
L2FyY2gveDg2L2NwdS9jb21tb24uYworKysgYi94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jCkBA
IC0xOTYsNyArMTk2LDcgQEAgdm9pZCBjdHh0X3N3aXRjaF9sZXZlbGxpbmcoY29uc3Qgc3RydWN0
CiAJfQogCiAJaWYgKGN0eHRfc3dpdGNoX21hc2tpbmcpCi0JCWN0eHRfc3dpdGNoX21hc2tpbmco
bmV4dCk7CisJCWFsdGVybmF0aXZlX3ZjYWxsMShjdHh0X3N3aXRjaF9tYXNraW5nLCBuZXh0KTsK
IH0KIAogYm9vbF90IG9wdF9jcHVfaW5mbzsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
