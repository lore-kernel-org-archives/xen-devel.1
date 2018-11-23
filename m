From: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH for-3.2 v3 08/14] qdev-props: convert
 global_props to GArray
Date: Fri, 23 Nov 2018 15:26:58 +0100
Message-ID: <20181123152658.76547154@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
 <20181107123652.23417-9-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2kz0=oc=redhat.com=imammedo@srs-us1.protection.inumbo.net>)
 id 1gQCQJ-0008Cm-HZ
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 14:27:11 +0000
In-Reply-To: <20181107123652.23417-9-marcandre.lureau@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, =?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>, "Michael S. Tsirkin" <mst@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>, Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>, Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAgNyBOb3YgMjAxOCAxNjozNjo0NiArMDQwMApNYXJjLUFuZHLDqSBMdXJlYXUgPG1h
cmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbT4gd3JvdGU6Cgo+IEEgc3RlcCB0b3dhcmRzIGJlaW5n
IGFibGUgdG8gY2FsbCBvYmplY3RfYXBwbHlfZ2xvYmFsX3Byb3BzKCkuCml0IGFsc28gbWFrZXMg
Y29kZSBtb3JlIHVuaWZvcm0gYXMgd2UgZG9uJ3QgaGF2ZSB0byBkZWFsIHdpdGggdHlwZQppbmZv
cm0gb2YgR0xpc3QuCgptYXliZSBtb3ZlIGl0IGF0IHRoZSBiZWdpbm5pbmcgb2Ygc2VyaWVzIGFu
ZCBpbmNsdWRlIGFjY2VsIHBhcnQgYXMgd2VsbD8KCm90aGVyd2lzZSBsb29rcyBnb29kCgoKCj4g
U2lnbmVkLW9mZi1ieTogTWFyYy1BbmRyw6kgTHVyZWF1IDxtYXJjYW5kcmUubHVyZWF1QHJlZGhh
dC5jb20+Cj4gLS0tCj4gIGh3L2NvcmUvcWRldi1wcm9wZXJ0aWVzLmMgfCAyOSArKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwg
OSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaHcvY29yZS9xZGV2LXByb3BlcnRpZXMu
YyBiL2h3L2NvcmUvcWRldi1wcm9wZXJ0aWVzLmMKPiBpbmRleCA0M2MzMGE1N2Y0Li4zNTNlNjdj
MDVhIDEwMDY0NAo+IC0tLSBhL2h3L2NvcmUvcWRldi1wcm9wZXJ0aWVzLmMKPiArKysgYi9ody9j
b3JlL3FkZXYtcHJvcGVydGllcy5jCj4gQEAgLTExNzMsMjIgKzExNzMsMzIgQEAgdm9pZCBxZGV2
X3Byb3Bfc2V0X3B0cihEZXZpY2VTdGF0ZSAqZGV2LCBjb25zdCBjaGFyICpuYW1lLCB2b2lkICp2
YWx1ZSkKPiAgICAgICpwdHIgPSB2YWx1ZTsKPiAgfQo+ICAKPiAtc3RhdGljIEdMaXN0ICpnbG9i
YWxfcHJvcHM7Cj4gK3N0YXRpYyBHQXJyYXkgKmdsb2JhbF9wcm9wcyh2b2lkKQo+ICt7Cj4gKyAg
ICBzdGF0aWMgR0FycmF5ICpncDsKPiArCj4gKyAgICBpZiAoIWdwKSB7Cj4gKyAgICAgICAgZ3Ag
PSBnX2FycmF5X25ldyhmYWxzZSwgZmFsc2UsIHNpemVvZihHbG9iYWxQcm9wZXJ0eSAqKSk7Cj4g
KyAgICB9Cj4gKwo+ICsgICAgcmV0dXJuIGdwOwo+ICt9Cj4gIAo+ICB2b2lkIHFkZXZfcHJvcF9y
ZWdpc3Rlcl9nbG9iYWwoR2xvYmFsUHJvcGVydHkgKnByb3ApCj4gIHsKPiAtICAgIGdsb2JhbF9w
cm9wcyA9IGdfbGlzdF9hcHBlbmQoZ2xvYmFsX3Byb3BzLCBwcm9wKTsKPiArICAgIGdfYXJyYXlf
YXBwZW5kX3ZhbChnbG9iYWxfcHJvcHMoKSwgcHJvcCk7Cj4gIH0KPiAgCj4gIGludCBxZGV2X3By
b3BfY2hlY2tfZ2xvYmFscyh2b2lkKQo+ICB7Cj4gLSAgICBHTGlzdCAqbDsKPiAtICAgIGludCBy
ZXQgPSAwOwo+ICsgICAgaW50IGksIHJldCA9IDA7Cj4gIAo+IC0gICAgZm9yIChsID0gZ2xvYmFs
X3Byb3BzOyBsOyBsID0gbC0+bmV4dCkgewo+IC0gICAgICAgIEdsb2JhbFByb3BlcnR5ICpwcm9w
ID0gbC0+ZGF0YTsKPiArICAgIGZvciAoaSA9IDA7IGkgPCBnbG9iYWxfcHJvcHMoKS0+bGVuOyBp
KyspIHsKPiArICAgICAgICBHbG9iYWxQcm9wZXJ0eSAqcHJvcDsKPiAgICAgICAgICBPYmplY3RD
bGFzcyAqb2M7Cj4gICAgICAgICAgRGV2aWNlQ2xhc3MgKmRjOwo+ICsKPiArICAgICAgICBwcm9w
ID0gZ19hcnJheV9pbmRleChnbG9iYWxfcHJvcHMoKSwgR2xvYmFsUHJvcGVydHkgKiwgaSk7Cj4g
ICAgICAgICAgaWYgKHByb3AtPnVzZWQpIHsKPiAgICAgICAgICAgICAgY29udGludWU7Cj4gICAg
ICAgICAgfQo+IEBAIC0xMjEzLDEyICsxMjIzLDEzIEBAIGludCBxZGV2X3Byb3BfY2hlY2tfZ2xv
YmFscyh2b2lkKQo+ICAKPiAgdm9pZCBxZGV2X3Byb3Bfc2V0X2dsb2JhbHMoRGV2aWNlU3RhdGUg
KmRldikKPiAgewo+IC0gICAgR0xpc3QgKmw7Cj4gKyAgICBpbnQgaTsKPiAgCj4gLSAgICBmb3Ig
KGwgPSBnbG9iYWxfcHJvcHM7IGw7IGwgPSBsLT5uZXh0KSB7Cj4gLSAgICAgICAgR2xvYmFsUHJv
cGVydHkgKnByb3AgPSBsLT5kYXRhOwo+ICsgICAgZm9yIChpID0gMDsgaSA8IGdsb2JhbF9wcm9w
cygpLT5sZW47IGkrKykgewo+ICsgICAgICAgIEdsb2JhbFByb3BlcnR5ICpwcm9wOwo+ICAgICAg
ICAgIEVycm9yICplcnIgPSBOVUxMOwo+ICAKPiArICAgICAgICBwcm9wID0gZ19hcnJheV9pbmRl
eChnbG9iYWxfcHJvcHMoKSwgR2xvYmFsUHJvcGVydHkgKiwgaSk7Cj4gICAgICAgICAgaWYgKG9i
amVjdF9keW5hbWljX2Nhc3QoT0JKRUNUKGRldiksIHByb3AtPmRyaXZlcikgPT0gTlVMTCkgewo+
ICAgICAgICAgICAgICBjb250aW51ZTsKPiAgICAgICAgICB9CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
