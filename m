From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH for-3.2 v3 01/14] tests:
 qdev_prop_check_globals() doesn't return "all_used"
Date: Wed,  7 Nov 2018 16:36:39 +0400
Message-ID: <20181107123652.23417-2-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zb54=ns=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1gKN57-00059N-UF
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 12:37:13 +0000
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

SW5zdGVhZCwgaXQgcmV0dXJucyAxIGlmIGFuIGVycm9yIHdhcyBkZXRlY3RlZCwgd2hpY2ggaXMg
dGhlIGNhc2UgZm9yOgoKL3FkZXYvcHJvcGVydGllcy9keW5hbWljL2dsb2JhbC9zdWJwcm9jZXNz
Ogp3YXJuaW5nOiBnbG9iYWwgZHluYW1pYy1wcm9wLXR5cGUtYmFkLnByb3AzIGhhcyBpbnZhbGlk
IGNsYXNzIG5hbWUKd2FybmluZzogZ2xvYmFsIG5vaG90cGx1Zy10eXBlLnByb3A1PTEwNSBub3Qg
dXNlZAp3YXJuaW5nOiBnbG9iYWwgbm9uZGV2aWNlLXR5cGUucHJvcDYgaGFzIGludmFsaWQgY2xh
c3MgbmFtZQoKQ2xhcmlmeSB0aGUgZnVuY3Rpb24gcmV0dXJuIHZhbHVlLgoKU2lnbmVkLW9mZi1i
eTogTWFyYy1BbmRyw6kgTHVyZWF1IDxtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20+Ci0tLQog
dGVzdHMvdGVzdC1xZGV2LWdsb2JhbC1wcm9wcy5jIHwgMTIgKysrKysrLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rl
c3RzL3Rlc3QtcWRldi1nbG9iYWwtcHJvcHMuYyBiL3Rlc3RzL3Rlc3QtcWRldi1nbG9iYWwtcHJv
cHMuYwppbmRleCBkODFiMDg2MmQ1Li5jY2RmNmM1N2MxIDEwMDY0NAotLS0gYS90ZXN0cy90ZXN0
LXFkZXYtZ2xvYmFsLXByb3BzLmMKKysrIGIvdGVzdHMvdGVzdC1xZGV2LWdsb2JhbC1wcm9wcy5j
CkBAIC0yMTQsNyArMjE0LDcgQEAgc3RhdGljIHZvaWQgdGVzdF9keW5hbWljX2dsb2JhbHByb3Bf
c3VicHJvY2Vzcyh2b2lkKQogICAgICAgICB7IFRZUEVfTk9OREVWSUNFLCAicHJvcDYiLCAiMTA2
IiwgdHJ1ZSB9LAogICAgICAgICB7fQogICAgIH07Ci0gICAgaW50IGFsbF91c2VkOworICAgIGlu
dCBnbG9iYWxfZXJyb3I7CiAKICAgICBxZGV2X3Byb3BfcmVnaXN0ZXJfZ2xvYmFsX2xpc3QocHJv
cHMpOwogCkBAIC0yMjMsOCArMjIzLDggQEAgc3RhdGljIHZvaWQgdGVzdF9keW5hbWljX2dsb2Jh
bHByb3Bfc3VicHJvY2Vzcyh2b2lkKQogCiAgICAgZ19hc3NlcnRfY21wdWludChtdC0+cHJvcDEs
ID09LCAxMDEpOwogICAgIGdfYXNzZXJ0X2NtcHVpbnQobXQtPnByb3AyLCA9PSwgMTAyKTsKLSAg
ICBhbGxfdXNlZCA9IHFkZXZfcHJvcF9jaGVja19nbG9iYWxzKCk7Ci0gICAgZ19hc3NlcnRfY21w
dWludChhbGxfdXNlZCwgPT0sIDEpOworICAgIGdsb2JhbF9lcnJvciA9IHFkZXZfcHJvcF9jaGVj
a19nbG9iYWxzKCk7CisgICAgZ19hc3NlcnRfY21wdWludChnbG9iYWxfZXJyb3IsID09LCAxKTsK
ICAgICBnX2Fzc2VydChwcm9wc1swXS51c2VkKTsKICAgICBnX2Fzc2VydChwcm9wc1sxXS51c2Vk
KTsKICAgICBnX2Fzc2VydCghcHJvcHNbMl0udXNlZCk7CkBAIC0yNTksNyArMjU5LDcgQEAgc3Rh
dGljIHZvaWQgdGVzdF9keW5hbWljX2dsb2JhbHByb3Bfbm91c2VyX3N1YnByb2Nlc3Modm9pZCkK
ICAgICAgICAgeyBUWVBFX05PTkRFVklDRSwgInByb3A2IiwgIjEwNiIgfSwKICAgICAgICAge30K
ICAgICB9OwotICAgIGludCBhbGxfdXNlZDsKKyAgICBpbnQgZ2xvYmFsX2Vycm9yOwogCiAgICAg
cWRldl9wcm9wX3JlZ2lzdGVyX2dsb2JhbF9saXN0KHByb3BzKTsKIApAQCAtMjY4LDggKzI2OCw4
IEBAIHN0YXRpYyB2b2lkIHRlc3RfZHluYW1pY19nbG9iYWxwcm9wX25vdXNlcl9zdWJwcm9jZXNz
KHZvaWQpCiAKICAgICBnX2Fzc2VydF9jbXB1aW50KG10LT5wcm9wMSwgPT0sIDEwMSk7CiAgICAg
Z19hc3NlcnRfY21wdWludChtdC0+cHJvcDIsID09LCAxMDIpOwotICAgIGFsbF91c2VkID0gcWRl
dl9wcm9wX2NoZWNrX2dsb2JhbHMoKTsKLSAgICBnX2Fzc2VydF9jbXB1aW50KGFsbF91c2VkLCA9
PSwgMCk7CisgICAgZ2xvYmFsX2Vycm9yID0gcWRldl9wcm9wX2NoZWNrX2dsb2JhbHMoKTsKKyAg
ICBnX2Fzc2VydF9jbXB1aW50KGdsb2JhbF9lcnJvciwgPT0sIDApOwogICAgIGdfYXNzZXJ0KHBy
b3BzWzBdLnVzZWQpOwogICAgIGdfYXNzZXJ0KHByb3BzWzFdLnVzZWQpOwogICAgIGdfYXNzZXJ0
KCFwcm9wc1syXS51c2VkKTsKLS0gCjIuMTkuMS43MDguZzRlZGUzZDQyZGYKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
