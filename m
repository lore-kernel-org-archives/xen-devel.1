From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 8/9] x86/IRQ: make fixup_irqs() skip
 unconnected internally used interrupts
Date: Mon, 6 May 2019 15:52:03 +0200
Message-ID: <20190506135203.by4dre24krtuy3up@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DF710200007800229EC5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Gz0=TG=citrix.com=prvs=022e014eb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hNe2U-0006Ck-NW
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 13:52:18 +0000
Content-Disposition: inline
In-Reply-To: <5CC6DF710200007800229EC5@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMDU6MjY6NDFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gU2luY2UgdGhlICJDYW5ub3Qgc2V0IGFmZmluaXR5IC4uLiIgd2FybmluZyBpcyBhIG9u
ZSB0aW1lIG9uZSwgYXZvaWQKPiB0cmlnZ2VyaW5nIGl0IGFscmVhZHkgYXQgYm9vdCB0aW1lIHdo
ZW4gcGFya2luZyBzZWNvbmRhcnkgdGhyZWFkcyBhbmQKPiB0aGUgc2VyaWFsIGNvbnNvbGUgdXNl
cyBhIChzdGlsbCB1bmNvbm5lY3RlZCBhdCB0aGF0IHRpbWUpIFBDSSBJUlEuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9pcnEuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwo+IEBAIC0yNDEyLDggKzI0
MTIsMjAgQEAgdm9pZCBmaXh1cF9pcnFzKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgYgo+ICAgICAg
ICAgIHZlY3RvciA9IGlycV90b192ZWN0b3IoaXJxKTsKPiAgICAgICAgICBpZiAoIHZlY3RvciA+
PSBGSVJTVF9ISVBSSU9SSVRZX1ZFQ1RPUiAmJgo+ICAgICAgICAgICAgICAgdmVjdG9yIDw9IExB
U1RfSElQUklPUklUWV9WRUNUT1IgKQo+ICsgICAgICAgIHsKPiAgICAgICAgICAgICAgY3B1bWFz
a19hbmQoZGVzYy0+YXJjaC5jcHVfbWFzaywgZGVzYy0+YXJjaC5jcHVfbWFzaywgbWFzayk7Cj4g
IAo+ICsgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgKiBUaGlzIGNhbiBpbiBwYXJ0aWN1
bGFyIGhhcHBlbiB3aGVuIHBhcmtpbmcgc2Vjb25kYXJ5IHRocmVhZHMKPiArICAgICAgICAgICAg
ICogZHVyaW5nIGJvb3QgYW5kIHdoZW4gdGhlIHNlcmlhbCBjb25zb2xlIHdhbnRzIHRvIHVzZSBh
IFBDSSBJUlEuCj4gKyAgICAgICAgICAgICAqLwo+ICsgICAgICAgICAgICBpZiAoIGRlc2MtPmhh
bmRsZXIgPT0gJm5vX2lycV90eXBlICkKCkkgZm91bmQgaXQgd2VpcmQgdGhhdCBhIGlycSBoYXMg
YSB2ZWN0b3IgYXNzaWduZWQgKGluIHRoaXMgY2FzZSBhCmhpZ2gtcHJpb3JpdHkgdmVjdG9yKSBi
dXQgbm8gaXJxIHR5cGUgc2V0LgoKU2hvdWxkbid0IHRoZSB2ZWN0b3IgYmUgYXNzaWduZWQgd2hl
biB0aGUgdHlwZSBpcyBzZXQ/Cgo+ICsgICAgICAgICAgICB7Cj4gKyAgICAgICAgICAgICAgICBz
cGluX3VubG9jaygmZGVzYy0+bG9jayk7Cj4gKyAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAr
ICAgICAgICAgICAgfQo+ICsgICAgICAgIH0KPiArCj4gICAgICAgICAgaWYgKCBkZXNjLT5hcmNo
Lm1vdmVfY2xlYW51cF9jb3VudCApCj4gICAgICAgICAgewo+ICAgICAgICAgICAgICAvKiBUaGUg
Y2xlYW51cCBJUEkgbWF5IGhhdmUgZ290IHNlbnQgd2hpbGUgd2Ugd2VyZSBzdGlsbCBvbmxpbmUu
ICovCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
