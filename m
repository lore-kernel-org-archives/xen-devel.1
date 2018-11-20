From: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for-3.2 v3 01/14] tests:
 qdev_prop_check_globals() doesn't return "all_used"
Date: Tue, 20 Nov 2018 16:33:29 +0100
Message-ID: <20181120163329.6c960628@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
 <20181107123652.23417-2-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lbdb=n7=redhat.com=imammedo@srs-us1.protection.inumbo.net>)
 id 1gP82J-0002q1-AN
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 15:33:59 +0000
In-Reply-To: <20181107123652.23417-2-marcandre.lureau@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org, =?UTF-8?B?SGVy?= =?UTF-8?B?dsOp?= Poussineau <hpoussin@reactos.org>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>, Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>, Artyom Tarasenko <atar4qemu@gmail.com>, Stefan Berger <stefanb@linux.ibm.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAgNyBOb3YgMjAxOCAxNjozNjozOSArMDQwMApNYXJjLUFuZHLDqSBMdXJlYXUgPG1h
cmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbT4gd3JvdGU6Cgo+IEluc3RlYWQsIGl0IHJldHVybnMg
MSBpZiBhbiBlcnJvciB3YXMgZGV0ZWN0ZWQsIHdoaWNoIGlzIHRoZSBjYXNlIGZvcjoKPiAKPiAv
cWRldi9wcm9wZXJ0aWVzL2R5bmFtaWMvZ2xvYmFsL3N1YnByb2Nlc3M6Cj4gd2FybmluZzogZ2xv
YmFsIGR5bmFtaWMtcHJvcC10eXBlLWJhZC5wcm9wMyBoYXMgaW52YWxpZCBjbGFzcyBuYW1lCj4g
d2FybmluZzogZ2xvYmFsIG5vaG90cGx1Zy10eXBlLnByb3A1PTEwNSBub3QgdXNlZAo+IHdhcm5p
bmc6IGdsb2JhbCBub25kZXZpY2UtdHlwZS5wcm9wNiBoYXMgaW52YWxpZCBjbGFzcyBuYW1lCj4g
Cj4gQ2xhcmlmeSB0aGUgZnVuY3Rpb24gcmV0dXJuIHZhbHVlLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IE1hcmMtQW5kcsOpIEx1cmVhdSA8bWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tPgoKUmV2aWV3
ZWQtYnk6IElnb3IgTWFtbWVkb3YgPGltYW1tZWRvQHJlZGhhdC5jb20+Cgo+IC0tLQo+ICB0ZXN0
cy90ZXN0LXFkZXYtZ2xvYmFsLXByb3BzLmMgfCAxMiArKysrKystLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
dGVzdHMvdGVzdC1xZGV2LWdsb2JhbC1wcm9wcy5jIGIvdGVzdHMvdGVzdC1xZGV2LWdsb2JhbC1w
cm9wcy5jCj4gaW5kZXggZDgxYjA4NjJkNS4uY2NkZjZjNTdjMSAxMDA2NDQKPiAtLS0gYS90ZXN0
cy90ZXN0LXFkZXYtZ2xvYmFsLXByb3BzLmMKPiArKysgYi90ZXN0cy90ZXN0LXFkZXYtZ2xvYmFs
LXByb3BzLmMKPiBAQCAtMjE0LDcgKzIxNCw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfZHluYW1pY19n
bG9iYWxwcm9wX3N1YnByb2Nlc3Modm9pZCkKPiAgICAgICAgICB7IFRZUEVfTk9OREVWSUNFLCAi
cHJvcDYiLCAiMTA2IiwgdHJ1ZSB9LAo+ICAgICAgICAgIHt9Cj4gICAgICB9Owo+IC0gICAgaW50
IGFsbF91c2VkOwo+ICsgICAgaW50IGdsb2JhbF9lcnJvcjsKPiAgCj4gICAgICBxZGV2X3Byb3Bf
cmVnaXN0ZXJfZ2xvYmFsX2xpc3QocHJvcHMpOwo+ICAKPiBAQCAtMjIzLDggKzIyMyw4IEBAIHN0
YXRpYyB2b2lkIHRlc3RfZHluYW1pY19nbG9iYWxwcm9wX3N1YnByb2Nlc3Modm9pZCkKPiAgCj4g
ICAgICBnX2Fzc2VydF9jbXB1aW50KG10LT5wcm9wMSwgPT0sIDEwMSk7Cj4gICAgICBnX2Fzc2Vy
dF9jbXB1aW50KG10LT5wcm9wMiwgPT0sIDEwMik7Cj4gLSAgICBhbGxfdXNlZCA9IHFkZXZfcHJv
cF9jaGVja19nbG9iYWxzKCk7Cj4gLSAgICBnX2Fzc2VydF9jbXB1aW50KGFsbF91c2VkLCA9PSwg
MSk7Cj4gKyAgICBnbG9iYWxfZXJyb3IgPSBxZGV2X3Byb3BfY2hlY2tfZ2xvYmFscygpOwo+ICsg
ICAgZ19hc3NlcnRfY21wdWludChnbG9iYWxfZXJyb3IsID09LCAxKTsKPiAgICAgIGdfYXNzZXJ0
KHByb3BzWzBdLnVzZWQpOwo+ICAgICAgZ19hc3NlcnQocHJvcHNbMV0udXNlZCk7Cj4gICAgICBn
X2Fzc2VydCghcHJvcHNbMl0udXNlZCk7Cj4gQEAgLTI1OSw3ICsyNTksNyBAQCBzdGF0aWMgdm9p
ZCB0ZXN0X2R5bmFtaWNfZ2xvYmFscHJvcF9ub3VzZXJfc3VicHJvY2Vzcyh2b2lkKQo+ICAgICAg
ICAgIHsgVFlQRV9OT05ERVZJQ0UsICJwcm9wNiIsICIxMDYiIH0sCj4gICAgICAgICAge30KPiAg
ICAgIH07Cj4gLSAgICBpbnQgYWxsX3VzZWQ7Cj4gKyAgICBpbnQgZ2xvYmFsX2Vycm9yOwo+ICAK
PiAgICAgIHFkZXZfcHJvcF9yZWdpc3Rlcl9nbG9iYWxfbGlzdChwcm9wcyk7Cj4gIAo+IEBAIC0y
NjgsOCArMjY4LDggQEAgc3RhdGljIHZvaWQgdGVzdF9keW5hbWljX2dsb2JhbHByb3Bfbm91c2Vy
X3N1YnByb2Nlc3Modm9pZCkKPiAgCj4gICAgICBnX2Fzc2VydF9jbXB1aW50KG10LT5wcm9wMSwg
PT0sIDEwMSk7Cj4gICAgICBnX2Fzc2VydF9jbXB1aW50KG10LT5wcm9wMiwgPT0sIDEwMik7Cj4g
LSAgICBhbGxfdXNlZCA9IHFkZXZfcHJvcF9jaGVja19nbG9iYWxzKCk7Cj4gLSAgICBnX2Fzc2Vy
dF9jbXB1aW50KGFsbF91c2VkLCA9PSwgMCk7Cj4gKyAgICBnbG9iYWxfZXJyb3IgPSBxZGV2X3By
b3BfY2hlY2tfZ2xvYmFscygpOwo+ICsgICAgZ19hc3NlcnRfY21wdWludChnbG9iYWxfZXJyb3Is
ID09LCAwKTsKPiAgICAgIGdfYXNzZXJ0KHByb3BzWzBdLnVzZWQpOwo+ICAgICAgZ19hc3NlcnQo
cHJvcHNbMV0udXNlZCk7Cj4gICAgICBnX2Fzc2VydCghcHJvcHNbMl0udXNlZCk7CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
