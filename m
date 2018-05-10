From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v2 2/3] checkpatch: generalize xen handle
 matching in the list of types
Date: Thu, 10 May 2018 10:15:17 +0100
Message-ID: <20180510091518.28199-3-paul.durrant@citrix.com>
References: <20180510091518.28199-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t9kk=h5=citrix.com=prvs=66179fe3f=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fGhfZ-0007TW-AI
 for xen-devel@lists.xenproject.org; Thu, 10 May 2018 09:15:25 +0000
In-Reply-To: <20180510091518.28199-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul.durrant@citrix.com>, Eric Blake <eblake@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>
List-Id: xen-devel@lists.xenproject.org

QWxsIHRoZSB4ZW4gc3RhYmxlIEFQSXMgZGVmaW5lIGhhbmRsZSB0eXBlcyBvZiB0aGUgZm9ybToK
CjxuYW1lIG9mIEFQST5faGFuZGxlCgphbmQgc29tZSBkZWZpbmUgYWRkaXRpb25hbCBoYW5kbGUg
dHlwZXMgb2YgdGhlIGZvcm06Cgo8bmFtZSBvZiBBUEk+XzxwdXJwb3NlIG9mIGhhbmRsZT5faGFu
ZGxlCgpFeGFtcGxlcyBvZiB0aGVzZSBhcmUgeGVuZm9yZWlnbm1lbW9yeV9oYW5kbGUgYW5kCnhl
bmZvcmVpZ25tZW1vcnlfcmVzb3VyY2VfaGFuZGxlLgoKQm90aCBvZiB0aGVzZSB0eXBlcyB3aWxs
IGJlIG1pc3BhcnNlZCBieSBjaGVja3BhdGNoIGlmIHRoZXkgYXBwZWFyIGFzIHRoZQpmaXJzdCB0
b2tlbiBpbiBhIGxpbmUgc2luY2UsIGFzIHR5cGVzIGRlZmluZWQgYnkgYW4gZXh0ZXJuYWwgbGli
cmFyeSwgdGhleQpkbyBub3QgY29uZm9ybSB0byB0aGUgUUVNVSBDT0RJTkdfU1RZTEUsIHdoaWNo
IHN1Z2dlc3RzIENhbWVsQ2FzZS4KCkEgcHJldmlvdXMgcGF0Y2ggKDVhYzA2N2EyNGE4KSBhZGRl
ZCB4ZW5kZXZpY2Vtb2RlbF9oYW5kbGUgdG8gdGhlIGxpc3QKb2YgdHlwZXMuIFRoaXMgcGF0Y2gg
Y2hhbmdlcyB0aGF0IHRvIHhlblx3K19oYW5kbGUgc3VjaCB0aGF0IGl0IHdpbGwKbWF0Y2ggYWxs
IFhlbiBzdGFibGUgQVBJIGhhbmRsZXMgb2YgdGhlIGZvcm1zIGRldGFpbGVkIGFib3ZlLgoKU2ln
bmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KLS0tCkNj
OiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4KQ2M6IFBhb2xvIEJvbnppbmkgPHBib256
aW5pQHJlZGhhdC5jb20+CkNjOiBEYW5pZWwgUC4gQmVycmFuZ2UgPGJlcnJhbmdlQHJlZGhhdC5j
b20+Cgp2MjoKIC0gTmV3IGluIHRoaXMgdmVyc2lvbgotLS0KIHNjcmlwdHMvY2hlY2twYXRjaC5w
bCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3NjcmlwdHMvY2hlY2twYXRjaC5wbCBiL3NjcmlwdHMvY2hlY2twYXRjaC5w
bAppbmRleCA1Yjg3MzVkZWZiLi45OGVkNzk5ZjI5IDEwMDc1NQotLS0gYS9zY3JpcHRzL2NoZWNr
cGF0Y2gucGwKKysrIGIvc2NyaXB0cy9jaGVja3BhdGNoLnBsCkBAIC0yNjYsNyArMjY2LDcgQEAg
b3VyIEB0eXBlTGlzdCA9ICgKIAlxcnt0YXJnZXRfKD86dSk/bG9uZ30sCiAJcXJ7aHdhZGRyfSwK
IAlxcnt4bWwke0lkZW50fX0sCi0JcXJ7eGVuZGV2aWNlbW9kZWxfaGFuZGxlfSwKKwlxcnt4ZW5c
dytfaGFuZGxlfSwKICk7CiAKICMgVGhpcyBjYW4gYmUgbW9kaWZpZWQgYnkgc3ViIHBvc3NpYmxl
LiAgU2luY2UgaXQgY2FuIGJlIGVtcHR5LCBiZSBjYXJlZnVsCi0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
