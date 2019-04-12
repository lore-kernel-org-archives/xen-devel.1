From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86/mem_sharing: reorder when pages are
 unlocked and released
Date: Fri, 12 Apr 2019 15:00:06 +0100
Message-ID: <46b1ad73-79ed-dd52-ca2d-289ee7878355@citrix.com>
References: <20190412042930.2867-1-tamas@tklengyel.com>
 <5CB07CB30200007800226E07@prv1-mh.provo.novell.com>
 <CABfawhnByKWejmUUdCaCEpoE-TmdzwvQ=jVZxkz+mS8YuTRsfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04/T=SO=citrix.com=prvs=998838f76=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hEwjw-0001nv-3n
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 14:01:12 +0000
In-Reply-To: <CABfawhnByKWejmUUdCaCEpoE-TmdzwvQ=jVZxkz+mS8YuTRsfQ@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDQvMjAxOSAxNDo0MSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIEZyaSwgQXBy
IDEyLCAyMDE5IGF0IDU6NTUgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4+Pj4gT24gMTIuMDQuMTkgYXQgMDY6MjksIDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3cm90
ZToKPj4+IFBhdGNoIDA1MDJlMGFkYWUyICJ4ODY6IGNvcnJlY3QgaW5zdGFuY2VzIG9mIFBHQ19h
bGxvY2F0ZWQgY2xlYXJpbmciIGludHJvZHVjZWQKPj4+IGdyYWJiaW5nIGV4dHJhIHJlZmVyZW5j
ZXMgZm9yIHBhZ2VzIHRoYXQgZHJvcCByZWZlcmVuY2VzIHRpZWQgdG8gUEdDX2FsbG9jYXRlZC4K
Pj4+IEhvd2V2ZXIsIHRoZSB3YXkgdGhlc2UgZXh0cmEgcmVmZXJlbmNlcyB3ZXJlIGdyYWJiZWQg
d2VyZSBpbmNvcnJlY3QsIHJlc3VsdGluZwo+Pj4gaW4gYm90aCBzaGFyZV9wYWdlcyBhbmQgdW5z
aGFyZV9wYWdlcyBmYWlsaW5nLgo+PiBJJ20gc29ycnkgZm9yIHRoaXMuCj4gSXQncyBteSBiYWQg
Zm9yIG5vdCBjYXRjaGluZyBpdCBlYXJsaWVyIHdoZW4gSSBhY2tlZCBpdC4gUmVhZGluZyB0aGUK
PiBwYXRjaCBpdCBsb29rZWQgZmluZSBhbmQgbWFkZSBzZW5zZSBidXQgZXZpZGVudGx5IHRoYXQn
cyBubyBzdWJzdGl0dXRlCj4gZm9yIGFjdHVhbGx5IHRlc3RpbmcgaXQuCgpBcyBhbiBhc2lkZSwg
ZG8geW91IGhhdmUgYSBvbmUtcGFyYWdyYXBoIGludHJvZHVjdGlvbiB0byBob3cgeW91IHVzZQpt
ZW1fc2hhcmluZz8KCldpdGggYW55IGx1Y2ssIHdlIGNhbiB0cnkgYW5kIGF2b2lkIGJyZWFraW5n
IGl0IGFzIG9mdGVuIGFzIHdlIHNlZW0gdG8uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
