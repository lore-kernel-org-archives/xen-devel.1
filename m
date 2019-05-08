From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] PDX fixes
Date: Wed, 8 May 2019 15:47:11 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.1905081538170.9403@sstabellini-ThinkPad-T480s>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FJge=TI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hOVLG-0005bT-8J
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 22:47:14 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, JBeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKVGhpcyBzZXJpZXMgaXMgYSBzbWFsbCBjb2xsZWN0aW9uIG9mIFBEWCBmaXhlcy4g
VGhleSBhcmUgdGVjaG5pY2FsbHkKaW5kZXBlbmRlbnQgYnV0IGRpc2NvdmVyZWQgdG9nZXRoZXIg
dHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIG1lbW9yeQp3YXN0ZSBjYXVzZWQgYnkgdGhlIGZyYW1l
dGFibGUgYWxsb2NhdGlvbiBvbiBYaWxpbnggWnlucU1QLgoKQ2hlZXJzLAoKU3RlZmFubwoKClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZGM0OTc2MzVkOTNmNjY3MmY4MjcyN2Fk
OTdhNTUyMDUxNzdiZTJhYToKCiAgYnVpbGQgc3lzdGVtOiBtYWtlIGluc3RhbGwtc3R1YmRvbSBk
ZXBlbmQgb24gaW5zdGFsbC10b29scyBhZ2FpbiAoMjAxOS0wNC0yMyAxNzowMDowOCArMDEwMCkK
CmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRwOi8veGVuYml0
cy54ZW5wcm9qZWN0Lm9yZy9naXQtaHR0cC9wZW9wbGUvc3N0YWJlbGxpbmkveGVuLXVuc3RhYmxl
LmdpdCAKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA2NzNmYjE0ZGM5OTcxMTk4NTM5
ZDAyYzUwM2FiYzg1ZDMwZTk1NDI2OgoKICB4ZW4vYXJtOiBmaXggbWFzayBjYWxjdWxhdGlvbiBp
biBwZHhfaW5pdF9tYXNrICgyMDE5LTA1LTA4IDE1OjM3OjAzIC0wNzAwKQoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpTdGVm
YW5vIFN0YWJlbGxpbmkgKDMpOgogICAgICB4ZW4vYXJtOiBmaXggbnJfcGR4cyBjYWxjdWxhdGlv
bgogICAgICB4ZW46IGFjdHVhbGx5IHNraXAgdGhlIGZpcnN0IE1BWF9PUkRFUiBiaXRzIGluIHBm
bl9wZHhfaG9sZV9zZXR1cAogICAgICB4ZW4vYXJtOiBmaXggbWFzayBjYWxjdWxhdGlvbiBpbiBw
ZHhfaW5pdF9tYXNrCgogeGVuL2FyY2gvYXJtL21tLmMgICAgfCAgNCArKy0tCiB4ZW4vYXJjaC9h
cm0vc2V0dXAuYyB8ICA5ICsrKysrKysrLQogeGVuL2NvbW1vbi9wZHguYyAgICAgfCAxNCArKysr
KysrKysrKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
