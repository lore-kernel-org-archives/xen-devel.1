From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 05/12] xenmon: Install as xenmon, not xenmon.py
Date: Fri, 12 Oct 2018 16:12:08 +0100
Message-ID: <20181012151215.32455-6-ian.jackson@eu.citrix.com>
References: <20181012151215.32455-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pszq=my=citrix.com=prvs=81651eb4b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gAz70-00018M-LT
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 15:12:22 +0000
In-Reply-To: <20181012151215.32455-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+CgpBZGRpbmcgdGhlIGlt
cGxlbWVudGF0aW9uIGxhbmd1YWdlIGFzIGEgc3VmZml4IHRvIGEgcHJvZ3JhbSBuYW1lIGlzCnBv
b3IgcHJhY3RpY2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0
cml4LmNvbT4KQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogdG9v
bHMveGVubW9uL01ha2VmaWxlIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbm1vbi9NYWtlZmlsZSBi
L3Rvb2xzL3hlbm1vbi9NYWtlZmlsZQppbmRleCBlNDVjNWI4YzE0Li5lMTcxMjMwNGQwIDEwMDY0
NAotLS0gYS90b29scy94ZW5tb24vTWFrZWZpbGUKKysrIGIvdG9vbHMveGVubW9uL01ha2VmaWxl
CkBAIC0zMiwxMyArMzIsMTMgQEAgaW5zdGFsbDogYnVpbGQKIAkkKElOU1RBTExfRElSKSAkKERF
U1RESVIpJChzYmluZGlyKQogCSQoSU5TVEFMTF9QUk9HKSB4ZW5iYWtlZCAkKERFU1RESVIpJChz
YmluZGlyKS94ZW5iYWtlZAogCSQoSU5TVEFMTF9QUk9HKSB4ZW50cmFjZV9zZXRtYXNrICAkKERF
U1RESVIpJChzYmluZGlyKS94ZW50cmFjZV9zZXRtYXNrCi0JJChJTlNUQUxMX1BST0cpIHhlbm1v
bi5weSAgJChERVNURElSKSQoc2JpbmRpcikveGVubW9uLnB5CisJJChJTlNUQUxMX1BST0cpIHhl
bm1vbi5weSAgJChERVNURElSKSQoc2JpbmRpcikveGVubW9uCiAKIC5QSE9OWTogdW5pbnN0YWxs
CiB1bmluc3RhbGw6CiAJcm0gLWYgJChERVNURElSKSQoc2JpbmRpcikveGVuYmFrZWQKIAlybSAt
ZiAkKERFU1RESVIpJChzYmluZGlyKS94ZW50cmFjZV9zZXRtYXNrCi0Jcm0gLWYgJChERVNURElS
KSQoc2JpbmRpcikveGVubW9uLnB5CisJcm0gLWYgJChERVNURElSKSQoc2JpbmRpcikveGVubW9u
CiAKIC5QSE9OWTogY2xlYW4KIGNsZWFuOgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
