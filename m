From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/6] x86: make CPU state flush requests
	explicit
Date: Fri, 19 Jan 2018 17:40:59 +0000
Message-ID: <a84b24c8-2973-e0f2-d543-8698971db4b3@citrix.com>
References: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
 <5A6224F502000078001A078B@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rwd1=eo=citrix.com=prvs=5503b2e3b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ecbT7-0003dk-MO
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 18:32:49 +0000
In-Reply-To: <5A6224F502000078001A078B@prv-mh.provo.novell.com>
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
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDEvMTggMTY6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IC0tLSBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvZmx1c2h0bGIuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZmx1c2h0bGIu
aAo+IEBAIC0xMDEsNiArMTAxLDggQEAgdm9pZCB3cml0ZV9jcjModW5zaWduZWQgbG9uZyBjcjMp
Owo+ICAjZGVmaW5lIEZMVVNIX0NBQ0hFICAgICAgMHg0MDAKPiAgIC8qIFZBIGZvciB0aGUgZmx1
c2ggaGFzIGEgdmFsaWQgbWFwcGluZyAqLwo+ICAjZGVmaW5lIEZMVVNIX1ZBX1ZBTElEICAgMHg4
MDAKPiArIC8qIEZsdXNoIENQVSBzdGF0ZSAqLwo+ICsjZGVmaW5lIEZMVVNIX1NUQVRFICAgICAg
MHgxMDAwCgpTVEFURSBjb3VsZCBsZWdpdGltYXRlbHkgZGVzY3JpYmUgYW55IG9mIHRoZSBvdGhl
ciBGTFVTSCBmbGFncy7CoApGTFVTSF9WQ1BVX1NUQVRFID8KCn5BbmRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
