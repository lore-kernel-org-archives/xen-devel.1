From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/mm: Add debug code to detect illegal
 page_lock and put_page_type ordering
Date: Wed, 24 Jan 2018 13:04:05 +0000
Message-ID: <13ff091e-486c-2ed1-325b-31d88d95a148@citrix.com>
References: <20180124124826.28523-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jv/h=et=citrix.com=prvs=555f7260a=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eeKjw-0000kV-4H
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 13:05:20 +0000
In-Reply-To: <20180124124826.28523-1-george.dunlap@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDEvMTggMTI6NDgsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gVGhlIGZpeCBmb3IgWFNB
LTI0MiBkZXBlbmRzIG9uIHRoZSBzYW1lIGNwdSBuZXZlciBjYWxsaW5nCj4gX3B1dF9wYWdlX3R5
cGUoKSB3aGlsZSBob2xkaW5nIGEgcGFnZV9sb2NrKCkgZm9yIHRoYXQgcGFnZS4gIEJ5IGhhdmlu
Zwo+IG5vIGxvY2tpbmcgZGlzY2lwbGluZSBiZXR3ZWVuIHBhZ2VzLCB0aGUgY3VycmVudCBjb2Rl
IGFsc28gYXNzdW1lcwo+IHRoYXQgd2Ugd2lsbCBuZXZlciBsb2NrIHR3byBwYWdlcyBvbiB0aGUg
c2FtZSBjcHUuCj4KPiBBZGQgYSBjaGVjayB0byBkZWJ1ZyBidWlsZHMgdG8gdmVyaWZ5IHRoYXQg
Ym90aCBvZiB0aGVzZSBhcmUgdHJ1ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAg
PGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCklzIHRoZXJlIGFueSByZXF1aXJlbWVudCBvciBl
eHBlY3RhdGlvbiB0aGF0IHdlIG9ubHkgZXZlciBsb2NrIGEgc2luZ2xlCnBhZ2UgYXQgb25jZT8K
CklmIHllcywgdGhlbiB0aGlzIGNoZWNrIG5lZWRzIHRvIGJlIG1vcmUgdGhhbiBqdXN0IGEgZGVi
dWcgY2hlY2suwqAgSWYKbm90LCB0aGVuIHRoZSBjb2RlIGFzIHByZXNlbnRlZCBtYXkgZmFsc2Vs
eSBleHBsb2RlLgoKSW5kZXBlbmRlbnRseSBvZiB0aGlzLCBpdCB3b3VsZCBwcm9iYWJseSBiZSBj
bGVhbmVyIHRvIHNwbGl0IHRoZXNlIG91dAppbnRvIHByZWRpY2F0ZXMgdG8gYXZvaWQgYWxsIHRo
ZSBpZmRlZmFyeS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
