From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH for-3.2 v3 08/14] qdev-props: convert
 global_props to GArray
Date: Wed,  7 Nov 2018 16:36:46 +0400
Message-ID: <20181107123652.23417-9-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zb54=ns=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1gKN67-0005WR-NK
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 12:38:15 +0000
In-Reply-To: <20181107123652.23417-1-marcandre.lureau@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>, "Michael S. Tsirkin" <mst@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, dgilbert@redhat.com, Eduardo Habkost <ehabkost@redhat.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Igor Mammedov <imammedo@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

QSBzdGVwIHRvd2FyZHMgYmVpbmcgYWJsZSB0byBjYWxsIG9iamVjdF9hcHBseV9nbG9iYWxfcHJv
cHMoKS4KClNpZ25lZC1vZmYtYnk6IE1hcmMtQW5kcsOpIEx1cmVhdSA8bWFyY2FuZHJlLmx1cmVh
dUByZWRoYXQuY29tPgotLS0KIGh3L2NvcmUvcWRldi1wcm9wZXJ0aWVzLmMgfCAyOSArKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcvY29yZS9xZGV2LXByb3BlcnRpZXMuYyBi
L2h3L2NvcmUvcWRldi1wcm9wZXJ0aWVzLmMKaW5kZXggNDNjMzBhNTdmNC4uMzUzZTY3YzA1YSAx
MDA2NDQKLS0tIGEvaHcvY29yZS9xZGV2LXByb3BlcnRpZXMuYworKysgYi9ody9jb3JlL3FkZXYt
cHJvcGVydGllcy5jCkBAIC0xMTczLDIyICsxMTczLDMyIEBAIHZvaWQgcWRldl9wcm9wX3NldF9w
dHIoRGV2aWNlU3RhdGUgKmRldiwgY29uc3QgY2hhciAqbmFtZSwgdm9pZCAqdmFsdWUpCiAgICAg
KnB0ciA9IHZhbHVlOwogfQogCi1zdGF0aWMgR0xpc3QgKmdsb2JhbF9wcm9wczsKK3N0YXRpYyBH
QXJyYXkgKmdsb2JhbF9wcm9wcyh2b2lkKQoreworICAgIHN0YXRpYyBHQXJyYXkgKmdwOworCisg
ICAgaWYgKCFncCkgeworICAgICAgICBncCA9IGdfYXJyYXlfbmV3KGZhbHNlLCBmYWxzZSwgc2l6
ZW9mKEdsb2JhbFByb3BlcnR5ICopKTsKKyAgICB9CisKKyAgICByZXR1cm4gZ3A7Cit9CiAKIHZv
aWQgcWRldl9wcm9wX3JlZ2lzdGVyX2dsb2JhbChHbG9iYWxQcm9wZXJ0eSAqcHJvcCkKIHsKLSAg
ICBnbG9iYWxfcHJvcHMgPSBnX2xpc3RfYXBwZW5kKGdsb2JhbF9wcm9wcywgcHJvcCk7CisgICAg
Z19hcnJheV9hcHBlbmRfdmFsKGdsb2JhbF9wcm9wcygpLCBwcm9wKTsKIH0KIAogaW50IHFkZXZf
cHJvcF9jaGVja19nbG9iYWxzKHZvaWQpCiB7Ci0gICAgR0xpc3QgKmw7Ci0gICAgaW50IHJldCA9
IDA7CisgICAgaW50IGksIHJldCA9IDA7CiAKLSAgICBmb3IgKGwgPSBnbG9iYWxfcHJvcHM7IGw7
IGwgPSBsLT5uZXh0KSB7Ci0gICAgICAgIEdsb2JhbFByb3BlcnR5ICpwcm9wID0gbC0+ZGF0YTsK
KyAgICBmb3IgKGkgPSAwOyBpIDwgZ2xvYmFsX3Byb3BzKCktPmxlbjsgaSsrKSB7CisgICAgICAg
IEdsb2JhbFByb3BlcnR5ICpwcm9wOwogICAgICAgICBPYmplY3RDbGFzcyAqb2M7CiAgICAgICAg
IERldmljZUNsYXNzICpkYzsKKworICAgICAgICBwcm9wID0gZ19hcnJheV9pbmRleChnbG9iYWxf
cHJvcHMoKSwgR2xvYmFsUHJvcGVydHkgKiwgaSk7CiAgICAgICAgIGlmIChwcm9wLT51c2VkKSB7
CiAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgfQpAQCAtMTIxMywxMiArMTIyMywxMyBA
QCBpbnQgcWRldl9wcm9wX2NoZWNrX2dsb2JhbHModm9pZCkKIAogdm9pZCBxZGV2X3Byb3Bfc2V0
X2dsb2JhbHMoRGV2aWNlU3RhdGUgKmRldikKIHsKLSAgICBHTGlzdCAqbDsKKyAgICBpbnQgaTsK
IAotICAgIGZvciAobCA9IGdsb2JhbF9wcm9wczsgbDsgbCA9IGwtPm5leHQpIHsKLSAgICAgICAg
R2xvYmFsUHJvcGVydHkgKnByb3AgPSBsLT5kYXRhOworICAgIGZvciAoaSA9IDA7IGkgPCBnbG9i
YWxfcHJvcHMoKS0+bGVuOyBpKyspIHsKKyAgICAgICAgR2xvYmFsUHJvcGVydHkgKnByb3A7CiAg
ICAgICAgIEVycm9yICplcnIgPSBOVUxMOwogCisgICAgICAgIHByb3AgPSBnX2FycmF5X2luZGV4
KGdsb2JhbF9wcm9wcygpLCBHbG9iYWxQcm9wZXJ0eSAqLCBpKTsKICAgICAgICAgaWYgKG9iamVj
dF9keW5hbWljX2Nhc3QoT0JKRUNUKGRldiksIHByb3AtPmRyaXZlcikgPT0gTlVMTCkgewogICAg
ICAgICAgICAgY29udGludWU7CiAgICAgICAgIH0KLS0gCjIuMTkuMS43MDguZzRlZGUzZDQyZGYK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
