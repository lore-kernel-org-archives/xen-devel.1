From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 01/34] x86emul: support AVX512 opmask
 insns
Date: Thu, 25 Oct 2018 19:32:34 +0100
Message-ID: <b48629ea-44bc-5658-5d5f-c739a680956f@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BA0E58F02000078001E94CE@prv1-mh.provo.novell.com>
 <5BA0E71E02000078001E94EC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ahoo=nf=citrix.com=prvs=8298df8fa=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gFkQw-00060J-8B
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 18:32:38 +0000
In-Reply-To: <5BA0E71E02000078001E94EC@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDkvMTggMTI6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEBAIC0xMTg3LDYgKzExODgs
MTEgQEAgc3RhdGljIGludCBfZ2V0X2ZwdSgKPiAgICAgICAgICAgICAgcmV0dXJuIFg4NkVNVUxf
VU5IQU5ETEVBQkxFOwo+ICAgICAgICAgIGJyZWFrOwo+ICAKPiArICAgIGNhc2UgWDg2RU1VTF9G
UFVfb3BtYXNrOgo+ICsgICAgICAgIGlmICggISh4Y3IwICYgWDg2X1hDUjBfU1NFKSB8fCAhKHhj
cjAgJiBYODZfWENSMF9PUE1BU0spICkKPiArICAgICAgICAgICAgcmV0dXJuIFg4NkVNVUxfVU5I
QU5ETEVBQkxFOwo+ICsgICAgICAgIGJyZWFrOwoKSSBzZWUgdGhpcyBmb2xsb3dzIHRoZSBwYXR0
ZXJuIGZyb20gWDg2RU1VTF9GUFVfeW1tLCBidXQgYnkgdGhlIFNTRQpjaGVjaz/CoCBJdCBpcyBu
b3QgcmVsZXZhbnQgYXQgdGhpcyBwb2ludCAtIGlmIHhjcjAub3BtYXNrIGlzIHNldCwgdGhlCm9w
bWFzayBpbnN0cnVjdGlvbnMgc2hvdWxkIGJlIHVzYWJsZS4KCn5BbmRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
