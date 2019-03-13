From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 02/11] viridian: separately allocate
 domain and vcpu structures
Date: Wed, 13 Mar 2019 06:25:20 -0600
Message-ID: <5C88F6B0020000780021E13E@prv1-mh.provo.novell.com>
References: <20190311134132.20536-1-paul.durrant@citrix.com>
 <20190311134132.20536-3-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GbKp=RQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h42wl-0004ha-Br
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 12:25:23 +0000
In-Reply-To: <20190311134132.20536-3-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjAzLjE5IGF0IDE0OjQxLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEN1cnJlbnRseSB0aGUgdmlyaWRpYW5fZG9tYWluIGFuZCB2aXJpZGlhbl92Y3B1IHN0cnVj
dHVyZXMgYXJlIGlubGluZSBpbgo+IHRoZSBodm1fZG9tYWluIGFuZCBodm1fdmNwdSBzdHJ1Y3R1
cmVzIHJlc3BlY3RpdmVseS4gU3Vic2VxdWVudCBwYXRjaGVzCj4gd2lsbCBuZWVkIHRvIGFkZCBz
aXphYmxlIGV4dHJhIGZpZWxkcyB0byB0aGUgdmlyaWRpYW4gc3RydWN0dXJlcyB3aGljaAo+IHdp
bGwgY2F1c2UgdGhlIFBBR0VfU0laRSBsaW1pdCBvZiB0aGUgb3ZlcmFsbCB2Y3B1IHN0cnVjdHVy
ZSB0byBiZQo+IGV4Y2VlZGVkLiBUaGlzIHBhdGNoLCB0aGVyZWZvcmUsIHVzZXMgdGhlIG5ldyBp
bml0IGhvb2tzIHRvIHNlcGFyYXRlbHkKPiBhbGxvY2F0ZSB0aGUgc3RydWN0dXJlcyBhbmQgY29u
dmVydHMgdGhlICd2aXJpZGlhbicgZmllbGRzIGluIGh2bV9kb21haW4KPiBhbmQgaHZtX2NwdSB0
byBiZSBwb2ludGVycyB0byB0aGVzZSBhbGxvY2F0aW9ucy4gVGhlc2Ugc2VwYXJhdGUgYWxsb2Nh
dGlvbnMKPiBhbHNvIGFsbG93IHNvbWUgdmNwdSBhbmQgZG9tYWluIHBvaW50ZXJzIHRvIGJlY29t
ZSBjb25zdC4KPiAKPiBJZGVhbGx5LCBub3cgdGhhdCB0aGV5IGFyZSBubyBsb25nZXIgaW5saW5l
LCB0aGUgYWxsb2NhdGlvbnMgb2YgdGhlCj4gdmlyaWRpYW4gc3RydWN0dXJlcyBjb3VsZCBiZSBt
YWRlIGNvbmRpdGlvbmFsIG9uIHdoZXRoZXIgdGhlIHRvb2xzdGFjawo+IGlzIGdvaW5nIHRvIGNv
bmZpZ3VyZSB0aGUgdmlyaWRpYW4gZW5saWdodGVubWVudHMuIEhvd2V2ZXIgdGhlIHRvb2xzdGFj
awo+IGlzIGN1cnJlbnRseSB1bmFibGUgdG8gY29udmV5IHRoaXMgaW5mb3JtYXRpb24gdG8gdGhl
IGRvbWFpbiBjcmVhdGlvbiBjb2RlCj4gc28gc3VjaCBhbiBlbmhhbmNlbWVudCBpcyBkZWZlcnJl
ZCB1bnRpbCB0aGF0IGJlY29tZXMgcG9zc2libGUuCj4gCj4gTk9URTogVGhlIHBhdGNoIGFsc28g
aW50cm9kdWNlZCB0aGUgJ2lzX3ZpcmlkaWFuX3ZjcHUnIG1hY3JvIHRvIGF2b2lkCj4gICAgICAg
aW50cm9kdWNpbmcgYSBzZWNvbmQgZXZhbHVhdGlvbiBvZiAnaXNfdmlyaWRpYW5fZG9tYWluJyB3
aXRoIGFuCj4gICAgICAgb3Blbi1jb2RlZCAndi0+ZG9tYWluJyBhcmd1bWVudC4gVGhpcyBtYWNy
byB3aWxsIGFsc28gYmUgZnVydGhlcgo+ICAgICAgIHVzZWQgaW4gYSBzdWJzZXF1ZW50IHBhdGNo
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5j
b20+Cj4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpOb24tVmly
aWRpYW4gcGFydHMKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
