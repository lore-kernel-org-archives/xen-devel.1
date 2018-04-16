From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 4/7] xen/arm: When CPU dies,
 free percpu area immediatelly
Date: Mon, 16 Apr 2018 16:21:07 +0100
Message-ID: <ca23e8da-6922-66a1-37c4-a3198504fcdb@arm.com>
References: <20180411131927.27083-1-mirela.simonovic@aggios.com>
 <20180411131927.27083-5-mirela.simonovic@aggios.com>
 <903453c5-f693-00c6-7e68-790bfbd7501e@arm.com>
 <alpine.DEB.2.10.1804111640470.3304@sstabellini-ThinkPad-X260>
 <2acaa95a-84bd-a9fc-285c-3b2e2b098f4a@arm.com>
 <alpine.DEB.2.10.1804121314410.3304@sstabellini-ThinkPad-X260>
 <d826b63c-9cf4-3a7d-7b8c-f285289b2840@arm.com>
 <CAKPH-Njg-Qwj6EFpgXDV9QGpaOUbPtuHsM6sr-b7ZMWBCwptBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAKPH-Njg-Qwj6EFpgXDV9QGpaOUbPtuHsM6sr-b7ZMWBCwptBQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Davorin Mista <dm@aggios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen Devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNi8wNC8xOCAxNDo0MSwgTWlyZWxhIFNpbW9ub3ZpYyB3cm90ZToKPiBPbiBNb24sIEFw
ciAxNiwgMjAxOCBhdCAzOjE0IFBNLCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PiB3cm90ZToKPj4gT24gMTIvMDQvMTggMjI6MzEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToK
Pj4+IE9uIFRodSwgMTIgQXByIDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiBPbiAxMi8w
NC8xOCAwMDo0NiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4+PiBPbiBXZWQsIDExIEFw
ciAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+PiBPbiAxMS8wNC8xOCAxNDoxOSwgTWly
ZWxhIFNpbW9ub3ZpYyB3cm90ZToKPj4gSSBndWVzcyB0aGUgcmN1X2JhcnJpZXIoKSBpbiB0aGUg
ZnVuY3Rpb24gaGFuZGxpbmcgc3VzcGVuZC9yZXN1bWUgd29ya3MuIEJ1dAo+PiB0aGF0IGRvZXNu
J3QgY292ZXIgdGhlIGhvdHBsdWcgY2FzZS4gTG9va2luZyBhdCB4ODYsIHN1c3BlbmQvcmVzdW1l
IGNhc2UuCj4+IEZvciB0aGUgaG90cGx1ZyBjYXNlLCB0aGVyZSBhcmUgYW4gcmN1X2JhcnJpZXIg
aW4gY3B1X3t1cCxkb3dufV9oZWxwZXIgYnV0Cj4+IHRoZXkgYXJlIG9ubHkgcHJlc2VudCBpbiB0
aGUgY2FzZSBvZiBjcHVfe3VwLGRvd259IGZhaWxlZC4gSSBhbSBub3QgZW50aXJlbHkKPj4gc3Vy
ZSBob3cgdGhpcyBpcyBoYW5kbGVkIGluIHg4Ngo+Pgo+PiBBbmRyZXcsIEphbiwgZG8geW91IGtu
b3cgd2hlbiB0aGUgcGVyY3B1IHdpbGwgYmUgZnJlZSBvbiBob3RwbHVnPyBJdCBpcyBjYWxsCj4+
IHRvIGNhbGxfcmN1KC4uLikgYnV0IEkgYW0gbm90IHN1cmUgd2hlbiB0aGlzIGlzIGdvaW5nIHRv
IGJlIGV4ZWN1dGVkLgo+Pgo+IAo+IEFGQUlLIGRpc2FibGUvZW5hYmxlX25vbmJvb3RfY3B1cygp
IGlzIHRoZSBvbmx5IHdheSB0byBkbyB0aGUgaG90cGx1Zwo+IGFuZCByY3VfYmFycmllcigpIGlz
IG5vdCBpbmNsdWRlZCBpbiB0aGUgZmxvdy4KClRoYXQncyBub3QgdGhlIG9ubHkgd2F5LiBJIGNs
ZWFybHkgc3BlY2lmaWVkIG9uZSBpbiBteSBwcmV2aW91cyBhbnN3ZXIgCihzZWUgY3B1X3t1cCxk
b3dufV9oZWxwZXIpIGFuZCB0aGVyZSBhcmUgb3RoZXIgcGxhY2UgKGxvb2sgZm9yIGNwdV91cCku
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
