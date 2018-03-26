From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 7/7] xen/x86: use PCID feature
Date: Mon, 26 Mar 2018 14:22:34 +0200
Message-ID: <c8769c3f-ecdc-d09a-7a2a-69407c646671@suse.com>
References: <20180321125129.28539-1-jgross@suse.com>
 <20180321125129.28539-8-jgross@suse.com> <5AB4EA4902000078001B577B@suse.com>
 <c07a3b60-7bcb-c9dc-e63e-2ae41157d3ea@suse.com>
 <5AB5136302000078001B58D9@suse.com>
 <67a5bfca-7cce-4f10-1e24-30888d3d8ccb@suse.com>
 <5AB5324C02000078001B59E7@suse.com>
 <473492c7-1e5b-a3ad-1496-f5b29ca4fc44@suse.com>
 <5AB8CB3902000078001B5F3A@suse.com>
 <a0e2efe6-c456-2cbb-d42f-03dd8a721482@suse.com>
 <5AB8E3DC02000078001B5FEB@suse.com>
 <053a7a73-5470-89b7-872e-92d7527e41f7@suse.com>
 <5AB8EAE902000078001B6034@suse.com>
 <7db012cc-f340-9299-20b8-ac17ee81d8f5@suse.com>
 <5AB9016002000078001B611E@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jk6d=gq=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f0R93-0003QP-VQ
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 12:22:37 +0000
In-Reply-To: <5AB9016002000078001B611E@suse.com>
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
Cc: andrew.cooper3@citrix.com, Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org, Jun Nakajima <jun.nakajima@intel.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDMvMTggMTQ6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI2LjAzLjE4IGF0
IDE0OjA0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMjYvMDMvMTggMTI6NDMsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjYuMDMuMTggYXQgMTI6MjksIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+IE9uIDI2LzAzLzE4IDEyOjEzLCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+Pj4+Pj4gT24gMjYuMDMuMTggYXQgMTA6NTUsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+
Pj4+Pj4gSSBjYW4gY2hhbmdlIHRoZSBzY2hlbWUgdG8gdXNlIGRpZmZlcmVudCB2YWx1ZXMgZm9y
IGd1ZXN0IFBDSURzCj4+Pj4+PiB3aXRoIFhQVEkgb24sIG9mIGNvdXJzZS4gQXJlIHlvdSBmaW5l
IHdpdGg6Cj4+Pj4+Pgo+Pj4+Pj4gLSBYUFRJIG9mZjogUENJRCAwID0ga2VybmVsLCBQQ0lEIDEg
PSB1c2VyCj4+Pj4+PiAtIFhQVEkgb246ICBQQ0lEIDAgPSBrZXJuZWwvWGVuLCBQQ0lEIDEgPSB1
c2VyL1hlbiwKPj4+Pj4+ICAgICAgICAgICAgIFBDSUQgMiA9IGtlcm5lbC9ndWVzdCwgUENJRCAz
ID0gdXNlci9ndWVzdAo+Pj4+Pgo+Pj4+PiBZZXMsIHRoYXQgd291bGQgZml0IHRoZSBmaXJzdCB2
YXJpYW50IEkndmUgZGVzY3JpYmVkLiBJIHRha2UgaXQgeW91Cj4+Pj4+IHByZWZlciBub3QgdG8g
YXZvaWQgUENJRCAwIGFsdG9nZXRoZXIgd2hlbiBQQ0lEcyBhcmUgZW5hYmxlZCAtCj4+Pj4+IGlz
IHRoZXJlIGEgcGFydGljdWxhciByZWFzb24/Cj4+Pj4KPj4+PiBZZXMuIEFzIHdyaXR0ZW4gaW4g
dGhlIGNvbW1lbnQgaW4gZmx1c2hfYXJlYV9sb2NhbCgpIEkgY2FuJ3QgYmUgc3VyZQo+Pj4+IHdo
ZXRoZXIgdGhlIGN1cnJlbnQgYWRkcmVzcyBzcGFjZSBpcyB0aGF0IG9mIGEgZG9tYWluIHdpdGgg
WFBUSQo+Pj4+IGVuYWJsZWQgKHRoZSBpZGxlIGRvbWFpbiBjb3VsZCBiZSAiY3VycmVudCIpLiBT
byBJIG5lZWQgdG8gYWx3YXlzCj4+Pj4gZmx1c2ggd2l0aCBQQ0lEIDAgYW5kIHdpdGggdGhlIHBv
c3NpYmxlIFBDSUQgdmFsdWVzIGZvciBhIFhQVEkgZG9tYWluLgo+Pj4+IFdoZW4gdXNpbmcgUENJ
RCAwIGZvciBYUFRJIGFzIHdlbGwgSSdsbCBuZWVkIDQgSU5WUENJRHMsIHdoaWxlIHdoZW4KPj4+
PiBhdm9pZGluZyBpdCBJJ2QgbmVlZCA1IChhdCBsZWFzdCB3aGVuIGN1cnJlbnQgPT0gaWRsZSku
Cj4+Pgo+Pj4gSSBzZWUuIFdoaWNoIG1ha2VzIG1lIHdvbmRlciB3aGV0aGVyIGEgc3VpdGFibGUg
Y29tYmluYXRpb24KPj4+IG9mIElOVkxQRyAodG8gZ2V0IHJpZCBvZiBnbG9iYWwgZW50cmllcykg
YW5kIElOVlBDSUQgY291bGRuJ3QgYmUKPj4+IHVzZWQgaW5zdGVhZC4gRm9yIGV4YW1wbGUsIHlv
dSBtYXkgYmUgYWJsZSB0byByZXBsYWNlIHRoZQo+Pj4gSU5WUENJRCBmb3IgdGhlIGFjdGl2ZSBQ
Q0lEIGJ5IElOVkxQRyAod2l0aG91dCBuZWVkaW5nIHRvCj4+PiBrbm93IHdobyAiY3VycmVudCIg
aXMpLgo+Pgo+PiBJTlZMUEcgaGFzIHRoZSBkaXNhZHZhbnRhZ2UgdG8gY2xlYXIgYWxsIHBhZ2lu
Zy1zdHJ1Y3R1cmUgY2FjaGUKPj4gZW50cmllcyBhc3NvY2lhdGVkIHdpdGggdGhlIGN1cnJlbnQg
UENJRC4KPj4KPj4gQW5kIEkgdGhvdWdodCB3ZSB3ZXJlIGZpbmFsbHkgb24gdGhlIHNhbWUgcGFn
ZSBub3QgdG8gdXNlIGdsb2JhbAo+PiBwYWdlcyB3aXRoIFBDSUQgZW5hYmxlZD8KPiAKPiBZZXMs
IHdlIGFyZS4gSWYgbm8gZ2xvYmFsIFRMQiBlbnRyaWVzIGNhbiBldmVyIHN1cnZpdmUgYSBDUjQu
UENJREUKPiAwIC0+IDEgdHJhbnNpdGlvbiwgYWxsIHdvdWxkIGJlIGZpbmUgd2l0aG91dCBJTlZM
UEcgb2YgY291cnNlLgoKT2theSwgSSdsbCBhZGQgYW4gQVNTRVJUKCkgdG8gbWFrZSBzdXJlIHRo
aXMgaXMgdHJ1ZToKCkFTU0VSVCghY3I0LnBnZSB8fCAhY3I0LnBjaWRlKQoKCkp1ZXJnZW4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
