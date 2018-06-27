From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 10/31] libxl_qmp: Move buffers to the
 stack of qmp_next.
Date: Wed, 27 Jun 2018 17:58:18 +0100
Message-ID: <20180627165818.GE2052@perard.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-11-anthony.perard@citrix.com>
 <23347.40960.451387.595477@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1vjj=jn=citrix.com=prvs=709756840=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fYDly-0003Kx-Uv
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 16:58:26 +0000
Content-Disposition: inline
In-Reply-To: <23347.40960.451387.595477@mariner.uk.xensource.com>
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

T24gV2VkLCBKdW4gMjcsIDIwMTggYXQgMDM6MzI6MzJQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDEwLzMxXSBsaWJ4bF9xbXA6
IE1vdmUgYnVmZmVycyB0byB0aGUgc3RhY2sgb2YgcW1wX25leHQuIik6Cj4gPiBUaGF0IGJ1ZmZl
ciBpcyBvbmx5IHVzZWQgbG9jYWxseSwgYW5kIG5ldmVyIHJldXNlIGFjY3Jvc3MgZGlmZmVyZW50
IGNhbGwKPiA+IG9mIHFtcF9uZXh0LiBTbyByZW1vdmUgaXQgZm9ybSB0aGUgaGFuZGxlci4KPiAK
PiBIb3cgYmlnIGlzIHRoaXMgYnVmZmVyID8KCkl0J3MgNGsKCj4gSSB0aGluayB5b3UncmUgbW92
aW5nIGl0IGZyb20gdGhlIGhlYXAgdG8KPiB0aGUgc3RhY2sgPyAgRG8gd2UgbmVlZCB0byB3b3Jy
eSBhYm91dCBzdGFjayBzaXplID8KCldlIGNhbiBwcm9iYWJseSByZW1vdmUgdGhpcyBwYXRjaCBm
cm9tIHRoZSBzZXJpZXMuIEl0IGlzIG5vdCBpbXBvcnRhbnQuCgotLSAKQW50aG9ueSBQRVJBUkQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
