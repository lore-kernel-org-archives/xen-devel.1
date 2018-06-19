From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: [PATCH v2 1/8] xen: calculate XEN_BUILD_TIME using
 XEN_BUILD_DATE value
Date: Tue, 19 Jun 2018 16:35:39 +0200
Message-ID: <1529418946-30114-2-git-send-email-daniel.kiper@oracle.com>
References: <1529418946-30114-1-git-send-email-daniel.kiper@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2pff=jf=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1fVHk9-0006kH-A9
 for xen-devel@lists.xenproject.org; Tue, 19 Jun 2018 14:36:25 +0000
In-Reply-To: <1529418946-30114-1-git-send-email-daniel.kiper@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, jbeulich@suse.com, tamas.k.lengyel@gmail.com
List-Id: xen-devel@lists.xenproject.org

T3RoZXJ3aXNlIHRpbWVzIGluIFhFTl9CVUlMRF9EQVRFIGFuZCBYRU5fQlVJTERfVElNRSBtYXkg
ZGlmZmVyLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIEtpcGVyIDxkYW5pZWwua2lwZXJAb3JhY2xl
LmNvbT4KLS0tCiB4ZW4vTWFrZWZpbGUgfCAgICAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vTWFrZWZpbGUgYi94ZW4v
TWFrZWZpbGUKaW5kZXggNjA4NjdlMy4uYWE4MjY0MSAxMDA2NDQKLS0tIGEveGVuL01ha2VmaWxl
CisrKyBiL3hlbi9NYWtlZmlsZQpAQCAtOSw3ICs5LDcgQEAgZXhwb3J0IFhFTl9GVUxMVkVSU0lP
TiAgID0gJChYRU5fVkVSU0lPTikuJChYRU5fU1VCVkVSU0lPTikkKFhFTl9FWFRSQVZFUlNJT04p
CiBleHBvcnQgWEVOX1dIT0FNSQk/PSAkKFVTRVIpCiBleHBvcnQgWEVOX0RPTUFJTgk/PSAkKHNo
ZWxsIChbIC14IC9iaW4vZG5zZG9tYWlubmFtZSBdICYmIC9iaW4vZG5zZG9tYWlubmFtZSkgfHwg
KFsgLXggL2Jpbi9kb21haW5uYW1lIF0gJiYgL2Jpbi9kb21haW5uYW1lIHx8IGVjaG8gW3Vua25v
d25dKSkKIGV4cG9ydCBYRU5fQlVJTERfREFURQk/PSAkKHNoZWxsIExDX0FMTD1DIGRhdGUpCi1l
eHBvcnQgWEVOX0JVSUxEX1RJTUUJPz0gJChzaGVsbCBMQ19BTEw9QyBkYXRlICslVCkKK2V4cG9y
dCBYRU5fQlVJTERfVElNRQk/PSAkKHNoZWxsIExDX0FMTD1DIGRhdGUgLWQgJyQoWEVOX0JVSUxE
X0RBVEUpJyArJVQpCiBleHBvcnQgWEVOX0JVSUxEX0hPU1QJPz0gJChzaGVsbCBob3N0bmFtZSkK
IGV4cG9ydCBYRU5fQ09ORklHX0VYUEVSVCA/PSBuCiAKLS0gCjEuNy4xMC40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
