From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/IO-APIC: fix build with gcc9
Date: Thu, 23 May 2019 15:35:01 +0100
Message-ID: <30ea972e-f693-e223-ae46-8bef2d0714a2@citrix.com>
References: <5CE6A6020200007800231BBD@prv1-mh.provo.novell.com>
 <20190523142033.GF2373@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=52eM=TX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hTooE-0000rb-VO
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 14:35:07 +0000
In-Reply-To: <20190523142033.GF2373@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDUvMjAxOSAxNToyMCwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIE1heSAyMywgMjAx
OSBhdCAwNzo1NDoxMEFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVGhlcmUgYXJlIGEg
bnVtYmVyIG9mIHBvaW50bGVzcyBfX3BhY2tlZCBhdHRyaWJ1dGVzIHdoaWNoIGNhdXNlIGdjYyA5
IHRvCj4+IGxlZ2l0aW1hdGVseSB3YXJuOgo+Pgo+PiB1dGlscy5jOiBJbiBmdW5jdGlvbiAndnRk
X2R1bXBfaW9tbXVfaW5mbyc6Cj4+IHV0aWxzLmM6Mjg3OjMzOiBlcnJvcjogY29udmVydGluZyBh
IHBhY2tlZCAnc3RydWN0IElPX0FQSUNfcm91dGVfZW50cnknIHBvaW50ZXIgKGFsaWdubWVudCAx
KSB0byBhICdzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9yZW1hcF9lbnRyeScgcG9pbnRlciAoYWxpZ25t
ZW50IDgpIG1heSByZXN1bHQgaW4gYW4gdW5hbGlnbmVkIHBvaW50ZXIgdmFsdWUgWy1XZXJyb3I9
YWRkcmVzcy1vZi1wYWNrZWQtbWVtYmVyXQo+PiAgIDI4NyB8ICAgICAgICAgICAgICAgICByZW1h
cCA9IChzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9yZW1hcF9lbnRyeSAqKSAmcnRlOwo+PiAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fgo+Pgo+PiBpbnRyZW1hcC5jOiBJbiBmdW5jdGlvbiAnaW9hcGljX3J0ZV90b19yZW1hcF9lbnRy
eSc6Cj4+IGludHJlbWFwLmM6MzQzOjI1OiBlcnJvcjogY29udmVydGluZyBhIHBhY2tlZCAnc3Ry
dWN0IElPX0FQSUNfcm91dGVfZW50cnknIHBvaW50ZXIgKGFsaWdubWVudCAxKSB0byBhICdzdHJ1
Y3QgSU9fQVBJQ19yb3V0ZV9yZW1hcF9lbnRyeScgcG9pbnRlciAoYWxpZ25tZW50IDgpIG1heSBy
ZXN1bHQgaW4gYW4gdW5hbGlnbmVkIHBvaW50ZXIgdmFsdWUgWy1XZXJyb3I9YWRkcmVzcy1vZi1w
YWNrZWQtbWVtYmVyXQo+PiAgIDM0MyB8ICAgICByZW1hcF9ydGUgPSAoc3RydWN0IElPX0FQSUNf
cm91dGVfcmVtYXBfZW50cnkgKikgb2xkX3J0ZTsKPj4gICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4+Cj4+IFNpbXBseSBkcm9wIHRoZXNl
IGF0dHJpYnV0ZXMuIFRha2UgdGhlIGxpYmVydHkgYW5kIGFsc28gcmUtZm9ybWF0IHRoZQo+PiBz
dHJ1Y3R1cmUgZGVmaW5pdGlvbnMgYXQgdGhlIHNhbWUgdGltZS4KPj4KPj4gUmVwb3J0ZWQtYnk6
IENoYXJsZXMgQXJub2xkIDxjYXJub2xkQHN1c2UuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KCkkndmUgZ290IGFub3RoZXIgaWRlbnRpY2FsIHBhdGNoIHdoaWNoIEkg
aGFkbid0IGdvdCBhcm91bmQgdG8gc2VuZGluZwp1cHN0cmVhbS4KCldlJ3ZlIGdvdCBmdXJ0aGVy
IGlzc3VlcyB3aXRoIFVCU0FOLsKgIFdoaWxlIEkndmUgZ290IHRoZSBBUEkgZml4ZXMKc29ydGVk
LCB0aGUgcmVzdXRsaW5nIGJpbmFyeSBjcmFzaGVzIGFsbW9zdCBpbW1lZGlhdGVseSBvbiBib290
IGFuZCBJCmhhdmVuJ3QgZmlndXJlZCBvdXQgd2h5IHlldC4KCn5BbmRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
