From: David Hildenbrand <david@redhat.com>
Subject: [PATCH RFC 3/6] kexec: export PG_offline to VMCOREINFO
Date: Wed, 14 Nov 2018 22:17:01 +0100
Message-ID: <20181114211704.6381-4-david__2081.40268591723$1542230190$gmane$org@redhat.com>
References: <20181114211704.6381-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zcq3=nz=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gN2Xk-0003E9-1S
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 21:17:48 +0000
In-Reply-To: <20181114211704.6381-1-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-mm@kvack.org
Cc: Michal Hocko <mhocko@suse.com>, Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>, linux-pm@vger.kernel.org, linux-doc@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>, Omar Sandoval <osandov@fb.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

TGV0J3MgZXhwb3J0IFBHX29mZmxpbmUgdmlhIFBBR0VfT0ZGTElORV9NQVBDT1VOVF9WQUxVRSwg
c28KbWFrZWR1bXBmaWxlIGNhbiBkaXJlY3RseSBza2lwIHBhZ2VzIHRoYXQgYXJlIGxvZ2ljYWxs
eSBvZmZsaW5lIGFuZCB0aGUKY29udGVudCB0aGVyZWZvcmUgc3RhbGUuCgpDYzogQW5kcmV3IE1v
cnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IERhdmUgWW91bmcgPGR5b3VuZ0By
ZWRoYXQuY29tPgpDYzogIktpcmlsbCBBLiBTaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBsaW51
eC5pbnRlbC5jb20+CkNjOiBCYW9xdWFuIEhlIDxiaGVAcmVkaGF0LmNvbT4KQ2M6IE9tYXIgU2Fu
ZG92YWwgPG9zYW5kb3ZAZmIuY29tPgpDYzogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
Q2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPgpDYzogTWljaGFsIEhvY2tv
IDxtaG9ja29Ac3VzZS5jb20+CkNjOiAiTWljaGFlbCBTLiBUc2lya2luIiA8bXN0QHJlZGhhdC5j
b20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgot
LS0KIGtlcm5lbC9jcmFzaF9jb3JlLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEva2VybmVsL2NyYXNoX2NvcmUuYyBiL2tlcm5lbC9jcmFzaF9j
b3JlLmMKaW5kZXggOTMzY2IzZTQ1Yjk4Li4wOTNjOWY5MTdlZDAgMTAwNjQ0Ci0tLSBhL2tlcm5l
bC9jcmFzaF9jb3JlLmMKKysrIGIva2VybmVsL2NyYXNoX2NvcmUuYwpAQCAtNDY0LDYgKzQ2NCw4
IEBAIHN0YXRpYyBpbnQgX19pbml0IGNyYXNoX3NhdmVfdm1jb3JlaW5mb19pbml0KHZvaWQpCiAJ
Vk1DT1JFSU5GT19OVU1CRVIoUEFHRV9CVUREWV9NQVBDT1VOVF9WQUxVRSk7CiAjaWZkZWYgQ09O
RklHX0hVR0VUTEJfUEFHRQogCVZNQ09SRUlORk9fTlVNQkVSKEhVR0VUTEJfUEFHRV9EVE9SKTsK
KyNkZWZpbmUgUEFHRV9PRkZMSU5FX01BUENPVU5UX1ZBTFVFCSh+UEdfb2ZmbGluZSkKKwlWTUNP
UkVJTkZPX05VTUJFUihQQUdFX09GRkxJTkVfTUFQQ09VTlRfVkFMVUUpOwogI2VuZGlmCiAKIAlh
cmNoX2NyYXNoX3NhdmVfdm1jb3JlaW5mbygpOwotLSAKMi4xNy4yCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
