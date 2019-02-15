From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12 v3 1/8] dom0/pvh: align allocation
 and mapping order to start address
Date: Fri, 15 Feb 2019 15:38:30 +0100
Message-ID: <2f7218cd-485f-0e5b-4686-93ffda1215a7@suse.com>
References: <20190215141837.1420-1-roger.pau@citrix.com>
 <20190215141837.1420-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LI7m=QW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1guedP-0003rL-21
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 14:38:35 +0000
In-Reply-To: <20190215141837.1420-2-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDIvMjAxOSAxNToxOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoZSBwMm0gYW5k
IGlvbW11IG1hcHBpbmcgY29kZSBhbHdheXMgaGFkIHRoZSByZXF1aXJlbWVudCB0aGF0Cj4gYWRk
cmVzc2VzIGFuZCBvcmRlcnMgbXVzdCBiZSBhbGlnbmVkIHdoZW4gcG9wdWxhdGluZyB0aGUgcDJt
IG9yIHRoZQo+IGlvbW11IHBhZ2UgdGFibGVzLgo+IAo+IFBWSCBkb20wIGJ1aWxkZXIgZGlkbid0
IHRha2UgdGhpcyByZXF1aXJlbWVudCBpbnRvIGFjY291bnQsIGFuZCBjYW4KPiBjYWxsIGludG8g
dGhlIHAybS9pb21tdSBtYXBwaW5nIGhlbHBlcnMgd2l0aCBhZGRyZXNzZXMgYW5kIG9yZGVycyB0
aGF0Cj4gYXJlIG5vdCBhbGlnbmVkLgo+IAo+IEZpeCB0aGlzIGJ5IG1ha2luZyBzdXJlIHRoZSBv
cmRlcnMgcGFzc2VkIHRvIHRoZSBwaHlzbWFwIHBvcHVsYXRpb24KPiBoZWxwZXJzIGFyZSBhbHdh
eXMgYWxpZ25lZCB0byB0aGUgZ3Vlc3QgYWRkcmVzcyB0byBiZSBwb3B1bGF0ZWQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gUmV2
aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
