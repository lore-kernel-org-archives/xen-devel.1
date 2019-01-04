From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v7 16/18] xen: automatically create
 XenBlockDevice-s
Date: Fri, 4 Jan 2019 16:31:24 +0000
Message-ID: <20190104163124.GE1508__13702.7829456658$1546619421$gmane$org@perard.uk.xensource.com>
References: <20181220171439.11159-1-paul.durrant@citrix.com>
 <20181220171439.11159-17-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OewZ=PM=citrix.com=prvs=90051d582=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gfSNh-0000qx-OP
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 16:31:33 +0000
Content-Disposition: inline
In-Reply-To: <20181220171439.11159-17-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

QWxtb3N0IGRvbmUsIHRoZXJlIGlzIG9uZSB0aGluZyBsZWZ0IHdoaWNoIEkgYmVsaWV2ZSBpcyBh
biBpc3N1ZS4KV2hlbmV2ZXIgSSBhdHRhY2ggYSByYXcgZmlsZSB0byBRRU1VLCBpdCBwcmludDoK
ICAgIHFlbXUtc3lzdGVtLWkzODY6IHdhcm5pbmc6IE9wZW5pbmcgYSBibG9jayBkZXZpY2UgYXMg
YSBmaWxlIHVzaW5nIHRoZSAnZmlsZScgZHJpdmVyIGlzIGRlcHJlY2F0ZWQKClNvLCBJIHRoaW5r
IHRoZSBjb21tZW50IGJlbG93IGlzbid0IHRydWUuIFdlIHNob3VsZCBjcmVhdGUgYSAicmF3Igpk
cml2ZXIgZm9yICJyYXciIGZpbGVzLgoKT24gVGh1LCBEZWMgMjAsIDIwMTggYXQgMDU6MTQ6MzdQ
TSArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+ICtzdGF0aWMgWGVuQmxvY2tEcml2ZSAqeGVu
X2Jsb2NrX2RyaXZlX2NyZWF0ZShjb25zdCBjaGFyICppZCwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqZGV2aWNlX3R5cGUsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFFEaWN0ICpvcHRzLCBF
cnJvciAqKmVycnApCj4gK3sKLi4uCgo+ICsgICAgaWYgKHBhcmFtcykgewo+ICsgICAgICAgIGNo
YXIgKip2ID0gZ19zdHJzcGxpdChwYXJhbXMsICI6IiwgMik7Cj4gKwo+ICsgICAgICAgIGlmICh2
WzFdID09IE5VTEwpIHsKPiArICAgICAgICAgICAgZmlsZW5hbWUgPSBnX3N0cmR1cCh2WzBdKTsK
PiArICAgICAgICAgICAgZHJpdmVyID0gZ19zdHJkdXAoImZpbGUiKTsKPiArICAgICAgICB9IGVs
c2Ugewo+ICsgICAgICAgICAgICBpZiAoc3RyY21wKHZbMF0sICJhaW8iKSA9PSAwKSB7Cj4gKyAg
ICAgICAgICAgICAgICBkcml2ZXIgPSBnX3N0cmR1cCgiZmlsZSIpOwo+ICsgICAgICAgICAgICB9
IGVsc2UgaWYgKHN0cmNtcCh2WzBdLCAidmhkIikgPT0gMCkgewo+ICsgICAgICAgICAgICAgICAg
ZHJpdmVyID0gZ19zdHJkdXAoInZwYyIpOwo+ICsgICAgICAgICAgICB9IGVsc2Ugewo+ICsgICAg
ICAgICAgICAgICAgZHJpdmVyID0gZ19zdHJkdXAodlswXSk7Cj4gKyAgICAgICAgICAgIH0KPiAr
ICAgICAgICAgICAgZmlsZW5hbWUgPSBnX3N0cmR1cCh2WzFdKTsKPiArICAgICAgICB9Cj4gKwo+
ICsgICAgICAgIGdfc3RyZnJlZXYodik7Cj4gKyAgICB9Cj4gKwouLi4KCj4gKyAgICAvKiBJZiB0
aGUgaW1hZ2UgaXMgYSByYXcgZmlsZSB0aGVuIHdlIGFyZSBkb25lICovCgpyYXcgZmlsZXMgc2hv
dWxkIHVzZSB0aGUgInJhdyIgZHJpdmVyLCBzbyB3ZSBhcmVuJ3QgZG9uZSB5ZXQuCgo+ICsgICAg
aWYgKCFzdHJjbXAoZHJpdmVyLCAiZmlsZSIpKSB7Cj4gKyAgICAgICAgZ290byBkb25lOwo+ICsg
ICAgfQoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
