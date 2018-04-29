From: Lars Kurth <lars.kurth@citrix.com>
Subject: [PATCH for-4.11 v2 0/2] Add new add_maintainers.pl
 script to optimise the workflow when using git format-patch with
 get_maintainer.pl
Date: Sun, 29 Apr 2018 13:44:35 +0100
Message-ID: <cover.1525005313.git.lars.kurth@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gkhl=hs=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1fClhP-0008Qu-D7
 for xen-devel@lists.xenproject.org; Sun, 29 Apr 2018 12:45:03 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VG8gYXZvaWQgaXNzdWVzIHdpdGggZHVwbGljYXRlIGUtbWFpbCBzZW5kaW5nLCBJIGFsc28gY2xl
YW5lZCB1cCBNQUlOVEFJTkVSUwoKSSBtYWRlIHNpZ25pZmljYW50IGNoYW5nZXMgdG8gdGhlIFVJ
IHRvIHNpbXBsaWZ5IGl0cyB1c2FnZS4KSSBhbHNvIGFkZGVkIGxvZ2ljLCBzdWNoIHRoYXQgdGhl
IHRvb2wgb25seSBpbnNlcnQncyBUbzogYW5kIENjOiBzdGF0ZW1lbnRzCndoaWNoIHdlcmUgbm90
IHRoZXJlIGJlZm9yZSwgYWxsb3dpbmcgZm9yIHJ1bm5pbmcgdGhlIHRvb2wgbXVsdGlwbGUgdGlt
ZXMKb24gdGhlIHNhbWUgPHBhdGNoZGlyPgoKTGFycyBLdXJ0aCAoMik6CiAgUmVwbGFjZSBvY2N1
cmFuY2VzIG9mIHhlbi5vcmcgd2l0aCB4ZW5wcm9qZWN0Lm9yZwogIEFkZCBuZXcgYWRkX21haW50
YWluZXJzLnBsIHNjcmlwdCB0byBvcHRpbWlzZSB0aGUgd29ya2Zsb3cgd2hlbiB1c2luZwogICAg
Z2l0IGZvcm1hdC1wYXRjaCB3aXRoIGdldF9tYWludGFpbmVyLnBsCgogTUFJTlRBSU5FUlMgICAg
ICAgICAgICAgICAgfCAgMjQgKy0tCiBzY3JpcHRzL2FkZF9tYWludGFpbmVycy5wbCB8IDM4MCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hh
bmdlZCwgMzkyIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAw
NzU1IHNjcmlwdHMvYWRkX21haW50YWluZXJzLnBsCgotLSAKMi4xMy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
