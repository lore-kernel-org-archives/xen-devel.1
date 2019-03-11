From: Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH 3/6] xen: Skip backend initialization for stubdom
Date: Mon, 11 Mar 2019 14:02:13 -0400
Message-ID: <20190311180216.18811-4-jandryuk@gmail.com>
References: <20190311180216.18811-1-jandryuk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TSWV=RO=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1h3PGl-0001EU-Ix
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 18:03:23 +0000
Received: by mail-qt1-x842.google.com with SMTP id f11so6126752qti.7
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2019 11:03:22 -0700 (PDT)
In-Reply-To: <20190311180216.18811-1-jandryuk@gmail.com>
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

V2hlbiBRRU1VIGlzIHJ1bm5pbmcgaW4gYSBzdHViZG9tLCBpdCBkb2VzIG5vdCBwcm92aWRlIGFu
eQpQYXJhdmlydHVhbGl6ZWQgYmFja2VuZHMuICBUaG9zZSBzdGlsbCBydW4gaW4gZG9tMCBvciBh
bm90aGVyIGRyaXZlcgpkb21haW4uICBUaGVyZWZvcmUgd2Ugc2tpcCBiYWNrZW5kIGluaXRpYWxp
emF0aW9uICh4ZW5fYnVzX2luaXQgYW5kCnhlbl9iZV9pbml0KSBmb3IgdGhlIHN0dWJkb20gY2Fz
ZS4KCk9yaWdpbmFsIHBhdGNoIGJ5IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPgoKU2lnbmVkLW9mZi1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29t
PgotLS0KIGh3L2kzODYveGVuL3hlbi1odm0uYyB8IDE2ICsrKysrKysrKy0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
aHcvaTM4Ni94ZW4veGVuLWh2bS5jIGIvaHcvaTM4Ni94ZW4veGVuLWh2bS5jCmluZGV4IGMyMGM0
YjI3ZjYuLjRiNjJmMDcwY2IgMTAwNjQ0Ci0tLSBhL2h3L2kzODYveGVuL3hlbi1odm0uYworKysg
Yi9ody9pMzg2L3hlbi94ZW4taHZtLmMKQEAgLTE0ODUsOCArMTQ4NSw2IEBAIHZvaWQgeGVuX2h2
bV9pbml0KFBDTWFjaGluZVN0YXRlICpwY21zLCBNZW1vcnlSZWdpb24gKipyYW1fbWVtb3J5KQog
ICAgIFFMSVNUX0lOSVQoJnN0YXRlLT5kZXZfbGlzdCk7CiAgICAgZGV2aWNlX2xpc3RlbmVyX3Jl
Z2lzdGVyKCZzdGF0ZS0+ZGV2aWNlX2xpc3RlbmVyKTsKIAotICAgIHhlbl9idXNfaW5pdCgpOwot
CiAgICAgeGVuc3RvcmUgPSB4c19vcGVuKDApOwogICAgIGlmICgheGVuc3RvcmUpIHsKICAgICAg
ICAgZXJyb3JfcmVwb3J0KCJDYW4ndCBjb25uZWN0IHRvIHhlbnN0b3JlZCIpOwpAQCAtMTQ5NSwx
MiArMTQ5MywxNiBAQCB2b2lkIHhlbl9odm1faW5pdChQQ01hY2hpbmVTdGF0ZSAqcGNtcywgTWVt
b3J5UmVnaW9uICoqcmFtX21lbW9yeSkKIAogICAgIHFlbXVfc2V0X2ZkX2hhbmRsZXIoeHNfZmls
ZW5vKHhlbnN0b3JlKSwgeGVuc3RvcmVfdXBkYXRlLCBOVUxMLCBOVUxMKTsKIAotICAgIC8qIElu
aXRpYWxpemUgYmFja2VuZCBjb3JlICYgZHJpdmVycyAqLwotICAgIGlmICh4ZW5fYmVfaW5pdCgp
ICE9IDApIHsKLSAgICAgICAgZXJyb3JfcmVwb3J0KCJ4ZW4gYmFja2VuZCBjb3JlIHNldHVwIGZh
aWxlZCIpOwotICAgICAgICBnb3RvIGVycjsKKyAgICBpZiAoIXhlbl9zdHViZG9tX2VuYWJsZWQo
KSkgeworICAgICAgICB4ZW5fYnVzX2luaXQoKTsKKworICAgICAgICAvKiBJbml0aWFsaXplIGJh
Y2tlbmQgY29yZSAmIGRyaXZlcnMgKi8KKyAgICAgICAgaWYgKHhlbl9iZV9pbml0KCkgIT0gMCkg
eworICAgICAgICAgICAgZXJyb3JfcmVwb3J0KCJ4ZW4gYmFja2VuZCBjb3JlIHNldHVwIGZhaWxl
ZCIpOworICAgICAgICAgICAgZ290byBlcnI7CisgICAgICAgIH0KKyAgICAgICAgeGVuX2JlX3Jl
Z2lzdGVyX2NvbW1vbigpOwogICAgIH0KLSAgICB4ZW5fYmVfcmVnaXN0ZXJfY29tbW9uKCk7CiAK
ICAgICBRTElTVF9JTklUKCZ4ZW5fcGh5c21hcCk7CiAgICAgeGVuX3JlYWRfcGh5c21hcChzdGF0
ZSk7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
