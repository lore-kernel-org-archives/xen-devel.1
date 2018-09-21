From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: Current staging crashes on boot on an AMD EPYC 7251
Date: Fri, 21 Sep 2018 14:51:26 +0300
Message-ID: <c37b8058-0cc2-49d6-70c9-ac16f684a976@bitdefender.com>
References: <79af1936-5093-d101-d3a5-2abd444551e8@bitdefender.com>
 <20180921101545.th2ncxhjg4qk6rfu@mac.bytemobile.com>
 <5BA4CACC02000078001EA7F2@prv1-mh.provo.novell.com>
 <a18e6e4b-36ce-17a5-5bec-f14c60544d6c@bitdefender.com>
 <5BA4CF6602000078001EA8A1@prv1-mh.provo.novell.com>
 <20180921110542.dlvtm7ywim4o23vi@mac.bytemobile.com>
 <20180921111827.zxrnreerirf6syss@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qbiu=md=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g3JyN-00035x-3v
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 11:51:47 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 6B804305FFAB
 for <xen-devel@lists.xenproject.org>; Fri, 21 Sep 2018 14:51:44 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 5CB8B7FC04
 for <xen-devel@lists.xenproject.org>; Fri, 21 Sep 2018 14:51:44 +0300 (EEST)
In-Reply-To: <20180921111827.zxrnreerirf6syss@mac.bytemobile.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, george.dunlap@citrix.com, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gOS8yMS8xOCAyOjE4IFBNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIEZyaSwgU2Vw
IDIxLCAyMDE4IGF0IDAxOjA1OjQyUE0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+
IE9uIEZyaSwgU2VwIDIxLCAyMDE4IGF0IDA1OjAwOjU0QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+Pj4+Pj4gT24gMjEuMDkuMTggYXQgMTI6NDgsIDxyY29qb2NhcnVAYml0ZGVmZW5kZXIu
Y29tPiB3cm90ZToKPj4+PiBPbiA5LzIxLzE4IDE6NDEgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+
Pj4+Pj4+PiBPbiAyMS4wOS4xOCBhdCAxMjoxNSwgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90
ZToKPj4+Pj4+IE9uIEZyaSwgU2VwIDIxLCAyMDE4IGF0IDEyOjQ1OjE4UE0gKzAzMDAsIFJhenZh
biBDb2pvY2FydSB3cm90ZToKPj4+Pj4+PiBXaGlsZSBkb2luZyBteSBiZXN0IHRvIG1ha2Ugc3Vy
ZSB3aGF0IEkgdW5kZXJzdGFuZCB0byBiZSBHZW9yZ2Uncwo+Pj4+Pj4+IHByb3Bvc2VkIGNoYW5n
ZXMgZm9yIHRoZSBhbHRwMm0gc2VyaWVzIEkndmUgdHJpZWQgdG8gYm9vdCBYZW4gc3RhZ2luZyBv
bgo+Pj4+Pj4+IGFuIEFNRCBob3N0LCBidXQgaXQgY3Jhc2hlcyBpbiBhbiB1bnJlbGF0ZWQgcGxh
Y2UgKEkndmUgdGVzdGVkIHRoaXMgYnkKPj4+Pj4+PiBzdGFzaGluZyBteSBjaGFuZ2VzIGFuZCBi
b290aW5nIGEgInZhbmlsbGEiIHN0YWdpbmcpOgo+Pj4+Pj4KPj4+Pj4+IENhbiB5b3UgYXBwbHkg
dGhlIGZvbGxvd2luZyBkZWJ1ZyBwYXRjaCBhbmQgcGFzdGUgdGhlIGZ1bGwgYm9vdCBsb2c/Cj4+
Pj4+Cj4+Pj4+IFdlbGwsIG5vdCBoYXZpbmcgcHJvdmlkZWQgdGhlIGZ1bGwgYm9vdCBsb2cgcmln
aHQgYXdheSBpcyBjbGVhcmx5Cj4+Pj4+IHVuaGVscGZ1bCwgYXMgZnJvbSB0aGF0IGFsb25lIHdl
IHNob3VsZCBiZSBhYmxlIHRvIHRlbGwgd2hhdCdzCj4+Pj4+IGdvaW5nIG9uIGhlcmUgKHVubGVz
cyB3ZSBlLmcuIHNjcmV3IHVwIHRoZSBFODIwIG1hcCBzb21ld2hlcmUpLgo+Pj4+PiBIb3dldmVy
LCBpdCBpcyBhbHJlYWR5IGNsZWFyIHRoYXQgLi4uCj4+Pj4+Cj4+Pj4+PiAtLS0gYS94ZW4vYXJj
aC94ODYvbW0uYwo+Pj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPj4+Pj4+IEBAIC00NjUs
NiArNDY1LDggQEAgdW5zaWduZWQgaW50IHBhZ2VfZ2V0X3JhbV90eXBlKG1mbl90IG1mbikKPj4+
Pj4+ICAgICAgICAgICAgICBicmVhazsKPj4+Pj4+ICAKPj4+Pj4+ICAgICAgICAgIGRlZmF1bHQ6
Cj4+Pj4+PiArcHJpbnRrKCJbJSNseCwgJSNseCkgdHlwZTogJXVcbiIsIGU4MjAubWFwW2ldLmFk
ZHIsCj4+Pj4+PiArICAgICAgIGU4MjAubWFwW2ldLmFkZHIgKyBlODIwLm1hcFtpXS5zaXplLCBl
ODIwLm1hcFtpXS50eXBlKTsKPj4+Pj4+ICAgICAgICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUo
KTsKPj4+Pj4KPj4+Pj4gLi4uIHRoaXMgYXNzZXJ0aW9uIG5lZWRzIHRvIGdvIGF3YXksIGFzIGl0
IHdvdWxkIHRyaWdnZXIgZm9yIGJvdGgKPj4+Pj4gRTgyMF9UWVBFX1BNRU0gYW5kIEU4MjBfVFlQ
RV9QUkFNICh1c2luZyB0aGUgTGludXgKPj4+Pj4gbmFtaW5nKSwgb3IgdGhlIHVubmFtZWQgdHlw
ZSA2IG1lbnRpb25lZCBpbiB0aGVpciBoZWFkZXIuIEl0Cj4+Pj4+IHdvdWxkIGFsc28gdHJpZ2dl
ciBmb3IgdHlwZXMgd2hpY2ggbWF5IGdldCBhZGRlZCBkb3duIHRoZSByb2FkLgo+Pj4+Cj4+Pj4g
SSBoYXZlIGF0dGFjaGVkIHRoZSBmdWxsIGxvZywgYXMgcmVxdWVzdGVkIGJ5IFJvZ2VyLgo+Pj4K
Pj4+IEFuZCB0aGVyZSB3ZSBnbzoKPj4+Cj4+PiAoWEVOKSAgMDAwMDAwMDBkYWJmMjAwMCAtIDAw
MDAwMDAwZGFjZGYwMDAgdHlwZSAyMAo+Pj4KPj4+IFdoYXRldmVyIHRoYXQgaXMuIEkgdGhpbmsg
Zm9yIHRoZSBwdXJwb3NlcyBvZiB0aGUgZnVuY3Rpb24gaGVyZSBhbGwKPj4+IHVua25vd24gdHlw
ZXMgc2hvdWxkIGJlIG1hcHBlZCBpbnRvIFVOVVNBQkxFLgo+Pgo+PiBPaCwgSSBzZW50IGEgcGF0
Y2ggdG8gbWFwIHRoZW0gdG8gUkFNX1RZUEVfVU5LTk9XTiwgYnV0IG1heWJlIFVOVVNBQkxFCj4+
IHdvdWxkIGJlIGJldHRlcj8KPj4KPj4gRm9yIHRoZSBjdXJyZW50IHVzYWdlIG9mIHBhZ2VfZ2V0
X3JhbV90eXBlIGJvdGggd2lsbCBhY2NvbXBsaXNoIHRoZQo+PiBzYW1lLgo+IAo+IFNjcmF0Y2gg
dGhhdCwgdGhleSB3b24ndCBhY2NvbXBsaXNoIHRoZSBzYW1lLiBJZiB3ZSBkZWNpZGUgdG8gdXNl
Cj4gVU5VU0FCTEUgaXQgd29uJ3QgYmUgbWFwcGVkIGluIHRoZSBpbmNsdXNpdmUgY2FzZSwgaWYg
VU5LTk9XTiBpcyB1c2VkCj4gaXQgd2lsbCBiZSBtYXBwZWQgaW4gdGhlIGluY2x1c2l2ZSBjYXNl
Lgo+IAo+IFByZXZpb3VzIGJlaGF2aW9yICh3aGVuIHVzaW5nIHBhZ2VfaXNfcmFtX3R5cGUgaW5z
dGVhZCBvZgo+IHBhZ2VfZ2V0X3JhbV90eXBlKSB3b24ndCBtYXJrIHVua25vd24gcmFuZ2UgdHlw
ZXMgYXMgVU5VU0FCTEUsIHNvCj4gVU5LTk9XTiBzaG91bGQgYmUgdGhlIHNhbWUgYmVoYXZpb3Ig
YXMgYmVmb3JlLgoKRldJVywgSSd2ZSB0ZXN0ZWQgaXQgd2l0aCBVTlVTQUJMRSBhbmQgaXQgYm9v
dHMsIHNvIGFzc3VtaW5nIHRoYXQgeW91IGdvCndpdGggdGhhdDoKClRlc3RlZC1ieTogUmF6dmFu
IENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgoKClRoYW5rcywKUmF6dmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
