From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Subject: Re: [PATCH] xen/arm: Blacklist PMU with "arm,
 cortex-a53-pmu"
Date: Mon, 15 Apr 2019 08:43:16 +0100
Message-ID: <e60a9e5a-6492-4232-2400-128fce246cc8@arm.com>
References: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
 <58cbfc08-720c-0d55-75ac-f14dc3799036@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xdBD=SR=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1hFwJG-00051y-79
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 07:45:46 +0000
In-Reply-To: <58cbfc08-720c-0d55-75ac-f14dc3799036@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Amit Singh Tomar <amittomer25@gmail.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDQvMjAxOSAxNzowNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDQv
MTQvMTkgMzozMyBQTSwgQW1pdCBTaW5naCBUb21hciB3cm90ZToKPj4gQXQgdGhlIG1vbWVudCwg
d2UgaGlkZSBQTVUncyBmcm9tIGRvbWFpbiAwIGFuZCBYRU4gYm9vdCBmYWlscyBvbgo+PiBwbGF0
Zm9ybVsxXQo+PiB3aGVyZSBEVFMgY29udGFpbnMgImFybSxjb3J0ZXgtYTUzLXBtdSIgYXMgY29t
cGF0aWJsZSBzdHJpbmcgZm9yIFBNVQo+PiBub2RlLgo+IAo+ICJEb21haW4gMCBhbmQgWGVuIGJv
b3QgZmFpbHMiIGlzIHByZXR0eSB2YWd1ZS4gSG93IGRvZXMgaXQgZmFpbD8KCkFmdGVyIHRhbGtp
bmcgdmlhIElSQywgdGhlIHByb2JsZW0gaXMgUFBJcywgdGhhdCB0aGlzIHBsYXRmb3JtIHVzZXMg
Zm9yClBNVSBpbnRlcnJ1cHRzLiBXaGVuIFhlbiB0cmllcyB0byBzZXR1cCB0aGUgSVJRIGZvcndh
cmRpbmcgZm9yIERvbTAgZm9yCnRoaXMgZGV2aWNlLCBpdCBmYWlscyBiZWNhdXNlIGl0IG9ubHkg
c3VwcG9ydHMgZm9yd2FyZGluZyBTUElzLgpTbyBpbnRlcmVzdGluZ2x5IHdlIGVycm9uZW91c2x5
IGZvcndhcmRlZCBBNTMgUE1VcyAodGhvc2UgdGhhdCBhcmUKZGVzY3JpYmVkIGJ5IHRoYXQgcGFy
dGljdWxhciBjb21wYXRpYmxlIHN0cmluZyBvbmx5KSB0byBEb20wIGZvciBxdWl0ZSBhCndoaWxl
LCBidXQgbm9ib2R5IG5vdGljZWQgKG9yIGNhcmVkKS4KCkFtaXQsIHBsZWFzZSBhZGp1c3QgdGhl
IGNvbW1pdCBtZXNzYWdlIGFjY29yZGluZ2x5LgoKQ2hlZXJzLApBbmRyZS4KCgo+IAo+IEluIGdl
bmVyYWwsIGEgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIGdpdmUgZW5vdWdoIHRvIHRoZSByZXZpZXdl
ciB0bwo+IHVuZGVyc3RhbmQgd2hhdCBpcyB0aGUgaXNzdWUgYW5kIGJlIGFibGUgdG8gZGVjaWRl
IHdoZXRoZXIgeW91ciBwYXRjaCBpcwo+IHRoZSBjb3JyZWN0IGZpeC4KPiAKPiBDaGVlcnMsCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
