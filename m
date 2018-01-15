From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] -xen-attach is needed for pvh boot with
 qemu-xen
Date: Mon, 15 Jan 2018 10:01:36 +0000
Message-ID: <20180115100136.7exf65dajdpxzkis@MacBook-Pro-de-Roger.local>
References: <alpine.LFD.2.21.1801142103030.6069@austen3.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ye/h=ek=citrix.com=prvs=54622e440=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eb1aM-0001wB-7G
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2018 10:01:46 +0000
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.1801142103030.6069@austen3.home>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michael Young <m.a.young@durham.ac.uk>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMTQsIDIwMTggYXQgMDk6MTI6NTFQTSArMDAwMCwgTWljaGFlbCBZb3VuZyB3
cm90ZToKPiBDdXJyZW50bHkgdGhlIGJvb3Qgb2YgYSBwdmggZ3Vlc3QgdXNpbmcgdGhlIHFlbXUt
eGVuIGRldmljZSBtb2RlbCBmYWlscwo+IHdpdGggdGhlIGVycm9yCj4geGVuIGVtdWxhdGlvbiBu
b3QgaW1wbGVtZW50ZWQgKHlldCkKPiBpbiB0aGUgcWVtdS1kbSBsb2cgZmlsZS4gVGhpcyBwYXRj
aCBhZGRzIHRoZSBtaXNzaW5nIC14ZW4tYXR0YWNoCj4gYXJndW1lbnQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTWljaGFlbCBZb3VuZyA8bS5hLnlvdW5nQGR1cmhhbS5hYy51az4KPiAtLS0KPiAgdG9v
bHMvbGlieGwvbGlieGxfZG0uYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxf
ZG0uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKPiBpbmRleCBhMmVhOTVhOWJlLi4zYTgzOWQ1
YzFlIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKPiArKysgYi90b29scy9s
aWJ4bC9saWJ4bF9kbS5jCj4gQEAgLTEwMjEsNyArMTAyMSw4IEBAIHN0YXRpYyBpbnQgbGlieGxf
X2J1aWxkX2RldmljZV9tb2RlbF9hcmdzX25ldyhsaWJ4bF9fZ2MgKmdjLAo+ICAgICAgICovCj4g
ICAgICBmbGV4YXJyYXlfYXBwZW5kKGRtX2FyZ3MsICItbm8tdXNlci1jb25maWciKTsKPiAKPiAt
ICAgIGlmIChiX2luZm8tPnR5cGUgPT0gTElCWExfRE9NQUlOX1RZUEVfUFYpIHsKPiArICAgIGlm
ICgoYl9pbmZvLT50eXBlID09IExJQlhMX0RPTUFJTl9UWVBFX1BWKSB8fAo+ICsgICAgICAgIChi
X2luZm8tPnR5cGUgPT0gTElCWExfRE9NQUlOX1RZUEVfUFZIKSkgewoKQmV0dGVyIHdyaXRlIHRo
aXMgYXMgYl9pbmZvLT50eXBlICE9IExJQlhMX0RPTUFJTl9UWVBFX0hWTS4KCldpdGggdGhhdCBm
aXhlZDoKClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KCkFuZCBzb3JyeSBmb3IgdGhhdCwgSSBjb3VsZCBiZXQgSSd2ZSB0cmllZCB0aGF0LgoKVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
