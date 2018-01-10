From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH RFC v1 61/74] xen/pvshim: support vCPU
	hotplug
Date: Wed, 10 Jan 2018 13:07:52 +0000
Message-ID: <20180110130752.ns7uyk7454ubjca7@MacBook-Pro-de-Roger.local>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-62-wei.liu2@citrix.com>
 <5A54A496020000780019C9B5@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=8asd=ef=citrix.com=prvs=541767f32=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eZGFs-0005hj-ST
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 13:17:20 +0000
Content-Disposition: inline
In-Reply-To: <5A54A496020000780019C9B5@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMDksIDIwMTggYXQgMDM6MTY6MzhBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBAQCAtMTMwMywyMiArMTMyMCwyMCBAQCBsb25nIGRvX3ZjcHVfb3AoaW50IGNtZCwg
dW5zaWduZWQgaW50IHZjcHVpZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpCj4g
PiAgCj4gPiAgICAgICAgICBicmVhazsKPiA+ICAKPiA+IC0gICAgY2FzZSBWQ1BVT1BfdXA6IHsK
PiA+IC0gICAgICAgIGJvb2xfdCB3YWtlID0gMDsKPiA+IC0gICAgICAgIGRvbWFpbl9sb2NrKGQp
Owo+ID4gLSAgICAgICAgaWYgKCAhdi0+aXNfaW5pdGlhbGlzZWQgKQo+ID4gLSAgICAgICAgICAg
IHJjID0gLUVJTlZBTDsKPiAKPiBTaG91bGRuJ3QgdGhpcyBjaGVjayByZW1haW4gaGVyZT8gSSBy
ZWFsaXplIHRoaXMgd2lsbCBjb21wbGljYXRlCj4gbG9ja2luZyAobHVja2lseSB0aGUgZG9tYWlu
IGxvY2sgaXMgYSByZWN1cnNpdmUgb25lLCBzbyBpdCBzaG91bGRuJ3QKPiBiZSB0b28gYmFkKSwg
YnV0IEkgZG9uJ3QgdGhpbmsgcHZfc2hpbV9jcHVfdXAoKSBjYW4gdG9sZXJhdGUgZmFpbGluZwo+
IGJlY2F1c2Ugb2YgdmNwdV91cCgpIGZhaWxpbmcuCj4gCj4gSSBhbHNvIHRoaW5rIHRoYXQgdGhl
IHVzZSBvZiAibG9uZyIgZm9yIHJldHVybiB0eXBlcyBhbmQgdmFsdWVzIGlzbid0Cj4gcmVhbGx5
IHdhcnJhbnRlZCBoZXJlLCBhbmQgdGhlcmUncyBhbHNvIG5vIHZpc2libGUgdG8gbWUgcmVhc29u
IHRvCj4gc3BlY2lhbCBjYXNlIENQVTAgaGVyZS4gQnV0IGZvciBzaW1wbGljaXR5IHJlYXNvbnMg
SSBjYW4gc2VlIHdoeQo+IHlvdSd2ZSBjaG9zZW4gdGhhdCBvcHRpb247IG90b2ggdGhlIGxvY2tp
bmcgaXNzdWUgYWJvdmUgdGhhdCB5b3UnbGwKPiBuZWVkIHRvIHNvbHZlIG1pZ2h0IGJlIGVhc2ll
ciB0byBkZWFsIHdpdGggaWYgeW91IGRpZG4ndCBzd2l0Y2ggQ1BVcwo+IGZvciBoeXBlcmNhbGwg
cHJvY2Vzc2luZyAod2l0aG91dCBkcm9wcGluZyB0aGUgdXNlIG9mCj4gY29udGludWVfaHlwZXJj
YWxsX29uX2NwdSgpKS4KClJpZ2h0LCBJJ20gbm90IHN1cmUgd2h5IGJyaW5naW5nIGEgQ1BVIHVw
IGlzIHJlcXVpcmVkIHRvIGhhcHBlbiBvbgpDUFUwLCBidXQgdGhhdCdzIHdoYXQgdGhlIGN1cnJl
bnQgY29kZSBpbiBhcmNoX2RvX3N5c2N0bCBkb2VzLgoKSSdtIG5vdCBzdXJlIEknbSBmb2xsb3dp
bmcgdGhlIGxhc3QgcGFydCBvZiB5b3VyIHJlcGx5LCBpZiBmb3IgQ1BVCmJyaW5ndXAgdGhlcmUn
cyBubyBuZWVkIHRvIHN3aXRjaCB0byBDUFUwLCB3aHkgd291bGQgSSB3YW50IHRvIGtlZXAKdGhl
IGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUgZm9yIGluIHRoYXQgY2FzZT8KClRoYW5rcywgUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
