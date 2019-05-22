From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v4 1/2] x86/emulate: Move
 hvmemul_linear_to_phys
Date: Wed, 22 May 2019 14:55:08 +0100
Message-ID: <7924f83e-59b5-432d-06b8-d3b57c536c97@citrix.com>
References: <20190520125454.14805-1-aisaila@bitdefender.com>
 <153d4f7da0a24805bb7112f6ff2beb80@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pibO=TW=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hTRi6-0002IL-W1
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 13:55:15 +0000
In-Reply-To: <153d4f7da0a24805bb7112f6ff2beb80@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Alexandru Stefan ISAILA' <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS8yMi8xOSAyOjEzIFBNLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4+IEZyb206IEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIFttYWlsdG86YWlz
YWlsYUBiaXRkZWZlbmRlci5jb21dCj4+IFNlbnQ6IDIwIE1heSAyMDE5IDEzOjU1Cj4+IFRvOiB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPj4gQ2M6IFBhdWwgRHVycmFudCA8UGF1bC5E
dXJyYW50QGNpdHJpeC5jb20+OyBqYmV1bGljaEBzdXNlLmNvbTsgQW5kcmV3IENvb3Blcgo+PiA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
OyBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsKPj4gcmNvam9jYXJ1QGJp
dGRlZmVuZGVyLmNvbTsgdGFtYXNAdGtsZW5neWVsLmNvbTsgR2VvcmdlIER1bmxhcCA8R2Vvcmdl
LkR1bmxhcEBjaXRyaXguY29tPjsgQWxleGFuZHJ1Cj4+IFN0ZWZhbiBJU0FJTEEgPGFpc2FpbGFA
Yml0ZGVmZW5kZXIuY29tPgo+PiBTdWJqZWN0OiBbUEFUQ0ggdjQgMS8yXSB4ODYvZW11bGF0ZTog
TW92ZSBodm1lbXVsX2xpbmVhcl90b19waHlzCj4+Cj4+IFRoaWlzIGlzIGRvbmUgc28gaHZtZW11
bF9saW5lYXJfdG9fcGh5cygpIGNhbiBiZSBjYWxsZWQgZnJvbQo+PiBodm1lbXVsX3NlbmRfdm1f
ZXZlbnQoKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBi
aXRkZWZlbmRlci5jb20+Cj4+IC0tLQo+PiAgeGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMgfCAx
ODEgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5n
ZWQsIDkwIGluc2VydGlvbnMoKyksIDkxIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMgYi94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYwo+
PiBpbmRleCA4NjU5Yzg5ODYyLi4yNTRmZjY1MTVkIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC94
ODYvaHZtL2VtdWxhdGUuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYwo+PiBA
QCAtNTMwLDYgKzUzMCw5NSBAQCBzdGF0aWMgaW50IGh2bWVtdWxfZG9fbW1pb19hZGRyKHBhZGRy
X3QgbW1pb19ncGEsCj4+ICAgICAgcmV0dXJuIGh2bWVtdWxfZG9faW9fYWRkcigxLCBtbWlvX2dw
YSwgcmVwcywgc2l6ZSwgZGlyLCBkZiwgcmFtX2dwYSk7Cj4+ICB9Cj4+Cj4gCj4gSSBrbm93IHRo
aXMgaXMgY29kZSBtb3ZlbWVudCwgYnV0IGl0IHdvdWxkIHByb2JhYmx5IGdvb2QgdG8gYSBkbyBh
IGJpdCBvZiB0aWR5aW5nLi4uCgpJIHRoaW5rIHRoZXJlIGFyZSBkaWZmZXJlbnQgbWluZHMgb24g
dGhpczsgSSAqZ2VuZXJhbGx5KiBwcmVmZXIgcHVyZQpjb2RlIG1vdmVtZW50IHRvIGJlIHdpdGgg
YXMgZmV3IGNoYW5nZXMgYXMgcG9zc2libGUsIHRvIG1ha2Ugc3VyZSBhY3R1YWwKY2hhbmdlcyBh
cmUgZWFzeSB0byBjYWxsIG91dC4KClRoZSBjaGFuZ2VzIHlvdSd2ZSBhc2tlZCBmb3IgYXJlIHBy
ZXR0eSBtaW5vciAoYW5kIHlvdSdyZSB0aGUgbWFpbnRhaW5lcgpvZiB0aGUgZmlsZSBpdCdzIGJl
aW5nIG1vdmVkIHRvKSwgc28gSSB3b24ndCBhcmd1ZSBhYm91dCBpdCBpbiB0aGlzCnBhcnRpY3Vs
YXIgY2FzZS4gIEp1c3Qgd2FudCB0byBjb3VudGVyIHRoZSBpZGVhIHRoYXQgbW92ZSArIGNoYW5n
ZSBpcwp0aGUgbm9ybS4gOi0pCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
