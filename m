From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 03/49] x86emul: support AVX512{F, BW,
 DQ} extract insns
Date: Thu, 20 Dec 2018 00:49:12 -0700
Message-ID: <5C1B49780200007800207E1A@prv1-mh.provo.novell.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C1A52ED0200007800207865@prv1-mh.provo.novell.com>
 <5C1A578102000078002078A4@prv1-mh.provo.novell.com>
 <45cb6075-10e3-4a3a-d322-eef3449a3943@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gZt50-0005Op-AE
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 07:49:14 +0000
In-Reply-To: <45cb6075-10e3-4a3a-d322-eef3449a3943@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjEyLjE4IGF0IDE5OjIwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTkvMTIvMjAxOCAxNDozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC0yODAs
NiArMjg1LDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdGVzdCBhdng1MTJid19hbGxbXQo+PiAg
ICAgIElOU04ocHRlc3RubSwgICAgIGYzLCAwZjM4LCAyNiwgICAgdmwsICAgYncsIHZsKSwKPj4g
IH07Cj4+ICAKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdGVzdCBhdng1MTJid18xMjhbXSA9IHsK
Pj4gKyAgICBJTlNOKHBleHRyYiwgNjYsIDBmM2EsIDE0LCBlbCwgYiwgZWwpLAo+PiArLy8gICAg
ICAgcGV4dHJ3LCA2NiwgICAwZiwgYzUsICAgICB3Cj4gCj4gSSBwcmVzdW1lIHRoaXMgaXNuJ3Qg
dGVzdGVkLCBkdWUgdG8gaXRzIGxhY2sgb2YgYSBtZW1vcnkgb3BlcmFuZD8KCkNvcnJlY3QgLSB3
aXRob3V0IGEgbWVtb3J5IG9wZXJhbmQgdGhlcmUncyBubyBEaXNwOCBlaXRoZXIsCnlldCB2YWxp
ZGF0aW9uIG9mIHRoZSBoYW5kbGluZyBvZiB0aGF0IGlzIHdoYXQgdGhlIGZpbGUgaXMgZm9yLgpO
ZXZlcnRoZWxlc3MgSSB3YW50ZWQgdG8gYWRkIGFsbCBpbnN0cnVjdGlvbnMgdG8gdGhlaXIgdGFi
bGVzLAp0byBoYXZlIGEgd2F5IHRvIHZhbGlkYXRlIGNvbXBsZXRlIGNvdmVyYWdlIGZvciBpbnNu
cyBhdAp0aGUgZW5kIG9mIHRoZSBzZXJpZXMuCgo+IEl0IGRvZXMgYXBwZWFyIHRvIGJlIGEgcGFy
dGljdWxhcmx5IG9kZCBlbmNvZGluZy4KCk5vdCBzdXJlIHdoYXQgeW91IGZpbmQgb2RkIHdpdGgg
aXQuIFdoZW4gaXRzIG9yaWdpbmFsLCBsZWdhY3kKZm9ybSB3YXMgZmlyc3QgaW50cm9kdWNlZCwg
YSBtZW1vcnkgb3BlcmFuZCB3YXMgYXBwYXJlbnRseQpub3QgZGVlbWVkIHVzZWZ1bCwgYW5kIGhl
bmNlIHRoZSAocmVnaXN0ZXIgb25seSkgZW5jb2RpbmcKd2FzIHdpdGggdGhlIHNvdXJjZSBvcGVy
YW5kcyBlbmNvZGVkIGluIHRoZSBwbGFjZSBvZiB3aGVyZQphIG1lbW9yeSBvcGVyYW5kIHdvdWxk
IGJlIGVuY29kZWQuIFRoYXQncyB0aGUgY29tbW9uCihidXQgbm90IGV4Y2x1c2l2ZSkgcHJpbmNp
cGxlIC0gdW5sZXNzIGEgbWVtb3J5IHdyaXRlIGlzCmludGVuZGVkLCBpdCdzIHByZWZlcmFibHkg
dGhlIHNvdXJjZSB0byBhbGxvdyBmb3IgZW5jb2Rpbmcgb2YKYSBtZW1vcnkgb3BlcmFuZC4gTGF0
ZXIsIHdoZW4gdGhleSBleHRlbmRlZCB0aGUgaW5zbiB0bwpoYXZlIGJ5dGUvZHdvcmQvcXdvcmQg
ZXF1aXZhbGVudHMsIHRoZXkgYWxsb3dlZCBmb3IKbWVtb3J5IG9wZXJhbmRzLCB5ZXQgZGVlbWVk
IGl0IG1vcmUgdXNlZnVsIGZvciB0aGVtIHRvCmJlIHRoZSBkZXN0aW5hdGlvbiAoaS5lLiBhbG9u
Z3NpZGUgdGhlIEdQUikuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
