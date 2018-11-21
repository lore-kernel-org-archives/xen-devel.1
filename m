From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 6/6] amd/iommu: skip bridge devices when
 updating IOMMU page tables
Date: Wed, 21 Nov 2018 02:21:36 -0700
Message-ID: <5BF523A002000078001FE537@prv1-mh.provo.novell.com>
References: <20181120160153.45259-1-roger.pau@citrix.com>
 <20181120160153.45259-7-roger.pau@citrix.com>
 <5BF43A1902000078001FE31E@prv1-mh.provo.novell.com>
 <20181120232627.GA31051@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ffyj=oa=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gPOhY-0004kV-V6
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 09:21:40 +0000
In-Reply-To: <20181120232627.GA31051@amd.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjExLjE4IGF0IDAwOjI2LCA8QnJpYW4uV29vZHNAYW1kLmNvbT4gd3JvdGU6Cj4g
VGhlIG9yaWdpbmFsIGNvbW1pdCAwYWY0Mzg3NTdkNDU1ZjhlYjZiNWE2YWU5YTk5MGFlMjQ1ZjIz
MGZkCj4gCj4gVGhlIGNvbW1pdCB0aGF0IGFkZHMgaXNfaGFyZHdhcmVfZG9tYWluIChhbmQgcmVh
cnJhbmdlIHRoaW5ncykKPiA3YzI3NTU0OWY0NmM1YzQ2NjExNTkyZjcxMDdjMTM0NWU5M2VkNDU3
Cj4gCj4gVGhlIG9yZ2luYWwgY29tbWl0IHVzZWQgdGhlIGZ1bmN0aW9uIGxpa2UKPiBzZXR1cF9k
b20wX3BjaV9kZXZpY2VzKGQsIGFtZF9pb21tdV9zZXR1cF9kb20wX2RldmljZSk7Cj4gd2hpY2gg
d2FzIGJlY2F1c2UgSU9NTVUgbmVlZGVkIHRvIHNraXAgdGhlIGhvc3QgYnJpZGdlIGRldmljZXMg
b24gZG9tMC4KPiAKPiBTbyBJIGFzc3VtZSB5b3UgYWRkZWQgdGhlIGlzX2hhcmR3YXJlX2RvbWFp
biBiZWNhdXNlIGl0IG9ubHkgbmVlZGVkIHRvCj4gYmUgZG9uZSBvbiBkb20wLiAgSSdtIG5vdCBm
YW1pbGlhciB3aXRoIHRoZSBJT01NVS9QQ0kgaGlzdG9yeSB3cnQgdG8KPiB3aGF0IGl0IG1hcHBl
ZC9wYXNzZWQgdGhyb3VnaCBzby4KCldlbGwsIEkgYWRkZWQgaXQgcHJlc3VtYWJseSB0byByZXRh
aW4gb3JpZ2luYWwgc2VtYW50aWNzLiBJIHN0aWxsCnRoaW5rIHRoYXQgdGhlIGV4dHJhIGNoZWNr
IHdvdWxkIGJldHRlciBiZSBkcm9wcGVkIHRoZXJlLCBub3QKdGhlIGxlYXN0IHRvIGFsc28gY292
ZXIgdGhlIGNhc2Ugb2YgZGV2aWNlcyBldmVudHVhbGx5IGdldHRpbmcKYXNzaWduZWQgdG8gZG9t
X3hlbi4KCkxvb2tpbmcgYXQgdGhpcyBhbm90aGVyIHRpbWUgSSBmaW5kIHNvbWUgb3RoZXIgcXVl
c3Rpb25hYmxlCmFzcGVjdCB0aG91Z2ggKGJvdGggdG8gcHJlLWV4aXN0aW5nIGNvZGUgYW5kIHRv
IHRoZSBjaGFuZ2UKbWFkZSBoZXJlKTogImhvc3QgYnJpZGdlIiAhPSAiYnJpZGdlIi4gVGhlIHRp
dGxlIGhlcmUgYXMgbXVjaAphcyB0aGUgY29tbWVudCBuZXh0IHRvIHRoZSBvcmlnaW5hbCBwaWVj
ZSBvZiBjb2RlIGJvdGgKc3VnZ2VzdCB0aGUgd2lkZXIgZ2VuZXJhbCBjYXRlZ29yeSBpcyBtZWFu
dCwgYnV0IHRoZSBjb2RlCmNsb25lZCBjaGVja3MgZm9yIGhvc3QgYnJpZGdlcyBvbmx5LiBJbgph
bWRfaW9tbXVfYWRkX2RldmljZSgpIHRoZSBjaGVjayBpcyB1c2VkIHNvbGVseSB0byBlbWl0IGEK
bGVzcyBzY2FyeSBsb2cgbWVzc2FnZSwgYnV0IHRoZSBjaGFuZ2UgaGVyZSBnb2VzIGJleW9uZAp0
aGF0LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
