From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tools/ocaml: Release the global lock before
 invoking block syscalls
Date: Mon, 8 Oct 2018 10:55:12 +0100
Message-ID: <06e141ed-42ae-1214-ff3d-fc9ab3197cd1@citrix.com>
References: <20181008031014.8485-1-yang.qian@citrix.com>
 <A062A4B6-57AD-41B6-9648-7FC34A7FDEAB@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0cbz=mu=citrix.com=prvs=8121cced0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g9SFv-0001Vu-3v
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 09:55:15 +0000
In-Reply-To: <A062A4B6-57AD-41B6-9648-7FC34A7FDEAB@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christian Lindig <christian.lindig@citrix.com>, Yang Qian <krizex@gmail.com>
Cc: Yang Qian <yang.qian@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMTAvMTggMDg6NTgsIENocmlzdGlhbiBMaW5kaWcgd3JvdGU6Cj4KPj4gT24gOCBPY3Qg
MjAxOCwgYXQgMDQ6MTAsIFlhbmcgUWlhbiA8a3JpemV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+
IEZ1bmN0aW9ucyByZWxhdGVkIHdpdGggZXZlbnQgY2hhbm5lbCBhcmUgcGFyYWxsZWxpemFibGUs
IHNvIHJlbGVhc2UgZ2xvYmFsCj4+IGxvY2sgYmVmb3JlIGludm9raW5nIEMgZnVuY3Rpb24gd2hp
Y2ggd2lsbCBmaW5hbGx5IGNhbGwgYmxvY2sgc3lzY2FsbHMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFlhbmcgUWlhbiA8eWFuZy5xaWFuQGNpdHJpeC5jb20+Cj4+IC0tLQo+PiB0b29scy9vY2FtbC9s
aWJzL2V2ZW50Y2huL3hlbmV2ZW50Y2huX3N0dWJzLmMgfCAzMCArKysrKysrKysrKysrKysrKysr
KysrKysrLS0KPj4gMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gQWNrZWQtYnk6IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4
LmNvbT4KPgo+IEZyb20gYW4gT0NhbWwgcG9pbnQgb2YgdmlldyB0aGlzIGlzIGxvb2tpbmcgZ29v
ZC4gQnV0IEkgd291bGQgbGlrZSB0byBoZWFyIGZyb20gZGV2ZWxvcGVycyB1bmRlcnN0YW5kaW5n
IGV2ZW50IGNoYW5uZWxzIHRoYXQgdGhpcyBpcyBpbmRlZWQgc2FmZSB0byBkby4KClRoZXkgYWxs
IGVuZCB1cCBhcyBpb2N0bCgpJ3MgaW50byB0aGUga2VybmVsLCBhbmQgZnJvbSB0aGVyZSBzb21l
IGJlY29tZQpoeXBlcmNhbGxzIGludG8gWGVuLgoKRWl0aGVyIHdheSwgdGhpcyBwYXRjaCBpcyBm
aW5lLsKgIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyCjxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
