From: Joe Jin <joe.jin@oracle.com>
Subject: [PATCH] xen-swiotlb: exchange memory with Xen only when
 pages are contiguous
Date: Tue, 23 Oct 2018 20:09:04 -0700
Message-ID: <bb6d87b4-c371-c6c0-8c48-bc95df018ad1__4997.06585328585$1540350559$gmane$org@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ikes=ne=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1gF9Xj-0002AM-MK
 for xen-devel@lists.xenproject.org; Wed, 24 Oct 2018 03:09:11 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "DONGLI.ZHANG" <dongli.zhang@oracle.com>, konrad@kernel.org, Christoph Helwig <hch@lst.de>, John Sobecki <john.sobecki@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-kernel@vger.kernel.org\"" <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDQ4NTVjOTJkYmI3ICJ4ZW4tc3dpb3RsYjogZml4IHRoZSBjaGVjayBjb25kaXRpb24g
Zm9yCnhlbl9zd2lvdGxiX2ZyZWVfY29oZXJlbnQiIG9ubHkgZml4ZWQgbWVtb3J5IGFkZHJlc3Mg
Y2hlY2sgY29uZGl0aW9uCm9uIHhlbl9zd2lvdGxiX2ZyZWVfY29oZXJlbnQoKSwgd2hlbiBtZW1v
cnkgd2FzIG5vdCBwaHlzaWNhbGx5CmNvbnRpZ3VvdXMgYW5kIHRyaWVkIHRvIGV4Y2hhbmdlZCB3
aXRoIFhlbiB2aWEgCnhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uIGl0IHdpbGwgbGVhZCBr
ZXJuZWwgcGFuaWMuCgpUaGUgY29ycmVjdCBjaGVjayBjb25kaXRpb24gc2hvdWxkIGJlIG1lbW9y
eSBpcyBpbiBETUEgYXJlYSBhbmQKcGh5c2ljYWxseSBjb250aWd1b3VzLgoKVGhhbmsgeW91IEJv
cmlzIGZvciBwb2ludGluZyBpdCBvdXQuCgpTaWduZWQtb2ZmLWJ5OiBKb2UgSmluIDxqb2Uuamlu
QG9yYWNsZS5jb20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNs
ZS5jb20+CkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpD
YzogQ2hyaXN0b3BoIEhlbHdpZyA8aGNoQGxzdC5kZT4KQ2M6IERvbmdsaSBaaGFuZyA8ZG9uZ2xp
LnpoYW5nQG9yYWNsZS5jb20+CkNjOiBKb2huIFNvYmVja2kgPGpvaG4uc29iZWNraUBvcmFjbGUu
Y29tPgotLS0KIGRyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy94ZW4vc3dpb3RsYi14ZW4uYyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKaW5kZXggZjVj
MWFmNGNlOWFiLi5hZWQ5MmZhMDE5ZjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3N3aW90bGIt
eGVuLmMKKysrIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwpAQCAtMzU3LDggKzM1Nyw4IEBA
IHhlbl9zd2lvdGxiX2ZyZWVfY29oZXJlbnQoc3RydWN0IGRldmljZSAqaHdkZXYsIHNpemVfdCBz
aXplLCB2b2lkICp2YWRkciwKIAkvKiBDb252ZXJ0IHRoZSBzaXplIHRvIGFjdHVhbGx5IGFsbG9j
YXRlZC4gKi8KIAlzaXplID0gMVVMIDw8IChvcmRlciArIFhFTl9QQUdFX1NISUZUKTsKIAotCWlm
ICgoKGRldl9hZGRyICsgc2l6ZSAtIDEgPD0gZG1hX21hc2spKSB8fAotCSAgICByYW5nZV9zdHJh
ZGRsZXNfcGFnZV9ib3VuZGFyeShwaHlzLCBzaXplKSkKKwlpZiAoKGRldl9hZGRyICsgc2l6ZSAt
IDEgPD0gZG1hX21hc2spICYmCisJICAgICFyYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeShw
aHlzLCBzaXplKSkKIAkJeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24ocGh5cywgb3JkZXIp
OwogCiAJeGVuX2ZyZWVfY29oZXJlbnRfcGFnZXMoaHdkZXYsIHNpemUsIHZhZGRyLCAoZG1hX2Fk
ZHJfdClwaHlzLCBhdHRycyk7Ci0tIAoyLjE3LjEgKEFwcGxlIEdpdC0xMTIpCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
