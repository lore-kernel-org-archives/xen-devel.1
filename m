From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxl: add libxl__is_driver_domain function
Date: Tue, 13 Feb 2018 12:06:58 +0000
Message-ID: <20180213120658.bshetw3jommut5nj@citrix.com>
References: <1513260853-3450-1-git-send-email-al1img@gmail.com>
 <20180206123635.xqjoqsq4dfgve73d@citrix.com>
 <CACvf2oV9sJPJ9cK6HsstthSmpuh6SC-y058qmV6_=zExRRgd5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ira/=fh=citrix.com=prvs=575af4770=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1elZMm-0006TR-3r
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 12:07:20 +0000
Content-Disposition: inline
In-Reply-To: <CACvf2oV9sJPJ9cK6HsstthSmpuh6SC-y058qmV6_=zExRRgd5A@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Grytsov <al1img@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Oleksandr Grytsov <oleksandr_grytsov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMDYsIDIwMTggYXQgMDM6MDg6NDVQTSArMDIwMCwgT2xla3NhbmRyIEdyeXRz
b3Ygd3JvdGU6Cj4gT24gVHVlLCBGZWIgNiwgMjAxOCBhdCAyOjM2IFBNLCBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPiB3cm90ZToKPiAKPiA+IE9uIFRodSwgRGVjIDE0LCAyMDE3IGF0IDA0
OjE0OjEyUE0gKzAyMDAsIE9sZWtzYW5kciBHcnl0c292IHdyb3RlOgo+ID4gPiBGcm9tOiBPbGVr
c2FuZHIgR3J5dHNvdiA8b2xla3NhbmRyX2dyeXRzb3ZAZXBhbS5jb20+Cj4gPiA+Cj4gPiA+IFdl
IGhhdmUgZm9sbG93aW5nIGFybS1iYXNlZCBzZXR1cDoKPiA+ID4KPiA+ID4gLSBEb20wIHdpdGgg
eGVuIGFuZCB4ZW4gdG9vbHM7Cj4gPiA+IC0gRG9tMSB3aXRoIGRldmljZSBiYWNrZW5kcyAoYnV0
IGl0IGlzIG5vdCB0aGUgZHJpdmVyIGRvbWFpbik7Cj4gPgo+ID4gV2hhdCBpcyB5b3VyIGRlZmlu
aXRpb24gb2YgYSAiZHJpdmVyIGRvbWFpbiI/IFdoYXQgZG9lcyBpdCBkbyBpbiB0aGlzCj4gPiBj
YXNlPwo+ID4KPiA+IEkgc2VlbSB0byBoYXZlIHNlZW4gcGVvcGxlIHVzZSB0aGlzIHRlcm0gaW4g
ZGlmZmVyZW50IGNvbnRleHRzIHRvIG1lYW4KPiA+IHNsaWdodGx5IGRpZmZlcmVudCB0aGluZ3Mu
IEkgbmVlZCB0byBmaWd1cmUgb3V0IHdoYXQgeW91IGFjdHVhbGx5IG1lYW4KPiA+IGZpcnN0Lgo+
ID4KPiA+Cj4gSSBzZWUgaW4gdGhlIGxpYnhsL3hsIHNvdXJjZXMgdGhhdCBjbG9zaW5nIFBWIGRl
dmljZXMgaXMgZG9uZSBkaWZmZXJlbnRseQo+IGluIGNhc2UgYmFja2VuZHMgYXJlIGluIERvbTAg
YW5kIGFyZSBpbiBvdGhlciBkb21haW4uIEl0IGlzIGNhbGxlZCBhcwo+IGRyaXZlciBkb21haW4g
aW4gdGhlIHNvdXJjZXMuIFNvLCBJIGRvbid0IGhhdmUgY2xlYXIgdW5kZXJzdGFuZGluZwo+IHdo
YXQgZG9lcyBpdCBtZWFuLiBJbiBvdXIgc2V0dXAgYmFja2VuZHMgYXJlIGluIERvbTEgYW5kIHhs
IGlzIGluIERvbTAuCj4gQW5kIEkgc2VlIHRoYXQgeGwgZG9zbid0IGNsb3NlIFBWIGRldmljZSBv
biBkb21haW4gcmVib290IG9yIHNodXRkb3duLgoKRG8geW91IHJ1biB4bCBkZXZkIGluIHlvdXIg
YmFja2VuZCBkb21haW4/CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
