From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3] x86emul/fuzz: add a state sanity
 checking function
Date: Mon, 27 May 2019 11:51:04 +0100
Message-ID: <6fc3c72b-5111-04d0-7ba9-3c7d545c5dc1@citrix.com>
References: <5C9E31960200007800222DDF@prv1-mh.provo.novell.com>
 <5CA35D130200007800223E53@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E92+=T3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hVDDh-0001iY-19
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 10:51:09 +0000
In-Reply-To: <5CA35D130200007800223E53@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8yLzE5IDI6MDEgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoaXMgaXMgdG8gYWNjb21w
YW55IHNhbml0aXplX2lucHV0KCkuIEp1c3QgbGlrZSBmb3IgaW5pdGlhbCBzdGF0ZSB3ZQo+IHdh
bnQgdG8gaGF2ZSBzdGF0ZSBiZXR3ZWVuIHR3byBlbXVsYXRlZCBpbnNucyBzYW5lLCBhdCBsZWFz
dCBhcyBmYXIgYXMKPiBhc3N1bXB0aW9ucyBpbiB0aGUgbWFpbiBlbXVsYXRvciBnby4gRG8gbWlu
aW1hbCBjaGVja2luZyBhZnRlciBzZWdtZW50Cj4gcmVnaXN0ZXIsIENSLCBhbmQgTVNSIHdyaXRl
cywgYW5kIHJvbGwgYmFjayB0byB0aGUgb2xkIHZhbHVlIGluIGNhc2Ugb2YKPiBmYWlsdXJlIChy
YWlzaW5nICNHUCgwKSBhdCB0aGUgc2FtZSB0aW1lKS4KPiAKPiBJbiB0aGUgcGFydGljdWxhciBj
YXNlIG9ic2VydmVkLCBhIENSMCB3cml0ZSBjbGVhcmluZyBDUjAuUEUgd2FzCj4gZm9sbG93ZWQg
YnkgYSBWRVgtZW5jb2RlZCBpbnNuLCB3aGljaCB0aGUgZGVjb2RlciBhY2NlcHRzIGJhc2VkIG9u
Cj4gZ3Vlc3QgYWRkcmVzcyBzaXplLCByZXN0cmljdGluZyB0aGluZ3MganVzdCBvdXRzaWRlIG9m
IHRoZSA2NC1iaXQgY2FzZQo+IChyZWFsIGFuZCB2aXJ0dWFsIG1vZGVzIGRvbid0IGFsbG93IFZF
WC1lbmNvZGVkIGluc25zKS4gU3Vic2VxdWVudGx5Cj4gX2dldF9mcHUoKSB3b3VsZCB0aGVuIGFz
c2VydCB0aGF0IENSMC5QRSBtdXN0IGJlIHNldCAoYW5kIEVGTEFHUy5WTQo+IGNsZWFyKSB3aGVu
IHRyeWluZyB0byBpbnZva2UgWU1NLCBaTU0sIG9yIE9QTUFTSyBzdGF0ZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogR2Vv
cmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKVGhhdCBzYWlkLCBJIHdvbmRl
ciBpZiB0aGVyZSdzIGEgd2F5IHRvIGF2b2lkIHRoZSBkdXBsaWNhdGlvbiBiZXR3ZWVuCnNhbml0
aXplX2lucHV0KCkgYW5kIGNoZWNrX3N0YXRlKCkuICBBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0
byByZXdvcmsKc2FuaXRpemVfaW5wdXQoKSAocGVyaGFwcyBhcyBzYW5peml0ZV9zdGF0ZSgpKToK
ICogQWNjZXB0IGEgcGFyYW1ldGVyIHNheWluZyB3aGV0aGVyIHRvIGRvIG9wdGlvbmFsIGNoYW5n
ZXMgKGxpa2UKQ0FOT05JQ0FMSVpFX01BWUJFKQogKiBSZXR1cm4gYSBib29sZWFuIHNheWluZyB3
aGV0aGVyIGFueSBzdGF0ZSB3YXMgaW4gZmFjdCBzYW5pdGl6ZWQuCgpUaGVuIHRoZSBjdXJyZW50
IGNhbGxlcnMgb2YgY2hlY2tfc3RhdGUoKSBjb3VsZCBpbnN0ZWFkIGNhbGwKc2FuaXRpemVfc3Rh
dGUoKSwgYW5kIHRocm93IGFuIGV4Y2VwdGlvbiBpZiBpdCByZXR1cm5zIDEuICAoT3Igc29tZQp2
YXJpYXRpb24gdGhlcmVvZi4pCgpKdXN0IGEgdGhvdWdodDsgSSdtIE9LIHdpdGggY2hlY2tpbmcg
dGhpcyBpbiBhcyBpdCBpcy4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
