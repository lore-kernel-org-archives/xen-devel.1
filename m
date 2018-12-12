From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH 0/2] gic-vgic optimizations
Date: Wed, 12 Dec 2018 20:20:53 +0200
Message-ID: <1544638855-9432-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX981-0008Dj-CT
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 18:21:01 +0000
Received: by mail-lf1-x142.google.com with SMTP id l10so14266670lfh.9
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 10:20:59 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkhlcmUgYXJlIGZl
dyBwYXRjaGVzIGZyb20gUkZDIHNlcmllcyBbMV0gY3VycmVudGx5IGFwcHJvdmVkIHRvCmJlIHVw
c3RyZWFtZWQgd2l0aCBhcHByb3ByaWF0ZSBjaGFuZ2VzLgoKQW5kcmlpIEFuaXNvdiAoMik6CiAg
Z2ljLXZnaWM6IERyb3AgYW4gZXhjZXNzaXZlIGNsZWFyX2xycwogICAgICAgIElzIGEgcGF0Y2gg
IzUgWzJdLCB3aXRoIGEgY2hhbmdlOgogICAgICAgICAtIEtlZXAgTFIgY2xlYXIgZm9yIGRlYnVn
IGJ1aWxkCiAgICAgICAgTm8gY2hhbmdlcyBpbiB2MjoKCgogIGFybS9pcnE6IHNraXAgYWN0aW9u
IGF2YWlsYWJpbGl0eSBjaGVjayBmb3Igbm9uLWRlYnVnIGJ1aWxkCiAgICAgICAgSXMgYSBwYXRj
aCAjMTEgWzNdLCB3aXRoIGEgY2hhbmdlOgogICAgICAgICAtIENvbXBsZXRlbHkgcmVtb3ZlIHRo
ZSBjaGVjayBmb3IgYSBub24tZGVidWcgYnVpbGQsCiAgICAgICAgICAgYnV0IHByZXNlcnZlIGZv
ciBkZWJ1Zy4KICAgICAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgICAtIHJld29yZGVkIHRoZSBj
b21taXQgdGl0bGUgYW5kIG1lc3NhZ2UKICAgICAgICAgLSByZW1vdmVkIGFuIFJCIHByZW1hdHVy
ZWx5IGluc2VydGVkIGJ5IG1pc3Rha2UKClsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMTEvbXNnMDMzMjguaHRtbApbMl0gaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTExL21z
ZzAzMjg1Lmh0bWwKWzNdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRt
bC94ZW4tZGV2ZWwvMjAxOC0xMS9tc2cwMzI5MS5odG1sCgogeGVuL2FyY2gvYXJtL2dpYy12Z2lj
LmMgfCAyICsrCiB4ZW4vYXJjaC9hcm0vaXJxLmMgICAgICB8IDIgKysKIDIgZmlsZXMgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
