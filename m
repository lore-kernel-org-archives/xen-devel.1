From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Subject: Re: [PATCH] x86/mmcfg/drhd: Move acpi_mmcfg_init()
 before calling acpi_parse_dmar()
Date: Thu, 16 Aug 2018 17:30:58 +0800
Message-ID: <fdcad3f9-df8f-7242-b8e2-7447a153b7ad@oracle.com>
References: <5fd7cd01-d55b-4fba-b57b-41560dc99cf2@default>
 <5B75235402000078001DEB68@prv1-mh.provo.novell.com>
 <670ef321-52e8-e501-faf9-a91e0ce94013@oracle.com>
Reply-To: zhenzhong.duan@oracle.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <670ef321-52e8-e501-faf9-a91e0ce94013@oracle.com>
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

Ck9uIDIwMTgvOC8xNiAxNzoxMywgWmhlbnpob25nIER1YW4gd3JvdGU6Cj4+Cj4+PiAtLS0gYS94
ZW4vYXJjaC94ODYvc2V0dXAuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKPj4+IEBA
IC0xNDkzLDYgKzE0OTMsMTAgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5z
aWduZWQgbG9uZyAKPj4+IG1iaV9wKQo+Pj4gwqDCoMKgwqDCoCBnZW5lcmljX2FwaWNfcHJvYmUo
KTsKPj4+ICvCoMKgwqAgcHRfcGNpX2luaXQoKTsKPj4+ICsKPj4+ICvCoMKgwqAgYWNwaV9tbWNm
Z19pbml0KCk7Cj4+PiArCj4+PiDCoMKgwqDCoMKgIGFjcGlfYm9vdF9pbml0KCk7Cj4+Cj4+IFdp
dGggdGhlIGRlcGVuZGVuY3kgYmVpbmcgX2luXyBhY3BpX2Jvb3RfaW5pdCgpLCB0aGUgaW52b2Nh
dGlvbiBvZgo+PiBhY3BpX21tY2ZnX2luaXQoKSBzaG91bGQgbm93IGJlIG1vdmVkIHRoZXJlLgo+
IFllcywgSSBmZWVsIGJldHRlciB0byBtb3ZlIHB0X3BjaV9pbml0KCkgYW5kIGFjcGlfbW1jZmdf
aW5pdCgpIGluIAo+IGFjcGlfYm9vdF9pbml0KCkgYmVmb3JlIGFjcGlfbW1jZmdfaW5pdCgpLiBB
bnkgbW9yZSBjb21tZW50cz8KSSBzZWUgYWNwaV9ib290X2luaXQoKSBpcyBlbXB0eSBmdW5jIHdo
ZW4gQ09ORklHX0FDUElfQk9PVCBpc24ndCBzZXQuIERvIAp3ZSBzdXBwb3J0IGRpc2FibGluZyB0
aGlzIGNvbmZpZyBvcHRpb24/IElmIHllcywgSSB0aGluayBhYm92ZSBjaGFuZ2UgCndpbGwgYnJl
YWsgbm9uLWFjcGkgY2FzZS4KClRoYW5rcwpaaGVuemhvbmcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
