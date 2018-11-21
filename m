From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/p2m: constify
 p2m_mem_access_sanity_check()
Date: Wed, 21 Nov 2018 11:52:57 +0000
Message-ID: <c7558f00-3330-de7b-7e98-26d9b88ea6ea@citrix.com>
References: <1542798100-840-1-git-send-email-rcojocaru@bitdefender.com>
 <f2283654-f99e-6ed0-22f8-8cad9d2041f8@citrix.com>
 <5BF5446F02000078001FE6EA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AZPx=OA=citrix.com=prvs=856900a8f=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gPR4R-0002hw-NO
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 11:53:27 +0000
In-Reply-To: <5BF5446F02000078001FE6EA@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjEvMTggMTE6NDEgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIxLjExLjE4
IGF0IDEyOjAzLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTEvMjEv
MTggMTE6MDEgQU0sIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4+IFNpZ25lZC1vZmYtYnk6IFJh
enZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPj4KPj4gV2h5Pwo+IAo+
IEFyZSB5b3UgYXNraW5nIGluIGdlbmVyYWwgKEkgdGhpbmsgaXQncyBvYnZpb3VzKSwgb3IgbWVy
ZWx5IGJlY2F1c2UKPiB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIGlzIGVtcHR5PwoKSSBkaWRuJ3Qg
c2VlIHRoYXQgeW91IGhhZCBzdWdnZXN0ZWQgaXQgYXMgYSB0cml2aWFsIGltcHJvdmVtZW50LgoK
SSBhZ3JlZSBpdCdzIGEgbWlub3IgaW1wcm92ZW1lbnQsIGJ1dCBub3JtYWxseSBzdWNoIGltcHJv
dmVtZW50cyBkb24ndApjb21lIGluIG91dCBvZiB0aGUgYmx1ZTogdGhleSdyZSBkb25lIGluIG9y
ZGVyIHRvIGFjaGlldmUgc29tZSBnb2FsIChmb3IKZXhhbXBsZSwgdG8gYWxsb3cgdGhpcyBmdW5j
dGlvbiB0byBiZSBjYWxsZWQgZnJvbSBhbm90aGVyIGZ1bmN0aW9uIHRoYXQKb25seSBoYXMgYSBj
b25zdCBwb2ludGVyKS4gIFJlY29yZGluZyB0aGUgbW90aXZhdGlvbiBpcyBpbXBvcnRhbnQ7IEkn
ZAphcmd1ZSB0aGF0IHJlY29yZGluZyB0aGUgbGFjayBvZiBtb3RpdmF0aW9uIGlzIGltcG9ydGFu
dCBhcyB3ZWxsIChzbwp0aGF0IHBlb3BsZSBkb24ndCBnbyBsb29raW5nIGZvciBvbmUgdGhhdCBp
c24ndCB0aGVyZSkuCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
