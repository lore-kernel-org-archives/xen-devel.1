From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH 2/2] xen/arm: domain_build: Don't expose IOMMU
 specific properties to the guest
Date: Mon, 21 Jan 2019 19:04:07 +0200
Message-ID: <1548090247-20078-3-git-send-email-andrii.anisov@gmail.com>
References: <1548090247-20078-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8+6Q=P5=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1glczh-0007rE-0l
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 17:04:17 +0000
Received: by mail-lf1-x144.google.com with SMTP id a8so16024940lfk.5
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jan 2019 09:04:15 -0800 (PST)
In-Reply-To: <1548090247-20078-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKV2UgZG9uJ3QgcGFzc3Rocm91Z2ggSU9NTVUgZGV2aWNlIHRvIERPTTAgZXZlbiBpZiBpdCBp
cyBub3QgdXNlZCBieQpYZW4uIFRoZXJlZm9yZSBleHBvc2luZyB0aGUgcHJvcGVydGllcyB0aGF0
IGRlc2NyaWJlIHJlbGF0aW9uc2hpcApiZXR3ZWVuIG1hc3RlciBkZXZpY2VzIGFuZCBJT01NVXMg
ZG9lcyBub3QgbWFrZSBhbnkgc2Vuc2UuCgpBY2NvcmRpbmcgdG8gdGhlOgoxLiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvaW9tbXUudHh0CjIuIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvcGNpLWlvbW11LnR4dAoKU2lnbmVkLW9mZi1ieTogT2xl
a3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgpBY2tlZC1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMgfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9h
cmNoL2FybS9kb21haW5fYnVpbGQuYwppbmRleCBkMmM2M2E4Li4xNWEwOGQ2IDEwMDY0NAotLS0g
YS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jCkBAIC01NDAsNiArNTQwLDE2IEBAIHN0YXRpYyBpbnQgX19pbml0IHdyaXRlX3Byb3Bl
cnRpZXMoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKICAgICAg
ICAgICAgIGNvbnRpbnVlOwogICAgICAgICB9CiAKKyAgICAgICAgLyogRG9uJ3QgZXhwb3NlIElP
TU1VIHNwZWNpZmljIHByb3BlcnRpZXMgdG8gdGhlIGd1ZXN0ICovCisgICAgICAgIGlmICggZHRf
cHJvcGVydHlfbmFtZV9pc19lcXVhbChwcm9wLCAiaW9tbXVzIikgKQorICAgICAgICAgICAgY29u
dGludWU7CisKKyAgICAgICAgaWYgKCBkdF9wcm9wZXJ0eV9uYW1lX2lzX2VxdWFsKHByb3AsICJp
b21tdS1tYXAiKSApCisgICAgICAgICAgICBjb250aW51ZTsKKworICAgICAgICBpZiAoIGR0X3By
b3BlcnR5X25hbWVfaXNfZXF1YWwocHJvcCwgImlvbW11LW1hcC1tYXNrIikgKQorICAgICAgICAg
ICAgY29udGludWU7CisKICAgICAgICAgcmVzID0gZmR0X3Byb3BlcnR5KGtpbmZvLT5mZHQsIHBy
b3AtPm5hbWUsIHByb3BfZGF0YSwgcHJvcF9sZW4pOwogCiAgICAgICAgIGlmICggcmVzICkKLS0g
CjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
