From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v11 1/9] xen: use __UINTPTR_TYPE__ for uintptr_t
Date: Tue,  5 Mar 2019 14:38:24 -0800
Message-ID: <1551825512-8975-1-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Yk4J=RI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1h1Ihn-0000rx-8y
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 22:38:35 +0000
In-Reply-To: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefanos@xilinx.com>, sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, George.Dunlap@citrix.com, tim@xen.org, julien.grall@arm.com, jbeulich@suse.com, ian.jackson@citrix.com
List-Id: xen-devel@lists.xenproject.org

VXNlIF9fVUlOVFBUUl9UWVBFX18gdG8gZGVmaW5lIHVpbnRwdHJfdC4gQSBsYXRlciBwYXRjaCB3
aWxsIG1ha2UgdXNlIG9mCl9fUFRSRElGRl9UWVBFX18gdG8gZGVmaW5lIHB0cmRpZmZfdC4KClNp
Z25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KUmV2
aWV3ZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDQzogamJl
dWxpY2hAc3VzZS5jb20KQ0M6IGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20KQ0M6IGp1bGllbi5n
cmFsbEBhcm0uY29tCkNDOiBHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20KQ0M6IGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20KQ0M6IGtvbnJhZC53aWxrQG9yYWNsZS5jb20KQ0M6IHRpbUB4ZW4u
b3JnCkNDOiB3ZWkubGl1MkBjaXRyaXguY29tCi0tLQpDaGFuZ2VzIGluIHYxMToKLSBzcGxpdCBw
YXRjaAotLS0KIHhlbi9pbmNsdWRlL3hlbi90eXBlcy5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
eGVuL3R5cGVzLmggYi94ZW4vaW5jbHVkZS94ZW4vdHlwZXMuaAppbmRleCAwM2YwZmU2Li4xMDU5
ZmFiIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vdHlwZXMuaAorKysgYi94ZW4vaW5jbHVk
ZS94ZW4vdHlwZXMuaApAQCAtNTIsNyArNTIsNyBAQCB0eXBlZGVmIF9fdTMyIF9fYmUzMjsKIHR5
cGVkZWYgX191NjQgX19sZTY0OwogdHlwZWRlZiBfX3U2NCBfX2JlNjQ7CiAKLXR5cGVkZWYgdW5z
aWduZWQgaW50IF9fYXR0cmlidXRlX18oKF9fbW9kZV9fKF9fcG9pbnRlcl9fKSkpIHVpbnRwdHJf
dDsKK3R5cGVkZWYgX19VSU5UUFRSX1RZUEVfXyB1aW50cHRyX3Q7CiAKIHR5cGVkZWYgYm9vbCBi
b29sX3Q7CiAjZGVmaW5lIHRlc3RfYW5kX3NldF9ib29sKGIpICAgeGNoZygmKGIpLCB0cnVlKQot
LSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
