From: Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH 2/6] xen: Move xenstore initialization to common
 location
Date: Mon, 11 Mar 2019 14:02:12 -0400
Message-ID: <20190311180216.18811-3-jandryuk@gmail.com>
References: <20190311180216.18811-1-jandryuk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TSWV=RO=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1h3PGh-0001Ce-7y
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 18:03:19 +0000
Received: by mail-qt1-x844.google.com with SMTP id s1so6129327qte.5
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2019 11:03:18 -0700 (PDT)
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

Rm9yIHRoZSB4ZW4gc3R1YmRvbSBjYXNlLCB3ZSdsbCB3YW50IHhlbnN0b3JlIGluaXRpYWxpemVk
LCBidXQgd2UnbGwKd2FudCB0byBza2lwIHRoZSByZXN0IG9mIHhlbl9iZV9pbml0LiAgTW92ZSB0
aGUgaW5pdGlhbGl6YXRpb24gdG8KeGVuX2h2bV9pbml0IHNvIHdlIGNhbiBjb25kaXRpb25hbGl6
ZSBjYWxsaW5nIHhlbl9iZV9pbml0LgoKeHNfZG9tYWluX29wZW4oKSBpcyBkZXByZWNhdGVkIGZv
ciB4c19vcGVuKDApLCBzbyBtYWtlIHRoZSByZXBsYWNlbWVudAphcyB3ZWxsLgoKU2lnbmVkLW9m
Zi1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPgotLS0KIGh3L2kzODYveGVu
L3hlbi1odm0uYyAgICAgICB8IDggKysrKysrKysKIGh3L3hlbi94ZW4tbGVnYWN5LWJhY2tlbmQu
YyB8IDggLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L2kzODYveGVuL3hlbi1odm0uYyBiL2h3L2kzODYveGVu
L3hlbi1odm0uYwppbmRleCAyOTM5MTIyZTdjLi5jMjBjNGIyN2Y2IDEwMDY0NAotLS0gYS9ody9p
Mzg2L3hlbi94ZW4taHZtLmMKKysrIGIvaHcvaTM4Ni94ZW4veGVuLWh2bS5jCkBAIC0xNDg3LDYg
KzE0ODcsMTQgQEAgdm9pZCB4ZW5faHZtX2luaXQoUENNYWNoaW5lU3RhdGUgKnBjbXMsIE1lbW9y
eVJlZ2lvbiAqKnJhbV9tZW1vcnkpCiAKICAgICB4ZW5fYnVzX2luaXQoKTsKIAorICAgIHhlbnN0
b3JlID0geHNfb3BlbigwKTsKKyAgICBpZiAoIXhlbnN0b3JlKSB7CisgICAgICAgIGVycm9yX3Jl
cG9ydCgiQ2FuJ3QgY29ubmVjdCB0byB4ZW5zdG9yZWQiKTsKKyAgICAgICAgZ290byBlcnI7Cisg
ICAgfQorCisgICAgcWVtdV9zZXRfZmRfaGFuZGxlcih4c19maWxlbm8oeGVuc3RvcmUpLCB4ZW5z
dG9yZV91cGRhdGUsIE5VTEwsIE5VTEwpOworCiAgICAgLyogSW5pdGlhbGl6ZSBiYWNrZW5kIGNv
cmUgJiBkcml2ZXJzICovCiAgICAgaWYgKHhlbl9iZV9pbml0KCkgIT0gMCkgewogICAgICAgICBl
cnJvcl9yZXBvcnQoInhlbiBiYWNrZW5kIGNvcmUgc2V0dXAgZmFpbGVkIik7CmRpZmYgLS1naXQg
YS9ody94ZW4veGVuLWxlZ2FjeS1iYWNrZW5kLmMgYi9ody94ZW4veGVuLWxlZ2FjeS1iYWNrZW5k
LmMKaW5kZXggMzZmZDFlOWIwOS4uYmRmMmZhOTE3ZiAxMDA2NDQKLS0tIGEvaHcveGVuL3hlbi1s
ZWdhY3ktYmFja2VuZC5jCisrKyBiL2h3L3hlbi94ZW4tbGVnYWN5LWJhY2tlbmQuYwpAQCAtNjgz
LDE0ICs2ODMsNiBAQCBpbnQgeGVuX2JlX2luaXQodm9pZCkKIHsKICAgICB4ZW5nbnR0YWJfaGFu
ZGxlICpnbnR0YWJkZXY7CiAKLSAgICB4ZW5zdG9yZSA9IHhzX2RhZW1vbl9vcGVuKCk7Ci0gICAg
aWYgKCF4ZW5zdG9yZSkgewotICAgICAgICB4ZW5fcHZfcHJpbnRmKE5VTEwsIDAsICJjYW4ndCBj
b25uZWN0IHRvIHhlbnN0b3JlZFxuIik7Ci0gICAgICAgIHJldHVybiAtMTsKLSAgICB9Ci0KLSAg
ICBxZW11X3NldF9mZF9oYW5kbGVyKHhzX2ZpbGVubyh4ZW5zdG9yZSksIHhlbnN0b3JlX3VwZGF0
ZSwgTlVMTCwgTlVMTCk7Ci0KICAgICBpZiAoeGVuX3hjID09IE5VTEwgfHwgeGVuX2ZtZW0gPT0g
TlVMTCkgewogICAgICAgICAvKiBDaGVjayBpZiB4ZW5faW5pdCgpIGhhdmUgYmVlbiBjYWxsZWQg
Ki8KICAgICAgICAgZ290byBlcnI7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
