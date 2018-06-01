From: Thomas Garnier <thgarnie@google.com>
Subject: Re: [PATCH v4 18/27] xen: Adapt assembly for PIE support
Date: Fri, 1 Jun 2018 08:53:21 -0700
Message-ID: <CAJcbSZEAo2G_nAwdPVYWr5WxKUEb5HnfzUjewzQo+p1jpfPDMw__3735.73889160088$1527868339$gmane$org@mail.gmail.com>
References: <20180529221625.33541-1-thgarnie@google.com>
 <20180529221625.33541-19-thgarnie@google.com>
 <cfd5f012-4ce2-639b-9ff0-4ad627805fd4@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/vvh=it=google.com=thgarnie@srs-us1.protection.inumbo.net>)
 id 1fOmMw-0001tq-K2
 for xen-devel@lists.xenproject.org; Fri, 01 Jun 2018 15:53:34 +0000
Received: by mail-it0-x244.google.com with SMTP id m194-v6so2377506itg.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Jun 2018 08:53:32 -0700 (PDT)
In-Reply-To: <cfd5f012-4ce2-639b-9ff0-4ad627805fd4@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Kate Stewart <kstewart@linuxfoundation.org>, Kernel Hardening <kernel-hardening@lists.openwall.com>, Greg KH <gregkh@linuxfoundation.org>, "H . J . Lu" <hjl.tools@gmail.com>, the arch/x86 maintainers <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKdW4gMSwgMjAxOCBhdCA4OjQwIEFNIEJvcmlzIE9zdHJvdnNreQo8Ym9yaXMub3N0
cm92c2t5QG9yYWNsZS5jb20+IHdyb3RlOgo+Cj4gT24gMDUvMjkvMjAxOCAwNjoxNSBQTSwgVGhv
bWFzIEdhcm5pZXIgd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3hlbi1wdmgu
UyBiL2FyY2gveDg2L3hlbi94ZW4tcHZoLlMKPiA+IGluZGV4IGNhMmQzYjJiZjJhZi4uODJiYTg5
YmE4YmIzIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC94ODYveGVuL3hlbi1wdmguUwo+ID4gKysrIGIv
YXJjaC94ODYveGVuL3hlbi1wdmguUwo+ID4gQEAgLTExNCw4ICsxMTQsOCBAQCBFTlRSWShwdmhf
c3RhcnRfeGVuKQo+ID4gICAgICAgY2FsbCB4ZW5fcHJlcGFyZV9wdmgKPiA+Cj4gPiAgICAgICAv
KiBzdGFydHVwXzY0IGV4cGVjdHMgYm9vdF9wYXJhbXMgaW4gJXJzaS4gKi8KPiA+IC0gICAgIG1v
diAkX3BhKHB2aF9ib290cGFyYW1zKSwgJXJzaQo+ID4gLSAgICAgbW92ICRfcGEoc3RhcnR1cF82
NCksICVyYXgKPiA+ICsgICAgIG1vdmFicyAkX3BhKHB2aF9ib290cGFyYW1zKSwgJXJzaQo+ID4g
KyAgICAgbW92YWJzICRfcGEoc3RhcnR1cF82NCksICVyYXgKPiA+ICAgICAgIGptcCAqJXJheAo+
ID4KPiA+ICAjZWxzZSAvKiBDT05GSUdfWDg2XzY0ICovCj4gPiBAQCAtMTYxLDEwICsxNjEsMTUg
QEAgRU5EKHB2aF9zdGFydF94ZW4pCj4gPgo+ID4gICAgICAgLnNlY3Rpb24gIi5pbml0LmRhdGEi
LCJhdyIKPiA+ICAgICAgIC5iYWxpZ24gOAo+ID4gKyAgICAgLyoKPiA+ICsgICAgICAqIFVzZSBh
IHF1YWQgZm9yIF9wYShnZHRfc3RhcnQpIGJlY2F1c2UgUElFIGRvZXMgbm90IHVuZGVyc3RhbmQg
YQo+ID4gKyAgICAgICogbG9uZyBpcyBlbm91Z2guIFRoZSByZXN1bHRpbmcgdmFsdWUgd2lsbCBz
dGlsbCBiZSBpbiB0aGUgbG93ZXIgbG9uZwo+ID4gKyAgICAgICogcGFydC4KPiA+ICsgICAgICAq
Lwo+ID4gIGdkdDoKPiA+ICAgICAgIC53b3JkIGdkdF9lbmQgLSBnZHRfc3RhcnQKPiA+IC0gICAg
IC5sb25nIF9wYShnZHRfc3RhcnQpCj4gPiAtICAgICAud29yZCAwCj4gPiArICAgICAucXVhZCBf
cGEoZ2R0X3N0YXJ0KQo+Cj4KPiBXaXRoIHRoaXMgYmVjb21pbmcgLnF1YWQgMzItYml0IGNvbXBp
bGF0aW9uIGZhaWxzOgo+Cj4gL2RhdGEvcm9vdC9saW51eC9hcmNoL3g4Ni94ZW4veGVuLXB2aC5T
OiBBc3NlbWJsZXIgbWVzc2FnZXM6Cj4gL2RhdGEvcm9vdC9saW51eC9hcmNoL3g4Ni94ZW4veGVu
LXB2aC5TOjE0NzogRXJyb3I6IGNhbm5vdCByZXByZXNlbnQKPiByZWxvY2F0aW9uIHR5cGUgQkZE
X1JFTE9DXzY0CgpUaGFua3MsIEkgd2lsbCBsb29rIHRvIGZpeCB0aGlzIGluIHRoZSBuZXh0IHBh
dGNoIHNldCBhbmQgcnVuIGEgZnVsbAozMi1iaXQgYnVpbGQuCgo+Cj4KPiAtYm9yaXMKPgo+Cj4g
PiArICAgICAuYmFsaWduIDgKPiA+ICBnZHRfc3RhcnQ6Cj4gPiAgICAgICAucXVhZCAweDAwMDAw
MDAwMDAwMDAwMDAgICAgICAgICAgICAvKiBOVUxMIGRlc2NyaXB0b3IgKi8KPiA+ICAjaWZkZWYg
Q09ORklHX1g4Nl82NAo+CgoKLS0gClRob21hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
