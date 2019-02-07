From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] x86emul: avoid speculative out of bounds
 accesses
Date: Thu, 7 Feb 2019 13:31:39 +0100
Message-ID: <1788e882-06f5-98e6-c30d-60650fd82849@suse.com>
References: <FCC26D720200001BB4B78B26@suse.com>
 <5C53056B0200007800212C9B@suse.com> <5C5C19950200007800214961@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tb4s=QO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1griqF-0006p9-3i
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 12:31:43 +0000
In-Reply-To: <5C5C19950200007800214961@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Norbert Manthey <nmanthey@amazon.de>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDIvMjAxOSAxMjo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlcmUgYXJlIGEgZmV3
IGFycmF5IGFjY2Vzc2VzIGhlcmUgdGhlIGluZGV4ZXMgb2Ygd2hpY2ggYXJlIChhdCBsZWFzdAo+
IGluZGlyZWN0bHkpIGRyaXZlbiBieSB0aGUgZ3Vlc3QuIFVzZSBhcnJheV9hY2Nlc3Nfbm9zcGVj
KCkgdG8gYm91bmQKPiBzdWNoIGFjY2Vzc2VzLiBJbiB0aGUgeyxffWRlY29kZV9ncHIoKSBjYXNl
cyByZXBsYWNlIGV4aXN0aW5nIGd1YXJkaW5nCj4gY29uc3RydWN0cy4KPiAKPiBUbyBkZWFsIHdp
dGggYW4gb3RoZXJ3aXNlIG9jY3VycmluZyAjaW5jbHVkZSBjeWNsZSwgZHJvcCB0aGUgaW5jbHVz
aW9uCj4gb2YgYXNtL3g4Nl9lbXVsYXRlLmggZnJvbSBhc20vcHJvY2Vzc29yLmguIFRoaXMgaW5j
bHVkZSBoYWQgYmVlbgo+IGludHJvZHVjZWQgZm9yIG9idGFpbmluZyB0aGUgc3RydWN0IGNwdWlk
X2xlYWYgZGVjbGFyYXRpb24sIHdoaWNoIGhhcwo+IHNpbmNlIG1vdmVkIGludG8gdGhlIHg4NiBo
ZWxwZXIgbGlicmFyeS4KPiAKPiBUaGlzIGlzIHBhcnQgb2YgdGhlIHNwZWN1bGF0aXZlIGhhcmRl
bmluZyBlZmZvcnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
