From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 3/4] x86: fix indirect thunk usage of
 CONFIG_INDIRECT_THUNK
Date: Tue, 20 Feb 2018 04:13:42 -0700
Message-ID: <5A8C10F602000078001A9895@prv-mh.provo.novell.com>
References: <20180219141620.20008-1-roger.pau@citrix.com>
 <20180219141620.20008-4-roger.pau@citrix.com>
 <5A8BF53C02000078001A97CE@prv-mh.provo.novell.com>
 <20180220101916.ve5gcjq6c53tkiey@MacBook-Pro-de-Roger.local>
 <20180220110108.tsekpststokuw5mo@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wunw=fo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eo5rs-0000jn-Mi
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 11:13:52 +0000
In-Reply-To: <20180220110108.tsekpststokuw5mo@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAyLjE4IGF0IDEyOjAxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvYXNtX2RlZm5zLmgKPiArKysgYi94ZW4vaW5jbHVk
ZS9hc20teDg2L2FzbV9kZWZucy5oCj4gQEAgLTE1LDYgKzE1LDkgQEAKPiAgI2luY2x1ZGUgPGFz
bS9hbHRlcm5hdGl2ZS5oPgo+IAo+ICAjaWZkZWYgX19BU1NFTUJMWV9fCj4gKyNpZm5kZWYgQ09O
RklHX0lORElSRUNUX1RIVU5LCj4gKy5lcXUgQ09ORklHX0lORElSRUNUX1RIVU5LLCAwCj4gKyNl
bmRpZgo+ICAjIGluY2x1ZGUgPGFzbS9pbmRpcmVjdF90aHVua19hc20uaD4KPiAgI2Vsc2UKPiAg
YXNtICggIlx0LmVxdSBDT05GSUdfSU5ESVJFQ1RfVEhVTkssICIKPiAKPiBJdCdzIGZhaXJseSBz
aW1pbGFyIHRvIG15IGZpcnN0IGFwcHJvYWNoLCBidXQgYXQgbGVhc3QgIiNpZmRlZgo+IENPTkZJ
R19JTkRJUkVDVF9USFVOSyIgd2lsbCBzdGlsbCB3b3JrIGFzIGV4cGVjdGVkIGFmdGVyIHRoaXMg
Zml4LgoKSSd2ZSB1c2VkIHNvbWV0aGluZyBzaW1pbGFyIGluIGJhY2twb3J0cyB0byBvbGQgdmVy
c2lvbnMsIHNvIEkKd29uZGVyIHdoZXRoZXIgd2hhdCB5b3UgcXVvdGUgYWJvdmUgaXMgcmlnaHQ6
IEFzc2VtYmx5IGZpbGVzCmRvbid0IGdldCBoYW5kZWQgdG8gY2xhbmcgYW55d2F5IGlpcmMsIHNv
IHRoZSBjaGFuZ2Ugd291bGQKc2VlbSB0byBiZSBuZWVkZWQgaW4gdGhlICNlbHNlIHBhcnQgb2Yg
dGhlIGNvbmRpdGlvbmFsLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
