From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 4/6] xen/x86: disable global pages for
 domains with XPTI active
Date: Fri, 9 Mar 2018 05:23:54 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19104023E@SHSMSX101.ccr.corp.intel.com>
References: <20180302081403.16953-1-jgross@suse.com>
 <20180302081403.16953-5-jgross@suse.com>
 <5AA14AF302000078001AFD30@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=okzm=f7=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1euAVl-0001zd-JR
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 05:24:09 +0000
In-Reply-To: <5AA14AF302000078001AFD30@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFRo
dXJzZGF5LCBNYXJjaCA4LCAyMDE4IDk6MzkgUE0KPiAKPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS14ODYvZG9tYWluLmgKPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmgKPiA+
IEBAIC02MjIsNyArNjIyLDggQEAgdW5zaWduZWQgbG9uZyBwdl9ndWVzdF9jcjRfZml4dXAoY29u
c3Qgc3RydWN0Cj4gdmNwdSAqLCB1bnNpZ25lZCBsb25nIGd1ZXN0X2NyNCk7Cj4gPiAgICAgICAg
ICAgICAgWDg2X0NSNF9TTUFQIHwgWDg2X0NSNF9PU1hTQVZFIHwgICAgICAgICAgICAgICAgXAo+
ID4gICAgICAgICAgICAgIFg4Nl9DUjRfRlNHU0JBU0UpKSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiA+ICAgICAgICB8ICgodiktPmRvbWFpbi0+YXJjaC52dHNjID8gWDg2X0NSNF9U
U0QgOiAwKSkgICAgICAgICBcCj4gPiAtICAgICAmIH5YODZfQ1I0X0RFKQo+ID4gKyAgICAgJiB+
KFg4Nl9DUjRfREUgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+
ICsgICAgICAgICAoKHYpLT5kb21haW4tPmFyY2gucHZfZG9tYWluLnhwdGkgPyBYODZfQ1I0X1BH
RSA6IDApKSkKPiAKPiBXaXRoIHRoaXMgeW91IG1hbmFnZSB0byB0dXJuIG9mZiBnbG9iYWwgcGFn
ZXMgd2hlbiBzd2l0Y2hpbmcgdG8KPiBhIFBWIHZDUFUuIEJ1dCBJIGNhbid0IHNlZSBob3cgeW91
IHR1cm4gZ2xvYmFsIHBhZ2VzIGJhY2sgb24gd2hlbgo+IHN3aXRjaGluZyBhd2F5IGZyb20gaXQu
IEkgY2FuIHNlZSB0aGV5IHdvdWxkIGJlIHR1cm5lZCBiYWNrIG9uIGUuZy4KPiBvbiB0aGUgZmly
c3QgZW50cnkgdG8gYSBWTVggZ3Vlc3QsIGJ1dCBob3cgYWJvdXQgYW4gU1ZNIG9uZT8gQW5kCj4g
aG93IGFib3V0IHRoZSB0aW1lIGJldHdlZW4gc3dpdGNoaW5nIGF3YXkgZnJvbSB0aGUgUFYgdkNQ
VSBhbmQKPiB0aGF0IFZNIGVudHJ5PyBHcmFudGVkIGFsbCBmbHVzaGVzIGFyZSBnbG9iYWwgb25l
cyByaWdodCBub3csIGJ1dAo+IHRoYXQgc2hvdWxkIGNoYW5nZSB3aXRoIHRoZSBtb2RpZmljYXRp
b24gaGVyZTogSWYgeW91IGxvb2sgYmFjayBhdAo+IDQuMiBjb2RlLCB5b3UnbGwgc2VlIHRoYXQg
RkxVU0hfVExCIHdhcyBoYW5kbGVkIGRpZmZlcmVudGx5IGluIHRoYXQKPiBjYXNlLCByZXRhaW5p
bmcgWGVuJ3MgZ2xvYmFsIG1hcHBpbmdzLiBBbnkgZmx1c2ggSVBJIG5vdCByZXF1ZXN0aW5nCj4g
Z2xvYmFsIHBhZ2VzIHRvIGJlIGZsdXNoZWQgY291bGQgdGhlbiBsZWF2ZSBpbnRhY3QgWGVuJ3Mg
b3duIFRMQgo+IGVudHJpZXMsIHdoaWNoIHRha2VzIGFzIGEgcHJlcmVxIHRoYXQgQ1I0LlBHRSBn
ZXRzIHR1cm5lZCBiYWNrIG9uCj4gZWFybGllci4KPiAKCmJ0dyBkb2VzIFBHRSByZWFsbHkgbWF0
dGVyIHJlZ2FyZGluZyB0byBlbnRyeSB0byBIVk0gZ3Vlc3Q/IFhlbidzIAptYXBwaW5ncyBhcmUg
ZWl0aGVyIGFsbCBmbHVzaGVkICh2cGlkIGRpc2FibGVkKSBvciBhbGwgc3VzdGFpbmVkCih2cGlk
IGVuYWJsZWQpIGF0IFZNIGVudHJpZXMsIHJlZ2FyZGxlc3Mgb2YgZ2xvYmFsIHNldHRpbmcuIHRo
ZW4gaWYgClBHRSBpcyBhbnl3YXkgdHVybmVkIG9mZiBmb3IgUFYgYW5kIGRvZXNuJ3QgbWF0dGVy
IGZvciBIVk0gaXMgaXQgCnN0aWxsIHVzZWZ1bCB0byBrZWVwIGl0IHR1cm5lZCBvbiBiZXR3ZWVu
IHN3aXRjaGVzPwogClRoYW5rcwpLZXZpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
