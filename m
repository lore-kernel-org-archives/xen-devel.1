From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxl: add libxl__is_driver_domain function
Date: Fri, 23 Feb 2018 17:44:48 +0000
Message-ID: <20180223174448.3vmc7a74vr6b42lx@citrix.com>
References: <1513260853-3450-1-git-send-email-al1img@gmail.com>
 <20180206123635.xqjoqsq4dfgve73d@citrix.com>
 <CACvf2oV9sJPJ9cK6HsstthSmpuh6SC-y058qmV6_=zExRRgd5A@mail.gmail.com>
 <20180213120658.bshetw3jommut5nj@citrix.com>
 <CACvf2oWkY6=tHqQ=pYHj6cH+g01FrSrr_iJbu1qPrrnmeXgJYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=se9o=fr=citrix.com=prvs=5854c8178=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1epHPG-0003m5-4I
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 17:45:14 +0000
Content-Disposition: inline
In-Reply-To: <CACvf2oWkY6=tHqQ=pYHj6cH+g01FrSrr_iJbu1qPrrnmeXgJYw@mail.gmail.com>
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

T24gVHVlLCBGZWIgMTMsIDIwMTggYXQgMDM6MzI6MDRQTSArMDIwMCwgT2xla3NhbmRyIEdyeXRz
b3Ygd3JvdGU6Cj4gT24gVHVlLCBGZWIgMTMsIDIwMTggYXQgMjowNiBQTSwgV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4gPiBPbiBUdWUsIEZlYiAwNiwgMjAxOCBhdCAw
MzowODo0NVBNICswMjAwLCBPbGVrc2FuZHIgR3J5dHNvdiB3cm90ZToKPiA+ID4gT24gVHVlLCBG
ZWIgNiwgMjAxOCBhdCAyOjM2IFBNLCBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gPiBPbiBUaHUsIERlYyAxNCwgMjAxNyBhdCAwNDoxNDoxMlBNICswMjAw
LCBPbGVrc2FuZHIgR3J5dHNvdiB3cm90ZToKPiA+ID4gPiA+IEZyb206IE9sZWtzYW5kciBHcnl0
c292IDxvbGVrc2FuZHJfZ3J5dHNvdkBlcGFtLmNvbT4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBXZSBo
YXZlIGZvbGxvd2luZyBhcm0tYmFzZWQgc2V0dXA6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gLSBEb20w
IHdpdGggeGVuIGFuZCB4ZW4gdG9vbHM7Cj4gPiA+ID4gPiAtIERvbTEgd2l0aCBkZXZpY2UgYmFj
a2VuZHMgKGJ1dCBpdCBpcyBub3QgdGhlIGRyaXZlciBkb21haW4pOwo+ID4gPiA+Cj4gPiA+ID4g
V2hhdCBpcyB5b3VyIGRlZmluaXRpb24gb2YgYSAiZHJpdmVyIGRvbWFpbiI/IFdoYXQgZG9lcyBp
dCBkbyBpbiB0aGlzCj4gPiA+ID4gY2FzZT8KPiA+ID4gPgo+ID4gPiA+IEkgc2VlbSB0byBoYXZl
IHNlZW4gcGVvcGxlIHVzZSB0aGlzIHRlcm0gaW4gZGlmZmVyZW50IGNvbnRleHRzIHRvIG1lYW4K
PiA+ID4gPiBzbGlnaHRseSBkaWZmZXJlbnQgdGhpbmdzLiBJIG5lZWQgdG8gZmlndXJlIG91dCB3
aGF0IHlvdSBhY3R1YWxseSBtZWFuCj4gPiA+ID4gZmlyc3QuCj4gPiA+ID4KPiA+ID4gPgo+ID4g
PiBJIHNlZSBpbiB0aGUgbGlieGwveGwgc291cmNlcyB0aGF0IGNsb3NpbmcgUFYgZGV2aWNlcyBp
cyBkb25lIGRpZmZlcmVudGx5Cj4gPiA+IGluIGNhc2UgYmFja2VuZHMgYXJlIGluIERvbTAgYW5k
IGFyZSBpbiBvdGhlciBkb21haW4uIEl0IGlzIGNhbGxlZCBhcwo+ID4gPiBkcml2ZXIgZG9tYWlu
IGluIHRoZSBzb3VyY2VzLiBTbywgSSBkb24ndCBoYXZlIGNsZWFyIHVuZGVyc3RhbmRpbmcKPiA+
ID4gd2hhdCBkb2VzIGl0IG1lYW4uIEluIG91ciBzZXR1cCBiYWNrZW5kcyBhcmUgaW4gRG9tMSBh
bmQgeGwgaXMgaW4gRG9tMC4KPiA+ID4gQW5kIEkgc2VlIHRoYXQgeGwgZG9zbid0IGNsb3NlIFBW
IGRldmljZSBvbiBkb21haW4gcmVib290IG9yIHNodXRkb3duLgo+ID4KPiA+IERvIHlvdSBydW4g
eGwgZGV2ZCBpbiB5b3VyIGJhY2tlbmQgZG9tYWluPwo+ID4KPiA+IFdlaS4KPiA+Cj4gCj4gTm8g
SSBkb24ndAoKQ2FuIHlvdSB0cnkgdGhhdD8gSSB0aGluayB4bCBkZXZkIHNob3VsZCBjbGVhbiB1
cCB0aGUgc3RhbGUgZW50cmllcyAtLQp0aGF0J3MgaG93IHdlIGVudmlzYWdlIGRyaXZlciBkb21h
aW5zIHRvIGJlIHVzZWQuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
