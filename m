From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/9] libxl: Get rid of support for
 QEMU_USER_BASE (xen-qemuuser-domidNN)
Date: Wed, 28 Nov 2018 15:32:02 +0000
Message-ID: <20181128153202.p3aymgn5kzeosdjh@zion.uk.xensource.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-3-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fE64=OH=citrix.com=prvs=863b436f6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gS1qD-0008Lm-BW
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 15:33:29 +0000
Content-Disposition: inline
In-Reply-To: <20181123171502.29519-3-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMDU6MTQ6NTZQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBRRU1VX1VTRVJfQkFTRSBhbGxvd3MgYSB1c2VyIHRvIHNwZWNpZnkgdGhlIFVJRCB0
byB1c2Ugd2hlbiBydW5uaW5nCj4gdGhlIGRldmljZW1vZGVsIGZvciBhIHNwZWNpZmljIGRvbWFp
biBudW1iZXIuICBVbmZvcnR1bmF0ZWx5LCB0aGlzIGlzCj4gbm90IHJlYWxseSBwcmFjdGljYWw6
IEl0IHJlcXVpcmVzIG5lYXJseSAzMiwwMDAgZW50cmllcyBpbgo+IC9ldGMvcGFzc3dkLiAgUUVN
VV9VU0VSX1JBTkdFX0JBU0UgaXMgbXVjaCBtb3JlIHByYWN0aWNhbC4KPiAKPiBSZW1vdmUgc3Vw
cG9ydCBmb3IgUUVNVV9VU0VSX0JBU0UuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKSSBoYXZlIG5vIHByb2JsZW0gd2l0aCB5b3Ug
cmVtb3ZpbmcgdGhpcywgYnV0IHlvdSBmb3Jnb3QgdG8gY2hhbmdlCnhsLmNmZy5wb2QuNS5pbi4K
CldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
