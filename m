From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 01/47] x86emul: introduce IMPOSSIBLE()
Date: Tue, 20 Nov 2018 01:12:33 -0700
Message-ID: <5BF3C1F102000078001FDD29@prv1-mh.provo.novell.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BF289D802000078001FD3DF@prv1-mh.provo.novell.com>
 <5BF28CBF02000078001FD3FF@prv1-mh.provo.novell.com>
 <2db64166-9ea3-7d41-5f35-6a9517085541@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gP19B-0003kx-9q
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 08:12:37 +0000
In-Reply-To: <2db64166-9ea3-7d41-5f35-6a9517085541@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjExLjE4IGF0IDE5OjExLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTkvMTEvMjAxOCAxMDoxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC04ODI4
LDEyICs4ODM3LDcgQEAgeDg2X2VtdWxhdGUoCj4+ICAgICAgICAgICAgICAgICAgZHN0LnR5cGUg
PSBPUF9OT05FOwo+PiAgICAgICAgICAgICAgICAgIGJyZWFrOwo+PiAgICAgICAgICAgICAgZGVm
YXVsdDoKPj4gLSAgICAgICAgICAgICAgICBpZiAoIChkICYgRHN0TWFzaykgIT0gRHN0TWVtICkK
Pj4gLSAgICAgICAgICAgICAgICB7Cj4+IC0gICAgICAgICAgICAgICAgICAgIEFTU0VSVF9VTlJF
QUNIQUJMRSgpOwo+PiAtICAgICAgICAgICAgICAgICAgICByYyA9IFg4NkVNVUxfVU5IQU5ETEVB
QkxFOwo+PiAtICAgICAgICAgICAgICAgICAgICBnb3RvIGRvbmU7Cj4+IC0gICAgICAgICAgICAg
ICAgfQo+PiArICAgICAgICAgICAgICAgIElNUE9TU0lCTEUoKGQgJiBEc3RNYXNrKSAhPSBEc3RN
ZW0pOwo+IAo+IElNUE9TU0lCTEUoKSBkb2Vzbid0IHJlYWxseSBjb252ZXkgdGhlIGNvcnJlY3Qg
bWVhbmluZyBoZXJlIElNTywgYmVjYXVzZQo+IHRoZSBwdXJwb3NlIG9mIHRoZSBjb25zdHJ1Y3Qg
aXMgdG8gdHJ5IGFuZCBkbyBzb21ldGhpbmcgc2FmZSBpbiB0aGUgY2FzZQo+IHRoYXQgdGhlIGlt
cG9zc2libGUgZG9lcyBoYXBwZW4uCj4gCj4gSW5zdGVhZCwgSSdkIHN1Z2dlc3QgRVhQRUNUKCkg
b3IgUkVRVUlSRSgpIHdpdGggYW4gaW52ZXJ0ZWQgY29uZGl0aW9uLAo+IGJlY2F1c2UgdGhhdCBi
ZXR0ZXIgZW5jYXBzdWxhdGVzIHRoZSBtZWFuaW5nIHRoYXQgd2UgZXhwZWN0IHRoaXMgYWx3YXlz
Cj4gdG8gYmUgdHJ1ZSwgYnV0IHRoYXQgaXQgbWlnaHQgbm90IGJlLgoKT2theSwgRVhQRUNUKCkg
aXQnbGwgYmUgdGhlbi4KCj4gV2l0aCBhIHN1aXRhYmxlIG5hbWUsIFJldmlld2VkLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKVGhhbmtzLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
