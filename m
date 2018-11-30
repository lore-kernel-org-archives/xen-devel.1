From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 2/6] microcode: save all microcodes which
 pass sanity check
Date: Fri, 30 Nov 2018 02:32:34 -0700
Message-ID: <5C0103B202000078002017EC@prv1-mh.provo.novell.com>
References: <1543383256-12371-1-git-send-email-chao.gao@intel.com>
 <1543383256-12371-3-git-send-email-chao.gao@intel.com>
 <20181128120014.r6llmchpcjtjlwc6@mac> <20181129024032.GB23701@gao-cwp>
 <20181129092210.fn3ogj5kdsgqlumk@mac> <20181130075507.GA32365@gao-cwp>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gSfA6-0004Hs-0M
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 09:32:38 +0000
In-Reply-To: <20181130075507.GA32365@gao-cwp>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Chao Gao <chao.gao@intel.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjExLjE4IGF0IDA4OjU1LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBP
biBUaHUsIE5vdiAyOSwgMjAxOCBhdCAxMDoyMjoxMEFNICswMTAwLCBSb2dlciBQYXUgTW9ubsOp
IHdyb3RlOgo+Pk9uIFRodSwgTm92IDI5LCAyMDE4IGF0IDEwOjQwOjMyQU0gKzA4MDAsIENoYW8g
R2FvIHdyb3RlOgo+Pj4gT24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMDE6MDA6MTRQTSArMDEwMCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+ID5PbiBXZWQsIE5vdiAyOCwgMjAxOCBhdCAwMToz
NDoxMlBNICswODAwLCBDaGFvIEdhbyB3cm90ZToKPj4+ID4+IC4uLiBhbmQgc2VhcmNoIGNhY2hl
cyB0byBmaW5kIGEgc3VpdGFibGUgb25lIHdoZW4gbG9hZGluZy4KPj4+ID4KPj4+ID5XaHkgZG8g
eW91IG5lZWQgdG8gc2F2ZSBhbGwgb2YgdGhlbT8gWW91IGFyZSBvbmx5IGdvaW5nIHRvIGxvYWQg
YQo+Pj4gPnNpbmdsZSBtaWNyb2NvZGUsIHNvIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgbmVlZCB0
byBjYWNoZSB0aGVtIGFsbC4KPj4KPj5JIHRoaW5rIHRoZSBhYm92ZSBxdWVzdGlvbiBuZWVkcyBh
biBhbnN3ZXIuCj4gCj4gT3V0IG9mIGNvbnNpZGVyYXRvbiBmb3IgYSBtaXhlZC1mYW1pbHkgc3lz
dGVtLiBBbnl3YXksIFNpbmNlIEphbiBjb21tZW50ZWQKPiB0aGF0IHdlIGdhdmUgdXAgc3VwcG9y
dCBvZiBhIG1peGVkLWZhbWlseSBzeXN0ZW0sIHdlIG9ubHkgbmVlZCB0byBzYXZlCj4gYSBzaW5n
bGUgbWljcm9jb2RlIGZvciBvZmZsaW5lZCBvciBob3QtcGx1Z2dlZCBjcHVzLgoKV2VsbCwgdGhl
cmUgbWlnaHQgYmUgc2xpZ2h0bHkgbW9yZSBuZWVkZWQgdGhhbiBqdXN0IGEgc2luZ2xlIGluc3Rh
bmNlLgpUaGlzIGRlcGVuZHMgb24gd2hldGhlciBzYW1lIGZhbWlseS9tb2RlbCBDUFVzIHdpdGgg
ZGlmZmVyZW50CnN0ZXBwaW5nIGFuZC9vciBkaWZmZXJlbnQgInBmIiB2YWx1ZSBjYW4gYmUgbWl4
ZWQgKGFuZCB3b3VsZCBoYXZlCmlkZW50aWNhbCBmZWF0dXJlIGZsYWdzIGluIHRoZWlyIENQVUlE
IG91dHB1dCkuCgpJIG1heSBoYXZlIG92ZXJzaW1wbGlmaWVkIHRoZSBjdXJyZW50IHN0YXRlIG9m
IHRoaW5nczogSG90cGx1Z2dpbmcKYSBDUFUgd2l0aCBtb3JlIGNhcGFiaWxpdGllcyB0aGFuIHRo
ZSBib290IENQVSBpcyBnZW5lcmFsbHkgZmluZQphZmFpY3QuIEJvdGggeW91IChJbnRlbCkgYW5k
IEFNRCBwbGFjZSByZXN0cmljdGlvbnMgb24gcGVybWl0dGVkCm1peGVzIGlpcmMsIHNvIEkgZG9u
J3QgdGhpbmsgd2UgbmVlZCB0byBzdXBwb3J0IGFueXRoaW5nIGJleW9uZApzdWNoIHJlc3RyaWN0
aW9ucy4gQmVpbmcgYWJsZSB0byBydW4gb24gcGVybWl0dGVkIG1peGVzIHdoaWNoIGFyZQpub3Qg
aW4gY29uZmxpY3Qgd2l0aCBvdXIgZ2VuZXJhbCBhc3N1bXB0aW9uIG9mIHRoZXJlIG5vdCBiZWlu
ZyBhbnkKQ1BVIGluIHRoZSBzeXN0ZW0gd2l0aCBsZXNzIGNhcGFiaWxpdGllcyB0aGFuIHRoZSBi
b290IENQVSB3b3VsZApzZWVtIGRlc2lyYWJsZS4KCkFuZHJldywgZG8geW91IGhhdmUgYW55IHZp
ZXcgb3Igb3BpbmlvbiBoZXJlPwoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
