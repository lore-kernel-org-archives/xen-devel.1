From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] build: sync Kconfig with Linux v4.17
Date: Thu, 21 Jun 2018 02:13:26 -0600
Message-ID: <5B2B5E2602000078001CC9AA@prv1-mh.provo.novell.com>
References: <20180621021052.27070-1-dougtrav@icloud.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9rcu=jh=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fVuii-000053-S0
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 08:13:32 +0000
In-Reply-To: <20180621021052.27070-1-dougtrav@icloud.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: dougtrav@icloud.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA2LjE4IGF0IDA0OjEwLCA8ZG91Z3RyYXZAaWNsb3VkLmNvbT4gd3JvdGU6Cj4g
RnJvbTogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPgo+IAo+IEZyb206IERvdWcg
R29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KPiAKPiBJbXBvcnQgdGhlIGZvbGxvd2luZyBm
aWxlcyBhbmQgZGlyZWN0b3JpZXMgZnJvbSB0aGUgTGludXggdjQuMTcgdGFnCj4gKGNvbW1pdCBp
ZCAyOWRjZWE4ODc3OWM4NTZjN2RjOTIwNDBhMGMwMTIzMzI2MzEwMWQ0KToKPiAtIHNjcmlwdHMv
a2NvbmZpZy8gLT4geGVuL3Rvb2xzL2tjb25maWcvCj4gLSBzY3JpcHRzL01ha2VmaWxlLmhvc3Qg
LT4geGVuL3Rvb2xzL2tjb25maWcvTWFrZWZpbGUuaG9zdAo+IC0gRG9jdW1lbnRhdGlvbi9rYnVp
bGQva2NvbmZpZ3ssLWxhbmd1YWdlfS50eHQgLT4KPiAgIGRvY3MvbWlzYy9rY29uZmlney1sYW5n
dWFnZX0udHh0Cj4gLSBpbmNsdWRlL2xpbnV4L2tjb25maWcuaCAtPiB4ZW4vaW5jbHVkZS94ZW4v
a2NvbmZpZy5oCj4gCj4gUHVsbGVkIGluIHBhcnRzIG9mIHNjcmlwdHMvTWFrZWZpbGUubGliIGlu
dG8KPiB4ZW4vdG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29uZmlnCj4gCj4gU2lkZSBlZmZlY3Qg
b2YgdGhpcyBjaGFuZ2UgaXMgdGhhdCBmbGV4IGFuZCBiaXNvbiBhcmUgcmVxdWlyZWQgdG8gYnVp
bGQKPiBLY29uZmlnLiBMaW51eCBoYXMgc3dpdGNoZWQgZnJvbSBzaGlwcGluZyB0aGUgcHJlLWdl
bmVyYXRlZCBmaWxlcyB0bwo+IGFsd2F5cyBnZW5lcmF0aW5nIHRoZW0gd2l0aCBmbGV4IGFuZCBi
aXNvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5j
b20+CgpXaGF0IEknbSBtaXNzaW5nIChhbmQgd2hhdCBJIHRoaW5rIGlzIGEgcmVxdWlyZW1lbnQg
Zm9yIHRoaXMgdG8gZ28gaW4pIGlzCnRoZSAid2h5IiBwYXJ0OiBXaGF0IGRvIHdlIGdhaW4gZnJv
bSBkb2luZyB0aGUgdXBkYXRlPyBCZXNpZGVzIHRoYXQKSSB0aGluayB0aGF0IGluIGdlbmVyYWwg
aXQgd291bGQgYmUgYmV0dGVyIHRvIHB1bGwgaW4gTGludXggY29tbWl0cyBvbmUKYnkgb25lLCBy
YXRoZXIgdGhhbiBjb21iaW5pbmcgZXZlcnl0aGluZyBpbnRvIGEgZ2lhbnQgcGF0Y2guIFRoYXQK
bWlnaHQgZXZlbiBhbHJlYWR5IGFkZHJlc3MgcGFydCBvZiBteSBxdWVzdGlvbiwgYXMgaXQgY291
bGQgaGlnaGxpZ2h0CmJ1ZyBmaXhlcyBhbmQvb3IgZW5oYW5jZW1lbnRzIHdoaWNoIGFyZSBvZiBp
bnRlcmVzdCB0byB1cy4KCj4gU28gdGhpcyBtYWtlcyBmbGV4ICYgYmlzb24gcmVxdWlyZWQgdG8g
YnVpbGQgS2NvbmZpZyB3aGljaCBtZWFucyB0bwo+IGJ1aWxkIHRoZSBoeXBlcnZpc29yIG5vdyB0
aGVzZSBhcmUgcmVxdWlyZWQuIFRoZXNlIGFyZSBhbHJlYWR5Cj4gZG9jdW1lbnRlZCBpbiB0aGUg
UkVBRE1FIGFzIHJlcXVpcmVkIGJ1dCB0aGF0IHdhcyBwcmV2aW91c2x5IGp1c3QgZm9yCj4gdGhl
IHRvb2xzdGFjay4gU2luY2UgdGhlc2UgYXJlIEdOVSB1dGlsaXRpZXMgSSB3b3VsZCBhc2sgdGhh
dCBub24tTGludXgKPiBmb2xrcyAoZS5nLiBSb2dlcikKCldlbGwsIEknbSBjdXJpb3VzIHRvIHNl
ZSBob3cgd2VsbCB0aGlzIGZhcmVzIG9uIG9sZCBkaXN0cm9zLCBidXQgc28gZmFyIEkKaGFkIG5v
IGlzc3VlcyBidWlsZGluZyBMaW51eCA0LjE3LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
