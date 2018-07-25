From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v6] automation: introduce a script for build
 test
Date: Wed, 25 Jul 2018 16:05:10 +0100
Message-ID: <20180725150509.3giba36hbedtlg5p@citrix.com>
References: <20180725092424.31707-1-wei.liu2@citrix.com>
 <CAFLBxZYXaujs07o3egF4K62XGGcrzD0mT=41pXRaoNG84SZ0qw@mail.gmail.com>
 <20180725132915.5gn3i6ogvwe4qj6x@citrix.com>
 <7ba28001-6bef-a3ac-66c7-af1c83ea2cdc@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m8ai=kj=citrix.com=prvs=737e41906=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fiLLn-0002z1-AW
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 15:05:15 +0000
Content-Disposition: inline
In-Reply-To: <7ba28001-6bef-a3ac-66c7-af1c83ea2cdc@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMDI6NDA6MTNQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiAwNy8yNS8yMDE4IDAyOjI5IFBNLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gV2Vk
LCBKdWwgMjUsIDIwMTggYXQgMTE6Mjc6MTZBTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3cm90ZToK
PiA+PiBPbiBXZWQsIEp1bCAyNSwgMjAxOCBhdCAxMDoyNCBBTSwgV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgo+ID4+PiAtLS0KPiA+Pj4gVGhpcyBpcyBhIHNjcmlwdCBJIHdyb3Rl
IHByZXZpb3VzbHkgZm9yIGJ1aWxkIHRlc3QuCj4gPj4+Cj4gPj4+IEdpdmVuIGl0IGJhc2ljYWxs
eSBydW5zIGEgc2V0IG9mIGNvbW1hbmRzIG9uIGV2ZXJ5IGNvbW1pdCwgbWF5YmUgaXQgc2hvdWxk
Cj4gPj4+IGJlIG5hbWVkIGZvci1lYWNoLWNvbW1pdC5zaCA/Cj4gPj4KPiA+PiBFeGNlcHQgdGhh
dCB5b3UgYWxzbyBidWlsZCBqdXN0IHRoZSB3aG9sZSBzZXJpZXMgaWYgdGhlIGJhc2UgYW5kIHRp
cAo+ID4+IGFyZW4ndCBzcGVjaWZpZWQuCj4gPj4KPiA+IAo+ID4gV2hhdCBkbyB5b3UgbWVhbiBi
eSB0aGlzPyBCYXNlIGFuZCB0aXAgYXJlIHJlcXVpcmVkLgo+IAo+IE9oLCBzbyBpdCBkb2VzLiAg
U29ycnksIGZvciBzb21lIHJlYXNvbiB3aGVuIEkgc2tpbW1lZCBpdCB0aGUgZmlyc3QgdGltZQo+
IEkgdGhvdWdodCBJIHNhdyB0aGF0IGl0IGhhZCB0d28gZGlmZmVyZW50IG1vZGVzLgo+IAo+ID4+
IFNpbmNlIGl0J3MgYWJvdXQgYnVpbGRpbmcgYSBzZXJpZXMgKGVpdGhlciBhbGwgYXQgb25jZSBv
ciBvbmUgY29tbWl0Cj4gPj4gYXQgYSB0aW1lKSwgd2hhdCBhYm91dCBidWlsdC1zZXJpZXM/ICBP
ciBzZXJpZXMtYnVpbGQtdGVzdD8KPiA+Pgo+ID4gCj4gPiBOb3Qgc3VyZS4gTXkgcG9pbnQgd2Fz
IGl0IGNvdWxkIGRvIG1vcmUgdGhpbmdzIHRoYW4ganVzdCBidWlsZGluZy4gWW91Cj4gPiBjYW4g
c3VwcGx5IHlvdXIgb3duIHNjcmlwdCBvciBjb21tYW5kcyB0byBkbyBzdHVmZiB3aXRoIGVhY2gg
Y29tbWl0Lgo+IAo+IFllcywgaW4gdGhhdCBjYXNlLCBzb21ldGhpbmcgbGlrZSBmb3ItZWFjaC1j
b21taXQgd291bGQgYmUgc2Vuc2libGUuCj4gQWx0aG91Z2ggSSBtaWdodCBjb25zaWRlciBub3Qg
aW5jbHVkaW5nIHRoZSAnZGVmYXVsdCBidWlsZCcgY29tbWFuZCBpbgo+IHRoZSBzY3JpcHQgaW4g
dGhhdCBjYXNlLCBvbiB0aGUgZ3JvdW5kcyB0aGF0IGl0IHdvdWxkIHZpb2xhdGUgdGhlCj4gcHJp
bmNpcGxlIG9mIGxlYXN0IHN1cnByaXNlIGZvciBhIHNjcmlwdCBuYW1lZCAiZm9yLWVhY2gtY29t
bWl0IiB0bwo+IHN0YXJ0IGJ1aWxkaW5nIHRoaW5ncyBvbiBpdHMgb3duLgoKVGhpbmtpbmcgYWJv
dXQgaXQgdGhlIG1haW4gcHVycG9zZSBvZiB0aGlzIHNjcmlwdCBpcyBoZWxwIGJ1aWxkIHRlc3Qu
IEl0CmNhbiBiZSAoYWIpdXNlZCB0byBzb21lIG90aGVyIHRoaW5ncyBpcyBzZWNvbmRhcnkuIEkg
dGhpbmsgSSB3aWxsIGtlZXAKYnVpbGQtdGVzdC5zaCBmb3Igbm93LgoKV2VpLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
