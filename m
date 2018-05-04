From: "Kang, Luwei" <luwei.kang@intel.com>
Subject: Re: [PATCH RESEND v1 6/7] x86: Implement Intel
 Processor Trace MSRs read/write
Date: Fri, 4 May 2018 03:53:10 +0000
Message-ID: <82D7661F83C1A047AF7DC287873BF1E167F6F069@SHSMSX101.ccr.corp.intel.com>
References: <1516039953-2988-1-git-send-email-luwei.kang@intel.com>
 <1516039953-2988-7-git-send-email-luwei.kang@intel.com>
 <5AE3170702000078001BF1BE@prv1-mh.provo.novell.com>
 <82D7661F83C1A047AF7DC287873BF1E167F6D582@SHSMSX101.ccr.corp.intel.com>
 <5AEABB5802000078001C05AD@prv1-mh.provo.novell.com>
 <82D7661F83C1A047AF7DC287873BF1E167F6DB20@SHSMSX101.ccr.corp.intel.com>
 <5AEAF44802000078001C06B8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AEAF44802000078001C06B8@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiA+ICAgICAgVGhhbmtzIGZvciB5b3VyIGNsYXJpZmljYXRpb24uIFBsZWFzZSBjb3JyZWN0IG1l
IGlmIEkgaGF2ZQo+ID4gc29tZXRoaW5nIHdyb25nLiBHdWVzdCBtYXkgZXhlY3V0ZSBhbiBpbnN0
cnVjdGlvbiBhbmQgdGhpcyBpbnN0cnVjdGlvbgo+ID4gbWF5IHByb2R1Y2UgYW4gUFQgcGFja2V0
IHNhdmUgaW4gUFQgb3V0cHV0IGJ1ZmZlci4gQW4gRVBUIHZpb2xhdGlvbgo+ID4gd2lsbCBiZSBn
ZW5lcmF0ZWQgaWYgdGhlIGFkZHJlc3Mgb2YgdGhpcyBQVCBidWZmZXIgZG9uJ3QgaGF2ZSBFUFQg
cGFnZQo+ID4gdGFibGUgbWFwcGluZywgYnV0IHRoaXMgRVBUIHZpb2xhdGlvbnMgc2hvdWxkbid0
IGJlIGhhbmRsZWQgYnkKPiA+IHg4Nl9lbXVsYXRlKCkgYmVjYXVzZSBpdCBubyByZWxhdGUgd2l0
aCB0aGUgZXhlY3V0ZSBvZiB0aGlzIGluc3RydWN0aW9uLgo+IAo+IFBsdXMgLSBhbmQgdGhhdCdz
IHZlcnkgaW1wb3J0YW50IC0gdGhlIEVQVCB2aW9sYXRpb24gbWF5IGJlIHJlcG9ydGVkIG9uIHNv
bWUgbGF0ZXIgaW5zbi4KCkhpIEphbiwKWW91IG1lYW4gdGhlICJsYXRlciBpbnN0cnVjdGlvbiIg
aXMgc29tZSBuZXcgaW5zdHJ1Y3Rpb24gaW4gZnV0dXJlIGhhcmR3YXJlPyAgSXMgdGhlcmUgaGF2
ZSBzb21ldGhpbmcgbmVlZCB3ZSBhdHRlbnRpb24gb3IgYW55IGRpZmZlcmVudCB3aXRoIGN1cnJl
bnQgaW5zdHJ1Y3Rpb24gd2hpY2ggY2FuIGxlYWQgRVBUIHZpb2xhdGlvbj8gU29ycnksIEkgZGlk
bid0IGNhdGNoIHlvdXIgY29uY2Vybi4gCgo+IAo+ID4gICAgICBJbiB0aGF0IGNhc2UsIGNhbiB3
ZSBidWlsZCB0aGUgRVBUIG1hcCB3aGVuIHNldCB0aGUgb3V0cHV0IGJ1ZmZlcgo+ID4gYWRkcmVz
cyAoSUEzMl9SVElUX09VVFBVVF9CQVNFKSBhbmQgY3Jhc2ggdGhlIGd1ZXN0IGlmIHN0aWxsIGhh
cHBlbmVkCj4gPiBFUFQgdmlvbGF0aW9uIHdpdGggSW50ZWwgUFQgb3V0cHV0IGJ1ZmZlciByZWFk
L3dyaXRlIGV4aXQKPiA+IHF1YWxpZmljYXRpb24uIE9yIGFkZCBhbiBleGl0IHF1YWxpZmljYXRp
b24gY2hlY2sgYmVmb3JlIGluc3RydWN0aW9uIGVtdWxhdGlvbj8KPiAKPiBJbW8geW91IHNob3Vs
ZCBhZGQgYW4gZXhpdCBxdWFsaWZpY2F0aW9uIGNoZWNrIGluIGFueSBjYXNlLiBEZXBlbmRpbmcg
d2hhdCBlbHNlIHlvdSBkbywgZmluZGluZyB0aGUgbmV3IGJpdCBzZXQgbWF5IGltcGx5IGNyYXNo
aW5nCj4gdGhlIGRvbWFpbiBvciBkb2luZyBzb21ldGhpbmcgbW9yZSBzb3BoaXN0aWNhdGVkLgoK
RG8geW91IG1lYW4gYWRkIHRoaXMgY2hlY2sgYXQgdGhlIGJlZ2lubmluZyBvZiBhbnkgc3BlY2lm
aWMgImV4aXRfcmVhc29uIiBoYW5kbGVyIGluIHZteF92bWV4aXRfaGFuZGxlcigpIGZ1bmN0aW9u
PwpBbm90aGVyIHF1ZXN0aW9uIGlzIHdoZXJlIHRvIGJ1aWxkIHRoaXMgRVBUIG1hcHBpbmc/IFNl
dHRpbmcgSUEzMl9SVElUX09VVFBVVF9CQVNFIG9yIGhhbmRsZWQgYnkgRVBUIHZpb2xhdGlvbj8K
ClRoYW5rcywKTHV3ZWkgS2FuZwoKPiAKPiBKYW4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
