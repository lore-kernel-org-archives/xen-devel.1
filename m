From: Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 0/3] machine: Make compat_props arrays shorter
 and more readable
Date: Mon,  7 Jan 2019 17:30:17 -0200
Message-ID: <20190107193020.21744-1-ehabkost@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/vLk=PP=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1ggabQ-0001jr-E5
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 19:30:24 +0000
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

Q3VycmVudCBkZWNsYXJhdGlvbnMgb2YgY29tcGF0X3Byb3BzIGFycmF5cyBhcmUgdmVyeSB2ZXJi
b3NlLAp3aXRoIGVhY2ggZW50cnkgdGFraW5nIDQgbGluZXMgb2YgY29kZS4gIEJ5IG9taXR0aW5n
IHRoZSBmaWVsZApkZXNpZ25hdG9ycywgd2UgY2FuIG1ha2UgZWFjaCBhcnJheSBlbnRyeSBmaXQg
YSBzaW5nbGUgbGluZSBvZgpjb2RlIGFuZCBiZSBtb3JlIHJlYWRhYmxlLgoKRWR1YXJkbyBIYWJr
b3N0ICgzKToKICBzcGFwcjogRWxpbWluYXRlIFNQQVBSX1BDSV8yXzdfTU1JT19XSU5fU0laRSBt
YWNybwogIG1hY2hpbmU6IEVsaW1pbmF0ZSB1bm5lY2Vzc2FyeSBzdHJpbmdpZnkoKSB1c2FnZQog
IG1hY2hpbmU6IFVzZSBzaG9ydGVyIGZvcm1hdCBmb3IgR2xvYmFsUHJvcGVydHkgYXJyYXlzCgog
aW5jbHVkZS9ody9pMzg2L3BjLmggICAgICAgIHwgIDE4ICstCiBpbmNsdWRlL2h3L3BjaS1ob3N0
L3NwYXByLmggfCAgIDEgLQogaHcvY29yZS9tYWNoaW5lLmMgICAgICAgICAgIHwgMzM4ICsrKyst
LS0tLS0tLS0tLS0tCiBody9pMzg2L3BjLmMgICAgICAgICAgICAgICAgfCA3MjAgKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBody9pMzg2L3BjX3BpaXguYyAgICAgICAgICAg
fCAxOTIgKystLS0tLS0tLQogaHcvcHBjL3NwYXByLmMgICAgICAgICAgICAgIHwgIDcyICstLS0K
IGh3L3MzOTB4L3MzOTAtdmlydGlvLWNjdy5jICB8ICA3NSArLS0tCiBody94ZW4veGVuLWNvbW1v
bi5jICAgICAgICAgfCAgMTggKy0KIDggZmlsZXMgY2hhbmdlZCwgMjY1IGluc2VydGlvbnMoKyks
IDExNjkgZGVsZXRpb25zKC0pCgotLSAKMi4xOC4wLnJjMS4xLmczZjFmZjIxNDAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
