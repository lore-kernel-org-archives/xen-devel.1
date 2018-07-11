From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] automation: fix builds with clang
Date: Wed, 11 Jul 2018 08:07:44 +0100
Message-ID: <20180711070744.r23cla6im6o7cbox@citrix.com>
References: <20180710225858.22501-1-cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ljl5=j3=citrix.com=prvs=72333fd56=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fd9E3-0004Dc-S7
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 07:07:47 +0000
Content-Disposition: inline
In-Reply-To: <20180710225858.22501-1-cardoe@cardoe.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMTAsIDIwMTggYXQgMDU6NTg6NThQTSAtMDUwMCwgRG91ZyBHb2xkc3RlaW4g
d3JvdGU6Cj4gYTc1NzAzYjJmMGY1ODVhMmZjNmE3YmNkYjdkMTZhNjFiY2Y1ZTZiMCB1bmNvbmRp
dGlvbmFsbHkgZW5hYmxlZAo+IGJ1aWxkaW5nIG9mIHJvbWJpb3MgYW5kIHN0dWJkb21zIGJ1dCB1
bmZvcnR1bmF0ZWx5IHRoZXNlIHR3byBwaWVjZXMgZG8KPiBub3QgYnVpbGQgc3VjY2Vzc2Z1bGx5
IHdpdGggY2xhbmcuIHJvbWJpb3MgdW5jb25kaXRpb25hbGx5IGRlcGVuZHMgb24KPiB0aGUgYnVp
bGQgb2YgaVBYRSBhbmQgdXBzdHJlYW0gaVBYRSBkb2VzIG5vdCBzdXBwb3J0IGJ1aWxkaW5nIHdp
dGgKClRoZSBkZXBlbmRlbmN5IG9mIHJvbWJpb3MgZm9yIGlweGUgd2lsbCBzb29uIGNoYW5nZSAt
LSBJIHdyb3RlIGEgcGF0Y2gKc2VyaWVzIHRvIHByb3ZpZGUgLS13aXRoLXN5c3RlbS1pcHhlLiBE
b2VzIHJvbWJpb3MgYnVpbGQgd2l0aCBjbGFuZz8gSWYKc28gSSB3aWxsIHN1Ym1pdCBhIHBhdGNo
IHRvIGVuYWJsZSByb21iaW9zIGluIHRoZSBmdXR1cmUuCgo+IGNsYW5nLiBTaW1pbGlhcmx5IHRo
ZSBidWlsZCBvZiB0aGUgc3R1YmRvbXMgZGVwZW5kcyBvbiB0aGUgYnVpbGQgb2YKPiBuZXdsaWIg
d2hpY2ggZG9lcyBub3Qgc3VwcG9ydCBiZWluZyBidWlsdCB3aXRoIGNsYW5nLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KCkZvciBub3c6CgpB
Y2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoYW5rcyBmb3IgZml4aW5n
IHRoaXMuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
