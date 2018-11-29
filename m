From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V10 5/5] p2m: change_type_range: Only
 invalidate mapped gfns
Date: Thu, 29 Nov 2018 13:47:44 +0200
Message-ID: <60db30a2-88a3-9984-88d0-84d36d70792f@bitdefender.com>
References: <1543442182-3557-1-git-send-email-rcojocaru@bitdefender.com>
 <1543442182-3557-6-git-send-email-rcojocaru@bitdefender.com>
 <5BFFBA4E02000078002011B0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=towv=oi=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gSKnY-0001KW-Qw
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 11:48:00 +0000
In-Reply-To: <5BFFBA4E02000078002011B0@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjkvMTggMTI6MDcgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI4LjExLjE4
IGF0IDIyOjU2LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+IGNoYW5nZV9y
YW5nZV90eXBlKCkgaW52YWxpZGF0ZXMgZ2ZuIHJhbmdlcyB0byBsYXppbHkgY2hhbmdlIHRoZSB0
eXBlCj4+IG9mIGEgcmFuZ2Ugb2YgZ2ZucywgYW5kIGFsc28gbW9kaWZpZXMgdGhlIGxvZ2RpcnR5
IHJhbmdlc2V0cyBvZiB0aGF0Cj4+IHAybS4gQXQgdGhlIG1vbWVudCwgaXQgY2xpcHMgYm90aCBk
b3duIGJ5IHRoZSBob3N0cDJtLgo+Pgo+PiBXaGlsZSB0aGlzIHdpbGwgcmVzdWx0IGluIGNvcnJl
Y3QgYmVoYXZpb3IsIGl0J3Mgbm90IGVudGlyZWx5IGVmZmljaWVudCwKPj4gc2luY2UgaW52YWxp
ZGF0ZWQgZW50cmllcyBvdXRzaWRlIHRoYXQgcmFuZ2Ugd2lsbCwgb24gZmF1bHQsIHNpbXBseSBi
ZQo+PiBtb2RpZmllZCBiYWNrIHRvICJlbXB0eSIgYmVmb3JlIGZhdWx0aW5nIG5vcm1hbGx5IGFn
YWluLgo+Pgo+PiBTZXBhcmF0ZSBvdXQgdGhlIGNhbGN1bGF0aW9uIG9mIHRoZSB0d28gcmFuZ2Vz
LiAgS2VlcCB1c2luZyB0aGUKPj4gaG9zdHAybSdzIG1heF9tYXBwZWRfcGZuIHRvIGNsaXAgdGhl
IGxvZ2RpcnR5IHJhbmdlcywgYnV0IHVzZSB0aGUKPj4gY3VycmVudCBwMm0ncyBtYXhfbWFwcGVk
X3BmbiB0byBmdXJ0aGVyIGNsaXAgdGhlIGludmFsaWRhdGlvbiByYW5nZQo+PiBmb3IgYWx0ZXJu
YXRlIHAybXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPgo+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+Pgo+PiAtLS0KPj4gQ0M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBA
ZXUuY2l0cml4LmNvbT4KPj4gQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4g
Q0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+IENDOiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+PiBDQzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KPj4KPj4gLS0tCj4+IENoYW5nZXMgc2luY2UgVjk6Cj4+ICAtIENv
cnJlY3RlZCBmdW5jdGlvbiBuYW1lIGluIHBhdGNoIHN1YmplY3QuCj4gCj4gRnVubnk6IEkgZGlk
bid0IGV2ZW4gbm90aWNlIHRoZSBpc3N1ZSBpbiB0aGUgcGF0Y2ggdGl0bGUuIEkgaGFkCj4gcG9p
bnRlZCBpdCBvdXQgYWdhaW5zdCB0aGUgc3RhcnQgb2YgdGhlIGRlc2NyaXB0aW9uLCB3aGVyZSBp
dAo+IHN0aWxsIGV4aXN0cy4KClJpZ2h0LCBJJ2xsIGNvcnJlY3QgdGhhdCBhcyB3ZWxsLgoKClRo
YW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
