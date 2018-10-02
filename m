From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v4 04/12] x86: patch ctxt_switch_masking()
 indirect call to direct one
Date: Tue, 02 Oct 2018 04:13:53 -0600
Message-ID: <5BB344E102000078001EDA11@prv1-mh.provo.novell.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=0jmz=mo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g7Hgl-0008JI-LF
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 10:13:59 +0000
In-Reply-To: <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZpZXdlZC1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCnYyOiBEcm9wIG9wZW4tY29kZWQg
bnVtYmVyIGZyb20gbWFjcm8gaW52b2NhdGlvbi4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvY29t
bW9uLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYwpAQCAtMTg0LDcgKzE4NCw3IEBA
IHZvaWQgY3R4dF9zd2l0Y2hfbGV2ZWxsaW5nKGNvbnN0IHN0cnVjdAogCX0KIAogCWlmIChjdHh0
X3N3aXRjaF9tYXNraW5nKQotCQljdHh0X3N3aXRjaF9tYXNraW5nKG5leHQpOworCQlhbHRlcm5h
dGl2ZV92Y2FsbChjdHh0X3N3aXRjaF9tYXNraW5nLCBuZXh0KTsKIH0KIAogYm9vbF90IG9wdF9j
cHVfaW5mbzsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
