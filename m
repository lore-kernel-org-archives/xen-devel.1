From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH 3/3] x86/mem_sharing: enable mem_share audit
 mode only in debug builds
Date: Thu, 25 Apr 2019 09:32:52 -0600
Message-ID: <20190425153252.14795-3-tamas@tklengyel.com>
References: <20190425153252.14795-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5oh2=S3=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hJgNG-0000xM-CI
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 15:33:22 +0000
Received: by mail-io1-f67.google.com with SMTP id m188so291376ioa.9
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 08:33:21 -0700 (PDT)
In-Reply-To: <20190425153252.14795-1-tamas@tklengyel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW1wcm92ZXMgcGVyZm9ybWFuY2UgZm9yIHJlbGVhc2UgYnVpbGRzLgoKU2lnbmVkLW9mZi1ieTog
VGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgpDYzogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNjOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3No
YXJpbmcuaCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmggYi94ZW4vaW5jbHVkZS9hc20t
eDg2L21lbV9zaGFyaW5nLmgKaW5kZXggMGU3N2I3ZDkzNS4uNTJlYTkxZWZhMCAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tZW1fc2hhcmluZy5oCisrKyBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvbWVtX3NoYXJpbmcuaApAQCAtMjUsNyArMjUsOSBAQAogI2luY2x1ZGUgPHB1YmxpYy9t
ZW1vcnkuaD4KIAogLyogQXVkaXRpbmcgb2YgbWVtb3J5IHNoYXJpbmcgY29kZT8gKi8KKyNpZm5k
ZWYgTkRFQlVHCiAjZGVmaW5lIE1FTV9TSEFSSU5HX0FVRElUIDEKKyNlbmRpZgogCiB0eXBlZGVm
IHVpbnQ2NF90IHNocl9oYW5kbGVfdDsgCiAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
