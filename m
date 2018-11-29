From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V10 4/5] p2m: Always use hostp2m when
 clipping rangesets
Date: Thu, 29 Nov 2018 03:04:48 -0700
Message-ID: <5BFFB9C0020000780020119C@prv1-mh.provo.novell.com>
References: <1543442182-3557-1-git-send-email-rcojocaru@bitdefender.com>
 <1543442182-3557-5-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=suqh=oi=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gSJBk-0008Hb-BE
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 10:04:52 +0000
In-Reply-To: <1543442182-3557-5-git-send-email-rcojocaru@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjExLjE4IGF0IDIyOjU2LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gQ2hhbmdlcyBzaW5jZSBWOToKPiAgLSBSZW1vdmVkIHRoZSBwYXRjaCBSRkMgKHJlcGxh
Y2VkIGJ5IGEgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcpLgo+ICAtIFJldXNlZCBzdGFydCBhbmQg
ZW5kIGluIGNoYW5nZV90eXBlX3JhbmdlKCkgYW5kIHJlbW92ZWQgdGhlCj4gICAgaW50ZXJtZWRp
YXJ5IHZhcmlhYmxlcyByYW5nZV9zdGFydCBhbmQgcmFuZ2VfZW5kLgo+ICAtIEFkZGVkIGFuIGV4
dHJhIGV4cGxhbmF0aW9uIGZvciB0aGUgaWYgKCBzdGFydCA+IGVuZCApIHJldHVybjsKPiAgICBj
b2RlIGluIHRoZSBjb21tZW50LgoKVGhpcyBsYXN0IGl0ZW0gaXNuJ3QgcmVhbGx5IHRha2luZyBj
YXJlIG9mIHRoZSBjb21tZW50cyBJIGdhdmUgb24gdjkuClRoZSBfaW5jb21pbmdfIHN0YXJ0IGJl
aW5nIGxhcmdlciB0aGFuIHRoZSBfaW5jb21pbmdfIGVuZCBpcwpzb21ldGhpbmcgd29ydGggdG8g
cG9pbnQgb3V0LiBCdXQgeW91IHB1dCB0aGF0IGNoZWNrIGFmdGVyIGNsaXBwaW5nCmVuZC4gRnVy
dGhlcm1vcmUgaXQgbG9va3MgbGlrZSB5b3UgY29udGludWUgdG8gYnJlYWsgdGhlIGNhc2UKd2hl
cmUgLT5tYXhfbWFwcGVkX3BmbiBpbmNyZWFzZXMgc3Vic2VxdWVudGx5LCBpLmUuIHlvdSBzdGls
bApkb24ndCB1cGRhdGUgdGhlIHJhbmdlc2V0IHdpdGggdGhlIHVubW9kaWZpZWQgaW5jb21pbmcg
dmFsdWVzLgpPciBvdGhlcndpc2UgSSB3b3VsZCBoYXZlIGV4cGVjdGVkIGFuIGV4cGxhbmF0aW9u
IChhcyBhIHJlcGx5CnRvIG15IGNvbW1lbnRzLCBub3QgbmVjZXNzYXJpbHkgYnkgYWRkaW5nIHRv
IGRlc2NyaXB0aW9uIG9yCmNvbW1lbnRzIG9mIHRoZSBwYXRjaCBoZXJlKSB3aHkgZWl0aGVyIHRo
aXMgaXMgbm90IGFuIGlzc3VlIG9yIEknbQptaXNyZWFkaW5nIGFueXRoaW5nLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
