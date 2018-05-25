From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH v2 00/12] get rid of GFP_ZONE_TABLE/BAD
Date: Fri, 25 May 2018 05:00:44 -0700
Message-ID: <20180525120044.GA4649__38619.6772139103$1527249594$gmane$org@bombadil.infradead.org>
References: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
 <20180522183728.GB20441@dhcp22.suse.cz>
 <20180524051919.GA9819@bombadil.infradead.org>
 <20180524122323.GH20441@dhcp22.suse.cz>
 <20180524151818.GA21245@bombadil.infradead.org>
 <20180524152943.GA11881@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ihac=im=infradead.org=willy@srs-us1.protection.inumbo.net>)
 id 1fMBOw-0008EQ-Cj
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 12:00:54 +0000
Content-Disposition: inline
In-Reply-To: <20180524152943.GA11881@dhcp22.suse.cz>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: kstewart@linuxfoundation.org, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, alexander.levin@verizon.com, linux-mm@kvack.org, iommu@lists.linux-foundation.org, linux-btrfs@vger.kernel.org, Huaisheng Ye <yehs2007@gmail.com>, chengnt@lenovo.com, xen-devel@lists.xenproject.org, akpm@linux-foundation.org, colyli@suse.de, mgorman@techsingularity.net, vbabka@suse.cz
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMjQsIDIwMTggYXQgMDU6Mjk6NDNQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdy
b3RlOgo+ID4gaWUgaWYgd2UgaGFkIG1vcmUsCj4gPiBjb3VsZCB3ZSBzb2x2ZSBvdXIgcGFpbiBi
eSBtYWtpbmcgdGhlbSBtb3JlIGdlbmVyaWM/Cj4gCj4gV2VsbCwgaWYgeW91IGhhdmUgbW9yZSB5
b3Ugd2lsbCBjb25zdW1lIG1vcmUgYml0cyBpbiB0aGUgc3RydWN0IHBhZ2VzLAo+IHJpZ2h0PwoK
Tm90IG5lY2Vzc2FyaWx5IC4uLiB0aGUgem9uZSBudW1iZXIgaXMgc3RvcmVkIGluIHRoZSBzdHJ1
Y3QgcGFnZQpjdXJyZW50bHksIHNvIGVpdGhlciB0d28gb3IgdGhyZWUgYml0cyBhcmUgdXNlZCBy
aWdodCBub3cuICBJbiBteQpwcm9wb3NhbCwgb25lIGNhbiBpbmZlciB0aGUgem9uZSBvZiBhIHBh
Z2UgZnJvbSBpdHMgUEZOLCBleGNlcHQgZm9yClpPTkVfTU9WQUJMRS4gIFNvIHdlIGNvdWxkIHRy
aW0gZG93biB0byBqdXN0IG9uZSBiaXQgcGVyIHN0cnVjdCBwYWdlCmZvciAzMi1iaXQgbWFjaGlu
ZXMgd2hpbGUgdXNpbmcgMyBiaXRzIG9uIDY0LWJpdCBtYWNoaW5lcywgd2hlcmUgdGhlcmUKaXMg
cGxlbnR5IG9mIHNwYWNlLgoKPiA+IGl0IG1vcmUtb3ItbGVzcyBzdWNrcyB0aGF0IHRoZSBkZXZp
Y2VzIHdpdGggMjgtYml0IERNQSBsaW1pdHMgYXJlIGZvcmNlZAo+ID4gdG8gYWxsb2NhdGUgZnJv
bSB0aGUgbG93IDE2TUIgd2hlbiB0aGV5J3JlIHBlcmZlY3RseSBjYXBhYmxlIG9mIHVzaW5nIHRo
ZQo+ID4gbG93IDI1Nk1CLgo+IAo+IERvIHdlIGFjdHVhbGx5IGNhcmUgYWxsIHRoYXQgbXVjaCBh
Ym91dCB0aG9zZT8gSWYgeWVzIHRoZW4gd2Ugc2hvdWxkCj4gcHJvYmFibHkgZm9sbG93IHRoZSBa
T05FX0RNQSAoeDg2KSBwYXRoIGFuZCB1c2UgYSBDTUEgcmVnaW9uIGZvciB0aGVtLgo+IEkgbWVh
biBtb3N0IGRldmljZXMgc2hvdWxkIGJlIGdvb2Qgd2l0aCB2ZXJ5IGxpbWl0ZWQgYWRkcmVzc2Fi
aWxpdHkgb3IKPiBiZWxvdyA0Rywgbm8/CgpTdXJlLiAgT25lIG90aGVyIHRoaW5nIEkgbWVhbnQg
dG8gbWVudGlvbiB3YXMgdGhlIG1lZGlhIGRldmljZXMKKFRWIGNhcHR1cmUgY2FyZHMgYW5kIHNv
IG9uKSB3aGljaCB3YW50IGEgdm1hbGxvY18zMigpIGFsbG9jYXRpb24uCk9uIDMyLWJpdCBtYWNo
aW5lcyByaWdodCBub3csIHdlIGFsbG9jYXRlIGZyb20gTE9XTUVNLCB3aGVuIHdlIHJlYWxseQpz
aG91bGQgYmUgYWxsb2NhdGluZyBmcm9tIHRoZSAxR0ItNEdCIHJlZ2lvbi4gIDMyLWJpdCBtYWNo
aW5lcyBnZW5lcmFsbHkKZG9uJ3QgaGF2ZSBhIFpPTkVfRE1BMzIgdG9kYXkuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
