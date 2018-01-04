From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC v1 09/74] xen/common: Widen the guest
	logging buffer slightly
Date: Thu, 4 Jan 2018 13:05:20 +0000
Message-ID: <20180104130625.28605-10-wei.liu2@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/p+y=d7=citrix.com=prvs=535dfbe76=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eX5EB-0000R6-12
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 13:06:35 +0000
In-Reply-To: <20180104130625.28605-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClRoaXMgcmVk
dWNlcyB0aGUgYW1vdW50IG9mIGxpbmUgd3JhcHBpbmcgZnJvbSBndWVzdHM7IFhlbiBpbiBwYXJ0
aWN1bGFyIGxpa2VzCnRvIHByaW50IGxpbmVzIGxvbmdlciB0aGFuIDgwIGNoYXJhY3RlcnMuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpS
ZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vaW5jbHVk
ZS94ZW4vc2NoZWQuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIveGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLmgKaW5kZXggMDAyYmEyOWQ2ZC4uNjRhYmMxZGY2YyAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgK
QEAgLTQyNyw3ICs0MjcsNyBAQCBzdHJ1Y3QgZG9tYWluCiAgICAgeGVuX2RvbWFpbl9oYW5kbGVf
dCBoYW5kbGU7CiAKICAgICAvKiBodm1fcHJpbnRfbGluZSgpIGFuZCBndWVzdF9jb25zb2xlX3dy
aXRlKCkgbG9nZ2luZy4gKi8KLSNkZWZpbmUgRE9NQUlOX1BCVUZfU0laRSA4MAorI2RlZmluZSBE
T01BSU5fUEJVRl9TSVpFIDIwMAogICAgIGNoYXIgICAgICAgKnBidWY7CiAgICAgdW5zaWduZWQg
ICAgcGJ1Zl9pZHg7CiAgICAgc3BpbmxvY2tfdCAgcGJ1Zl9sb2NrOwotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
