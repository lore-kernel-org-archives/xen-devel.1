From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v1] libxl: fix device_model_version related
 assert
Date: Thu, 16 May 2019 16:03:55 +0100
Message-ID: <20190516150355.GJ2798@zion.uk.xensource.com>
References: <20190516125000.23559-1-olaf@aepfle.de>
 <20190516133013.GG2798@zion.uk.xensource.com>
 <20190516153601.45352e5c.olaf@aepfle.de>
 <20190516134653.GI2798@zion.uk.xensource.com>
 <20190516155455.3a97d2fb.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hRHvK-0000U2-S9
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:03:58 +0000
Content-Disposition: inline
In-Reply-To: <20190516155455.3a97d2fb.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDM6NTQ6NTVQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVGh1LCAxNiBNYXkgMjAxOSAxNDo0Njo1MyArMDEwMAo+IHNjaHJpZWIgV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT46Cj4gCj4gPiBDYW4geW91IGNsYXJpZnk/Cj4gCj4gY3Jl
YXRlX2RvbWFpbiBoYXMgYSBsaWJ4bF9kb21haW5fY29uZmlnIG9uIGl0cyBzdGFjay4gVGhpcyBp
cyBwYXNzZWQgdG8KPiBmcmVlbWVtLCBhbmQgbGlieGxfZG9tYWluX25lZWRfbWVtb3J5IG1vZGlm
aWVzIGl0IGFzIG5lZWRlZC4KPiBUaGUgbW9kaWZpY2F0aW9uIHdpbGwgZ28gdGhyb3VnaCBsaWJ4
bF9kb21haW5fY3JlYXRlX25ldywgZG9fZG9tYWluX2NyZWF0ZSwKPiBpbml0aWF0ZV9kb21haW5f
Y3JlYXRlIHRvIGxpYnhsX19kb21haW5fc2V0X2RldmljZV9tb2RlbC4gVGhpcyBmdW5jdGlvbgo+
IHdpbGwgcmV0dXJuIHJpZ2h0IGF3YXkgYmVjYXVzZSBkZXZpY2VfbW9kZWxfdmVyc2lvbiBpcyBh
bHJlYWR5IHNldC4KCkFoLCBJIGtub3cgd2hlcmUgdGhlIGNvbmZ1c2lvbiBpcyBub3cuIE5vdGUg
dGhhdCB0aGUgYl9pbmZvIHVzZWQgaW4KbGlieGxfZG9tYWluX25lZWRfbWVtb3J5IGlzIGEgY29w
eSwgbm90IHRoZSBvcmlnaW5hbCBvbmUsIHNvIHdoYXRldmVyCm1vZGlmaWNhdGlvbiB5b3UgZG8g
dG8gaXQgd29uJ3QgZ2V0IHBhc3NlZCBiYWNrIHRvIGl0cyBjYWxsZXIuCgpOb3RpY2UgdGhlIGNh
bGw6CiAgbGlieGxfZG9tYWluX2J1aWxkX2luZm9fY29weShjdHgsIGJfaW5mbywgYl9pbmZvX2lu
KTsKCkFuZCB0aGVuIGxhdGVyOgogIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvX2Rpc3Bvc2UoYl9p
bmZvKTsKCkRvZXMgdGhpcyBtYWtlIHNlbnNlPwoKV2VpLgoKPiAKPiBPbGFmCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
