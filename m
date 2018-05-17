From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 02/10] Osstest/Debian: preseed: Force
 UEFI install regardless
Date: Thu, 17 May 2018 12:16:51 +0100
Message-ID: <1526555819-29883-3-git-send-email-ian.jackson@eu.citrix.com>
References: <1526555819-29883-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sats=ie=citrix.com=prvs=668e6091f=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fJGuW-0001ns-1m
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 11:17:28 +0000
In-Reply-To: <1526555819-29883-1-git-send-email-ian.jackson@eu.citrix.com>
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

VGhpcyBzdXBwcmVzc2VzOgoKICAgUGFydGl0aW9uIGRpc2tzCiAgIC0tLS0tLS0tLS0tLS0tLQoK
ICAgVGhpcyBtYWNoaW5lJ3MgZmlybXdhcmUgaGFzIHN0YXJ0ZWQgdGhlIGluc3RhbGxlciBpbiBV
RUZJIG1vZGUgYnV0IGl0IGxvb2tzCiAgIGxpa2UgdGhlcmUgbWF5IGJlIGV4aXN0aW5nIG9wZXJh
dGluZyBzeXN0ZW1zIGFscmVhZHkgaW5zdGFsbGVkIHVzaW5nICJCSU9TCiAgIGNvbXBhdGliaWxp
dHkgbW9kZSIuIElmIHlvdSBjb250aW51ZSB0byBpbnN0YWxsIERlYmlhbiBpbiBVRUZJIG1vZGUs
IGl0IG1pZ2h0CiAgIGJlIGRpZmZpY3VsdCB0byByZWJvb3QgdGhlIG1hY2hpbmUgaW50byBhbnkg
QklPUy1tb2RlIG9wZXJhdGluZyBzeXN0ZW1zIGxhdGVyLgoKICAgSWYgeW91IHdpc2ggdG8gaW5z
dGFsbCBpbiBVRUZJIG1vZGUgYW5kIGRvbid0IGNhcmUgYWJvdXQga2VlcGluZyB0aGUgYWJpbGl0
eSB0bwogICBib290IG9uZSBvZiB0aGUgZXhpc3Rpbmcgc3lzdGVtcywgeW91IGhhdmUgdGhlIG9w
dGlvbiB0byBmb3JjZSB0aGF0IGhlcmUuIElmCiAgIHlvdSB3aXNoIHRvIGtlZXAgdGhlIG9wdGlv
biB0byBib290IGFuIGV4aXN0aW5nIG9wZXJhdGluZyBzeXN0ZW0sIHlvdSBzaG91bGQKICAgY2hv
b3NlIE5PVCB0byBmb3JjZSBVRUZJIGluc3RhbGxhdGlvbiBoZXJlLgogICBGb3JjZSBVRUZJIGlu
c3RhbGxhdGlvbj8KICAgICAxOiBZZXMgICAgICAyOiBObwogICAgIFByb21wdDogJz8nIGZvciBo
ZWxwPgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+Ci0tLQogT3NzdGVzdC9EZWJpYW4ucG0gfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvRGViaWFuLnBtIGIvT3NzdGVzdC9EZWJpYW4u
cG0KaW5kZXggYjQ2ZDIyMi4uY2JkMTBkMyAxMDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0K
KysrIGIvT3NzdGVzdC9EZWJpYW4ucG0KQEAgLTEzMzMsNiArMTMzMyw3IEBAIGQtaSBwYXJ0bWFu
LWF1dG8vZGlzayBzdHJpbmcgJGRpc2sKIAogZC1pIHBhcnRtYW4tZXh0My9ub19tb3VudF9wb2lu
dCBib29sZWFuIGZhbHNlCiBkLWkgcGFydG1hbi1iYXNpY21ldGhvZHMvbWV0aG9kX29ubHkgYm9v
bGVhbiBmYWxzZQorZC1pIHBhcnRtYW4tZWZpL25vbl9lZmlfc3lzdGVtIHRydWUKIAogZC1pIHBh
cnRtYW4tYXV0by9leHBlcnRfcmVjaXBlIHN0cmluZwkJCQkJXFwKIAlib290LXJvb3QgOjoJCQkJ
CQkJXFwKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
