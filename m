From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH RFC v1 28/74] x86: initialise shared_info
	page
Date: Fri, 5 Jan 2018 14:28:18 +0000
Message-ID: <20180105142818.n22b72upfl6stoxu@MacBook-Pro-de-Roger.local>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-29-wei.liu2@citrix.com>
 <5A4F9597020000780019B65C@prv-mh.provo.novell.com>
 <2adb4a74-916f-714d-4441-d10ecdbf6b7a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zrxb=ea=citrix.com=prvs=536afde55=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eXSz3-0002vj-7k
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 14:28:33 +0000
Content-Disposition: inline
In-Reply-To: <2adb4a74-916f-714d-4441-d10ecdbf6b7a@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, wei.liu2@citrix.com, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMDUsIDIwMTggYXQgMDI6MjA6MTZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwNS8wMS8xOCAxNDoxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+PiBPbiAw
NC4wMS4xOCBhdCAxNDowNSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4uYwo+ID4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94
ZW4uYwo+ID4+IEBAIC03Miw2ICs3MiwzMCBAQCB2b2lkIF9faW5pdCBwcm9iZV9oeXBlcnZpc29y
KHZvaWQpCj4gPj4gICAgICB4ZW5fZ3Vlc3QgPSB0cnVlOwo+ID4+ICB9Cj4gPj4gIAo+ID4+ICtz
dGF0aWMgdm9pZCBtYXBfc2hhcmVkX2luZm8oc3RydWN0IGU4MjBtYXAgKmU4MjApCj4gPj4gK3sK
PiA+PiArICAgIHBhZGRyX3QgZnJhbWUgPSAweGZmMDAwMDAwOyAvKiBUT0RPOiBIYXJkY29kZWQg
YmVzaWRlIG1hZ2ljIGZyYW1lcy4gKi8KPiA+IFdoYXQgYXJlIHRoZSBwbGFucyBoZXJlPwo+IAo+
IE5vdGhpbmcgaW1tZWRpYXRlbHkuwqAgVGhpcyBpcyBjb21wYXRpYmxlIHdpdGggYWxsIHZlcnNp
b25zIG9mIGxpYnhjIGluCj4gZXhpc3RhbmNlLCBidXQgd2UgbmVlZCB0byBzdGFydCBhIHRocmVh
ZCBkaXNjdXNzaW5nIEhWTSBndWVzdCBwaHlzaWNhbAo+IGFkZHJlc3Mgc3BhY2UuCgpQYXRjaGVz
IDQzLzQ0LzQ1IHJlbW92ZSB0aGlzIGhhcmRjb2RpbmcuCgpSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
