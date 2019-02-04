From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH RFC v2 1/2] x86/emulate: Move
 hvmemul_linear_to_phys
Date: Mon, 4 Feb 2019 17:26:30 +0200
Message-ID: <8b8dd3fd-9bb2-9140-c216-54310147fc8c@bitdefender.com>
References: <20190111153657.13532-1-aisaila@bitdefender.com>
 <982cf63a-8062-5e96-3a6c-02cbc8bcc9fb@bitdefender.com>
 <4b350789912046acaa1dc73934835429@AMSPEX02CL03.citrite.net>
 <fb615746-d8c4-40b9-7d1c-37ad1818343f@bitdefender.com>
 <20190204151429.j3co5qlaatqmjt5q@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P7Cd=QL=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gqg8t-000419-IJ
 for xen-devel@lists.xenproject.org; Mon, 04 Feb 2019 15:26:39 +0000
In-Reply-To: <20190204151429.j3co5qlaatqmjt5q@mac>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Paul Durrant <Paul.Durrant@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, 'Alexandru Stefan ISAILA' <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMi80LzE5IDU6MTQgUE0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gTW9uLCBGZWIg
MDQsIDIwMTkgYXQgMDI6MDA6NDBQTSArMDIwMCwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+PiBP
biAyLzQvMTkgMTo1NSBQTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4+Pj4gRnJvbTogQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgW21haWx0bzph
aXNhaWxhQGJpdGRlZmVuZGVyLmNvbV0KPj4+PiBTZW50OiAwNCBGZWJydWFyeSAyMDE5IDExOjM3
Cj4+Pj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+Pj4+IENjOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgamJldWxpY2hAc3VzZS5jb207IEFuZHJl
dwo+Pj4+IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+OyBSb2dlcgo+Pj4+IFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+OyByY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tOwo+Pj4+IHRhbWFzQHRrbGVuZ3llbC5jb207
IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT4KPj4+PiBTdWJqZWN0OiBS
ZTogW1BBVENIIFJGQyB2MiAxLzJdIHg4Ni9lbXVsYXRlOiBNb3ZlIGh2bWVtdWxfbGluZWFyX3Rv
X3BoeXMKPj4+Pgo+Pj4+IFBpbmcsIGFueSB0aG91Z2h0cyBvbiB0aGlzIGFyZSBhcHByZWNpYXRl
ZC4KPj4+Pgo+Pj4+IFJlZ2FyZHMsCj4+Pj4gQWxleAo+Pj4+Cj4+Pj4gT24gMTEuMDEuMjAxOSAx
NzozNywgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4+Pj4+IFRoaXMgaXMgZG9uZSBz
byBodm1lbXVsX2xpbmVhcl90b19waHlzKCkgY2FuIGJlIGNhbGxlZCBmcm9tCj4+Pj4+IGh2bWVt
dWxfbWFwX2xpbmVhcl9hZGRyKCkKPj4+Pj4KPj4+Cj4+PiBJIGhhdmUgbm8gb2JqZWN0aW9uIHRv
IHB1cmUgY29kZSBtb3ZlbWVudCBmb3IgdGhpcyBwdXJwb3NlLiBJIGNlcnRhaW5seSBwcmVmZXIg
aXQgdG8gZm9yd2FyZCBkZWNsYXJhdGlvbiBvZiBzdGF0aWNzLgo+PiBUaGFua3MgZm9yIHRoZSBy
ZXBseSEKPj4KPj4gV2UncmUgYWxzbyBhZnRlciB0aG91Z2h0cyBvbiB0aGUgd2hvbGUgc2VyaWVz
IChyZXBseWluZyB0byB0aGlzIHNwZWNpZmljCj4+IHBhdGNoIGluc3RlYWQgb2YgdGhlIGNvdmVy
IGxldHRlciB3YXMgYW4gYWNjaWRlbnQpLgo+Pgo+PiBXZSBleHBlY3QgdGhlIHNlY29uZCBwYXRj
aCB0byBiZSBtb3JlIGNvbnRyb3ZlcnNpYWwgYW5kIGluIHNvbWUgbmVlZCBvZgo+PiBkZXRhaWxl
ZCBzY3J1dGlueS4KPiAKPiBJJ3ZlIHRha2VuIGEgbG9vayBhdCBwYXRjaCAyIGFuZCBwcm92aWRl
ZCBzb21lIHJldmlldyBjb21tZW50cywgc29ycnkKPiBmb3IgdGhlIGRlbGF5LiBLZWVwIGluIG1p
bmQgd2UgYXJlIGluIHRoZSBtaWRkbGUgb2YgdGhlIHJlbGVhc2UKPiBwcm9jZXNzIGFuZCBtb3N0
IGRldmVsb3BlcnMgYW5kIHJldmlld2VycyBhcmUgYnVzeSB0cnlpbmcgdG8gZml4IGJ1Z3MKPiBv
ciByZXZpZXdpbmcgYnVnZml4ZXMuCgpWZXJ5IG11Y2ggYXBwcmVjaWF0ZWQhCgoKVGhhbmtzLApS
YXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
