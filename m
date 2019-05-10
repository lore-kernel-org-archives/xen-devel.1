From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 11/14] xen/x86: mm: Re-implement
 set_gpfn_from_mfn() as a static inline function
Date: Fri, 10 May 2019 14:27:53 +0100
Message-ID: <22eaed55-f714-0c97-385d-72cf796f5936@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-12-julien.grall@arm.com>
 <5CD571FE020000780022D826@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP5Z7-0003Vb-I7
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:27:57 +0000
In-Reply-To: <5CD571FE020000780022D826@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMC8wNS8yMDE5IDEzOjQzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwNy4w
NS4xOSBhdCAxNzoxNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCBzZXRfZ3Bmbl9mcm9tX21mbih1bnNpZ25lZCBsb25nIG1mbiwgdW5zaWduZWQg
bG9uZyBwZm4pCj4+ICt7Cj4+ICsgICAgc3RydWN0IGRvbWFpbiAqZCA9IHBhZ2VfZ2V0X293bmVy
KG1mbl90b19wYWdlKF9tZm4obWZuKSkpOwo+PiArICAgIHVuc2lnbmVkIGxvbmcgZW50cnkgPSAo
ZCAmJiAoZCA9PSBkb21fY293KSkgPyBTSEFSRURfTTJQX0VOVFJZIDogcGZuOwo+IAo+IFRoZSAm
JiBoZXJlIGxvb2tzLCBlaG0sIGZ1bm55LCBidXQgSSBndWVzcyBpdCdzIG5lZWRlZCBmb3IgZWFy
bHkgYm9vdD8KCkkgaGF2ZSBubyBpZGVhLCB0aGlzIGlzIHg4NiBub3QgQXJtLi4uCgo+IEJ1dCB0
aGF0J3MgcGVyaGFwcyBhIHNlcGFyYXRlIHRoaW5nIHRvIGNsZWFuIHVwLiBIb3dldmVyLCBsb29r
aW5nIGF0Cj4gdGhpcyAtIHdoeSBpcyBBcm0gc2V0dGluZyB1cCBkb21fY293IGluIHRoZSBmaXJz
dCBwbGFjZT8KCkNvbW1vbiBjb2RlIGlzIHVzaW5nIGRvbV9jb3csIHNvIEkgZG9uJ3QgdGhpbmsg
d2Ugd2FudCBpdCB0byBiZSBOVUxMIG9uIEFybSB0byAKYXZvaWQgd2VpcmQgaXNzdWVzLgoKPiAK
Pj4gKyAgICBpZiAoIW1hY2hpbmVfdG9fcGh5c19tYXBwaW5nX3ZhbGlkKQo+IAo+IFBsZWFzZSBh
ZGQgdGhlIG1pc3NpbmcgYmxhbmtzLgoKT2suCgo+IAo+PiArICAgICAgICByZXR1cm47Cj4+ICsK
Pj4gKyAgICBpZiAoIG1mbiA+PSAoUkRXUl9DT01QQVRfTVBUX1ZJUlRfRU5EIC0gUkRXUl9DT01Q
QVRfTVBUX1ZJUlRfU1RBUlQpIC8gNCApCj4gCj4gWW91J3ZlIGludmVydGVkIHRoZSBvcmlnaW5h
bCBjb25kaXRpb24gKGJ5IHJlLXVzaW5nIGl0IHZlcmJhdGltKSAtIEknbSBwcmV0dHkKPiBzdXJl
IHRoaXMgaXMgZ29pbmcgdG8gY3Jhc2guCgpHb29kIHBvaW50LCBJIHdpbGwgdXBkYXRlIHRoZSBw
YXRjaC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
