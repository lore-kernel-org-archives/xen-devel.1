From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: correct assertion in
 destroy_perdomain_mapping()
Date: Fri, 20 Apr 2018 09:53:25 -0600
Message-ID: <5ADA0CF502000078001BD1AB@prv1-mh.provo.novell.com>
References: <5ADA014A02000078001BD11B@prv1-mh.provo.novell.com>
 <454ed889-4f81-728c-9234-75b3d71812e1@citrix.com>
 <5ADA06FC02000078001BD15F@prv1-mh.provo.novell.com>
 <755d3609-f9f1-20a1-0ab6-979de2a41d94@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xcz5=hj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f9YLh-0006a5-MJ
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 15:53:21 +0000
In-Reply-To: <755d3609-f9f1-20a1-0ab6-979de2a41d94@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA0LjE4IGF0IDE3OjQyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjAvMDQvMTggMTY6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyMC4w
NC4xOCBhdCAxNzoyMSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24g
MjAvMDQvMTggMTY6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IGh2bV9kb21haW5faW5pdGlh
bGlzZSgpIG1heSBjYWxsIHRoaXMgd2l0aCBuciBiZWluZyB6ZXJvLCB3aGljaCB0cmlnZ2Vycwo+
Pj4+IHRoZSAiZG9lcyBub3QgY3Jvc3MgTDMgYm91bmRhcnkiIGNoZWNrLgo+Pj4+Cj4+Pj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4gSXMgdGhpcyB0
aGUgY29ycmVjdCBmaXg/Cj4+Pgo+Pj4gSXRzIHVuY2xlYXIgd2hhdCB0aGUgY2FsbCB0byBjcmVh
dGVfcGVyZG9tYWluX21hcHBpbmcoKSBpcyBkb2luZywgYnV0IGl0Cj4+PiBpcyB0aGUgc29sZSBj
YWxsZXIgd2hpY2ggcGFzc2VzIDAuCj4+Pgo+Pj4gSSBwcmVzdW1lIGl0IGlzIHRvIGFsbG9jYXRl
IGQtPmFyY2gucGVyZG9tYWluX2wzX3BnIGJ1dAo+Pj4gZGVzdHJveV9wZXJkb21haW5fbWFwcGlu
ZygpIGRvZXNuJ3QgZnJlZSB0aGlzIHBhZ2UsIHNvIEkndmUgZ290IG5vIGlkZWEKPj4+IHdoYXQg
dGhlIGRlc3Ryb3kgY2FsbCBpcyB0cnlpbmcgdG8gYWNoaWV2ZS4KPj4gQ2FsbGVycyBvZiB0aGlz
IHBhaXIgb2YgZnVuY3Rpb25zIHNob3VsZCBub3QgYmUgY29uY2VybmVkIGFib3V0IHRoZWlyCj4+
IGlubmVyIHdvcmtpbmdzOiBJZiB0aGUgY3JlYXRlIGNhbGwgc3VjY2VlZGVkLCB0aGUgZGVzdHJv
eSBmdW5jdGlvbiBzaG91bGQKPj4gYmUgY2FsbGVkIGZvciBjbGVhbnVwLCBldmVuIGlmIHRoYXQn
cyBfY3VycmVudGx5XyBhIG5vLW9wLgo+IAo+IFJpZ2h0LCBidXQgaXRzIHN0aWxsIG5vdCBjbGVh
ciB0aGF0IHBhc3NpbmcgMCAoZXZlbiB0byBjcmVhdGUpIGlzIGEKPiBsZWdpdGltYXRlIHRoaW5n
IHRvIGRvLgoKV2VsbCwgdGhlIGNyZWF0ZSBmdW5jdGlvbiBzcGVjaWZpY2FsbHkgaGFuZGxlcyB0
aGUgbnIgPT0gMCBjYXNlLCBzbyBpdCdzCmludGVuZGVkIHRvIGJlIGNhbGxlZCB0aGF0IHdheSAo
YW5kLCBhcyB5b3UndmUgc2FpZCwgZXhjbHVzaXZlbHkgZm9yCnNldHRpbmcgdXAgZC0+YXJjaC5w
ZXJkb21haW5fbDNfcGcpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
