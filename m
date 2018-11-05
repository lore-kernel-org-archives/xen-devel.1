From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/vcpu: Remove struct vcpu allocation
 restriction for !CONFIG_SHADOW_PAGING
Date: Mon, 5 Nov 2018 10:41:55 +0000
Message-ID: <300650ee-11ed-307e-d7dd-10cc6fdc6e8a@citrix.com>
References: <1541181240-30757-1-git-send-email-andrew.cooper3@citrix.com>
 <5BE0047002000078001F7D25@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BE0047002000078001F7D25@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDUvMjAxOCAwODo1MCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDIuMTEu
MTggYXQgMTg6NTQsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gLS0tIGEv
eGVuL2FyY2gveDg2L2RvbWFpbi5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+PiBA
QCAtMzExLDggKzMxMSwxMSBAQCBzdHJ1Y3QgdmNwdSAqYWxsb2NfdmNwdV9zdHJ1Y3Qodm9pZCkK
Pj4gICAgICAgKiBtYXkgcmVxdWlyZSB0aGF0IHRoZSBzaGFkb3cgQ1IzIHBvaW50cyBiZWxvdyA0
R0IsIGFuZCBoZW5jZSB0aGUgd2hvbGUKPj4gICAgICAgKiBzdHJ1Y3R1cmUgbXVzdCBzYXRpc2Z5
IHRoaXMgcmVzdHJpY3Rpb24uIFRodXMgd2Ugc3BlY2lmeSBNRU1GX2JpdHMoMzIpLgo+PiAgICAg
ICAqLwo+PiArICAgIHVuc2lnbmVkIGludCBtZW1mbGFncyA9Cj4+ICsgICAgICAgIElTX0VOQUJM
RUQoQ09ORklHX1NIQURPV19QQUdJTkcpID8gTUVNRl9iaXRzKDMyKSA6IDA7Cj4gCj4gQWNjb3Jk
aW5nIHRvIHRoZSBjb21tZW50LCBDT05GSUdfSFZNIChvciBwZXJoYXBzIGV2ZW4KPiBpc19odm1f
ZG9tYWluKCksIGlmIG9ubHkgdGhlIGNvcnJlc3BvbmRpbmcgc3RydWN0IGRvbWFpbiB3YXMKPiBh
dmFpbGFibGUgaGVyZSkgY291bGQgYmUgdGFrZW4gaW50byBjb25zaWRlcmF0aW9uIGF0IHRoZSBz
YW1lCj4gdGltZS4KCmlzX2h2bV9kb21haW4oKSB3b3VsZCBiZSBuaWNlIGFjdHVhbGx5LiAgSXQg
ZG9lcyBsb29rIGxpa2UgdGhhdCBzaG91bGQKd29yazogRm9yIFBWIGd1ZXN0cywgYHYtPmFyY2gu
cGFnaW5nLm1vZGVgIGxvb2tzIGxpa2UgaXQncyBzZXQgdG8KYCZTSEFET1dfSU5URVJOQUxfTkFN
RShzaF9wYWdpbmdfbW9kZSwgNClgIGFuZCBuZXZlciBjaGFuZ2VkIFsxXS4KCkl0IHdvdWxkIGJl
IG5pY2UgaWYgd2UgY291bGQgdGVzdCB0aGlzIHRob3VnaC4KCkknZCBhbHNvIGJlIGhhcHB5IHRv
IHRvc3MgdGhpcyBpbiBhcy1pcyB3aGlsZSB3ZSBwb25kZXIgdGhhdCBwb3RlbnRpYWwKaW1wcm92
ZW1lbnQ6CgpSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPgoKIC1HZW9yZ2UKClsxXSAvYnVpbGQvaGcveGVuLmdpdC94ZW4vYXJjaC94ODYvbW0vc2hh
ZG93L2NvbW1vbi5jOnNoYWRvd192Y3B1X2luaXQoKQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
