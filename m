From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 0/4] Improvement to docker-based build
 automation
Date: Mon, 9 Jul 2018 16:32:12 +0100
Message-ID: <20180709153216.15892-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pzs8=jz=citrix.com=prvs=72153cbb0=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fcY9F-0005Ub-6A
 for xen-devel@lists.xenproject.org; Mon, 09 Jul 2018 15:32:21 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSAoNCk6CiAgYXV0b21hdGlvbjogaW5zdGFsbCB0ZXhpbmZvCiAgYXV0b21hdGlvbjog
aW5zdGFsbCBzb21lIHBhY2thZ2VzIGZvciBDZW50T1MgZnJvbSBFUEVMCiAgYXV0b21hdGlvbjog
aW50cm9kdWNlIHN0cmV0Y2gtaTM4Ni5kb2NrZXJmaWxlCiAgYXV0b21hdGlvbjogYnVpbGQgbW9y
ZSBzdHVmZiBvbiB4ODYgd2l0aCBkb2NrZXIKCiBhdXRvbWF0aW9uL2J1aWxkL2NlbnRvcy83LjIu
ZG9ja2VyZmlsZSAgICAgICAgICB8ICA3ICsrKysKIGF1dG9tYXRpb24vYnVpbGQvZGViaWFuL2pl
c3NpZS5kb2NrZXJmaWxlICAgICAgIHwgIDEgKwogYXV0b21hdGlvbi9idWlsZC9kZWJpYW4vc3Ry
ZXRjaC1pMzg2LmRvY2tlcmZpbGUgfCA1MCArKysrKysrKysrKysrKysrKysrKysrKysrCiBhdXRv
bWF0aW9uL2J1aWxkL2RlYmlhbi9zdHJldGNoLmRvY2tlcmZpbGUgICAgICB8ICAxICsKIGF1dG9t
YXRpb24vYnVpbGQvdWJ1bnR1L3RydXN0eS5kb2NrZXJmaWxlICAgICAgIHwgIDEgKwogYXV0b21h
dGlvbi9idWlsZC91YnVudHUveGVuaWFsLmRvY2tlcmZpbGUgICAgICAgfCAgMSArCiBhdXRvbWF0
aW9uL3NjcmlwdHMvYnVpbGQgICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICstLQogNyBmaWxl
cyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGF1dG9tYXRpb24vYnVpbGQvZGViaWFuL3N0cmV0Y2gtaTM4Ni5kb2NrZXJmaWxlCgot
LSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
