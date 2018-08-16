From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Subject: Re: [PATCH] x86/mmcfg/drhd: Move acpi_mmcfg_init()
 before calling acpi_parse_dmar()
Date: Fri, 17 Aug 2018 07:50:03 +0800
Message-ID: <e603ee0a-1416-03ec-4404-61c0fd1e2327@oracle.com>
References: <5fd7cd01-d55b-4fba-b57b-41560dc99cf2@default>
 <5B75235402000078001DEB68@prv1-mh.provo.novell.com>
 <670ef321-52e8-e501-faf9-a91e0ce94013@oracle.com>
 <fdcad3f9-df8f-7242-b8e2-7447a153b7ad@oracle.com>
 <5B7554FB02000078001DED3A@prv1-mh.provo.novell.com>
Reply-To: zhenzhong.duan@oracle.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B7554FB02000078001DED3A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: david.westwood@hpe.com, Andrew Cooper <andrew.cooper3@citrix.com>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>, Xen-Devel <xen-devel@lists.xen.org>, manoj.gopalasetty@hpe.com
List-Id: xen-devel@lists.xenproject.org

5ZyoIDIwMTgvOC8xNiAxODo0MiwgSmFuIEJldWxpY2gg5YaZ6YGTOgo+Pj4+IE9uIDE2LjA4LjE4
IGF0IDExOjMwLCA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4gd3JvdGU6Cj4+IE9uIDIwMTgv
OC8xNiAxNzoxMywgWmhlbnpob25nIER1YW4gd3JvdGU6Cj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9zZXR1cC5jCj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4+Pj4+IEBAIC0xNDkz
LDYgKzE0OTMsMTAgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQg
bG9uZwo+Pj4+PiBtYmlfcCkKPj4+Pj4gICAgICAgIGdlbmVyaWNfYXBpY19wcm9iZSgpOwo+Pj4+
PiArICAgIHB0X3BjaV9pbml0KCk7Cj4+Pj4+ICsKPj4+Pj4gKyAgICBhY3BpX21tY2ZnX2luaXQo
KTsKPj4+Pj4gKwo+Pj4+PiAgICAgICAgYWNwaV9ib290X2luaXQoKTsKPj4+Pgo+Pj4+IFdpdGgg
dGhlIGRlcGVuZGVuY3kgYmVpbmcgX2luXyBhY3BpX2Jvb3RfaW5pdCgpLCB0aGUgaW52b2NhdGlv
biBvZgo+Pj4+IGFjcGlfbW1jZmdfaW5pdCgpIHNob3VsZCBub3cgYmUgbW92ZWQgdGhlcmUuCj4+
PiBZZXMsIEkgZmVlbCBiZXR0ZXIgdG8gbW92ZSBwdF9wY2lfaW5pdCgpIGFuZCBhY3BpX21tY2Zn
X2luaXQoKSBpbgo+Pj4gYWNwaV9ib290X2luaXQoKSBiZWZvcmUgYWNwaV9tbWNmZ19pbml0KCku
IEFueSBtb3JlIGNvbW1lbnRzPwo+PiBJIHNlZSBhY3BpX2Jvb3RfaW5pdCgpIGlzIGVtcHR5IGZ1
bmMgd2hlbiBDT05GSUdfQUNQSV9CT09UIGlzbid0IHNldC4gRG8KPj4gd2Ugc3VwcG9ydCBkaXNh
YmxpbmcgdGhpcyBjb25maWcgb3B0aW9uPyBJZiB5ZXMsIEkgdGhpbmsgYWJvdmUgY2hhbmdlCj4+
IHdpbGwgYnJlYWsgbm9uLWFjcGkgY2FzZS4KPiAKPiBJJ20gc29ycnksIGJ1dCBJJ20gbG9zdDog
Z3JlcCBwcm9kdWNlcyBubyBzaW5nbGUgaGl0IG9uIG15IHRyZWUKPiB3aGVuIGxvb2tpbmcgZm9y
IEFDUElfQk9PVC4gQXJlIHlvdSBsb29raW5nIGF0IHNvbWUgb2xkZXIgdHJlZT8KPiBFdmVuIHdo
ZW4gY29uc2lkZXJpbmcgQUNQSSAtIHRoYXQgS2NvbmZpZyBvcHRpb24gZXhpc3RzIG9ubHkgZm9y
Cj4gQVJNJ3MgcHVycG9zZXMgcmlnaHQgbm93LiBJZiB5b3Ugd2VyZSB0byBtYWtlIGl0IHVzZXIg
c2VsZWN0YWJsZSwKPiBJIHRoaW5rIHlvdSdkIGZpcnN0IGhhdmUgdG8gZml4IGEgbnVtYmVyIG9m
IGJ1aWxkIGlzc3VlcyBpbiBjYXNlIGl0Cj4gZ290IHR1cm5lZCBvZmYuClNvcnJ5LCBJIHdyb25n
bHkgbG9va2VkIGludG8gb3JhY2xlIGludGVybmFsIGJyYW5jaC4KSW4gdXBzdHJlYW0sIGl0J3Mg
Q09ORklHX0FDUEkuIEl0IGxvb2tzIG5vdCBhbiBpc3N1ZSBhcyB5b3Ugc2FpZCAKQ09ORklHX0FD
UEkgaXMgb25seSBmb3IgQVJNLgoKVGhhbmtzClpoZW56aG9uZwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
