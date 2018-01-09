From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 65/74] xen/shim: crash instead of
 reboot in shim mode
Date: Tue, 09 Jan 2018 03:52:23 -0700
Message-ID: <5A54ACF7020000780019CA0D@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-66-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=o7xp=ee=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eYrWB-0007KB-IA
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 10:52:31 +0000
In-Reply-To: <20180104130625.28605-66-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, wei.liu2@citrix.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
RnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBBbGwgZ3Vl
c3Qgc2h1dGRvd24gb3BlcmF0aW9ucyBhcmUgZm9yd2FyZGVkIHRvIEwwLCBzbyB0aGUgb25seSBu
YXRpdmUKPiBjYWxscyB0byBtYWNoaW5lX3Jlc3RhcnQgaGFwcGVuIGZyb20gY3Jhc2ggcmVsYXRl
ZCBwYXRocyBpbnNpZGUgdGhlCj4gaHlwZXJ2aXNvciwgaGVuY2Ugc3dpdGNoIHRoZSByZWJvb3Qg
Y29kZSB0byBpbnN0ZWFkIGlzc3VlIGEgY3Jhc2gKPiBzaHV0ZG93bi4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CnByZWZlcmFibHkgd2l0aCAuLi4KCj4gLS0t
IGEveGVuL2FyY2gveDg2L3NodXRkb3duLmMKPiArKysgYi94ZW4vYXJjaC94ODYvc2h1dGRvd24u
Ywo+IEBAIC02NDIsNiArNjQyLDEzIEBAIHZvaWQgbWFjaGluZV9yZXN0YXJ0KHVuc2lnbmVkIGlu
dCBkZWxheV9taWxsaXNlY3MpCj4gICAgICAgICAgICAgIGJyZWFrOwo+ICAKPiAgICAgICAgICBj
YXNlIEJPT1RfWEVOOgo+ICsgICAgICAgICAgICBpZiAoIHB2X3NoaW0gKQo+ICsgICAgICAgICAg
ICAgICAgLyoKPiArICAgICAgICAgICAgICAgICAqIFdoZW4gcnVubmluZyBpbiBQViBzaGltIG1v
ZGUgZ3Vlc3Qgc2h1dGRvd24gY2FsbHMgYXJlCj4gKyAgICAgICAgICAgICAgICAgKiBmb3J3YXJk
ZWQgdG8gTDAsIGhlbmNlIHRoZSBvbmx5IHdheSB0byBnZXQgaGVyZSBpcyBpZiBhCj4gKyAgICAg
ICAgICAgICAgICAgKiBzaGltIGNyYXNoIGhhcHBlbnMuCj4gKyAgICAgICAgICAgICAgICAgKi8K
PiArICAgICAgICAgICAgICAgIHhlbl9oeXBlcmNhbGxfc2h1dGRvd24oU0hVVERPV05fY3Jhc2gp
Owo+ICAgICAgICAgICAgICB4ZW5faHlwZXJjYWxsX3NodXRkb3duKFNIVVRET1dOX3JlYm9vdCk7
CgouLi4gdGhpcyBtYWRlCgogICAgICAgICAgICAgeGVuX2h5cGVyY2FsbF9zaHV0ZG93bihwdl9z
aGltID8gU0hVVERPV05fY3Jhc2ggOiBTSFVURE9XTl9yZWJvb3QpOwoKKHN1aXRhYmx5IGxpbmUg
d3JhcHBlZCkuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
