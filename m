From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/3] pvh/dom0: switch to ACPI whitelisting
Date: Thu, 8 Feb 2018 12:25:36 +0000
Message-ID: <20180208122539.56095-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mvca=fc=citrix.com=prvs=5707d83af=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ejlH9-0007Vy-Lw
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2018 12:26:03 +0000
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

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNtYWxsIHNlcmllcyBjb250YWluIG9uZSBjbGVhbnVwLCBv
bmUgYnVnZml4IGFuZCBmaW5hbGx5CnN3aXRjaGVzIFBWSCBEb20wIGZyb20gd2hpdGVsaXN0aW5n
IEFDUEkgdGFibGVzIGluc3RlYWQgb2YgYmxhY2tsaXN0aW5nCnRoZW0uCgpUaGUgbnVtYmVyIG9m
IGFsbG93ZWQgdGFibGVzIEFUTSBpcyBmYWlybHkgbGltaXRlZCwgbWFueSBtb3JlIGNvdWxkIGJl
CmFkZGVkIGlmIHRoZSByZXNvdXJjZXMgZGVzY3JpYmVkIGluIHRoZW0gYXJlIHByb3Blcmx5IG1h
cHBlZCB0byBEb20wCnBoeXNtYXAuCgpUaGFua3MsIFJvZ2VyLgoKUm9nZXIgUGF1IE1vbm5lICgz
KToKICBwdmgvZG9tMDogaW5pdCB2YXJpYWJsZXMgYXQgZGVjbGFyYXRpb24gdGltZQogIHB2aC9k
b20wOiBwYXNzIGFkZHJlc3MvbGVuZ3RoIHRvIHB2aF9hY3BpX3RhYmxlX2FsbG93ZWQKICBwdmgv
ZG9tMDogd2hpdGVsaXN0IFBWSCBEb20wIEFDUEkgdGFibGVzCgogeGVuL2FyY2gveDg2L2h2bS9k
b20wX2J1aWxkLmMgfCA3NSArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMzggZGVsZXRpb25zKC0pCgot
LSAKMi4xNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
