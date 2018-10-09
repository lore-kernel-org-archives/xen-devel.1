From: Arun KS <arunks@codeaurora.org>
Subject: Re: [PATCH v5 1/2] memory_hotplug: Free pages as higher
 order
Date: Tue, 09 Oct 2018 15:24:13 +0530
Message-ID: <9b56e156b911e943eba3a1daa0a1cb31__20800.9845264771$1539078775$gmane$org@codeaurora.org>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
 <20181009092938.GH8528@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=llak=mv=codeaurora.org=arunks@srs-us1.protection.inumbo.net>)
 id 1g9oiX-0007ao-AN
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 09:54:17 +0000
In-Reply-To: <20181009092938.GH8528@dhcp22.suse.cz>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: vatsa@codeaurora.org, linux-mm@kvack.org, getarunks@gmail.com, kys@microsoft.com, boris.ostrovsky@oracle.com, sthemmin@microsoft.com, xen-devel@lists.xenproject.org, haiyangz@microsoft.com, yasu.isimatu@gmail.com, dan.j.williams@intel.com, akpm@linux-foundation.org, vbabka@suse.cz, osalvador@suse.de, jgross@suse.com, aaron.lu@intel.com, malat@debian.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vinmenon@codeaurora.org, jrdr.linux@gmail.com, devel@linuxdriverproject.org, iamjoonsoo.kim@lge.com, mgorman@techsingularity.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC0xMC0wOSAxNDo1OSwgTWljaGFsIEhvY2tvIHdyb3RlOgo+IE9uIEZyaSAwNS0xMC0x
OCAxMzo0MDowNSwgQXJ1biBLUyB3cm90ZToKPj4gV2hlbiBmcmVlIHBhZ2VzIGFyZSBkb25lIHdp
dGggaGlnaGVyIG9yZGVyLCB0aW1lIHNwZW5kIG9uCj4+IGNvYWxlc2NpbmcgcGFnZXMgYnkgYnVk
ZHkgYWxsb2NhdG9yIGNhbiBiZSByZWR1Y2VkLiBXaXRoCj4+IHNlY3Rpb24gc2l6ZSBvZiAyNTZN
QiwgaG90IGFkZCBsYXRlbmN5IG9mIGEgc2luZ2xlIHNlY3Rpb24KPj4gc2hvd3MgaW1wcm92ZW1l
bnQgZnJvbSA1MC02MCBtcyB0byBsZXNzIHRoYW4gMSBtcywgaGVuY2UKPj4gaW1wcm92aW5nIHRo
ZSBob3QgYWRkIGxhdGVuY3kgYnkgNjAlLiBNb2RpZnkgZXh0ZXJuYWwKPj4gcHJvdmlkZXJzIG9m
IG9ubGluZSBjYWxsYmFjayB0byBhbGlnbiB3aXRoIHRoZSBjaGFuZ2UuCj4gCj4gQWNrZWQtYnk6
IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgo+IAo+IFRoYW5rcyBmb3IgeW91ciBwYXRp
ZW5jZSB3aXRoIGFsbCB0aGUgcmVzdWJtaXNzaW9uLgoKSGVsbG8gTWljaGFsLAoKSSBnb3QgdGhl
IGJlbG93IGVtYWlsIGZldyBkYXlzIGJhY2suIERvIEkgc3RpbGwgbmVlZCB0byByZXN1Ym1pdCB0
aGUgCnBhdGNoPyBvciBpcyBpdCBhbHJlYWR5IG9uIHRoZSB3YXkgdG8gbWVyZ2U/CgpSZWdhcmRz
LApBcnVuCgpUaGUgcGF0Y2ggdGl0bGVkCiAgICAgIFN1YmplY3Q6IG1tL3BhZ2VfYWxsb2MuYzog
bWVtb3J5IGhvdHBsdWc6IGZyZWUgcGFnZXMgYXMgaGlnaGVyIApvcmRlcgpoYXMgYmVlbiBhZGRl
ZCB0byB0aGUgLW1tIHRyZWUuICBJdHMgZmlsZW5hbWUgaXMKICAgICAgbWVtb3J5X2hvdHBsdWct
ZnJlZS1wYWdlcy1hcy1oaWdoZXItb3JkZXIucGF0Y2gKClRoaXMgcGF0Y2ggc2hvdWxkIHNvb24g
YXBwZWFyIGF0CiAgICAgCmh0dHA6Ly9vemxhYnMub3JnL35ha3BtL21tb3RzL2Jyb2tlbi1vdXQv
bWVtb3J5X2hvdHBsdWctZnJlZS1wYWdlcy1hcy1oaWdoZXItb3JkZXIucGF0Y2gKYW5kIGxhdGVy
IGF0CiAgICAgCmh0dHA6Ly9vemxhYnMub3JnL35ha3BtL21tb3RtL2Jyb2tlbi1vdXQvbWVtb3J5
X2hvdHBsdWctZnJlZS1wYWdlcy1hcy1oaWdoZXItb3JkZXIucGF0Y2gKCkJlZm9yZSB5b3UganVz
dCBnbyBhbmQgaGl0ICJyZXBseSIsIHBsZWFzZToKICAgIGEpIENvbnNpZGVyIHdobyBlbHNlIHNo
b3VsZCBiZSBjYydlZAogICAgYikgUHJlZmVyIHRvIGNjIGEgc3VpdGFibGUgbWFpbGluZyBsaXN0
IGFzIHdlbGwKICAgIGMpIElkZWFsbHk6IGZpbmQgdGhlIG9yaWdpbmFsIHBhdGNoIG9uIHRoZSBt
YWlsaW5nIGxpc3QgYW5kIGRvIGEKICAgICAgIHJlcGx5LXRvLWFsbCB0byB0aGF0LCBhZGRpbmcg
c3VpdGFibGUgYWRkaXRpb25hbCBjYydzCgoqKiogUmVtZW1iZXIgdG8gdXNlIERvY3VtZW50YXRp
b24vcHJvY2Vzcy9zdWJtaXQtY2hlY2tsaXN0LnJzdCB3aGVuIAp0ZXN0aW5nIHlvdXIgY29kZSAq
KioKClRoZSAtbW0gdHJlZSBpcyBpbmNsdWRlZCBpbnRvIGxpbnV4LW5leHQgYW5kIGlzIHVwZGF0
ZWQKdGhlcmUgZXZlcnkgMy00IHdvcmtpbmcgZGF5cwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
