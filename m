From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3 07/15] argo: implement the register op
Date: Tue, 15 Jan 2019 00:46:16 -0800
Message-ID: <CACMJ4GYpOwSx2bQFsSpi10XKKDNTKdPeKLd5LRXmP88SpeZvFA@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-8-git-send-email-christopher.w.clark@gmail.com>
 <5C3C9A5B020000780020D4A6@prv1-mh.provo.novell.com>
 <CACMJ4GZccfvKhBYBd+iNtbuSpGvVQ5OEF6BU8+NNbhF7Z=ERFQ@mail.gmail.com>
 <5C3D9B97020000780020DA23@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rejp=PX=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gjKMh-0008EU-Tn
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 08:46:31 +0000
Received: by mail-lf1-x141.google.com with SMTP id b20so1366661lfa.12
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jan 2019 00:46:30 -0800 (PST)
In-Reply-To: <5C3D9B97020000780020DA23@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMTI6MzYgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPgo+ID4+PiBPbiAxNS4wMS4xOSBhdCAwODo1NiwgPGNocmlzdG9waGVy
LncuY2xhcmtAZ21haWwuY29tPiB3cm90ZToKPiA+IE9uIE1vbiwgSmFuIDE0LCAyMDE5IGF0IDY6
MTkgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiA+PiA+Pj4gT24g
MDcuMDEuMTkgYXQgMDg6NDIsIDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6
Cj4gPj4gPiArICAgIC8qCj4gPj4gPiArICAgICAqIEEgcmluZyBtdXN0IGJlIGxhcmdlIGVub3Vn
aCB0byB0cmFuc21pdCBtZXNzYWdlcywgc28gcmVxdWlyZXMgc3BhY2UgZm9yOgo+ID4+ID4gKyAg
ICAgKiAqIDEgbWVzc2FnZSBoZWFkZXIsIHBsdXMKPiA+PiA+ICsgICAgICogKiAxIHBheWxvYWQg
c2xvdCAocGF5bG9hZCBpcyBhbHdheXMgcm91bmRlZCB0byBhIG11bHRpcGxlIG9mIDE2IGJ5dGVz
KQo+ID4+ID4gKyAgICAgKiAgIGZvciB0aGUgbWVzc2FnZSBwYXlsb2FkIHRvIGJlIHdyaXR0ZW4g
aW50bywgcGx1cwo+ID4+ID4gKyAgICAgKiAqIDEgbW9yZSBzbG90LCBzbyB0aGF0IHRoZSByaW5n
IGNhbm5vdCBiZSBmaWxsZWQgdG8gY2FwYWNpdHkgd2l0aCBhCj4gPj4gPiArICAgICAqICAgc2lu
Z2xlIG1lc3NhZ2UgLS0gc2VlIHRoZSBsb2dpYyBpbiByaW5nYnVmX2luc2VydCAtLSBhbGxvd2lu
ZyBmb3IgdGhpcwo+ID4+ID4gKyAgICAgKiAgIGVuc3VyZXMgdGhhdCB0aGVyZSBjYW4gYmUgc3Bh
Y2UgcmVtYWluaW5nIHdoZW4gYSBtZXNzYWdlIGlzIHByZXNlbnQuCj4gPj4gPiArICAgICAqIFRo
ZSBhYm92ZSBkZXRlcm1pbmVzIHRoZSBtaW5pbXVtIGFjY2VwdGFibGUgcmluZyBzaXplLgo+ID4+
ID4gKyAgICAgKi8KPiA+PiA+ICsgICAgaWYgKCAocmVnLmxlbiA8IChzaXplb2Yoc3RydWN0IHhl
bl9hcmdvX3JpbmdfbWVzc2FnZV9oZWFkZXIpCj4gPj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICsgUk9VTkRVUF9NRVNTQUdFKDEpICsgUk9VTkRVUF9NRVNTQUdFKDEpKSkgfHwKPiA+Pgo+ID4+
IFRoZXNlIHR3byBzdW1tYW5kcyBkb24ndCBsb29rIHRvIGZ1bGZpbGwgdGhlICJjYW5ub3QgYmUg
ZmlsbGVkIHRvCj4gPj4gY2FwYWNpdHkiIGNvbnN0cmFpbnQgdGhlIGNvbW1lbnQgZGVzY3JpYmVz
LCBhcyAoYWl1aSkgbWVzc2FnZXMKPiA+PiBjYW4gYmUgbGFyZ2VyIHRoYW4gMTYgYnl0ZXMuIFdo
YXQncyB0aGUgZGVhbD8KPiA+Cj4gPiBUaGlzIGlzIGludGVuZGVkIHRvIGJlIGFib3V0IGJvdW5k
IGNoZWNraW5nIHJlZy5sZW4gYWdhaW5zdCBhIG1pbmltdW0KPiA+IHNpemU6IHRoZSBzbWFsbGVz
dCByaW5nIHRoYXQgeW91IGNhbiBmaXQgYSBtZXNzYWdlIG9udG8sIGFzIGRldGVybWluZWQKPiA+
IGJ5IHRoZSBsb2dpYyBpbiByaW5nYnVmX2luc2VydC4gVGhlIHNtYWxsZXN0IG1lc3NhZ2UgeW91
IGNhbiBzZW5kIGlzOgo+ID4gc2l6ZW9mKHN0cnVjdCB4ZW5fYXJnb19yaW5nX21lc3NhZ2VfaGVh
ZGVyKSArIFJPVU5EVVBfTUVTU0FHRSgxKQo+ID4KPiA+IGFuZCB0aGVuIHJpbmdidWZfaW5zZXJ0
IHdvbid0IGFjY2VwdCBhIG1lc3NhZ2UgdW5sZXNzIHRoZXJlIGlzIChhdAo+ID4gbGVhc3QpIFJP
VU5EVVBfTUVTU0FHRSgxKSBzcGFjZSByZW1haW5pbmcsIHNvIHRoYXQsIHBsdXMgdGhlIHNtYWxs
ZXN0Cj4gPiBtZXNzYWdlIHNpemUsIGlzIHRoZSBzbWFsbGVzdCB2aWFibGUgcmluZy4gVGhlcmUn
cyBubyBwb2ludCBhY2NlcHRpbmcKPiA+IHJlZ2lzdHJhdGlvbiBvZiBhIHJpbmcgc21hbGxlciB0
aGFuIHRoYXQuCj4gPgo+ID4gWW91J3JlIHJpZ2h0IHRoYXQgbWVzc2FnZXMgY2FuIGJlIGxhcmdl
ciB0aGFuIDE2IGJ5dGVzLCBidXQgdGhleSBjYW4KPiA+IG9ubHkgYmUgc2VudCB0byByaW5ncyB0
aGF0IGFyZSBsYXJnZXIgdGhhbiB0aGF0IG1pbmltdW0gLSBvbiBhIG1pbmltdW0KPiA+IHNpemVk
IHJpbmcsIHRoZXknbGwgYmUgcmVqZWN0ZWQgYnkgc2VuZHYuCj4KPiBTbyBwZXJoYXBzIHRoZSBj
b21tZW50IHdhbnRzIHRvIHNheSAiLi4uIGNhbm5vdCBiZSBmaWxsZWQgdG8gY2FwYWNpdHkKPiB3
aXRoIGEgc2luZ2xlLCBtaW5pbXVtIHNpemUgbWVzc2FnZSI/CgphY2ssIGRvbmUuCgpDaHJpc3Rv
cGhlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
