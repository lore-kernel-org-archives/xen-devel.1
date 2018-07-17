From: Oleksandr Grytsov <al1img@gmail.com>
Subject: [PATCH v3 0/7] libxl: create standalone vkb device
Date: Tue, 17 Jul 2018 19:07:33 +0300
Message-ID: <20180717160740.26845-1-al1img@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=pfxt=kb=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1ffSW0-0002t4-S1
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 16:07:52 +0000
Received: by mail-lf0-x244.google.com with SMTP id b22-v6so1250996lfa.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jul 2018 09:07:51 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: ian.jackson@eu.citrix.com, wei.liu2@citrix.com, Oleksandr Grytsov <oleksandr_grytsov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgoKQ2hh
bmdlcyBzaW5jZSB2MjoKCiogZml4IGluZGVudGF0aW9uIGluIGxpYnhsX19kZXZpY2VfdmtiX2Rt
X25lZWRlZAoqIGFkZCBMSUJYTF9IQVZFX0VYVEVOREVEX1ZLQiBkZWZpbmUgdG8gaW5kaWNhdGVz
IHRoYXQgbGlieGxfX2RldmljZV92a2IKICBoYXMgZXh0ZW5kZWQgZmllbGRzCgpPbGVrc2FuZHIg
R3J5dHNvdiAoNyk6CiAgbGlieGw6IG1vdmUgdmtiIGRldmljZSB0byBsaWJ4bF92a2IuYwogIGxp
YnhsOiBhZGQgYmFja2VuZCB0eXBlIGFuZCBpZCB0byB2a2IKICBsaWJ4bDogdmtiIGFkZCBsaXN0
IGFuZCBpbmZvIGZ1bmN0aW9ucwogIHhsOiBhZGQgdmtiIGNvbmZpZyBwYXJzZXIgYW5kIENMSQog
IGRvY3M6IGFkZCB2a2IgZGV2aWNlIHRvIHhsLmNmZyBhbmQgeGwKICBsaWJ4bDogdmtiIGFkZCBl
eHRlbmRlZCBwYXJhbWV0ZXJzCiAgbGlieGw6IGFkZCBMSUJYTF9IQVZFX0VYVEVOREVEX1ZLQiBk
ZWZpbmUKCiBkb2NzL21hbi94bC5jZmcucG9kLjUuaW4gICAgfCAgNjQgKysrKysrKwogZG9jcy9t
YW4veGwucG9kLjEuaW4gICAgICAgIHwgIDIyICsrKwogdG9vbHMvbGlieGwvTWFrZWZpbGUgICAg
ICAgIHwgICAyICstCiB0b29scy9saWJ4bC9saWJ4bC5oICAgICAgICAgfCAgMjYgKysrCiB0b29s
cy9saWJ4bC9saWJ4bF9jb25zb2xlLmMgfCAgNTMgLS0tLS0tCiB0b29scy9saWJ4bC9saWJ4bF9j
cmVhdGUuYyAgfCAgIDMgKwogdG9vbHMvbGlieGwvbGlieGxfZG0uYyAgICAgIHwgICAxICsKIHRv
b2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbCB8ICAyOSArKysKIHRvb2xzL2xpYnhsL2xpYnhsX3V0
aWxzLmggICB8ICAgMyArCiB0b29scy9saWJ4bC9saWJ4bF92a2IuYyAgICAgfCAzNDIgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0b29scy94bC9NYWtlZmlsZSAgICAgICAg
ICAgfCAgIDIgKy0KIHRvb2xzL3hsL3hsLmggICAgICAgICAgICAgICB8ICAgMyArCiB0b29scy94
bC94bF9jbWR0YWJsZS5jICAgICAgfCAgMTYgKysKIHRvb2xzL3hsL3hsX3BhcnNlLmMgICAgICAg
ICB8IDEwOSArKysrKysrKysrKy0KIHRvb2xzL3hsL3hsX3BhcnNlLmggICAgICAgICB8ICAgMSAr
CiB0b29scy94bC94bF92a2IuYyAgICAgICAgICAgfCAxNjEgKysrKysrKysrKysrKysrKysKIDE2
IGZpbGVzIGNoYW5nZWQsIDc4MSBpbnNlcnRpb25zKCspLCA1NiBkZWxldGlvbnMoLSkKIGNyZWF0
ZSBtb2RlIDEwMDY0NCB0b29scy9saWJ4bC9saWJ4bF92a2IuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IHRvb2xzL3hsL3hsX3ZrYi5jCgotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
