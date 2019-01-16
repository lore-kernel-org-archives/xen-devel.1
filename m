From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/block/xen: use proper format string for
 printing sectors
Date: Wed, 16 Jan 2019 14:04:34 +0100
Message-ID: <43cd4cd7-6874-5331-5d91-32a7272855ac__48036.2320821316$1547643806$gmane$org@redhat.com>
References: <20190116121350.23863-1-alex.bennee@linaro.org>
 <0dbd67c55295400980f87a191fc5d22c@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9Uzx=PY=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gjks3-0002iS-K4
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 13:04:39 +0000
Received: by mail-wm1-f67.google.com with SMTP id f188so1891621wmf.5
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 05:04:38 -0800 (PST)
In-Reply-To: <0dbd67c55295400980f87a191fc5d22c@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, =?UTF-8?B?J0FsZXggQmVubsOpZSc=?= <alex.bennee@linaro.org>, "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "open list:Block layer core" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMS8xNi8xOSAxOjE5IFBNLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4+IEZyb206IEFsZXggQmVubsOpZSBbbWFpbHRvOmFsZXguYmVubmVlQGxp
bmFyby5vcmddCj4+IFNlbnQ6IDE2IEphbnVhcnkgMjAxOSAxMjoxNAo+PiBUbzogcGV0ZXIubWF5
ZGVsbEBsaW5hcm8ub3JnCj4+IENjOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IEFsZXggQmVubsOp
ZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz47IFN0ZWZhbm8KPj4gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz47IEFudGhvbnkgUGVyYXJkCj4+IDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IEtldmluCj4+
IFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+OyBNYXggUmVpdHogPG1yZWl0ekByZWRoYXQuY29tPjsg
b3BlbiBsaXN0Olg4Ngo+PiA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPjsgb3BlbiBs
aXN0OkJsb2NrIGxheWVyIGNvcmUgPHFlbXUtCj4+IGJsb2NrQG5vbmdudS5vcmc+Cj4+IFN1Ympl
Y3Q6IFtQQVRDSF0gaHcvYmxvY2sveGVuOiB1c2UgcHJvcGVyIGZvcm1hdCBzdHJpbmcgZm9yIHBy
aW50aW5nCj4+IHNlY3RvcnMKPj4KPj4gVGhlICVsdSBmb3JtYXQgc3RyaW5nIGlzIGRpZmZlcmVu
dCBkZXBlbmRpbmcgb24gdGhlIGhvc3QgYXJjaGl0ZWN0dXJlCj4+IHdoaWNoIGNhdXNlcyBidWls
ZHMgbGlrZSB0aGUgZGViaWFuLWFybWhmLWNyb3NzIGJ1aWxkIHRvIGZhaWwuIFVzZSB0aGUKPj4g
Y29ycmVjdCBQUmk2NCBmb3JtYXQgc3RyaW5nLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJl
bm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4gCj4gVGhpcyBkb2VzIHRoZSBzYW1lIHRo
aW5nIGFzICJ4ZW46IEZpeCBmb3JtYXQgc3RyaW5nIiBmcm9tIFBoaWxpcHBlLCBidXQgdGhpcyB2
YXJpYW50IGlzIGJldHRlci4uLgoKT0suCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1E
YXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgoKPiAKPiBSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50
IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiAKPj4gLS0tCj4+ICBody9ibG9jay94ZW4tYmxv
Y2suYyB8IDIgKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvaHcvYmxvY2sveGVuLWJsb2NrLmMgYi9ody9ibG9jay94
ZW4tYmxvY2suYwo+PiBpbmRleCBiZTI4YjYzNDQyLi5hNjM2NDg3YjNlIDEwMDY0NAo+PiAtLS0g
YS9ody9ibG9jay94ZW4tYmxvY2suYwo+PiArKysgYi9ody9ibG9jay94ZW4tYmxvY2suYwo+PiBA
QCAtMjE1LDcgKzIxNSw3IEBAIHN0YXRpYyB2b2lkIHhlbl9ibG9ja19yZWFsaXplKFhlbkRldmlj
ZSAqeGVuZGV2LCBFcnJvcgo+PiAqKmVycnApCj4+Cj4+ICAgICAgeGVuX2RldmljZV9iYWNrZW5k
X3ByaW50Zih4ZW5kZXYsICJzZWN0b3Itc2l6ZSIsICIldSIsCj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25mLT5sb2dpY2FsX2Jsb2NrX3NpemUpOwo+PiAtICAgIHhlbl9kZXZp
Y2VfYmFja2VuZF9wcmludGYoeGVuZGV2LCAic2VjdG9ycyIsICIlbHUiLAo+PiArICAgIHhlbl9k
ZXZpY2VfYmFja2VuZF9wcmludGYoeGVuZGV2LCAic2VjdG9ycyIsICIlIlBSSWk2NCwKPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsa19nZXRsZW5ndGgoY29uZi0+YmxrKSAvCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mLT5sb2dpY2FsX2Jsb2NrX3NpemUp
Owo+Pgo+PiAtLQo+PiAyLjE3LjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
