From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 0/2] MMIO emulation fixes
Date: Wed, 29 Aug 2018 13:26:24 +0200
Message-ID: <961d923f-3514-6c09-ab0a-f49ec4fe6918@suse.com>
References: <fdf19f7d-1b92-a9c0-3602-b1c9807bf610@citrix.com>
 <a735b4359ccc4b278330204d9790c6ac@AMSPEX02CL03.citrite.net>
 <5B6DAF9F02000078001DD040@prv1-mh.provo.novell.com>
 <e2f77af0b2394b8f859a1f2dc1a91797@AMSPEX02CL03.citrite.net>
 <5B6DB69D02000078001DD06A@prv1-mh.provo.novell.com>
 <eaab5a73-2910-7fb6-e1fc-08537e63088c@citrix.com>
 <92ca69e5-98b1-61e4-817a-3868f829471a@citrix.com>
 <5B712A3502000078001DD514@prv1-mh.provo.novell.com>
 <20180829103614.GA31376@aepfle.de>
 <75009cae-1c9b-65d9-8269-497f94469983@citrix.com>
 <20180829110052.GC31376@aepfle.de>
 <314e3982-625d-118b-3c3e-61c852d0ffa3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cgjg=lm=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fuycI-0004bL-Gu
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 11:26:30 +0000
In-Reply-To: <314e3982-625d-118b-3c3e-61c852d0ffa3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Olaf Hering <olaf@aepfle.de>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, george.dunlap@citrix.com, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDgvMTggMTM6MDksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjkvMDgvMTggMTI6
MDAsIE9sYWYgSGVyaW5nIHdyb3RlOgo+PiBPbiBXZWQsIEF1ZyAyOSwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4KPj4+IEFyY2hpdGVjdHVyYWxseSBzcGVha2luZywgaGFuZGluZyAjTUMgYmFjayBp
cyBwcm9iYWJseSB0aGUgY2xvc2VzdCB3ZQo+Pj4gY2FuIGdldCB0byBzZW5zaWJsZSBiZWhhdmlv
dXIsIGJ1dCBpdCBpcyBzdGlsbCBhIGJ1ZyB0aGF0IExpbnV4IGlzCj4+PiB0b3VjaGluZyB0aGUg
YmFsbG9vbmVkIG91dCBwYWdlIGluIHRoZSBmaXJzdCBwbGFjZS4KPj4gV2VsbCwgdGhlIGlzc3Vl
IGlzIHRoYXQgYSByZWFkIGNyb3NzZXMgYSBwYWdlIGJvdW5kYXJ5LiBJZiB0aGF0IHdvdWxkIGJl
Cj4+IGZvcmJpZGRlbiwgbG9hZF91bmFsaWduZWRfemVyb3BhZCgpIHdvdWxkIG5vdCBleGlzdC4g
SXQgY2FuIG5vdCBrbm93Cj4+IHdoYXQgaXMgaW4gdGhlIGZvbGxvd2luZyBwYWdlLiBBbmQgc3Vj
aCBwYWdlIGNyb3NzaW5nIGhhcHBlbnMgYWxzbyBpbgo+PiB0aGUgdW5iYWxsb29uZWQgY2FzZS4g
U2FkbHkgSSBjYW4gbm90IHRyaWdnZXIgdGhlIHJlcG9ydGVkIE5GUyBidWcKPj4gbXlzZWxmLiBC
dXQgaXQgY2FuIGJlIGVuZm9yY2VkIGJ5IGJhbGxvb25pbmcgZW5vdWdoIHBhZ2VzIHNvIHRoYXQg
YW4KPj4gYWxsb2NhdGVkIHJlYWRkaXIgcmVwbHkgZXZlbnR1YWxseSBpcyByaWdodCBpbiBmcm9u
dCBvZiBhIGJhbGxvb25lZAo+PiBwYWdlLgo+IAo+IFRoZSBMaW51eCBidWcgaXMgbm90IHNob290
aW5nIHRoZSBiYWxsb29uZWQgcGFnZSBvdXQgb2YgdGhlIGRpcmVjdG1hcC7CoAo+IExpbnV4IHNo
b3VsZCBiZSB0YWtpbmcgYSBmYXRhbCAjUEYgZm9yIHRoYXQgcmVhZCwgYmVjYXVzZSBpdHMgYSB2
aXJ0dWFsCj4gbWFwcGluZyBmb3IgYSBmcmFtZSB3aGljaCBMaW51eCBoYXMgdm9sdW50YXJpbHkg
ZWxlY3RlZCB0byBtYWtlIGludmFsaWQuCj4gCj4gQXMgWGVuIGNhbid0IHByZXZlbnQgTGludXgg
ZnJvbSBtYWtpbmcvbWFpbnRhaW5pbmcgc3VjaCBhbiBpbnZhbGlkCj4gbWFwcGluZywgdGhyb3dp
bmcgI01DIGJhY2sgaXMgdGhlIG5leHQgYmVzdCB0aGluZywgYmVjYXVzZSB0ZXJtaW5hdGluZwo+
IHRoZSBhY2Nlc3Mgd2l0aCB+MCBpcyBqdXN0IGdvaW5nIHRvIGhpZGUgdGhlIGJ1ZywgYW5kIHJ1
biBhdCBhIGdsYWNpYWwKPiBwYWNlIHdoaWxlIGRvaW5nIHNvLgoKSSB0aGluayB5b3UgYXJlIHJp
Z2h0OiB0aGUga2VybmVsIHNob3VsZCBpbiBubyBjYXNlIGFjY2VzcyBhIHJhbmRvbSBwYWdlCndp
dGhvdXQga25vd2luZyBpdCBpcyBSQU0uCgpIaXR0aW5nIGEgYmFsbG9vbmVkIHBhZ2UgaXMganVz
dCBtdWNoIG1vcmUgcHJvYmFibGUgdGhhbiBoaXR0aW5nIGEgTU1JTwpwYWdlIHRoaXMgd2F5LiBU
aGVyZSBhcmUgX25vXyBndWFyZCBwYWdlcyBhcm91bmQgTU1JTyBhcmVhcywgc28gaXQgY291bGQK
aW4gdGhlb3J5IGhhcHBlbiB0aGF0IGxvYWRfdW5hbGlnbmVkX3plcm9wYWQoKSB3b3VsZCBhY2Nl
c3MgTU1JTyBhcmVhCnRyaWdnZXJpbmcgcmFuZG9tIGJlaGF2aW9yLgoKU28gcmVtb3ZpbmcgYmFs
bG9vbmVkIHBhZ2VzIGZyb20gdGhlIGRpcmVjdG1hcCBqdXN0IGhpZGVzIGFuIHVuZGVybHlpbmcK
cHJvYmxlbS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
