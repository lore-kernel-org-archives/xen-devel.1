From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v6] automation: introduce a script for build
 test
Date: Wed, 25 Jul 2018 14:40:13 +0100
Message-ID: <7ba28001-6bef-a3ac-66c7-af1c83ea2cdc@citrix.com>
References: <20180725092424.31707-1-wei.liu2@citrix.com>
 <CAFLBxZYXaujs07o3egF4K62XGGcrzD0mT=41pXRaoNG84SZ0qw@mail.gmail.com>
 <20180725132915.5gn3i6ogvwe4qj6x@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y+ah=kj=citrix.com=prvs=737329f3b=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fiK1b-0003Ve-4C
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 13:40:19 +0000
In-Reply-To: <20180725132915.5gn3i6ogvwe4qj6x@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjUvMjAxOCAwMjoyOSBQTSwgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIEp1bCAyNSwg
MjAxOCBhdCAxMToyNzoxNkFNICswMTAwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiBXZWQs
IEp1bCAyNSwgMjAxOCBhdCAxMDoyNCBBTSwgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+PiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
Cj4+PiAtLS0KPj4+IFRoaXMgaXMgYSBzY3JpcHQgSSB3cm90ZSBwcmV2aW91c2x5IGZvciBidWls
ZCB0ZXN0Lgo+Pj4KPj4+IEdpdmVuIGl0IGJhc2ljYWxseSBydW5zIGEgc2V0IG9mIGNvbW1hbmRz
IG9uIGV2ZXJ5IGNvbW1pdCwgbWF5YmUgaXQgc2hvdWxkCj4+PiBiZSBuYW1lZCBmb3ItZWFjaC1j
b21taXQuc2ggPwo+Pgo+PiBFeGNlcHQgdGhhdCB5b3UgYWxzbyBidWlsZCBqdXN0IHRoZSB3aG9s
ZSBzZXJpZXMgaWYgdGhlIGJhc2UgYW5kIHRpcAo+PiBhcmVuJ3Qgc3BlY2lmaWVkLgo+Pgo+IAo+
IFdoYXQgZG8geW91IG1lYW4gYnkgdGhpcz8gQmFzZSBhbmQgdGlwIGFyZSByZXF1aXJlZC4KCk9o
LCBzbyBpdCBkb2VzLiAgU29ycnksIGZvciBzb21lIHJlYXNvbiB3aGVuIEkgc2tpbW1lZCBpdCB0
aGUgZmlyc3QgdGltZQpJIHRob3VnaHQgSSBzYXcgdGhhdCBpdCBoYWQgdHdvIGRpZmZlcmVudCBt
b2Rlcy4KCj4+IFNpbmNlIGl0J3MgYWJvdXQgYnVpbGRpbmcgYSBzZXJpZXMgKGVpdGhlciBhbGwg
YXQgb25jZSBvciBvbmUgY29tbWl0Cj4+IGF0IGEgdGltZSksIHdoYXQgYWJvdXQgYnVpbHQtc2Vy
aWVzPyAgT3Igc2VyaWVzLWJ1aWxkLXRlc3Q/Cj4+Cj4gCj4gTm90IHN1cmUuIE15IHBvaW50IHdh
cyBpdCBjb3VsZCBkbyBtb3JlIHRoaW5ncyB0aGFuIGp1c3QgYnVpbGRpbmcuIFlvdQo+IGNhbiBz
dXBwbHkgeW91ciBvd24gc2NyaXB0IG9yIGNvbW1hbmRzIHRvIGRvIHN0dWZmIHdpdGggZWFjaCBj
b21taXQuCgpZZXMsIGluIHRoYXQgY2FzZSwgc29tZXRoaW5nIGxpa2UgZm9yLWVhY2gtY29tbWl0
IHdvdWxkIGJlIHNlbnNpYmxlLgpBbHRob3VnaCBJIG1pZ2h0IGNvbnNpZGVyIG5vdCBpbmNsdWRp
bmcgdGhlICdkZWZhdWx0IGJ1aWxkJyBjb21tYW5kIGluCnRoZSBzY3JpcHQgaW4gdGhhdCBjYXNl
LCBvbiB0aGUgZ3JvdW5kcyB0aGF0IGl0IHdvdWxkIHZpb2xhdGUgdGhlCnByaW5jaXBsZSBvZiBs
ZWFzdCBzdXJwcmlzZSBmb3IgYSBzY3JpcHQgbmFtZWQgImZvci1lYWNoLWNvbW1pdCIgdG8Kc3Rh
cnQgYnVpbGRpbmcgdGhpbmdzIG9uIGl0cyBvd24uCgogLUdlb3JnZQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
