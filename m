From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH v6] x86/setup: properly update PTEs if
 src/dst overlaps when relocating Xen image
Date: Fri, 20 Apr 2018 11:53:21 +0200
Message-ID: <20180420095321.GH6312@olila.local.net-space.pl>
References: <1524148118-12982-1-git-send-email-daniel.kiper@oracle.com>
 <5AD8B03F02000078001BCB65@prv1-mh.provo.novell.com>
 <20180420091535.GG6312@olila.local.net-space.pl>
 <5AD9B3A602000078001BCE28@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ly3b=hj=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1f9SjV-0000Nv-3g
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 09:53:33 +0000
Content-Disposition: inline
In-Reply-To: <5AD9B3A602000078001BCE28@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMjAsIDIwMTggYXQgMDM6MzI6MjJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIwLjA0LjE4IGF0IDExOjE1LCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+
IHdyb3RlOgo+ID4gT24gVGh1LCBBcHIgMTksIDIwMTggYXQgMDk6MDU6MzVBTSAtMDYwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDE5LjA0LjE4IGF0IDE2OjI4LCA8ZGFuaWVsLmtp
cGVyQG9yYWNsZS5jb20+IHdyb3RlOgo+ID4+ID4gQEAgLTEwMTksNiArMTAyMCwxNSBAQCB2b2lk
IF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQo+ID4+ID4g
ICAgICAgICAgICAgIGJvb3RzeW0odHJhbXBvbGluZV94ZW5fcGh5c19zdGFydCkgPSBlOwo+ID4+
ID4KPiA+PiA+ICAgICAgICAgICAgICAvKgo+ID4+ID4gKyAgICAgICAgICAgICAqIEFsbCBQVEVz
IHBvaW50aW5nIGFib3ZlIHRoYXQgYWRkcmVzcyBhcmUgbm90IGNhbmRpZGF0ZXMgZm9yCj4gPj4g
PiArICAgICAgICAgICAgICogcmVsb2NhdGlvbi4gRHVlIHRvIHBvc3NpYmlsaXR5IG9mIHBhcnRp
YWwgb3ZlcmxhcCBvZiB0aGUgZW5kCj4gPj4gPiArICAgICAgICAgICAgICogb2Ygc291cmNlIGlt
YWdlIGFuZCB0aGUgYmVnaW5uaW5nIG9mIHJlZ2lvbiBmb3IgZGVzdGluYXRpb24KPiA+PiA+ICsg
ICAgICAgICAgICAgKiBpbWFnZSBzb21lIFBURXMgbWF5IHBvaW50IHRvIGFkZHJlc3NlcyBpbgo+
ID4+ID4gKyAgICAgICAgICAgICAqIHJhbmdlIFtlLCBlICsgWEVOX0lNR19PRkZTRVQpLgo+ID4+
ID4gKyAgICAgICAgICAgICAqLwo+ID4+ID4gKyAgICAgICAgICAgIHB0ZV91cGRhdGVfbGltaXQg
PSBQRk5fRE9XTihlICsgWEVOX0lNR19PRkZTRVQpOwo+ID4+Cj4gPj4gUGVyaGFwcyBiZXR0ZXIg
c3RhcnQgd2l0aCAiTm8gUFRFcyBwb2ludGluZyBhYm92ZSB0aGlzIGFkZHJlc3MgYXJlCj4gPj4g
Y2FuZGlkYXRlcyAuLi4iPwo+ID4KPiA+IEkgYW0gT0sgd2l0aCB0aGF0IGNoYW5nZS4gU2hvdWxk
IEkgcG9zdCB2NyBvciBhcmUgeW91IGdvaW5nIHRvIHVwZGF0ZQo+ID4gdGhlIGNvbW1lbnQgYmVm
b3JlIGNvbW1pdHRpbmc/IEJvdGggd29ya3MgZm9yIG1lLgo+Cj4gSSd2ZSByZWNvcmRlZCBhIG5v
dGUgdG8gdGhhdCBlZmZlY3QsIGJ1dCBJIGNlcnRhaW5seSB3b3VsZG4ndCBtaW5kIGlmIEkgZGlk
bid0Cj4gaGF2ZSB0byBlZGl0IHRoZSBwYXRjaCBiZWZvcmUgY29tbWl0dGluZy4KCkkgaGF2ZSBq
dXN0IHNlbnQgdjcgZm9yIHlvdXIgY29udmVuaWVuY2UuCgpEYW5pZWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
