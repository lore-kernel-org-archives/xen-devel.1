From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 06/17] x86: provide stub for
 arch_do_multicall_call
Date: Fri, 12 Oct 2018 07:56:10 -0600
Message-ID: <5BC0A7FA02000078001F1065@prv1-mh.provo.novell.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
 <482857ce97ac3334e628f89b6c2d72c3c142f4e3.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tlq1=my=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gAxvL-0002eT-30
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 13:56:15 +0000
In-Reply-To: <482857ce97ac3334e628f89b6c2d72c3c142f4e3.1538667753.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjEwLjE4IGF0IDE3OjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L2h5cGVyY2FsbC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h5cGVy
Y2FsbC5jCj4gQEAgLTI0OCw2ICsyNDgsMTUgQEAgaW50IGh5cGVyY2FsbF94bGF0X2NvbnRpbnVh
dGlvbih1bnNpZ25lZCBpbnQgKmlkLCB1bnNpZ25lZCBpbnQgbnIsCj4gICAgICByZXR1cm4gcmM7
Cj4gIH0KPiAgCj4gKyNpZm5kZWYgQ09ORklHX1BWCj4gKy8qIFN0dWIgZm9yIGFyY2hfZG9fbXVs
dGljYWxsX2NhbGwgKi8KPiArZW51bSBtY19kaXNwb3NpdGlvbiBhcmNoX2RvX211bHRpY2FsbF9j
YWxsKHN0cnVjdCBtY19zdGF0ZSAqbWMpCj4gK3sKPiArICAgIHJldHVybiBtY19leGl0Owo+ICt9
Cj4gKwo+ICsjZW5kaWYKClBsZWFzZSBkcm9wIHRoZSBibGFuayBsaW5lIGFib3ZlIGhlcmUuIEZv
ciB0aGUgbW9tZW50IEknbSBmaW5lLCBzbwpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgpidXQgSSByZWFsbHkgdGhpbmsgSFZNIHNob3VsZCBnYWluIG11bHRpY2FsbCBz
dXBwb3J0LCBzZWVpbmcgdGhhdCBBUk0KaGFzIHRoaXMgYXMgd2VsbC4gQXQgdGhhdCBwb2ludCwg
dGhlICNpZmRlZiBhYm92ZSB3aWxsIHN0YXJ0IHRvIGxvb2sgYQpsaXR0bGUgZnVubnkuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
