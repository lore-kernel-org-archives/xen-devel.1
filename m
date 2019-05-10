From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC V2 45/45] xen/sched: add scheduling
 granularity enum
Date: Fri, 10 May 2019 13:22:26 +0200
Message-ID: <2537b1f3-5047-56b2-5884-581ea71ccf58@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Iy1x=TK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hP3bk-0001TA-Hw
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 11:22:32 +0000
References: =?UTF-8?B?PDIwMTkwNTA2MDY1NjQ0Ljc0MTXvv70x77+9amdyb3NzQHN1c2Uu?=
 =?UTF-8?B?Y29tPiA8MjAxOTA1MDYwNjU2NDQuNzQxNe+/vTQ277+9amdyb3NzQHN1c2UuY29t?=
 =?UTF-8?Q?=3e_=3c5CCFF6F1020000780022C12B=40suse=2ecom=3e_=3cac57c420?=
 =?UTF-8?B?77+9YTcyZe+/vTc1NzDvv71kYjhm77+9MjdlNDY5M2MyNzU1QHN1c2UuY29tPiA8?=
 =?UTF-8?Q?5CD005E7020000780022C1B5=40prv1=ef=bf=bdmh=2eprovo=2enovell=2ecom?=
 =?UTF-8?Q?=3e_=3cf7692c11-ab14-4d7d-4b7a-72e9c58e8f30=40suse=2ecom=3e_=3c5C?=
 =?UTF-8?Q?D53C1C020000780022D706=40suse=2ecom=3e_=3c46968660-ea39-1ee0-2aee?=
 =?UTF-8?Q?-c4a22f135ddb=40suse=2ecom=3e_=3c4426eec2811962e9acd1808579bd3ccd?=
 =?UTF-8?Q?6ba52769=2ecamel=40suse=2ecom=3e?=
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDUvMjAxOSAxMjoyOSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gRnJpLCAyMDE5
LTA1LTEwIGF0IDExOjAwICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAxMC8wNS8y
MDE5IDEwOjUzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDA4LjA1LjE5IGF0IDE2OjM2
LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+Pgo+Pj4+IFdpdGggc2NoZWQtZ3Jhbj1jb3Jl
IG9yIHNjaGVkLWdyYW49c29ja2V0IG9mZmxpbmluZyBhIHNpbmdsZSBjcHUKPj4+PiByZXN1bHRz
Cj4+Pj4gaW4gbW92aW5nIHRoZSBjb21wbGV0ZSBjb3JlIG9yIHNvY2tldCB0byBjcHVwb29sX2Zy
ZWVfY3B1cyBhbmQKPj4+PiB0aGVuCj4+Pj4gb2ZmbGluaW5nIGZyb20gdGhlcmUuIE9ubHkgY29t
cGxldGUgY29yZXMvc29ja2V0cyBjYW4gYmUgbW92ZWQgdG8KPj4+PiBhbnkKPj4+PiBjcHVwb29s
LiBXaGVuIG9ubGluaW5nIGEgY3B1IGl0IGlzIGFkZGVkIHRvIGNwdXBvb2xfZnJlZV9jcHVzIGFu
ZAo+Pj4+IGlmCj4+Pj4gdGhlIGNvcmUvc29ja2V0IGlzIGNvbXBsZXRlbHkgb25saW5lIGl0IHdp
bGwgYXV0b21hdGljYWxseSBiZQo+Pj4+IGFkZGVkIHRvCj4+Pj4gUG9vbC0wIChhcyB0b2RheSBh
bnkgc2luZ2xlIG9ubGluZWQgY3B1KS4KPj4+Cj4+PiBXZWxsLCB0aGlzIGlzIGluIGxpbmUgd2l0
aCB3aGF0IHdhcyBkaXNjdXNzZWQgb24gdGhlIGNhbGwKPj4+IHllc3RlcmRheSwgc28KPj4+IEkg
dGhpbmsgaXQncyBhbiBhY2NlcHRhYmxlIGluaXRpYWwgc3RhdGUgdG8gZW5kIHVwIGluLiBBbGJl
aXQsIGp1c3QKPj4+IGZvcgo+Pj4gY29tcGxldGVuZXNzLCBJJ20gbm90IGNvbnZpbmNlZCB0aGVy
ZSdzIG5vIHVzZSBmb3IgInNtdC0KPj4+IHtkaXMsZW59YWJsZSIKPj4+IGFueW1vcmUgd2l0aCBj
b3JlLWF3YXJlIHNjaGVkdWxpbmcgaW1wbGVtZW50ZWQganVzdCBpbiBYZW4gLSBpdAo+Pj4gbWF5
IHN0aWxsIGJlIGNvbnNpZGVyZWQgdXNlZnVsIGFzIGxvbmcgYXMgd2UgZG9uJ3QgZXhwb3NlIHBy
b3Blcgo+Pj4gdG9wb2xvZ3kgdG8gZ3Vlc3RzLCBmb3IgdGhlbSB0byBiZSBhYmxlIHRvIGRvIHNv
bWV0aGluZyBzaW1pbGFyLgo+Pgo+PiBBcyB0aGUgZXh0cmEgY29tcGxleGl0eSBmb3Igc3VwcG9y
dGluZyB0aGF0IGlzIHNpZ25pZmljYW50IEknZCBsaWtlCj4+IHRvCj4+IGF0IGxlYXN0IHBvc3Rw
b25lIGl0LiBBbmQgd2l0aCB0aGUgKGxhdGVyKSBpbnRyb2R1Y3Rpb24gb2YgcGVyLQo+PiBjcHVw
b29sCj4+IHNtdCBvbi9vZmYgSSBndWVzcyB0aGlzIHdvdWxkIGJlIGV2ZW4gbGVzcyBpbXBvcnRh
bnQuCj4+Cj4gSSBhZ3JlZS4KPiAKPiBJc24ndCBpdCB0aGUgY2FzZSB0aGF0IChidXQgbm90ZSB0
aGF0IEknbSBqdXN0IHRoaW5raW5nIG91dCBsb3VkIGhlcmUpLAo+IGlmIHdlIG1ha2Ugc210PSBh
bmQgc2NoZWQtZ3Jhbj0gcGVyLWNwdXBvb2wsIHRoZSB1c2VyIGdhaW5zIHRoZSBjaGFuY2UKPiB0
byB1c2UgYm90aCwgaWYgaGUvc2hlIHdhbnRzIChlLmcuLCBmb3IgdGVzdGluZyk/CgpZZXMuCgo+
IElmIHllcywgaXMgc3VjaCBhIHRoaW5nIHZhbHVhYmxlIGVub3VnaCB0aGF0IGl0J2QgaXQgbWFr
ZSBzZW5zZSB0byB3b3JrCj4gb24gdGhhdCwgYXMgYSBmaXJzdCB0aGluZywgSSBtZWFuPwoKTXkg
cGxhbm5lZCByb2FkbWFwIGlzOgoKMS4gdGhpcyBzZXJpZXMKMi4gc2NoZWR1bGVyIGNsZWFuLXVw
CjMuIHBlci1jcHVwb29sIHNtdCBhbmQgZ3JhbnVsYXJpdHkKCj4gV2UnZCBzdGlsbCBmb3JiaWQg
bW92aW5nIHRoaW5ncyBmcm9tIHBvb2xzIHdpdGggZGlmZmVyZW50Cj4gY29uZmlndXJhdGlvbiwg
YXQgbGVhc3QgYXQgdGhlIGJlZ2lubmluZywgb2YgY291cnNlLgoKUmlnaHQsIGFsbG93aW5nIHRo
YXQgd291bGQgYmUgNC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
