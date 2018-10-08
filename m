From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 8/8] xen/arm: map reserved-memory regions as
 normal memory in dom0
Date: Mon,  8 Oct 2018 16:37:21 -0700
Message-ID: <1539041841-17655-8-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1810081606390.28877@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1810081606390.28877@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Stefano Stabellini <stefanos@xilinx.com>, sstabellini@kernel.org, wei.liu2@citrix.com, blackskygg@gmail.com, ian.jackson@eu.citrix.com, julien.grall@arm.com
List-Id: xen-devel@lists.xenproject.org

cmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgc2hvdWxkIGJlIG1hcHBlZCBhcyBub3JtYWwgbWVtb3J5
LiBBdCB0aGUKbW9tZW50LCB0aGV5IGdldCByZW1hcHBlZCBhcyBkZXZpY2UgbWVtb3J5IGJlY2F1
c2UgWGVuIGRvZXNuJ3Qga25vdwpiZXR0ZXIuIEFkZCBhbiBleHBsaWNpdCBjaGVjayBmb3IgaXQu
CgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+
Ci0tLQogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCmluZGV4IGY1NTIxNTQuLmM3ZGY0
Y2YgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYworKysgYi94ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMKQEAgLTEzMDcsNiArMTMwNywxMyBAQCBzdGF0aWMgaW50IF9f
aW5pdCBoYW5kbGVfbm9kZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtp
bmZvLAogICAgICAgICAgICAgICAgIldBUk5JTkc6IFBhdGggJXMgaXMgcmVzZXJ2ZWQsIHNraXAg
dGhlIG5vZGUgYXMgd2UgbWF5IHJlLXVzZSB0aGUgcGF0aC5cbiIsCiAgICAgICAgICAgICAgICBw
YXRoKTsKIAorICAgIC8qCisgICAgICogcmVzZXJ2ZWQtbWVtb3J5IHJhbmdlcyBzaG91bGQgYmUg
bWFwcGVkIGFzIG5vcm1hbCBtZW1vcnkgaW4gdGhlCisgICAgICogcDJtLgorICAgICAqLworICAg
IGlmICggIXN0cmNtcChkdF9ub2RlX25hbWUobm9kZSksICJyZXNlcnZlZC1tZW1vcnkiKSApCisg
ICAgICAgIHAybXQgPSBwMm1fcmFtX3J3OworCiAgICAgcmVzID0gaGFuZGxlX2RldmljZShkLCBu
b2RlLCBwMm10KTsKICAgICBpZiAoIHJlcykKICAgICAgICAgcmV0dXJuIHJlczsKLS0gCjEuOS4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
