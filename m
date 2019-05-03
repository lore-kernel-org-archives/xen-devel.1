From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v4 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
Date: Fri, 3 May 2019 07:48:03 -0600
Message-ID: <CABfawhnW6++ptuOwcMHV=1Fqk7MD7MHNTKEDY2w9UFztRe3YCw@mail.gmail.com>
References: <20190502221345.18459-1-tamas@tklengyel.com>
 <5CCBF7FE020000780022B859@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQLm=TD=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hMYYZ-00021i-6c
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 13:48:55 +0000
Received: by mail-wm1-f51.google.com with SMTP id p16so6844064wma.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 06:48:41 -0700 (PDT)
In-Reply-To: <5CCBF7FE020000780022B859@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMywgMjAxOSBhdCAyOjEyIEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMDMuMDUuMTkgYXQgMDA6MTMsIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPiB3cm90ZToKPiA+IEBAIC0xMDAyLDcgKzk4OSwxMCBAQCBzdGF0aWMgaW50IHNoYXJl
X3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2ZuLCBzaHJfaGFuZGxlX3Qgc2gsCj4g
PiAgICAgIC8qIEZyZWUgdGhlIGNsaWVudCBwYWdlICovCj4gPiAgICAgIGlmKHRlc3RfYW5kX2Ns
ZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJmNwYWdlLT5jb3VudF9pbmZvKSkKPiA+ICAgICAgICAg
IHB1dF9wYWdlKGNwYWdlKTsKPiA+IC0gICAgcHV0X3BhZ2UoY3BhZ2UpOwo+ID4gKwo+ID4gKyAg
ICBCVUdfT04oIXB1dF9jb3VudCk7Cj4gPiArICAgIHdoaWxlICggcHV0X2NvdW50LS0gKQo+ID4g
KyAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUoY3BhZ2UpOwo+Cj4gU3RyaWN0bHkgc3BlYWtpbmcg
SSB0aGluayB0aGUgQlVHX09OKCkgc2hvdWxkIGJlIG1vdmVkIGFoZWFkIG9mIHRoZQo+IGlmKCkg
aW4gY29udGV4dCwgc28gdGhhdCBhIHByb2JsZW1hdGljIHB1dF9wYWdlKCkgd291bGQgbm90IGdl
dAo+IGV4ZWN1dGVkIGluIHRoZSBmaXJzdCBwbGFjZSAoZXZlbiBpZiB0aGUgc3lzdGVtIGlzIHRv
IGRpZSBzb29uIGFmdGVyKS4KCkkgZG9uJ3QgZm9sbG93IC0gd2hlcmUgaXMgdGhlIHByb2JsZW1h
dGljIHB1dF9wYWdlKCk/IEFuZCB3aHkgaXMgaXQgcHJvYmxlbWF0aWM/CgpUYW1hcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
