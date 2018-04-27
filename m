From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RESEND PULL v9 00/16] xen: xen-domid-restrict
 improvements
Date: Fri, 27 Apr 2018 08:56:53 +0100
Message-ID: <CAFEAcA_z1CZY3n+d1Z65HnYZFQYm2iWeu3UhKTgd_LF55UAaYg@mail.gmail.com>
References: <23266.5953.493587.944766@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rdys=hq=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1fByFn-0006K9-U8
 for xen-devel@lists.xenproject.org; Fri, 27 Apr 2018 07:57:15 +0000
Received: by mail-oi0-x22d.google.com with SMTP id k17-v6so835071oih.5
 for <xen-devel@lists.xenproject.org>; Fri, 27 Apr 2018 00:57:14 -0700 (PDT)
In-Reply-To: <23266.5953.493587.944766@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, Anthony PERARD <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjYgQXByaWwgMjAxOCBhdCAxOToxNSwgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJp
eC5jb20+IHdyb3RlOgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYjg4NDZh
NGQ2MzUyYjJhMWQyMDEyZjhiM2I5MTE1NjQwNTI0YWVkYToKPgo+ICAgdmwuYzogbmV3IGZ1bmN0
aW9uIHNlcmlhbF9tYXhfaGRzKCkgKDIwMTgtMDQtMjYgMTM6NTg6MjkgKzAxMDApCj4KPiBhcmUg
YXZhaWxhYmxlIGluIHRoZSBnaXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAgaHR0cHM6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0LWh0dHAvcGVvcGxlL2l3ai9xZW11LmdpdCB0YWdzL2Zvci11cHN0cmVhbS5k
ZXByaXYtMgo+Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDhiYmUwNWQ3NzM2MGI3
M2MxODM0ODA4MDIzMDE2YTc3OGNjZjU1Y2E6Cj4KPiAgIGNvbmZpZ3VyZTogZG9fY29tcGlsZXI6
IER1bXAgc29tZSBleHRyYSBpbmZvIHVuZGVyIGJhc2ggKDIwMTgtMDQtMjYgMTY6Mjk6NTIgKzAx
MDApCj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4geGVuOiB4ZW4tZG9taWQtcmVzdHJpY3QgaW1wcm92ZW1lbnRzCj4K
PiBUaGlzIHNlcmllcyBwcm92aWRlcyBuZWNlc3Nhcnkgc3VwcG9ydCBmb3IgcnVubmluZyBxZW11
IGFzIGEgWGVuCj4gZGV2aWNlIG1vZGVsIHdpdGhvdXQgcG93ZXIgZXF1aXZhbGVudCB0byByb290
LiAgSW4gcGFydGljdWxhciwgaXQKPiBtYWtlcyAteGVuLWRvbWlkLXJlc3RyaWN0IGVmZmVjdGl2
ZS4KPgo+IFRoZSBwYXRjaGVzIGFyZSB1bmNoYW5nZWQgc2luY2UgdjgsIGFwYXJ0IGZyb20gYWRk
aXRpb25hbCByZXZpZXdzLCBhbmQKPiByZWJhc2luZyBvbnRvIG1hc3Rlci4gIEFsbCB0aGUgcGF0
Y2hlcyBhcmUgbm93IHJldmlld2VkIGFuZC9vciBhY2tlZAo+IGFwYXJ0IGZyb20gdGhlIHBhdGNo
IHRvIGNvbmZpZ3VyZSwgd2hpY2ggaGFzIGEgVGVzdGVkLWJ5IGZyb20gVGhvbWFzCj4gSHV0aC4g
IEkgaGF2ZSBzdHJpcHBlZCBvZmYgdGhlIHBlci1wYXRjaC1zZXJpZXMtdmVyc29uIHVwZGF0ZQo+
IGNvbW1lbnRzLgo+CgpBcHBsaWVkLCB0aGFua3MuCgotLSBQTU0KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
