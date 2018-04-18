From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v8 3/9] xen/x86: support per-domain flag for
 xpti
Date: Wed, 18 Apr 2018 17:54:56 +0200
Message-ID: <8f96a4df-c351-11be-72bd-7c70f3215540@suse.com>
References: <20180418083051.8334-1-jgross@suse.com>
 <20180418083051.8334-4-jgross@suse.com> <5AD7647502000078001BC6C8@suse.com>
 <499544e3-848e-09c4-568e-cd5f0c9f7bc8@suse.com>
 <5AD7680102000078001BC725@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=v9n4=hh=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f8pQD-0005jV-2L
 for xen-devel@lists.xenproject.org; Wed, 18 Apr 2018 15:55:01 +0000
In-Reply-To: <5AD7680102000078001BC725@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDQvMTggMTc6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE4LjA0LjE4IGF0
IDE3OjMzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMTgvMDQvMTggMTc6MjksIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTguMDQuMTggYXQgMTA6MzAsIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvbXVsdGkuYwo+
Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvbXVsdGkuYwo+Pj4+IEBAIC05NjcsNyAr
OTY3LDcgQEAgc3RhdGljIGludCBzaGFkb3dfc2V0X2w0ZShzdHJ1Y3QgZG9tYWluICpkLAo+Pj4+
ICAgICAgICAgIHNoX3B1dF9yZWYoZCwgb3NsM21mbiwgcGFkZHIpOwo+Pj4+ICAgICAgfQo+Pj4+
ICAKPj4+PiAtICAgIGlmICggIWNwdV9oYXNfbm9feHB0aSApCj4+Pj4gKyAgICBpZiAoIGlzX3B2
X2RvbWFpbihkKSAmJiBkLT5hcmNoLnB2X2RvbWFpbi54cHRpICkKPj4+PiAgICAgICAgICAvKgo+
Pj4+ICAgICAgICAgICAqIExhenkgZmx1c2hpbmcgaXMgZW5vdWdoOiBlaXRoZXIgd2UgZG8gYSBU
TEIgZmx1c2ggcmlnaHQgYWZ0ZXJ3YXJkcwo+Pj4+ICAgICAgICAgICAqIHdoaWNoIHdpbGwgcGlj
ayB1cCB0aGUgbmV3IHJvb3QgcGFnZSB0YWJsZSBvbiBhbGwgYWZmZWN0ZWQgY3B1cwo+Pj4KPj4+
IEhvdyBjb21lIHRoZSBpc19wdl9kb21haW4oKSBpcyBhcHBlYXJpbmcgb25seSBoZXJlPwo+Pgo+
PiBJdCBpcyBtYW5kYXRvcnkgZm9yIHRlc3RpbmcgdGhlIHBlci1kb21haW4geHB0aSBmbGFnLiBJ
IGNvdWxkIGFkZCBpdCBpbgo+PiBwYXRjaCAxIGFscmVhZHkgaWYgeW91IGxpa2UgdGhhdCBiZXR0
ZXIuCj4gCj4gV2VsbCwgaWYgeW91IGFkZGVkIGl0IGVhcmxpZXIsIHNvbWUgdW5uZWNlc3Nhcnkg
SVBJcyB3b3VsZCBiZSBzdXBwcmVzc2VkCj4gcmlnaHQgYXdheS4KCldoaWNoIElQSXM/IFRoZXJl
IGlzIG5vIElQSSBpbnZvbHZlZCBoZXJlLiBXZSBhcmUganVzdCBzZXR0aW5nIHRoZSBmbGFncwpm
cm9tIHRoZSBjdXJyZW50IGNwdSBmb3IgYWxsIGNwdXMgd2hpY2ggbmVlZCB0byBwaWPhuLEgaXQg
dXAuIFRoYXQncyB0aGUKcmVhc29uIGZvciB0aGUgY29tbWVudCByZWdhcmRpbmcgImxhenkgZmx1
c2hpbmciLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
