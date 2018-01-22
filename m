From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3] xen/shim: stash RSDP address for ACPI
	driver
Date: Mon, 22 Jan 2018 09:55:21 -0700
Message-ID: <5A66258902000078001A1386@prv-mh.provo.novell.com>
References: <20180122162830.13952-1-wei.liu2@citrix.com>
 <20180122163346.t56tun4byfdadl74@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwx6=er=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edfNc-0007Ma-Ha
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 16:55:32 +0000
In-Reply-To: <20180122163346.t56tun4byfdadl74@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAxLjE4IGF0IDE3OjMzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgSmFuIDIyLCAyMDE4IGF0IDA0OjI4OjMwUE0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6
Cj4+IEl0IHVzZWQgdG8gdGhlIGNhc2UgdGhhdCB3ZSBwbGFjZWQgUlNEUCB1bmRlciAxTUIgYW5k
IGxldCBYZW4gc2VhcmNoCj4+IGZvciBpdC4gV2UgbW92ZWQgdGhlIHBsYWNlbWVudCB0byB1bmRl
ciA0R0IgaW4gNGE1NzMzNzcxLCBzbyB0aGUKPj4gc2VhcmNoIHdvdWxkbid0IHdvcmsuCj4+IAo+
PiBJbnRyb2R1Y2UgcnNkcF9oaW50IHRvIEFDUEkgY29kZSBhbmQgc2V0IHRoYXQgdmFyaWFibGUg
aW4KPj4gY29udmVydF9wdmhfaW5mby4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gTEdUTToKPiAKPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
