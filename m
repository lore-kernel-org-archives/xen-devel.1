From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 for-4.11] libxl: fix memory map reported
 to PVH guests
Date: Fri, 20 Apr 2018 17:00:35 +0200
Message-ID: <30f41f72-98da-79ac-3445-675b55ab0de3@suse.com>
References: <20180420145719.5702-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=7tp6=hj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f9XWi-0001dI-FX
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 15:00:40 +0000
In-Reply-To: <20180420145719.5702-1-roger.pau@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDQvMTggMTY6NTcsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBQVkggZ3Vlc3RzIHdp
dGggNEdCIG9mIFJBTSBvciBtb3JlIGdldCBhIG1lbW9yeSBtYXAgbGlrZSB0aGUKPiBmb2xsb3dp
bmc6Cj4gCj4gMHgwMDAwMDAwMDAwMDAwMCAtIDB4MDAwMDAwZmVlMDAwMDAgUkFNCj4gMHgwMDAw
MDBmZWUwMDAwMCAtIDB4MDAwMDAxMDAwMDAwMDAgUkVTRVJWRUQKPiAweDAwMDAwMGZjMDA5MDAw
IC0gMHgwMDAwMDBmYzAwOTA0MCBBQ1BJCj4gMHgwMDAwMDBmYzAwMDAwMCAtIDB4MDAwMDAwZmMw
MDEwMDAgQUNQSQo+IDB4MDAwMDAwZmMwMDEwMDAgLSAweDAwMDAwMGZjMDA5MDAwIEFDUEkKPiAw
eDAwMDAwMTAwMDAwMDAwIC0gMHgwMDAwMDFmYjIwMDQwMCBSQU0KPiAKPiBUaGlzIGlzIHdyb25n
IGJlY2F1c2UgQUNQSSByZWdpb25zIG92ZXJsYXAgd2l0aCBSQU0gcmVnaW9ucy4gVGhlIGNhdXNl
Cj4gb2YgdGhpcyBpc3N1ZSBpcyBub3Qgc2V0dGluZyBhIGJpZyBlbm91Z2ggTU1JTyBob2xlIGFu
ZCBtYXJraW5nIHRoZQo+IHdob2xlIE1NSU8gaG9sZSBhcyByZXNlcnZlZCwgd2hlbiBpdCBhY3R1
YWxseSBjb250YWlucyBzZXZlcmFsIHBpZWNlczoKPiAKPiAgLSBsb2NhbCBBUElDIHBhZ2UuCj4g
IC0gQUNQSSB0YWJsZXMuCj4gIC0gSFZNIHNwZWNpYWwgcGFnZXMuCj4gCj4gT2YgdGhvc2UgaXRl
bXMgb25seSBIVk0gc3BlY2lhbCBwYWdlcyBuZWVkIHRvIGJlIG1hcmtlZCBhcyByZXNlcnZlZCBp
bgo+IG9yZGVyIHRvIGFkdmlzZSB0aGUgZ3Vlc3QgYWdhaW5zdCB1c2luZyB0aGVtIGZvciBleGFt
cGxlIGZvciBtZW1vcnkKPiBob3RwbHVnLgo+IAo+IEFmdGVyIHRoZSBmaXggdGhlIGxheW91dCBy
ZXBvcnRlZCBmb3IgdGhlIHNhbWUgZ3Vlc3QgaXM6Cj4gCj4gMHgwMDAwMDAwMDAwMDAwMCAtIDB4
MDAwMDAwZmMwMDAwMDAgUkFNCj4gMHgwMDAwMDBmZWZmODAwMCAtIDB4MDAwMDAwZmYwMDAwMDAg
UkVTRVJWRUQKPiAweDAwMDAwMGZjMDA5MDAwIC0gMHgwMDAwMDBmYzAwOTA0MCBBQ1BJCj4gMHgw
MDAwMDBmYzAwMDAwMCAtIDB4MDAwMDAwZmMwMDEwMDAgQUNQSQo+IDB4MDAwMDAwZmMwMDEwMDAg
LSAweDAwMDAwMGZjMDA5MDAwIEFDUEkKPiAweDAwMDAwMTAwMDAwMDAwIC0gMHgwMDAwMDFmZTAw
MDQwMCBSQU0KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KCllvdSBjb3VsZCBoYXZlIGtlcHQgbXkgUmFiLgoKUmVsZWFzZS1hY2tlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
