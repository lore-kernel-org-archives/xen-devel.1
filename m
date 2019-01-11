From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3 07/15] argo: implement the register op
Date: Thu, 10 Jan 2019 22:09:51 -0800
Message-ID: <CACMJ4GZZA9tzmAC+F-Tnm=cy-iUb5kDqS43CL8YBaVyWqxDOLw@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-8-git-send-email-christopher.w.clark@gmail.com>
 <20190110201123.d7ig4h3yxl53yzuy@legion>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qd1d=PT=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1ghq18-0003XF-CI
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 06:10:06 +0000
Received: by mail-lf1-x141.google.com with SMTP id n18so10008989lfh.6
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jan 2019 22:10:04 -0800 (PST)
In-Reply-To: <20190110201123.d7ig4h3yxl53yzuy@legion>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien.grall@arm.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Paul Durrant <paul.durrant@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Rich Persaud <persaur@gmail.com>, Ross Philipson <ross.philipson@gmail.com>, James McKenzie <james@bromium.com>, Daniel Smith <dpsmith@apertussolutions.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMTAsIDIwMTkgYXQgMTI6MTEgUE0gRXJpYyBDaGFudWRldCA8ZXJpYy5jaGFu
dWRldEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gMDYvMDEvMTkgYXQgMTE6NDJwbSwgQ2hyaXN0
b3BoZXIgQ2xhcmsgd3JvdGU6Cj4gPisvKgo+ID4rICogVGhlIG1heGltdW0gc2l6ZSBvZiBhbiBB
cmdvIHJpbmcgaXMgZGVmaW5lZCB0byBiZTogMTZHQgo+ID4rICogIC0tIHdoaWNoIGlzIDB4MTAw
MDAwMCBieXRlcy4KPiA+KyAqIEEgYnl0ZSBpbmRleCBpbnRvIHRoZSByaW5nIGlzIGF0IG1vc3Qg
MjQgYml0cy4KPiA+KyAqLwo+ID4rI2RlZmluZSBYRU5fQVJHT19NQVhfUklOR19TSVpFICAoMHgx
MDAwMDAwVUxMKQo+IEl0IGxvb2tzIGxpa2UgMTZNQi4gRGlkIEkgbWlzcyBhIDw8MTAgc29tZXdo
ZXJlIG9yIGlzIGl0IGEgdHlwbyBpbiB0aGUKPiBjb21tZW50PwoKWWVhaCwgaXQncyBhbiBlcnJv
ciBpbiB0aGUgY29tbWVudC4gVGhhbmtzLgoKQ2hyaXN0b3BoZXIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
