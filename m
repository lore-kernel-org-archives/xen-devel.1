From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] automation/build: update stretck-i386 dockerfile
Date: Thu, 12 Jul 2018 17:31:27 +0100
Message-ID: <20180712163127.10241-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ay1y=j4=citrix.com=prvs=72409e2aa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fdeVA-0001eG-2h
 for xen-devel@lists.xenproject.org; Thu, 12 Jul 2018 16:31:32 +0000
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

V2UgZG9uJ3QgbmVlZCB0byBzcGVjaWZ5IC9iaW4vYmFzaCBpbiB0aGUgZW50cnkgcG9pbnQgcnVu
ZSwgb3RoZXJ3aXNlCm5vbi1pbnRlcmFjdGl2ZSBpbnZvY2F0aW9uIG9mIHRoZSBjb250YWluZXIg
d291bGQgZmFpbCB3aXRoIHNvbWV0aGluZwpsaWtlOgoKKyBDPWRlYmlhbjpzdHJldGNoLWkzODYK
KyBleHBvcnQgQ09OVEFJTkVSPXJlZ2lzdHJ5LmdpdGxhYi5jb20veGVuLXByb2plY3QveGVuL2Rl
YmlhbjpzdHJldGNoLWkzODYKKyBDT05UQUlORVI9cmVnaXN0cnkuZ2l0bGFiLmNvbS94ZW4tcHJv
amVjdC94ZW4vZGViaWFuOnN0cmV0Y2gtaTM4NgorIGNkIC9sb2NhbC93b3JrL0NPTU1JVFRFUi94
ZW4tMzIuZ2l0CisgZ2l0IGZldGNoIG9yaWdpbgorIGNvbiBnaXQgcmVzZXQgLS1oYXJkIG9yaWdp
bi9zdGFnaW5nCioqKiBFbnN1cmluZyByZWdpc3RyeS5naXRsYWIuY29tL3hlbi1wcm9qZWN0L3hl
bi9kZWJpYW46c3RyZXRjaC1pMzg2IGlzIHVwIHRvIGRhdGUKKioqIExhdW5jaGluZyBjb250YWlu
ZXIgLi4uCi91c3IvYmluL2dpdDogL3Vzci9iaW4vZ2l0OiBjYW5ub3QgZXhlY3V0ZSBiaW5hcnkg
ZmlsZQoKV2hpbGUgYXQgaXQsIHVzZSBzaG9ydGhhbmQgImxpbnV4MzIiLgoKU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiBhdXRvbWF0aW9uL2J1aWxkL2Rl
Ymlhbi9zdHJldGNoLWkzODYuZG9ja2VyZmlsZSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vYnVpbGQv
ZGViaWFuL3N0cmV0Y2gtaTM4Ni5kb2NrZXJmaWxlIGIvYXV0b21hdGlvbi9idWlsZC9kZWJpYW4v
c3RyZXRjaC1pMzg2LmRvY2tlcmZpbGUKaW5kZXggZWMzN2E1ZmJmOC4uNjUyNDdhNDc0ZSAxMDA2
NDQKLS0tIGEvYXV0b21hdGlvbi9idWlsZC9kZWJpYW4vc3RyZXRjaC1pMzg2LmRvY2tlcmZpbGUK
KysrIGIvYXV0b21hdGlvbi9idWlsZC9kZWJpYW4vc3RyZXRjaC1pMzg2LmRvY2tlcmZpbGUKQEAg
LTgsNyArOCw3IEBAIEVOViBVU0VSIHJvb3QKIFJVTiBta2RpciAvYnVpbGQKIFdPUktESVIgL2J1
aWxkCiAKLUVOVFJZUE9JTlQgWyIvdXNyL2Jpbi9zZXRhcmNoIiwgImk2ODYiLCAiL2Jpbi9iYXNo
Il0KK0VOVFJZUE9JTlQgWyJsaW51eDMyIl0KIAogIyBidWlsZCBkZXBlbmRzCiBSVU4gYXB0LWdl
dCB1cGRhdGUgJiYgXAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
