From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 01/57] tools: ARM: vGICv3: Avoid inserting
 optional DT properties
Date: Mon, 5 Mar 2018 17:18:02 +0000
Message-ID: <20180305171802.nnbxiogt7pgbcisg@citrix.com>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
 <20180305160415.16760-2-andre.przywara@linaro.org>
 <c1084fea-836d-c0d9-edbf-4be72dec3b54@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yt/y=f3=citrix.com=prvs=595ca3bc4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1estkZ-0004YM-Rn
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 17:18:11 +0000
Content-Disposition: inline
In-Reply-To: <c1084fea-836d-c0d9-edbf-4be72dec3b54@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Andre Przywara <andre.przywara@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMDUsIDIwMTggYXQgMDQ6Mzk6MDlQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+ICgrIHRvb2xzIG1haW50YWluZXJzKQo+IAo+IEhpIEFuZHJlLAo+IAo+IFBsZWFzZSBk
b24ndCBmb3JnZXQgdG8gQ0MgdGhlIHJlbGV2YW50IG1haW50YWluZXJzLgo+IAo+IE9uIDA1LzAz
LzE4IDE2OjAzLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiA+IFdoZW4gY3JlYXRpbmcgYSBHSUN2
MyBkZXZpY2V0cmVlIG5vZGUsIHdlIGN1cnJlbnRseSBpbnNlcnQgdGhlCj4gPiByZWRpc3RyaWJ1
dG9yLXN0cmlkZSBhbmQgI3JlZGlzdHJpYnV0b3ItcmVnaW9ucyBwcm9wZXJ0aWVzLCB3aXRoIGZp
eGVkCj4gPiB2YWx1ZXMgd2hpY2ggYXJlIGFjdHVhbGx5IHRoZSBhcmNoaXRlY3RlZCBvbmVzLiBT
aW5jZSB0aG9zZSBwcm9wZXJ0aWVzIGFyZQo+ID4gb3B0aW9uYWwsIGFuZCBpbiB0aGUgY2FzZSBv
ZiB0aGUgc3RyaWRlIG9ubHkgbmVlZGVkIHRvIGNvdmVyIGZvciBicm9rZW4KPiA+IHBsYXRmb3Jt
cywgd2UgZG9uJ3QgbmVlZCB0byBkZXNjcmliZSB0aGVtIGlmIHRoZXkgZG9uJ3QgZGlmZmVyIGZy
b20gdGhlCj4gPiBkZWZhdWx0IHZhbHVlcy4gVGhpcyB3aWxsIGFsd2F5cyBiZSB0aGUgY2FzZSBm
b3Igb3VyIGNvbnN0cnVjdGVkCj4gPiBEb21VIG1lbW9yeSBtYXAuCj4gPiBTbyB3ZSBkcm9wIHRo
b3NlIHByb3BlcnRpZXMgYWx0b2dldGhlciBhbmQgcHJvdmlkZSBhIGNsZWFuIGFuZCBhcmNoaXRl
Y3RlZAo+ID4gR0lDdjMgRFQgbm9kZSBmb3IgRG9tVXMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6
IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPgo+IAo+IFJldmlld2Vk
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IAoKQWNrZWQtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpKdWxpZW4gcGxlYXNlIGNvbW1pdCB0aGlzIHlv
dXJzZWxmLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
