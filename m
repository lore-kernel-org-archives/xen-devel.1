From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: don't build guest-walk code without
 HVM and SHADOW_PAGING
Date: Fri, 05 Oct 2018 05:24:14 -0600
Message-ID: <5BB749DE02000078001EEC9D@prv1-mh.provo.novell.com>
References: <5BB73B0502000078001EEBB6@prv1-mh.provo.novell.com>
 <e31ed1a4-509c-a51c-3315-244ba0150107@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vier=mr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g8ODR-0006I4-TJ
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 11:24:17 +0000
In-Reply-To: <e31ed1a4-509c-a51c-3315-244ba0150107@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEwLjE4IGF0IDEyOjMyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDUvMTAvMTggMTE6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBJdCdzIGRlYWQg
Y29kZSBpbiB0aGF0IGNhc2UuCj4+Cj4+IFdlIGNvdWxkIGdvIGZ1cnRoZXIsIGFzIHdlIGRvbid0
IHJlYWxseSBuZWVkIHRoZSAyLSBhbmQgMy1sZXZlbCB3YWxrCj4+IGNvZGUgaW4gUFYgbW9kZSwg
YnV0IHRvIGRyb3AgdGhlaXIgY29tcGlsYXRpb24gcmVxdWlyZXMgcXVpdGUgYSBiaXQgb2YKPj4g
ZGlzZW50YW5nbGluZyBvZiBzaGFkb3cgbW9kZSBjb2RlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS9NYWtlZmlsZQo+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vTWFrZWZpbGUKPj4gQEAgLTIsOSAr
Miw4IEBAIHN1YmRpci15ICs9IHNoYWRvdwo+PiAgc3ViZGlyLSQoQ09ORklHX0hWTSkgKz0gaGFw
Cj4+ICAKPj4gIG9iai0kKENPTkZJR19IVk0pICs9IGFsdHAybS5vCj4+IC1vYmoteSArPSBndWVz
dF93YWxrXzIubwo+PiAtb2JqLXkgKz0gZ3Vlc3Rfd2Fsa18zLm8KPj4gLW9iai15ICs9IGd1ZXN0
X3dhbGtfNC5vCj4+ICtvYmotJChDT05GSUdfSFZNKSArPSBndWVzdF93YWxrXzIubyBndWVzdF93
YWxrXzMubyBndWVzdF93YWxrXzQubwo+PiArb2JqLSQoQ09ORklHX1NIQURPV19QQUdJTkcpICs9
IGd1ZXN0X3dhbGtfMi5vIGd1ZXN0X3dhbGtfMy5vIGd1ZXN0X3dhbGtfNC5vCj4+ICBvYmotJChD
T05GSUdfTUVNX0FDQ0VTUykgKz0gbWVtX2FjY2Vzcy5vCj4+ICBvYmoteSArPSBtZW1fcGFnaW5n
Lm8KPj4gIG9iai15ICs9IG1lbV9zaGFyaW5nLm8KPiAKPiBJJ20gZmluZSB3aXRoIHRoZSBjaGFu
Z2UgaW4gcHJpbmNpcGxlLiAgSG93IGFib3V0Cj4gCj4gb2JqLWd3IDo9IGd1ZXN0X3dhbGtfMi5v
IGd1ZXN0X3dhbGtfMy5vIGd1ZXN0X3dhbGtfNC5vCj4gCj4gb2JqLSQoQ09ORklHX0hWTSkgKz0g
b2JqLWd3Cj4gb2JqLSQoQ09ORklHX1NIQURPV19QQUdJTkcpICs9IG9iai1ndwo+IAo+IHRvIGF2
b2lkIGR1cGxpY2F0aW5nIHRoZSBndWVzdF93YWxrKiBsaXN0PwoKSSBoYWQgaXQgdGhhdCB3YXks
IGFuZCBJIGRyb3BwZWQgaXQgc3BlY2lmaWNhbGx5IGluIG9yZGVyIHRvIGxhdGVyCmp1c3QgdG91
Y2ggdGhlIHNoYWRvdyByZWxhdGVkIGxpbmUsIHdoZW4gb25seSB0aGUgNC1sZXZlbCB3YWxrCmlz
IGdvaW5nIHRvIHJlbWFpbiBuZWVkZWQgb24gIUhWTSBjb25maWdzLgoKPiBFaXRoZXIgd2F5LCBB
Y2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClRoYW5r
cywgSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
