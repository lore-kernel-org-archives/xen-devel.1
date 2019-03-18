From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/6] xen: simplify suspend/resume handling
Date: Mon, 18 Mar 2019 14:11:49 +0100
Message-ID: <20190318131155.29450-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nHQP=RV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h5s3e-0006Zd-Ap
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 13:12:02 +0000
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
IG9uIGNwdXMgZHVyaW5nIHN1c3BlbmQKCiB4ZW4vYXJjaC94ODYvcGVyY3B1LmMgICAgICB8ICAg
MyArLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyAgICAgfCAgIDMgLQogeGVuL2NvbW1vbi9jcHUu
YyAgICAgICAgICAgfCAgNTUgKysrKysrKy0tLS0tLS0KIHhlbi9jb21tb24vY3B1cG9vbC5jICAg
ICAgIHwgMTMwICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9jb21tb24v
c2NoZWR1bGUuYyAgICAgIHwgMTczICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogeGVuL2luY2x1ZGUveGVuL2NwdS5oICAgICAgfCAgMjAgKysrLS0tCiB4ZW4v
aW5jbHVkZS94ZW4vc2NoZWQtaWYuaCB8ICAgMSAtCiA3IGZpbGVzIGNoYW5nZWQsIDE0NyBpbnNl
cnRpb25zKCspLCAyMzggZGVsZXRpb25zKC0pCgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
