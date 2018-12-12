From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH 0/2] gic-vgic optimizations
Date: Wed, 12 Dec 2018 18:55:23 +0200
Message-ID: <1544633725-7243-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX7nG-0005Sv-OC
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 16:55:30 +0000
Received: by mail-lj1-x242.google.com with SMTP id c19-v6so16920094lja.5
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 08:55:29 -0800 (PST)
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
IGJ1aWxkCgogIGFybS9pcnE6IHNraXAgYWN0aW9uIGF2YWlsYWJpbGl0eSBjaGVjayBmb3Igbm9u
LWRlYnVnIGJ1aWxkCiAgICAgICAgSXMgYSBwYXRjaCAjMTEgWzNdLCB3aXRoIGEgY2hhbmdlOgog
ICAgICAgICAtIENvbXBsZXRlbHkgcmVtb3ZlIHRoZSBjaGVjayBmb3IgYSBub24tZGVidWcgYnVp
bGQsCiAgICAgICAgICAgYnV0IHByZXNlcnZlIGZvciBkZWJ1Zy4KClsxXSBodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMTEvbXNnMDMzMjgu
aHRtbApbMl0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1k
ZXZlbC8yMDE4LTExL21zZzAzMjg1Lmh0bWwKWzNdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0xMS9tc2cwMzI5MS5odG1sCgoKIHhlbi9h
cmNoL2FybS9naWMtdmdpYy5jIHwgMiArKwogeGVuL2FyY2gvYXJtL2lycS5jICAgICAgfCAyICsr
CiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKLS0gCjIuNy40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
