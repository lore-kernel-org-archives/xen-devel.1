From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [PATCH for-4.11 v4 1/1] Add new add_maintainers.pl
 script to optimise the workflow when using git format-patch with
 get_maintainer.pl
Date: Tue, 15 May 2018 15:54:28 +0000
Message-ID: <9020EF97-270F-4450-9263-BFF1685F97BE@citrix.com>
References: <cover.1526056304.git.lars.kurth@citrix.com>
 <f4fb11576b144aa6bdf243d678162a171b7a5ba9.1526056304.git.lars.kurth@citrix.com>
 <23290.65076.759978.448604@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qjaw=ic=citrix.com=prvs=666374a5e=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1fIcHa-0004rL-HK
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 15:54:34 +0000
In-Reply-To: <23290.65076.759978.448604@mariner.uk.xensource.com>
Content-Language: en-US
Content-ID: <2F5A70BBA6D1EA478D7700E5132FCE86@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCu+7v09uIDE1LzA1LzIwMTgsIDE2OjM1LCAiSWFuIEphY2tzb24iIDxpYW4uamFja3NvbkBj
aXRyaXguY29tPiB3cm90ZToNCg0KICAgIExhcnMgS3VydGggd3JpdGVzICgiW1BBVENIIGZvci00
LjExIHY0IDEvMV0gQWRkIG5ldyBhZGRfbWFpbnRhaW5lcnMucGwgc2NyaXB0IHRvIG9wdGltaXNl
IHRoZSB3b3JrZmxvdyB3aGVuIHVzaW5nIGdpdCBmb3JtYXQtcGF0Y2ggd2l0aCBnZXRfbWFpbnRh
aW5lci5wbCIpOg0KICAgID4gVGhlIHRvb2wgY292ZXJzIHN0ZXAgMiBvZiB0aGUgZm9sbG93aW5n
IHdvcmtmbG93DQogICAgDQogICAgVGhhbmtzLiAgU29ycnkgdG8gc3BvdCB0aGlzIG9ubHkgbm93
LCBidXQNCiAgICANCiAgICA+ICtzdWIgd3JpdGVmaWxlICgkJCkgew0KICAgID4gKyAgICBteSAo
JGNvbnRlbnQsICRmaWxlKSA9IEBfOw0KICAgID4gKyAgICBteSAkZmg7DQogICAgPiArICAgIG9w
ZW4oJGZoLCAiPiIsICRmaWxlKQ0KICAgID4gKyAgICAgICAgIG9yIGRpZSAiQ291bGQgbm90IG9w
ZW4gZmlsZSAnJGZpbGUnICQhIjsNCiAgICA+ICsgICAgcHJpbnQgJGZoICRjb250ZW50IG9yIGRp
ZSAkITsNCiAgICA+ICsgICAgY2xvc2UgJGZoIG9yIGRpZSAkITsNCiAgICA+ICt9DQogICAgDQog
ICAgdGhpcyB3aWxsIGxvc2UgZGF0YSBpZiB5b3VyIGRpc2sgaXMgZnVsbC4NCiAgICANCiAgICBZ
b3Ugd2FudDoNCiAgICANCiAgICAgIHN1YiB3cml0ZWZpbGUgKCQkKSB7DQogICAgICAgICAgbXkg
KCRjb250ZW50LCAkZmlsZSkgPSBAXzsNCiAgICAgICAgICBteSAkZmg7DQogICAgICAgICAgb3Bl
bigkZmgsICI+IiwgIiRmaWxlLnRtcCIpDQogICAgICAgICAgICAgICBvciBkaWUgIkNvdWxkIG5v
dCBvcGVuIGZpbGUgJyRmaWxlLnRtcCcgJCEiOw0KICAgICAgICAgIHByaW50ICRmaCAkY29udGVu
dCBvciBkaWUgJCE7DQogICAgICAgICAgY2xvc2UgJGZoIG9yIGRpZSAkITsNCiAgICAgICAgICBy
YW5lbSAiJGZpbGUudG1wIiwgJGZpbGUgb3IgZGllICJDb3VsZCBub3QgcmVuYW1lICckZmlsZScg
aW50byBwbGFjZSAkISI7DQogICAgICB9DQogICAgDQogICAgKE5COiB1bnRlc3RlZC4pDQogICAg
DQogICAgQXNpZGUgZnJvbSB0aGF0LA0KICAgIA0KICAgIEFja2VkLWJ5OiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4NCiAgICANCiAgICBEbyB5b3Ugd2FudCBtZSB0byBw
aWNrIHVwIG15IHN1Z2dlc3RlZCBjaGFuZ2UgYW5kIHRlc3QgaXQgPw0KICAgIA0KSWYgeW91IGNv
dWxkIGRvIHRoaXMsIHllcyBwbGVhc2UNCkxhcnMNCg0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
