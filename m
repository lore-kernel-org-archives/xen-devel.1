From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 3/4] firmware/shim: better filtering of
 intermediate files during Xen tree setup
Date: Wed, 07 Feb 2018 08:08:15 -0700
Message-ID: <5A7B246F02000078001A6148@prv-mh.provo.novell.com>
References: <5A7B21F202000078001A6124@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=rmex=fb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ejRKd-0000IA-KL
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2018 15:08:19 +0000
In-Reply-To: <5A7B21F202000078001A6124@prv-mh.provo.novell.com>
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SSBoYXZlIG5vIGlkZWEgd2hhdCAqLjEgaXMgbWVhbnQgdG8gY292ZXIuIEluc3RlYWQgYWxzbyBl
eGNsdWRlCnByZXByb2Nlc3NlZCBhbmQgbm9uLXNvdXJjZSBhc3NlbWJseSBmaWxlcy4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSB1bnN0YWJsZS5v
cmlnL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUJMjAxOC0wMi0wNyAxNTozMDoyNC4w
Mzg2MDA3ODggKzAxMDAKKysrIHVuc3RhYmxlL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZp
bGUJMjAxOC0wMi0wNyAxNTozNToxOC4xOTc3MTc5MTAgKzAxMDAKQEAgLTI2LDcgKzI2LDcgQEAg
bGlua2Zhcm0uc3RhbXA6ICQoREVQX0RJUlMpICQoREVQX0ZJTEVTKQogCSQoZm9yZWFjaCBkLCAk
KExJTktfRElSUyksIFwKIAkJKGNkICQoWEVOX1JPT1QpOyBcCiAJCSBmaW5kICQoZCkgISAtdHlw
ZSBsIC10eXBlIGYgXAotCQkgJChhZGRwcmVmaXggISAtcGF0aCAsICcqLltvYTFdJyAnLiouZCcg
Jy4qLmQyJykpIFwKKwkJICQoYWRkcHJlZml4ICEgLXBhdGggLCAnKi5baXNvYV0nICcuKi5kJyAn
LiouZDInKSkgXAogCQkgPj4gbGlua2Zhcm0uc3RhbXAudG1wIDsgKSBcCiAJJChmb3JlYWNoIGYs
ICQoTElOS19GSUxFUyksIFwKIAkJZWNobyAkKGYpID4+IGxpbmtmYXJtLnN0YW1wLnRtcCA7KQoK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
