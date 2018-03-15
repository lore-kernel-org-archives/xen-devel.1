From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/7] RFC arm/domain: Reject invalid
 combinations of domain creation flags
Date: Thu, 15 Mar 2018 20:02:11 +0000
Message-ID: <0ea68afe-439b-82db-149a-af95cabe3b32@citrix.com>
References: <1520601522-2886-1-git-send-email-andrew.cooper3@citrix.com>
 <1520601522-2886-4-git-send-email-andrew.cooper3@citrix.com>
 <8b868679-4e3d-6fa7-5b8c-16dd6a223acc@arm.com>
 <20180312163235.scpnygcfvvphcc5n@citrix.com>
 <07732b07-dd2a-ae4c-58f2-ff938db82c77@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <07732b07-dd2a-ae4c-58f2-ff938db82c77@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDMvMTggMTQ6NDIsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPgo+IE9uIDEyLzAz
LzE4IDE2OjMyLCBXZWkgTGl1IHdyb3RlOgo+PiBPbiBTdW4sIE1hciAxMSwgMjAxOCBhdCAwNzo1
OToxNlBNICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSBBbmRyZXcsCj4+Pgo+Pj4g
T24gMDMvMDkvMjAxOCAwMToxOCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+PiBBUk0gZ3Vl
c3RzIGFyZSBIVk0gYW5kIGhhdmUgaGFyZHdhcmUgYXNzaXN0ZWQgcGFnaW5nLsKgIFRoZXJlIGFy
ZSBubwo+Pj4+IFBWIGd1ZXN0cwo+Pj4+IG9yIHNoYWRvdyBwYWdpbmcsIGFuZCBhbGwgb3RoZXIg
Y3JlYXRpb24gZmxhZ3MgYXJlIHg4NiBzcGVjaWZpYy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+Pj4gLS0tCj4+Pj4g
Q0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4+PiBDQzog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4+PiBDQzogSWFuIEphY2tzb24g
PElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4+Pj4gQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+Cj4+Pj4KPj4+PiBSRkMuwqAgVGhpcyBpcyB1bnRlc3RlZCwgYnV0IEkgbm90aWNl
ZCBpdCB3aGVuIHB1dHRpbmcgdG9nZXRoZXIgdGhlCj4+Pj4gcHJlY2VlZGluZwo+Pj4+IHBhdGNo
LsKgIFRoZXJlIGlzIGEgbW9kZXJhdGUgY2hhbmNlIHRoYXQgdGhpcyB3aWxsIGNhdXNlIHRoaW5n
cyB0bwo+Pj4+IGV4cGxvZGUKPj4+PiBiZWNhdXNlIG9mIGhvdyBsaWJ4bCBoYW5kbGVzIEFSTSBn
dWVzdCBjb25zdHJ1Y3Rpb24sIGJ1dCBzb21ldGhpbmcKPj4+PiBhbG9uZyB0aGVzZQo+Pj4+IGxp
bmVzIGlzIHRoZSByaWdodCB0aGluZyB0byBkby4KPj4+Cj4+PiBUb29scyBhbmQgaHlwZXJ2aXNv
ciBhcmUgY29uc2lkZXJpbmcgQVJNIGd1ZXN0cyBhcyBQVi4gU28gdGhpcyBwYXRjaCBpcwo+Pj4g
Z29pbmcgdG8gYnJlYWsgYm9vdC4gVGhlcmUgYXJlIGFuIGFjdGlvbiAoWEVOLTEwMikgdG8gbW92
ZSBBUk0KPj4+IGd1ZXN0cyB0bwo+Pj4gYmVoYXZlIG1vcmUgbGlrZSBQVkggZnJvbSB0aGUgdG9v
bHMgUE9WLiBJIGFtIG5vdCBzdXJlIHdoZW4gSSB3aWxsCj4+PiBoYXZlIHRpbWUKPj4+IHRvIGxv
b2sgYXQgaXQgdGhvdWdodC4KPj4+Cj4+PiBGb3IgdGhlIHRpbWUgYmVpbmcsIEkgYW0gd29uZGVy
aW5nIGlmIHdlIGNvdWxkIG92ZXJyaWRlIHRoZSBmbGFncwo+Pj4gZm9yIEFybSBpbgo+Pj4gdGhl
IHRvb2xzdGFjaz8KPj4+Cj4+Cj4+IElzIHRoYXQgbmVjZXNzYXJ5PyBJIGRvbid0IHRoaW5rIHRo
ZSByZXN0IG9mIHRoaXMgc2VyaWVzIHdpbGwgYnJlYWsgQVJNCj4+IGF0IGZpcnN0IGdsYW5jZS4K
Pgo+IEFGQUlDVCwgdGhlIHJlc3Qgb2YgdGhlIHNlcmllcyB3aWxsIG5vdCBicmVhayBBUk0uIFNv
IEkgdGhpbmsgaXQgd291bGQKPiBiZSBmaW5lIHRvIGp1c3QgZHJvcCB0aGlzIHBhdGNoIGZvciB0
aGUgdGltZSBiZWluZy4KCkknbGwgZHJvcCB0aGUgcGF0Y2ggZm9yIG5vdy7CoCBUaGlzIHdhcyBq
dXN0IG1lYW50IHRvIGdldCB0aGUgcHJvYmxlbSBvbgpwZW9wbGVzIHJhZGFyLgoKfkFuZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
