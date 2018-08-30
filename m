From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 7/7] x86/hvm: Drop hvm_{vmx,svm} shorthands
Date: Fri, 31 Aug 2018 00:18:14 +0100
Message-ID: <99a87e41-0929-c52d-4903-83b166778a7c@citrix.com>
References: <1535477946-17892-1-git-send-email-andrew.cooper3@citrix.com>
 <1535477946-17892-8-git-send-email-andrew.cooper3@citrix.com>
 <b47d0426-de6d-a042-26d8-db36a6e7e5dc@oracle.com>
 <8155dfed-e90b-c6d0-2205-c5543d9833e9@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <8155dfed-e90b-c6d0-2205-c5543d9833e9@oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <george.dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDgvMTggMDA6MTQsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAwOC8zMC8yMDE4
IDA3OjExIFBNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IE9uIDA4LzI4LzIwMTggMDE6Mzkg
UE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBCeSBtYWtpbmcge3ZteCxzdm19IGluIGh2bV92
Y3B1IGludG8gYW4gYW5vbnltb3VzIHVuaW9uIChjb25zaXN0ZW50IHdpdGgKPj4+IGRvbWFpbiBz
aWRlIG9mIHRoaW5ncyksIHRoZSBodm1fe3ZteCxzdm19IGRlZmluZXMgY2FuIGJlIGRyb3BwZWQs
IGFuZCBhbGwgY29kZQo+Pj4gcmVmZXIgdG8gdGhlIGNvcnJlY3RseS1uYW1lZCBmaWVsZHMuICBU
aGlzIG1lYW5zIHRoYXQgdGhlIGRhdGEgaGllcmFjaHkgaXMgbm8KPj4+IGxvbmdlciBvYnNjdXJl
ZCBmcm9tIGdyZXAvY3Njb3BlL3RhZ3MvZXRjLgo+Pj4KPj4+IFJlZm9ybWF0IG9uZSBjb21tZW50
IGFuZCBzd2l0Y2ggb25lIGJvb2xfdCB0byBib29sIHdoaWxlIG1ha2luZyBjaGFuZ2VzLgo+Pj4K
Pj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+Pgo+PiBEbyB3ZSBzdGlsbCBzdXBw
b3J0IHByZS00LjYgZ2NjPyAKPiBPciA0LjQuNj8gSSBkb24ndCByZW1lbWJlci4KCkknbSBhd2Fy
ZSBvZiB0aGF0IGJ1ZyBhbmQgaXQgaXMgNC42IGlpcmMuCgpIb3dldmVyLCBpbiB0aGlzIGNhc2Ug
dGhlcmUgYXJlIG5vIGluaXRpYWxpc2Vycy7CoCBUaGUgbWVtb3J5IHN0YXJ0cyBvZmYKYXMgYSB6
ZXJvZWQgaGVhcCBwYWdlIGFuZCBoYXMgYSBwbGV0aG9yYSBvZiBpbml0KCkgZnVuY3Rpb25zIGNh
bGwgb24gaXQKdG8gc2V0IHRoaW5ncyB1cC4KCj4KPiAtYm9yaXMKPgo+Cj4+IFRoZXkgaGF2ZSBh
IGJ1ZyB0aGF0IGRvZXNuJ3QgYWxsb3cKPj4gaW5pdGlhbGl6ZXJzIGZvciBhbm9ueW1vdXMgc3Ry
dWN0cy91bmlvbnMuIEkgZG9uJ3Qga25vdyB3aGV0aGVyIHdlIGhhdmUKPj4gYW55IGZvciB2bXgv
c3ZtLCBidXQgSSB0aG91Z2h0IEknZCBtZW50aW9uIHRoaXMganVzdCBpbiBjYXNlLgo+Pgo+PiBP
dGhlciB0aGFuIHRoYXQsIGZvciBTVk0gYml0cyBpbiBwYXRjaGVzIDMsNCw2IGFuZCA3Cj4+Cj4+
IFJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29t
PgoKVGhhbmtzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
