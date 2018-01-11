From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] xen/credit2: Drop unnecessary bit test
Date: Thu, 11 Jan 2018 16:50:14 +0000
Message-ID: <e5b93c38-5e8a-3fa1-ee6f-b49ebe45ba1d@citrix.com>
References: <1515689305-29482-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1515689305-29482-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTEvMjAxOCAwNDo0OCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IEND
OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gQ0M6IERhcmlv
IEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4gCj4gTm90aWNlcyBieSBjaGFuY2Ugd2hp
bGUgaW5zcGVjdGluZyB0aGUgZGlzYXNzZW1ibHkgZGVsdGEgZm9yICJ4ODYvYml0b3BzOgo+IElu
dHJvZHVjZSB2YXJpYWJsZS9jb25zdGFudCBwYWlycyBmb3IgX197c2V0LGNsZWFyLGNoYW5nZX1f
Yml0KCkiCj4gLS0tCj4gIHhlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jIHwgMiArLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIu
Ywo+IGluZGV4IDE4ZjM5Y2EuLmVlOTc2OGUgMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi9zY2hl
ZF9jcmVkaXQyLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYwo+IEBAIC0yMDYz
LDcgKzIwNjMsNyBAQCBjc2NoZWQyX3ZjcHVfc2xlZXAoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAq
b3BzLCBzdHJ1Y3QgdmNwdSAqdmMpCj4gICAgICAgICAgdXBkYXRlX2xvYWQob3BzLCBzdmMtPnJx
ZCwgc3ZjLCAtMSwgTk9XKCkpOwo+ICAgICAgICAgIHJ1bnFfcmVtb3ZlKHN2Yyk7Cj4gICAgICB9
Cj4gLSAgICBlbHNlIGlmICggc3ZjLT5mbGFncyAmIENTRkxBR19kZWxheWVkX3J1bnFfYWRkICkK
PiArICAgIGVsc2UKPiAgICAgICAgICBfX2NsZWFyX2JpdChfX0NTRkxBR19kZWxheWVkX3J1bnFf
YWRkLCAmc3ZjLT5mbGFncyk7CgpUaGVyZSB3YXMgYSByZWFzb24gZm9yIHRoaXMgYXQgc29tZSBw
b2ludCwgSSdtIHN1cmUuICBEaWQgdGhpcyB1c2VkIHRvCmJlIHRoZSBhdG9taWMgdmVyc2lvbiAo
d2l0aG91dCB0aGUgX18pIG9yaWdpbmFsbHk/CgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
