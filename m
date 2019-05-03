From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/3] PDX fixes
Date: Fri, 3 May 2019 13:49:48 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lar+=TD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hMf7z-0005vD-VB
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 20:49:55 +0000
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
CmFyZSBhdmFpbGFibGUgaW4gdGhlIGdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRwOi8veGVuYml0
cy54ZW5wcm9qZWN0Lm9yZy9naXQtaHR0cC9wZW9wbGUvc3N0YWJlbGxpbmkveGVuLXVuc3RhYmxl
LmdpdCBwZHgtZml4LTEKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBlZmE3YTU3NDQ5
YTY1NmEzZmZhYzIxZTk4MDJiNmU1YTE0YTA4MThhOgoKICB4ZW4vYXJtOiBmaXggbWFzayBjYWxj
dWxhdGlvbiBpbiBpbml0X3BkeCAoMjAxOS0wNS0wMyAxMzoxNjoyOSAtMDcwMCkKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
U3RlZmFubyBTdGFiZWxsaW5pICgzKToKICAgICAgeGVuL2FybTogZml4IG5yX3BkeHMgY2FsY3Vs
YXRpb24KICAgICAgeGVuOiBhY3R1YWxseSBza2lwIHRoZSBmaXJzdCBNQVhfT1JERVIgYml0cyBp
biBwZm5fcGR4X2hvbGVfc2V0dXAKICAgICAgeGVuL2FybTogZml4IG1hc2sgY2FsY3VsYXRpb24g
aW4gaW5pdF9wZHgKCiB4ZW4vYXJjaC9hcm0vbW0uYyAgICB8IDQgKystLQogeGVuL2FyY2gvYXJt
L3NldHVwLmMgfCA5ICsrKysrKystLQogeGVuL2NvbW1vbi9wZHguYyAgICAgfCA2ICsrKystLQog
MyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
