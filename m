From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] [PATCH 20/22] xen_backend: Convert
 sysbus init function to realize function
Date: Tue, 20 Nov 2018 14:49:49 +0000
Message-ID: <CAFEAcA92SCAar143VMkJiLGEv0kUzMBXJySN8MEd7Ze9U_rBew@mail.gmail.com>
References: <20181119120820.29878-1-maozhongyi@cmss.chinamobile.com>
 <20181119120820.29878-21-maozhongyi@cmss.chinamobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9+xv=n7=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1gP7Lv-0007Dy-6B
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 14:50:11 +0000
Received: by mail-oi1-x241.google.com with SMTP id b141so1658564oii.12
 for <xen-devel@lists.xenproject.org>; Tue, 20 Nov 2018 06:50:10 -0800 (PST)
In-Reply-To: <20181119120820.29878-21-maozhongyi@cmss.chinamobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>, Zhang Shengju <zhangshengju@cmss.chinamobile.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkgTm92ZW1iZXIgMjAxOCBhdCAxMjowOCwgTWFvIFpob25neWkKPG1hb3pob25neWlAY21z
cy5jaGluYW1vYmlsZS5jb20+IHdyb3RlOgo+IFVzZSBEZXZpY2VDbGFzcyByYXRoZXIgdGhhbiBT
eXNCdXNEZXZpY2VDbGFzcyBpbgo+IHhlbl9zeXNkZXZfY2xhc3NfaW5pdCgpLgo+Cj4gQ2M6IHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmcKPiBDYzogYW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbQo+IENj
OiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPgo+IFNpZ25lZC1vZmYtYnk6IE1hbyBa
aG9uZ3lpIDxtYW96aG9uZ3lpQGNtc3MuY2hpbmFtb2JpbGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IFpoYW5nIFNoZW5nanUgPHpoYW5nc2hlbmdqdUBjbXNzLmNoaW5hbW9iaWxlLmNvbT4KPiAtLS0K
PiAgaHcveGVuL3hlbl9iYWNrZW5kLmMgfCA2ICsrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2h3L3hlbi94ZW5f
YmFja2VuZC5jIGIvaHcveGVuL3hlbl9iYWNrZW5kLmMKPiBpbmRleCA5YThlODc3MWVjLi43M2Iw
ZWQwMTY5IDEwMDY0NAo+IC0tLSBhL2h3L3hlbi94ZW5fYmFja2VuZC5jCj4gKysrIGIvaHcveGVu
L3hlbl9iYWNrZW5kLmMKPiBAQCAtODA5LDkgKzgwOSw4IEBAIHN0YXRpYyBjb25zdCBUeXBlSW5m
byB4ZW5zeXNidXNfaW5mbyA9IHsKPiAgICAgIH0KPiAgfTsKPgo+IC1zdGF0aWMgaW50IHhlbl9z
eXNkZXZfaW5pdChTeXNCdXNEZXZpY2UgKmRldikKPiArc3RhdGljIHZvaWQgeGVuX3N5c2Rldl9y
ZWFsaXplKERldmljZVN0YXRlICpkZXYsIEVycm9yICoqZXJycCkKPiAgewo+IC0gICAgcmV0dXJu
IDA7Cj4gIH0KPgo+ICBzdGF0aWMgUHJvcGVydHkgeGVuX3N5c2Rldl9wcm9wZXJ0aWVzW10gPSB7
Cj4gQEAgLTgyMSw5ICs4MjAsOCBAQCBzdGF0aWMgUHJvcGVydHkgeGVuX3N5c2Rldl9wcm9wZXJ0
aWVzW10gPSB7Cj4gIHN0YXRpYyB2b2lkIHhlbl9zeXNkZXZfY2xhc3NfaW5pdChPYmplY3RDbGFz
cyAqa2xhc3MsIHZvaWQgKmRhdGEpCj4gIHsKPiAgICAgIERldmljZUNsYXNzICpkYyA9IERFVklD
RV9DTEFTUyhrbGFzcyk7Cj4gLSAgICBTeXNCdXNEZXZpY2VDbGFzcyAqayA9IFNZU19CVVNfREVW
SUNFX0NMQVNTKGtsYXNzKTsKPgo+IC0gICAgay0+aW5pdCA9IHhlbl9zeXNkZXZfaW5pdDsKPiAr
ICAgIGRjLT5yZWFsaXplID0geGVuX3N5c2Rldl9yZWFsaXplOwo+ICAgICAgZGMtPnByb3BzID0g
eGVuX3N5c2Rldl9wcm9wZXJ0aWVzOwo+ICAgICAgZGMtPmJ1c190eXBlID0gVFlQRV9YRU5TWVNC
VVM7Cj4gIH0KCklmIHRoZSByZWFsaXplIGZ1bmN0aW9uIGRvZXNuJ3QgZG8gYW55dGhpbmcgYXQg
YWxsLCBjYW4ndAp3ZSBqdXN0IG9taXQgaXQgPwoKdGhhbmtzCi0tIFBNTQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
