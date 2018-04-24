From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/7] fix several issues documentation
Date: Tue, 24 Apr 2018 08:44:52 +0200
Message-ID: <20180424064459.23645-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=/e5q=hn=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fArhM-0008Qe-3G
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 06:45:08 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, ross.lagerwall@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

ZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUubWFya2Rvd24gaGFzIHNldmVyYWwgaXNzdWVzIHJl
Z2FyZGluZwp0aGUgc2VxdWVuY2Ugb2YgcGFyYW1ldGVycywgbWlzc2luZyBhcmNoaXRlY3R1cmUg
cXVhbGlmaWVycywgbWlzc2luZwpkb2N1bWVudGF0aW9uIG9mIG9uZSBwYXJhbWV0ZXIsIGFuZCBt
YXJrZG93biBzeW50YXguIEZpeCBhbGwgb2YgdGhvc2UuCgpTb21lIG90aGVyIGRvY3VtZW50cyBo
YXZlIHN5bnRheCBpc3N1ZXMsIHRvbywgd2hpY2ggc2hvdyB1cCB3aGVuCnRyeWluZyB0byBkbyAi
bWFrZSBhbGwiIGluIHRoZSBkb2NzIGRpcmVjdG9yeS4gRml4IHRob3NlIGFzIHdlbGwuCgpJbiBj
YXNlIHRoZSBtYWludGFpbmVycyBhcmUgZmluZSB3aXRoIG15IGNoYW5nZXMgSSBiZWxpZXZlIHRo
ZSBzZXJpZXMKc2hvdWxkIGJlIGluY2x1ZGVkIGluIDQuMTEuIFNvIGZvciB0aGUgc2VyaWVzOgoK
UmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJn
ZW4gR3Jvc3MgKDcpOgogIGRvYzogc29ydCBlbnRyaWVzIG9mIGJvb3QgcGFyYW1ldGVycyBjb3Jy
ZWN0bHkKICBkb2M6IGFkZCBhcmNoaXRlY3R1cmUgcXVhbGlmaWVyIHRvIGJvb3QgcGFyYW1ldGVy
IGVudHJpZXMKICBkb2M6IGFkZCBjcmVkaXQyX2NhcF9wZXJpb2RfbXMgYm9vdCBwYXJhbWV0ZXIg
ZGVzY3JpcHRpb24KICBkb2M6IGVzY2FwZSB1bmRlcnNjb3JlcyBpbiB4ZW4tY29tbWFuZC1saW5l
Lm1hcmtkb3duCiAgZG9jOiBjb3JyZWN0IGxpdmVwYXRjaC5tYXJrZG93biBzeW50YXgKICBkb2M6
IGNvcnJlY3QgZmVhdHVyZS1sZXZlbGxpbmcucGFuZG9jIHN5bnRheAogIGRvYzogY29ycmVjdCBp
bnRlbF9wc3JfY2F0X2NkcC5wYW5kb2Mgc3ludGF4CgogZG9jcy9mZWF0dXJlcy9mZWF0dXJlLWxl
dmVsbGluZy5wYW5kb2MgfCAgIDIgKy0KIGRvY3MvZmVhdHVyZXMvaW50ZWxfcHNyX2NhdF9jZHAu
cGFuZG9jIHwgMzY2ICsrKysrKysrKystLS0tLS0tLS0tCiBkb2NzL21pc2MvbGl2ZXBhdGNoLm1h
cmtkb3duICAgICAgICAgICB8IDU4OSArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0K
IGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLm1hcmtkb3duICAgIHwgNDA0ICsrKysrKysrKysr
LS0tLS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgNjU1IGluc2VydGlvbnMoKyksIDcwNiBkZWxl
dGlvbnMoLSkKCi0tIAoyLjEzLjYKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
