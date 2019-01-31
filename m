From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2] xen-block: handle resize callback
Date: Thu, 31 Jan 2019 15:22:18 +0000
Message-ID: <b94b7583a3e14fec9b86a9cec13a1385__39144.0795314097$1548949525$gmane$org@AMSPEX02CL03.citrite.net>
References: <20190130161948.15888-1-paul.durrant@citrix.com>
 <20190131152042.GF2306@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YmQI=QH=citrix.com=prvs=927b0d5b4=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gpEVu-0001Yc-BS
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 15:44:26 +0000
In-Reply-To: <20190131152042.GF2306@perard.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Perard <anthony.perard@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAzMSBKYW51YXJ5IDIwMTkgMTU6
MjEKPiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogcWVt
dS1kZXZlbEBub25nbnUub3JnOyBxZW11LWJsb2NrQG5vbmdudS5vcmc7IHhlbi0KPiBkZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZzsgU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29t
PjsgU3RlZmFubwo+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBLZXZpbiBX
b2xmIDxrd29sZkByZWRoYXQuY29tPjsgTWF4Cj4gUmVpdHogPG1yZWl0ekByZWRoYXQuY29tPgo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIHhlbi1ibG9jazogaGFuZGxlIHJlc2l6ZSBjYWxsYmFj
awo+IAo+IE9uIFdlZCwgSmFuIDMwLCAyMDE5IGF0IDA0OjE5OjQ4UE0gKzAwMDAsIFBhdWwgRHVy
cmFudCB3cm90ZToKPiA+IFNvbWUgZnJvbnRlbmQgZHJpdmVycyB3aWxsIGhhbmRsZSBkeW5hbWlj
IHJlc2l6aW5nIG9mIFBWIGRpc2tzLCBzbyBzZXQKPiB1cAo+ID4gdGhlIEJsb2NrRGV2T3BzIHJl
c2l6ZV9jYigpIG1ldGhvZCBkdXJpbmcgeGVuX2Jsb2NrX3JlYWxpemUoKSB0byBhbGxvdwo+ID4g
dGhpcyB0byBiZSBkb25lLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gPiAtLS0KPiAKPiAKPiA+ICsgICAgLyoKPiA+ICsgICAg
ICogTWltaWMgdGhlIGJlaGF2aW91ciBvZiBMaW51eCB4ZW4tYmxrYmFjayBhbmQgcmUtd3JpdGUg
dGhlIHN0YXRlCj4gPiArICAgICAqIHRvIHRyaWdnZXIgdGhlIGZyb250ZW5kIHdhdGNoLgo+ID4g
KyAgICAgKi8KPiA+ICsgICAgeGVuX2RldmljZV9iYWNrZW5kX3NldF9zdGF0ZSh4ZW5kZXYsIGJh
Y2tlbmRfc3RhdGUpOwo+IAo+IDooLCB0aGF0IGZ1bmN0aW9uIGRvZXNuJ3Qgd3JpdGUgdGhlIHN0
YXRlIGFnYWluIGlmIGl0IGhhc24ndCBjaGFuZ2VkLgo+IFNvIGluIG15IHRlc3RpbmcsIExpbnV4
IG5ldmVyIGRpZCBhbnl0aGluZy4KCkdhaCEgSSBmb3Jnb3QgYWJvdXQgdGhhdC4gQWxyaWdodCwg
aXQncyBnb2luZyB0byBoYXZlIHRvIGJlIGEgYml0IG1vcmUgY3J1ZGUuCgogIFBhdWwKCj4gCj4g
LS0KPiBBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
