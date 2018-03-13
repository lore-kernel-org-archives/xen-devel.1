From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] tools/xl: fix uninitialized variable in
	xl_vdispl
Date: Tue, 13 Mar 2018 09:33:40 -0500
Message-ID: <5e8b28f9-c388-1324-b427-8414407f191a@cardoe.com>
References: <20180313044333.27923-1-cardoe@cardoe.com>
 <5AA793F302000078001B0CC4@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AA793F302000078001B0CC4@prv-mh.provo.novell.com>
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
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMy8xMy8xOCAzOjAzIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxMy4wMy4xOCBh
dCAwNTo0MywgPGNhcmRvZUBjYXJkb2UuY29tPiB3cm90ZToKPj4gVGhlIGNvZGUgYWRkZWQgaW4g
N2E0ODYyMmE3OGEwYjQ1MmU4YWZhNTViODQ0MmM5NThhYmQyMjZhNyBjb3VsZCB1c2UgcmMKPj4g
dW5pbml0aWFsaXplZCBpbiBtYWluX3ZkaXNwbGF0dGFjaCgpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+Cj4+IC0tLQo+PiBDQzogT2xla3Nh
bmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgo+PiAtLS0KPj4gIHRvb2xz
L3hsL3hsX3ZkaXNwbC5jIHwgMiArLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gUGxlYXNlIHRyaW0geW91ciBDYyBsaXN0IC0gSSd2ZSByZW1v
dmVkIGFsbCBpbmRpdmlkdWFscyBoZXJlLCBhbmQgSQo+IGRvbid0IHNlZSB3aHkgeW91J3ZlIGNv
cGllZCBhbGwgUkVTVCBtYWludGFpbmVycyB3aGVuIHRoaXMgaXMKPiBjbGVhcmx5IGEgcHVyZSB0
b29sIHN0YWNrIGNoYW5nZS4KPiAKPiBKYW4KPiAKClllYSBpdCB3YXMgYSBtaXN0YWtlIG9uIG15
IHBhcnQuIFN1Ym1pdHRpbmcgcGF0Y2hlcyBsYXRlIGF0IG5pZ2h0IGNhdXNlZAptZSB0byBhZGQg
YSAtZiB0byBnZXRfbWFpbnRhaW5lci5wbAoKLS0gCkRvdWcgR29sZHN0ZWluCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
