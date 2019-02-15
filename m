From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [OSSTEST PATCH] README.hardware-acquisition [and 1
 more messages]
Date: Fri, 15 Feb 2019 16:04:16 +0000
Message-ID: <384B12BC-95E3-4907-9A63-F0BB4F3BEB1D@citrix.com>
References: <20181030161326.17879-1-ian.jackson@eu.citrix.com>
 <18bf9618-d950-8cfa-1746-e330f3ce0e66@arm.com>
 <alpine.DEB.2.10.1810301528180.22840@sstabellini-ThinkPad-X260>
 <23513.52378.653350.705575@mariner.uk.xensource.com>
 <23654.43252.57463.874932@mariner.uk.xensource.com>
 <E90F932F-B8DD-4D74-B69E-3B60982A6EFA@citrix.com>
 <23654.56686.144178.391815@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CcNQ=QW=citrix.com=prvs=942a2a65b=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1gufyn-0004bX-0v
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 16:04:45 +0000
In-Reply-To: <23654.56686.144178.391815@mariner.uk.xensource.com>
Content-Language: en-US
Content-ID: <43B7BA82CDD0B94CAC2B8897B674560C@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>, "infra@xenproject.org" <infra@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCu+7v09uIDE1LzAyLzIwMTksIDE1OjQwLCAiSWFuIEphY2tzb24iIDxpYW4uamFja3NvbkBj
aXRyaXguY29tPiB3cm90ZToNCg0KICAgIExhcnMgS3VydGggd3JpdGVzICgiUmU6IFtPU1NURVNU
IFBBVENIXSBSRUFETUUuaGFyZHdhcmUtYWNxdWlzaXRpb24gW2FuZCAxIG1vcmUgbWVzc2FnZXNd
Iik6DQogICAgPiBhcyBtZW50aW9uZWQgZWFybGllciwgSSB0aGluayB3ZSBuZWVkIGEgbGVnYWwv
YWRtaW4gaXRlbSBmb3IgaGFyZHdhcmUgYW5kIGRvbmF0aW9ucy4gU2VlIHByb3Bvc2VkIGFkZGl0
aW9uIGJlbG93Lg0KICAgIC4uLg0KICAgID4gTEVHQUwNCiAgICA+ID09PT09DQogICAgDQogICAg
SSB3b3VsZCBwcmVmZXIgbm90IHRvIGJha2UgdGhlIExpbnV4IEZvdW5kYXRpb24gYWRkcmVzcyBp
bnRvIHRoaXMNCiAgICBkb2N1bWVudCwgbm9yIHRvIGhhdmUgaXQgYmUgdGhlIHByaW1hcnkgcmVw
b3NpdG9yeSBmb3IgbGVnYWwgZGV0YWlscywNCiAgICBpZiB0aGF0J3MgT0suDQogICAgDQogICAg
SG93IGFib3V0IHRoaXM6DQogICAgDQogICAgICBMRUdBTCAtIFhFTiBQUk9KRUNUDQogICAgICA9
PT09PT09PT09PT09PT09PT09DQogICAgDQogICAgICBUaGUgWGVuIFByb2plY3QgVGVzdCBMYWIg
cnVucyBwdWJsaWMgdGVzdHMsIGFuZCBwcm92aWRlcyBhY2Nlc3MgdG8gaXRzDQogICAgICBoYXJk
d2FyZSB0byBYZW4gY29tbXVuaXR5IG1lbWJlcnMgc28gdGhhdCB0aGV5IGNhbiBkZWJ1ZyB0aGUg
Y29kZS4NCiAgICAgIEFjY29yZGluZ2x5IHRoZXJlIG11c3Qgbm90IGJlIGFueSByZXN0cmljdGlv
bnMgb24gcHVibGljYXRpb24gb2YNCiAgICAgIGluZm9ybWF0aW9uIHN1Y2ggYXMgdGVzdCByZXN1
bHRzLCBub3IgYW55IHJlc3RyaWN0aW9ucyBvbiBhY2Nlc3MgdG8NCiAgICAgIHRoZSBoYXJkd2Fy
ZS4gIEllLCB0aGUgWGVuIFByb2plY3QgaXMgbm90IGFibGUgdG8gYWdyZWUgdG8gYW55DQogICAg
ICBub25kaXNjbG9zdXJlIGFncmVlbWVudCAoTkRBKS4NCiAgICANCiAgICAgIFRoZSBYZW4gUHJv
amVjdCBUZXN0IExhYiBkb2VzIG5vdCBhY2NlcHQgaGFyZHdhcmUgb24gbG9hbi4gIFdlDQogICAg
ICBwdXJjaGFzZSBpdCwgb3IsIGZvbGxvd2luZyBwcmlvciBjb25zdWx0YXRpb24gYW5kIGFwcHJv
dmFsLCBjYW4gYWNjZXB0DQogICAgICBkb25hdGlvbnMuICBGb3IgZG9uYXRpb25zLCB0aGUgTGlu
dXggRm91bmRhdGlvbiByZXF1aXJlcyBhIGxldHRlcg0KICAgICAgY29uZmlybWluZyBzb21lIGxl
Z2FsIGRldGFpbHMuICBUaGUgQ29tbXVuaXR5IE1hbmFnZXIgd2lsbCBwcm92aWRlDQogICAgICBh
IGxpc3Qgb2Ygc3BlY2lmaWMgcmVxdWlyZW1lbnRzIGZvciB0aGF0IGBkb25hdGlvbiBmb3JtJyBs
ZXR0ZXIuDQogICAgDQpUaGlzIGlzIGZpbmUgYnkgbWUNCkxhcnMgICAgDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
