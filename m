From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH 4/5] formats: allign trace record format to the
 current code
Date: Mon, 10 Sep 2018 19:41:18 +0300
Message-ID: <1536597679-8303-5-git-send-email-andrii.anisov@gmail.com>
References: <1536597679-8303-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=deyf=ly=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1fzPFh-0003M4-KL
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 16:41:29 +0000
Received: by mail-lf1-x142.google.com with SMTP id c29-v6so18029606lfj.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Sep 2018 09:41:28 -0700 (PDT)
In-Reply-To: <1536597679-8303-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Wei Liu <wei.liu2@citrix.com>, Andrii Anisov <andrii_anisov@epam.com>, George Dunlap <george.dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkFsbGlnbiBydGRz
OnJlcGxfYnVkZ2V0IHRyYWNlIHJlY29yZCBmb3JtYXQgdG8gdGhlIGN1cnJlbnQgY29kZS4KClNp
Z25lZC1vZmYtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Ci0tLQog
dG9vbHMveGVudHJhY2UvZm9ybWF0cyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnRyYWNlL2Zvcm1hdHMg
Yi90b29scy94ZW50cmFjZS9mb3JtYXRzCmluZGV4IGQ2ZTdlM2YuLjdkYjZkNDkgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL3hlbnRyYWNlL2Zvcm1hdHMKKysrIGIvdG9vbHMveGVudHJhY2UvZm9ybWF0cwpA
QCAtNzUsNyArNzUsNyBAQAogMHgwMDAyMjgwMSAgQ1BVJShjcHUpZCAgJSh0c2MpZCAoKyUocmVs
dHNjKThkKSAgcnRkczp0aWNrbGUgICAgICAgIFsgY3B1ID0gJSgxKWQgXQogMHgwMDAyMjgwMiAg
Q1BVJShjcHUpZCAgJSh0c2MpZCAoKyUocmVsdHNjKThkKSAgcnRkczpydW5xX3BpY2sgICAgIFsg
ZG9tOnZjcHUgPSAweCUoMSkwOHgsIGN1cl9kZWFkbGluZSA9IDB4JSgzKTA4eCUoMikwOHgsIGN1
cl9idWRnZXQgPSAweCUoNSkwOHglKDQpMDh4IF0KIDB4MDAwMjI4MDMgIENQVSUoY3B1KWQgICUo
dHNjKWQgKCslKHJlbHRzYyk4ZCkgIHJ0ZHM6YnVybl9idWRnZXQgICBbIGRvbTp2Y3B1ID0gMHgl
KDEpMDh4LCBjdXJfYnVkZ2V0ID0gMHglKDMpMDh4JSgyKTA4eCwgZGVsdGEgPSAlKDQpZCBdCi0w
eDAwMDIyODA0ICBDUFUlKGNwdSlkICAlKHRzYylkICgrJShyZWx0c2MpOGQpICBydGRzOnJlcGxf
YnVkZ2V0ICAgWyBkb206dmNwdSA9IDB4JSgxKTA4eCwgY3VyX2RlYWRsaW5lID0gMHglKDMpMDh4
JSgyKTA4eCwgY3VyX2J1ZGdldCA9IDB4JSg1KTA4eCUoNCkwOHggXQorMHgwMDAyMjgwNCAgQ1BV
JShjcHUpZCAgJSh0c2MpZCAoKyUocmVsdHNjKThkKSAgcnRkczpyZXBsX2J1ZGdldCAgIFsgZG9t
OnZjcHUgPSAweCUoMSkwOHgsIHByaW9yaXR5X2xldmVsID0gJSgyKWQsIGN1cl9kZWFkbGluZSA9
IDB4JSg0KTA4eCUoMykwOHgsIGN1cl9idWRnZXQgPSAweCUoNikwOHglKDUpMDh4IF0KIDB4MDAw
MjI4MDUgIENQVSUoY3B1KWQgICUodHNjKWQgKCslKHJlbHRzYyk4ZCkgIHJ0ZHM6c2NoZWRfdGFz
a2xldAogMHgwMDAyMjgwNiAgQ1BVJShjcHUpZCAgJSh0c2MpZCAoKyUocmVsdHNjKThkKSAgcnRk
czpzY2hlZHVsZSAgICAgIFsgY3B1WzE2XTp0YXNrbGV0WzhdOmlkbGVbNF06dGlja2xlZFs0XSA9
ICUoMSkwOHggXQogCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
