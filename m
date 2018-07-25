From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v6] automation: introduce a script for build
 test
Date: Wed, 25 Jul 2018 14:29:15 +0100
Message-ID: <20180725132915.5gn3i6ogvwe4qj6x@citrix.com>
References: <20180725092424.31707-1-wei.liu2@citrix.com>
 <CAFLBxZYXaujs07o3egF4K62XGGcrzD0mT=41pXRaoNG84SZ0qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m8ai=kj=citrix.com=prvs=737e41906=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fiJqy-0001ov-61
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 13:29:20 +0000
Content-Disposition: inline
In-Reply-To: <CAFLBxZYXaujs07o3egF4K62XGGcrzD0mT=41pXRaoNG84SZ0qw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMTE6Mjc6MTZBTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiBXZWQsIEp1bCAyNSwgMjAxOCBhdCAxMDoyNCBBTSwgV2VpIExpdSA8d2VpLmxp
dTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+IFRoaXMgaXMgYSBzY3JpcHQgSSB3cm90ZSBwcmV2
aW91c2x5IGZvciBidWlsZCB0ZXN0Lgo+ID4KPiA+IEdpdmVuIGl0IGJhc2ljYWxseSBydW5zIGEg
c2V0IG9mIGNvbW1hbmRzIG9uIGV2ZXJ5IGNvbW1pdCwgbWF5YmUgaXQgc2hvdWxkCj4gPiBiZSBu
YW1lZCBmb3ItZWFjaC1jb21taXQuc2ggPwo+IAo+IEV4Y2VwdCB0aGF0IHlvdSBhbHNvIGJ1aWxk
IGp1c3QgdGhlIHdob2xlIHNlcmllcyBpZiB0aGUgYmFzZSBhbmQgdGlwCj4gYXJlbid0IHNwZWNp
ZmllZC4KPiAKCldoYXQgZG8geW91IG1lYW4gYnkgdGhpcz8gQmFzZSBhbmQgdGlwIGFyZSByZXF1
aXJlZC4KCj4gU2luY2UgaXQncyBhYm91dCBidWlsZGluZyBhIHNlcmllcyAoZWl0aGVyIGFsbCBh
dCBvbmNlIG9yIG9uZSBjb21taXQKPiBhdCBhIHRpbWUpLCB3aGF0IGFib3V0IGJ1aWx0LXNlcmll
cz8gIE9yIHNlcmllcy1idWlsZC10ZXN0Pwo+IAoKTm90IHN1cmUuIE15IHBvaW50IHdhcyBpdCBj
b3VsZCBkbyBtb3JlIHRoaW5ncyB0aGFuIGp1c3QgYnVpbGRpbmcuIFlvdQpjYW4gc3VwcGx5IHlv
dXIgb3duIHNjcmlwdCBvciBjb21tYW5kcyB0byBkbyBzdHVmZiB3aXRoIGVhY2ggY29tbWl0LgoK
V2VpLgoKPiAgLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
