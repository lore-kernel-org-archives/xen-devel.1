From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 0/6] xen: simplify suspend/resume handling
Date: Tue,  2 Apr 2019 18:19:04 +0200
Message-ID: <20190402161910.14860-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fK7G=SE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hBM86-0002Yu-Ot
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 16:19:18 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RXNwZWNpYWxseSBpbiB0aGUgc2NoZWR1bGVyIGFyZWEgKHNjaGVkdWxlLmMsIGNwdXBvb2wuYykg
dGhlcmUgaXMgYQpyYXRoZXIgY29tcGxleCBoYW5kbGluZyBpbnZvbHZlZCB3aGVuIGRvaW5nIHN1
c3BlbmQgYW5kIHJlc3VtZS4KClRoaXMgY2FuIGJlIHNpbXBsaWZpZWQgYSBsb3QgYnkgbm90IHBl
cmZvcm1pbmcgYSBjb21wbGV0ZSBjcHUgZG93biBhbmQKdXAgY3ljbGUgZm9yIHRoZSBub24tYm9v
dCBjcHVzLCBidXQga2VlcGluZyB0aGUgcHVyZSBzb2Z0d2FyZSByZWxhdGVkCnN0YXRlIGFuZCBm
cmVlaW5nIGl0IG9ubHkgaW4gY2FzZSBhIGNwdSBkaWRuJ3QgY29tZSB1cCBhZ2FpbiBkdXJpbmcK
cmVzdW1lLgoKSW4gc3VtbWFyeSBub3Qgb25seSB0aGUgY29tcGxleGl0eSBjYW4gYmUgcmVkdWNl
ZCwgYnV0IHRoZSBmYWlsdXJlCnRvbGVyYW5jZSB3aWxsIGJlIGV2ZW4gYmV0dGVyIHdpdGggdGhp
cyBzZXJpZXM6IFdpdGggYSBkZWRpY2F0ZWQgaG9vawpmb3IgZmFpbGluZyBjcHVzIHdoZW4gcmVz
dW1pbmcgaXQgaXMgbm93IHBvc3NpYmxlIHRvIHN1cnZpdmUgZS5nLiBhCmNwdXBvb2wgYmVpbmcg
bGVmdCB3aXRob3V0IGFueSBjcHUgYWZ0ZXIgcmVzdW1lIGJ5IG1vdmluZyBpdHMgZG9tYWlucwp0
byBjcHVwb29sMC4KCkp1ZXJnZW4gR3Jvc3MgKDYpOgogIHhlbi9zY2hlZDogY2FsbCBjcHVfZGlz
YWJsZV9zY2hlZHVsZXIoKSB2aWEgY3B1IG5vdGlmaWVyCiAgeGVuOiBhZGQgaGVscGVyIGZvciBj
YWxsaW5nIG5vdGlmaWVyX2NhbGxfY2hhaW4oKSB0byBjb21tb24vY3B1LmMKICB4ZW46IGFkZCBu
ZXcgY3B1IG5vdGlmaWVyIGFjdGlvbiBDUFVfUkVTVU1FX0ZBSUxFRAogIHhlbjogZG9uJ3QgZnJl
ZSBwZXJjcHUgYXJlYXMgZHVyaW5nIHN1c3BlbmQKICB4ZW4vY3B1cG9vbDogc2ltcGxpZnkgc3Vz
cGVuZC9yZXN1bWUgaGFuZGxpbmcKICB4ZW4vc2NoZWQ6IGRvbid0IGRpc2FibGUgc2NoZWR1bGVy
IG9uIGNwdXMgZHVyaW5nIHN1c3BlbmQKCiB4ZW4vYXJjaC9hcm0vc21wYm9vdC5jICAgICB8ICAg
MiAtCiB4ZW4vYXJjaC94ODYvcGVyY3B1LmMgICAgICB8ICAgMyArLQogeGVuL2FyY2gveDg2L3Nt
cGJvb3QuYyAgICAgfCAgIDMgLQogeGVuL2NvbW1vbi9jcHUuYyAgICAgICAgICAgfCAgNjEgKysr
KysrKy0tLS0tLS0KIHhlbi9jb21tb24vY3B1cG9vbC5jICAgICAgIHwgMTMxICsrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2NvbW1vbi9zY2hlZHVsZS5jICAgICAgfCAxOTcgKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS94
ZW4vY3B1LmggICAgICB8ICAyOSArKysrLS0tCiB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaCB8
ICAgMSAtCiA4IGZpbGVzIGNoYW5nZWQsIDE4NCBpbnNlcnRpb25zKCspLCAyNDMgZGVsZXRpb25z
KC0pCgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
