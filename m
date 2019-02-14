From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/pv: Fix construction of 32bit dom0's
Date: Thu, 14 Feb 2019 05:01:22 -0700
Message-ID: <5C6558920200007800216A7D@prv1-mh.provo.novell.com>
References: <20190214111009.16448-1-wei.liu2@citrix.com>
 <5C6555C10200007800216A6F@prv1-mh.provo.novell.com>
 <20190214115454.uxo7sjhjyblkpnos@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1guFhp-0005SV-O7
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 12:01:29 +0000
In-Reply-To: <20190214115454.uxo7sjhjyblkpnos@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAyLjE5IGF0IDEyOjU0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBGZWIgMTQsIDIwMTkgYXQgMDQ6NDk6MjFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAxNC4wMi4xOSBhdCAxMjoxMCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IEZyb206IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Cj4+ID4gCj4+ID4gZG9tMF9jb25zdHJ1Y3RfcHYoKSBoYXMgbG9naWMgdG8gdHJhbnNpdGlvbiBk
b20wIGludG8gYSBjb21wYXQgZG9tYWluIHdoZW4KPj4gPiBib290aW5nIGFuIEVMRjMyIGltYWdl
Lgo+PiA+IAo+PiA+IE9uZSBhc3BlY3Qgd2hpY2ggaXMgbWlzc2luZyBpcyB0aGUgQ1BVSUQgcG9s
aWN5IHJlY2FsY3VsYXRpb24sIG1lYW5pbmcgdGhhdCBhCj4+ID4gMzJiaXQgZG9tMCBzZWVzIGEg
NjRiaXQgcG9saWN5LCB3aGljaCBkaWZmZXIgYnkgdGhlIExvbmcgTW9kZSBmZWF0dXJlIGZsYWcg
aW4KPj4gPiBwYXJ0aWN1bGFyLiAgQW5vdGhlciBtaXNzaW5nIGl0ZW0gaXMgdGhlIHg4N19maXBf
d2lkdGggaW5pdGlhbGlzYXRpb24uCj4+ID4gCj4+ID4gVXBkYXRlIGRvbTBfY29uc3RydWN0X3B2
KCkgdG8gdXNlIHN3aXRjaF9jb21wYXQoKSwgcmF0aGVyIHRoYW4gcmV0YWluaW5nIHRoZQo+PiA+
IG9wZW5jb2RpbmcuICBQb3NpdGlvbiB0aGUgY2FsbCB0byBzd2l0Y2hfY29tcGF0KCkgc3VjaCB0
aGF0IHRoZSBjb21wYXQzMiBsb2NhbAo+PiA+IHZhcmlhYmxlIGNhbiBkaXNhcHBlYXIgZW50aXJl
bHkuCj4+ID4gCj4+ID4gVGhlIDMyYml0IG1vbml0b3IgdGFibGUgaXMgbm93IGNyZWF0ZWQgYnkg
c2V0dXBfY29tcGF0X2w0KCksIGF2b2lkaW5nIHRoZSBuZWVkCj4+ID4gdG8gZm9yIG1hbnVhbCBj
cmVhdGlvbiBsYXRlci4gIEZ1cnRoZXJtb3JlLCB0aGUgTDMgdGFibGUgY3JlYXRpb24gaXMgcmVk
dW5kYW50Cj4+ID4gd2l0aCB0aGUgbG9naWMgaW5zaWRlIHRoZSBtYWluIG1hcHBpbmcgbG9vcCwg
c28gY2FuIGJlIGRyb3BwZWQgYXMgd2VsbC4KPj4gCj4+IFRoaXMgbGFzdCBzZW50ZW5jZSBpcyBu
byBsb25nZXIgYXBwbGljYWJsZSBhZmFpY3QuCj4gCj4gR29vZCBjYXRjaC4KPiAKPiBJIHRoaW5r
IHRoZSBzdWJqZWN0IGxpbmUgYWxzbyBuZWVkcyBmaXhpbmcuIEl0IHNob3VsZCByZWFkOgo+IAo+
ICAgICB4ODYvcHY6IEZpeCBjb25zdHJ1Y3Rpb24gb2YgMzJiaXQgZG9tMAo+IAo+IGkuZS4gdGhl
IHBvc3Nlc3NpdmUgZm9ybSBpcyB3cm9uZy4KClBlcmhhcHMuIEkgd2FzIHVuZGVyIHRoZSBpbXBy
ZXNzaW9uIHRoYXQgQW5kcmV3IG1lYW50IHBsdXJhbC4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
