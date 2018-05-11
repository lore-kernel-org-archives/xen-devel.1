From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 10/10] xen/arm: Enable errata for
 secondary CPU on hotplug after the boot
Date: Fri, 11 May 2018 14:47:36 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805111446430.10749@sstabellini-ThinkPad-X260>
References: <20180427171258.28852-1-mirela.simonovic@aggios.com>
 <CAKPH-NiTLoOdYgpcWiM1qXHXaC=znAvMp0HHGQo-9mfegz2LcA@mail.gmail.com>
 <c713cc00-ace2-f528-563f-175657dccb12@arm.com>
 <CAKPH-NhUyxO1vOJnJPFayw71F5SfY87vWchoQybcH1e6Z4Mg2A@mail.gmail.com>
 <CAKPH-NhZhcvAdnZ_PyCUe3oSEokZnoBi8aPwfYbpPHioGgU9KA@mail.gmail.com>
 <4dec77ef3b2a940453e1bc112e6dae21cb99af18.camel@suse.com>
 <CAKPH-NicJOBS7mLYSvo-Z62yxNuFbMZfZR7BdfUfJvEcoGoZOA@mail.gmail.com>
 <300e3466-8214-764a-6c33-ce8aaea31ed9@arm.com>
 <CAKPH-NgvzykBMx1jouMV-fBbLN8=oHmb3zFhy+pPQTwcQdf2Vg@mail.gmail.com>
 <6c0ba4fadcdb650e3a8651f13781da9caaae251e.camel@suse.com>
 <CAKPH-NiZtBwioY1hfzx2PSgzKB6eQxjw0hXUzLg94+u+OVpL+Q@mail.gmail.com>
 <51febc3c-c55a-6512-1d32-0d2bb0a64df7@arm.com>
 <CAKPH-NjhQA+aUsD97M3WFNHWR+QeEMP1e86HNCGQNQv=YpK6DA@mail.gmail.com>
 <CAKPH-NgZ37E6J6fc17tV+XAfDeFO4bPpFTDkY01J4tzX1qH6nA@mail.gmail.com>
 <26274a25-7135-9f0a-4d22-5d6b49e35653@arm.com>
 <7b0b49ef8b71d691904daafe4353737b8f0d0510.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <7b0b49ef8b71d691904daafe4353737b8f0d0510.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Davorin Mista <dm@aggios.com>, Xen Devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAxMSBNYXkgMjAxOCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gRnJpLCAyMDE4
LTA1LTExIGF0IDE0OjA4ICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiBUaGUgd2hvbGUg
aWRlYSBoZXJlIGlzIHdlIGhhdmUgb25seSBvbmUgcGxhY2UgdGFraW5nIHRoZSBkZWNpc2lvbiBh
bmQKPiA+IHdlIAo+ID4gZG9uJ3Qgc3ByZWFkIEJVR19PTigpL3BhbmljL3N0b3BfY3B1IGV2ZXJ5
d2hlcmUuIFRoZSBiZW5lZml0IGlzCj4gPiBoYXZpbmcgCj4gPiBvbmx5IG9uZSBwbGFjZSB0byBm
aXggb3ZlciBtdWx0aXBsZSBvbmUgYmVjYXVzZSB2ZXJ5IGxpa2VseSB0aGUKPiA+IGRlY2lzaW9u
IAo+ID4gaXMgdGhlIHNhbWUgZXZlcnl3aGVyZS4KPiA+IAo+ID4gSSBhZ3JlZSB0aGF0IHRvZGF5
IGl0IHdpbGwgZW5kIHVwIHRvIGNyYXNoaW5nIHRoZSBzeXN0ZW0gYmVjYXVzZSBvZgo+ID4gdGhl
IAo+ID4gQlVHX09OLiBCdXQgdGhhdCdzIGEgc2VwYXJhdGUgdG9waWMuCj4gPiAKPiBZZXMhISEg
Oi1ECj4gCj4gSS5lLiwgYXMgSSd2ZSBzYWlkIGNvdW50bGVzcyB0aW1lcywgSSB3b3VsZCB0aGlu
ayB0aGF0IGEgc2VyaWVzIHdoaWNoCj4gaW50cm9kdWNlcyBhIENQVV9TVEFSVElORyBub3RpZmll
ciB0aGF0IGZhaWxzLCBzaG91bGQgYWxzbyBkZWFsIHdpdGgKPiBhZGp1c3RpbmcgdGhlIENQVSBw
cm9jZXNzIGFjY29yZGluZ2x5Lgo+IAo+ICpCVVQqIGlmIHlvdSBBUk0gcGVvcGxlIGFyZSBvayB3
aXRoIGFyY2gvYXJtLyBjb2RlIHRoYXQgZG9lcyB0aGF0LAo+IHBlcmhhcHMgd2l0aCBhIGNvbW1l
bnQgc2F5aW5nIHNvbWV0aGluZyBsaWtlOgo+IAo+ICJUaGlzIHdpbGwgY2F1c2UgdXMgdG8gaGl0
IHRoZSBCVUdfT04oKSBpbiBub3RpZnlfY3B1X3N0YXJ0aW5nKCkuIFRvCj4gZml4IHRoYXQsIHdl
IG5lZWQgdG8gcHJvcGVybHkgY2hhbmdlIHRoZSBDUFUgYnJpbmd1cCBjb2RlLCB3aGljaCB3aWxs
Cj4gaGFwcGVuIGluIGEgbGV0ZXIgc2VyaWVzLiIKPiAKPiB0aGF0IHdvdWxkIGFsc28gd29yaywg
SSBndWVzcy4gOi0pCgpZZXMsIEkgdGhpbmsgdGhhdCByZXR1cm5pbmcgZXJyb3Igd2l0aCBhbiBp
bi1jb2RlIGNvbW1lbnQgb24gdG9wIGlzIHRoZQpiZXN0IHNvbHV0aW9uLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
