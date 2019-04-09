From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 2/3] xen/arm: Add MESON UART driver for
 Amlogic Meson SoCs
Date: Tue, 9 Apr 2019 11:14:35 +0100
Message-ID: <48bd9982-2569-4a43-ee34-22eaf7a16f24@arm.com>
References: <1553163935-12862-1-git-send-email-amittomer25@gmail.com>
 <1553163935-12862-2-git-send-email-amittomer25@gmail.com>
 <5f956c43-6885-3553-2f37-bb9ce48e981b@arm.com>
 <cd327f36-09db-f322-4675-30140839e159@arm.com>
 <CABHD4K8R7wyA=yGdfdVvsb21Ewyb3buAbhTCsJVuFuLNvGqV6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zDjF=SL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDnm2-0001d7-RC
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 10:14:38 +0000
In-Reply-To: <CABHD4K8R7wyA=yGdfdVvsb21Ewyb3buAbhTCsJVuFuLNvGqV6A@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Tomer <amittomer25@gmail.com>
Cc: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDQvMjAxOSAxMTowOSwgQW1pdCBUb21lciB3cm90ZToKPiBIZWxsbywKPiAKPiBPbiBU
dWUsIEFwciA5LCAyMDE5IGF0IDM6MDkgUE0gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4gd3JvdGU6Cj4+Cj4+IEhpLAo+Pgo+PiBPbiAwMi8wNC8yMDE5IDIxOjAxLCBBbmRyw6kg
UHJ6eXdhcmEgd3JvdGU6Cj4+PiBPbiAyMS8wMy8yMDE5IDEwOjI1LCBBbWl0IFNpbmdoIFRvbWFy
IHdyb3RlOgo+Pj4+IFRoaXMgcGF0Y2ggYWRkcyBkcml2ZXIgZm9yIFVBUlQgY29udHJvbGxlciBw
cmVzZW50IG9uIEFtbG9naWMgTWVzb24KPj4+PiBTb0NzIGFuZCBpdCBoYXMgYmVlbiB0ZXN0ZWQg
b24gTmFub3BpIEsyIGJvYXJkIGJhc2VkIG9uIFM5MDUgU29DLgo+Pj4+Cj4+Pj4gQ29udHJvbGxl
ciByZWdpc3RlcnMgZGVmaW5hdGlvbiBpcyB0YWtlbiBmcm9tIExpbnV4IDQuMjAuCj4+Pj4gaHR0
cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvdjQuMjAtcmMxL2RyaXZlcnMvdHR5
L3NlcmlhbC9tZXNvbl91YXJ0LmMKPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFtaXQgU2luZ2gg
VG9tYXIgPGFtaXR0b21lcjI1QGdtYWlsLmNvbT4KPj4+Cj4+PiBUaGFua3MgZm9yIHRoZSBjaGFu
Z2VzIQo+Pj4KPj4+IFJldmlld2VkLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFA
YXJtLmNvbT4KPj4KPj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+Cj4gCj4gVGhhbmtzLgo+IAo+PiBJIGhhdmUgY29tbWl0dGVkIHRoaXMgcGF0Y2ggYW5kIHRo
ZSBmb2xsb3dpbmcgcGF0Y2guIFBsZWFzZSByZXNlbmQgdGhlIGZpcnN0Cj4+IHBhdGNoIHdpdGgg
dGhlIGNvbW1lbnRzIGFkZHJlc3NlZC4KPiAKPiBJcyBpdCB0aGUgcGF0Y2ggd2l0aCBmb2xsb3dp
bmcgc3ViamVjdDoKPiBbUEFUQ0ggdjIgMS8zXSB4ZW4vYXJtOiBBZGQgQW1sb2dpYyBNZXNvbiBT
b0NzIGVhcmx5cHJpbnRrIHN1cHBvcnQKPiAKPiBSZWFsbHksIGNvdWxkbid0IGZpbmQgYW55IGNv
bW1lbnRzIG92ZXIgdGhlcmUuCgpTZWUgaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNo
aXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA0L21zZzAwMTQ1Lmh0bWwKCkkgcG9pbnRlZCB0d28g
aXNzdWVzOgoJMSkgVGhlIGxhY2sgb2YgY292ZXIgbGV0dGVyCgkyKSBUaGUgbGFjayBvZiBjb21t
aXQgbWVzc2FnZQoKMSkgZG9lcyBub3QgbmVlZCB0byBiZSBhZGRyZXNzZWQgZm9yIHRoaXMgc2Vy
aWVzLCBidXQgc2hvdWxkIGJlIGZvciBhbnkgbmV3IApzZXJpZXMgeW91IHNlbmQgd2l0aCBtb3Jl
IHRoYW4gMSBwYXRjaC4KCjIpIHNob3VsZCBiZSBhZGRyZXNzZWQgYmVmb3JlIEkgd2lsbCBjb21t
aXQgdGhlIHBhdGNoLiBUaGUgZXhhY3QgaXNzdWUgd2VyZSAKYWxyZWFkeSBkZXNjcmliZWQgaW4g
dmVyc2lvbiAxIChzZWUgWzFdKS4KCkNoZWVycywKClsxXSBodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDIvbXNnMDEyMDQuaHRtbAoKPiAK
PiAtQW1pdC4KPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
