From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v3 0/3] Performance improvements for
 xen_disk^Wxen-block
Date: Wed, 12 Dec 2018 11:16:23 +0000
Message-ID: <1544613386-22045-1-git-send-email-paul.durrant__6256.4730913893$1544613309$gmane$org@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lg+2=OV=citrix.com=prvs=877c75a5a=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gX2VD-0001J0-Ss
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 11:16:31 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org, xen-devel@lists.xenproject.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Max Reitz <mreitz@redhat.com>, Paul Durrant <paul.durrant@citrix.com>, Stefan Hajnoczi <stefanha@redhat.com>, Anthony Perard <anthony.perard@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBzZXJpZXMgaXMgYSByZS1iYXNlIG9mIFRpbSdzIHYyIHNlcmllcyBbMV0gb24gdG9wIG9m
IG15IHNlcmllcyBbMl0uCgpbMV0gaHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9x
ZW11LWRldmVsLzIwMTgtMTEvbXNnMDAyNDMuaHRtbApbMl0gaHR0cHM6Ly9saXN0cy5nbnUub3Jn
L2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMTgtMTIvbXNnMDIyNzEuaHRtbAoKVGltIFNtaXRo
ICgzKToKICB4ZW4tYmxvY2s6IGltcHJvdmUgYmF0Y2hpbmcgYmVoYXZpb3VyCiAgeGVuLWJsb2Nr
OiBpbXByb3ZlIHJlc3BvbnNlIGxhdGVuY3kKICB4ZW4tYmxvY2s6IGF2b2lkIHJlcGVhdGVkIG1l
bW9yeSBhbGxvY2F0aW9uCgogaHcvYmxvY2svZGF0YXBsYW5lL3hlbi1ibG9jay5jIHwgMTA1ICsr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NjIgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pCi0tLQpDYzogQW50aG9ueSBQZXJhcmQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkNjOiBLZXZpbiBXb2xmIDxrd29sZkByZWRoYXQu
Y29tPgpDYzogTWF4IFJlaXR6IDxtcmVpdHpAcmVkaGF0LmNvbT4KQ2M6IFN0ZWZhbiBIYWpub2N6
aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4KLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
