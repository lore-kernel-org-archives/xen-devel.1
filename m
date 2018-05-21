From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PULL 13/15] xen_backend: make the
 xen_feature_grant_copy flag private
Date: Mon, 21 May 2018 12:35:02 -0700
Message-ID: <1526931304-7289-13-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1805211229070.4520@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mmjm=ii=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fKqaP-0000VK-SY
 for xen-devel@lists.xenproject.org; Mon, 21 May 2018 19:35:13 +0000
In-Reply-To: <alpine.DEB.2.10.1805211229070.4520@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: peter.maydell@linaro.org, stefanha@gmail.com
Cc: sstabellini@kernel.org, qemu-devel@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, stefanha@redhat.com, anthony.perard@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KClRoZXJlIGlzIG5v
IGxvbmdlciBhbnkgdXNlIG9mIHRoaXMgZmxhZyBvdXRzaWRlIG9mIHRoZSB4ZW5fYmFja2VuZCBj
b2RlLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNv
bT4KQWNrZWQtYnk6IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpT
aWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
Ci0tLQogaHcveGVuL3hlbl9iYWNrZW5kLmMgICAgICAgICB8IDIgKy0KIGluY2x1ZGUvaHcveGVu
L3hlbl9iYWNrZW5kLmggfCAxIC0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcveGVuL3hlbl9iYWNrZW5kLmMgYi9ody94ZW4v
eGVuX2JhY2tlbmQuYwppbmRleCAzYzNmYzJjLi45YThlODc3IDEwMDY0NAotLS0gYS9ody94ZW4v
eGVuX2JhY2tlbmQuYworKysgYi9ody94ZW4veGVuX2JhY2tlbmQuYwpAQCAtNDQsOSArNDQsOSBA
QCBCdXNTdGF0ZSAqeGVuX3N5c2J1czsKIC8qIHB1YmxpYyAqLwogc3RydWN0IHhzX2hhbmRsZSAq
eGVuc3RvcmUgPSBOVUxMOwogY29uc3QgY2hhciAqeGVuX3Byb3RvY29sOwotYm9vbCB4ZW5fZmVh
dHVyZV9ncmFudF9jb3B5OwogCiAvKiBwcml2YXRlICovCitzdGF0aWMgYm9vbCB4ZW5fZmVhdHVy
ZV9ncmFudF9jb3B5Owogc3RhdGljIGludCBkZWJ1ZzsKIAogaW50IHhlbnN0b3JlX3dyaXRlX2Jl
X3N0cihzdHJ1Y3QgWGVuRGV2aWNlICp4ZW5kZXYsIGNvbnN0IGNoYXIgKm5vZGUsIGNvbnN0IGNo
YXIgKnZhbCkKZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcveGVuL3hlbl9iYWNrZW5kLmggYi9pbmNs
dWRlL2h3L3hlbi94ZW5fYmFja2VuZC5oCmluZGV4IDI5YmYxYzMuLjljMTdmZGQgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvaHcveGVuL3hlbl9iYWNrZW5kLmgKKysrIGIvaW5jbHVkZS9ody94ZW4veGVu
X2JhY2tlbmQuaApAQCAtMTYsNyArMTYsNiBAQAogLyogdmFyaWFibGVzICovCiBleHRlcm4gc3Ry
dWN0IHhzX2hhbmRsZSAqeGVuc3RvcmU7CiBleHRlcm4gY29uc3QgY2hhciAqeGVuX3Byb3RvY29s
OwotZXh0ZXJuIGJvb2wgeGVuX2ZlYXR1cmVfZ3JhbnRfY29weTsKIGV4dGVybiBEZXZpY2VTdGF0
ZSAqeGVuX3N5c2RldjsKIGV4dGVybiBCdXNTdGF0ZSAqeGVuX3N5c2J1czsKIAotLSAKMS45LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
