From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12 RFC] xen/console: Handle NUL
 character in buffer sent via CONSOLEIO_write
Date: Wed, 27 Feb 2019 10:42:43 +0000
Message-ID: <1c19966b-8e62-5c75-36f6-b82f85227943@arm.com>
References: <20190226230351.12882-1-julien.grall@arm.com>
 <5C766592020000780021AA17@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bdnF=RC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gywfp-0005XX-9d
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 10:42:49 +0000
In-Reply-To: <5C766592020000780021AA17@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyLzI3LzE5IDEwOjI1IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNy4w
Mi4xOSBhdCAwMDowMywgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gQWZ0ZXIgdXBn
cmFkaW5nIERlYmlhbiB0byBCdXN0ZXIsIEkgc3RhcnRlZCBub3RpY2luZyBjb25zb2xlIG1hbmds
aW5nCj4+IHdoZW4gdXNpbmcgenNoLiBUaGlzIGlzIGhhcHBlbm5pbmcgYmVjYXVzZSBvdXRwdXQg
c2VudCBieSB6c2ggdG8gdGhlCj4+IGNvbnNvbGUgbWF5IGNvbnRhaW4gTlVMIGNoYXJhY3RlciBp
biB0aGUgbWlkZGxlIG9mIHRoZSBidWZmZXIuCj4+Cj4+IExpbnV4IGlzIHNlbmRpbmcgdGhlIGJ1
ZmZlciBhcyBpdCBpcyB0byBYZW4gY29uc29sZSB2aWEgQ09OU09MRUlPX3dyaXRlLgo+PiBIb3dl
dmVyLCB0aGUgaW1wbGVtZW50YXRpb24gaW4gWGVuIGNvbnNpZGVycyBOVUwgY2hhcmFjdGVyIGlz
IHVzZWQgdG8KPj4gdGVybWluYXRlIHRoZSBidWZmZXIgYW5kIHRoZXJlZm9yZSB3aWxsIGlnbm9y
ZSBhbnl0aGluZyBhZnRlciBpdC4KPj4KPj4gVGhlIGFjdHVhbCBkb2N1bWVudGF0aW9uIG9mIENP
TlNPTEVJT193cml0ZSBpcyBwcmV0dHkgbGltaXRlZC4gRnJvbSB0aGUKPj4gZGVjbGFyYXRpb24s
IHRoZSBoeXBlcmNhbGwgdGFrZXMgYSBidWZmZXIgYW5kIHNpemUuIFNvIHRoaXMgY291bGQgbGVh
ZAo+PiB0byB0aGluayB0aGUgTlVMIGNoYXJhY3RlciBpcyBhbGxvd2VkIGluIHRoZSBtaWRkbGUg
b2YgdGhlIGJ1ZmZlci4KPj4KPj4gVGhpcyBwYXRjaCB1cGRhdGVzIHRoZSBjb25zb2xlIEFQSSB0
byBwYXNzIHRoZSBzaXplIGFsb25nIHRoZSBidWZmZXIKPj4gZG93biBzbyB3ZSBjYW4gcmVtb3Zl
IHRoZSByZWxpYW5jZSBvbiBidWZmZXIgdGVybWluYXRpbmcgYnkgYSBOVUwKPj4gY2hhcmFjdGVy
Lgo+IAo+IFdlIGRvbid0IG5lZWQgdGhlIGJlaGF2aW9yIGZvciBpbnRlcm5hbCBwcm9kdWNlcnMs
IHNvIEkgdGhpbmsgdGhlIGNoYW5nZQo+IHRvdWNoZXMgd2F5IHRvbyBtdWNoIGNvZGUuIEkgdGhp
bmsgYWxsIHlvdSBuZWVkIHRvIGRvIGlzIG1ha2UgdGhlCj4gaHlwZXJjYWxsIGhhbmRsZXIgc2Vu
c2UgbnVsbCBjaGFyYWN0ZXJzLCBhbmQgcGVyaGFwcyBzaW1wbHkgaW52b2tlIGxvd2VyCj4gbGV2
ZWwgaGFuZGxlcnMgbXVsdGlwbGUgdGltZXMuIE9yIHJlcGxhY2UgdGhlbSBieSBzb21ldGhpbmcg
ZWxzZSAoZS5nLiBhCj4gYmxhbmspLgoKSSBoYXZlIHRvIGRpc2FncmVlIGhlcmUuIElmIHRoZSBP
UyBkZWNpZGVzIHRvIHBhc3MgYSBidWZmZXIgY29udGFpbmluZyAKTlVMIGNoYXJhY3RlciwgdGhl
biB3ZSBzaG91bGQgaG9ub3IgaXQgYW5kIHNlbmQgdGhlIE5VTCBjaGFyYWN0ZXIgdG8gdGhlIApz
ZXJpYWwuIE90aGVyd2lzZSB5b3UgbWF5IGhhdmUgYSBkaWZmZXJlbnQgYmVoYXZpb3Igd2hlbiBy
dW5uaW5nIG9uIApiYXJlbWV0YWwgYW5kIG9uIFhlbi4gT25lIGNhc2UgSSBoYXZlIGluIG1pbmQg
aXMgZGVidWdnaW5nIG92ZXIgSFZDIGNvbnNvbGUuCgpTbyB3ZSBuZWVkIHRvIG1vZGlmeSB0aGUg
Y29uc29sZSBBUEkgZm9yIGhhbmRsaW5nIHRoaXMgcHVycG9zZS4gWWVzLCBpdCAKd2lsbCBhbGxv
dyB0aGUgaW50ZXJuYWwgcHJvZHVjZXJzIHRvIHB1dCBOVUwgY2hhcmFjdGVyIGluIGl0LiBCdXQg
dGhhdCdzIApub3QgYSByZWFsIGlzc3VlIGJ5IGl0c2VsZi4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
