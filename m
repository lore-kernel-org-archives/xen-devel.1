From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86: correct default_xen_spec_ctrl
 calculation
Date: Tue, 29 May 2018 12:12:01 +0200
Message-ID: <1a75a028-19af-c299-5822-4a597f61f961@suse.com>
References: <5B07EE9702000078001C5E5B@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ztdp=iq=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fNbbq-0003PP-IN
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 10:12:06 +0000
In-Reply-To: <5B07EE9702000078001C5E5B@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDUvMTggMTM6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEV2ZW4gd2l0aCBvcHRfbXNy
X3NjX3twdixodm19IGJvdGggZmFsc2Ugd2Ugc2hvdWxkIHNldCB1cCB0aGUgdmFyaWFibGUKPiBh
cyB1c3VhbCwgdG8gZW5zdXJlIHByb3BlciBvbmUtdGltZSBzZXR1cCBkdXJpbmcgYm9vdCBhbmQg
Q1BVIGJyaW5ndXAuCj4gVGhpcyB0aGVuIGFsc28gYnJpbmdzIHRoZSBjb2RlIGluIGxpbmUgd2l0
aCB0aGUgY29tbWVudCBpbW1lZGlhdGVseQo+IGFoZWFkIG9mIHRoZSBwcmludGsoKSBiZWluZyBt
b2RpZmllZCBzYXlpbmcgImlycmVzcGVjdGl2ZSBvZiBndWVzdHMiLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
