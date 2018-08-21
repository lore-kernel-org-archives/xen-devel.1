From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 2/2] x86/dmar: zap DMAR signature for
 dom0 once in TBOOT case
Date: Tue, 21 Aug 2018 06:31:59 -0600
Message-ID: <5B7C063F02000078001E07C1@prv1-mh.provo.novell.com>
References: <9dfa7b11-c451-482d-98db-9f6cdb7cd2fa@default>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <9dfa7b11-c451-482d-98db-9f6cdb7cd2fa@default>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-Devel <xen-devel@lists.xen.org>, Shane Wang <shane.wang@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>, Gang Wei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA4LjE4IGF0IDExOjExLCA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4gd3Jv
dGU6Cj4gQEAgLTQ5MCwxMCArNDg4LDYgQEAgaW50IF9faW5pdCB0Ym9vdF9wYXJzZV9kbWFyX3Rh
YmxlKGFjcGlfdGFibGVfaGFuZGxlciBkbWFyX2hhbmRsZXIpCj4gICAgICByYyA9IGRtYXJfaGFu
ZGxlcihkbWFyX3RhYmxlKTsKPiAgICAgIHhmcmVlKGRtYXJfdGFibGUpOwo+ICAKPiAtICAgIC8q
IGFjcGlfcGFyc2VfZG1hcigpIHphcHMgQVBDSSBETUFSIHNpZ25hdHVyZSBpbiBUWFQgaGVhcCB0
YWJsZSAqLwo+IC0gICAgLyogYnV0IGRvbTAgd2lsbCByZWFkIHJlYWwgdGFibGUsIHNvIG11c3Qg
emFwIGl0IHRoZXJlIHRvbyAqLwo+IC0gICAgYWNwaV9kbWFyX3phcCgpOwoKSW50ZXJlc3Rpbmcg
LSBub3cgeW91IHJlbW92ZSB0aGUgb3RoZXIgb25lLiBJIHRoaW5rIHRoaXMgaXMgYWN0dWFsbHkg
Y29ycmVjdCwKYnV0IHVuZGVyc3RhbmRpbmcgd2h5IGNvdWxkIF9hZ2Fpbl8gaGF2ZSBiZWVuIGEg
bG90IGVhc2llciB3aXRoIGEgYmV0dGVyCmRlc2NyaXB0aW9uLiBBZmFpY3QgY29tbWl0IDZjMjk4
ZWNjMWYgKCJ2dGQ6IFJlaW5zdGF0ZSBBQ1BJIERNQVIgb24Kc3lzdGVtIHNodXRkb3duIG9yIFMz
L1M0L1M1IikgZGlkIGV2ZXJ5dGhpbmcgZm9yIHRoaXMgY2FsbCB0byBiZQp1bm5lY2Vzc2FyeSwg
ZXhjZXB0IGZvciBpbnZva2luZyB0aGUgZnVuY3Rpb24gZnJvbSBhY3BpX3BhcnNlX2RtYXIoKSwK
d2hpY2ggMTIzYzc3OTM3OSAoIlZUZC9kbWFyOiBUd2VhayBob3cgdGhlIERNQVIgdGFibGUgaXMg
Y2xvYmJlcmVkIikKYWRkZWQgc2V2ZXJhbCB5ZWFycyBsYXRlci4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
