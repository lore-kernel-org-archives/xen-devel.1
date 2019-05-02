From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
Date: Thu, 2 May 2019 14:25:56 +0000
Message-ID: <a74ec132b1c34bd19d0d4abeb4cc94eb@AMSPEX02CL03.citrite.net>
References: <5CCAE2A5020000780022B35E@prv1-mh.provo.novell.com>
 <8300afef-e75e-1d81-83e4-7f020595f81a@citrix.com>
 <5CCAEDAB020000780022B3EC@prv1-mh.provo.novell.com>
 <a99e7a6b-6c45-759b-ee0e-ed9174397de3@citrix.com>
 <5CCAF70E020000780022B4A1@prv1-mh.provo.novell.com>
 <941b423b37074521af2e4559fd19c149@AMSPEX02CL03.citrite.net>
 <5CCAFDB6020000780022B4F4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3XpE=TC=citrix.com=prvs=01897380a=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hMCip-0003TJ-IP
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 14:30:03 +0000
In-Reply-To: <5CCAFDB6020000780022B4F4@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDIgTWF5IDIwMTkgMTU6MjUKPiBUbzogUGF1bCBE
dXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogQW5kcmV3IENvb3BlciA8QW5k
cmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0
cml4LmNvbT47IFJvZ2VyIFBhdQo+IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWwgPHhlbi0KPiBkZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZz4KPiBTdWJqZWN0OiBSRTogW1BBVENIXSB4ODYvSFZNOiBwMm1fcmFtX3Jv
IGlzIGluY29tcGF0aWJsZSB3aXRoIGRldmljZSBwYXNzLXRocm91Z2gKPiAKPiA+Pj4gT24gMDIu
MDUuMTkgYXQgMTY6MTIsIDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiBBY3R1
YWxseSwgc2luY2UgZ2xvYmFsX2xvZ2RpcnR5IGlzIHNvbWV3aGF0IHRyYW5zaWVudCBzaG91bGQg
d2Ugbm90IGFsc28KPiA+IGhhdmUgYSBjaGVjayB0byBwcmV2ZW50IHAybV9yYW1fbG9nZGlydHkg
ZnJvbSBiZWluZyBzZXQgZm9yIGEgZG9tYWluIHdpdGgKPiA+IGFzc2lnbmVkIGRldmljZXMgYW5k
IHNoYXJlZCBFUFQ/Cj4gCj4gUHJvYmFibHkgKGlmIHdlIGluZGVlZCBkb24ndCksIGJ1dCBpbW8g
bm90IGluIHRoaXMgcGF0Y2guCj4gCgpZZXMsIGZhaXIgZW5vdWdoLgoKICBQYXVsCgo+IEphbgo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
