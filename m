From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Thu, 10 Jan 2019 04:52:09 -0700
Message-ID: <5C3731E9020000780020C2AD@prv1-mh.provo.novell.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
 <CAPLaKK6z4eNtJx+X3RdTcO8tKb+PxaeBwA_N3wDmbXc7Qss58A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ghYsh-0005yH-4g
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 11:52:15 +0000
In-Reply-To: <CAPLaKK6z4eNtJx+X3RdTcO8tKb+PxaeBwA_N3wDmbXc7Qss58A@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: royger@FreeBSD.org, Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

ID4+PiBPbiAxMC4wMS4xOSBhdCAxMToxOSwgPHJveWdlckBmcmVlYnNkLm9yZz4gd3JvdGU6Cj4g
YU9uIE1vbiwgSmFuIDcsIDIwMTkgYXQgODo0NCBBTSBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0
b3BoZXIudy5jbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiArLyogWGVuIGNvbW1hbmQgbGlu
ZSBvcHRpb24gdG8gZW5hYmxlIGFyZ28gKi8KPj4gK3N0YXRpYyBib29sIF9fcmVhZF9tb3N0bHkg
b3B0X2FyZ29fZW5hYmxlZDsKPj4gK2Jvb2xlYW5fcGFyYW0oImFyZ28iLCBvcHRfYXJnb19lbmFi
bGVkKTsKPiAKPiBJIHdvdWxkIGRyb3AgdGhlIG9wdF8qIHByZWZpeCwgbmV3IG9wdGlvbnMgYWRk
ZWQgcmVjZW50bHkgZG9uJ3QKPiBpbmNsdWRlIHRoZSBwcmVmaXggYWxyZWFkeS4KCldvdWxkIHlv
dSBtaW5kIHBvaW50aW5nIG91dCBleGFtcGxlcz8gRXNwZWNpYWxseSBmb3IgYm9vbGVhbiBvbmVz
IEkKdGhpbmsgd2UndmUgdHJpZWQgdG8gY29uc2lzdGVudGx5IG5hbWUgdGhlbSBvcHRfKi4gQnV0
IGluIHRoZSBjYXNlCmhlcmUgKGl0IGJlaW5nIHN0YXRpYykgSSdtIG5vdCBvdmVybHkgZnVzc2Vk
LgoKPj4gKwo+PiArdHlwZWRlZiBzdHJ1Y3QgYXJnb19yaW5nX2lkCj4+ICt7Cj4+ICsgICAgdWlu
dDMyX3QgcG9ydDsKPj4gKyAgICBkb21pZF90IHBhcnRuZXJfaWQ7Cj4+ICsgICAgZG9taWRfdCBk
b21haW5faWQ7Cj4+ICt9IGFyZ29fcmluZ19pZDsKPj4gKwo+PiArLyogRGF0YSBhYm91dCBhIGRv
bWFpbidzIG93biByaW5nIHRoYXQgaXQgaGFzIHJlZ2lzdGVyZWQgKi8KPj4gK3N0cnVjdCBhcmdv
X3JpbmdfaW5mbwo+PiArewo+PiArICAgIC8qIG5leHQgbm9kZSBpbiB0aGUgaGFzaCwgcHJvdGVj
dGVkIGJ5IEwyICovCj4+ICsgICAgc3RydWN0IGhsaXN0X25vZGUgbm9kZTsKPj4gKyAgICAvKiB0
aGlzIHJpbmcncyBpZCwgcHJvdGVjdGVkIGJ5IEwyICovCj4+ICsgICAgc3RydWN0IGFyZ29fcmlu
Z19pZCBpZDsKPj4gKyAgICAvKiBMMyAqLwo+PiArICAgIHNwaW5sb2NrX3QgbG9jazsKPj4gKyAg
ICAvKiBsZW5ndGggb2YgdGhlIHJpbmcsIHByb3RlY3RlZCBieSBMMyAqLwo+PiArICAgIHVpbnQz
Ml90IGxlbjsKPj4gKyAgICAvKiBudW1iZXIgb2YgcGFnZXMgaW4gdGhlIHJpbmcsIHByb3RlY3Rl
ZCBieSBMMyAqLwo+PiArICAgIHVpbnQzMl90IG5wYWdlOwo+IAo+IENhbiB5b3UgaW5mZXIgbnVt
YmVyIG9mIHBhZ2VzIGZvcm0gdGhlIGxlbmd0aCBvZiB0aGUgcmluZywgb3IgdGhlCj4gb3RoZXIg
d2F5IGFyb3VuZD8KPiAKPiBJJ20gbm90IHN1cmUgd2h5IGJvdGggbmVlZCB0byBiZSBzdG9yZWQg
aGVyZS4KPiAKPj4gKyAgICAvKiBudW1iZXIgb2YgcGFnZXMgdHJhbnNsYXRlZCBpbnRvIG1mbnMs
IHByb3RlY3RlZCBieSBMMyAqLwo+PiArICAgIHVpbnQzMl90IG5tZm5zOwo+PiArICAgIC8qIGNh
Y2hlZCB0eCBwb2ludGVyIGxvY2F0aW9uLCBwcm90ZWN0ZWQgYnkgTDMgKi8KPj4gKyAgICB1aW50
MzJfdCB0eF9wdHI7Cj4gCj4gQWxsIHRoaXMgZmllbGRzIGFyZSBub3QgcGFydCBvZiBhbnkgcHVi
bGljIHN0cnVjdHVyZSwgc28gSSB3b25kZXIgaWYKPiBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gc2lt
cGx5IHVzZSB1bnNpZ25lZCBpbnQgZm9yIHRob3NlLCBvciBzaXplX3QuCgpZZXMgaW5kZWVkIC0g
dGhlcmUncyB3YXkgdG9vIG11Y2ggdXNlIG9mIGZpeGVkIHdpZHRoIHR5cGVzIGhlcmUuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
