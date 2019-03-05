From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v11 2/9] xen: introduce ptrdiff_t
Date: Tue,  5 Mar 2019 14:38:25 -0800
Message-ID: <1551825512-8975-2-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Yk4J=RI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1h1Ihn-0000s0-FH
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

SW50cm9kdWNlIHRoZSBuZXcgdHlwZSAicHRyZGlmZl90IiB3aGljaCBpcyBkZWZpbmVkIGFzIHRo
ZSBzaWduZWQKaW50ZWdlciB0eXBlIG9mIHRoZSByZXN1bHQgb2Ygc3VidHJhY3RpbmcgdHdvIHBv
aW50ZXJzLiBVc2UKX19QVFJESUZGX1RZUEVfXyB0byBkZWZpbmUgaXQuCgpTaWduZWQtb2ZmLWJ5
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+ClJldmlld2VkLWJ5OiBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ0M6IGpiZXVsaWNoQHN1c2Uu
Y29tCkNDOiBhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tCkNDOiBqdWxpZW4uZ3JhbGxAYXJtLmNv
bQpDQzogR2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tCkNDOiBpYW4uamFja3NvbkBldS5jaXRy
aXguY29tCkNDOiBrb25yYWQud2lsa0BvcmFjbGUuY29tCkNDOiB0aW1AeGVuLm9yZwpDQzogd2Vp
LmxpdTJAY2l0cml4LmNvbQotLS0KQ2hhbmdlcyBpbiB2MTE6Ci0gc3BsaXQgcGF0Y2gKLS0tCiB4
ZW4vaW5jbHVkZS94ZW4vdHlwZXMuaCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3R5cGVzLmggYi94ZW4vaW5jbHVkZS94
ZW4vdHlwZXMuaAppbmRleCAxMDU5ZmFiLi41MDhhNDYyIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVk
ZS94ZW4vdHlwZXMuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vdHlwZXMuaApAQCAtNTMsNiArNTMs
NyBAQCB0eXBlZGVmIF9fdTY0IF9fbGU2NDsKIHR5cGVkZWYgX191NjQgX19iZTY0OwogCiB0eXBl
ZGVmIF9fVUlOVFBUUl9UWVBFX18gdWludHB0cl90OwordHlwZWRlZiBfX1BUUkRJRkZfVFlQRV9f
IHB0cmRpZmZfdDsKIAogdHlwZWRlZiBib29sIGJvb2xfdDsKICNkZWZpbmUgdGVzdF9hbmRfc2V0
X2Jvb2woYikgICB4Y2hnKCYoYiksIHRydWUpCi0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
