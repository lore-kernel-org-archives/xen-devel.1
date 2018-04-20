From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: correct assertion in
 destroy_perdomain_mapping()
Date: Fri, 20 Apr 2018 09:27:56 -0600
Message-ID: <5ADA06FC02000078001BD15F@prv1-mh.provo.novell.com>
References: <5ADA014A02000078001BD11B@prv1-mh.provo.novell.com>
 <454ed889-4f81-728c-9234-75b3d71812e1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xcz5=hj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f9Xx4-00040Y-5D
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 15:27:54 +0000
In-Reply-To: <454ed889-4f81-728c-9234-75b3d71812e1@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA0LjE4IGF0IDE3OjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjAvMDQvMTggMTY6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBodm1fZG9tYWlu
X2luaXRpYWxpc2UoKSBtYXkgY2FsbCB0aGlzIHdpdGggbnIgYmVpbmcgemVybywgd2hpY2ggdHJp
Z2dlcnMKPj4gdGhlICJkb2VzIG5vdCBjcm9zcyBMMyBib3VuZGFyeSIgY2hlY2suCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBJcyB0aGlz
IHRoZSBjb3JyZWN0IGZpeD8KPiAKPiBJdHMgdW5jbGVhciB3aGF0IHRoZSBjYWxsIHRvIGNyZWF0
ZV9wZXJkb21haW5fbWFwcGluZygpIGlzIGRvaW5nLCBidXQgaXQKPiBpcyB0aGUgc29sZSBjYWxs
ZXIgd2hpY2ggcGFzc2VzIDAuCj4gCj4gSSBwcmVzdW1lIGl0IGlzIHRvIGFsbG9jYXRlIGQtPmFy
Y2gucGVyZG9tYWluX2wzX3BnIGJ1dAo+IGRlc3Ryb3lfcGVyZG9tYWluX21hcHBpbmcoKSBkb2Vz
bid0IGZyZWUgdGhpcyBwYWdlLCBzbyBJJ3ZlIGdvdCBubyBpZGVhCj4gd2hhdCB0aGUgZGVzdHJv
eSBjYWxsIGlzIHRyeWluZyB0byBhY2hpZXZlLgoKQ2FsbGVycyBvZiB0aGlzIHBhaXIgb2YgZnVu
Y3Rpb25zIHNob3VsZCBub3QgYmUgY29uY2VybmVkIGFib3V0IHRoZWlyCmlubmVyIHdvcmtpbmdz
OiBJZiB0aGUgY3JlYXRlIGNhbGwgc3VjY2VlZGVkLCB0aGUgZGVzdHJveSBmdW5jdGlvbiBzaG91
bGQKYmUgY2FsbGVkIGZvciBjbGVhbnVwLCBldmVuIGlmIHRoYXQncyBfY3VycmVudGx5XyBhIG5v
LW9wLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
