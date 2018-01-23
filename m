From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC v2 00/12] xen/x86: use per-vcpu stacks
 for 64 bit pv domains
Date: Tue, 23 Jan 2018 10:45:38 +0100
Message-ID: <b364663b-7a2a-c00c-6251-c603f03c551f@suse.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <5A65EC0A02000078001A1118@suse.com>
 <068bc63f-f79c-627c-4f48-ca8cdef166d9@suse.com>
 <5A6601D302000078001A1230@suse.com>
 <1a670986-d36b-3530-3b12-15ac2faa302e@suse.com>
 <5A6607DB02000078001A127B@suse.com>
 <ad9fe5e8-76b1-3a61-4696-f6d3708cd404@suse.com>
 <5A6624A602000078001A1375@suse.com>
 <d4487ca6-ddaa-5053-1df7-37e6b2f6c5e2@suse.com>
 <5A67030F02000078001A164B@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=bxvh=es=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1edv9C-0001bi-Pp
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 09:45:42 +0000
In-Reply-To: <5A67030F02000078001A164B@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDEvMTggMDk6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIzLjAxLjE4IGF0
IDA2OjUwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMjIvMDEvMTggMTc6NTEsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4gQnV0IGlzbid0IHRoYXQgbW9kZWwgaGF2aW5nIHRoZSBzYW1l
IHN5bmNocm9uaXphdGlvbiBpc3N1ZXMgdXBvbgo+Pj4gZ3Vlc3QgTDQgdXBkYXRlcyB3aGljaCBB
bmRyZXcgd2FzIGZpZ2h0aW5nIHdpdGg/Cj4+Cj4+IEkgZG9uJ3QgdGhpbmsgc28sIGFzIHRoZSBu
dW1iZXIgb2Ygc2hhZG93cyB3aWxsIGFsd2F5cyBvbmx5IGJlIG1heC4gMQo+PiB3aXRoIG15IGFw
cHJvYWNoLgo+IAo+IEhvdyBjYW4gSSBrbm93IHRoYXQ/IFRoZSBvdmVydmlldyBtYWlsIGRvZXNu
J3QgdGFsayBhYm91dCB0aGUKPiBpbnRlbmRlZCBzaGFkb3dpbmcgYWxnb3JpdGhtIGFmYWljcywg
YW5kIG5vbmUgb2YgdGhlIHBhdGNoZXMKPiAoanVkZ2luZyBieSB0aGVpciB0aXRsZXMpIGltcGxl
bWVudHMgYW55IHBhcnQgdGhlcmVvZi4gSW4KClJpZ2h0LiBUaGF0J3MgdGhlIHJlYXNvbiBJJ20g
dGVsbGluZyB5b3UgYWJvdXQgaXQuCgo+IHBhcnRpY3VsYXIgSSdkIGJlIGN1cmlvdXMgdG8ga25v
dyB3aGV0aGVyIHdoYXQgeW91IHNheSB3aWxsCj4gaG9sZCBhbHNvIGZvciBndWVzdHMgbm90IG1h
a2luZyB1c2Ugb2YgdGhlIGludGVuZGVkIFBWIEFCSQo+IGV4dGVuc2lvbi4KClRob3NlIGd1ZXN0
cyB3aWxsIHN0aWxsIGJlIHZ1bG5lcmFibGUgdG8gY3Jvc3MtdmNwdSBhY2Nlc3NlcyB0byBYZW4K
c3RhY2tzIHJlZ2FyZGluZyBNZWx0ZG93bi4gTGludXgga2VybmVsIGlzIHZ1bG5lcmFibGUgdGhl
IHNhbWUgd2F5CnJlZ2FyZGluZyBpdHMgb3duIHN0YWNrcywgc28gdGhlcmUgaXMgbm8gbmV3IHZ1
bG5lcmFiaWxpdHkgYWRkZWQKZm9yIExpbnV4IHJ1bm5pbmcgYXMgcHYgZ3Vlc3RzIChJIGhhdmUg
dG8gYWRtaXQgSSBkb24ndCBrbm93IHdoZXRoZXIKdGhlIHNhbWUgYXBwbGllcyB0byBCU0QpLgoK
Ckp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
