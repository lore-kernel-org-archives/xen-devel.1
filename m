From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 17/25] x86emul: emulate {MONITOR, MWAIT}{,
	X} as no-op
Date: Fri, 2 Feb 2018 14:05:05 +0000
Message-ID: <5ed4dc02-9ea5-1d5b-28c1-2f2deac131ad@citrix.com>
References: <5A29550C020000780019585B@prv-mh.provo.novell.com>
 <5A295A31020000780019594D@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=g0dj=e4=citrix.com=prvs=564f8cbd0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ehbyz-0006wg-AO
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2018 14:06:25 +0000
In-Reply-To: <5A295A31020000780019594D@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMTcgMTQ6MTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEFzIG1lbnRpb25lZCBpbiBM
aW51eCBjb21taXQgODdjMDA1NzJiYSAoImt2bTogeDg2OiBlbXVsYXRlIG1vbml0b3IgYW5kCj4g
bXdhaXQgaW5zdHJ1Y3Rpb25zIGFzIG5vcCIpLCBvbGRlciBPUyBYIHZlcnNpb25zIChmb3IgZXhh
bXBsZSkgbWF5IG1ha2UKPiB1c2Ugb2YgdGhlIGluc25zIHdpdGhvdXQgY2hlY2tpbmcgQ1BVSUQg
ZmxhZ3MgKHByZXN1bWFibHkgaW1wbHlpbmcKPiBhdmFpbGFiaWxpdHkgZnJvbSBmYW1pbHkvbW9k
ZWwpLgoKLTEgdG8gdGhpcy4KCklJUkMsIG1vbml0b3IgYW5kIG13YWl0IGFyZSBkaXNhYmxlZCBl
bnRpcmVseSBkdWUgdG8gVk1DUy9WTUNCCmNvbmZpZ3VyYXRpb24sIGFuZCBjb252ZXJ0IHRvICNV
RCBpbnRlcm5hbGx5LsKgIFRoZSBlbXVsYXRvciBzaG91bGRuJ3QgYmUKYWJsZSB0byBsZXQgc29m
dHdhcmUgd29yayBhcm91bmQgdGhhdC4KCklmIGFuZCB3aGVuIHdlIGRlY2lkZSB0byBzdXBwb3J0
IHRoaXMgZnVuY3Rpb25hbGl0eSBmb3IgZ3Vlc3RzICh3aGljaApwcm9iYWJseSB3b24ndCBiZSB1
bnRpbCBhZnRlciBFUFQgU1BQIGdldHMgaW4pLCB0aGVuIHRoZSBmZWF0dXJlIHNob3VsZAp1c2Ug
Q1BVSUQgYXMgcGVyIG5vcm1hbC4KClRoZXJlIGlzIGEgbGFyZ2UgbGlzdCBvZiBvdGhlciB0aGlu
Z3Mgd2hpY2ggcHJldmVudCBPUyBYIGZyb20gYm9vdGluZwp1bmRlciBYZW4uwqAgSWYgc29tZW9u
ZSBkZWNpZGVzIHRvIHN0ZXAgdXAgYW5kIGdldCBPUyBYIHN1cHBvcnQgd29ya2luZwp0aGVuIHdl
IGNvdWxkIHJlY29uc2lkZXIgd2hldGhlciB3ZSBxdWlyayB0aGlzLCBidXQgdW50aWwgdGhlbiwK
dW5pbGF0ZXJhbGx5IHF1aXJraW5nIGl0IGlzIGEgbmV0IG5lZ2F0aXZlLgoKfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
