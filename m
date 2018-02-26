From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xenstore: try to get minimum thread
 stack size for watch thread
Date: Mon, 26 Feb 2018 08:25:06 +0100
Message-ID: <39c15302-a5fc-1eec-bfc4-4cdbce6ff396@suse.com>
References: <20180222135335.13913-1-jgross@suse.com>
 <18a5c469-f23e-72fc-7186-d45066d9d809@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=djnd=fu=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eqD9s-0003i8-1R
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 07:25:12 +0000
In-Reply-To: <18a5c469-f23e-72fc-7186-d45066d9d809@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jim Fehlig <jfehlig@suse.com>, xen-devel@lists.xenproject.org
Cc: ian.jackson@eu.citrix.com, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDIvMTggMDI6MjIsIEppbSBGZWhsaWcgd3JvdGU6Cj4gT24gMDIvMjIvMjAxOCAwNjo1
MyBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gV2hlbiBjcmVhdGluZyBhIHB0aHJlYWQgaW4g
eHNfd2F0Y2goKSB0cnkgdG8gZ2V0IHRoZSBtaW5pbWFsIG5lZWRlZAo+PiBzaXplIG9mIHRoZSB0
aHJlYWQgZnJvbSBnbGliYyBpbnN0ZWFkIG9mIHVzaW5nIGEgY29uc3RhbnQuIFRoaXMgYXZvaWRz
Cj4+IHByb2JsZW1zIHdoZW4gdGhlIGxpYnJhcnkgaXMgdXNlZCBpbiBwcm9ncmFtcyB3aXRoIGxh
cmdlIHBlci10aHJlYWQKPj4gbWVtb3J5Lgo+Pgo+PiBVc2UgZGxzeW0oKSB0byBnZXQgdGhlIHBv
aW50ZXIgdG8gX19wdGhyZWFkX2dldF9taW5zdGFjaygpIGluIG9yZGVyIHRvCj4+IGF2b2lkIGxp
bmthZ2UgcHJvYmxlbXMgYW5kIGZhbGwgYmFjayB0byB0aGUgY3VycmVudCBjb25zdGFudCBzaXpl
IGlmCj4+IG5vdCBmb3VuZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgo+PiAtLS0KPj4gT25seSBjb21waWxlIHRlc3RlZC4gSmltLCBjYW4geW91
IHBsZWFzZSB2ZXJpZnkgdGhpcyBwYXRjaCBpcyBzb2x2aW5nCj4+IHlvdXIgb3JpZ2luYWwgcHJv
YmxlbT8KPiAKPiBJdCBkaWRuJ3QgaGVscCwgYnV0IGl0IGNvdWxkIGJlIGR1ZSB0byBteSBidWdn
eSBnbGliYwoKTm8sIGl0IHdhcyBqdXN0IGEgc2lsbHkgbWlzdGFrZSBpbiBteSBwYXRjaC4KClNl
bmRpbmcgVjIgc29vbi4uLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
