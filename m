From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC v2 02/12] x86: don't use hypervisor
 stack size for dumping guest stacks
Date: Tue, 23 Jan 2018 11:19:30 +0100
Message-ID: <98077f48-e2f4-daa7-ebc0-c61041f48a0e@suse.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <20180122123256.1431-3-jgross@suse.com> <5A670DEF02000078001A16AF@suse.com>
 <8e536a60-76bb-0738-64ec-e3fad7f710f3@suse.com>
 <5A67187C02000078001A1742@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=bxvh=es=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1edvfy-0004qv-Oo
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 10:19:34 +0000
In-Reply-To: <5A67187C02000078001A1742@suse.com>
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
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDEvMTggMTE6MTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIzLjAxLjE4IGF0
IDEwOjU4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMjMvMDEvMTggMTA6MjYsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjIuMDEuMTggYXQgMTM6MzIsIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+IHNob3dfZ3Vlc3Rfc3RhY2soKSBhbmQgY29tcGF0X3Nob3dfZ3Vl
c3Rfc3RhY2soKSBzdG9wIGR1bXBpbmcgdGhlCj4+Pj4gc3RhY2sgb2YgdGhlIGd1ZXN0IHdoZW5l
dmVyIGl0cyB2aXJ0dWFsIGFkZHJlc3MgcmVhY2hlcyB0aGUgc2FtZQo+Pj4+IGFsaWdubWVudCB3
aGljaCBpcyB1c2VkIGZvciB0aGUgaHlwZXJ2aXNvciBzdGFja3MuCj4+Pj4KPj4+PiBSZW1vdmUg
dGhpcyBhcmJpdHJhcnkgbGltaXQgYW5kIHRyeSB0byBkdW1wIGEgZml4ZWQgbnVtYmVyIG9mIGxp
bmVzCj4+Pj4gaW5zdGVhZC4KPj4+Cj4+PiBIbW0sIEkgY2FuIHNlZSB5b3VyIHBvaW50LCBidXQg
YmVmb3JlIGxvb2tpbmcgYXQgdGhlIGNoYW5nZSBpbiBkZXRhaWwKPj4+IEkgdGhpbmsgd2UgbmVl
ZCB0byBhZ3JlZSBvbiB3aGF0IGJlaGF2aW9yIHdlIHdhbnQuIER1bXBpbmcKPj4+IGFyYml0cmFy
eSBkYXRhIGFzIGlmIGl0IHdhcyBhIHBhcnQgb2YgdGhlIHN0YWNrIGlzbid0IHZlcnkgaGVscGZ1
bCwgbGltaXRpbmcKPj4+IHRoZSByaXNrIG9mIHdoaWNoIGlzLCBJIHRoaW5rLCB0aGUgcmVhc29u
IGZvciB0aGUgd2F5IHRoaW5ncyBjdXJyZW50bHkKPj4+IHdvcmsgKGFzc3VtaW5nIHRoYXQgZ3Vl
c3Qga2VybmVscyB3b24ndCBoYXZlIHN0YWNrcyBsYXJnZXIgdGhhbiBYZW4KPj4+IGl0c2VsZiwg
YW5kIHRoYXQgdGhleSB0b28gd291bGQgYWxpZ24gdGhlbSkuIFdoYXQgd291bGQgcGVyaGFwcyBi
ZQo+Pj4gYmV0dGVyIGlzIGZvciB0aGUgZ3Vlc3QgdG8gc3VwcGx5IGluZm9ybWF0aW9uIGFib3V0
IHRoZSByZXN0cmljdGlvbnMgaXQKPj4+IGVuZm9yY2VzIG9uIGl0cyBzdGFja3MsIHdoaWNoIFhl
biBjb3VsZCB0aGVuIHVzZSBoZXJlLiBJbiB0aGUKPj4+IGFic2VuY2Ugb2Ygc3VjaCBoaW50cyB1
c2luZyB0aGUgdmFsdWVzIGN1cnJlbnRseSBiZWluZyB1c2VkIHdvdWxkCj4+PiBwb3NzaWJseSBt
YWtlIHNlbnNlLgo+Pgo+PiBDdXJyZW50bHkgdGhlIHN0YWNrIGR1bXAgd2lsbCBoYXZlIHRoZSBz
YW1lIGZpeGVkIG51bWJlciBvZiBsaW5lcyBhcwo+PiB3aXRoIG15IHBhdGNoLiBJJ20gb25seSBy
ZW1vdmluZyB0aGUgcHJlbWF0dXJlIGVuZCBvZiBkdW1waW5nIHdoZW5ldmVyCj4+IHRoZSBzdGFj
ayBhZGRyZXNzIGNyb3NzZXMgYSAzMmtCIGJvdW5kYXJ5LiBMaW51eCA2NCBiaXQgcHYgZ3Vlc3Rz
IGFyZQo+PiB1c2luZyAxNmtCIHN0YWNrIHNpemUuIFNvIHVzaW5nIHRoaXMgYm91bmRhcnkgd291
bGQgYmUgbW9yZSBuYXR1cmFsLgo+IAo+IElPVyB5b3VyIGNoYW5nZSBjb252ZXJ0cyBhIDUwOjUw
IGNoYW5jZSBvZiBkdW1waW5nIG5vbi1zdGFjawo+IGRhdGEgdG8gMTAwJSAoYWxsIGluIGNhc2Ug
dGhlIHN0YWNrIHBvaW50ZXIgaXNuJ3QgZmFyIGF3YXkgZnJvbSB0aGUKPiBzdGFjayBzdGFydCku
CgpJJ2QgcmF0aGVyIGR1bXAgc29tZSBub24tc3RhY2sgZGF0YSB0aGFuIG9taXR0aW5nIHNvbWUg
c3RhY2sgZGF0YS4KCkkgY2FuJ3Qgc2VlIHNob3dfZ3Vlc3Rfc3RhY2soKSBpcyBsaW1pdGVkIHRv
IGd1ZXN0IGtlcm5lbCBtb2RlLiBVc2VyCnN0YWNrcyBjYW4gYmUgbXVjaCBsYXJnZXIgdGhhbiAz
MmtCLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
