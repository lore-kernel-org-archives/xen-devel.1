From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] hw/block/xen: use proper format string for
 printing sectors
Date: Thu, 17 Jan 2019 08:21:10 +0000
Message-ID: <874la7zocp.fsf__20662.8517284573$1547713196$gmane$org@linaro.org>
References: <20190116121350.23863-1-alex.bennee@linaro.org>
 <c8f655ea-3c3b-290e-1bc2-8f7bb755f4af@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P9MW=PZ=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1gk2vK-0007gf-SK
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 08:21:14 +0000
Received: by mail-wr1-x441.google.com with SMTP id u4so9938269wrp.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jan 2019 00:21:13 -0800 (PST)
In-reply-to: <c8f655ea-3c3b-290e-1bc2-8f7bb755f4af@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>, "open list:Block layer core" <qemu-block@nongnu.org>, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Paul Durrant <paul.durrant@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

CkFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyaXRlczoKCj4gT24g
MTYvMDEvMjAxOSAxMjoxMywgQWxleCBCZW5uw6llIHdyb3RlOgo+PiBUaGUgJWx1IGZvcm1hdCBz
dHJpbmcgaXMgZGlmZmVyZW50IGRlcGVuZGluZyBvbiB0aGUgaG9zdCBhcmNoaXRlY3R1cmUKPj4g
d2hpY2ggY2F1c2VzIGJ1aWxkcyBsaWtlIHRoZSBkZWJpYW4tYXJtaGYtY3Jvc3MgYnVpbGQgdG8g
ZmFpbC4gVXNlIHRoZQo+PiBjb3JyZWN0IFBSaTY0IGZvcm1hdCBzdHJpbmcuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KPj4gLS0tCj4+
ICBody9ibG9jay94ZW4tYmxvY2suYyB8IDIgKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvaHcvYmxvY2sveGVuLWJs
b2NrLmMgYi9ody9ibG9jay94ZW4tYmxvY2suYwo+PiBpbmRleCBiZTI4YjYzNDQyLi5hNjM2NDg3
YjNlIDEwMDY0NAo+PiAtLS0gYS9ody9ibG9jay94ZW4tYmxvY2suYwo+PiArKysgYi9ody9ibG9j
ay94ZW4tYmxvY2suYwo+PiBAQCAtMjE1LDcgKzIxNSw3IEBAIHN0YXRpYyB2b2lkIHhlbl9ibG9j
a19yZWFsaXplKFhlbkRldmljZSAqeGVuZGV2LCBFcnJvciAqKmVycnApCj4+Cj4+ICAgICAgeGVu
X2RldmljZV9iYWNrZW5kX3ByaW50Zih4ZW5kZXYsICJzZWN0b3Itc2l6ZSIsICIldSIsCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mLT5sb2dpY2FsX2Jsb2NrX3NpemUpOwo+
PiAtICAgIHhlbl9kZXZpY2VfYmFja2VuZF9wcmludGYoeGVuZGV2LCAic2VjdG9ycyIsICIlbHUi
LAo+PiArICAgIHhlbl9kZXZpY2VfYmFja2VuZF9wcmludGYoeGVuZGV2LCAic2VjdG9ycyIsICIl
IlBSSWk2NCwKPgo+IFBSSXU2NC4KPgo+IFlvdSd2ZSBjaGFuZ2VkIHRoZSBzaWduZWQtbmVzcyBv
ZiB3aGF0IGdldHMgcHJpbnRlZC4KCkkgd2FzIGRlbGliZXJhdGUgYXM6CiAgaW50NjRfdCBibGtf
Z2V0bGVuZ3RoKEJsb2NrQmFja2VuZCAqYmxrKTsKCmFsdGhvdWdoIEkgaGF2ZSB0byBhZG1pdCBh
IHNpZ25lZCBibG9jayBsZW5ndGggZG9lc24ndCBtYWtlIG11Y2ggc2Vuc2UKdG8gbWUuIEF0IGxl
YXN0IGl0IGlzbid0IGdvaW5nIHRvIG92ZXJmbG93IGFuZCB3aWxsIHNob3ctdXAgaWYgdGhlIGJs
b2NrCmxlbmd0aCBpcyBldmVyIG5lZ2F0aXZlLgoKPgo+IH5BbmRyZXcKCgotLQpBbGV4IEJlbm7D
qWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
