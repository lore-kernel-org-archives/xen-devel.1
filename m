From: Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH 0/6] Xen stubdom support
Date: Mon, 11 Mar 2019 14:02:10 -0400
Message-ID: <20190311180216.18811-1-jandryuk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TSWV=RO=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1h3PGT-00018i-4m
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 18:03:05 +0000
Received: by mail-qk1-x742.google.com with SMTP id h28so3266523qkk.7
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2019 11:03:03 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, Jason Andryuk <jandryuk@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, marmarek@invisiblethingslab.com, Paul Durrant <paul.durrant@citrix.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

WGVuIHN1cHBvcnRzIHJ1bm5pbmcgUUVNVSBpbiBhIGRlZGljYXRlZCBzZXJ2aWNlIHZtIC0gYSBz
dHViIGRvbWFpbiBvcgpzdHViZG9tLiAgUUVNVSBpcyB0aGVuIGlzb2xhdGVkIG91dHNpZGUgb2Yg
dGhlIHByaXZpbGVnZWQgRG9tYWluLTAuCgpXaGVuIHJ1bm5pbmcgaW4gYSBzdHViZG9tLCB0aGVy
ZSBhcmUgYSBmZXcgY2hhbmdlcyBuZWVkZWQgZm9yIFFFTVUuICBPbgpvbGRlciBYZW4gdmVyc2lv
bnMsIHRoZSBkZWZhdWx0IGlvcmVxIHNlcnZlciBuZWVkcyB0byBoYXZlIHRoZSBzdHViZG9tJ3MK
ZG9taWQgc3BlY2lmaWVkLiAgVGhlIHN0dWJkb20gZG9lc24ndCBydW4gUFYgYmFja2VuZHMsIHNv
IHRoYXQKaW5pdGlhbGl6YXRpb24gY29kZSBjYW4gYmUgc2tpcHBlZC4gIFN0dWJkb20ncyBkb24n
dCBzdXBwb3J0IE1TSS1YLCBzbwp0aGF0IFBDSSBjYXBhYmlsaXR5IG11c3QgYmUgaGlkZGVuIGZy
b20gcGFzc2VkIHRocm91Z2ggZGV2aWNlcy4KClN0dWJkb20gbW9kZSBpcyBlbmFibGVkIGJ5IHRo
ZSBuZXcgLXhlbi1zdHViZG9tIGZsYWcuCgpKYXNvbiBBbmRyeXVrICg1KToKICB4ZW46IEludHJv
ZHVjZSAteGVuLXN0dWJkb20gb3B0aW9uCiAgeGVuOiBNb3ZlIHhlbnN0b3JlIGluaXRpYWxpemF0
aW9uIHRvIGNvbW1vbiBsb2NhdGlvbgogIHhlbjogU2tpcCBiYWNrZW5kIGluaXRpYWxpemF0aW9u
IGZvciBzdHViZG9tCiAgeGVuOiBTZXQgSFZNX1BBUkFNX0RNX0RPTUFJTiBmb3Igc3R1YmRvbSBv
biBvbGRlciBYZW4KICB4ZW4tcHQ6IEhpZGUgTVNJLVggZnJvbSB4ZW4gc3R1YmRvbXMKClNpbW9u
IEdhaXNlciAoMSk6CiAgeGVuLXB0OiBSb3VuZCBwY2kgcmVnaW9ucyBzaXplcyB0byBYRU5fUEFH
RV9TSVpFCgogaHcvaTM4Ni94ZW4veGVuLWh2bS5jICAgICAgIHwgMjIgKysrKysrKysrKysrKysr
Ky0tLS0tLQogaHcveGVuL3hlbi1sZWdhY3ktYmFja2VuZC5jIHwgIDggLS0tLS0tLS0KIGh3L3hl
bi94ZW5fcHQuYyAgICAgICAgICAgICB8IDEwICsrKysrKystLS0KIGh3L3hlbi94ZW5fcHRfY29u
ZmlnX2luaXQuYyB8ICAzICsrKwogaW5jbHVkZS9ody94ZW4veGVuLmggICAgICAgIHwgIDYgKysr
KysrCiBpbmNsdWRlL2h3L3hlbi94ZW5fY29tbW9uLmggfCAgNSArKysrKwogcWVtdS1vcHRpb25z
Lmh4ICAgICAgICAgICAgIHwgIDcgKysrKysrKwogdmwuYyAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDggKysrKysrKysKIDggZmlsZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKSwgMTcgZGVs
ZXRpb25zKC0pCgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
