From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [RFC PATCH 1/2] Add Designated Reviewer (R:) to
 MAINTAINERS file and add support for it in get_maintainer.pl
Date: Fri, 13 Apr 2018 17:35:01 +0000
Message-ID: <4C5ADA9B-7BFB-4F10-A857-A459EC4463C7@citrix.com>
References: <cover.1523635050.git.lars.kurth@citrix.com>
 <70d8b7669d8d2ab54fd68d9eef080d62593b75ed.1523635050.git.lars.kurth@citrix.com>
 <23248.58729.657638.99829@mariner.uk.xensource.com>
 <013D718B-8390-4F8B-8721-29D5A6B2FB31@citrix.com>
 <23248.59350.703025.371902@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j4gs=hc=citrix.com=prvs=634dd00d6=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1f72bJ-0001KR-BZ
 for xen-devel@lists.xenproject.org; Fri, 13 Apr 2018 17:35:05 +0000
In-Reply-To: <23248.59350.703025.371902@mariner.uk.xensource.com>
Content-Language: en-US
Content-ID: <CE93EC9516D7204ABE9F38B77681DA39@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCu+7v09uIDEzLzA0LzIwMTgsIDE4OjI0LCAiSWFuIEphY2tzb24iIDxpYW4uamFja3NvbkBj
aXRyaXguY29tPiB3cm90ZToNCg0KICAgIExhcnMgS3VydGggd3JpdGVzICgiUmU6IFtSRkMgUEFU
Q0ggMS8yXSBBZGQgRGVzaWduYXRlZCBSZXZpZXdlciAoUjopIHRvIE1BSU5UQUlORVJTIGZpbGUg
YW5kIGFkZCBzdXBwb3J0IGZvciBpdCBpbiBnZXRfbWFpbnRhaW5lci5wbCIpOg0KICAgID4gSSBk
b24ndCBrbm93IHdoZXRoZXIgaXQgaXMgbmVlZGVkLiBUaGUgc2FtZSBjb2RlIGJsb2NrIG9mIGNv
ZGUgaXMgaW4gTGludXggYW5kIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5n
aXQ7YT1ibG9iO2Y9c2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbDtoPTNmYjFhZDRiNjk0ZDY4ZDVm
OTBhZDY0MjQyMGQ0YjUwYjkzNGVkMmI7aGI9SEVBRCAgbGluZSAxMDgyIG9ud2FyZHMNCiAgICAN
CiAgICBMaW51eCdzIE1BSU5UQUlORVJTIHNheXMgdGhpczoNCiAgICANCiAgICAgICAgICAgIFA6
IFBlcnNvbiAob2Jzb2xldGUpDQogICAgDQogICAgVGhlIGNvZGUgc2VlbXMgdG8gYmUgZG9pbmcg
c29tZSBraW5kIG9mIGluZGlyZWN0aW9uLiAgSSBzdWdnZXN0IHdlDQogICAgZHJvcCBpdC4gIEF0
IHRoZSB2ZXJ5IGxlYXN0LCB3ZSBzaG91bGQgbm90IG1ha2UgYW55IG1vcmUgY29waWVzIG9mDQog
ICAgdGhpcyENCiAgICANCkkgc3VwcG9zZSBJIGNhbiB0YWtlIGJvdGggaW5zdGFuY2VzIG91dCwg
Z2l2ZW4gdGhhdCB3ZSBkb24ndCBzdXBwb3J0ICJQIiwgd2hlbiBJIHJlLXJvbGwgdGhlIHBhdGNo
IGFuZCBzZWUgd2hldGhlciBldmVyeXRoaW5nIHdvcmtzIGFzIGV4cGVjdGVkLg0KDQpMYXJzIA0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
