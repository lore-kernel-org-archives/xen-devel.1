From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 0/5] Debian stretch HVM guest
 workarounds
Date: Wed, 17 Apr 2019 17:37:47 +0100
Message-ID: <20190417163752.994-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fEre=ST=citrix.com=prvs=0036fbe7a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hGnZR-0005Aw-Vd
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 16:38:02 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIERlYmlhbiBIVk0gdGVzdHMgYXJlIGJyb2tlbiB3aXRoIDMyLWJpdCBndWVzdHMsIGR1ZSB0
byBidWdzIGFuZAppbmZlbGljaXRpZXMgaW4gc3RyZXRjaC4gIFRoaXMgaXMgYmxvY2tpbmcgdGhp
bmdzLiAgRml4IGl0LiAgSSB3aWxsCnB1c2ggdGhpcyBzZXJpZXMgdG8gb3NzdGVzdCBwcmV0ZXN0
IHJpZ2h0IGF3YXkuCgpJYW4gSmFja3NvbiAoNSk6CiAgZGViaWFuaHZtIHRlc3RzOiBSZS1wZXJt
dXRlIGd1ZXN0IGFyY2hpdGVjdHVyZQogIG1nLXJlcHJvLXNldHVwOiBBbGxvdywgYW5kIGFkdmVy
dGlzZSwgXiBmb3IgdW5zZXR0aW5nIHJ1bnZhcnMKICB0cy1kZWJpYW4taHZtLWluc3RhbGw6IFVz
ZSAtLS0sIGFuZCBubyBsb25nZXIgZHVwbGljYXRlICRnY29uc29sZQogIHRzLWRlYmlhbi1odm0t
aW5zdGFsbDogRGlzYWJsZSBuZXQuaWZuYW1lcyBmb3IgRGViaWFuIEhWTSBndWVzdHMKICBEZWJp
YW46IFdvcmsgYXJvdW5kIERlYmlhbiBzdHJldGNoIGJ1ZyB3aXRoIGRpc2sgZGV2aWNlIG5hbWVz
CgogT3NzdGVzdC9EZWJpYW4ucG0gICAgIHwgMTkgKysrKysrKysrKysrKysrKysrKwogbWFrZS1m
bGlnaHQgICAgICAgICAgIHwgMTEgKysrKysrKystLS0KIG1nLXJlcHJvLXNldHVwICAgICAgICB8
ICA4ICsrKysrLS0tCiB0cy1kZWJpYW4taHZtLWluc3RhbGwgfCAxNCArKysrKysrKysrLS0tLQog
NCBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCi0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
