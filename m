From: Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 1/3] spapr: Eliminate
 SPAPR_PCI_2_7_MMIO_WIN_SIZE macro
Date: Mon,  7 Jan 2019 17:30:18 -0200
Message-ID: <20190107193020.21744-2-ehabkost@redhat.com>
References: <20190107193020.21744-1-ehabkost@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/vLk=PP=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1ggabc-0001l5-99
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 19:30:36 +0000
In-Reply-To: <20190107193020.21744-1-ehabkost@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

VGhlIG1hY3JvIGlzIG9ubHkgdXNlZCBpbiBvbmUgcGxhY2UsIHdoZXJlIHRoZSBwdXJwb3NlIG9m
IHRoZQp2YWx1ZSBpcyBvYnZpb3VzLiAgRWxpbWluYXRlIHRoZSBtYWNybyBzbyB3ZSBkb24ndCBu
ZWVkIHRvIHJlbHkKb24gc3RyaW5naWZ5KCkuCgpTaWduZWQtb2ZmLWJ5OiBFZHVhcmRvIEhhYmtv
c3QgPGVoYWJrb3N0QHJlZGhhdC5jb20+Ci0tLQogaW5jbHVkZS9ody9wY2ktaG9zdC9zcGFwci5o
IHwgMSAtCiBody9wcGMvc3BhcHIuYyAgICAgICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
aHcvcGNpLWhvc3Qvc3BhcHIuaCBiL2luY2x1ZGUvaHcvcGNpLWhvc3Qvc3BhcHIuaAppbmRleCA3
YzY2YzM4NzJmLi5hODVhOTk1YjZjIDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L3BjaS1ob3N0L3Nw
YXByLmgKKysrIGIvaW5jbHVkZS9ody9wY2ktaG9zdC9zcGFwci5oCkBAIC05OSw3ICs5OSw2IEBA
IHN0cnVjdCBzUEFQUlBIQlN0YXRlIHsKICNkZWZpbmUgU1BBUFJfUENJX0JBU0UgICAgICAgICAg
ICAgICAoMVVMTCA8PCA0NSkgLyogMzIgVGlCICovCiAjZGVmaW5lIFNQQVBSX1BDSV9MSU1JVCAg
ICAgICAgICAgICAgKDFVTEwgPDwgNDYpIC8qIDY0IFRpQiAqLwogCi0jZGVmaW5lIFNQQVBSX1BD
SV8yXzdfTU1JT19XSU5fU0laRSAgMHhmODAwMDAwMDAKICNkZWZpbmUgU1BBUFJfUENJX0lPX1dJ
Tl9TSVpFICAgICAgICAweDEwMDAwCiAKICNkZWZpbmUgU1BBUFJfUENJX01TSV9XSU5ET1cgICAg
ICAgICAweDQwMDAwMDAwMDAwVUxMCmRpZmYgLS1naXQgYS9ody9wcGMvc3BhcHIuYyBiL2h3L3Bw
Yy9zcGFwci5jCmluZGV4IDU2NzE2MDhjZWEuLmJmZjQyZjBhZGIgMTAwNjQ0Ci0tLSBhL2h3L3Bw
Yy9zcGFwci5jCisrKyBiL2h3L3BwYy9zcGFwci5jCkBAIC00MjI1LDcgKzQyMjUsNyBAQCBzdGF0
aWMgdm9pZCBzcGFwcl9tYWNoaW5lXzJfN19jbGFzc19vcHRpb25zKE1hY2hpbmVDbGFzcyAqbWMp
CiAgICAgICAgIHsKICAgICAgICAgICAgIC5kcml2ZXIgICA9IFRZUEVfU1BBUFJfUENJX0hPU1Rf
QlJJREdFLAogICAgICAgICAgICAgLnByb3BlcnR5ID0gIm1lbV93aW5fc2l6ZSIsCi0gICAgICAg
ICAgICAudmFsdWUgICAgPSBzdHJpbmdpZnkoU1BBUFJfUENJXzJfN19NTUlPX1dJTl9TSVpFKSwK
KyAgICAgICAgICAgIC52YWx1ZSAgICA9ICIweGY4MDAwMDAwMCIsCiAgICAgICAgIH0sCiAgICAg
ICAgIHsKICAgICAgICAgICAgIC5kcml2ZXIgICA9IFRZUEVfU1BBUFJfUENJX0hPU1RfQlJJREdF
LAotLSAKMi4xOC4wLnJjMS4xLmczZjFmZjIxNDAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
