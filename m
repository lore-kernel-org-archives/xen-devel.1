From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 07/16] x86: put XEN_DOMCTL_{set,
 get}_address_size under CONFIG_PV
Date: Wed, 31 Oct 2018 03:00:17 -0600
Message-ID: <5BD96F2102000078001F6A1F@prv1-mh.provo.novell.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <d87454cedf90ee1bd7ff0e0d05f3b4a910b93ddd.1539959287.git-series.wei.liu2@citrix.com>
 <5BD718F702000078001F5D92@prv1-mh.provo.novell.com>
 <20181030205002.3m7x7ybp5ojaiph6@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nwhd=nl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gHmMQ-0001Qm-Vm
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 09:00:23 +0000
In-Reply-To: <20181030205002.3m7x7ybp5ojaiph6@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjEwLjE4IGF0IDIxOjUwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBPY3QgMjksIDIwMTggYXQgMDg6Mjg6MDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAxOS4xMC4xOCBhdCAxNjoyOCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21jdGwuYwo+PiA+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9kb21jdGwuYwo+PiA+IEBAIC02MDgsNiArNjA4LDcgQEAgbG9uZyBhcmNoX2RvX2RvbWN0
bCgKPj4gPiAgICAgICAgICAgICAgY29weWJhY2sgPSB0cnVlOwo+PiA+ICAgICAgICAgIGJyZWFr
Owo+PiA+ICAKPj4gPiArI2lmZGVmIENPTkZJR19QVgo+PiA+ICAgICAgY2FzZSBYRU5fRE9NQ1RM
X3NldF9hZGRyZXNzX3NpemU6Cj4+ID4gICAgICAgICAgaWYgKCAoKGRvbWN0bC0+dS5hZGRyZXNz
X3NpemUuc2l6ZSA9PSA2NCkgJiYgIWQtPmFyY2guaXNfMzJiaXRfcHYpIHx8Cj4+ID4gICAgICAg
ICAgICAgICAoKGRvbWN0bC0+dS5hZGRyZXNzX3NpemUuc2l6ZSA9PSAzMikgJiYgZC0+YXJjaC5p
c18zMmJpdF9wdikgKQo+PiA+IEBAIC02MjMsNiArNjI0LDcgQEAgbG9uZyBhcmNoX2RvX2RvbWN0
bCgKPj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAKPj4gPiBCSVRTX1BFUl9MT05HOwo+PiA+ICAgICAgICAgIGNvcHliYWNr
ID0gdHJ1ZTsKPj4gPiAgICAgICAgICBicmVhazsKPj4gPiArI2VuZGlmCj4+IAo+PiAuLi4gYWRk
IHN1Y2ggYSBjaGVjayBzbyB0aGF0IHNpbWlsYXIgYmVoYXZpb3Igd2lsbCByZXN1bHQgd2l0aCBQ
Vgo+PiBlbmFibGVkIGFuZCBkaXNhYmxlZCAoZXJyb3IgY29kZXMgbWF5IGRpZmZlciwgYnV0IHN1
Y2Nlc3MgdnMKPj4gZXJyb3Igb3VnaHQgdG8gbWF0Y2gpLgo+IAo+IEkgZG9uJ3QgZm9sbG93LiBE
byB5b3UgbWVhbiBhZGRpbmcgaXNfcHZfZG9tYWluIGNoZWNrIHNvbWV3aGVyZT8KClllcy4gT3Ro
ZXJ3aXNlIGJlaGF2aW9yIGRpZmZlcnMgYmV0d2VlbiBhIFBWIGFuZCBhICFQViBoeXBlcnZpc29y
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
