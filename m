From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/5] x86/dom0: minor fixes and improvements to
 PVH builder
Date: Thu, 27 Dec 2018 16:26:33 +0100
Message-ID: <20181227152638.41648-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wa+V=PE=citrix.com=prvs=8928ed1c0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gcXYn-0003X6-G8
 for xen-devel@lists.xenproject.org; Thu, 27 Dec 2018 15:26:57 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGlzIHNlcmllcyBjb250YWlucyBzb21lIHRyaXZpYWwgYnVnIGZpeGVzIGZvciB0
aGUgUFZIIGRvbTAgYnVpbGRlciBhbmQKYW4gaW1wcm92ZW1lbnQgd2hlbiBmaWxsaW5nIHRoZSBw
Mm0gc28gdGhhdCBhbGlnbm1lbnQgaXMgdGFrZW4gaW50bwphY2NvdW50IHdoZW4gYWxsb2NhdGlu
ZyBhbmQgcG9wdWxhdGluZyB0aGUgcDJtLgoKVGhhbmtzLCBSb2dlci4KClJvZ2VyIFBhdSBNb25u
ZSAoNSk6CiAgeDg2L2RvbTA6IGZpeCB3b3JkaW5nIG9mIFBWSCBEb20wIGVycm9yIG1lc3NhZ2UK
ICB4ODYvZG9tMDogYWxsb3cgc3RlYWxpbmcgUkFNIGZyb20gYSByZWdpb24gdGhhdCBzdGFydHMg
aW4gdGhlIGxvdyAxTUIKICB4ODYvZG9tMDogYWRkIG1pc3NpbmcgZmxhZyB0byBwcmludGYgZm9y
bWF0IGZvciBQVkgKICB4ODYvZG9tMDogcHJvcGFnYXRlIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2Ug
ZXJyb3IgY29kZQogIHg4Ni9kb20wOiB0YWtlIGFsaWdubWVudCBpbnRvIGFjY291bnQgd2hlbiBw
b3B1bGF0aW5nIHAybSBpbiBQVkggbW9kZQoKIHhlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5j
IHwgNjYgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA0OCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjIgKEFwcGxlIEdp
dC0xMTMpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
