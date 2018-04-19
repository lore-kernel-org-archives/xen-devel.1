From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-4.11] libs/gnttab: fix FreeBSD gntdev
 interface
Date: Thu, 19 Apr 2018 09:10:56 +0100
Message-ID: <20180419081056.52ngkgm2ofw76sda@citrix.com>
References: <20180417130341.73560-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g8v3=hi=citrix.com=prvs=6400f7f3c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f94ek-00062G-2h
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 08:11:02 +0000
Content-Disposition: inline
In-Reply-To: <20180417130341.73560-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMTcsIDIwMTggYXQgMDI6MDM6NDFQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEN1cnJlbnQgaW50ZXJmYWNlIHRvIHRoZSBnbnRkZXYgaW4gRnJlZUJTRCBpcyB3
cm9uZywgYW5kIG1vc3RseSB3b3JrZWQKPiBvdXQgb2YgbHVjayBiZWZvcmUgdGhlIFBUSSBGcmVl
QlNEIGZpeGVzLCB3aGVuIGtlcm5lbCBhbmQgdXNlci1zcGFjZQo+IHdoZXJlIHNoYXJpbmcgdGhl
IHNhbWUgcGFnZSB0YWJsZXMuCgp3aGVyZSAtPiB3ZXJlPwoKPiAKPiBPbiBGcmVlQlNEIGlvY3Rs
cyBoYXZlIHRoZSBzaXplIG9mIHRoZSBwYXNzZWQgc3RydWN0IGVuY29kZWQgaW4gdGhlIGlvY3Rs
Cj4gbnVtYmVyLCBiZWNhdXNlIHRoZSBnZW5lcmljIGlvY3RsIGhhbmRsZXIgaW4gdGhlIE9TIHRh
a2VzIGNhcmUgb2YKPiBjb3B5aW5nIHRoZSBkYXRhIGZyb20gdXNlci1zcGFjZSB0byBrZXJuZWwg
c3BhY2UsIGFuZCB0aGVuIGNhbGxzIHRoZQo+IGRldmljZSBzcGVjaWZpYyBpb2N0bCBoYW5kbGVy
LiBUaHVzIHVzaW5nIGlvY3RsIHN0cnVjdHMgd2l0aCB2YXJpYWJsZQo+IHNpemVzIGlzIG5vdCBw
b3NzaWJsZS4KPiAKPiBUaGUgZml4IGlzIHRvIHR1cm4gdGhlIGFycmF5IG9mIHN0cnVjdHMgYXQg
dGhlIGVuZCBvZgo+IGlvY3RsX2dudGRldl9hbGxvY19ncmVmIGFuZCBpb2N0bF9nbnRkZXZfbWFw
X2dyYW50X3JlZiBpbnRvIHBvaW50ZXJzLAo+IHRoYXQgY2FuIGJlIHByb3Blcmx5IGFjY2Vzc2Vk
IGZyb20gdGhlIGtlcm5lbCBnbnRkZXYgZHJpdmVyIHVzaW5nIHRoZQo+IGNvcHlpbi9jb3B5b3V0
IGZ1bmN0aW9ucy4gTm90ZSB0aGF0IHRoaXMgaXMgZXhhY3RseSBob3cgaXQncyBkb25lIGZvcgo+
IHRoZSBwcml2Y21kIGRyaXZlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCk5vdCBzdXJlIEkgZm9sbG93LiBJc24ndCB0dXJuaW5n
IHRoZSBhcnJheSBpbnRvIHBvaW50ZXIgc3RpbGwgcmVzdWx0cyBpbgphIHZhcmlhYmxlIGxlbmd0
aCBhcnJheT8KClRoZSBjb2RlIGxvb2tzIHNhbmUgdG8gbWUuCgpXZWkuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
