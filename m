From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] x86/mmcfg/drhd: Move
 acpi_mmcfg_init() call before calling acpi_parse_dmar()
Date: Mon, 20 Aug 2018 05:35:36 -0600
Message-ID: <5B7AA78802000078001DFFC6@prv1-mh.provo.novell.com>
References: <5059b0bd-77f4-443b-97e4-3c5b162012f2@default>
 <5B76BF8902000078001DF69C@prv1-mh.provo.novell.com>
 <a0b89642-abc8-5fe2-36b1-27dd9ca66c0a@oracle.com>
 <5B7A719A02000078001DFCB4@prv1-mh.provo.novell.com>
 <df8a1a59-59da-b794-6dc3-2815034e6f5e@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <df8a1a59-59da-b794-6dc3-2815034e6f5e@oracle.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-Devel <xen-devel@lists.xen.org>, manoj.gopalasetty@hpe.com, david.westwood@hpe.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA4LjE4IGF0IDExOjM4LCA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4gd3Jv
dGU6Cj4gT24gMjAxOC84LzIwIDE1OjQ1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjAu
MDguMTggYXQgMDU6MzgsIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPiB3cm90ZToKPj4+IEkn
bSB0aGlua2luZyBhYm91dCBtb3ZpbmcgYmVsb3cgcGllY2Ugb2YgY29kZSBlYXJsaWVyIHRvbywg
YW5kIEkgY2hlY2tlZAo+Pj4gcGNpX21tY2ZnX2NoZWNrX2hvc3RicmlkZ2UoKSBjYXJlZnVsbHks
IGl0J3Mgc2VjdXJlLCB3aGF0IGRvIHlvdSB0aGluawo+Pj4gYWJvdXQgdGhhdD8KPj4+Cj4+PiAg
ICAgICBtbWlvX3JvX3JhbmdlcyA9IHJhbmdlc2V0X25ldyhOVUxMLCAici9vIG1taW8gcmFuZ2Vz
IiwKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJBTkdFU0VURl9wcmV0
dHlwcmludF9oZXgpOwo+Pj4KPj4gCj4+IFRoYXQncyBhIHJlYXNvbmFibGUgdGhpbmcgdG8gZG8s
IGFuZCBpcyAoYXMgcG9pbnRlZCBvdXQpIGEgbmVjZXNzYXJ5Cj4+IHByZXJlcS4gQnV0IHRvIGJl
IHZlcnkgY2xlYXIgLSB5b3UnbGwgYWxzbyBoYXZlIHRvIHByb3ZlIGl0J3Mgc3VmZmljaWVudCwK
Pj4gYW5kIGZvciB0aGF0IGl0IGRvZXNuJ3Qgc3VmZmljZSB0byBjb25zaWRlciBwY2lfbW1jZmdf
Y2hlY2tfaG9zdGJyaWRnZSgpCj4+IGFsb25lLgo+IE5vdCBzdXJlIGhvdyB0byBwcm92ZSwgSSBj
aGVja2VkIG92ZXIgYWNwaV9tbWNmZ19pbml0KCkgY2FyZWZ1bGx5LCAKPiBhY3BpX2Rpc2FibGVk
IGFuZCBETUkgaW5mbyBhcmUgdXNlZCBhbmQgdGhleSBhcmUgaW5pdGlhbGl6ZWQgZWFybGllciAK
PiB0aGFuIGFjcGlfZG1hcl9pbml0KCkgY2FsbCwgSSBvbmx5IGZvdW5kIG1taW9fcm9fcmFuZ2Vz
IG5lZWQgdG8gYmUgbW92ZWQuCgpCdXQgdGhhdCdzIG9ubHkgaGFsZiBvZiBpdDogQ2hlY2tpbmcg
anVzdCBhY3BpX21tY2ZnX2luaXQoKSBpcyBpbnN1ZmZpY2llbnQuCllvdSBhbHNvIG5lZWQgdG8g
Y2hlY2sgZXZlcnl0aGluZyBiZXR3ZWVuIHRoZSBvbGQgYW5kIG5ldyBjYWxsIHNpdGVzLgpBbmQg
dGhlIHJlc3VsdCBvZiB0aGlzIGNoZWNraW5nIHdhbnRzIHRvIGJlIHN1bW1hcml6ZWQgKHJlYWQ6
IGluIGEKYnJpZWYgYnV0IG5ldmVydGhlbGVzcyBzdWZmaWNpZW50IGZvcm0pIGluIHRoZSBwYXRj
aCBkZXNjcmlwdGlvbi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
