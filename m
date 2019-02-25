From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 1/6] xen: introduce ptrdiff_t
Date: Mon, 25 Feb 2019 12:50:17 -0800
Message-ID: <1551127822-25886-1-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1902251243530.4000@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rX0y=RA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gyNCk-0005Ko-94
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 20:50:26 +0000
In-Reply-To: <alpine.DEB.2.10.1902251243530.4000@sstabellini-ThinkPad-X260>
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
aW50ZXJzLiBVc2UKX19QVFJESUZGX1RZUEVfXyB0byBkZWZpbmUgaXQuCgpBbHNvLCB1c2UgX19V
SU5UUFRSX1RZUEVfXyBmb3IgdWludHB0cl90IGZvciBjb25zaXN0ZW5jeS4KClNpZ25lZC1vZmYt
Ynk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KQ0M6IGpiZXVsaWNo
QHN1c2UuY29tCkNDOiBhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tCkNDOiBqdWxpZW4uZ3JhbGxA
YXJtLmNvbQpDQzogR2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tCkNDOiBpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tCkNDOiBrb25yYWQud2lsa0BvcmFjbGUuY29tCkNDOiB0aW1AeGVuLm9yZwpD
Qzogd2VpLmxpdTJAY2l0cml4LmNvbQotLS0KQ2hhbmdlcyBpbiB2MTA6Ci0gdXNlIF9fVUlOVFBU
Ul9UWVBFX18gYW5kIF9fUFRSRElGRl9UWVBFX18KCkNoYW5nZXMgaW4gdjk6Ci0gbmV3IHBhdGNo
Ci0tLQogeGVuL2luY2x1ZGUveGVuL3R5cGVzLmggfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hl
bi90eXBlcy5oIGIveGVuL2luY2x1ZGUveGVuL3R5cGVzLmgKaW5kZXggMDNmMGZlNi4uNTA4YTQ2
MiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3R5cGVzLmgKKysrIGIveGVuL2luY2x1ZGUv
eGVuL3R5cGVzLmgKQEAgLTUyLDcgKzUyLDggQEAgdHlwZWRlZiBfX3UzMiBfX2JlMzI7CiB0eXBl
ZGVmIF9fdTY0IF9fbGU2NDsKIHR5cGVkZWYgX191NjQgX19iZTY0OwogCi10eXBlZGVmIHVuc2ln
bmVkIGludCBfX2F0dHJpYnV0ZV9fKChfX21vZGVfXyhfX3BvaW50ZXJfXykpKSB1aW50cHRyX3Q7
Cit0eXBlZGVmIF9fVUlOVFBUUl9UWVBFX18gdWludHB0cl90OwordHlwZWRlZiBfX1BUUkRJRkZf
VFlQRV9fIHB0cmRpZmZfdDsKIAogdHlwZWRlZiBib29sIGJvb2xfdDsKICNkZWZpbmUgdGVzdF9h
bmRfc2V0X2Jvb2woYikgICB4Y2hnKCYoYiksIHRydWUpCi0tIAoxLjkuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
