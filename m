From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 2/4] x86: relax a few get_gfn() invocations
Date: Fri, 5 Apr 2019 11:30:05 +0100
Message-ID: <33c97290-3527-f07a-59ed-8f7cc174a50a@citrix.com>
References: <5C88F524020000780021E12C@prv1-mh.provo.novell.com>
 <5C88F9C7020000780021E17A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zWJI=SH=citrix.com=prvs=991202d17=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hCM6u-0004uj-RT
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 10:30:12 +0000
In-Reply-To: <5C88F9C7020000780021E17A@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8xMy8xOSAxMjozOCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW4gYSBmZXcgY2FzZXMg
b25seSBhIHF1ZXJ5IGlzIGludGVuZGVkLCBpLmUuIHdpdGhvdXQgcG9wdWxhdGluZyBhCj4gcG9z
c2libGUgUG9EIG9yIHBhZ2VkIG91dCBlbnRyeSwgd2hlbiB0aGUgaW50ZW50aW9uIGlzIHRvIHJl
cGxhY2UgdGhlCj4gY3VycmVudCBlbnRyeSBhbnl3YXkuIFVzZSBnZXRfZ2ZuX3F1ZXJ5KCkgdGhl
cmUgaW5zdGVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpUaGUgZmlyc3Qgb25lIHNob3VsZCBiZSBmaW5lLCBidXQgcHJldHR5IHN1cmUgdGhl
IHNlY29uZCB0d28gd2lsbAptaXMtZmlyZSBmb3IgUG9EOiBwMm0tPnBvZC5lbnRyeV9jb3VudCB3
b24ndCBnZXQgdXBkYXRlZC4gIEFzIGl0IGlzLAppdCdzIHNvcnQtb2YgbWlzZmlyaW5nIGFscmVh
ZHksIHNpbmNlIHRoZSAiZnJlZWQiIG1lbW9yeSB3b24ndCBiZQpyZWNsYWltZWQgZm9yIHRoZSBQ
b0QgY2FjaGUuCgpXaGljaCBwcm9iYWJseSBtZWFucyBpdCdzIHRpbWUgZm9yIHNvbWUgc2VyaW91
cyByZWZhY3RvcmluZyB0byBwcmV2ZW50CnRoaXMgc29ydCBvZiBlcnJvciBmcm9tIGNyZWVwaW5n
IGluLiAgcDJtLT5wb2QuZW50cnlfY291bnQgYWNjb3VudGluZwpzaG91bGQgcHJvYmFibHkgYmUg
bW92ZWQgaW50byBwMm1fZW50cnlfbW9kaWZ5KCksIGFuZApwMm1fcG9kX2RlY3JlYXNlX3Jlc2Vy
dmF0aW9uKCkgc2hvdWxkIHByb2JhYmx5IGJlIG1vdmVkIHNvbWV3aGVyZSBlbHNlCi0tIHBlcmhh
cHMgZ3Vlc3RfcmVtb3ZlX3BhZ2UoKSBvciBzb21ldGhpbmc/ICBBdCBhbnkgcmF0ZSwgYSB3ZSBw
cm9iYWJseQpuZWVkIHRvIHJldmlldyBvZiB0aGUgbGF5ZXJzIGFuZCB3aGF0IGV2ZXJ5b25lIG5l
ZWRzIGZyb20gdGhlbSwgYW5kIGRvCnRoaW5ncyBhdCB0aGUgcmlnaHQgbGV2ZWwuCgogLUdlb3Jn
ZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
