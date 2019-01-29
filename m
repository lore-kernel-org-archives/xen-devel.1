From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] tools/libxl: Fix leaking ssid_label in
 libxl_name_to_domid
Date: Mon, 28 Jan 2019 17:57:04 -0700
Message-ID: <CABfawh=2-uwDGwQKPP8rPc87V-WButmkNpLJGag2TAqqMhRtKw@mail.gmail.com>
References: <20190127054507.30838-1-tamas@tklengyel.com>
 <20190128121547.rj77srqrn66ui6e5@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hilF=QF=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1goHii-0005HC-VZ
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 00:57:45 +0000
Received: by mail-ed1-f67.google.com with SMTP id f9so14614492eds.10
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jan 2019 16:57:42 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43])
 by smtp.gmail.com with ESMTPSA id e51sm14271910edd.35.2019.01.28.16.57.40
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Jan 2019 16:57:40 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id z5so20145668wrt.11
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jan 2019 16:57:40 -0800 (PST)
In-Reply-To: <20190128121547.rj77srqrn66ui6e5@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjgsIDIwMTkgYXQgNToxNiBBTSBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPiB3cm90ZToKPgo+IE9uIFNhdCwgSmFuIDI2LCAyMDE5IGF0IDEwOjQ1OjA3UE0gLTA3MDAs
IFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+IE9uIHN5c3RlbXMgd2l0aCBYU00gZW5hYmxlZCBs
aWJ4bF9uYW1lX3RvX2RvbWlkIGxlYWtzIG1lbW9yeQo+ID4gYWxsb2NhdGVkIGZvciBzc2lkX2xh
YmVsOgo+ID4KPiA+ID09MjY5Mz09IDUzIGJ5dGVzIGluIDIgYmxvY2tzIGFyZSBkZWZpbml0ZWx5
IGxvc3QgaW4gbG9zcyByZWNvcmQgNCBvZiA4Cj4gPiA9PTI2OTM9PSAgICBhdCAweDRDMkJFNkQ6
IG1hbGxvYyAodmdfcmVwbGFjZV9tYWxsb2MuYzozMDkpCj4gPiA9PTI2OTM9PSAgICBieSAweDZD
MEEzQjk6IHN0cmR1cCAoc3RyZHVwLmM6NDIpCj4gPiA9PTI2OTM9PSAgICBieSAweDUxMDgyOTQ6
IGxpYnhsX2ZsYXNrX3NpZF90b19jb250ZXh0IChsaWJ4bF9mbGFzay5jOjM5KQo+ID4gPT0yNjkz
PT0gICAgYnkgMHg1MEMyQjY0OiBsaWJ4bF9feGNpbmZvMnhsaW5mbyAobGlieGxfZG9tYWluLmM6
MjY3KQo+ID4gPT0yNjkzPT0gICAgYnkgMHg1MEMyRTAyOiBsaWJ4bF9saXN0X2RvbWFpbiAobGli
eGxfZG9tYWluLmM6MzA4KQo+ID4gPT0yNjkzPT0gICAgYnkgMHg1MDhBM0M1OiBsaWJ4bF9uYW1l
X3RvX2RvbWlkIChsaWJ4bF91dGlscy5jOjc3KQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFRhbWFz
IEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KPiA+IENjOiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiA+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgo+ID4gLS0tCj4gPiAgdG9vbHMvbGlieGwvbGlieGxfdXRpbHMuYyB8IDIgKysKPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xz
L2xpYnhsL2xpYnhsX3V0aWxzLmMgYi90b29scy9saWJ4bC9saWJ4bF91dGlscy5jCj4gPiBpbmRl
eCBlNTBlMDk0YzQ4Li45OWFiZmE1NDk3IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvbGlieGwvbGli
eGxfdXRpbHMuYwo+ID4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfdXRpbHMuYwo+ID4gQEAgLTc5
LDYgKzc5LDggQEAgaW50IGxpYnhsX25hbWVfdG9fZG9taWQobGlieGxfY3R4ICpjdHgsIGNvbnN0
IGNoYXIgKm5hbWUsCj4gPiAgICAgICAgICByZXR1cm4gRVJST1JfTk9NRU07Cj4gPgo+ID4gICAg
ICBmb3IgKGkgPSAwOyBpIDwgbmJfZG9tYWluczsgaSsrKSB7Cj4gPiArICAgICAgICBpZiAoZG9t
aW5mb1tpXS5zc2lkX2xhYmVsKQo+ID4gKyAgICAgICAgICAgIGZyZWUoZG9taW5mb1tpXS5zc2lk
X2xhYmVsKTsKPiA+ICAgICAgICAgIGRvbW5hbWUgPSBsaWJ4bF9kb21pZF90b19uYW1lKGN0eCwg
ZG9taW5mb1tpXS5kb21pZCk7Cj4gPiAgICAgICAgICBpZiAoIWRvbW5hbWUpCj4gPiAgICAgICAg
ICAgICAgY29udGludWU7Cj4KPiBUaGFua3MgZm9yIHJlcG9ydGluZyB0aGlzIGlzc3VlLiBJIHRo
aW5rIHlvdXIgcGF0Y2ggaXNuJ3QgZnV0dXJlLXByb29mLgo+Cj4gQ2FuIHlvdSB0cnkgdGhlIGZv
bGxvd2luZyBwYXRjaD8KCldvcmtzIHRvby4KClRoYW5rcywKVGFtYXMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
