From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 06/12] x86: patch ctxt_switch_masking()
 indirect call to direct one
Date: Wed, 29 Aug 2018 08:05:21 -0600
Message-ID: <5B86A82102000078001E315F@prv1-mh.provo.novell.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B86A5DF02000078001E310B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lc6w=lm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fv166-0004L5-5p
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 14:05:26 +0000
In-Reply-To: <5B86A5DF02000078001E310B@prv1-mh.provo.novell.com>
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

U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KdjI6IERy
b3Agb3Blbi1jb2RlZCBudW1iZXIgZnJvbSBtYWNybyBpbnZvY2F0aW9uLgoKLS0tIGEveGVuL2Fy
Y2gveDg2L2NwdS9jb21tb24uYworKysgYi94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jCkBAIC0x
ODQsNyArMTg0LDcgQEAgdm9pZCBjdHh0X3N3aXRjaF9sZXZlbGxpbmcoY29uc3Qgc3RydWN0CiAJ
fQogCiAJaWYgKGN0eHRfc3dpdGNoX21hc2tpbmcpCi0JCWN0eHRfc3dpdGNoX21hc2tpbmcobmV4
dCk7CisJCWFsdGVybmF0aXZlX3ZjYWxsKGN0eHRfc3dpdGNoX21hc2tpbmcsIG5leHQpOwogfQog
CiBib29sX3Qgb3B0X2NwdV9pbmZvOwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
