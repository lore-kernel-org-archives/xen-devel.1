From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Wed, 24 Jan 2018 15:26:40 +0000
Message-ID: <CAFLBxZYLBLbvEk2LRuT6U1vNSyUoam+vT_AR4CLEtc8oB1Qewg@mail.gmail.com>
References: <20171201141407.21993-1-jgross@suse.com>
 <cfa0d19b-ace7-4d41-7889-ec9ff6eef85a@suse.com>
 <20180118103330.6ampgvc5ovejzyfp@citrix.com>
 <18edbc21-6661-a236-9369-d3f603b2a03a@oracle.com>
 <CAFLBxZYaoUzqH4OGnn56qjX8KzAWWSVJqToWqRLncVC+kLxvZg@mail.gmail.com>
 <20180124105453.xlaech23qkl6ebni@MacBook-Pro-de-Roger.local>
 <ee015869-6b7d-c12a-4f2f-266c8bccb2d8@suse.com>
 <fc33fe29-9e99-56e5-e064-7fefd28f7fe7@oracle.com>
 <CAFLBxZb=a3wC_i49FJ2sk3g73p6WQxyGR_qBR2P3rNu-4-7QgQ@mail.gmail.com>
 <dbf149c4-15f1-9374-0eb5-7317d9c6f76e@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=kyrb=et=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1eeMwn-0006LN-1M
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 15:26:45 +0000
Received: by mail-qt0-x241.google.com with SMTP id x27so11191630qtm.12
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2018 07:26:42 -0800 (PST)
In-Reply-To: <dbf149c4-15f1-9374-0eb5-7317d9c6f76e@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMjQsIDIwMTggYXQgMzoyMCBQTSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPiB3cm90ZToKPiBPbiAyNC8wMS8xOCAxNjowNywgR2VvcmdlIER1bmxhcCB3cm90ZToK
Pj4gT24gV2VkLCBKYW4gMjQsIDIwMTggYXQgMjoxMCBQTSwgQm9yaXMgT3N0cm92c2t5Cj4+IDxi
b3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+PiBPbiAwMS8yNC8yMDE4IDA3OjA2
IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+IE9uIDI0LzAxLzE4IDExOjU0LCBSb2dlciBQ
YXUgTW9ubsOpIHdyb3RlOgo+Pj4+PiBPbiBXZWQsIEphbiAyNCwgMjAxOCBhdCAxMDo0MjozOUFN
ICswMDAwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4+Pj4gT24gV2VkLCBKYW4gMjQsIDIwMTgg
YXQgMjo0MSBBTSwgQm9yaXMgT3N0cm92c2t5Cj4+Pj4+PiA8Ym9yaXMub3N0cm92c2t5QG9yYWNs
ZS5jb20+IHdyb3RlOgo+Pj4+Pj4+IE9uIDAxLzE4LzIwMTggMDU6MzMgQU0sIFdlaSBMaXUgd3Jv
dGU6Cj4+Pj4+Pj4+IE9uIFRodSwgSmFuIDE4LCAyMDE4IGF0IDExOjMxOjMyQU0gKzAxMDAsIEp1
ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+Pj4+PiBXZWksCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gT24g
MDEvMTIvMTcgMTU6MTQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+Pj4+Pj4gSW5zdGVhZCBv
ZiBsb2NhdGluZyB0aGUgUlNEUCB0YWJsZSBiZWxvdyAxTUIgcHV0IGl0IGp1c3QgYmVsb3cgNEdC
Cj4+Pj4+Pj4+Pj4gbGlrZSB0aGUgcmVzdCBvZiB0aGUgQUNQSSB0YWJsZXMgaW4gY2FzZSBvZiBQ
VkggZ3Vlc3RzLiBUaGlzIHdpbGwKPj4+Pj4+Pj4+PiBhdm9pZCBwdW5jaGluZyBtb3JlIGhvbGVz
IHRoYW4gbmVjZXNzYXJ5IGludG8gdGhlIG1lbW9yeSBtYXAuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4+Pj4+
Pj4gQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4+Pj4+Pj4+PiBNaW5k
IGFwcGx5aW5nIHRoaXMgb25lPwo+Pj4+Pj4+PiBEb24ndCB3b3JyeSwgaXQgaXMgaW4gbXkgcXVl
dWUuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFdpbGwgY29tZSB0byB0aGlzIGFuZCBvdGhlciBwYXRjaGVz
IEkgYWNjdW11bGF0ZWQgc29vbi4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gV2VpLgo+Pj4+Pj4+IFRoaXMg
cmVxdWlyZXMga2VybmVsIGNoYW5nZXMsIGRvZXNuJ3QgaXQ/Cj4+Pj4+Pj4KPj4+Pj4+PiBodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTctMTIv
bXNnMDA3MTQuaHRtbAo+Pj4+Pj4+Cj4+Pj4+Pj4gQW5kIHRoaXMgc2VyaWVzIGFwcGFyZW50bHkg
bmV2ZXIgbWFkZSBpdCB0byB0aGUgdHJlZS4KPj4+Pj4+Pgo+Pj4+Pj4+IFBWSCBndWVzdHMgYXJl
IGJyb2tlbiBub3cgb24gc3RhZ2luZy4KPj4+Pj4+IEFuZCB0aGUgTGludXggc2lkZSBvZiBQVkgg
aXMgb2ZmaWNpYWxseSBzdXBwb3J0ZWQgbm93LCByaWdodD8KPj4+Cj4+Pgo+Pj4gQUZBSUsgUFZI
IGlzIHN0aWxsIGNvbnNpZGVyZWQgYSB0ZWNoIHByZXZpZXcgLS0tIExpbnV4IG9yIFhlbi4KPj4K
Pj4gRnJvbSBTVVBQT1JULm1kOgo+Pgo+PiAjIyMgeDg2L1BWSCBndWVzdAo+Pgo+PiAgICAgU3Rh
dHVzOiBTdXBwb3J0ZWQKPj4KPj4gSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCBQVkgg
Z3Vlc3QgaW4gTGludXggd2FzIGNvbXBsZXRlIGFuZAo+PiBzdGFibGUgYXMgb2YgTGludXggNC4x
MS4gIElmIHRoYXQncyBub3QgdHJ1ZSBpdCBzaG91bGQgaGF2ZSBiZWVuCj4+IGJyb3VnaHQgdXAg
ZHVyaW5nIHRoZSA0LjEwIGRldmVsb3BtZW50IGN5Y2xlLCB3aGVyZSB3ZSBkZWNsYXJlZCBQVkgK
Pj4gZG9tVXMgYXMgInN1cHBvcnRlZCIuCj4KPiBTbyB3aGF0IGlzIHRoZSBwcm9ibGVtIGhlcmU/
Cj4KPiAtIGN1cnJlbnQgTGludXggY2FuJ3QgYmUgYm9vdGVkIGFzIFBWSCBndWVzdCB3aXRoIHhl
bi11bnN0YWJsZSBkdWUgdG8KPiAgIGEgYnVnIGluIExpbnV4LCBwYXRjaGVzIGZvciBMaW51eCBh
cmUgYmVpbmcgd29ya2VkIG9uCj4gLSBib290aW5nIExpbnV4IGFzIFBWSCBndWVzdCB3aXRoIHhl
biA0LjEwIGlzIHdvcmtpbmcKCkkgd2FzIHJlc3BvbmRpbmcgdG8gQm9yaXMncyBjbGFpbSB0aGF0
IFBWSCBpcyBjb25zaWRlcmVkIHRlY2ggcHJldmlldy4KSSBjYW4ndCBzYXkgYW55dGhpbmcgb25l
IHdheSBvciB0aGUgb3RoZXIgYWJvdXQgUFZIIGluIExpbnV4LCBidXQgUFZICmluIFhlbiBpcyBk
ZWZpbml0ZWx5IG5vdyBjb25zaWRlcmVkIHN1cHBvcnRlZC4KCk15IHN1YnNlcXVlbnQgcmVzcG9u
c2UgdG8gUm9nZXIgKCJGV0lXIEkgY2FuIGJ1eSB0aGlzIGFyZ3VtZW50Iikgd2FzCm1lYW50IHRv
IGluZGljYXRlIEkgZGlkbid0IGhhdmUgYW55IG1vcmUgb2JqZWN0aW9uIHRvIHRoZSBhcHByb2Fj
aCB5b3UKZ3V5cyB3ZXJlIHBsYW5uaW5nIG9uIHRha2luZy4KCiAtR2VvcmdlCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
