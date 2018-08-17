From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v3 0/2] x86: HW vulnerability mitigation logging
 improvements
Date: Fri, 17 Aug 2018 00:45:22 -0600
Message-ID: <5B766F0202000078001DF30A@prv1-mh.provo.novell.com>
References: <5B4EF9C402000078001D5433@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ndfk=la=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fqYVg-0006C7-Eg
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 06:45:24 +0000
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

SSdtIG5vdCByZWFsbHkgY29udmluY2VkIG9mIHRoZSBjaGFuZ2UgZG9uZSBpbiB2MywgZXZlbiBs
ZXNzIHNvIHdpdGgKeDg2J2VzIHB2L2RvbWFpbi5oIG5vdCByZWFsbHkgaGF2aW5nIGJlZW4gc3Vp
dGFibGUgZm9yIGluY2x1c2lvbiBpbgpzcGVjLWN0cmwuYyAobmVlZGVkIGFuIGV4dHJhLCBzZWVt
aW5nbHkgdW5yZWxhdGVkIGFkanVzdG1lbnQpLCBidXQKaW4gdGhlIGludGVyZXN0IG9mIGdldHRp
bmcgdGhpcyBkb25lLCBoZXJlIHlvdSBnby4KCjE6IHg4NjogcmVwb3J0IHVzZSBvZiBQQ0lEIHRv
Z2V0aGVyIHdpdGggcmVwb3J0aW5nIFhQVEkgc3RhdHVzCjI6IHg4Ni9zcGVjLWN0cmw6IHNwbGl0
IHJlcG9ydGluZyBmb3IgUFYgYW5kIEhWTSBndWVzdHMKCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
