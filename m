From: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v3 5/6] xen/x86: add
 PHYSDEVOP_msi_msix_set_enable
Date: Fri, 1 Feb 2019 16:58:28 -0500
Message-ID: <b5777c09-d1b9-72f6-6aee-eb367b8c6831@tycho.nsa.gov>
References: <cover.3de8cf7a339b8395cb449f8f3d44fee884ce04fa.1548469645.git-series.marmarek@invisiblethingslab.com>
 <d0a1089092cfdf2f4027428cc1e754f23128020d.1548469645.git-series.marmarek@invisiblethingslab.com>
 <20190130135158.jo5ysmgawta4idzn@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IITl=QI=tycho.nsa.gov=dgdegra@srs-us1.protection.inumbo.net>)
 id 1gpgpd-0005fb-DK
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 21:58:41 +0000
In-Reply-To: <20190130135158.jo5ysmgawta4idzn@mac>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMS8zMC8xOSA4OjUxIEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFNhdCwgSmFu
IDI2LCAyMDE5IGF0IDAzOjMxOjE2QU0gKzAxMDAsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNr
aSB3cm90ZToKPj4gQWxsb3cgZGV2aWNlIG1vZGVsIHJ1bm5pbmcgaW4gc3R1YmRvbWFpbiB0byBl
bmFibGUvZGlzYWJsZSBNU0koLVgpLAo+PiBieXBhc3NpbmcgcGNpYmFjay4gV2hpbGUgcGNpYmFj
ayBpcyBzdGlsbCB1c2VkIHRvIGFjY2VzcyBjb25maWcgc3BhY2UKPj4gZnJvbSB3aXRoaW4gc3R1
YmRvbWFpbiwgaXQgcmVmdXNlIHRvIHdyaXRlIHRvCj4+IFBDSV9NU0lfRkxBR1NfRU5BQkxFL1BD
SV9NU0lYX0ZMQUdTX0VOQUJMRSBpbiBub24tcGVybWlzc2l2ZSBtb2RlLiBXaGljaAo+PiBpcyB0
aGUgcmlnaHQgdGhpbmcgdG8gZG8gZm9yIFBWIGRvbWFpbiAodGhlIG1haW4gdXNlIGNhc2UgZm9y
IHBjaWJhY2spLAo+PiBhcyBQViBkb21haW4gc2hvdWxkIHVzZSBYRU5fUENJX09QXyogY29tbWFu
ZHMgZm9yIHRoYXQuIFVuZm9ydHVuYXRlbHkKPj4gdGhvc2UgY29tbWFuZHMgYXJlIG5vdCBnb29k
IGZvciBzdHViZG9tYWluIHVzZSwgYXMgdGhleSBjb25maWd1cmUgTVNJIGluCj4+IGRvbTAncyBr
ZXJuZWwgdG9vLCB3aGljaCBzaG91bGQgbm90IGhhcHBlbiBmb3IgSFZNIGRvbWFpbi4KPj4KPj4g
VGhpcyBuZXcgcGh5c2Rldm9wIGlzIGFsbG93ZWQgb25seSBmb3Igc3R1YmRvbWFpbiBjb250cm9s
bGluZyB0aGUgZG9tYWluCj4+IHdoaWNoIG93biB0aGUgZGV2aWNlLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5n
c2xhYi5jb20+Cj4gCj4gVGhhbmtzIQo+IAo+PiAtLS0KPj4gQ2hhbmdlcyBpbiB2MzoKPj4gICAt
IG5ldyBwYXRjaAo+Pgo+PiBUaGlzIGlzIHJhdGhlciBSRkMuIEFueSBzdWdnZXN0aW9ucyBmb3Ig
c2hvcnRlciBuYW1lPyBBbHNvLCBJJ20gbm90IHN1cmUKPj4gaWYgcGh5c2Rldl9tc2lfbXNpeF9z
ZXRfZW5hYmxlLmZsYWcgaXMgdGhlIGJlc3QgbmFtZS9pZGVhLgo+IAo+IEkndmUgbWFkZSBzb21l
IGNvbW1lbnRzIGJlbG93Lgo+IAo+PiBTaG91bGQgaXQgYmUgcGx1Z2dlZCBpbnRvIFhTTT8gQW55
IHN1Z2dlc3Rpb25zIGhvdyBleGFjdGx5PyBOZXcKPj4gZnVuY3Rpb24gd2l0aCBYU01fRE1fUFJJ
ViBkZWZhdWx0IGFjdGlvbj8gU2hvdWxkIGl0IGdldCB0YXJnZXQgZG9tYWluCj4+IG9ubHksIG9y
IGFsc28gbWFjaGluZV9iZGY/Cj4gCj4gWW91IHNob3VsZCBDYyB0aGUgWFNNIG1haW50YWluZXIg
SSB0aGluaywgd2hpY2ggSSd2ZSBkb25lIG5vdy4KClllcywgSSB0aGluayB5b3UgbmVlZCB0byBw
YXNzIGJvdGggdGhlIGRvbWFpbiBhbmQgbWFjaGluZV9iZGY7IHRoZSBob29rCnNvdW5kcyBsaWtl
IGl0IHNob3VsZCBiZSBzaW1pbGFyIHRvIHRoZSBleGlzdGluZyBtYXBfZG9tYWluX2lycSBvcgph
c3NpZ25fZGV2aWNlIGhvb2tzOiBjaGVjayB0aGF0IHRoZSBkZXZpY2UgbW9kZWwgaGFzIHJpZ2h0
cyB0byBkbyB0aGlzCm9wZXJhdGlvbiBvbiB0aGUgZGV2aWNlLCBhbmQgYWxzbyBjaGVjayB0aGF0
IHRoZSBkZXZpY2UgbW9kZWwgaGFzIHJpZ2h0cwp0byBtb2RpZnkgZGV2aWNlcyBhc3NpZ25lZCB0
byB0aGUgZGV2aWNlJ3Mgb3duZXIgKHRoaXMgY2hlY2sgaXMgd2h5IHRoZQpkb21haW4gaXMgbmVl
ZGVkKS4KCkFsdGVybmF0aXZlbHksIHlvdSBjYW4gaGFyZC1jb2RlIHRoZSByZXF1aXJlbWVudCB0
byBiZSB0aGUgdGFyZ2V0IGRvbWFpbiwKYnV0IEkgdGhpbmsgdGhpcyBwcmV2ZW50cyB1c2luZyB0
aGUgc2FtZSBob29rcyBmcm9tIGEgZG9tMCBkZXZpY2UgbW9kZWwuCklmIHRoYXQncyBhbHJlYWR5
IHRoZSBjYXNlLCB0aGlzIGlzIGxlc3Mgb2YgYW4gaXNzdWUuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
