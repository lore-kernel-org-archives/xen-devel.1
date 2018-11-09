From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH V4 2/3] x86/mm: allocate logdirty_ranges for
 altp2ms
Date: Fri, 9 Nov 2018 12:29:43 +0000
Message-ID: <e3c716fd-bdb3-cdb9-aa98-d24db16f6efd@citrix.com>
References: <1541083542-22464-1-git-send-email-rcojocaru@bitdefender.com>
 <1541083542-22464-3-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=to6o=nu=citrix.com=prvs=84443e95c=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gL5v6-0001CN-35
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 12:29:52 +0000
In-Reply-To: <1541083542-22464-3-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMS8xOCAyOjQ1IFBNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4gVGhpcyBwYXRjaCBp
cyBhIHByZS1yZXF1aXNpdGUgZm9yIHRoZSBvbmUgZml4aW5nIFZHQSBsb2dkaXJ0eQo+IGZyZWV6
ZXMgd2hlbiB1c2luZyBhbHRwMm0uIEl0IG9ubHkgY29uY2VybnMgaXRzZWxmIHdpdGggdGhlCj4g
cmFuZ2VzIGFsbG9jYXRpb24gLyBkZWFsbG9jYXRpb24gLyBpbml0aWFsaXphdGlvbiBwYXJ0LiBX
aGlsZQo+IHRvdWNoaW5nIHRoZSBjb2RlLCBJJ3ZlIHN3aXRjaGVkIGdsb2JhbF9sb2dkaXJ0eSBm
cm9tIGJvb2xfdAo+IHRvIGJvb2wuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1
IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgoKQWxnb3JpdGhtIGxvb2tzIGdvb2Q7IG9uZSBp
c3N1ZToKCj4gIC8qIEluaXQgdGhlIGRhdGFzdHJ1Y3R1cmVzIGZvciBsYXRlciB1c2UgYnkgdGhl
IHAybSBjb2RlICovCj4gIHN0YXRpYyBpbnQgcDJtX2luaXRpYWxpc2Uoc3RydWN0IGRvbWFpbiAq
ZCwgc3RydWN0IHAybV9kb21haW4gKnAybSkKPiAgewo+IEBAIC0xMDgsNyArMTMwLDEwIEBAIGZy
ZWVfcDJtOgo+ICBzdGF0aWMgdm9pZCBwMm1fZnJlZV9vbmUoc3RydWN0IHAybV9kb21haW4gKnAy
bSkKPiAgewo+ICAgICAgaWYgKCBoYXBfZW5hYmxlZChwMm0tPmRvbWFpbikgJiYgY3B1X2hhc192
bXggKQo+ICsgICAgewo+ICsgICAgICAgIHAybV9mcmVlX2xvZ2RpcnR5KHAybSk7Cj4gICAgICAg
ICAgZXB0X3AybV91bmluaXQocDJtKTsKPiArICAgIH0KClRoaXMgaXMgd3JvbmcgLS0gdGhlIHJh
bmdlc2V0IGlzIGNyZWF0ZWQgZXZlbiBpZiAhaGFwX2VuYWJsZWQoKSBvcgohY3B1X2hhc192bXgs
IGJ1dCBvbmx5IGRlc3Ryb3llZCBoZXJlIGlmIGJvdGguCgpFdmVyeXRoaW5nIGVsc2UgbG9va3Mg
T0suCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
