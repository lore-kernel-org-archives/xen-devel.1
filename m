From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/5] tools/firmware: Build ipxe as a
 standalone ROM
Date: Mon, 19 Mar 2018 08:52:05 -0500
Message-ID: <3867875b-bb80-c2f5-3bcc-b2fd44902265@cardoe.com>
References: <1521135113-3764-1-git-send-email-anoob.soman@citrix.com>
 <1521135113-3764-2-git-send-email-anoob.soman@citrix.com>
 <5AABB61502000078001B2B11@prv-mh.provo.novell.com>
 <93314028-215f-ead3-eebc-c9c89c4e9ac1@cardoe.com>
 <5AAF794E02000078001B33FC@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AAF794E02000078001B33FC@prv-mh.provo.novell.com>
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
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xen.org, wei.liu2@citrix.com, ian.jackson@eu.citrix.com, Anoob Soman <anoob.soman@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8xOS8xOCAyOjQ4IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxOC4wMy4xOCBh
dCAwMjozMCwgPGNhcmRvZUBjYXJkb2UuY29tPiB3cm90ZToKPj4gT24gMy8xNi8xOCA2OjE4IEFN
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDE1LjAzLjE4IGF0IDE4OjMxLCA8YW5vb2Iu
c29tYW5AY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4gQEAgLTcxLDcgKzcyLDcgQEAgYWxsOiBhY3Bp
IHN1YmRpcnMtYWxsCj4+Pj4gIGFjcGk6Cj4+Pj4gIAkkKE1BS0UpIC1DICQoQUNQSV9QQVRIKSAg
QUNQSV9CVUlMRF9ESVI9JChDVVJESVIpIERTRFRfRklMRVM9IiQoRFNEVF9GSUxFUykiCj4+Pj4g
IAo+Pj4+IC1yb21iaW9zLm86IHJvbXMuaW5jCj4+Pj4gK3JvbWJpb3MubzogJChFVEhFUkJPT1Rf
Uk9NKSByb21zLmluYwo+Pj4KPj4+IFBsZWFzZSBkb24ndCBpbnRyb2R1Y2UgZGVhZCBkZXBlbmRl
bmNpZXM6IElmIGEgbmVlZCBmb3IgdGhpcyBhcmlzZXMKPj4+IGluIGEgbGF0ZXIgcGF0Y2gsIGFk
ZCB0aGUgZGVwZW5kZW5jeSB0aGVyZS4KPj4KPj4gV2VsbCB0aGlzIGlzIHdoYXQncyBjcmVhdGlu
ZyB0aGUgaXB4ZS5iaW4gdGhhdCdzIGJlaW5nIGluc3RhbGxlZCBpbiB0aGUKPj4gc2VjdGlvbiB5
b3Ugc25pcHBlZCBvdXQuCj4gCj4gSSBkb24ndCB1bmRlcnN0YW5kOiBUaGUgcXVlc3Rpb24gaXNu
J3Qgd2hhdCBpcyBiZWluZyBnZW5lcmF0ZWQsIGJ1dAo+IHdoZXRoZXIgcm9tYmlvcy5vIHJlYWxs
eSBkZXBlbmRzIG9uIHRoYXQgYmluYXJ5IGJsb2IsIGFuZCBub3RoaW5nCj4gaW4gdGhlIHBhdGNo
IGhlcmUgc3VnZ2VzdHMgaXQgZG9lcy4gSWYgdGhlIGdvYWwgaXMgc2ltcGx5IHRvIGhhdmUgYQo+
IGRlcGVuZGVuY3kgdHJpZ2dlcmluZyB0aGUgY3JlYXRpb24gb2YgdGhlIGJsb2IsIHRoZW4gdGhp
cyBzaG91bGQgYmUKPiBkb25lIHZpYSBlLmcuIFRBUkdFVCwgYW5kIHRoZSB3aG9sZSBsb2dpYyBz
aG91bGQgcmF0aGVyIHNpdCBpbgo+IGZpcm13YXJlL01ha2VmaWxlIChtYXRjaGluZyB0aGUgaW5z
dGFsbGF0aW9uIG9mIGl0IGRvbmUgdGhlcmUpLgo+IAo+IEphbgo+IAoKT2gsIDEwMCUgYWdyZWVt
ZW50IHRoZXJlLgoKLS0gCkRvdWcgR29sZHN0ZWluCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
