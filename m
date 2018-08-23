From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v1 5/6] libxl: create DTS node for OP-TEE if
 it is enabled
Date: Thu, 23 Aug 2018 17:16:08 +0300
Message-ID: <b4fee4ac-2f15-6eb7-553a-3cfe54bc2996@epam.com>
References: <1534947094-9974-1-git-send-email-volodymyr_babchuk@epam.com>
 <1534947094-9974-6-git-send-email-volodymyr_babchuk@epam.com>
 <ddaac512-921f-3cf7-f715-3870d53025d1@arm.com>
 <f2da47c6-1db7-9667-56c9-98bdf0fe7d5f@epam.com>
 <98c02aed-cf94-beb0-5c98-d5398c0e4532@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <98c02aed-cf94-beb0-5c98-d5398c0e4532@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xen.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: tee-dev@lists.linaro.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyMy4wOC4xOCAxNzoxMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDA4LzIzLzIwMTggMDM6MDMgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+PiBIaSwKPj4K
Pj4gT24gMjIuMDguMTggMjA6MzIsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+
IE9uIDIyLzA4LzE4IDE1OjExLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+PiBTaWduZWQt
b2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Cj4+
Pgo+Pj4gSSBhbSBhIGJpdCBjb25mdXNlZC4gVGhlIERUIGlzIG9ubHkgaGVyZSB0byB0ZWxsIHRo
ZSBndWVzdCBPUC1URUUgaXMgCj4+PiBwcmVzZW50LiBCdXQgSSBkb24ndCBzZWUgYW55dGhpbmcg
dG8gdGVsbCB0aGUgaHlwZXJ2aXNvciB0aGUgZ3Vlc3QgCj4+PiB3aWxsIHVzZSBPUC1URUUuCj4+
Cj4+IFllcywgdGhpcyBpcyB3aGF0IEkgd2FudGVkIHRvIGRpc2N1c3MuIEkgaGFkIGEgZmVsbGlu
ZyB0aGF0IGl0IGlzIG5vdCAKPj4gcXVpdGUgcmlnaHQuIEkgdGhpbmsgeW91ciBpZGVhIHdpdGgg
RE9NQ1RMIGlzIGJldHRlci4gSSdsbCByZXdvcmsgdGhpcyAKPj4gcGFydCBpbiB0aGXCoCBmb2xs
b3dpbmcgd2F5Ogo+Pgo+PiBpZiB0aGVyZSBpcyAib3B0ZWU9MSIgaW4gYSBjb25maWcgZmlsZSwg
dGhlbiBsaWJ4bCB3aWxsIGNyZWF0ZSBEVCAKPj4gZW50cnkgYW5kIGFzayBoeXBlcnZpc29yIHRv
IGVuYWJsZSBhY2Nlc3MgdG8gVEVFIGZvciB0aGlzIGRvbWFpbi4KPiAKPiBZb3UgcHJvYmFibHkg
YWxzbyB3YW50IHRvIG1ha2UgdGhlIHZhcmlhYmxlIFRFRSBhZ25vc3RpYyBieSByZW5hbWluZyB0
byAKPiAidGVlIi4KPiAKPiBJbiB0aGUgZnV0dXJlLCB0aGUgdG9vbHN0YWNrIHdvdWxkIG5lZWQg
dG8ga25vdyB3aGljaCBURUUgaXMgaW4gdXNlZCBpbiAKPiB0aGUgaHlwZXJ2aXNvci4gRm9yIG5v
dywgaXQgaXMgZmluZSB0byBhc3N1bWUgdGhhdCBpdCBpcyBPUC1URUUuCgpZZXMsIHNvdW5kcyBn
b29kLiBXaWxsIGRvIGluIHRoaXMgd2F5LgpUaGFuayB5b3UgZm9yIHJldmlldyBhbmQgc3VnZ2Vz
dGlvbi4KCi0tIApWb2xvZHlteXIgQmFiY2h1awoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
