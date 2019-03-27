From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 08/12] xen/arm: cpufeature: Match register size
 with value size in cpus_have_const_cap
Date: Wed, 27 Mar 2019 18:45:27 +0000
Message-ID: <20190327184531.30986-9-julien.grall@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h58V=R6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h9DYh-0001kO-A2
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 18:45:55 +0000
In-Reply-To: <20190327184531.30986-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

Q2xhbmcgaXMgcGlja2llciB0aGFuIEdDQyBmb3IgdGhlIHJlZ2lzdGVyIHNpemUgaW4gYXNtIHN0
YXRlbWVudC4gSXQKZXhwZWN0cyB0aGUgcmVnaXN0ZXIgc2l6ZSB0byBtYXRjaCB0aGUgdmFsdWUg
c2l6ZS4KClRoZSBhc20gc3RhdGVtZW50IGV4cGVjdHMgYSAzMi1iaXQgKHJlc3AuIDY0LWJpdCkg
dmFsdWUgb24gQXJtMzIKKHJlc3AuIEFybTY0KSB3aGVyZWFzIHRoZSB2YWx1ZSBpcyBhIGJvb2xl
YW4gKENsYW5nIGNvbnNpZGVyIHRvIGJlCjMyLWJpdCkuCgpJdCB3b3VsZCBiZSBwb3NzaWJsZSB0
byBpbXBvc2UgMzItYml0IHJlZ2lzdGVyIGZvciBib3RoIGFyY2hpdGVjdHVyZQpidXQgdGhpcyBy
ZXF1aXJlIHRoZSBjb2RlIHRvIHVzZSBfX09QMzIuIEhvd2V2ZXIsIGl0IGRvZXMgbm8gcmVhbGx5
CmltcHJvdmUgdGhlIGFzc2VtYmx5IGdlbmVyYXRlZC4gSW5zdGVhZCwgcmVwbGFjZSBzd2l0Y2gg
dGhlIHZhcmlhYmxlIHRvCnVzZSByZWdpc3Rlcl90LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWZl
YXR1cmUuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vY3B1ZmVhdHVyZS5oIGIveGVu
L2luY2x1ZGUvYXNtLWFybS9jcHVmZWF0dXJlLmgKaW5kZXggYzJjOGYzNDE3Yy4uZDA2ZjA5ZWNm
YSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9jcHVmZWF0dXJlLmgKKysrIGIveGVu
L2luY2x1ZGUvYXNtLWFybS9jcHVmZWF0dXJlLmgKQEAgLTY3LDcgKzY3LDcgQEAgc3RhdGljIGlu
bGluZSBib29sIGNwdXNfaGF2ZV9jYXAodW5zaWduZWQgaW50IG51bSkKIAogLyogU3lzdGVtIGNh
cGFiaWxpdHkgY2hlY2sgZm9yIGNvbnN0YW50IGNhcCAqLwogI2RlZmluZSBjcHVzX2hhdmVfY29u
c3RfY2FwKG51bSkgKHsgICAgICAgICAgICAgICAgIFwKLSAgICAgICAgYm9vbCBfX3JldDsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgICAgIHJlZ2lzdGVyX3QgX19yZXQ7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgYXNtIHZvbGF0aWxlIChBTFRFUk5B
VElWRSgibW92ICUwLCAjMCIsICAgICBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIm1vdiAlMCwgIzEiLCAgICAgXAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
