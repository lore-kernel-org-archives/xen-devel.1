From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/mmcfg/drhd: Move acpi_mmcfg_init()
 before calling acpi_parse_dmar()
Date: Thu, 16 Aug 2018 04:42:03 -0600
Message-ID: <5B7554FB02000078001DED3A@prv1-mh.provo.novell.com>
References: <5fd7cd01-d55b-4fba-b57b-41560dc99cf2@default>
 <5B75235402000078001DEB68@prv1-mh.provo.novell.com>
 <670ef321-52e8-e501-faf9-a91e0ce94013@oracle.com>
 <fdcad3f9-df8f-7242-b8e2-7447a153b7ad@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <fdcad3f9-df8f-7242-b8e2-7447a153b7ad@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Cc: david.westwood@hpe.com, Andrew Cooper <andrew.cooper3@citrix.com>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>, Xen-Devel <xen-devel@lists.xen.org>, manoj.gopalasetty@hpe.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA4LjE4IGF0IDExOjMwLCA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4gd3Jv
dGU6Cj4gT24gMjAxOC84LzE2IDE3OjEzLCBaaGVuemhvbmcgRHVhbiB3cm90ZToKPj4+PiAtLS0g
YS94ZW4vYXJjaC94ODYvc2V0dXAuYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4+
Pj4gQEAgLTE0OTMsNiArMTQ5MywxMCBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hl
bih1bnNpZ25lZCBsb25nIAo+Pj4+IG1iaV9wKQo+Pj4+ICAgICAgIGdlbmVyaWNfYXBpY19wcm9i
ZSgpOwo+Pj4+ICsgICAgcHRfcGNpX2luaXQoKTsKPj4+PiArCj4+Pj4gKyAgICBhY3BpX21tY2Zn
X2luaXQoKTsKPj4+PiArCj4+Pj4gICAgICAgYWNwaV9ib290X2luaXQoKTsKPj4+Cj4+PiBXaXRo
IHRoZSBkZXBlbmRlbmN5IGJlaW5nIF9pbl8gYWNwaV9ib290X2luaXQoKSwgdGhlIGludm9jYXRp
b24gb2YKPj4+IGFjcGlfbW1jZmdfaW5pdCgpIHNob3VsZCBub3cgYmUgbW92ZWQgdGhlcmUuCj4+
IFllcywgSSBmZWVsIGJldHRlciB0byBtb3ZlIHB0X3BjaV9pbml0KCkgYW5kIGFjcGlfbW1jZmdf
aW5pdCgpIGluIAo+PiBhY3BpX2Jvb3RfaW5pdCgpIGJlZm9yZSBhY3BpX21tY2ZnX2luaXQoKS4g
QW55IG1vcmUgY29tbWVudHM/Cj4gSSBzZWUgYWNwaV9ib290X2luaXQoKSBpcyBlbXB0eSBmdW5j
IHdoZW4gQ09ORklHX0FDUElfQk9PVCBpc24ndCBzZXQuIERvIAo+IHdlIHN1cHBvcnQgZGlzYWJs
aW5nIHRoaXMgY29uZmlnIG9wdGlvbj8gSWYgeWVzLCBJIHRoaW5rIGFib3ZlIGNoYW5nZSAKPiB3
aWxsIGJyZWFrIG5vbi1hY3BpIGNhc2UuCgpJJ20gc29ycnksIGJ1dCBJJ20gbG9zdDogZ3JlcCBw
cm9kdWNlcyBubyBzaW5nbGUgaGl0IG9uIG15IHRyZWUKd2hlbiBsb29raW5nIGZvciBBQ1BJX0JP
T1QuIEFyZSB5b3UgbG9va2luZyBhdCBzb21lIG9sZGVyIHRyZWU/CkV2ZW4gd2hlbiBjb25zaWRl
cmluZyBBQ1BJIC0gdGhhdCBLY29uZmlnIG9wdGlvbiBleGlzdHMgb25seSBmb3IKQVJNJ3MgcHVy
cG9zZXMgcmlnaHQgbm93LiBJZiB5b3Ugd2VyZSB0byBtYWtlIGl0IHVzZXIgc2VsZWN0YWJsZSwK
SSB0aGluayB5b3UnZCBmaXJzdCBoYXZlIHRvIGZpeCBhIG51bWJlciBvZiBidWlsZCBpc3N1ZXMg
aW4gY2FzZSBpdApnb3QgdHVybmVkIG9mZi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
