From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [OSSTEST PATCH] README.hardware-acquisition [and 1
 more messages]
Date: Fri, 15 Feb 2019 15:40:30 +0000
Message-ID: <23654.56686.144178.391815@mariner.uk.xensource.com>
References: <20181030161326.17879-1-ian.jackson@eu.citrix.com>
 <18bf9618-d950-8cfa-1746-e330f3ce0e66@arm.com>
 <alpine.DEB.2.10.1810301528180.22840@sstabellini-ThinkPad-X260>
 <23513.52378.653350.705575@mariner.uk.xensource.com>
 <23654.43252.57463.874932@mariner.uk.xensource.com>
 <E90F932F-B8DD-4D74-B69E-3B60982A6EFA@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=flqX=QW=citrix.com=prvs=94288858a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gufba-0001xt-1i
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 15:40:46 +0000
In-Reply-To: <E90F932F-B8DD-4D74-B69E-3B60982A6EFA@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>, "infra@xenproject.org" <infra@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

TGFycyBLdXJ0aCB3cml0ZXMgKCJSZTogW09TU1RFU1QgUEFUQ0hdIFJFQURNRS5oYXJkd2FyZS1h
Y3F1aXNpdGlvbiBbYW5kIDEgbW9yZSBtZXNzYWdlc10iKToKPiBhcyBtZW50aW9uZWQgZWFybGll
ciwgSSB0aGluayB3ZSBuZWVkIGEgbGVnYWwvYWRtaW4gaXRlbSBmb3IgaGFyZHdhcmUgYW5kIGRv
bmF0aW9ucy4gU2VlIHByb3Bvc2VkIGFkZGl0aW9uIGJlbG93LgouLi4KPiBMRUdBTAo+ID09PT09
CgpJIHdvdWxkIHByZWZlciBub3QgdG8gYmFrZSB0aGUgTGludXggRm91bmRhdGlvbiBhZGRyZXNz
IGludG8gdGhpcwpkb2N1bWVudCwgbm9yIHRvIGhhdmUgaXQgYmUgdGhlIHByaW1hcnkgcmVwb3Np
dG9yeSBmb3IgbGVnYWwgZGV0YWlscywKaWYgdGhhdCdzIE9LLgoKSG93IGFib3V0IHRoaXM6Cgog
IExFR0FMIC0gWEVOIFBST0pFQ1QKICA9PT09PT09PT09PT09PT09PT09CgogIFRoZSBYZW4gUHJv
amVjdCBUZXN0IExhYiBydW5zIHB1YmxpYyB0ZXN0cywgYW5kIHByb3ZpZGVzIGFjY2VzcyB0byBp
dHMKICBoYXJkd2FyZSB0byBYZW4gY29tbXVuaXR5IG1lbWJlcnMgc28gdGhhdCB0aGV5IGNhbiBk
ZWJ1ZyB0aGUgY29kZS4KICBBY2NvcmRpbmdseSB0aGVyZSBtdXN0IG5vdCBiZSBhbnkgcmVzdHJp
Y3Rpb25zIG9uIHB1YmxpY2F0aW9uIG9mCiAgaW5mb3JtYXRpb24gc3VjaCBhcyB0ZXN0IHJlc3Vs
dHMsIG5vciBhbnkgcmVzdHJpY3Rpb25zIG9uIGFjY2VzcyB0bwogIHRoZSBoYXJkd2FyZS4gIEll
LCB0aGUgWGVuIFByb2plY3QgaXMgbm90IGFibGUgdG8gYWdyZWUgdG8gYW55CiAgbm9uZGlzY2xv
c3VyZSBhZ3JlZW1lbnQgKE5EQSkuCgogIFRoZSBYZW4gUHJvamVjdCBUZXN0IExhYiBkb2VzIG5v
dCBhY2NlcHQgaGFyZHdhcmUgb24gbG9hbi4gIFdlCiAgcHVyY2hhc2UgaXQsIG9yLCBmb2xsb3dp
bmcgcHJpb3IgY29uc3VsdGF0aW9uIGFuZCBhcHByb3ZhbCwgY2FuIGFjY2VwdAogIGRvbmF0aW9u
cy4gIEZvciBkb25hdGlvbnMsIHRoZSBMaW51eCBGb3VuZGF0aW9uIHJlcXVpcmVzIGEgbGV0dGVy
CiAgY29uZmlybWluZyBzb21lIGxlZ2FsIGRldGFpbHMuICBUaGUgQ29tbXVuaXR5IE1hbmFnZXIg
d2lsbCBwcm92aWRlCiAgYSBsaXN0IG9mIHNwZWNpZmljIHJlcXVpcmVtZW50cyBmb3IgdGhhdCBg
ZG9uYXRpb24gZm9ybScgbGV0dGVyLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
