From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2 3/3] x86/shadow: emulate_gva_to_mfn()
 should respect p2m_ioreq_server
Date: Thu, 15 Nov 2018 13:02:23 +0000
Message-ID: <cccb74ff9b894e2e8206d6a28925424d@AMSPEX02CL03.citrite.net>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BED6A7E02000078001FC615@prv1-mh.provo.novell.com>
 <5BED6BE402000078001FC625@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dkuq=n2=citrix.com=prvs=850b0babf=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gNHIL-00025P-H9
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 13:02:53 +0000
In-Reply-To: <5BED6BE402000078001FC625@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTUgTm92ZW1iZXIgMjAxOCAxMjo1Mgo+IFRvOiB4
ZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiBDYzogQW5kcmV3IENv
b3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFBhdWwgRHVycmFudAo+IDxQYXVsLkR1
cnJhbnRAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
OyBXZWkgTGl1Cj4gPHdlaS5saXUyQGNpdHJpeC5jb20+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVu
Lm9yZz4KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMy8zXSB4ODYvc2hhZG93OiBlbXVsYXRlX2d2YV90
b19tZm4oKSBzaG91bGQgcmVzcGVjdAo+IHAybV9pb3JlcV9zZXJ2ZXIKPiAKPiBXcml0ZXMgdG8g
c3VjaCBwYWdlcyBuZWVkIHRvIGJlIGhhbmRlZCB0byB0aGUgZW11bGF0b3IuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFBh
dWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cgo+IC0tLQo+IHYyOiBSZXR1cm4g
QkFEX0dGTl9UT19NRk4gaW5zdGVhZC4KPiAKPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vc2hhZG93
L2h2bS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9odm0uYwo+IEBAIC0zMzgsNiAr
MzM4LDExIEBAIHN0YXRpYyBtZm5fdCBlbXVsYXRlX2d2YV90b19tZm4oc3RydWN0IHYKPiAgICAg
IHsKPiAgICAgICAgICByZXR1cm4gX21mbihCQURfR0ZOX1RPX01GTik7Cj4gICAgICB9Cj4gKyAg
ICBpZiAoIHAybXQgPT0gcDJtX2lvcmVxX3NlcnZlciApCj4gKyAgICB7Cj4gKyAgICAgICAgcHV0
X3BhZ2UocGFnZSk7Cj4gKyAgICAgICAgcmV0dXJuIF9tZm4oQkFEX0dGTl9UT19NRk4pOwo+ICsg
ICAgfQo+ICAgICAgaWYgKCBwMm1faXNfZGlzY2FyZF93cml0ZShwMm10KSApCj4gICAgICB7Cj4g
ICAgICAgICAgcHV0X3BhZ2UocGFnZSk7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
