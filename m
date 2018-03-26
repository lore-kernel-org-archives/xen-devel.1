From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/3] README: document that qemu-trad wants
 libpci
Date: Mon, 26 Mar 2018 07:53:15 -0600
Message-ID: <5AB9176B02000078001B6218@prv1-mh.provo.novell.com>
References: <20180325142115.15169-1-cardoe@cardoe.com>
 <20180325142605.15404-1-cardoe@cardoe.com>
 <5AB8E51202000078001B6004@prv1-mh.provo.novell.com>
 <5a1cb2b2-7390-e584-e465-147fd687e314@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5a1cb2b2-7390-e584-e465-147fd687e314@cardoe.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAzLjE4IGF0IDE1OjIyLCA8Y2FyZG9lQGNhcmRvZS5jb20+IHdyb3RlOgo+IE9u
IDMvMjYvMTggNToxOCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI1LjAzLjE4IGF0
IDE2OjI2LCA8Y2FyZG9lQGNhcmRvZS5jb20+IHdyb3RlOgo+Pj4gcWVtdS10cmFkaXRpb25hbCB3
YW50cyBsaWJwY2kgZnJvbSBwY2l1dGlscyBmb3Igc3VwcG9ydGluZyBQQ0kKPj4+IHBhc3N0aHJv
dWdoLgo+PiAKPj4gSWlyYyBpdCBidWlsZHMgZmluZSB3aXRob3V0LCBkaXNhYmxpbmcgcmVzcGVj
dGl2ZSBjb2RlLiBIZW5jZSBJIGRvbid0Cj4+IHRoaW5rIHRoaXMgZnVsbHkgZml0cyB0aGUgb3Ro
ZXIgKHN0cmljdCkgcmVxdWlyZW1lbnRzLgo+IAo+IEkgcHV0IGl0IHVuZGVyIHRoZSBzZWN0aW9u
IHRoYXQgcmVhZHM6Cj4gCj4gSW4gYWRkaXRpb24gdG8gdGhlIGFib3ZlIHRoZXJlIGFyZSBhIG51
bWJlciBvZiBvcHRpb25hbCBidWlsZAo+IHByZXJlcXVpc2l0ZXMuIE9taXR0aW5nIHRoZXNlIHdp
bGwgY2F1c2UgdGhlIHJlbGF0ZWQgZmVhdHVyZXMgdG8gYmUKPiBkaXNhYmxlZCBhdCBjb21waWxl
IHRpbWU6Cj4gCj4gSSBmaWd1cmVkIHdpdGggdGhhdCBjYXZlYXQgYW5kIG1lbnRpb25pbmcgUENJ
IHBhc3N0aHJvdWdoIHRoYXQgaXQgd2FzCj4gZ29vZCBlbm91Z2ggYnV0IEkgY2FuIGhhcHBpbHkg
cmV3b3JkIGZ1cnRoZXIuCgpUaGUgaW1tZWRpYXRlbHkgcHJlY2VkaW5nIGl0ZW0gaXMKCiAgICAq
IDE2LWJpdCB4ODYgYXNzZW1ibGVyLCBsb2FkZXIgYW5kIGNvbXBpbGVyIGZvciBxZW11LXRyYWRp
dGlvbmFsIC8gcm9tYmlvcwogICAgICAoZGV2ODYgcnBtIG9yIGJpbjg2ICYgYmNjIGRlYnMpCgpB
aXVpIHFlbXUtdHJhZCB3b24ndCBidWlsZCBhbmQvb3Igd29yayB3aXRob3V0IHRoZXNlLiBBcyBt
ZW50aW9uZWQKSSBiZWxpZXZlIHFlbXUtdHJhZCBib3RoIGJ1aWxkcyBhbmQgd29ya3MgZmluZSB3
aXRob3V0IGxpYnBjaSwganVzdAp0aGF0IFBDSSBwYXNzdGhyb3VnaCB3b24ndCBiZSBwb3NzaWJs
ZS4gSG93IGFib3V0CgogICAgKiBsaWJwY2kgZnJvbSBwY2l1dGlscyBmb3IgcWVtdS10cmFkaXRp
b25hbCB0byBzdXBwb3J0IFBDSSBwYXNzdGhyb3VnaAoKPyBUaGF0J3Mgc3RpbGwgbm90IGFzIGV4
cGxpY2l0bHkgb3B0aW9uYWwgYXMgSSB3b3VsZCB3YW50IGl0LCBidXQgSSBjYW4ndAp0aGluayBv
ZiBhbnkgYmV0dGVyIHdvcmRpbmcgKHdpdGhvdXQgdGhlIGVudHJ5IGdldHRpbmcgdW5kZXNpcmFi
bHkKbG9uZykuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
