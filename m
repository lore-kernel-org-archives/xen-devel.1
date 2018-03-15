From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] Config.mk: extend cc-option to consider exit
	status
Date: Thu, 15 Mar 2018 12:46:52 +0000
Message-ID: <20180315124652.930-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=7wu/=gf=citrix.com=prvs=605a65143=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ewSIN-0007hx-UX
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 12:47:47 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: cardoe@cardoe.com, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T3B0aW9uIGxpa2UgLU9nIHByb2R1Y2VzIHNvbWV0aGluZyBsaWtlCgogIGNjMTogZXJyb3I6IGFy
Z3VtZW50IHRvICctTycgc2hvdWxkIGJlIGEgbm9uLW5lZ2F0aXZlIGludGVnZXIKCndpdGggYSBj
b21waWxlciB0aGF0IGRvZXNuJ3Qgc3VwcG9ydCBpdC4KCkdyZXBwaW5nIGZvciB0aGUgZXhhY3Qg
b3B0aW9uIHdvdWxkbid0IHdvcmsuIEV4dGVuZCBjYy1vcHRpb24gdG8gdGFrZQppbnRvIGFjY291
bnQgdGhlIGV4aXQgc3RhdHVzIG9mIHRoZSB0ZXN0LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgotLS0KIENvbmZpZy5tayB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0NvbmZpZy5tayBiL0NvbmZpZy5t
awppbmRleCBiNWNhNTdjZTkwLi5mMWY0NjZkN2MxIDEwMDY0NAotLS0gYS9Db25maWcubWsKKysr
IGIvQ29uZmlnLm1rCkBAIC0xMDAsNyArMTAwLDcgQEAgUFlUSE9OX1BSRUZJWF9BUkcgPz0gLS1w
cmVmaXg9IiQocHJlZml4KSIKICMKICMgVXNhZ2U6IGNmbGFncy15ICs9ICQoY2FsbCBjYy1vcHRp
b24sJChDQyksLW1hcmNoPXdpbmNoaXAtYzYsLW1hcmNoPWk1ODYpCiBjYy1vcHRpb24gPSAkKHNo
ZWxsIGlmIHRlc3QgLXogImBlY2hvICd2b2lkKnA9MTsnIHwgXAotICAgICAgICAgICAgICAkKDEp
ICQoMikgLVMgLW8gL2Rldi9udWxsIC14IGMgLSAyPiYxIHwgZ3JlcCAtLSAkKDIpIC1gIjsgXAor
ICAgICAgICAgICAgICB7ICQoMSkgJCgyKSAtUyAtbyAvZGV2L251bGwgLXggYyAtIDI+JjEgfHwg
ZWNobyAkKDIpOyB9IHwgZ3JlcCAtLSAkKDIpIC1gIjsgXAogICAgICAgICAgICAgICB0aGVuIGVj
aG8gIiQoMikiOyBlbHNlIGVjaG8gIiQoMykiOyBmaSA7KQogCiAjIGNjLW9wdGlvbi1hZGQ6IEFk
ZCBhbiBvcHRpb24gdG8gY29tcGlsYXRpb24gZmxhZ3MsIGJ1dCBvbmx5IGlmIHN1cHBvcnRlZC4K
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
