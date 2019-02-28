From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH for-next 2/5] automation: set ret for potential
 error in build-test.sh
Date: Thu, 28 Feb 2019 13:44:45 +0000
Message-ID: <20190228134448.6097-3-wei.liu2@citrix.com>
References: <20190228134448.6097-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0So3=RD=citrix.com=prvs=955226cfb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gzM03-00072z-Lx
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 13:45:23 +0000
In-Reply-To: <20190228134448.6097-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

YGdpdCByZXYtbGlzdGAgY2FuIGZhaWwgaWYgdGhlIGJhc2UuLnRpcCByYW5nZSBjb250YWlucyBp
bnZhbGlkCmNvbW1pdChzKS4gSWYgdGhhdCBoYXBwZW5zIHJldCBuZXZlciBnZXRzIGEgY2hhbmNl
IHRvIGJlIHNldC4KClNldCByZXQgYmVmb3JlIGhhbmQgdG8gZml4IHRoZSBpc3N1ZS4KClNpZ25l
ZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogYXV0b21hdGlvbi9z
Y3JpcHRzL2J1aWxkLXRlc3Quc2ggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZC10ZXN0LnNoIGIvYXV0b21h
dGlvbi9zY3JpcHRzL2J1aWxkLXRlc3Quc2gKaW5kZXggMjA2YTRmOWE0YS4uZGE2NDNhZGMwMSAx
MDA3NTUKLS0tIGEvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkLXRlc3Quc2gKKysrIGIvYXV0b21h
dGlvbi9zY3JpcHRzL2J1aWxkLXRlc3Quc2gKQEAgLTM4LDYgKzM4LDcgQEAgZWxzZQogICAgIE9S
SUc9YGdpdCByZXYtcGFyc2UgSEVBRGAKIGZpCiAKK3JldD0xCiB3aGlsZSByZWFkIG51bSByZXY7
IGRvCiAgICAgZWNobyAiVGVzdGluZyAkbnVtICRyZXYiCiAKLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
