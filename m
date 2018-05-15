From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v3 2/3] checkpatch: generalize xen handle
 matching in the list of types
Date: Tue, 15 May 2018 17:40:52 +0100
Message-ID: <20180515164053.14604-3-paul.durrant@citrix.com>
References: <20180515164053.14604-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=egkv=ic=citrix.com=prvs=6664e1dc0=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fId0U-0000Zf-N0
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 16:40:58 +0000
In-Reply-To: <20180515164053.14604-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul.durrant@citrix.com>, "Daniel P . Berrange" <berrange@redhat.com>
List-Id: xen-devel@lists.xenproject.org

QWxsIHRoZSB4ZW4gc3RhYmxlIEFQSXMgZGVmaW5lIGhhbmRsZSB0eXBlcyBvZiB0aGUgZm9ybToK
CnhlbjxzdWJqZWN0IG9mIEFQST5faGFuZGxlCgphbmQgc29tZSBkZWZpbmUgYWRkaXRpb25hbCBo
YW5kbGUgdHlwZXMgb2YgdGhlIGZvcm06Cgp4ZW48c3ViamVjdCBvZiBBUEk+XzxwdXJwb3NlIG9m
IGhhbmRsZT5faGFuZGxlCgpFeGFtcGxlcyBvZiB0aGVzZSBhcmUgeGVuZm9yZWlnbm1lbW9yeV9o
YW5kbGUgYW5kCnhlbmZvcmVpZ25tZW1vcnlfcmVzb3VyY2VfaGFuZGxlLgoKQm90aCBvZiB0aGVz
ZSB0eXBlcyB3aWxsIGJlIG1pc3BhcnNlZCBieSBjaGVja3BhdGNoIGlmIHRoZXkgYXBwZWFyIGFz
IHRoZQpmaXJzdCB0b2tlbiBpbiBhIGxpbmUgc2luY2UsIGFzIHR5cGVzIGRlZmluZWQgYnkgYW4g
ZXh0ZXJuYWwgbGlicmFyeSwgdGhleQpkbyBub3QgY29uZm9ybSB0byB0aGUgUUVNVSBDT0RJTkdf
U1RZTEUsIHdoaWNoIHN1Z2dlc3RzIENhbWVsQ2FzZS4KCkEgcHJldmlvdXMgcGF0Y2ggKDVhYzA2
N2EyNGE4KSBhZGRlZCB4ZW5kZXZpY2Vtb2RlbF9oYW5kbGUgdG8gdGhlIGxpc3QKb2YgdHlwZXMu
IFRoaXMgcGF0Y2ggY2hhbmdlcyB0aGF0IHRvIHhlblx3K19oYW5kbGUgc3VjaCB0aGF0IGl0IHdp
bGwKbWF0Y2ggYWxsIFhlbiBzdGFibGUgQVBJIGhhbmRsZXMgb2YgdGhlIGZvcm1zIGRldGFpbGVk
IGFib3ZlLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4
LmNvbT4KUmV2aWV3ZWQtYnk6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPgotLS0KQ2M6
IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+CkNjOiBEYW5pZWwgUC4gQmVycmFu
Z2UgPGJlcnJhbmdlQHJlZGhhdC5jb20+Cgp2MzoKIC0gQWRqdXN0ZWQgY29tbWl0IGNvbW1lbnQg
c2xpZ2h0bHkgYXMgc3VnZ2VzdGVkIGJ5IEVyaWMKCnYyOgogLSBOZXcgaW4gdGhpcyB2ZXJzaW9u
Ci0tLQogc2NyaXB0cy9jaGVja3BhdGNoLnBsIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jaGVja3BhdGNo
LnBsIGIvc2NyaXB0cy9jaGVja3BhdGNoLnBsCmluZGV4IGNiMWI2NTIzODguLmUzZDhjMmNkZmMg
MTAwNzU1Ci0tLSBhL3NjcmlwdHMvY2hlY2twYXRjaC5wbAorKysgYi9zY3JpcHRzL2NoZWNrcGF0
Y2gucGwKQEAgLTI3MSw3ICsyNzEsNyBAQCBvdXIgQHR5cGVMaXN0ID0gKAogCXFye2h3YWRkcn0s
CiAgICAgICAgICMgZXh0ZXJuYWwgbGlicmFyaWVzCiAJcXJ7eG1sJHtJZGVudH19LAotCXFye3hl
bmRldmljZW1vZGVsX2hhbmRsZX0sCisJcXJ7eGVuXHcrX2hhbmRsZX0sCiAJIyBHbGliIGRlZmlu
aXRpb25zCiAJcXJ7Z2NoYXJ9LAogCXFye2dzaG9ydH0sCi0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
