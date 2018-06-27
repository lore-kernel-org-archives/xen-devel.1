From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 13/31] libxl_qmp: Separate QMP message
 generation from qmp_send_prepare
Date: Wed, 27 Jun 2018 18:12:36 +0100
Message-ID: <20180627171236.GF2052@perard.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-14-anthony.perard@citrix.com>
 <23347.41741.113014.754238@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1vjj=jn=citrix.com=prvs=709756840=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fYE05-0004kd-Sg
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 17:13:01 +0000
Content-Disposition: inline
In-Reply-To: <23347.41741.113014.754238@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdW4gMjcsIDIwMTggYXQgMDM6NDU6MzNQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDEzLzMxXSBsaWJ4bF9xbXA6
IFNlcGFyYXRlIFFNUCBtZXNzYWdlIGdlbmVyYXRpb24gZnJvbSBxbXBfc2VuZF9wcmVwYXJlIik6
Cj4gPiBUaGlzIG5ldyBmdW5jdGlvbiBxbXBfcHJlcGFyZV9xbXBfY21kKCkgY2FuIGJlIHJldXNl
IGxhdGVyIHdoZW4KPiA+IGludHJvZHVjaW5nIGEgZGlmZmVyZW50IHdheSB0byBjb21tdW5pY2F0
ZSB3aXRoIGEgUU1QIHNlcnZlciwKPiA+IGxpYnhsX19ldl9xbXAuCj4gPiAKPiA+IEFsc28sIGFk
ZCB0aGUgUU1QIGVuZCBvZiBjb21tYW5kICdcclxuJyBpbnRvIHRoZSBnZW5lcmF0ZWQgc3RyaW5n
Lgo+IAo+IFdvdWxkIGl0IGJlIHRlcnJpYmx5IGluY29udmVuaWVudCBpZiB0aGlzIGZ1bmN0aW9u
Cj4gCj4gPiArc3RhdGljIGNoYXIgKnFtcF9wcmVwYXJlX3FtcF9jbWQobGlieGxfX2djICpnYywK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpjbWQsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgbGlieGxfX2pzb25fb2Jq
ZWN0ICphcmdzLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBpZCwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX3QgKmxlbl9yKQo+IC4u
Lgo+ID4gKyAgICByZXQgPSBsaWJ4bF9fbWFsbG9jKE5PR0MsIGxlbiArIDMpOwo+IAo+IGFjdHVh
bGx5IHVzZWQgaXRzIGluY29taW5nIGdjID8KClllcywgYmVjYXVzZSBJIHdhbnRlZCB0byBrZWVw
IHRoZSBhbGxvY2F0ZWQgYnVmZmVycyB1bnRpbCBpdCBpcyBhY3R1YWxseQpzZW50LiBCdXQgbWF5
YmUgd2UgY291bGQgcHJvdmlkZSBhIGRpZmZlcmVudCBnYywgYnV0IEknbSBub3Qgc3VyZSB3aGlj
aApvbmUgb3IgaG93IHRvIGdldCBpdC4KClRoYXQgZnVuY3Rpb24gaXMgZ29pbmcgdG8gYmUgY2Fs
bGVkIGJ5Ogo+IGxpYnhsX19ldl9xbXBfcmVnaXN0ZXIobGlieGxfX2djICpnYywgbGlieGxfX2V2
X3FtcCAqZXYsIC4uLi4pCmludHJvZHVjZSBpbiB0aGUgcGF0Y2ggImxpYnhsX3FtcDogSW50cm9k
dWNlIGxpYnhsX19ldl9xbXAgZnVuY3Rpb25zIgoKPiBQZXJoYXBzIGl0IG5lZWRzIGEgMm5kIGdj
IGFyZ3VtZW50ID8KPiAKPiBJIHRoaW5rIGZvciBmdXR1cmUgd2Ugc2hvdWxkIGJlIHVzaW5nIHNv
bWUgYXBwcm9wcmlhdGUgYW8gZ2MsIG9yCj4gc29tZXRoaW5nLCBmb3IgdGhlc2UgYnVmZmVycy4g
IEJ1dCwgYW55d2F5LCB0aGF0IGlzIGEgZnV0dXJlCj4gaW1wcm92ZW1lbnQsIGFuZCBub3QgYSBi
bG9ja2VyIGZvciB0aGlzIHBhdGNoLgoKU3VyZS4KCj4gU286Cj4gCj4gQWNrZWQtYnk6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKVGhhbmtzLAoKLS0gCkFudGhvbnkg
UEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
