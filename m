From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v2] x86/vm_event: add gdtr_base to the
 vm_event structure
Date: Thu, 2 May 2019 17:48:08 -0600
Message-ID: <CABfawhmopUUUSBVKU8XA+4Yc-Ur=avJC4t_jGBNDO-KypY2u6Q@mail.gmail.com>
References: <20190502214203.17279-1-tamas@tklengyel.com>
 <CABfawhkCizO=8Y2gsF=X1ppgGeaV0Trb7108awRsKOOYAYQjLA@mail.gmail.com>
 <66dcc034-7f8b-fc00-86e5-40778892a9cb@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bVeI=TC=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hMLRZ-0007as-74
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 23:48:49 +0000
Received: by mail-wm1-f41.google.com with SMTP id b10so5034697wmj.4
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 16:48:47 -0700 (PDT)
In-Reply-To: <66dcc034-7f8b-fc00-86e5-40778892a9cb@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCA1OjQyIFBNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gMDIvMDUvMjAxOSAyMzo0MCwgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+ID4+IEBAIC0yMTEsMTMgKzIxMiwxNCBAQCBzdHJ1Y3Qgdm1fZXZlbnRf
cmVnc194ODYgewo+ID4+ICAgICAgc3RydWN0IHZtX2V2ZW50X3g4Nl9zZWxlY3Rvcl9yZWcgZnM7
Cj4gPj4gICAgICBzdHJ1Y3Qgdm1fZXZlbnRfeDg2X3NlbGVjdG9yX3JlZyBnczsKPiA+PiAgICAg
IHVpbnQ2NF90IHNoYWRvd19nczsKPiA+PiArICAgIHVpbnQxNl90IGdkdHJfbGltaXQ7Cj4gPiBX
aG9vcHMsIGp1c3Qgbm90aWNlZCB0aGF0IGxpbWl0IGFjdHVhbGx5IG5lZWRzIDIwLWJpdHMuIEkn
bGwganVzdCBncm93Cj4gPiB0aGlzIHRvIDMyIGFuZCBkcm9wIHRoZSBwYWQgYXQgdGhlIGVuZC4K
Pgo+IFRoZXJlIGlzIG5vIHN1Y2ggdGhpbmcgYXMgYSBHRFQgb3IgYW4gSURUIHdpdGggYSBsaW1p
dCBiZXlvbmQgMTYgYml0cy4KPiAoRnVydGhlcm1vcmUsIGFuIElEVCB3aXRoIGEgbGltaXQgYmV5
b25kIDEyIGJpdHMgaXMganVzdCBhIHdhc3RlIG9mIG1lbW9yeSkuCj4KPiBWVC14IHBlcmZvcm1z
IGEgY29uc2lzdGVuY3kgY2hlY2sgb24gZXZlcnkgdm1lbnRyeSB0aGF0IHRoZQo+IFZNQ1Nfe0cs
SX1EVFJfTElNSVQgZmllbGRzIGFyZSB3aXRoaW4gMTYgYml0cywgZGVzcGl0ZSBiZWluZyBlbmNv
ZGVkIGFzCj4gMzJiaXQgZmllbGRzLiAgU1ZNIHNwZWNpZmllcyB0aGUgaGlnaGVyIDE2IGJpdHMg
YXMgaWdub3JlZC4KPgoKVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbiAtIGluIHRoYXQgY2Fz
ZSB2MiBvZiB0aGlzIHBhdGNoIGlzIGNvcnJlY3QuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
