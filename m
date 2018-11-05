From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v5 1/2] memory_hotplug: Free pages as higher
 order
Date: Mon, 5 Nov 2018 13:44:00 -0800
Message-ID: <20181105134400.f6f52f4db0f8d6a21446476e__27950.3925623887$1541454169$gmane$org@linux-foundation.org>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
 <72215e75-6c7e-0aef-c06e-e3aba47cf806@suse.cz>
 <efb65160af41d0e18cb2dcb30c2fb86a@codeaurora.org>
 <20181010173334.GL5873@dhcp22.suse.cz>
 <a2d576a5fc82cdf54fc89409686e58f5@codeaurora.org>
 <20181011075503.GQ5873@dhcp22.suse.cz>
 <20181018191825.fcad6e28f32a3686f201acdf@linux-foundation.org>
 <20181019080755.GK18839@dhcp22.suse.cz>
 <c6289fada694462ed708174f9a1f3b6c@codeaurora.org>
 <beaa1acf7423da7ee0f9bbc4cee2d14a@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ujzh=nq=linux-foundation.org=akpm@srs-us1.protection.inumbo.net>)
 id 1gJmfD-0002Mo-IP
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 21:44:03 +0000
In-Reply-To: <beaa1acf7423da7ee0f9bbc4cee2d14a@codeaurora.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arun KS <arunks@codeaurora.org>
Cc: vatsa@codeaurora.org, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, getarunks@gmail.com, kys@microsoft.com, dan.j.williams@intel.com, sthemmin@microsoft.com, xen-devel@lists.xenproject.org, haiyangz@microsoft.com, yasu.isimatu@gmail.com, boris.ostrovsky@oracle.com, Vlastimil Babka <vbabka@suse.cz>, osalvador@suse.de, jgross@suse.com, aaron.lu@intel.com, malat@debian.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vinmenon@codeaurora.org, jrdr.linux@gmail.com, devel@linuxdriverproject.org, iamjoonsoo.kim@lge.com, mgorman@techsingularity.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAwNSBOb3YgMjAxOCAxNToxMjoyNyArMDUzMCBBcnVuIEtTIDxhcnVua3NAY29kZWF1
cm9yYS5vcmc+IHdyb3RlOgoKPiBPbiAyMDE4LTEwLTIyIDE2OjAzLCBBcnVuIEtTIHdyb3RlOgo+
ID4gT24gMjAxOC0xMC0xOSAxMzozNywgTWljaGFsIEhvY2tvIHdyb3RlOgo+ID4+IE9uIFRodSAx
OC0xMC0xOCAxOToxODoyNSwgQW5kcmV3IE1vcnRvbiB3cm90ZToKPiA+PiBbLi4uXQo+ID4+PiBT
byB0aGlzIHBhdGNoIG5lZWRzIG1vcmUgd29yaywgeWVzPwo+ID4+IAo+ID4+IFllcywgSSd2ZSB0
YWxrZWQgdG8gQXJ1biAoaGUgaXMgb2ZmbGluZSB1bnRpbCBuZXh0IHdlZWspIG9mZmxpc3QgYW5k
IAo+ID4+IGhlCj4gPj4gd2lsbCBwbGF5IHdpdGggdGhpcyBzb21lIG1vcmUuCj4gPiAKPiA+IENv
bnZlcnRlZCB0b3RhbGhpZ2hfcGFnZXMsIHRvdGFscmFtX3BhZ2VzIGFuZCB6b25lLT5tYW5hZ2Vk
X3BhZ2UgdG8KPiA+IGF0b21pYyBhbmQgdGVzdGVkIGhvdCBhZGQuIExhdGVuY3kgaXMgbm90IGVm
ZmVjdGVkIHdpdGggdGhpcyBjaGFuZ2UuCj4gPiBXaWxsIHNlbmQgb3V0IGEgc2VwYXJhdGUgcGF0
Y2ggb24gdG9wIG9mIHRoaXMgb25lLgo+IEhlbGxvIEFuZHJldy9NaWNoYWwsCj4gCj4gV2lsbCB0
aGlzIGJlIGdvaW5nIGluIHN1YnNlcXVlbnQgLXJjcz8KCkkgdGhvdWdodCB3ZXJlIGF3YWl0aW5n
IGEgbmV3IHZlcnNpb24/ICAiV2lsbCBzZW5kIG91dCBhIHNlcGFyYXRlIHBhdGNoCm9uIHRvcCBv
ZiB0aGlzIG9uZSI/CgpJIGRvIHRoaW5rIGEgcmVzZW5kIHdvdWxkIGJlIHVzZWZ1bCwgcGxlYXNl
LiAgRW5zdXJlIHRoZSBjaGFuZ2Vsb2cgaXMKdXBkYXRlZCB0byBjYXB0dXJlIHRoZSBhYm92ZSBp
bmZvIGFuZCBhbnkgb3RoZXIgd29ydGh5IGlzc3VlcyB3aGljaAphcm9zZSBkdXJpbmcgcmV2aWV3
LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
