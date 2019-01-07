From: "DeGraaf, Daniel G" <dgdegra@nsa.gov>
Subject: Re: [PATCH v3 14/15] xsm,
 argo: notify: don't describe rings that cannot be sent to
Date: Mon, 7 Jan 2019 23:06:58 +0000
Message-ID: <BA190A75E8413C49BB9E1D2B85D118118CBCC2E5@MSMR-GH1-UEA01.corp.nsa.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eyHh=PP=nsa.gov=dgdegra@srs-us1.protection.inumbo.net>)
 id 1ggdzC-00015s-0P
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 23:07:10 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Christopher Clark' <christopher.w.clark@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSCB2MyAxNC8xNV0geHNtLCBhcmdvOiBub3RpZnk6IGRvbid0IGRl
c2NyaWJlIHJpbmdzIHRoYXQgY2Fubm90IGJlIHNlbnQgdG8NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci5jbGFyazZAYmFlc3lzdGVtcy5jb20+DQoN
CkkgaGF2ZSBub3QgY2hlY2tlZCB0byBzZWUgaG93IGNvbW1vbmx5IHRoaXMgZnVuY3Rpb24gaXMg
Y2FsbGVkLCBidXQgaXQgbG9va3MgbGlrZSBpdCBtYXkgaGF2ZSB0aGUgcG90ZW50aWFsIGZvciBw
cm9kdWNpbmcgZXhjZXNzaXZlIEFWQyBkZW5pYWxzIHdoZW4ganVzdCBjaGVja2luZy4gIElmIHRo
aXMgaXMgdGhlIGNhc2UsIHVzaW5nIGFub3RoZXIgWFNNIGhvb2sgKG9yIGFkZGluZyBhIGJvb2wg
cGFyYW1ldGVyIHRvIHRoZSBleGlzdGluZyBvbmUpIHRvIGRpc3Rpbmd1aXNoIGJldHdlZW4gdGhp
cyBjYXNlIGFuZCB0aGUgYWN0dWFsIHNlbmQgYXR0ZW1wdCB3b3VsZCBsZXQgeW91IHVzZSBhdmNf
aGFzX3Blcm1fbm9hdWRpdCBoZXJlIHRvIGF2b2lkIHRoYXQgbG9nIHNwYW0uIElmIHRoaXMgY2Fs
bCBkb2Vzbid0IGhhcHBlbiBpbiBzb21lIGF1dG9tYXRlZC9jb21tb24gZmFzaGlvbiwgaXQncyBm
aW5lIGFzLWlzLg0KDQpBY2tlZC1ieTogRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5Y2hvLm5z
YS5nb3Y+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
