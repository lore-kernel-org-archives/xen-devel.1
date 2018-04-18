From: Anshul Makkar <anshulmakkar@gmail.com>
Subject: Re: Fwd: [tip:x86/urgent] x86,
 sched: Allow topologies where NUMA nodes share an LLC
Date: Wed, 18 Apr 2018 09:11:52 +0100
Message-ID: <742496bf-7762-320d-7ab6-c5d47e6f5972@gmail.com>
References: <tip-1340ccfa9a9afefdbab90d7935d4ed19817e37c2@git.kernel.org>
 <121a86b4-3eff-15ac-6542-d81d00780751@suse.com>
 <6cabb912-47c5-9974-0d91-d38e0a39b09a@citrix.com>
 <ba48376a7ea8f7bc6f08dca90d49aa443299c54a.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8/d3=hh=gmail.com=anshulmakkar@srs-us1.protection.inumbo.net>)
 id 1f8iC5-0001Zv-1I
 for xen-devel@lists.xenproject.org; Wed, 18 Apr 2018 08:11:57 +0000
Received: by mail-wr0-x233.google.com with SMTP id q13-v6so2239333wre.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Apr 2018 01:11:55 -0700 (PDT)
In-Reply-To: <ba48376a7ea8f7bc6f08dca90d49aa443299c54a.camel@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiA0LzE3LzE4IDY6MDIgUE0sIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFR1ZSwgMjAx
OC0wNC0xNyBhdCAxNTowOCArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTcvMDQv
MTggMTU6MDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+PiBJcyB0aGlzIHNvbWV0aGluZyB3ZSBz
aG91bGQgYmUgYXdhcmUgb2YgaW4gWGVuLCB0b28/Cj4+IElmIHdlIGhhZCBzb21ldGhpbmcgY2xv
c2UgdG8gYSB3b3JraW5nIHRvcG9sb2d5IHJlcHJlc2VudGF0aW9uLAo+PiBwcm9iYWJseS4KPj4K
PiBUcnVlLCBhcyBmYXIgYXMgbGV0dGluZyB0aGUgZ3Vlc3Qga25vdyBhYm91dCB0aGVzZSBkZXRh
aWxzIChpbgo+IGFwcHJvcHJpYXRlIGNpcmN1bW5zdGFjZXMpIGdvZXMuCj4KPiBBYm91dCB1c2lu
ZyBpdCBfd2l0aGluXyBYZW4sIHdlbGw6Cj4KPiAiSW50ZWwncyBTa3lsYWtlIFNlcnZlciBDUFVz
IGhhdmUgYSBkaWZmZXJlbnQgTExDIHRvcG9sb2d5IHRoYW4KPiBwcmV2aW91cwo+IGdlbmVyYXRp
b25zLiBXaGVuIGluIFN1Yi1OVU1BLUNsdXN0ZXJpbmcgKFNOQykgbW9kZSwgdGhlIHBhY2thZ2Ug
aXMKPiBkaXZpZGVkCj4gaW50byB0d28gInNsaWNlcyIsIGVhY2ggY29udGFpbmluZyBoYWxmIHRo
ZSBjb3JlcywgaGFsZiB0aGUgTExDLCBhbmQKPiBvbmUKPiBtZW1vcnkgY29udHJvbGxlciBhbmQg
ZWFjaCBzbGljZSBpcyBlbnVtZXJhdGVkIHRvIExpbnV4IGFzIGEgTlVNQQo+IG5vZGUuIFRoaXMg
aXMgc2ltaWxhciB0byBob3cgdGhlIGNvcmVzIGFuZCBMTEMgd2VyZSBhcnJhbmdlZCBmb3IgdGhl
Cj4gQ2x1c3Rlci1Pbi1EaWUgKENvRCkgZmVhdHVyZS4iCj4KPiBUaGlzIGxvb2tzIHNpbWlsYXIg
KGJ1dCBub3QgaWRlbnRpY2FsKSB0bywgZS5nLiwgQU1EIEVQWUMuIElmIFhlbiBhbHNvCj4gc2Vl
cyBlYWNoIHNsaWNlIGFzIGEgTlVNQSBub2RlIGFzIHdlbGwsIHdlIGFscmVhZHkgYXJlIGRvaW5n
IHNvbWV0aGluZwo+IChhbHRob3VnaCwgb2YgY291cnNlLCB3ZSBjYW4gYWx3YXlzIGltcHJvdmUp
Lgo+Cj4gSWYgbm90LCBJIHNlZSB3YXlzIG9mIHRha2luZyBhZHZhbnRhZ2Ugb2YgdGhlIGluZm9y
bWF0aW9uIHRoYXQgbm90IGFsbAo+IHRoZSBjb3JlcyBpbiB0aGUgc29ja2V0IGVxdWFsbHkgc2hh
cmUgdGhlIExMQywgZS5nLiwgaW4gQ3JlZGl0MiwgYnkKPiBwcm92aWRpbmcgYSBwZXItTExDIHJ1
bnF1ZXVlIG9wdGlvbiBhbmQvb3IgYnkgdGFraW5nIHRoYXQgaW50byBhY2NvdW50Cj4gaW4gdGhl
ICdtaWdyYXRpb24gcmVzaXN0YW5jZScgbWVjaGFuaXNtcyAodGhlcmUgaXMgYWxyZWFkeSB3b3Jr
IGluIHRoYXQKPiBkaXJlY3Rpb24pLgpZZWFoLCBwZXItTExDIHJ1bnF1ZXVlIG9wdGlvbiBzb3Vu
ZHMgbGlrZSBhIGdvb2Qgb3B0aW9uLiBXZSBjYW4gbG9vawppbnRvIHRoYXQuClllcywgSSBhbSB3
b3JraW5nIG9uIGR5bmFtaWNhbGx5IGRlZmluaW5pbmcgbWlncmF0aW9uIHJlc2lzdGFuY2UgYXMg
YSAKZmFjdG9yIG9mCmNhY2hlIGFuZCBjcHUgdG9wb2xvZ3kgaWUuIGluc3RlYWQgb2YgaGF2aW5n
IGEgY29uc3RhbnQgdmFsdWUgb2YgCm1pZ3JhdGlvbiByZXNpc3RhbmNlCml0IHdpbGwgY29uc2lk
ZXIgdGhlIHBsYWNlbWVudCBvZiBjcHVzLCBjYWNoZSBhbmQgc2hhcmluZyBvZiBjYWNoZSBhbW9u
ZyAKY3B1cy4KPgo+IFJlZ2FyZHMsCj4gRGFyaW8KQW5zaHVsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
