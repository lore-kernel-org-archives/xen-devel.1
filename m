From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v11 07/12] vpci: add header handlers
Date: Tue, 20 Mar 2018 10:19:10 -0600
Message-ID: <5AB1428E02000078001B411C@prv-mh.provo.novell.com>
References: <20180320151543.84348-1-roger.pau@citrix.com>
 <20180320151543.84348-8-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3grj=gk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eyJyl-0007po-5C
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 16:19:15 +0000
In-Reply-To: <20180320151543.84348-8-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAzLjE4IGF0IDE2OjE1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEludHJvZHVjZSBhIHNldCBvZiBoYW5kbGVycyB0aGF0IHRyYXAgYWNjZXNzZXMgdG8gdGhlIFBD
SSBCQVJzIGFuZCB0aGUKPiBjb21tYW5kIHJlZ2lzdGVyLCBpbiBvcmRlciB0byBzbm9vcCBCQVIg
c2l6aW5nIGFuZCBCQVIgcmVsb2NhdGlvbi4KPiAKPiBUaGUgY29tbWFuZCBoYW5kbGVyIGlzIHVz
ZWQgdG8gZGV0ZWN0IGNoYW5nZXMgdG8gYml0IDIgKHJlc3BvbnNlIHRvCj4gbWVtb3J5IHNwYWNl
IGFjY2Vzc2VzKSwgYW5kIG1hcHMvdW5tYXBzIHRoZSBCQVJzIG9mIHRoZSBkZXZpY2UgaW50bwo+
IHRoZSBndWVzdCBwMm0uIEEgcmFuZ2VzZXQgaXMgdXNlZCBpbiBvcmRlciB0byBmaWd1cmUgb3V0
IHdoaWNoIG1lbW9yeQo+IHRvIG1hcC91bm1hcC4gVGhpcyBtYWtlcyBpdCBlYXNpZXIgdG8ga2Vl
cCB0cmFjayBvZiB0aGUgcG9zc2libGUKPiBvdmVybGFwcyB3aXRoIG90aGVyIEJBUnMsIGFuZCB3
aWxsIGFsc28gc2ltcGxpZnkgTVNJLVggc3VwcG9ydCwgd2hlcmUKPiBjZXJ0YWluIHJlZ2lvbnMg
b2YgYSBCQVIgbWlnaHQgYmUgdXNlZCBmb3IgdGhlIE1TSS1YIHRhYmxlIG9yIFBCQS4KPiAKPiBU
aGUgQkFSIHJlZ2lzdGVyIGhhbmRsZXJzIGFyZSB1c2VkIHRvIGRldGVjdCBhdHRlbXB0cyBieSB0
aGUgZ3Vlc3QgdG8KPiBzaXplIG9yIHJlbG9jYXRlIHRoZSBCQVJzLgo+IAo+IE5vdGUgdGhhdCB0
aGUgbG9uZyBydW5uaW5nIEJBUiBtYXBwaW5nIGFuZCB1bm1hcHBpbmcgb3BlcmF0aW9ucyBhcmUK
PiBkZWZlcnJlZCB0byBiZSBwZXJmb3JtZWQgYnkgaHZtX2lvX3BlbmRpbmcsIHNvIHRoYXQgdGhl
eSBjYW4gYmUgc2FmZWx5Cj4gcHJlZW1wdGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
