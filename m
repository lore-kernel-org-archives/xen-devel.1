From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 2/2] xl: add target cpupool parameter to xl
 migrate
Date: Wed, 3 Oct 2018 11:10:31 +0100
Message-ID: <23476.38295.657414.445152@mariner.uk.xensource.com>
References: <20181002141934.21503-1-jgross@suse.com>
 <20181002141934.21503-3-jgross@suse.com>
 <f1c30cd5-4b9e-7fde-62f1-5c88ad6dc6dd@citrix.com>
 <fd9baf82-62c7-2a88-38e6-586d28cd3bef@suse.com>
 <20181003094416.3hz6k6irleqdnb46@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a25e=mp=citrix.com=prvs=807bdda5f=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1g7e77-00009t-Fr
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 10:10:41 +0000
In-Reply-To: <20181003094416.3hz6k6irleqdnb46@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvMl0geGw6IGFkZCB0YXJn
ZXQgY3B1cG9vbCBwYXJhbWV0ZXIgdG8geGwgbWlncmF0ZSIpOgo+IE9uIFR1ZSwgT2N0IDAyLCAy
MDE4IGF0IDA1OjA4OjI3UE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPiBBbmQgVEJI
OiBJIGNvbnNpZGVyIHRoZSAtQyBvcHRpb24gYmVpbmcgcXVpdGUgZGFuZ2Vyb3VzLiBXaGlsZSBJ
IGNhbgo+ID4gdW5kZXJzdGFuZCB3aHkgaXQgaXMgcHJlc2VudCBpdCBpcyBzdGlsbCBhIHJhdGhl
ciBoYWNreSBhcHByb2FjaCBmb3IgYQo+ID4gZ2VuZXJhbCBwcm9ibGVtLiBTYW1lIGFwcGxpZXMg
dG8gdGhlIGNhcGFiaWxpdHkgdG8gbW9kaWZ5IHJhbmRvbQo+ID4gc2V0dGluZ3Mgb2YgdGhlIGRv
bWFpbiBjb25maWcuCj4gCj4gVGhlIC1DIG9wdGlvbiBpcyByYXRoZXIgZGFuZ2Vyb3VzLiBJdCBk
aXNyZWdhcmRzIGFsbCBndWVzdHMgc3RhdGVzLiBZb3UKPiB3aWxsIGxpa2VseSB0byBsb3NlIHlv
dXIgbWFjIGFkZHJlc3MgdW5sZXNzIHlvdSBoYXZlIHNldCB0aGUgc2FtZSBtYWMKPiBhZGRyZXNz
IGluIHRoZSBvdmVycmlkZSBmaWxlLiBTYW1lIGdvZXMgZm9yIG90aGVyIHN0YXRlcyBsaWJ4bCBt
aWdodAo+IGhhdmUgc2F2ZWQgZHVyaW5nIGRvbWFpbiBjcmVhdGlvbi4KCldlIHNob3VsZCBoYXZl
IGEgd2F5IHRvICphbHRlciogY29uZmlnIHNldHRpbmdzIHJhdGhlciB0aGFuIG9ubHkgb25lCnRv
IHJlcGxhY2UgdGhlIGNvbmZpZy4gIFRoYXQgaXMgbW9yZSB1c2VmdWwsIGFuZCBsZXNzIGRhbmdl
cm91cy4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
