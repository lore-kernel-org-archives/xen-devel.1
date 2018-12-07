From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: [PATCH v2 0/2] CPU hotplug fixes for ARM32
Date: Fri,  7 Dec 2018 11:45:29 +0200
Message-ID: <1544175931-17047-1-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PsOz=OQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1gVChd-0001xd-TX
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 09:45:45 +0000
Received: by mail-lf1-x144.google.com with SMTP id l10so2541730lfh.9
 for <xen-devel@lists.xenproject.org>; Fri, 07 Dec 2018 01:45:44 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com, sstabellini@kernel.org, mirela.simonovic@aggios.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKSGksIGFsbC4KClRoaXMgaXMgc21hbGwgcGF0Y2ggc2VyaWVzIGZvciBBUk0zMiB3aGljaCBu
ZWVkZWQgdG8gYmUgYWJsZSB0byBicmluZwpzZWNvbmRhcnkgQ1BVcyB1cCBub3Qgb25seSBkdXJp
bmcgdGhlIGluaXRpYWwgYm9vdCwgYnV0IGF0IHJ1bnRpbWUgYWxzby4KRm9yIGV4YW1wbGUsIGR1
cmluZyBDUFUgaG90cGx1Zy4KCkFjdHVhbGx5IHRoZXNlIGFyZSBmb2xsb3ctdXAgcGF0Y2hlcyB0
byB0aGUgZm9sbG93aW5nIHNlcmllcyBbMV0sIHdoaWNoIGNvdmVycyAKZ2VuZXJpYyBBUk0gYW5k
IEFSTTY0IHBhcnRzLiAKClsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVz
L2h0bWwveGVuLWRldmVsLzIwMTgtMDYvbXNnMDAwMzkuaHRtbAoKQ2hhbmdlcyBzaW5jZSB2MToK
ICAgLSBGaXggdHlwb2VzCiAgIC0gUmVuYW1lICIuaW5pdC5wcm9jLmluZm8iIHRvICIuZGF0YS5w
cm9jLmluZm8iCgpPbGVrc2FuZHIgVHlzaGNoZW5rbyAoMik6CiAgeGVuL2FybTogbGluazogTGlu
ayBwcm9jX2luZm9fbGlzdCBpbiAuZGF0YSBpbnN0ZWFkIG9mIC5pbml0LmRhdGEKICB4ZW4vYXJt
MzI6IFJlbW92ZSBfX2luaXQgcHJlZml4ZXMgZnJvbSBmdW5jcyB0aGF0IGFyZSB1c2VkIHdpdGhp
biBDUFUKICAgIHVwIGZsb3cKCiB4ZW4vYXJjaC9hcm0vYXJtMzIvcHJvYy12Ny5TIHwgIDYgKysr
LS0tCiB4ZW4vYXJjaC9hcm0vYXJtMzIvc21wYm9vdC5jIHwgIDIgKy0KIHhlbi9hcmNoL2FybS9w
bGF0Zm9ybS5jICAgICAgfCAgMiArLQogeGVuL2FyY2gvYXJtL3hlbi5sZHMuUyAgICAgICB8IDEw
ICsrKysrKy0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
