From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] hvm/altp2m: Clarify the proper way to
 extend the altp2m interface
Date: Tue, 10 Jul 2018 12:07:15 +0100
Message-ID: <143fb7da-132a-3dcf-54ab-beb0caf3add5@citrix.com>
References: <20180710093322.10854-1-george.dunlap@citrix.com>
 <5B4483F202000078001D28E2@prv1-mh.provo.novell.com>
 <73a5cb1a-a228-11c4-0f1d-da21a16726ad@citrix.com>
 <23364.35661.260888.861745@mariner.uk.xensource.com>
 <6b083fa6-2d6e-846d-a800-02832f158368@citrix.com>
 <23364.37295.298968.438866@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sxqp=j2=citrix.com=prvs=722797069=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fcqUL-0005TL-2k
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 11:07:21 +0000
In-Reply-To: <23364.37295.298968.438866@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas.lengyel@zentific.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTAvMjAxOCAxMTo1OSBBTSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gR2VvcmdlIER1bmxh
cCB3cml0ZXMgKCJSZTogW1BBVENIXSBodm0vYWx0cDJtOiBDbGFyaWZ5IHRoZSBwcm9wZXIgd2F5
IHRvIGV4dGVuZCB0aGUgYWx0cDJtIGludGVyZmFjZSIpOgo+PiBPbiAwNy8xMC8yMDE4IDExOjMy
IEFNLCBJYW4gSmFja3NvbiB3cm90ZToKPj4+IFdlIHNob3VsZCBoYXZlIGEgd2F5IG9mIHJlbWVt
YmVyaW5nIHRoZSBkZXNpZ24gaW50ZW50LCBldmVuIGlmIGl0Cj4+PiBoYXNuJ3QgYmVlbiBhdWRp
dGVkLgo+Pj4KPj4+IFNVUFBPUlQubWQgY2FuIGRlYWwgd2l0aCB0aGUgcG9zc2libGUgcHJvYmxl
bSBvZiBwZW9wbGUgdGhpbmtpbmcgdGhlCj4+PiBub24tYmxhY2tsaXN0ZWQgaXRlbXMgYXJlIGZ1
bGx5IHJlYWR5IGZvciB1c2UuCj4+Cj4+IEkgdGhpbmsgU1VQUE9SVC5tZCBzaG91bGQgcHJpbWFy
aWx5IGJlIGZvciBlbmQgdXNlcnMgdG8gZGV0ZXJtaW5lCj4+IHdoZXRoZXIgdGhleSBzaG91bGQg
dXNlIGFuIGludGVyZmFjZSBvciBub3QuICBBIHRlY2huaWNhbCBkaXNjdXNzaW9uCj4+IGFib3V0
IGV4YWN0bHkgdG8gd2hhdCBkZWdyZWUgYW4gaW50ZXJmYWNlIGhhcyAob3IgaGFzbid0KSBiZWVu
IHZldHRlZCBpcwo+PiBtb3JlIHRvd2FyZHMgYSBkZXZlbG9wZXIgd2hvIG1heSBiZSBsb29raW5n
IHRvIGdldCB0aGluZ3MgaW50byBhCj4+IHN1cHBvcnRlZCBzdGF0ZSwgYW5kIHNvIHNob3VsZCBw
cm9iYWJseSBiZSBpbiB0aGUgY29kZSBzb21ld2hlcmUuCj4gCj4gSSBhZ3JlZSB3aXRoIHRoYXQu
ICBCdXQgY3VycmVudGx5IEkgdGhpbmsgbm9uZSBvZiBpdCBoYXMgYmVlbgo+IGF1ZGl0ZWQuICBJ
ZiB0aGVyZSBpcyBhbnkgcXVlc3Rpb24gb2YgZG91YnQgd2UgY2FuIGxlYXZlIGEgY29tbWVudCBp
bgo+IG9uZSBwbGFjZSByZWZlcmVuY2VpbmcgdGhlIFNVUFBPUlQubWQgc3RhdHVzIGFuZCBzYXlp
bmcgYG9uZSByZWFzb24gaXMKPiB0aGF0IG5vbmUgb2YgdGhpcyBzdHVmZiBoYXMgYmVlbiBhdWRp
dGVkJy4KCkkgd291bGQgYXNzdW1lIHRoYXQgZm9yIHRoZSBvcmlnaW5hbCBpbnRlcmZhY2UsIHRo
ZSBhdXRob3JzIGF0IGxlYXN0IGRpZApzb21lIHRoaW5raW5nIGFib3V0IHdoZXRoZXIgZXhwb3Np
bmcgZWFjaCBiaXQgd2FzIHNhZmUgb3Igbm90ICh3aGV0aGVyCnRoaXMgcmlzZXMgdG8gdGhlIGxl
dmVsIG9mICdhdWRpdCcgaXMgYSBkaWZmZXJlbnQgcXVlc3Rpb24pLiAgQnV0IGluIHRoZQptZWFu
IHRpbWUsIG90aGVyIGV4dGVuc2lvbnMgaGF2ZSBiZWVuIG1hZGUsIHdoaWNoIGhhdmUgZ2VuZXJh
bGx5IG5vdApiZWVuIHRob3VnaHQgYWJvdXQgc28gbXVjaC4KCk9UT0gsIHNvbWVvbmUgcGlja2lu
ZyB1cCB0aGlzIHVzZSBjYXNlIHdpbGwgd2FudCB0byBkbyB0aGVpciBvd24KYW5hbHlzaXMgb2Yg
YWxsIHRoZSBjb2RlIGFueXdheTsgc28gbWF5YmUgbWFraW5nIHRoZSBkaXN0aW5jdGlvbiBiZXR3
ZWVuCiJ3YXMgaW4gdGhlIG9yaWdpbmFsIGRlc2lnbiIgYW5kICJ3YXMgYWRkZWQgbGF0ZXIiIGlz
bid0IHdvcnRoIHRoZSBlZmZvcnQuCgpCYXNpY2FsbHkgLS0gSSBzdWdnZXN0ZWQgdGhlIGlkZWEg
b2YgYSBibGFja2xpc3QgZm9yIG5ldyBzdWJvcHMgYXMKc29tZXRoaW5nIHRvIG1ha2UgSmFuIGxl
c3Mgd29ycmllZCBhYm91dCBzZWN1cml0eSBjcmVlcC4gIElmIGhlIHdhbnRzCml0LCBsZXQncyBo
YXZlIGl0LiAgT3RoZXJ3aXNlLCBsZXQncyBub3QgYm90aGVyLgoKIC1HZW9yZ2UKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
