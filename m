From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] mm: option to _always_ scrub freed domheap
 pages
Date: Tue, 7 May 2019 14:24:20 +0100
Message-ID: <ab9db873-9588-e3f6-697c-1f597b615274@citrix.com>
References: <20190506124624.54454-1-elnikety@amazon.com>
 <32d91d7a-a02d-65e3-d166-deb3b64ab592@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T87r=TH=citrix.com=prvs=023fb3b64=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hO05G-00057H-BB
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 13:24:38 +0000
In-Reply-To: <32d91d7a-a02d-65e3-d166-deb3b64ab592@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Eslam Elnikety <elnikety@amazon.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDUvMjAxOSAxMDo1NSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiA1LzYvMTkgMTo0
NiBQTSwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4+IEdpdmUgdGhlIGFkbWluaXN0cmF0b3IgZnVy
dGhlciBjb250cm9sIG9uIHdoZW4gdG8gc2NydWIgZG9taGVhcCBwYWdlcyBieSBhZGRpbmcKPj4g
YW4gb3B0aW9uIHRvIGFsd2F5cyBzY3J1Yi4gVGhpcyBpcyBhIHNhZmV0eSBmZWF0dXJlIHRoYXQs
IHdoZW4gZW5hYmxlZCwKPj4gcHJldmVudHMgYSAoYnVnZ3kpIGRvbWFpbiBmcm9tIGxlYWtpbmcg
c2VjcmV0cyBpZiBpdCBhY2NpZGVudGFsbHkgZnJlZXMgYSBwYWdlCj4+IHdpdGhvdXQgcHJvcGVy
IHNjcnViYmluZy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRXNsYW0gRWxuaWtldHkgPGVsbmlrZXR5
QGFtYXpvbi5jb20+Cj4gTm93IHRoYXQgSSB0aGluayBhYm91dCBpdCAtLSBBbmR5LCBpc24ndCB0
aGVyZSBhIHBhdGNoIGluIHRoZSBYZW5TZXJ2ZXIKPiBwYXRjaHF1ZXVlIHRvIGVuYWJsZSBzY3J1
YmJpbmcgYnkgZGVmYXVsdD8KPgo+IEknbSB3b25kZXJpbmcgaWYgdGhpcyBzaG91bGQgZGVmYXVs
dCB0byAndHJ1ZScsIGFuZCBwZW9wbGUgd2hvIHJlYWxseQo+IHdhbnQgdGhlIGV4dHJhIHBlcmZv
cm1hbmNlIHNob3VsZCB0dXJuIGl0IG9mZi4KCmh0dHBzOi8vZ2l0aHViLmNvbS94ZW5zZXJ2ZXIv
eGVuLnBnL2Jsb2IvWFMtOC4wLngvbWFzdGVyLzAwMDEtY2MtbWVtb3J5LXNjcnViYmluZy5wYXRj
aAoKV2UgY291bGRuJ3QgbWVhc3VyZSBhIHBlcmZvcm1hbmNlIGRpZmZlcmVuY2Ugd2l0aCB1bmNv
bmRpdGlvbmFsCnNjcnViYmluZywgc28gY2hvc2UgdG8gZG8gd2l0aG91dCBhbiBleHRyYSBwYXJh
bWV0ZXIgdG8gdHdlYWsuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
