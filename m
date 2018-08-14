From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] xen: fix stale PVH comment
Date: Tue, 14 Aug 2018 16:03:24 +0200
Message-ID: <20180814140324.76000-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aubc=k5=citrix.com=prvs=757f0dc12=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fpZv3-0000HW-4s
 for xen-devel@lists.xenproject.org; Tue, 14 Aug 2018 14:03:33 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0t
LQpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3Jn
ZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJhZCBS
emVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3Jn
PgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9wdWJs
aWMvZG9tY3RsLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggYi94ZW4v
aW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKaW5kZXggNWMzOTE2Y2FhZi4uYWQ5NWE4ZTY0NCAxMDA2
NDQKLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oCisrKyBiL3hlbi9pbmNsdWRlL3B1
YmxpYy9kb21jdGwuaApAQCAtNDksNyArNDksNyBAQCBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVk
b21haW4gewogICAgIC8qIElOIHBhcmFtZXRlcnMgKi8KICAgICB1aW50MzJfdCBzc2lkcmVmOwog
ICAgIHhlbl9kb21haW5faGFuZGxlX3QgaGFuZGxlOwotIC8qIElzIHRoaXMgYW4gSFZNIGd1ZXN0
IChhcyBvcHBvc2VkIHRvIGEgUFZIIG9yIFBWIGd1ZXN0KT8gKi8KKyAvKiBJcyB0aGlzIGFuIEhW
TSBndWVzdCAoYXMgb3Bwb3NlZCB0byBhIFBWIGd1ZXN0KT8gKi8KICNkZWZpbmUgX1hFTl9ET01D
VExfQ0RGX2h2bV9ndWVzdCAgICAgMAogI2RlZmluZSBYRU5fRE9NQ1RMX0NERl9odm1fZ3Vlc3Qg
ICAgICAoMVU8PF9YRU5fRE9NQ1RMX0NERl9odm1fZ3Vlc3QpCiAgLyogVXNlIGhhcmR3YXJlLWFz
c2lzdGVkIHBhZ2luZyBpZiBhdmFpbGFibGU/ICovCi0tIAoyLjE4LjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
