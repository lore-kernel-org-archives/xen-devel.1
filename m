From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 1/4] x86/mm: add optional cache to
 GLA->GFN translation
Date: Wed, 19 Sep 2018 16:09:23 +0100
Message-ID: <20180919150923.xa4zb4z2tp3xqpdv@zion.uk.xensource.com>
References: <5B97BEB202000078001E73FB@prv1-mh.provo.novell.com>
 <5B97BF9102000078001E740A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wwm0=mb=citrix.com=prvs=79313d28f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2e6e-0006cb-QL
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 15:09:32 +0000
Content-Disposition: inline
In-Reply-To: <5B97BF9102000078001E740A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTEsIDIwMTggYXQgMDc6MTM6NTNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIGNhY2hpbmcgaXNuJ3QgYWN0dWFsbHkgaW1wbGVtZW50ZWQgaGVyZSwgdGhpcyBp
cyBqdXN0IHNldHRpbmcgdGhlCj4gc3RhZ2UuCj4gCj4gVG91Y2hpbmcgdGhlc2UgYW55d2F5IGFs
c28KPiAtIG1ha2UgdGhlaXIgcmV0dXJuIHZhbHVlcyBnZm5fdAo+IC0gZ3ZhIC0+IGdsYSBpbiB0
aGVpciBuYW1lcwo+IC0gbmFtZSB0aGVpciBpbnB1dCBhcmd1bWVudHMgZ2xhCj4gCj4gQXQgdGhl
IHVzZSBzaXRlcyBkbyB0aGUgY29udmVyc2lvbiB0byBnZm5fdCBhcyBzdWl0YWJsZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gUmV2aWV3ZWQt
Ynk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
