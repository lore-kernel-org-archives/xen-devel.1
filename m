From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 07/10] x86: Add Intel Processor Trace
 MSRs read/write emulation
Date: Tue, 03 Jul 2018 06:10:13 -0600
Message-ID: <5B3B67A502000078001D046C@prv1-mh.provo.novell.com>
References: <1527686884-5917-1-git-send-email-luwei.kang@intel.com>
 <1527686884-5917-8-git-send-email-luwei.kang@intel.com>
 <5B36465D02000078001CF3B3@prv1-mh.provo.novell.com>
 <82D7661F83C1A047AF7DC287873BF1E1680481EE@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <82D7661F83C1A047AF7DC287873BF1E1680481EE@SHSMSX101.ccr.corp.intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Luwei Kang <luwei.kang@intel.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA3LjE4IGF0IDEyOjE4LCA8bHV3ZWkua2FuZ0BpbnRlbC5jb20+IHdyb3RlOgo+
PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCj4+ID4gKysrIGIveGVuL2FyY2gv
eDg2L2h2bS92bXgvdm14LmMKPj4gPiBAQCAtMjg5OCw2ICsyODk4LDE1IEBAIHN0YXRpYyBpbnQg
dm14X21zcl9yZWFkX2ludGVyY2VwdCh1bnNpZ25lZCBpbnQKPj4gPiBtc3IsIHVpbnQ2NF90ICpt
c3JfY29udGVudCkKPj4gPiAgICAgICAgICBpZiAoIHZwbXVfZG9fcmRtc3IobXNyLCBtc3JfY29u
dGVudCkgKQo+PiA+ICAgICAgICAgICAgICBnb3RvIGdwX2ZhdWx0Owo+PiA+ICAgICAgICAgIGJy
ZWFrOwo+PiA+ICsgICAgY2FzZSBNU1JfSUEzMl9SVElUX0NUTDoKPj4gPiArICAgIGNhc2UgTVNS
X0lBMzJfUlRJVF9TVEFUVVM6Cj4+ID4gKyAgICBjYXNlIE1TUl9JQTMyX1JUSVRfT1VUUFVUX0JB
U0U6Cj4+ID4gKyAgICBjYXNlIE1TUl9JQTMyX1JUSVRfT1VUUFVUX01BU0s6Cj4+ID4gKyAgICBj
YXNlIE1TUl9JQTMyX1JUSVRfQ1IzX01BVENIOgo+PiA+ICsgICAgY2FzZSBNU1JfSUEzMl9SVElU
X0FERFJfQSgwKSAuLi4gTVNSX0lBMzJfUlRJVF9BRERSX0IoMyk6Cj4+IAo+PiBJcyB0aGUgMyBo
ZXJlIGFuIGFyY2hpdGVjdHVyYWwgbGltaXQ/IE90aGVyd2lzZSB5b3Ugd2FudCB0byB1c2UgYSBo
aWdoZXIgCj4gbnVtYmVyIGhlcmUgYW5kIHJlbHkgb24gdGhlIGNhbGxlZSB0byBkbyB0aGUgZnVs
bCBjaGVja2luZy4KPj4gCj4gCj4gIjMiIGlzIHRoZSBtYXggbnVtYmVyIG9mIGFkZHJlc3MgcmFu
Z2VzIHdoaWNoIEkgY2FuIGZpbmQgaW4gc3BlYy4gVGhlIG51bWJlciAKPiBvZiBhZGRyZXNzIHJh
bmdlcyBpcyBnZXQgZnJvbSBDUFVJRCBpbmZvLiBXaWxsIGZpeCBpdC4KClF1ZXN0aW9uIGlzIHdo
YXQgdGhlIGxhcmdlc3QgbnVtYmVyIGlzIHRoYXQgdGhlIGRlc2lnbmF0ZWQgQ1BVSUQgb3V0cHV0
CmZpZWxkIGNhbiBob2xkLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
