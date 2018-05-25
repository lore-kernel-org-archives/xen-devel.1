From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: correct default_xen_spec_ctrl
 calculation
Date: Fri, 25 May 2018 13:53:26 +0100
Message-ID: <2ed828cb-1aca-4b13-dc9f-19508eb3850c@citrix.com>
References: <5B07EE9702000078001C5E5B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j+m0=im=citrix.com=prvs=676bf93bc=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fMCDq-0003VL-81
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 12:53:30 +0000
In-Reply-To: <5B07EE9702000078001C5E5B@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDUvMTggMTI6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEV2ZW4gd2l0aCBvcHRfbXNy
X3NjX3twdixodm19IGJvdGggZmFsc2Ugd2Ugc2hvdWxkIHNldCB1cCB0aGUgdmFyaWFibGUKPiBh
cyB1c3VhbCwgdG8gZW5zdXJlIHByb3BlciBvbmUtdGltZSBzZXR1cCBkdXJpbmcgYm9vdCBhbmQg
Q1BVIGJyaW5ndXAuCj4gVGhpcyB0aGVuIGFsc28gYnJpbmdzIHRoZSBjb2RlIGluIGxpbmUgd2l0
aCB0aGUgY29tbWVudCBpbW1lZGlhdGVseQo+IGFoZWFkIG9mIHRoZSBwcmludGsoKSBiZWluZyBt
b2RpZmllZCBzYXlpbmcgImlycmVzcGVjdGl2ZSBvZiBndWVzdHMiLgo+Cj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSG1tIHllcyAtIEkgdGhpbmsgdGhl
IGxvZ2ljIGhlcmUgZ290IGEgYml0IHRhbmdsZWQgb3ZlciB0aGUgY291cnNlIG9mCmRldmVsb3Bt
ZW50LgoKQUZBSUNULCB0aGlzIHNob3VsZCB3b3JrLCBzbyB0ZW50YXRpdmVseSBSZXZpZXdlZC1i
eTogQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
