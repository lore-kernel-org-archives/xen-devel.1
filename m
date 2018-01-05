From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 25/74] x86/shutdown: Support for
 using SCHEDOP_{shutdown, reboot}
Date: Fri, 05 Jan 2018 07:01:35 -0700
Message-ID: <5A4F934F020000780019B643@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-26-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ivak=ea=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eXSZ4-0000A5-91
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 14:01:42 +0000
In-Reply-To: <20180104130625.28605-26-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, wei.liu2@citrix.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgp3aXRoIHR3byByZW1hcmtzOgoKPiAtLS0g
YS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVyY2FsbC5oCj4gKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcmNhbGwuaAo+IEBAIC0xOSw2ICsxOSwxMSBAQAo+ICAjaWZu
ZGVmIF9fWDg2X1hFTl9IWVBFUkNBTExfSF9fCj4gICNkZWZpbmUgX19YODZfWEVOX0hZUEVSQ0FM
TF9IX18KPiAgCj4gKyNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KPiArCj4gKyNpbmNsdWRlIDxwdWJs
aWMveGVuLmg+Cj4gKyNpbmNsdWRlIDxwdWJsaWMvc2NoZWQuaD4KPiArCj4gICNpZmRlZiBDT05G
SUdfWEVOX0dVRVNUCgpXaHkgZG8geW91ICNpbmNsdWRlIGFoZWFkIG9mIHRoZSAjaWZkZWY/Cgo+
IEBAIC03OCw2ICs4MywzMCBAQAo+ICAgICAgICAgICh0eXBlKXJlczsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICB9KQo+ICAKPiAr
LyoKPiArICogUHJpbWl0aXZlIEh5cGVyY2FsbCB3cmFwcGVycwo+ICsgKi8KPiArc3RhdGljIGlu
bGluZSBsb25nIHhlbl9oeXBlcmNhbGxfc2NoZWRfb3AodW5zaWduZWQgaW50IGNtZCwgdm9pZCAq
YXJnKQo+ICt7Cj4gKyAgICByZXR1cm4gX2h5cGVyY2FsbDY0XzIobG9uZywgX19IWVBFUlZJU09S
X3NjaGVkX29wLCBjbWQsIGFyZyk7Cj4gK30KPiArCj4gKy8qCj4gKyAqIEhpZ2hlciBsZXZlbCBo
eXBlcmNhbGwgaGVscGVycwo+ICsgKi8KPiArc3RhdGljIGlubGluZSBsb25nIHhlbl9oeXBlcmNh
bGxfc2h1dGRvd24odW5zaWduZWQgaW50IHJlYXNvbikKPiArewo+ICsgICAgcmV0dXJuIHhlbl9o
eXBlcmNhbGxfc2NoZWRfb3AoU0NIRURPUF9zaHV0ZG93biwgJnJlYXNvbik7CgpJdCB3b3VsZCBz
ZWVtIG1vcmUgY29ycmVjdCBpZiB5b3Ugd2VudCB0aHJvdWdoIHN0cnVjdApzY2hlZF9zaHV0ZG93
biBoZXJlLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
