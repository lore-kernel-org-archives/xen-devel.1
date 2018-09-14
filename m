From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] Make credit2 the default scheduler
Date: Fri, 14 Sep 2018 10:02:13 +0100
Message-ID: <20180914090213.i7qamzxai2cudczo@zion.uk.xensource.com>
References: <20180913163848.32216-1-george.dunlap@citrix.com>
 <cc2e661cc8543353929aebf1f190abd109ff2b82.camel@suse.com>
 <5B9B752F02000078001E88AD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bn9z=l4=citrix.com=prvs=7887e1b83=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g0jzb-0001ZN-P0
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 09:02:23 +0000
Content-Disposition: inline
In-Reply-To: <5B9B752F02000078001E88AD@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMTQsIDIwMTggYXQgMDI6NDU6MzVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEzLjA5LjE4IGF0IDE4OjUxLCA8ZGZhZ2dpb2xpQHN1c2UuY29tPiB3cm90
ZToKPiA+IE9uIFRodSwgMjAxOC0wOS0xMyBhdCAxNzozOCArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiA+PiBDcmVkaXQyIHdhcyBkZWNsYXJlZCAic3VwcG9ydGVkIiBpbiA0LjgsIGFuZCBh
cyBvZiA0LjEwIGhhZCB0d28gb3RoZXIKPiA+PiBjcml0aWNhbCBmZWF0dXJlcyBpbXBsZW1lbnRl
ZCAoc29mdCBhZmZpbml0eSAvIE5VTUEgYW5kIGNhcHMpLgo+ID4+IAo+ID4+IFsuLl0KPiA+Pgo+
ID4+IENyZWRpdDIsIGxpa2UgY3JlZGl0LCBoYXMgYSBudW1iZXIgb2Ygd29ya2xvYWRzIC8gc2V0
dXBzIGZvciB3aGljaAo+ID4+IHBlcmZvcm1hbmNlIGNvdWxkIGJlIGltcHJvdmVkLiAgUGVyc29u
YWxseSBJIHRoaW5rIG5ldHdvcmtpbmcgYW5kCj4gPj4gcGFydGlhbGx5LWxvYWRlZCBzeXN0ZW1z
IGlzIGdvaW5nIHRvIGJlIG1vcmUgcmVwcmVzZW50YXRpdmUgb2Ygd2hhdAo+ID4+IFhlbiBpcyBh
Y3R1YWxseSB1c2VkIGZvcjsgc28gSSB0aGluayBjcmVkaXQyIGlzIG9uIHRoZSB3aG9sZSB0aGUK
PiA+PiBiZXR0ZXIgc2NoZWR1bGVyIHRvIHVzZSBieSBkZWZhdWx0LiAgQW5kIGluIGFueSBjYXNl
LCBtYWtpbmcgdGhvc2UKPiA+PiBpbXByb3ZlbWVudHMgb24gY3JlZGl0MiB3aWxsIGJlIGVhc2ll
ciB0aGFuIG9uIGNyZWRpdC4KPiA+PiAKPiA+PiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFw
IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gPj4KPiA+IEFmdGVyIGFsbCB0aGUgZWZmb3J0
IHdlJ3ZlIHNwZW50IG9uIHRoaXMsIEknbSByZWFsbHksIHJlYWxseSBoYXBweSB0bwo+ID4gc2Vl
IHRoaXMgKHRyeWluZyB0bykgaGFwcGVuLiBUaGFua3MgZm9yIHNlbmRpbmcgdGhlIHBhdGNoLiA6
LSkKPiA+IAo+ID4gSSBmdWxseSBhZ3JlZSB3aXRoIGFuZCBzZWNvbmQgR2VvcmdlJ3MgcmVhc29u
aW5nLCBhbmQgZmVlbCAxMDAlIGxpa2UKPiA+IHByb3ZpZGluZyBteToKPiA+IAo+ID4gQWNrZWQt
Ynk6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4gCj4gQW5kIHRoYXQncyBk
ZXNwaXRlICJzY2hlZD1jcmVkaXQyIGNyYXNoZXMgc3lzdGVtIHdoZW4gdXNpbmcKPiBjcHVwb29s
cyI/IFdoaWxlIEkgYWdyZWUgdGhhdCB3ZSBzaG91bGRuJ3QgZGVsYXkgdGhlIHN3aXRjaCBmb3IK
ClVyZ2gsIHRoaXMgaXMgYSByZWFsbHkgbmFzdHkgYnVnLgoKPiBtdWNoIGxvbmdlciwgaW4gcGFy
dGljdWxhciB3aXRoIHRoZXJlIGFscmVhZHkgYmVpbmcgYSBmaXggYXZhaWxhYmxlCj4gZnJvbSB5
b3UgSSB0aGluayB0aGF0IG9uZSBzaG91bGQgZ28gaW4gYmVmb3JlIHRoZSBvbmUgaGVyZS4KCisx
LgoKV2VpLgoKPiAKPiBKYW4KPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
