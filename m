From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11 v2 0/2] Add Designated Reviewer
 (R:) to MAINTAINERS (plus a test case)
Date: Mon, 30 Apr 2018 02:32:07 -0600
Message-ID: <5AE6D48702000078001BF80C@prv1-mh.provo.novell.com>
References: <cover.1524851673.git.lars.kurth@citrix.com>
 <5AE6CC2502000078001BF7A0@prv1-mh.provo.novell.com>
 <8A88031C-5A37-43BB-A62D-95495D41AA5C@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xfxw=ht=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fD4EJ-0005QU-BP
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 08:32:15 +0000
In-Reply-To: <8A88031C-5A37-43BB-A62D-95495D41AA5C@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>, brian.woods@amd.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA0LjE4IGF0IDEwOjIxLCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToK
Cj4gCj4g77u/T24gMzAvMDQvMjAxOCwgMDg6NTcsICJKYW4gQmV1bGljaCIgPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPiAKPiAgICAgPj4+IE9uIDI3LjA0LjE4IGF0IDIwOjAxLCA8bGFycy5r
dXJ0aEBjaXRyaXguY29tPiB3cm90ZToKPiAgICAgPiBUaGlzIGZvbGxvd3MgdXAgZnJvbSBhIGNv
bnZlcnNhdGlvbiBhZnRlciB0aGUgQXByaWwgeDg2IGNvbW11bml0eSBjYWxsLCAKPiBpbiAKPiAg
ICAgPiB3aGljaCBJIGhhZAo+ICAgICA+IHRoZSBmb2xsb3dpbmcgYWN0aW9uOiBMYXJzIHRvIHBy
b3Bvc2UgZml4aW5nIENDIGlzc3VlIGluIAo+IHhlbi5naXQ6TUFJTlRBSU5FUlMgCj4gICAgID4g
Y29weWluZyAKPiAgICAgPiB0aGUgUiBzZWN0aW9uIGVudHJpZXMgZnJvbSBMaW51eC5naXQ6TUFJ
TlRBSU5FUlMgKHdpbGwgbmVlZCBjaGFuZ2VzIHRvIAo+ICAgICA+IGdldF9tYWludGFpbmVycy5w
bCBhbHNvKQo+ICAgICA+IAo+ICAgICA+IE9uIDI3LzQvMTggSnVlcmdlbiBnYXZlIGEgUkFCIHZp
YSBJUkMKPiAgICAgPiAKPiAgICAgPiBDYzogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXgu
Y29tPgo+ICAgICA+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pgo+ICAgICA+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+
Cj4gICAgID4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+ICAg
ICA+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gICAgID4gQ2M6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gICAgID4gQ2M6IEtvbnJhZCBSemVzenV0
ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiAgICAgPiBDYzogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+ICAgICA+IENjOiBUaW0gRGVlZ2FuIDx0
aW1AeGVuLm9yZz4KPiAgICAgPiBDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAg
ICAgPiBDYzogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+Cj4gICAgID4gQ2M6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAgICAgPiAKPiAgICAgPiBSZWxlYXNlLWFj
a2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gICAgID4gQWNrZWQtYnk6
IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gICAgID4gCj4gICAgID4gTGFycyBLdXJ0
aCAoMik6Cj4gICAgID4gICBBZGQgQnJpYW4gV29vZHMgYXMgRGVzaWduYXRlZCByZXZpZXdlciB0
byBBTUQgSU9NTVUgYW5kIEFNRCBTVk0KPiAgICAgPiAgIEFkZCBEZXNpZ25hdGVkIFJldmlld2Vy
IChSOikgdG8gTUFJTlRBSU5FUlMgZmlsZSBhbmQgYWRkIHN1cHBvcnQgZm9yCj4gICAgID4gICAg
IGl0IGluIGdldF9tYWludGFpbmVyLnBsCj4gICAgIAo+ICAgICBUaGUgb3JkZXIgb2YgdGhlIHBh
dGNoZXMgaGFzIGJlZW4gdW5leHBlY3RlZGx5IHN3YXBwZWQsIGFuZCBzZWVtcyB3cm9uZyB0bwo+
ICAgICBtZSBub3c7IGdyYW50ZWQgdGhpcyBpcyBvbmx5IGNvc21ldGljIGlmIGJvdGggZ28gaW4g
YXQgdGhlIHNhbWUgdGltZS4KPiAgICAgCj4gVGhhdCBpcyBteSBmYXVsdDogSSBnb3QgaW50byB0
cm91YmxlIHdpdGggZ2l0IGFuZCBtdXN0IGhhdmUgZG9uZSBzb21ldGhpbmcgCj4gd3JvbmcuIElm
IGl0IGhlbHBzLCBJIGNhbiBzd2l0Y2ggdGhlIG9yZGVyIGFuZCByZS1zZW5kLiAKCkkgZG9uJ3Qg
dGhpbmsgdGhhdCdzIG5lY2Vzc2FyeSAtIHdob2V2ZXIgZW5kcyB1cCBjb21taXR0aW5nIHRoZW0g
Y2FuIGVhc2lseQplbm91Z2ggc3dpdGNoIHRoZW0gYXJvdW5kLiBJIHdvdWxkIGNvbW1pdCB0aGVt
IHJpZ2h0IGF3YXksIGlmIG9ubHkgSSB3YXMKcmVhbGx5IGNsZWFyIHdoZXRoZXIgd2UndmUgYWxs
IHNldHRsZWQgb24gdGhpcy4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
