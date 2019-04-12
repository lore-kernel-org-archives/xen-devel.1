From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86/mem_sharing: reorder when pages are
 unlocked and released
Date: Fri, 12 Apr 2019 08:29:29 -0600
Message-ID: <5CB0A0C90200007800226EB4@prv1-mh.provo.novell.com>
References: <20190412042930.2867-1-tamas@tklengyel.com>
 <5CB07CB30200007800226E07@prv1-mh.provo.novell.com>
 <CABfawhnByKWejmUUdCaCEpoE-TmdzwvQ=jVZxkz+mS8YuTRsfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hExBN-0003bZ-GG
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 14:29:33 +0000
In-Reply-To: <CABfawhnByKWejmUUdCaCEpoE-TmdzwvQ=jVZxkz+mS8YuTRsfQ@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjA0LjE5IGF0IDE1OjQxLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgNTo1NSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+PiA+Pj4gT24gMTIuMDQuMTkgYXQgMDY6MjksIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPiB3cm90ZToKPj4gPiBAQCAtOTg0LDcgKzk3Niw3IEBAIHN0YXRpYyBpbnQgc2hhcmVf
cGFnZXMoc3RydWN0IGRvbWFpbiAqc2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVfdCBzaCwKPj4g
PiAgICAgICAgICAgKiBEb24ndCBjaGFuZ2UgdGhlIHR5cGUgb2Ygcm1hcCBmb3IgdGhlIGNsaWVu
dCBwYWdlLiAqLwo+PiA+ICAgICAgICAgIHJtYXBfZGVsKGdmbiwgY3BhZ2UsIDApOwo+PiA+ICAg
ICAgICAgIHJtYXBfYWRkKGdmbiwgc3BhZ2UpOwo+PiA+IC0gICAgICAgIHB1dF9wYWdlX2FuZF90
eXBlKGNwYWdlKTsKPj4gPiArICAgICAgICBwdXRfY291bnQrKzsKPj4KPj4gU2luY2UgdGhpcyBz
aXRzIGluIGEgd2hpbGUoKSwgLi4uCj4+Cj4+ID4gQEAgLTEwMDIsNyArOTk0LDkgQEAgc3RhdGlj
IGludCBzaGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpzZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hhbmRs
ZV90IHNoLAo+PiA+ICAgICAgLyogRnJlZSB0aGUgY2xpZW50IHBhZ2UgKi8KPj4gPiAgICAgIGlm
KHRlc3RfYW5kX2NsZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJmNwYWdlLT5jb3VudF9pbmZvKSkK
Pj4gPiAgICAgICAgICBwdXRfcGFnZShjcGFnZSk7Cj4+ID4gLSAgICBwdXRfcGFnZShjcGFnZSk7
Cj4+ID4gKwo+PiA+ICsgICAgd2hpbGUocHV0X2NvdW50LS0pCj4+ID4gKyAgICAgICAgcHV0X3Bh
Z2VfYW5kX3R5cGUoY3BhZ2UpOwo+Pgo+PiAuLi4gcHV0X2NvdW50IG1heSBiZSB6ZXJvIGJlZm9y
ZSB0aGlzIHdoaWxlKCkuIEF0IHdoaWNoIHBvaW50IHRoZQo+PiBlYXJsaWVyIHB1dF9wYWdlKCkg
d291bGQgc3RpbGwgYmUgdW5zYWZlLgo+IAo+IFRoZSBwYWdlIHNob3VsZCBoYXZlIGF0IGxlYXN0
IG9uZSByZWZlcmVuY2UgaXQgZ290IGJlZm9yZSB3aGVuIHRoZQo+IHBhZ2Ugd2VudCB0aHJvdWdo
IHBhZ2VfbWFrZV9zaGFyYWJsZSBmdW5jdGlvbi4gV2UgYWxzbyB2ZXJpZmllZCB0aGF0Cj4gdGhl
IHBhZ2UgaXMgc3RpbGwgc2hhcmFibGUgc28gdGhhdCByZWZlcmVuY2UgaXMgc3RpbGwgdGhlcmUs
IHNvIHRoaXMKPiBjb3VudCBpcyBhdCBsZWFzdCAxLiBXZSBjb3VsZCBjZXJ0YWlubHkgYWRkIGFu
IEFTU0VSVChwdXRfY291bnQpCj4gYmVmb3JlIHRob3VnaC4KCkkgc2VlIC0gYmFjayB3aGVuIEkg
Y3JlYXRlZCB0aGUgY2hhbmdlIHlvdSdyZSBub3cgdHJ5aW5nIHRvIGZpeCwKSSB3YXMgd29uZGVy
aW5nIGJ1dCBjb3VsZG4ndCBmaW5kIGFueSBwcm9vZi4gU28geWVzLCBhZGRpbmcgYW4KQVNTRVJU
KCkgd291bGQgc3VyZWx5IGJlIGhlbHBmdWwuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
