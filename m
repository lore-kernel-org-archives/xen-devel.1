From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 03/11] tools/libs/*: Rely on the default
 logger
Date: Thu, 15 Nov 2018 14:44:22 +0000
Message-ID: <20181115144422.qwluko74wibxlkph@zion.uk.xensource.com>
References: <20181108170805.12774-1-ian.jackson@eu.citrix.com>
 <20181108170805.12774-4-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=krfn=n2=citrix.com=prvs=850791b01=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gNIsb-0003Ou-VL
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 14:44:26 +0000
Content-Disposition: inline
In-Reply-To: <20181108170805.12774-4-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDU6MDc6NTdQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gRGVsZXRlIDExIGVudGlyZWx5IGZvcm11bGFpYyBjb25kaXRpb25hbCBjYWxscyB0bwo+
ICAgeHRsX2NyZWF0ZWxvZ2dlcl9zdGRpb3N0cmVhbShzdGRlcnIsIFhUTF9QUk9HUkVTUywgMCk7
Cj4gYW5kIGFzc29jaWF0ZWQgbG9nZ2VyX3RvZnJlZSB2YXJpYWJsZXMsIGVycm9yIGhhbmRsaW5n
LCBldGMuCj4gCj4gTm8gb3ZlcmFsbCBmdW5jdGlvbmFsIGNoYW5nZSwgYWx0aG91Z2ggc29tZSBt
ZW1vcnkgYWxsb2NhdGlvbiBlcnJvcnMKPiBtYXkgbm8gbG9uZ2VyIG9jY3VyLgo+IAo+IEFmdGVy
IHRoaXMgdGhlcmUgYXJlIHN0aWxsIHNldmVyYWwgY2FsbHMgdG8KPiB4dGxfY3JlYXRlbG9nZ2Vy
X3N0ZGlvc3RyZWFtIGluIHRyZWUsIGJ1dCB0aGV5IGFsbW9zdCBhbGwgaGF2ZQo+IG5vbi1kZWZh
dWx0IG1lc3NhZ2UgbGV2ZWwgZXRjLiBzbyBpdCBpcyBub3Qgb2J2aW91cyB0aGF0IHRoZXkgc2hv
dWxkCj4gYmUgcmVwbGFjZWQuCj4gCj4gVGhlIGV4Y2VwdGlvbiBpcyBpbiB4Y19wcml2YXRlLmMg
d2hlcmUgeGNoLT5lcnJvcl9oYW5kbGVyIGlzCj4gaW5pdGlhbGlzZWQgdXNpbmcgYSBjb3B5IG9m
IHRoZSBkZWZhdWx0IGluaXRpYWxpc2F0aW9uIGJvaWxlcnBsYXRlCj4gKGFudCB0aGVyZSBpcyB0
aGUgYXNzb2NpYXRlZCB4Y2gtPmVycm9yX2hhbmRsZXJfdG9mcmVlKS4gIEhvd2V2ZXIsCj4gdGhl
cmUgaXMgYWxzbyB4Y2gtPmRvbWJ1aWxkX2xvZ2dlciwgYW5kIHhjaC0+ZG9tYnVpbGRfbG9nZ2Vy
X3RvZnJlZQo+IHdoaWNoIGlzIGhhbmRsZWQgZGlmZmVyZW50bHkgYW5kIHNvIG11c3QgYmUgcmV0
YWluZWQuICBJdCBzZWVtcyBiZXR0ZXIKPiB0byBrZWVwIHRoZSB4Y2ggY29kZSBpbnRlcm5hbGx5
IGNvbnNpc3RlbnQsIGFuZCBkZWNvdXBsZWQgZnJvbSB0aGUKPiBnZW5lcmFsIGRlZmF1bHQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
