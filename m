From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 6/7] xen/x86: use flag byte for decision
 whether xen_cr3 is valid
Date: Fri, 23 Mar 2018 09:47:04 +0000
Message-ID: <5AB4DB2802000078001B5712@gwmail.emea.novell.com>
References: <20180321125129.28539-1-jgross@suse.com>
 <20180321125129.28539-7-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=yzb5=gn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ezJHx-00040M-Vn
 for xen-devel@lists.xenproject.org; Fri, 23 Mar 2018 09:47:10 +0000
In-Reply-To: <20180321125129.28539-7-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAzLjE4IGF0IDEzOjUxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBUb2Rh
eSBjcHVfaW5mby0+eGVuX2NyMyBpcyBlaXRoZXIgMCB0byBpbmRpY2F0ZSAlY3IzIGRvZXNuJ3Qg
bmVlZCB0bwo+IGJlIHN3aXRjaGVkIG9uIGVudHJ5IHRvIFhlbiwgb3IgbmVnYXRpdmUgZm9yIGtl
ZXBpbmcgdGhlIHZhbHVlIHdoaWxlCj4gaW5kaWNhdGluZyBub3QgdG8gcmVzdG9yZSAlY3IzLCBv
ciBwb3NpdGl2ZSBpbiBjYXNlICVjcjMgaXMgdG8gYmUKPiByZXN0b3JlZC4KPiAKPiBTd2l0Y2gg
dG8gdXNlIGEgZmxhZyBieXRlIGluc3RlYWQgb2YgYSBuZWdhdGl2ZSB4ZW5fY3IzIHZhbHVlIGlu
IG9yZGVyCj4gdG8gYWxsb3cgJWNyMyB2YWx1ZXMgd2l0aCB0aGUgaGlnaCBiaXQgc2V0IGluIGNh
c2Ugd2Ugd2FudCB0byBrZWVwIFRMQgo+IGVudHJpZXMgd2hlbiB1c2luZyB0aGUgUENJRCBmZWF0
dXJlLgo+IAo+IFRoaXMgcmVkdWNlcyB0aGUgbnVtYmVyIG9mIGJyYW5jaGVzIGluIGludGVycnVw
dCBoYW5kbGluZyBhbmQgcmVzdWx0cwo+IGluIGJldHRlciBwZXJmb3JtYW5jZSAoZS5nLiBwYXJh
bGxlbCBtYWtlIG9mIHRoZSBYZW4gaHlwZXJ2aXNvciBvbiBteQo+IHN5c3RlbSB3YXMgdXNpbmcg
YWJvdXQgMyUgbGVzcyBzeXN0ZW0gdGltZSkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
